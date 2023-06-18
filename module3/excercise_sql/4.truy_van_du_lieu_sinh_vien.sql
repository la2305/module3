USE QuanLySinhVien;
SELECT *
FROM Student;
SELECT *
FROM Student
WHERE Status = true;
SELECT *
FROM Subject
WHERE Credit < 10;
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where student.studentname like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class 
where month(startdate)="12";

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select*
from subject
WHERE credit >=3 and credit <=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student 
set classid = 2
where  studentname = 'hung';
SET SQL_SAFE_UPDATES = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.studentname, subject.subname, mark.mark
from mark 
JOIN subject  on mark.subid = subject.subid
join student  on mark.studentid = student.studentid
ORDER BY mark DESC;