use furama_resort;
-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
from staff
where (full_name like "h%" or full_name like 't%' or full_name like 'k%') and length(full_name) <=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from customer
where  TIMESTAMPDIFF(year, customer.date_of_birth, CURDATE()) >=18 and TIMESTAMPDIFF(year, customer.date_of_birth, CURDATE()) <=50 
and (location like '%quảng trị' or location like '%đà nẵng');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select customer.full_name, customer_type.customer_type_name, count(*) numbers_booking
from customer 
join customer_type on customer.customer_type_id = customer_type.customer_type_id 
join contract on customer.customer_id = contract.customer_id
where customer_type.customer_type_name ='diamond'
group by customer.full_name
ORDER BY  numbers_booking;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select customer.customer_id, customer.full_name, customer_type.customer_type_name,contract.contract_id,service.service_name,contract.date_start_contract,
contract.date_end_contract, service.rental_costs + detail_contract.quanlity*include_service.price as price 
from customer
left join customer_type on customer.customer_type_id = customer_type.customer_type_id 
left join contract on customer.customer_id = contract.customer_id
left join service on contract.service_id = service.service_id
left join detail_contract on contract.contract_id = detail_contract.contract_id
left join include_service on detail_contract.service_id_include = include_service.service_id_include;
