-- select all column
select * 
from customers ;

--  select specficcolumn
select first_name , city
from customers;
 
 -- filter condition 
 
 select * from serviceplan order by MonthlyFee desc;
 
 -- sort by range
 select * from callusage where DurationSeconds between 1 and 100 ;
 
 -- find null values
 select * from subscription where EndDate is null ;
  -- find not null values
 select * from subscription where EndDate is not null ;
 
 -- remove duplicate values
 select distinct Status from subscription ;
 
 -- count record
 select count(*) from customer ;
 
 -- sum of column values
 select sum(AmountPaid) from payment;
  
  -- find max values
  select max(AmountPaid) from payment ;
  
  -- find minmum values
  select min(Amountpaid) from payment ;
  
  -- calculate avg
  select avg(Amountpaid) from payment ;
  
  -- grouping
  select amountpaid,firstname00 from payment group by 1 ;
  
  -- group by sum
  select amountpaid ,sum(amountpaid) from payment group by 1 having sum(AmountPaid) ;
  
  -- using having
  select amountpaid,sum(amountpaid) from payment group by 1 having sum(AmountPaid) >500;
  
  -- subquereies in where find max data used
  select * from datausage where DataUsedMB in (select Max(DataUsedMB) from datausage ) ;
  
-- using with
select *, count(*) as AmountPaid from payment group by 1 ;
select FullName,PhoneNumber,count(*) from customer group by 1,2; 

--- join INNER
select t1.FullName,t2.AmountPaid
from customer t1
inner join payment t2 on t1.CustomerId = t2.PaymentID ;

 --- LEFT join
 
select t1.FullName,Email,t2.AmountPaid
from customer t1
left join payment t2 on t1.CustomerID=t2.PaymentID ;

-- self join
-- find customer and their payments
select t1.FullName as Name , t2.AmountPaid as Amount
from customer t1
left join payment t2
on t1.CustomerID = t2.PaymentID;

-- cross join
select t1.FullName , t2.Email , t3.Address
from customer t1
cross join customer t2
cross join customer t3
limit 10;

-- using rank
select FullName,Gender,
RANK() 
over(order by Gender DESC)
as GenderRank
from customer ;

-- using dense_rank
select FullName,Gender,
DENSE_RANK() 
over(order by Gender DESC)
as GenderRank
from customer ;

-- ROW number

select FullName,Gender,
row_number()
over(order by Gender DESC)
as GenderRank
from customer ;

-- #string function
select concat(FullName,Gender)
From customer;

-- string length
 select length(FullName)
 from customer;
 
 -- substring
 select substring(Fullname,1,3)
 from customer;
 
 -- upper and lower case
 select upper(Gender),lower(FullName)
 from customer;
 
 -- # data function
 select * from payment
 where PaymentDate=current_date() ;
 
 -- extract year
 select extract(Year from PaymentDate)
 from payment ;
 
 -- date_diff
 select SessionStart, SessionEnd, DataUsedMB,
 DATEDIFF(SessionEnd , SessionStart)  as SessionDays
 from datausage;
 
 -- INTERVAL
 select PaymentID,AmountPaid,PaymentDate,
 Date_ADD(PaymentDate, Interval 7 day) as new_date
 from payment ;

 