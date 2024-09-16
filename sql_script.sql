CREATE TABLE Branch (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255)
);

CREATE TABLE MenuItem (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Inventory (
    id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES Branch(id),
    menu_item_id INT REFERENCES MenuItem(id),
    stock_level INT NOT NULL
);

CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

CREATE TABLE Payment (
    id SERIAL PRIMARY KEY,
    method VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(100) UNIQUE,
    amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(id),
    branch_id INT REFERENCES Branch(id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    payment_id INT REFERENCES Payment(id)
);

CREATE TABLE OrderDetails (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(id),
    menu_item_id INT REFERENCES MenuItem(id),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Promotions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    discount_percentage DECIMAL(5, 2)
);

CREATE TABLE CustomerPromotions (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(id),
    promotion_id INT REFERENCES Promotions(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);