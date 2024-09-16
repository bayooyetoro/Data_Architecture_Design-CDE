-- Insert demo data into Branch table
INSERT INTO Branch (name, location, contact_info, created_at)
VALUES 
('Lekki Branch', 'Lekki, Lagos', '08012345678', CURRENT_TIMESTAMP),
('Ikeja Branch', 'Ikeja, Lagos', '08023456789', CURRENT_TIMESTAMP),
('Agege Branch', 'Agege, Lagos', '08034567890', CURRENT_TIMESTAMP);

-- Insert demo data into MenuItem table
INSERT INTO MenuItem (name, description, price, created_at)
VALUES 
('Jollof Rice', 'Nigerian delicacy with tomato sauce and spices', 1500.00, CURRENT_TIMESTAMP),
('Fried Rice', 'Rice cooked with vegetables and spices', 1600.00, CURRENT_TIMESTAMP),
('Pounded Yam & Egusi', 'Traditional Nigerian dish with yam and melon soup', 2500.00, CURRENT_TIMESTAMP),
('Chinese Rice', 'Rice stir-fried with vegetables and meat', 2000.00, CURRENT_TIMESTAMP);

-- Insert demo data into Inventory table
INSERT INTO Inventory (branch_id, menu_item_id, stock_level, created_at)
VALUES 
(1, 1, 100, CURRENT_TIMESTAMP), -- Lekki Branch: Jollof Rice
(1, 2, 80, CURRENT_TIMESTAMP), -- Lekki Branch: Fried Rice
(2, 1, 120, CURRENT_TIMESTAMP), -- Ikeja Branch: Jollof Rice
(2, 3, 60, CURRENT_TIMESTAMP), -- Ikeja Branch: Pounded Yam & Egusi
(3, 4, 90, CURRENT_TIMESTAMP); -- Agege Branch: Chinese Rice

-- Insert demo data into Customer table
INSERT INTO Customer (name, email, phone, address, created_at)
VALUES 
('John Doe', 'johndoe@gmail.com', '08067891234', 'Lekki, Lagos', CURRENT_TIMESTAMP),
('Jane Smith', 'janesmith@yahoo.com', '08078901234', 'Ikeja, Lagos', CURRENT_TIMESTAMP),
('Ahmed Musa', 'ahmedmusa@outlook.com', '08089012345', 'Agege, Lagos', CURRENT_TIMESTAMP);

-- Insert demo data into Payment table
INSERT INTO Payment (method, transaction_id, amount, created_at)
VALUES 
('Cash', 'TXN12345', 4000.00, CURRENT_TIMESTAMP),
('Debit Card', 'TXN12346', 2500.00, CURRENT_TIMESTAMP),
('Online', 'TXN12347', 1500.00, CURRENT_TIMESTAMP);

-- Insert demo data into Orders table
INSERT INTO Orders (customer_id, branch_id, order_date, total_amount, payment_id, created_at)
VALUES 
(1, 1, CURRENT_TIMESTAMP, 4000.00, 1, CURRENT_TIMESTAMP), -- John Doe's order at Lekki Branch
(2, 2, CURRENT_TIMESTAMP, 2500.00, 2, CURRENT_TIMESTAMP), -- Jane Smith's order at Ikeja Branch
(3, 3, CURRENT_TIMESTAMP, 1500.00, 3, CURRENT_TIMESTAMP); -- Ahmed Musa's order at Agege Branch

-- Insert demo data into OrderDetails table
INSERT INTO OrderDetails (order_id, menu_item_id, quantity, price, created_at)
VALUES 
(1, 1, 2, 1500.00, CURRENT_TIMESTAMP), -- John Doe ordered 2 Jollof Rice
(1, 2, 1, 1600.00, CURRENT_TIMESTAMP), -- John Doe ordered 1 Fried Rice
(2, 3, 1, 2500.00, CURRENT_TIMESTAMP), -- Jane Smith ordered 1 Pounded Yam & Egusi
(3, 4, 1, 1500.00, CURRENT_TIMESTAMP); -- Ahmed Musa ordered 1 Chinese Rice

-- Insert demo data into Promotions table
INSERT INTO Promotions (name, description, discount_percentage, created_at)
VALUES 
('New Customer Discount', '10% off for first-time customers', 10.00, CURRENT_TIMESTAMP),
('Weekend Special', '15% off for all orders on weekends', 15.00, CURRENT_TIMESTAMP);

-- Insert demo data into CustomerPromotions table
INSERT INTO CustomerPromotions (customer_id, promotion_id, start_date, end_date, created_at)
VALUES 
(1, 1, CURRENT_DATE, CURRENT_DATE + INTERVAL '30 days', CURRENT_TIMESTAMP), -- John Doe receives New Customer Discount
(2, 2, CURRENT_DATE, CURRENT_DATE + INTERVAL '7 days', CURRENT_TIMESTAMP); -- Jane Smith receives Weekend Special
