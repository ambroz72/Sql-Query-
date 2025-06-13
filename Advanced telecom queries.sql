-- Customers with Multiple Active or Historical Plans
SELECT 
    c.customer_id,
    c.full_name,
    COUNT(s.subscription_id) AS total_plans
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(s.subscription_id) > 1;

-- Monthly Revenue Breakdown
SELECT 
    DATE_FORMAT(b.bill_date, '%Y-%m') AS billing_month,
    SUM(CASE WHEN b.status = 'Paid' THEN b.total_amount ELSE 0 END) AS total_paid,
    SUM(CASE WHEN b.status IN ('Unpaid', 'Overdue') THEN b.total_amount ELSE 0 END) AS total_outstanding,
    COUNT(*) AS total_bills
FROM Bills b
GROUP BY billing_month
ORDER BY billing_month DESC;


-- top data users
SELECT 
    c.customer_id,
    c.full_name,
    ROUND(SUM(ds.data_used_mb) / 1024, 2) AS total_data_gb
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Data_Sessions ds ON s.subscription_id = ds.subscription_id
WHERE ds.start_time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY c.customer_id, c.full_name
ORDER BY total_data_gb DESC
LIMIT 5;
 
 -- overdue 
  SELECT 
    c.customer_id,
    c.full_name,
    b.bill_id,
    b.total_amount,
    b.due_date,
    b.status
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Bills b ON s.subscription_id = b.subscription_id
LEFT JOIN Payments p ON b.bill_id = p.bill_id
WHERE b.status = 'Overdue'
  AND p.payment_id IS NULL;

-- customer with pormotion and unpaid bills 

SELECT 
    DISTINCT c.customer_id,
    c.full_name,
    pr.promotion_name,
    b.bill_id,
    b.total_amount,
    b.due_date,
    b.status
FROM Customers c
JOIN Customer_Promotions cp ON c.customer_id = cp.customer_id
JOIN Promotions pr ON cp.promotion_id = pr.promotion_id
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Bills b ON s.subscription_id = b.subscription_id
LEFT JOIN Payments p ON b.bill_id = p.bill_id
WHERE b.status IN ('Unpaid', 'Overdue')
  AND p.payment_id IS NULL;
  
-- Monthly Bill + Usage Analysis 0
  SELECT 
    c.customer_id,
    c.full_name,
    sp.plan_name,
    DATE_FORMAT(b.bill_date, '%Y-%m') AS billing_month,
    
    -- Billing
    MAX(b.total_amount) AS billed_amount,
    COALESCE(SUM(p.amount_paid), 0) AS total_paid,
    b.status AS bill_status,
    
    -- Usage
    ROUND(SUM(DISTINCT cr.duration_seconds) / 60, 2) AS total_call_minutes,
    COUNT(DISTINCT sr.sms_id) AS total_sms,
    ROUND(SUM(DISTINCT ds.data_used_mb) / 1024, 2) AS total_data_gb;



-- Promotions and mapping
SELECT 
    pr.promotion_id,
    pr.promotion_name,
    sp.plan_id,
    sp.plan_name,
    pt.type_name AS plan_type,
    pr.start_date,
    pr.end_date
FROM Promotions pr
JOIN Promotion_Plans pp ON pr.promotion_id = pp.promotion_id
JOIN Service_Plans sp ON pp.plan_id = sp.plan_id
JOIN Plan_Types pt ON sp.plan_type_id = pt.plan_type_id
ORDER BY pr.promotion_name, sp.plan_name;

-- tower in region
SELECT 
    sa.region,
    sa.city,
    COUNT(DISTINCT tc.tower_id) AS total_towers
FROM Service_Areas sa
JOIN Tower_Coverage tc ON sa.area_id = tc.area_id
JOIN Cell_Towers ct ON tc.tower_id = ct.tower_id
GROUP BY sa.region, sa.city
ORDER BY total_towers DESC;


--- top call users

SELECT 
    c.customer_id,
    c.full_name,
    ROUND(SUM(cr.duration_seconds) / 60, 2) AS total_call_minutes
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Call_Records cr ON s.subscription_id = cr.subscription_id
WHERE MONTH(cr.call_time) = MONTH(CURDATE()) 
  AND YEAR(cr.call_time) = YEAR(CURDATE())
GROUP BY c.customer_id, c.full_name
ORDER BY total_call_minutes DESC
LIMIT 5;

-- Tower Coverage by Region
SELECT 
    sa.region,
    sa.city,
    COUNT(DISTINCT tc.tower_id) AS total_towers
FROM Service_Areas sa
JOIN Tower_Coverage tc ON sa.area_id = tc.area_id
JOIN Cell_Towers ct ON tc.tower_id = ct.tower_id
GROUP BY sa.region, sa.city
ORDER BY total_towers DESC;

