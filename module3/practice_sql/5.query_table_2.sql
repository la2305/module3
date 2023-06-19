use quanlysinhvien;

-- Bước 2: Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select address,count(address) as 'total'
from student
group by address;

-- Bước 3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select student.studentid,student.studentname ,avg(mark)
from student
join mark on student.studentid = mark.studentid
group by student.studentid, student.studentname;

-- Bước 4: Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
-- Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên

select student.studentid,student.studentname ,avg(mark)
from student
join mark on student.studentid = mark.studentid
group by student.studentid, student.studentname
having AVG(Mark) > 15
;

-- Bước 5: Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
-- Hiển thị danh sách điểm trung bình của các học viên
select student.studentid,student.studentname, avg(mark) as 'avg score'
from student
join mark on student.studentid = mark.studentid
group by student.studentid
having avg(mark) >=all (select avg(mark) from mark GROUP BY mark.studentid);