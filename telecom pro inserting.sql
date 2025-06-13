INSERT INTO Customers (full_name, email, phone_number, address, date_of_birth, registration_date) VALUES
('Alice Thompson', 'alice.thompson@example.com', '056256678656', '1 Cherry Tree Lane, London', '1986-02-14', '2024-04-01'),
('Brian Walker', 'brian.walker@example.com', '0788567869', '23 Queensway, Bristol', '1990-06-30', '2023-12-15'),
('Charlotte Patel', 'charlotte.patel@example.com', '456455473457', '5 High Street, Oxford', '1993-11-08', '2024-01-22'),
('David Kim', 'david.kim@example.com', '5457467357', '88 Elm Avenue, Leeds', '1982-04-25', '2023-08-05'),
('Emily Zhang', 'emily.zhang@example.com', '45645747777', '42 Bridge Road, Cambridge', '1996-07-19', '2024-05-10'),
('Farah Ahmed', 'farah.ahmed@example.com', '45768456845', '9 Park Lane, Manchester', '1989-10-11', '2023-11-01'),
('George Hill', 'george.hill@example.com', '5898797899', '14 Market Street, Liverpool', '1978-03-07', '2024-03-19'),
('Hannah Green', 'hannah.green@example.com', '9877876544', '30 Victoria Road, Glasgow', '1991-12-22', '2023-09-14'),
('Ibrahim Ali', 'ibrahim.ali@example.com', '9657666544', '77 Baker Street, Sheffield', '1984-08-17', '2024-02-03'),
('Julia Roberts', 'julia.roberts@example.com', '07645677687', '16 Rose Crescent, Edinburgh', '1997-05-29', '2024-06-01');

INSERT INTO Employees (full_name, email, role, hire_date) VALUES
('John Davies', 'jdavies@telecom.co.uk', 'Technical Support', '2021-09-01'),
('Olivia Brown', 'olivia.brown@telecom.co.uk', 'Billing Specialist', '2020-03-15'),
('Mohammed Ali', 'm.ali@telecom.co.uk', 'Network Engineer', '2019-07-12'),
('Emma Johnson', 'emma.johnson@telecom.co.uk', 'Customer Service Rep', '2022-02-25'),
('David Lee', 'david.lee@telecom.co.uk', 'Support Manager', '2023-01-08'),
('Sophie Evans', 'sophie.evans@telecom.co.uk', 'HR Specialist', '2020-11-18'),
('Lucas Green', 'lucas.green@telecom.co.uk', 'Field Technician', '2021-05-03'),
('Ava Martin', 'ava.martin@telecom.co.uk', 'Product Analyst', '2022-07-21'),
('Noah Clarke', 'noah.clarke@telecom.co.uk', 'IT Administrator', '2023-03-30'),
('Isabella Moore', 'isabella.moore@telecom.co.uk', 'Service Coordinator', '2024-01-10');

INSERT INTO Plan_Types (type_name, description) VALUES
('Prepaid', 'Pay-as-you-go mobile services with flexible top-up options'),
('Postpaid', 'Monthly billed plans with fixed usage quotas and overage charges'),
('Data Only', 'SIM-only plans offering mobile internet without calls or SMS'),
('Unlimited', 'Plans with unlimited calls, texts, and data'),
('Family', 'Shared plans for multiple family members under one account'),
('Corporate', 'Business-oriented plans with bulk discounts and management tools'),
('Student', 'Discounted plans with data-heavy options for students'),
('Senior', 'Simplified and affordable plans for senior citizens'),
('Roaming', 'Special plans for frequent international travelers'),
('IoT/M2M', 'Machine-to-machine or Internet of Things plans for smart devices');

INSERT INTO Service_Plans (plan_name, plan_type_id, monthly_fee, call_minutes, sms_limit, data_limit_gb, is_active) VALUES
('Smart Prepaid Lite', 1, 9.99, 100, 100, 1.0, TRUE),
('Smart Postpaid Max', 2, 29.99, 1000, 1000, 10.0, TRUE),
('Data Explorer 10GB', 3, 14.99, 0, 0, 10.0, TRUE),
('Unlimited Everything', 4, 49.99, 99999, 99999, 999.0, TRUE),
('Family Share 20GB', 5, 39.99, 2000, 2000, 20.0, TRUE),
('Business Connect Pro', 6, 59.99, 3000, 3000, 30.0, TRUE),
('Student Stream Pack', 7, 12.99, 300, 500, 5.0, TRUE),
('Senior Essentials', 8, 7.99, 200, 100, 2.0, TRUE),
('Roaming Global Flex', 9, 24.99, 500, 300, 5.0, TRUE),
('IoT Device Link', 10, 5.99, 0, 0, 0.5, TRUE);

