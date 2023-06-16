use control_purchase;

INSERT into customer(customer_id, customer_name,customer_age)
VALUES(1,'Minh Quan',10),
	(2,'Ngoc Oanh',20),
    (3,'Hong Ha',50);
    
INSERT into `order`(order_id,customer_id,order_date,order_total_price)
VALUES(1,1,'2006-03-21',NULL),
	(2,2,'2006-03-23',NULL),
    (3,1,'2006-03-16',null);
    
insert into product(product_id,product_name,product_price)
values(1,'May giat',3),
	(2,'Tu Lanh',5),
    (3,'Dieu Hoa',7),
    (4,'Quat',1),
    (5,'Bep Dien',2);

INSERT into order_detail (order_id,product_id,order_quality)
VALUES(1,1,3),
	(1,3,7),
    (1,4,2),
    (2,1,1),
    (3,1,8),
    (2,5,4),
    (2,3,3);
