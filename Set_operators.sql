-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains set operators in postgres.
  
  
  					Union -> Combines the result sets of two or more SELECT queries into one, removing duplicate rows.
  					
  					Union all -> Same as UNION, but keeps all rows, including duplicates.
  					
  					Intersect -> returns only rows that appear in both result sets.
  					
  					Except -> returns rows from the first query that do not appear in the second (like a "set difference").

  					
  					

  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select * from employeedata e ;

select * from employee_projects ep ;

--------------------------------------

-- Union 

select emp_id from employeedata

union

select emp_id from employee_projects ep 

--------------------------------------

-- Union all 


select emp_id from employeedata

union all

select emp_id from employee_projects ep ;


--------------------------------------

-- Intersect  


select emp_id from employeedata

intersect 

select emp_id from employee_projects ep ;


--------------------------------------


-- Except

select emp_id from employeedata

except 

select emp_id from employee_projects ep ;
