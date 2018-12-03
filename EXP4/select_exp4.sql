-- 1st
SELECT *
FROM Course;

-- 2nd
SELECT Kind
FROM Course;

--3rd
SELECT DISTINCT Kind
FROM Course ;


-- 4th
SELECT *
FROM Student
limit 6 ;


-- 5th
SELECT '课程编码'=CouNo,'课程名称'=CouName,'教师'=Teacher,'上课时间'=SchoolTime,
'限制选课人数'=LimitNum,'报名人数'=WillNum
FROM  Course;

-- 6th
SELECT * 
FROM Course;



-- 7th

SELECT * 
FROM Course
WHERE Kind='信息技术' AND Credit=2;

-- 8th
SELECT *,WillNum/LimitNum
FROM Course;

-- 9th
SELECT '最小的报名人数'=MIN(WillNum),'最大的报名人数'=MAX(WillNum),'平均报名人数'=AVG(WillNum)
FROM Course;

-- 10th

SELECT *,WillNum/LimitNum '报名人数与限选人数之比'
FROM Course 
ORDER BY WillNum;

-- 11th
SELECT Teacher AS '教师名',CouNo AS '课程编号',CouName AS '课程名'
FROM Course
ORDER BY Teacher DESC,CouNo;

-- 12th
SELECT *
FROM Course
WHERE CouNo='004' OR CouNo='007' OR CouNo='013';

-- 13th
SELECT CouNo,CouName
FROM Course
WHERE CouNo NOT IN('004','007','013');

-- 14th
SELECT *
FROM Course
WHERE CouName LIKE 'D%';

--15th
SELECT *
FROM Course
WHERE CouName LIKE '%制作';

--16th
SELECT * 
FROM Student
WHERE StuName LIKE '_宝%';

--17th
SELECT *
FROM Student
WHERE StuName LIKE '[^刘]%';

--18th
SELECT *
FROM Course
WHERE Teacher IS NULL;

--19th
SELECT *
FROM Course
WHERE WillNum<15 ;

--20th
SELECT *
FROM Course
WHERE WillNum>15 AND WillNum<25 ;

--21st 
SELECT *
FROM Course
WHERE WillNum BETWEEN 15 AND 25 
ORDER BY WillNum DESC ;

--22nd 多于25人！
SELECT *
FROM Course
WHERE WillNum NOT BETWEEN 15 AND 25 
ORDER BY WillNum DESC ;

--23rd
SELECT Kind AS '课程类别',AVG(WillNum) AS '平均报名人数'
FROM Course
GROUP BY Kind
HAVING Kind='信息技术';

--24th
SELECT Kind AS '课程类别',AVG(WillNum) AS '每类平均报名人数'
FROM Course
WHERE Kind='信息技术'
GROUP BY Kind

-- 25th
SELECT Course.Kind,AVG(Course.WillNum)
FROM Course
GROUP BY Course.Kind

-- 26th
SELECT AVG(Course.WillNum)
FROM Course
WHERE Course.Kind='信息技术'

-- 27th
SELECT Course.CouName ,AVG(Course.WillNum) as avg
FROM Course
GROUP BY Course.Kind
HAVING avg_c > 25

-- 28th
SELECT *
FROM Course 
WHERE WillNum >(
     SELECT AVG(WillNum)
     FROM Course 
    )


-- 29th
SELECT ClassName FROM Class
UNION
SELECT DepartName FROM Department;

-- 30th

SELECT ClassName AS '所有班名和所有系名' FROM Class
UNION
SELECT DepartName FROM Department
ORDER BY ClassName DESC


-- 31st

SELECT Class.ClassNo,Class.ClassName,Department.DepartNo,Department.DepartName
FROM Class,Department
WHERE Class.DepartNo=Department.DepartNo;

-- 32nd
 SELECT Student.*,Class.ClassName
FROM Student,Class
WHERE STUDENT.ClassNo=Class.ClassNo;

-- 33rd

SELECT Student.StuName,Course.CouName,StuCou.CouNo
FROM Student,Course,StuCou
WHERE Student.StuNo=StuCou.StuNo AND Course.CouNo=StuCou.CouNo
ORDER BY Student.StuName,StuCou.CouNo;


-- 34th
SELECT Student.StuName,Course.CouName,Course.Teacher
FROM Student,Course,StuCou
WHERE StuCou.CouNo=Course.CouNo AND Student.StuNo =Student.StuNo AND Course.CouNo IN(
     SELECT Course.CouNo
     FROM Course,Department
     WHERE Course.DepartNo=Department.DepartNo AND Department.DepartName='计算机应用工程系'
     )
;
-- 35th
SELECT Class.ClassName,Course.CouName,Course.Kind,Course.Credit,Course.Teacher,Course.SchoolTime,Course.WillNum
FROM Class,Course
WHERE Course.DepartNo<>Class.DepartNo;









