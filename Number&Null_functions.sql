
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains Null functions and Numnber functions 
  
		1. Number function
			- round
			- ceil
			- floor
			- trunc
			- abs
			- mod
			- power
			- sqrt
			
		2. Null function
		
		
		

 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
 
----- Number function

select * from employeedata e ;

select round(salary, 2) from employeedata e ;  -- round to 2 decimal places


select round(salary) from employeedata e ;     -- round to nearest whole number

select ceil(salary) from employeedata e;            -- round UP to nearest integer

select floor(salary) from employeedata e ;           -- round DOWN to nearest integer

select trunc(salary, 1) FROM employeedata e;        -- cut off decimals (no rounding)

select abs(-50000) from employeedata e ;             -- absolute value (removes sign)

select mod(salary, 101) from employeedata e;       -- remainder (same as salary % 1000)

select power(2, 3) from employeedata e;             -- 2^3 = 8
select power(2, 4) from employeedata e;

select sqrt(salary) from employeedata e;            -- square root


----- Null function 


--- coalesce

select coalesce(salary, 0) from employeedata e    -- replace null with 0



--- nullif

select nullif(dept, 'Unknown') from employeedata e;  -- Returns NULL if the two values are equal, otherwise returns the first value. 
													 -- Useful to convert a placeholder ("Unknown", 0, empty string) into a true NULL.


--- is null/ is not null 

select * from employeedata where dept IS NULL;
select * from employeedata where dept IS NOT NULL;


---------------------


