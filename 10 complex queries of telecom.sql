--  1. Find customers using more than one active plan (multi-subscription customers)

SELECT 
    c.customer_id,
    c.full_name,
    COUNT(s.subscription_id) AS active_plans
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
WHERE s.status = 'Active'
GROUP BY c.customer_id
HAVING active_plans > 1;

-- 2. Monthly revenue breakdown with total paid vs unpaid amounts

SELECT 
    DATE_FORMAT(b.bill_date, '%Y-%m') AS billing_month,
    SUM(CASE WHEN b.status = 'Paid' THEN b.total_amount ELSE 0 END) AS total_paid,
    SUM(CASE WHEN b.status = 'Unpaid' OR b.status = 'Overdue' THEN b.total_amount ELSE 0 END) AS outstanding_amount
FROM Bills b
GROUP BY billing_month
ORDER BY billing_month DESC;

-- 3. Top 5 data users in the past month
SELECT 
    c.full_name,
    ROUND(SUM(ds.data_used_mb) / 1024, 2) AS total_data_gb
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Data_Sessions ds ON s.subscription_id = ds.subscription_id
WHERE ds.start_time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY c.customer_id
ORDER BY total_data_gb DESC
LIMIT 5;

-- 4. Detect customers with overdue bills and no payment made 0

SELECT 
    c.full_name,
    b.bill_id,
    b.total_amount,
    b.due_date
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Bills b ON s.subscription_id = b.subscription_id
LEFT JOIN Payments p ON b.bill_id = p.bill_id
WHERE b.status = 'Overdue'
  AND p.payment_id IS NULL;

-- 5. Total SMS sent vs received by customers this month

SELECT 
    c.full_name,
    SUM(CASE WHEN sr.direction = 'Sent' THEN 1 ELSE 0 END) AS sms_sent,
    SUM(CASE WHEN sr.direction = 'Received' THEN 1 ELSE 0 END) AS sms_received
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN SMS_Records sr ON s.subscription_id = sr.subscription_id
WHERE MONTH(sr.sms_time) = MONTH(CURDATE())
  AND YEAR(sr.sms_time) = YEAR(CURDATE())
GROUP BY c.customer_id;

-- 6. List of support tickets still unresolved with time elapsed

SELECT 
    t.ticket_id,
    c.full_name,
    t.issue_type,
    t.status,
    TIMESTAMPDIFF(HOUR, t.created_at, NOW()) AS hours_open
FROM Support_Tickets t
JOIN Customers c ON t.customer_id = c.customer_id
WHERE t.status IN ('Open', 'In Progress');

-- 7 Promotions applied by customers and their plan names

SELECT 
    c.full_name,
    pr.promotion_name,
    sp.plan_name,
    cp.assigned_date
FROM Customer_Promotions cp
JOIN Customers c ON cp.customer_id = c.customer_id
JOIN Promotions pr ON cp.promotion_id = pr.promotion_id
JOIN Promotion_Plans pp ON pr.promotion_id = pp.promotion_id
JOIN Service_Plans sp ON pp.plan_id = sp.plan_id;

 -- 8. Network tower coverage per region
 
 SELECT 
    sa.region,
    sa.city,
    COUNT(DISTINCT tc.tower_id) AS tower_count
FROM Service_Areas sa
JOIN Tower_Coverage tc ON sa.area_id = tc.area_id
GROUP BY sa.region, sa.city
ORDER BY tower_count DESC;

-- 9. Customers with highest call durations this month (top 5)


SELECT 
    c.full_name,
    ROUND(SUM(cr.duration_seconds)/60, 2) AS total_minutes
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Call_Records cr ON s.subscription_id = cr.subscription_id
WHERE MONTH(cr.call_time) = MONTH(CURDATE())
  AND YEAR(cr.call_time) = YEAR(CURDATE())
GROUP BY c.customer_id
ORDER BY total_minutes DESC
LIMIT 5;


-- 10. Customers on promotions who still have unpaid bills

SELECT 
    DISTINCT c.full_name,
    pr.promotion_name,
    b.bill_id,
    b.total_amount,
    b.status
FROM Customers c
JOIN Customer_Promotions cp ON c.customer_id = cp.customer_id
JOIN Promotions pr ON cp.promotion_id = pr.promotion_id
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Bills b ON s.subscription_id = b.subscription_id
WHERE b.status IN ('Unpaid', 'Overdue');
