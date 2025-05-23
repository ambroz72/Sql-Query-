select * 
from employee_salary 
where first_name = 'Leslie';

select * 
from employee_salary
where salary >= 50000;

select * 
from employee_demographics
where gender ='Male' ;

select * 
from employee_demographics
where birth_date > '1987-03-04' or not gender ='Male';

select *
from employee_demographics
where (first_name = 'leslie' and age= 44) or age >55 ;

select * 
from employee_demographics
where first_name like 'a%';
 
 select * 
 from employee_demographics
 where first_name like 'a___%';
 select *
 from employee_demographics
 where birth_date like '1989%';
 
 # groupby
 
select gender
from employee_demographics
group by gender;

# agreigate fn

select occupation ,salary
from employee_salary
group by occupation, salary ;

# find max age ,avg age and gender

select gender,avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender   ;
 # order by asc /desc
 select * 
 from employee_demographics
 order by first_name desc;
 
 select * 
 from employee_demographics
 order by gender ,age desc;
 
 # colunm number /position number
 
 select * 
  from employee_demographics
  order by 5, 4 ;
  
# having vs where
  select gender ,avg(age)
from employee_demographics
group by gender 
having avg(age) > 40;

# find avg salary of the manager
select occupation, avg(salary) 
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) >75000 ;


# limit and alies
select * 
from employee_demographics
limit 3  ;