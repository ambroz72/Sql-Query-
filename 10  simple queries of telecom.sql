-- 1. Retrieve Customer Information
--  Query 1: Get full profile of all active customers with their current plan name

SELECT 
    c.customer_id,
    c.full_name,
    c.email,
    sp.plan_name,
    s.status,
    s.start_date,
    s.end_date
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Service_Plans sp ON s.plan_id = sp.plan_id
WHERE s.status = 'Active';

-- 2. Manage Service Plans
--  Query 2: List all available (active) service plans with their type and monthly fee

SELECT 
    sp.plan_id,
    sp.plan_name,
    pt.type_name AS plan_type,
    sp.monthly_fee,
    sp.call_minutes,
    sp.sms_limit,
    sp.data_limit_gb
FROM Service_Plans sp
JOIN Plan_Types pt ON sp.plan_type_id = pt.plan_type_id
WHERE sp.is_active = TRUE;

-- Query 3: Find customers subscribed to a specific plan (e.g., 'Unlimited Everything')

SELECT 
    c.full_name,
    c.email,
    sp.plan_name,
    s.start_date
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Service_Plans sp ON s.plan_id = sp.plan_id
WHERE sp.plan_name = 'Unlimited Everything';

-- 3. Analyze Usage History
-- Query 4: Get total call minutes used by each customer this month

SELECT 
    c.full_name,
    SUM(cr.duration_seconds) / 60 AS total_minutes
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Call_Records cr ON s.subscription_id = cr.subscription_id
WHERE MONTH(cr.call_time) = MONTH(CURDATE()) AND YEAR(cr.call_time) = YEAR(CURDATE())
GROUP BY c.customer_id;

-- Query 5: Identify customers with highest data usage (top 5)

SELECT 
    c.full_name,
    ROUND(SUM(ds.data_used_mb)/1024, 2) AS total_data_gb
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Data_Sessions ds ON s.subscription_id = ds.subscription_id
GROUP BY c.customer_id
ORDER BY total_data_gb DESC
LIMIT 5;

-- 4. Access Billing Details
-- Query 6: List unpaid or overdue bills with customer and due date

SELECT 
    c.full_name,
    b.bill_id,
    b.total_amount,
    b.due_date,
    b.status
FROM Bills b
JOIN Subscriptions s ON b.subscription_id = s.subscription_id
JOIN Customers c ON s.customer_id = c.customer_id
WHERE b.status IN ('Unpaid', 'Overdue')
ORDER BY b.due_date ASC;

-- Query 7: Show all payments made in the last 30 days, with method and amount

SELECT 
    p.payment_id,
    c.full_name,
    p.payment_date,
    p.amount_paid,
    p.payment_method
FROM Payments p
JOIN Bills b ON p.bill_id = b.bill_id
JOIN Subscriptions s ON b.subscription_id = s.subscription_id
JOIN Customers c ON s.customer_id = c.customer_id
WHERE p.payment_date >= CURDATE() - INTERVAL 30 DAY;

-- 5. Complex Query: Billing & Usage Combined
--  Query 8: Get bill, payment, and data usage for each subscription in current month


SELECT 
    c.full_name,
    s.subscription_id,
    MAX(b.total_amount) AS billed_amount,
    IFNULL(SUM(p.amount_paid), 0) AS paid_amount,
    ROUND(SUM(ds.data_used_mb)/1024, 2) AS data_used_gb
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN Bills b ON s.subscription_id = b.subscription_id
LEFT JOIN Payments p ON b.bill_id = p.bill_id
LEFT JOIN Data_Sessions ds ON s.subscription_id = ds.subscription_id
WHERE MONTH(b.bill_date) = MONTH(CURDATE())
  AND YEAR(b.bill_date) = YEAR(CURDATE())
GROUP BY c.full_name, s.subscription_id;

-- 6. (Optional) Network Performance Metrics
--  Query 9: Show how many service areas each tower is currently covering
SELECT 
    ct.tower_name,
    COUNT(tc.area_id) AS areas_covered
FROM Cell_Towers ct
JOIN Tower_Coverage tc ON ct.tower_id = tc.tower_id
GROUP BY ct.tower_id;

-- Query 10: List inactive towers and the areas they no longer serve

SELECT 
    ct.tower_name,
    sa.area_name,
    sa.city
FROM Cell_Towers ct
JOIN Tower_Coverage tc ON ct.tower_id = tc.tower_id
JOIN Service_Areas sa ON tc.area_id = sa.area_id
WHERE ct.status = 'Inactive';