INSERT INTO Promotions (promotion_name, start_date, end_date, description) VALUES
('Spring Saver 2025', '2025-03-01', '2025-05-31', 'Get 25% off on all prepaid plans during spring.'),
('Data Boost April', '2025-04-01', '2025-04-30', 'Enjoy double data on selected data-only plans.'),
('Student Welcome Pack', '2025-01-10', '2025-12-31', 'New student users get 3 months at 50% off.'),
('Family Bonus Bundle', '2025-02-15', '2025-06-30', 'Add 2 family members and receive a £10 monthly credit.'),
('Business Early Bird', '2025-03-01', '2025-06-01', 'Business plans receive free device setup this quarter.'),
('Senior Connect Discount', '2025-01-01', '2025-12-31', 'Seniors aged 60+ get 15% off all voice plans.'),
('Unlimited Summer Deal', '2025-06-01', '2025-08-31', 'Unlimited plans at a reduced price for summer.'),
('Roaming Free Trial', '2025-05-01', '2025-07-31', 'Free roaming on selected plans for first-time users.'),
('IoT Launch Offer', '2025-04-15', '2025-10-15', '50% off all IoT/M2M plans for new connections.'),
('Postpaid Loyalty Reward', '2025-02-01', '2025-12-01', 'Postpaid users for 12+ months get £5/month credit.');

INSERT INTO Promotion_Discounts (promotion_id, discount_type, discount_value) VALUES
(1, 'Percentage', 25.00),   -- Spring Saver 2025: 25% off
(2, 'Percentage', 100.00),  -- Data Boost April: Double data (100% more)
(3, 'Percentage', 50.00),   -- Student Welcome Pack: 50% off
(4, 'Flat', 10.00),         -- Family Bonus: £10 off/month
(5, 'Flat', 15.00),         -- Business Early Bird: £15 discount on setup
(6, 'Percentage', 15.00),   -- Senior Connect: 15% off
(7, 'Flat', 20.00),         -- Summer Deal: £20 off unlimited plan
(8, 'Flat', 5.00),          -- Roaming Free Trial: £5 off
(9, 'Percentage', 50.00),   -- IoT Launch: 50% off
(10, 'Flat', 5.00);         -- Loyalty Reward: £5 monthly credit

INSERT INTO Promotion_Plans (promotion_id, plan_id) VALUES
(1, 1),  -- Spring Saver 2025 → Smart Prepaid Lite
(2, 3),  -- Data Boost April → Data Explorer 10GB
(3, 7),  -- Student Welcome Pack → Student Stream Pack
(4, 5),  -- Family Bonus Bundle → Family Share 20GB
(5, 6),  -- Business Early Bird → Business Connect Pro
(6, 8),  -- Senior Connect Discount → Senior Essentials
(7, 4),  -- Unlimited Summer Deal → Unlimited Everything
(8, 9),  -- Roaming Free Trial → Roaming Global Flex
(9, 10), -- IoT Launch Offer → IoT Device Link
(10, 2); -- Postpaid Loyalty Reward → Smart Postpaid Max

INSERT INTO Customer_Promotions (customer_id, promotion_id, assigned_date) VALUES
(1, 1, '2025-03-01'),  -- Alice Thompson receives Spring Saver
(2, 2, '2025-04-01'),  -- Brian Walker gets Data Boost
(3, 3, '2025-01-15'),  -- Charlotte Patel uses Student Promo
(4, 4, '2025-02-20'),  -- David Kim on Family Bonus
(5, 5, '2025-03-05'),  -- Emily Zhang gets Business Early Bird
(6, 6, '2025-01-10'),  -- Farah Ahmed uses Senior Connect
(7, 7, '2025-06-01'),  -- George Hill joins Unlimited Summer
(8, 8, '2025-05-10'),  -- Hannah Green tries Roaming Trial
(9, 9, '2025-04-18'),  -- Ibrahim Ali gets IoT Launch offer
(10, 10, '2025-02-05');-- Julia Roberts gets Loyalty Reward

