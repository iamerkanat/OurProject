-- Database: myShop

-- DROP DATABASE IF EXISTS "myShop";

CREATE DATABASE "myShop"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Kazakhstan.1252'
    LC_CTYPE = 'Russian_Kazakhstan.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    card_number VARCHAR(20),
    address VARCHAR(100)
);


CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    wishlist VARCHAR(100),
    product_id INT,
    customer_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    about_id INT,
    category_id INT,
    delivery_id INT,
    FOREIGN KEY (about_id) REFERENCES ProductAbout(about_id),
    FOREIGN KEY (category_id) REFERENCES ProductCategories(category_id),
    FOREIGN KEY (delivery_id) REFERENCES Delivery(delivery_id)
);


CREATE TABLE ProductAbout (
    about_id INT PRIMARY KEY,
    name VARCHAR(100),
    image_url VARCHAR(255),
    certificate VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT,
    characteristics TEXT,
    rating DECIMAL(5, 1)
);


CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    delivery_address VARCHAR(100),
    post_code VARCHAR(20)
);


CREATE TABLE Boxes (
    box_id INT PRIMARY KEY,
    product_id INT,
    delivery_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (delivery_id) REFERENCES Delivery(delivery_id)
);


CREATE TABLE ProductCategories (
    category_id INT PRIMARY KEY,
	technology VARCHAR(50)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(50),
    last_name VARCHAR(50),
    contacts VARCHAR(100),
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);


CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    product_id INT,
    address VARCHAR(100),
    card_number VARCHAR(20),
    guaranty VARCHAR(50),
    box_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (box_id) REFERENCES Boxes(box_id)
);


INSERT INTO Customers (customer_id, name, last_name, phone_number, card_number, address) 
VALUES (001, 'Erkanat', 'Orynbay', '+77086231614', '1234 5678 9012 3456', 'Almaty');


INSERT INTO Purchases (purchase_id, wishlist) 
VALUES (0001, 'Apple Watch');


INSERT INTO Products (product_id) 
VALUES (001);


INSERT INTO ProductAbout (about_id, name, image_url, certificate, price, description, characteristics, rating) 
VALUES (000001, 'Smart Watch', 'https://unsplash.com/applewatch.jpg', 'EU, USA', 999.99, 'Really good smart watches', 'Waterproof, Bluetooth connectivity, Heart rate monitor', 4.5);


INSERT INTO Delivery (delivery_id, delivery_address, post_code) 
VALUES (1000, 'Seifullina 236', '050000');


INSERT INTO Boxes (box_id) 
VALUES (2000);


INSERT INTO ProductCategories (category_id, technology) 
VALUES (3000, 'Watch');


INSERT INTO Suppliers (supplier_id, name, last_name, contacts) 
VALUES (10001, 'Somebody', 'Someone', '+77017080047');


INSERT INTO Sellers (seller_id, address, card_number, guaranty) 
VALUES (20001, 'Almaty Towers', '6574 6573 8889 0209', '1 year');

