-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains 
  
  Aggregate function - count, sum, min, max, avg, 
  
   there are few other aggregate function in the postgresql like 
   
    Statistical -> STDDEV, VARIANCE, MODE, PERCENTILE_CONT, PERCENTILE_DISC
   
    Boolean -> BOOL_AND, BOOL_OR
	
	Collection/aggregation -> ARRAY_AGG, STRING_AGG, JSON_AGG, JSONB_AGG
  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select * from employeedata e 
------------------------------------

select count(*) from employeedata e 

select  
	count(*) 
from employeedata e 
where e.dept = 'IT'

select
	e.dept,
	count(e.dept)
from employeedata e 
group by e.dept 

select 
	count(e.emp_id )
from employeedata e 
where e.salary < 50000

------------------------------------

select sum(e.salary) from employeedata e


select sum(e.salary) 
from employeedata e
where e.dept = 'IT'

select sum(e.salary) 
from employeedata e
where e.dept = 'HR'

------------------------------------

select avg(e.salary) from employeedata e


select avg(e.salary) 
from employeedata e
where e.dept  = 'IT'

select avg(e.salary) 
from employeedata e
where e.dept  = 'HR'

------------------------------------

select max(e.salary) from employeedata e

select max(e.salary) 
from employeedata e
where e.dept  = 'IT'

select max(e.salary) 
from employeedata e
where e.dept  = 'HR'

------------------------------------

select min(e.salary) from employeedata e

select min(e.salary) 
from employeedata e
where e.dept  = 'IT'

select min(e.salary) 
from employeedata e
where e.dept  = 'HR'

------------------------------------
