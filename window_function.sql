-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
 
  In this script contains window function
  
     - Aggregate as Window function basic -> SUM(), AVG(), COUNT(), MIN(), MAX()
      
     - Rank function -> 
      					row_number()	-> simply rank 1 to n
      					rank() 			-> e.g. 1,2,2,4
      					dense rank() 	-> e.g. 1,2,2,3
      					NTILE(n)		-> splits table into n part 
      	
      - Value function -> 
      					lag(), 
      					lead(), 
      					first_value(), 
      					last_value(), 
      					nth_value()
      					
      					
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- Window functions basic

   -- Syntax
function_name(...) OVER (
    [PARTITION BY column]
    [ORDER BY column]
)

select * from employeedata e ;

--- sum 

select
	sum(e.salary) over(),
	sum(e.salary) over(partition by e.dept),
	sum(e.salary) over(order by salary desc),
 	sum(e.salary) over(partition by e.dept order by salary asc)
from employeedata e 
group by e.dept , e.salary;

--- avg

select 
	e.dept,
	e.salary,
	AVG(e.salary) over(partition by e.dept)
from employeedata e ;

--- min

select 
	e.dept,
	min(e.salary) over(partition by e.dept)
from employeedata e ;

 
--- max 

select 
	e.dept,
	max(e.salary) over(partition by e.dept)
from employeedata e ;

-- count 

select 
	e.dept,
	count(e.salary) over(partition by e.dept)
from employeedata e ;

-------------------------------------------------------------------------------------------

-- Rank function

-- row_number()

select 
	*,
	row_number() over(),
	row_number() over(partition by e.dept),
	row_number() over(partition by e.dept order by e.salary desc)
from employeedata e 


-- rank()

select 
	*,
	rank() over(),						-- same output
	rank() over(partition by e.dept),   -- as this only slices the data into per-dept windows. But since there's still no ORDER BY inside that window, every row within each dept is also treated as tied.
	rank() over(partition by e.dept order by e.salary desc)
from employeedata e 


-- dense_rank()

select 
	*,											
	dense_rank() over(),									-- same output
	rank() over(partition by e.dept order by e.salary desc) -- as this only slices the data into per-dept windows. But since there's still no ORDER BY inside that window, every row within each dept is also treated as tied.
	rank() over(partition by e.dept order by e.salary desc)
	dense_rank() over(partition by e.dept),
	dense_rank() over(partition by e.dept order by e.salary desc)
from employeedata e 


-- ntile

select 
	*,
	ntile(2) over(),
	ntile(2) over(order by e.salary),
	ntile(3) over(partition by e.dept)
from employeedata e 


--- 
SELECT * FROM (
    SELECT emp_id, fname, dept, salary,
           RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rnk
    FROM employeedata
) ranked
WHERE rnk = 1;

-------------------------------------------------------------------------------------------

---- value function

-- lag/lead -> look at a previous/next row's value without a self-join:


select emp_id, fname, hire_date,
       lag(hire_date) over (order by hire_date)  previous_hire_date,
       lead(hire_date) over (order by hire_date)  next_hire_date
from employeedata;


-- first_value -> pull the first value in the window:

select emp_id, fname, dept, salary,
	first_value(fname) over (partition by dept order by salary DESC) 
from employeedata;


-- last_value ->pull the first value in the window:

select emp_id, fname, dept, salary,
	last_value(fname) over (partition by dept order by salary desc rows between unbounded preceding and unbounded following)
from employeedata;


-- nth_value -> — get the Nth value in the ordered window:

select emp_id, fname, dept, salary,
       nth_value (fname, 2) over (order by salary DESC) AS second_highest
from employeedata;


select emp_id, fname, dept, salary,
       nth_value (fname, 2) over (partition by dept order by salary DESC) AS second_highest
from employeedata;


select emp_id, fname, dept, salary,
       nth_value (fname, 3) over (partition by dept order by salary DESC) AS second_highest
from employeedata;