INSERT INTO Subscriptions (customer_id, plan_id, start_date, end_date, status) VALUES
(1, 1, '2024-01-10', '2025-01-09', 'Active'),       -- Alice on Prepaid plan
(2, 2, '2023-06-15', '2024-06-14', 'Active'),       -- Brian on Postpaid plan
(3, 7, '2024-02-01', '2025-01-31', 'Active'),       -- Charlotte on Student plan
(4, 5, '2023-11-20', '2024-11-19', 'Active'),       -- David on Family plan
(5, 6, '2024-03-05', '2025-03-04', 'Active'),       -- Emily on Business plan
(6, 8, '2023-09-01', '2024-08-31', 'Active'),       -- Farah on Senior plan
(7, 4, '2024-06-01', '2025-05-31', 'Active'),       -- George on Unlimited
(8, 9, '2024-05-01', '2024-10-31', 'Inactive'),     -- Hannah on Roaming plan
(9, 10, '2024-04-15', '2025-04-14', 'Cancelled'),   -- Ibrahim on IoT/M2M plan
(10, 3, '2024-02-10', '2024-08-09', 'Active');      -- Julia on Data Only plan

INSERT INTO Bills (subscription_id, bill_date, due_date, total_amount, status) VALUES
(1, '2025-05-01', '2025-05-15', 9.99, 'Paid'),        -- Alice: Prepaid
(2, '2025-05-01', '2025-05-15', 29.99, 'Unpaid'),     -- Brian: Postpaid
(3, '2025-05-01', '2025-05-15', 12.99, 'Paid'),       -- Charlotte: Student
(4, '2025-05-01', '2025-05-15', 39.99, 'Overdue'),    -- David: Family
(5, '2025-05-01', '2025-05-15', 59.99, 'Paid'),       -- Emily: Business
(6, '2025-05-01', '2025-05-15', 7.99, 'Paid'),        -- Farah: Senior
(7, '2025-05-01', '2025-05-15', 49.99, 'Unpaid'),     -- George: Unlimited
(8, '2025-04-01', '2025-04-15', 24.99, 'Paid'),       -- Hannah: Roaming (inactive now)
(9, '2025-03-01', '2025-03-15', 5.99, 'Paid'),        -- Ibrahim: Cancelled
(10, '2025-05-01', '2025-05-15', 14.99, 'Overdue');   -- Julia: Data only

INSERT INTO Payments (bill_id, payment_date, amount_paid, payment_method) VALUES
(1, '2025-05-02', 9.99, 'Credit Card'),           -- Paid on time
(3, '2025-05-03', 12.99, 'Mobile Payment'),       -- Paid quickly
(4, '2025-05-20', 39.99, 'Bank Transfer'),        -- Paid late (was overdue)
(5, '2025-05-01', 59.99, 'Credit Card'),          -- Paid same day
(6, '2025-05-05', 7.99, 'Cash'),                  -- Paid in cash
(8, '2025-04-05', 24.99, 'Mobile Payment'),       -- Roaming plan
(9, '2025-03-03', 5.99, 'Credit Card'),           -- IoT cancelled but paid
(2, '2025-05-14', 29.99, 'Bank Transfer'),        -- Paid just before due
(7, '2025-05-13', 49.99, 'Credit Card'),          -- Paid before due
(10, '2025-05-20', 14.99, 'Mobile Payment');      -- Overdue bill now paid

INSERT INTO Call_Records (subscription_id, call_time, duration_seconds, destination_number, call_type) VALUES
(1, '2025-06-01 08:15:23', 180, '07234567890', 'Outgoing'),   -- Alice
(2, '2025-06-01 09:42:10', 75, '07234567891', 'Incoming'),    -- Brian
(3, '2025-06-01 10:05:45', 240, '07234567892', 'Outgoing'),   -- Charlotte
(4, '2025-06-01 11:27:18', 60, '07234567893', 'Incoming'),    -- David
(5, '2025-06-01 13:52:02', 300, '07234567894', 'Outgoing'),   -- Emily
(6, '2025-06-01 14:30:11', 90, '07234567895', 'Incoming'),    -- Farah
(7, '2025-06-01 15:45:33', 210, '07234567896', 'Outgoing'),   -- George
(8, '2025-06-01 16:22:09', 120, '07234567897', 'Incoming'),   -- Hannah
(9, '2025-06-01 17:55:00', 30, '07234567898', 'Outgoing'),    -- Ibrahim
(10, '2025-06-01 18:40:47', 150, '07234567899', 'Incoming');  -- Julia

