0---- ---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains triggers in postgres.
  
  
  					Triggers
  						- Triggers are special procedures in a database that automatically execute predefined actions in response 
  						to certain events on a specified table or view.
  						
  						
  

  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

CREATE TABLE salary_log (
    log_id SERIAL PRIMARY KEY,
    emp_id INT,
    message TEXT,
    logged_at TIMESTAMP DEFAULT NOW()
);

-- need somewhere to write the log entries to. This is just a plain table — nothing trigger-related yet.

CREATE OR REPLACE FUNCTION log_salary_change()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO salary_log (emp_id, message)
    VALUES (NEW.emp_id, 'Salary changed to ' || NEW.salary);
    RETURN NEW;
END;
$$;

-- this defines the action — "insert a log row." But right now, nothing calls this function.
-- It just exists, unused, like a tool sitting in a drawer.

CREATE TRIGGER trg_log_salary
AFTER UPDATE OF salary ON employeedata
FOR EACH ROW
EXECUTE FUNCTION log_salary_change();

-- this connects the function to an actual event. It tells Postgres: "Every time someone runs UPDATE ... SET salary = ... on 
-- employeedata, automatically call log_salary_change() — I don't want to remember to do it manually."


UPDATE employeedata SET salary = 55000 WHERE emp_id = 1;




-----

ALTER TABLE employeedata ADD COLUMN grade VARCHAR(40);

SELECT column_name FROM information_schema.columns
WHERE table_name = 'employeedata' AND column_name = 'grade';

UPDATE employeedata SET salary = 55000 WHERE emp_id = 1;
SELECT * FROM salary_log;
SELECT emp_id, fname, salary, grade FROM employeedata WHERE emp_id = 1;

