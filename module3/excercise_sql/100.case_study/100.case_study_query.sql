use furama_resort;
-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT staff.staff_id,staff.full_name
from staff
where (full_name like "h%" or full_name like 't%' or full_name like 'k%') and char_length(full_name) <=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select customer.customer_id,customer.full_name
from customer
where  TIMESTAMPDIFF(year, customer.date_of_birth, CURDATE()) >=18 and TIMESTAMPDIFF(year, customer.date_of_birth, CURDATE()) <=50 
and (location like '%quảng trị' or location like '%đà nẵng');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select customer.customer_id, customer.full_name, count(*) numbers_booking
from customer 
join customer_type on customer.customer_type_id = customer_type.customer_type_id 
join contract on customer.customer_id = contract.customer_id
where customer_type.customer_type_name ='diamond'
group by customer.customer_id
ORDER BY  numbers_booking;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select customer.customer_id, customer.full_name,customer_type.customer_type_name,contract.contract_id,service.service_name,
contract.date_start_contract,contract.date_end_contract, (service.rental_costs + detail_contract.quanlity*include_service.price) as 'total'
from customer
left join customer_type on customer.customer_type_id = customer_type.customer_type_id
left join contract on customer.customer_id = contract.customer_id
left join service on contract.service_id = service.service_id
left join detail_contract on contract.contract_id = detail_contract.contract_id
left join include_service on detail_contract.service_id_include = include_service.service_id_include;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select DISTINCT contract.service_id,service.service_name,service.area,service.rental_costs,service.service_name
from contract
join service on contract.service_id = service.service_id
join service_type on service.service_type_id = service_type.service_type_id
where contract.service_id  not in (
					select contract.service_id
                    from contract
                    WHERE (month(contract.date_start_contract)=1  or month(contract.date_start_contract)=2 or month(contract.date_start_contract)=3) and year(contract.date_start_contract) =2021
) ;

-- contract.date_Start_contract >= '2021-01-01' and contract.date_Start_contract < '2021-03-31'

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
--  nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select DISTINCT service.service_id,service.service_name, service.area, service.maximum_number_of_people,service.rental_costs,service.service_name
from contract
join service on contract.service_id = service.service_id
where contract.service_id not in (
								select contract.service_id
                                from contract
                                WHERE year(contract.date_start_contract) =2021
) and year(contract.date_start_contract) =2020;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select customer.full_name
from customer
GROUP BY customer.full_name;

select DISTINCT customer.full_name
from customer;

select customer.full_name
from customer
union
select customer.full_name
from customer;
 
 

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
--  thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(contract.date_start_contract) as '# thang',count(*) as 'number of booking room of each month'
from contract
JOIN customer on contract.customer_id = customer.customer_id
where year(contract.date_start_contract) = 2021 
group BY month(contract.date_start_contract)
ORDER BY month(contract.date_start_contract) asc;


-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select contract.contract_id,contract.date_start_contract,contract.date_end_contract,contract.deposits, sum(detail_contract.quanlity)
from contract
left join detail_contract on contract.contract_id = detail_contract.contract_id
left join include_service on detail_contract.service_id_include = include_service.service_id_include
GROUP BY contract.contract_id;


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
--  và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select include_service.service_id_include,include_service.service_name_include
from contract
join detail_contract on contract.contract_id = detail_contract.contract_id
join include_service on detail_contract.service_id_include = include_service.service_id_include
join customer on contract.customer_id = customer.customer_id
join customer_type on customer.customer_type_id = customer_type.customer_type_id
where customer_type.customer_type_name = 'diamond' and ( customer.location like '%vinh' or customer.location like '%quảng ngãi');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
--  ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select contract.contract_id, staff.full_name,customer.full_name,customer.phone_number,service.service_id,service.service_name, sum(detail_contract.quanlity), sum(contract.deposits)
from contract
left join detail_contract on contract.contract_id = detail_contract.contract_id
left join include_service on detail_contract.service_id_include = include_service.service_id_include
left join customer on contract.customer_id = customer.customer_id
left join staff on contract.staff_id = staff.staff_id
left join service on contract.service_id =service.service_id
where service.service_id not in  (
								select contract.service_id
                                from contract
                                WHERE ((month(contract.date_start_contract) = 1 or month(contract.date_start_contract) = 2 or month(contract.date_start_contract) = 3 or
                                month(contract.date_start_contract) = 4 or month(contract.date_start_contract) = 5 or month(contract.date_start_contract) = 6) and year(contract.date_start_contract) =2021)
) and year(contract.date_start_contract) = 2020 and (month(contract.date_start_contract) =10 or month(contract.date_start_contract) =11 or month(contract.date_start_contract) =12)
GROUP BY contract.contract_id;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
--  (được tính dựa trên việc count các ma_dich_vu_di_kem).

select  contract.contract_id,service_type.service_type_name,  include_service.service_name_include
from contract
join detail_contract on contract.contract_id = detail_contract.contract_id
join include_service on detail_contract.service_id_include = include_service.service_id_include
join service on contract.service_id =service.service_id
join rental_type on service.rental_type_id = rental_type.rental_type_id
join service_type on service.service_type_id = service_type.service_type_id
group by include_service.service_name_include
having count(*) > 2


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do,
--  ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.


-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
--  và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.


-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu”
--  đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.


-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang 
-- được truyền vào như là 1 tham số của sp_xoa_khach_hang.


-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong
--  phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn
--  tham chiếu đến các bảng liên quan.


-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng
--  bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
