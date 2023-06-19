use quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
where credit=(select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.subid,subject.subname,subject.credit,subject.status
from subject
join mark on subject.subid = mark.subid
where mark=(select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.studentid, student.studentname, student.address, student.phone, student.status, student.classid, avg(mark.mark) as 'avg'
from student
join mark on student.studentid = mark.studentid
group by student.studentid,student.studentname

