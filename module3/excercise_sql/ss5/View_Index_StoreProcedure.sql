-- Bước 1: Tạo cơ sở dữ liệu demo
CREATE DATABASE demo;
use demo;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
CREATE TABLE Products (
	Id int not null PRIMARY key,
	productCode INT,
	productName varchar(45),
	productPrice DOUBLE, 
	productAmount int, 
	productDescription varchar(45),
	productStatus varchar(45)
);
INSERT into products 
VALUES (1,1,'bánh',5000,10,'bánh bông lan','oke'),
		(2,2,'kẹo',2000,15,'kẹo bông gòn','not ok'),
        (3,3,'nước',10000,20,'nước ngọt','oke'),
        (4,4,'bia',20000,25,'beer huda','oke');
        
-- Bước 3:
CREATE UNIQUE index  index_productCode on Products (productCode);
CREATE INDEX composite ON Products(productName, productPrice);
explain select * 
from products
where productName ='bánh';

-- Bước 4:

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE view view_products as
select productCode,productName,productPrice,productStatus 
from products;

SELECT *
from view_products;

-- Tiến hành sửa đổi view
UPDATE view_products
SET productStatus = 'not oke'
WHERE productname = 'bia';

SELECT *
from view_products;

-- Tiến hành xoá view
drop view view_products;

-- Bước 5:

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE find_All_Products()
BEGIN
  SELECT * 
  FROM products;
END //
DELIMITER ;
call find_all_products();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_product(in p1 int, in p2 int, in p3 VARCHAR(45),in p4 double, in p5 int ,in p6 varchar(45), in p7 varchar(45))
BEGIN
	INSERT into products
    VALUES(p1,p2,p3,p4,p5,p6,p7);
end //
DELIMITER ;

call add_product(5,5,'cơm chó',20000,25,'cơm mua về cho chó ăn','oke');
call add_product(6,6,'cơm chó không thèm ăn',20000,25,'cơm mua về cho chó cũng chê',' not oke');
select *
from products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create PROCEDURE edit_product(in p1 int, in p2 int, in p3 VARCHAR(45),in p4 double, in p5 int ,in p6 varchar(45), in p7 varchar(45))
begin
	UPDATE products
    set  products.productCode = p2, products.productName =p3, products.productPrice = p4, products.productAmount = p5, products.productDescription = p6, products.productStatus =p7
    where products.Id = p1;
end //
delimiter ;

select *
from products;

call edit_product(5,5,'cơm chó',20000,25,'cơm mua về cho chó ăn','ăn vô đau bụng');

select *
from products;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create PROCEDURE delete_product(in p1 int)
begin
	delete from products
    where products.Id = p1;
end //
delimiter ;

select *
from products;

call delete_product(5);

select *
from products;
