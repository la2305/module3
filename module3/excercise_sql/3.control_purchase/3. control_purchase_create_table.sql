create database control_purchase;
USE control_purchase;
CREATE TABLE customer(
	customer_id int PRIMARY KEY,
    customer_name varchar(50),
    customer_age TINYINT
);
CREATE TABLE `order`(
	order_id int PRIMARY key,
    customer_id int,
	order_date DATETIME,
    order_total_price INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE product(
	product_id int PRIMARY KEY,
    product_name varchar(50),
    product_price int
);
CREATE TABLE order_detail (
    order_id int,
    product_id int,
    PRIMARY KEY(order_id, product_id),
    order_quality int,
    FOREIGN KEY (order_id) references `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);