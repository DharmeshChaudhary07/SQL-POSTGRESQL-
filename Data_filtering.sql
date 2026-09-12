
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script we have covered-
  
  Data Refining/ filtering - WHERE, ORDER BY, DISTINCT, LIMIT, LIKE, GROUP BY, HAVING clause
  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- Create database, schema, tables and insert value into table
 
insert into employeedata (emp_id, fname, lname, email, dept, salary, hire_date)
values 
    (1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000, '2020-01-15'),
    (2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000, '2019-03-22'),
    (3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000, '2021-06-01'),
    (4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000, '2018-07-30'),
    (5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000, '2020-11-10'),
    (6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000, '2020-09-25'),
    (7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000, '2019-05-18'),
    (8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000, '2021-02-14'),
    (9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000, '2018-12-03'),
    (10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000, '2020-04-05');



select * from employeedata ;



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select * from employeedata e 
where e.dept = 'IT';


select * from employeedata e 
where e.emp_id = 5;

----------------------------------

select * from employeedata e 
where e.dept = 'IT'
order by e.salary -- default ascending

select * from employeedata e 
where e.dept = 'IT'
order by e.salary desc

----------------------------------

select distinct e.dept 
from employeedata e 

select distinct e.salary 
from employeedata e 

----------------------------------
-- Highest salary in table 

select * from employeedata e 
order by e.salary desc
limit 1

-- confirm by 
select max(e.salary) from employeedata e 



-- lowest salary in table 

select * from employeedata e 
order by e.salary 
limit 1

-- confirm by 
select min(e.salary ) from employeedata e 

----------------------------------

select * from employeedata e 
where e.fname like 'A%'

select * from employeedata e 
where e.fname like 'a%' -- case sensetive wont work 

select * from employeedata e 
where e.fname like '_a%'    -- second letter of word is a 


----------------------------------

select e.dept, max(e.salary) as highest_salary
from employeedata e
group by e.dept;

----------------------------------

select * from employeedata e
group by e.emp_id 
having e.salary < '50000';

select * from employeedata e 
where e.dept = 'IT'
group by e.emp_id 
having e.salary < 50000

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------