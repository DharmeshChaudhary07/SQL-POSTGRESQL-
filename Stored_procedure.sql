-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains stored procedure in postgres.
  
  -- Stored routine -> A reusable block of code that is saved directly inside the database server. 
  					   Custom function that combines multiple database action so we dont have to write individual queries one by one
  					   
  -- Type of stored procedure 
  			1. Stored Procedure
  			2. USer defined function
  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
 
Stored Procedure ->  Set of sql statements and procedural logic that can perform operations such as inserting deleting and quering data.

	-- syntax 
	
CREATE OR REPLACE PROCEDURE procedure_name (parameter_name parameter_type, ...)
LANGUAGE plpgsql
AS $$

BEGIN
-- procedural code here
END;

$$;

 */
-----------------------------

select * from employeedata e ;

-- procedure

create or replace procedure raise_emp(p_emp_id int, p_amount numeric)
language plpgsql
as $$

begin
	update employeedata
	set salary = salary + p_amount
	where emp_id = p_emp_id;
end;
$$;

-- calling the procedure

call raise_emp(7, 10000);


select * from employeedata e 

----------------------------------

select * from employee_projects ep ;

-- create procedure

create or replace procedure rolescorrection (oldrole varchar(100), newrole varchar(100))
language plpgsql
as $$
begin
	update employee_projects 
	set project_role = newrole
	where project_role = oldrole;
end;
$$;


-- call procedure

call rolescorrection('Developer', 'SDE1')

select * from employee_projects ep ;
-----------------------------

-------------------------------------------------------------------------------------------

/*

  User define function -> Custom function created by the user to perform specific operations and return a value.
  
	-- syntax 
	
CREATE OR REPLACE FUNGJION function_name(parameters)
RETURNS return_type AS $$
BEGIN

-- Function body (SQL statements)
RETURN some_value;
-- For scalar functions
END;
$$ LANGUAGE plpgsql;


*/
-----------------------------

-- simplest example create function

create or replace function cal_bonus(p_salary numeric)
returns numeric
language plpgsql
as $$
begin
	return p_salary * 0.10;
end;
$$;

-- calling function

SELECT cal_bonus(50000);

-----------------------------


-- create function

create or replace function salary_grade(p_salary numeric)
returns varchar(40)
language plpgsql
as $$
begin
	return
	case
		when p_salary >= 60000 then 'High'
		when p_salary >= 50000 then 'Medium'
		else 'Low'
	end;
end;
$$;

select salary_grade(60000);
select salary_grade(58000);
select salary_grade(48000);

-----------------------------
