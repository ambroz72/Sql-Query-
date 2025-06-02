-- Get all customer details
SELECT * FROM Customer;
-- List all service plans with full features
SELECT 
    PlanID,
    PlanName,
    MonthlyFee,
    IncludedCalls,
    IncludedDataMB,
    IncludedSMS,
    PlanDescription
FROM serviceplan;

-- Retrieve full customer information
SELECT 
    CustomerID,
    FullName,
    Email,
    PhoneNumber,
    Address,
    DateOfBirth,
    Gender
FROM Customer;

-- Show all service plans and their features
SELECT 
    PlanID,
    PlanName,
    MonthlyFee,
    IncludedCalls,
    IncludedSMS,
    IncludedDataMB,
    PlanDescription
FROM ServicePlan;


-- Total call time (in minutes) for each customer
SELECT 
    c.CustomerID,
    c.FullName,
    SUM(cu.DurationSeconds) / 60 AS TotalCallMinutes
FROM CallUsage cu
JOIN Subscription s ON cu.SubscriptionID = s.SubscriptionID
JOIN Customer c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FullName;


-- Total data usage per customer
SELECT 
    c.CustomerID,
    c.FullName,
    SUM(du.DataUsedMB) AS TotalDataMB
FROM DataUsage du
JOIN Subscription s ON du.SubscriptionID = s.SubscriptionID
JOIN Customer c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FullName;


-- Show billing records with customer details
SELECT 
    b.BillID,
    c.FullName,
    b.BillingMonth,
    b.TotalAmount,
    b.Status,
    b.DateIssued
FROM Bill b
JOIN Subscription s ON b.SubscriptionID = s.SubscriptionID
JOIN Customer c ON s.CustomerID = c.CustomerID
ORDER BY b.DateIssued DESC;

-- Find Top 5 Customers by Total Amount Billed (VIP Detection)

SELECT 
    c.CustomerID,
    c.FullName,
    SUM(b.TotalAmount) AS TotalSpent
FROM Bill b
JOIN Subscription s ON b.SubscriptionID = s.SubscriptionID
JOIN Customer c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FullName
ORDER BY TotalSpent DESC
LIMIT 5;

-- Identify Customers with Unpaid Bills
SELECT 
    c.CustomerID,
    c.FullName,
    b.TotalAmount,
    b.Status,
    b.BillingMonth
FROM Bill b
JOIN Subscription s ON b.SubscriptionID = s.SubscriptionID
JOIN Customer c ON s.CustomerID = c.CustomerID
WHERE b.Status = 'Unpaid';

-- Count how many times each plan is subscribed to
SELECT 
    sp.PlanName,
    COUNT(s.SubscriptionID) AS SubscriptionCount
FROM ServicePlan sp
JOIN Subscription s ON sp.PlanID = s.PlanID
GROUP BY sp.PlanName
ORDER BY SubscriptionCount DESC;

-- Customers with no data, call, or SMS usage in the last 30 days
SELECT DISTINCT c.CustomerID, c.FullName
FROM Customer c
JOIN Subscription s ON c.CustomerID = s.CustomerID
WHERE s.SubscriptionID NOT IN (
    SELECT SubscriptionID FROM CallUsage WHERE CallDate >= CURDATE() - INTERVAL 30 DAY
    UNION
    SELECT SubscriptionID FROM DataUsage WHERE SessionStart >= CURDATE() - INTERVAL 30 DAY
    UNION
    SELECT SubscriptionID FROM SMSUsage WHERE SMSDate >= CURDATE() - INTERVAL 30 DAY
);


