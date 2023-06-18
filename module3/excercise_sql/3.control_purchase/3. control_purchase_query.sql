use control_purchase;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, order_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer_name, product_name
from order_detail o_d
JOIN product p on o_d.product_id = p.product_id
join `order` o on o_d.order_id = o.order_id
join customer c on o.customer_id = c.customer_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select *
from customer c
left join `order` o on c.customer_id = o.customer_id
where o.order_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.order_id, o.order_date, o_d.order_quality * p.product_price as "total price"
from order_detail o_d
join product p on o_d.product_id = p.product_id
join `order` o on o_d.order_id = o.order_id;
