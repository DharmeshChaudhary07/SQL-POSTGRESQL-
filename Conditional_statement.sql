---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

/*
-- This scrpit consist Conditional statements in postgresql
  		
	syntax ->   case 
					when condition1 then 'do something0'
					when condition2 then 'do something1'
			 		else 'do this'
			 	end 
			  

*/
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

select * from employeedata e 


select 
	*,
	case 
		when e.salary >= 55000 then 'High range'
		when e.salary >= 50000 then 'Mid range'
		else 'Low range'
	end 
from employeedata e ;


select 
	*,
	case 
		when e.dept = 'IT' then 'Tech'
		when e.dept = 'HR' or e.dept = 'Marketing' then 'Management'
		else 'Fin'
	end 
from employeedata e 

