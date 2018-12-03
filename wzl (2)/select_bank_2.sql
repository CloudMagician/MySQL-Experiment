

-- 1st (same as 1.4)
use bank;
select distinct(customer_name)
from depositor inner join borrower 
using(customer_name);


-- 2nd

-- 同1-5
use bank;
select *
from borrower
left join
(select customer_name as l_name
 from depositor ) as b
 on borrower.customer_name = b.l_name
where b.l_name is null;



-- 3rd
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



-- 4th
use bank;
select *
from branch
where asset >=(
    select min(asset)
    from branch
    where branch_city = 'Brooklyn'
) and branch_city <> 'Brooklyn'

-- 5th ?? 地点限定?
use bank;
select *
from branch
where asset >=(
    select max(asset)
    from branch
    where branch_city = 'Brooklyn'
) and branch_city <> 'Brooklyn'



-- 6th
use bank;
Select A.customer_name
From depositor as A
Left join account as B
on B. account_number = A.account_number
group by A.customer_name
Having count(distinct(B.branch_name))  = 
(select count(branch_name) from branch where branch_city = 'Brooklyn')


-- 7th
use bank;
create view branch_customer(branch_name,customer_name)
as 
(
    select b.branch_name,a.customer_name
    from depositor as a right join account as b
    using (account_number)
)
select * from branch_customer


-- 8th
use bank;
delete from depositor
where account_number in (
    select account_number
    from account
    where branch_name = 'Perryridge'
)
delete from account
where branch_name = 'Perryridge';

-- 9th
use bank;
delete from depositor
where account_number in (
    select account_number
    from account natural join depositor left join branch
    using (branch_name)
    where branch_city = 'Needham'
)
delete from account
where branch_name in (
    select branch_name
    from branch
    where branch_city = 'Needham'
)


-- 10th ???? 通不过！！！
use bank;
delete from (account) 
where (balance) < (
    select avg(balance)
    from account
);

-- 11th
use bank;
insert into account
values('A-9732', 'Perryridge', 1200)

-- 12th
use bank;
insert into account
values('A-777','Perryridge',null) 

--13th
insert into account
select loan_number,branch_name,200
from loan
where branch_name = 'Perryridge'

insert into depositor
select customer_name,loan_number
from loan join borrower
using (loan_number)
where branch_name = 'Perryridge' 

-- 14th
update account
set balance = case 
when balance > 10000 then balance * 1.06
when balance <= 10000 then balance * 1.05
end

-- 15th
select customer_name
from customer
where customer_street like '%Main%'


--16th
select distinct customer_name
from borrower, loan
where borrower.loan_number = loan.loan_number and
branch_name = 'Perryridge'
order by customer_name