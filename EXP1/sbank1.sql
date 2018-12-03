use bank;
-- 1st ans
select a.customer_name as names ,a.loan_number as loan_id ,b.amount 
from borrower as a ,loan as b 
where a.loan_number = b.loan_number;

-- 2nd ans
select customer_name as live_in_main
from customer
where customer_street like '%Main%';

-- 3rd ans
(select customer_name
from depositor)
union
(select customer_name
from borrower);

-- 4th ans
select distinct(borrower.customer_name)
from depositor inner join borrower 
on depositor.customer_name = borrower.customer_name;

select distinct(customer_name)
from depositor inner join borrower 
using(customer_name);

select a.customer_name
from (select customer_name from depositor
union all 
select customer_name from borrower) as a
group by a.customer_name
having count(*)>1;


-- 5th ans
-- wrong 
-- (select customer_name
-- from depositor)
-- except
-- (select customer_name
-- from borrower);

-- 差集错了
select customer_name
from depositor
left join
(select customer_name as l_name
 from borrower ) as b
 on depositor.customer_name = b.l_name
where b.l_name is null;





-- 6th
select avg(balance) as ang_balance
from account
where branch_name = 'Perryridge';

-- 7th
select count(*)
from customer;


-- 9th
select branch_name,count(*) as this_branch
from account
group by branch_name;

-- 10th
-- question is false??
select branch_name,sum(balance) as branch_total
from account
group by branch_name
having sum(balance) > 1200;

-- 11st
use bank;
select *
from loan
where amount is null;

-- 12nd
(select customer_name
from depositor)
union
(select customer_name
from borrower);

-- 13rd
select a.customer_name
from (select customer_name from depositor
union all 
select customer_name from borrower) as a
group by a.customer_name
having count(*)>1;

-- 14th
use bank;
select name
from 
(select customer_name as name, branch_name as branch
from borrower natural join loan
union all
select customer_name as name, branch_name as branch
from depositor natural join account  ) as c
where c.branch='Perryridge'
having count(c.branch)>1;







-- 15th
with total(name,assets)as
(select branch_city, sum(asset) 
from branch
group by branch_city),
one(name,assets) as
(select branch_city, sum(asset) 
from branch
group by branch_city
having branch_city = 'Brooklyn') 
select total.name
from total,one
where total.assets > one.assets;

create view total(name,assets)as
(select branch_city, sum(asset) 
from branch
group by branch_city);

create view brooklyn_one(name,assets) as
(select branch_city, sum(asset) 
from branch
group by branch_city
having branch_city = 'Brooklyn') ;

select total.name
from total,brooklyn_one
where total.assets > brooklyn_one.assets;


-- 16th


create view brooklyn_all(name,assets) as
(select branch_city, (asset) 
from branch
where branch_city = 'Brooklyn') ;


select a.branch_name,a.asset
from branch as a
where a.asset > (select min(assets) from brooklyn_all
group by name);







