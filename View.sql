
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains Views in postgres
  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
 
-- What a view is: a saved SQL query that acts like a virtual table — it doesn't store data itself, just the query definition. 
-- Every time you select from it, it re-runs the underlying query.

select * from employeedata e ;

select * from employee_projects ep ;

---- cretating view

create view empproject_summary as 
select 
	e.emp_id,
	e.fname,
	e.email,
	e.dept ,
	e.salary,
	coalesce(ep.project_id::text, 'unknown') as project_id,
	coalesce(ep.project_name, 'unknown') as project_name,
	coalesce(ep.project_role, 'unknown') as project_roles
from employeedata e
left join employee_projects ep 
on e.emp_id = ep.emp_id

select * from empproject_summary es ;

--- droping view

drop view empproject_summary ;