-- 1. Customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    address TEXT,
    date_of_birth DATE,
    registration_date DATE
);

-- 2. Employees
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    role VARCHAR(50),
    hire_date DATE
);

-- 3. Plan Types (Prepaid, Postpaid, etc.)
CREATE TABLE Plan_Types (
    plan_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) UNIQUE,
    description TEXT
);

-- 4. Service Plans
CREATE TABLE Service_Plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100),
    plan_type_id INT,
    monthly_fee DECIMAL(10,2),
    call_minutes INT,
    sms_limit INT,
    data_limit_gb FLOAT,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (plan_type_id) REFERENCES Plan_Types(plan_type_id)
);

-- 5. Promotions
CREATE TABLE Promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    promotion_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    description TEXT
);

-- 6. Promotion Discounts (linked to Promotions)
CREATE TABLE Promotion_Discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    promotion_id INT,
    discount_type ENUM('Percentage', 'Flat'),
    discount_value DECIMAL(10,2),
    FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id)
);

-- 7. Promotion Plans (M:N: Promotions ↔ Service Plans)
CREATE TABLE Promotion_Plans (
    promotion_id INT,
    plan_id INT,
    PRIMARY KEY (promotion_id, plan_id),
    FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id),
    FOREIGN KEY (plan_id) REFERENCES Service_Plans(plan_id)
);

-- 8. Customer Promotions (M:N: Customers ↔ Promotions)
CREATE TABLE Customer_Promotions (
    customer_id INT,
    promotion_id INT,
    assigned_date DATE,
    PRIMARY KEY (customer_id, promotion_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id)
);

-- 9. Subscriptions (Customer subscribes to a plan)
CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    status ENUM('Active', 'Inactive', 'Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES Service_Plans(plan_id)
);

-- 10. Bills
CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    bill_date DATE,
    due_date DATE,
    total_amount DECIMAL(10,2),
    status ENUM('Paid', 'Unpaid', 'Overdue'),
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- 11. Payments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    bill_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    payment_method ENUM('Credit Card', 'Bank Transfer', 'Cash', 'Mobile Payment'),
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id)
);

-- 12. Call Records
CREATE TABLE Call_Records (
    call_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    call_time DATETIME,
    duration_seconds INT,
    destination_number VARCHAR(20),
    call_type ENUM('Incoming', 'Outgoing'),
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- 13. Support Tickets
CREATE TABLE Support_Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    issue_type VARCHAR(100),
    description TEXT,
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),
    created_at DATETIME,
    resolved_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- 14. Cell Towers
CREATE TABLE Cell_Towers (
    tower_id INT AUTO_INCREMENT PRIMARY KEY,
    tower_name VARCHAR(100),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    status ENUM('Active', 'Inactive')
);

-- 15. Service Areas
CREATE TABLE Service_Areas (
    area_id INT AUTO_INCREMENT PRIMARY KEY,
    area_name VARCHAR(100),
    city VARCHAR(100),
    region VARCHAR(100)
);

-- 16. Tower Coverage (M:N: Towers ↔ Areas)
CREATE TABLE Tower_Coverage (
    tower_id INT,
    area_id INT,
    PRIMARY KEY (tower_id, area_id),
    FOREIGN KEY (tower_id) REFERENCES Cell_Towers(tower_id),
    FOREIGN KEY (area_id) REFERENCES Service_Areas(area_id)
);
