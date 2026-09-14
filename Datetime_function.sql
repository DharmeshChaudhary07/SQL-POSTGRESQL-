---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

/*
-- This scrpit consist date-time functions in postgres 
		
		1. Getting current date/time
		 	 SELECT CURRENT_DATE;           -- e.g. 2026-09-12
			 SELECT CURRENT_TIME;           -- e.g. 14:30:00
			 SELECT CURRENT_TIMESTAMP;      -- e.g. 2026-09-12 14:30:00
			 SELECT NOW();                  -- same as CURRENT_TIMESTAMP
		
		2. Extracting parts of a date
			 SELECT EXTRACT(YEAR FROM order_date) FROM orders;
			 SELECT EXTRACT(MONTH FROM order_date) FROM orders;
			 SELECT EXTRACT(DAY FROM order_date) FROM orders;
   			 SELECT EXTRACT(DOW FROM order_date) FROM orders;   -- day of week (0=Sunday)
   			 
   		3. Formatting dates
   			 SELECT TO_CHAR(order_date, 'YYYY-MM-DD') FROM orders;
 			 SELECT TO_CHAR(order_date, 'Day, DD Month YYYY') FROM orders;
 			 
 		4. Date arithmetic
 			 SELECT order_date + INTERVAL '7 days' FROM orders;
			 SELECT order_date - INTERVAL '1 month' FROM orders;
			 SELECT AGE(order_date) FROM orders;               -- difference from now
			 SELECT AGE(delivery_date, order_date) FROM orders; -- difference between two dates
 		
 		5. Truncating date 
 			 SELECT DATE_TRUNC('month', order_date) FROM orders;
 			 SELECT DATE_TRUNC('year', order_date) FROM orders;
 			 
 		6. Type casting 
 		   	 SELECT order_date::DATE FROM orders;
			 SELECT order_timestamp::TIME FROM orders;
*/
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

select * from employeedata e 


------- Getting current date/time

select 
	*,
	current_date,  		 --- adds column with current date 
	current_time, 		 --- adds column with current time 
	current_timestamp    --- adds column with current date time stamps
from employeedata e 



-------- Extracting parts of a date

select 
	*,
	extract(year from hire_date)::int,
	extract(year from hire_date)::text,
	extract(month from hire_date),
	extract(day from hire_date),
	extract(dow from hire_date)    -- returns day of the week
from employeedata e ;



-------- Formatting dates

select 
	*,
	TO_CHAR(hire_date, 'Day, DD Month YYYY'),  --- breaks into 
	TO_CHAR(hire_date, 'YYYY-MM-DD'),
	TO_CHAR(hire_date, 'MM-DD'),
	TO_CHAR(hire_date, 'DD')
from employeedata e 



-------- Date arithmetic

select 
	*,
	hire_date + interval '7 days' as newjoindate,
	hire_date - interval '1 month' as earlyjoin
from employeedata e 



--------- Truncating date 

select 
	*, 
	DATE_TRUNC('day', hire_date)::DATE,    -- rounds to start of day
	DATE_TRUNC('month', hire_date)::DATE,  -- rounds to start of month
	DATE_TRUNC('year', hire_date)::DATE    -- rounds to start of the year
from employeedata e  


--------- Type casting 

select 
	*,
	e.hire_date::date::text,
	e.hire_date::timestamp::text
from employeedata e 

