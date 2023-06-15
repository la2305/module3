create database control_purchase;
USE control_purchase;
CREATE TABLE customer(
	customer_id VARCHAR(50) PRIMARY KEY,
    customer_name varchar(50),
    customer_age INT
);
CREATE TABLE `order`(
	order_id VARCHAR(50) PRIMARY key,
    customer_id varchar(50),
	order_date DATETIME,
    order_total_price INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE product(
	product_id varchar(50) PRIMARY KEY,
    product_name varchar(50),
    product_price varchar(50)
);
CREATE TABLE order_detail (
    order_id varchar(50),
    product_id varchar(50),
    PRIMARY KEY(order_id, product_id),
    order_quality VARCHAR(50),
    FOREIGN KEY (order_id) references `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);