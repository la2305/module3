use control_purchase;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id,order_date,order_total_price
from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT customer_name, product_name
from order_detail ord
JOIN `order` o on ord.order_id = o.order_id
join product p on ord.product_id = p.product_id
join customer c on o.customer_id = c.customer_id;