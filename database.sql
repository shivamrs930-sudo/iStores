CREATE DATABASE istore;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(10),
    address TEXT,
    product VARCHAR(100),
    price INT
);
