-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
 
  In this script contains subquery
  
  			A query nested inside another query - runs first, and its result is used by the outer query.
  			
  			1. Scalar Subquery (returns a single value).
  			2. Subquery with IN
  			3. Subquery with EXISTS
  			4. Correlated Subquery
  			5. Subquery in FROM (Derived Table)
  			6. Subquery in SELECT (Scalar column)
  			
  			
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select * from employeedata e ;
select * from employee_projects ;

---------------------------------------

-- scalar subquery -> returns the single value

/* TASK : Finds employees earning above the company average. */

select 
	e.emp_id ,
	e.fname ,
	e.dept ,
	e.salary 
from employeedata e
where salary > (select AVG(salary) from employeedata e2);

---------------------------------------

-- subquery with IN

/* TASK : Finds employees who have at least one project with role SDE1. */


select 
	fname,
	dept 
from employeedata 
where emp_id  in (select 
						emp_id  
				 	from employee_projects 
					where project_role = 'SDE1')
					
---------------------------------------				

-- subquery with EXISTS


/* TASK : Finds employees who have any project at all. EXISTS just checks for row existence 
	— usually faster than IN on large datasets since it stops at the first match. */

select 
	e.fname,
	e.dept 
from employeedata e
where exists (select 1 from employee_projects ep  where e.emp_id  = ep.emp_id )


/* TASK : Finds employees with no projects. */

select 
	e.fname,
	e.dept 
from employeedata e
where not exists (select 1 from employee_projects ep  where e.emp_id  = ep.emp_id )
	
---------------------------------------

-- Correlated Subquery

/* TASK : Finds employees earning more than their own department's average (not the company-wide average). */

select
	e.fname ,
	e.dept ,
	e.salary 
from employeedata e 
where e.salary > (select AVG(salary) from employeedata e2 where e.dept = e2.dept);

					
---------------------------------------

-- subquery in FROM -> Treats the subquery result like a temporary table you can filter/select from further.

/* TASK : Find departments whose average salary exceeds 50,000. */

select 
	dept, avgssal 
from (
	select dept , avg(salary) as avgssal 
	from employeedata  
	group by dept
) as deptsumm 
where avgssal > 50000;

-- basic with subquery 

SELECT dept, AVG(salary) AS avg_salary
FROM employeedata
GROUP BY dept
HAVING AVG(salary) > 50000;


---------------------------------------
				
-- subquery in SELECT -> Adds a single repeated value as a column — company average shown next to every row.

/* TASK : Show every employee's own salary next to the overall company average */

---------------------------------------

select 
	fname,
	dept ,
	salary ,
	(select round(avg(salary),2) from employeedata) as avgsalary
from employeedata 

