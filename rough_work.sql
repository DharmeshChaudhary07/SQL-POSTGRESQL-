-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains rough exersice / rough workin postgres.
  
  
  					
  					

  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select * from employeedata e ;

---- 

UPDATE employeedata
SET grade = CASE
    WHEN salary >= 60000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END;

---  already made function in stored procedure

UPDATE employeedata
SET grade = salary_grade(salary);