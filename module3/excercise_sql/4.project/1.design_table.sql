CREATE DATABASE shop;
use shop;
CREATE TABLE admin(
	account_admin varchar(40) primary key not null,
    `password` varchar(40) not null,
    `name` varchar(40) not null,
    date_of_birth DATETIME,
    phone_number varchar(40) not null,
    email varchar(40) not null,
    location varchar(40) not null,
    gender BIT(1)
);
CREATE TABLE user(
	account_user varchar(40) primary key not null,
    `password` varchar(40) not null,
    `name` varchar(40) not null,
    date_of_birth DATETIME,
    phone_number varchar(40) not null,
    email varchar(40) not null,
    location varchar(40) not null,
    gender BIT(1)
);
CREATE TABLE product (
	product_id int PRIMARY key not null,
    `name` VARCHAR(40) NOT null,
    image varchar(40) not null,
    money double not null,
    product_description varchar(40) not null,
    producer varchar(40) not null,
    origin varchar(40) not null,
    remain_amount int not null,
    post_date DATETIME not null
);
create table include_service_order(
	include_service_id int PRIMARY key not null,
    include_serivce_name varchar(40) not null,
    price double not null
);
CREATE TABLE `order`(
	order_id int PRIMARY KEY not null,
    quantity int not null,
    total_of_money DOUBLE not null,
    order_date DATETIME,
    estimated_delivery_order DATETIME,
    product_id int,
    account_admin varchar(40),
    account_user varchar(40),
	FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (account_admin) REFERENCES `admin`(account_admin),
	FOREIGN KEY (account_user) REFERENCES user(account_user)
);
CREATE table detail_order(
	detail_order_id int PRIMARY KEY not null,
    include_service_id int,
    order_id int,
    foreign key (include_service_id) REFERENCES include_service_order(include_service_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);









