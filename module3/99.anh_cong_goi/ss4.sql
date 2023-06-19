use ss2;
-- 1.             Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp ( yêu cầu viết code ra giấy )
select class.name, count(*) 'total of student'
from student
join class on student.class_id = class.id
group by class.id;

-- 2.             Tính điểm lớn nhất của mỗi các lớp ( yêu cầu viết code ra giấy )
select class.name, max(student.point) as 'max point of student of class'
from student
join class on student.class_id = class.id
group by class.id;

-- 3.             Tình điểm trung bình  của từng lớp ( yêu cầu viết code ra giấy )
select class.name, avg(student.point) as 'avg student of class'
from student
join class on student.class_id = class.id
group by class.id;

-- 4.             Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. ( yêu cầu viết code ra giấy )
select student.name, student.birthday
from student
union 
select instructor.name,instructor.birthday
from instructor;

-- 5.             Lấy ra top 3 học viên có điểm cao nhất của trung tâm. ( yêu cầu viết code ra giấy )
select *
from student 
ORDER BY student.point desc
limit 3 offset 0;

-- 6.             Lấy ra các học viên có điểm số là cao nhất của trung tâm. ( yêu cầu viết code ra giấy )
select student.name,student.point
from student s
where point in (
				select student.name, max(point)
                from student);
                
select student.name,student.point
from student
WHERE exists ( select max(point)
				from student
				having student.point = max( point));