INSERT INTO Support_Tickets (customer_id, employee_id, issue_type, description, status, created_at, resolved_at) VALUES
(1, 2, 'Billing Discrepancy', 'Customer was charged twice for the same invoice.', 'Resolved', '2025-05-01 10:15:00', '2025-05-01 14:20:00'),
(2, 1, 'Network Coverage', 'Customer reports weak signal in central London.', 'In Progress', '2025-06-01 09:00:00', NULL),
(3, 3, 'SIM Activation Delay', 'SIM card not activated after 48 hours.', 'Resolved', '2025-05-28 11:45:00', '2025-05-29 08:30:00'),
(4, 4, 'App Login Error', 'Customer cannot access account on mobile app.', 'Closed', '2025-05-15 16:10:00', '2025-05-16 10:00:00'),
(5, 2, 'Call Drop Issue', 'Frequent call drops during peak hours.', 'In Progress', '2025-06-01 12:30:00', NULL),
(6, 5, 'Overcharged Roaming', 'Unexpected roaming charges while abroad.', 'Resolved', '2025-04-10 09:00:00', '2025-04-11 11:00:00'),
(7, 1, 'Slow Data Speed', 'Very slow internet speed on 5G plan.', 'Open', '2025-06-01 14:45:00', NULL),
(8, 4, 'Email Not Received', 'Customer did not receive bill notification email.', 'Closed', '2025-03-20 08:15:00', '2025-03-20 09:45:00'),
(9, 3, 'Device Compatibility', 'New phone not working with current SIM.', 'Resolved', '2025-05-05 13:20:00', '2025-05-05 17:00:00'),
(10, 2, 'Plan Downgrade Request', 'Customer requested to switch to a lower plan.', 'Resolved', '2025-04-25 10:00:00', '2025-04-25 11:30:00');

INSERT INTO Cell_Towers (tower_name, latitude, longitude, status) VALUES
('Tower - London Central', 51.507351, -0.127758, 'Active'),
('Tower - Manchester South', 53.480759, -2.242631, 'Active'),
('Tower - Birmingham East', 52.486244, -1.890401, 'Active'),
('Tower - Leeds North', 53.800755, -1.549077, 'Inactive'),
('Tower - Glasgow Central', 55.864239, -4.251806, 'Active'),
('Tower - Bristol West', 51.454514, -2.587910, 'Inactive'),
('Tower - Sheffield Downtown', 53.381129, -1.470085, 'Active'),
('Tower - Nottingham City', 52.954783, -1.158109, 'Active'),
('Tower - Liverpool Docks', 53.408371, -2.991573, 'Active'),
('Tower - Edinburgh East', 55.953251, -3.188267, 'Active');

INSERT INTO Service_Areas (area_name, city, region) VALUES
('Camden Town', 'London', 'Greater London'),
('Didsbury', 'Manchester', 'Greater Manchester'),
('Edgbaston', 'Birmingham', 'West Midlands'),
('Headingley', 'Leeds', 'West Yorkshire'),
('Hillhead', 'Glasgow', 'Strathclyde'),
('Clifton', 'Bristol', 'South West'),
('Ecclesall', 'Sheffield', 'South Yorkshire'),
('The Park', 'Nottingham', 'East Midlands'),
('Baltic Triangle', 'Liverpool', 'Merseyside'),
('Leith', 'Edinburgh', 'Scotland');


INSERT INTO Tower_Coverage (tower_id, area_id) VALUES
(1, 1),  -- London Central tower → Camden Town
(2, 2),  -- Manchester South tower → Didsbury
(3, 3),  -- Birmingham East tower → Edgbaston
(4, 4),  -- Leeds North tower → Headingley
(5, 5),  -- Glasgow Central tower → Hillhead
(6, 6),  -- Bristol West tower → Clifton
(7, 7),  -- Sheffield Downtown tower → Ecclesall
(8, 8),  -- Nottingham City tower → The Park
(9, 9),  -- Liverpool Docks tower → Baltic Triangle
(10, 10);-- Edinburgh East tower → Leith
