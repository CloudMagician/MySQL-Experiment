use school;
-- 1st
use school;
select sname,grade
from student natural join sc natural join course
where cname = 'Bibliometrics';


-- 2nd
use school;
select count(grade) 
from  sc
where sc.grade < 60;

-- 3rd
use school;
select sname,ssex,sno
from student as a
where a.sname like '%z%';

-- 4th
use school;
select a.sname,a.sno,b.grade,c.cname
from student as a,sc as b,course as c
where a.sno = b.sno and c.cno=b.cno and cname = 'Introduction to the Internet';

use school;
select sname,sno,grade
from student natural join sc natural join course
where cname = 'Introduction to the Internet';



-- 5th
use school;
select sname,sum(ctime)
from student natural join sc natural join course
where sname ='Zuo li'
group by sname;

-- 6th
use school;
select avg(grade)
from student natural join sc natural join course
where sage < 20;

-- 7th
use school;
select count(sname)
from  student natural join sc natural join course
where sdept = 'computer science' and cname = 'Database System';

-- 8th
use school;
select sname
from  student natural join sc natural join course
where cname = 'Database System'
union 
select sname
from student natural join sc natural join course
where cname = 'Introduction to the Internet';

-- 9th
-- 没有人叫 Wang gang ,改成搜索 wang peng ,和他俩是同学关系的输出
use school;
select distinct (a.sname)
from 
(select *
from student natural join sc natural join course) as a
join
(select *
from  student natural join sc natural join course
where sname = 'Wang peng') as b
on a.cno = b.cno;


-- 10th
use school;
select * 
from student natural join sc natural join course
where grade is null and cname = 'Information Technology for Information Management';

-- 11st
use school;
select sum(ccredit),sname
from  student natural join sc natural join course
where sdept = 'computer science'
group by sno;


-- 12nd
use school;
select avg(grade) as av,sname
from student natural join sc natural join course
group by sno
having  av >  (select avg(grade) 
from student natural join sc natural join course) ;

-- 13rd
use school;
select avg(grade) as av,sname
from student natural join sc natural join course
where ssex = 'male'
group by sno
having  av >  (select avg(grade) 
from student natural join sc natural join course
where ssex = 'female') 

-- 14th
use school;
select sname
from student as a
where a.sage >= (select max(sage) from student where sdept = 'computer science');

use school;
select sname 
from student as a
where a.sage >= all(select (sage) from student where sdept = 'computer science');


-- 15th
use school;
select sname
from student natural join sc natural join course
where grade <60
group by sname
having count(sname) = 1

