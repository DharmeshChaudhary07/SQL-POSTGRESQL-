-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
 
  In this script contains CTEs and Recursive CTEs
  
  
  			-- Common table expression 
  				1. Basic CTE query
  				2. Complex CTE query
  				3. mutilple query
  				
  			for optimizing query use 
  			
  			-- MATERIALIZED
  			        — forces Postgres to run the CTE once, save the result in a temporary storage and delete after done running the query
  			       and reuse that saved result wherever the CTE is referenced later in the query.
  			       
  			       
  			       WITH cte_name AS MATERIALIZED (
  			           -- Your temporary query goes here
   				 		SELECT column1, column2 
    					FROM table_name
  			 	 		WHERE condition
			 	   )
					   -- Main query uses cte
					    SELECT * 
                        FROM cte_name;
                        
               ----------------------------------         
  			  
  			-- NOt MATERIALIZED
  				    — tells Postgres to treat the CTE like a subquery — 
  				    it gets "inlined" directly into the main query, and the optimizer can rearrange/optimize it together with the rest 
  				    of the query.
  				    
  				   WITH cte_name AS NOT MATERIALIZED (
  			           -- Your temporary query goes here
   				 		SELECT column1, column2 
    					FROM table_name
  			 	 		WHERE condition
			 	   )
					   -- Main query uses cte
					    SELECT * 
                        FROM cte_name;
  				    
  				----------------------------------
  				
  				  			  			
  				    	    
  			-- Recusrive CTEs
  					- it's a query that calls itself repeatedly to build up a result, one step at a time — like a loop.
  			

                           
              
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

/* A CTE is a named temporary result set you define with WITH, then reference like a table in the main query. Mainly used for readability
  			   - breaking complex query into readable logical steps.
  			   
  			  -- syntax 
  			  
  			  WITH cte_name AS (
   			 	 -- Your temporary query goes here
   				 SELECT column1, column2 
    			 FROM table_name
  			 	 WHERE condition
			  )
			  -- Main query uses cte
			  SELECT * 
              FROM cte_name;
              
*/
  			  
------------------------------




-- basics query

with cte_employee as 
	(
		select * from employeedata
	)

select 
	fname, 
	dept, 
	salary 
from cte_employee;

------------------------------

-- a bit complex query

with deptavg as
	(
		select 
			e.dept , 
			avg(e.salary) as avgsal
		from employeedata e 
		group by e.dept 
	)

select 
	*
from employeedata e 
join deptavg as da
on e.dept = da.dept
where e.salary > da.avgsal;

------------------------------

-- multiple CTES

with deptavg as (				--cte 1
    select dept, AVG(salary) as avgsal
    from employeedata
    group by dept
),
highearners as ( 				--cte2
    select e.fname, e.dept, e.salary
    from employeedata e
    join deptavg d 
    on e.dept = d.dept
    where e.salary > d.avgsal
)
`
SELECT * FROM highearners;



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- MATERIALIZED

WITH dept_avg AS MATERIALIZED (
    SELECT dept, AVG(salary) AS avg_salary
    FROM employeedata
    GROUP BY dept
)
SELECT e.fname, e.dept, e.salary, d.avg_salary
FROM employeedata e
JOIN dept_avg d ON e.dept = d.dept
WHERE e.salary > d.avg_salary
   OR e.salary < d.avg_salary * 0.8;

-----------------------------

WITH high_salary AS NOT MATERIALIZED (
    SELECT emp_id, fname, salary
    FROM employeedata
    WHERE salary > 50000
)
SELECT h.fname, h.salary, p.project_name
FROM high_salary h
JOIN employee_projects p ON h.emp_id = p.emp_id;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- recursive cte


-- simple example

with recursive counter as (
	select 1 as num
	
	union all
	
	select num + 1 from counter
	where num < 10
)
select * from counter;

-----------------------------

with recursive counter as (
	select 10 as num
	
	union all
	
	select num - 1 from counter
	where num > 1
)
select * from counter;

------------------------------


with recursive hiredata as (
	select emp_id ,fname, salary, extract(year from hire_date):: int as yrdata
	from employeedata
	where emp_id = 1
	
	union all
	
	select emp_id, fname ,salary, yrdata + 1
	from hiredata
	where yrdata < 2026
)

select * from hiredata;



