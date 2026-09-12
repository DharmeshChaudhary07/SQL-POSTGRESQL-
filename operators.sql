-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains 
  
  Operators - Relational and Logica
  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

---------------- Relational Operators ----------------

-- Equal to (=)
select * from employeedata e 
where dept = 'IT';

-- Not equal to (<> or !=)
select * from employeedata e 
where dept <> 'IT';

-- Greater than (>)
select * from employeedata e 
where salary > 50000;

-- Less than (<)
select * from employeedata e
where salary < 50000;

-- Greater than or equal to (>=)
select * from employeedata e
where salary >= 50000;

-- Less than or equal to (<=)
select * from employeedata e
where salary <= 50000;

---------------- Logical Operators ----------------

-- AND - both must be true
select * from employeedata e
where dept = 'IT' and salary > 50000;

-- OR - either can be true
select * from employeedata e
where dept = 'IT' or dept = 'HR';

-- NOT 
select * from employeedata e
where not dept = 'IT';

-- BETWEEN - range, inclusive
select * from employeedata e
where salary between 45000 and 55000;

-- IN - matches any value in a list
select * from employeedata e
where dept in ('IT', 'HR');

-- NOT IN - excludes values in a list
select * from employeedata e
where dept not in ('IT', 'HR');

-- LIKE - pattern matching
select * from employeedata e
where fname like 'R%';

-- IS NULL / IS NOT NULL
select * from employeedata e
where dept is null;

select * from employeedata e
where dept is not null;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select *
from employeedata e
where e.dept in ('IT', 'HR')             
  and e.salary between 40000 and 60000         
  and e.fname like '%a%'                          
  and e.dept is not null                         
  and (e.salary > 45000 or e.hire_date < '2020-01-01')  
  and not e.lname = 'Verma';                     
