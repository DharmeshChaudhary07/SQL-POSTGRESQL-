

CREATE TABLE employee_projects (
    project_id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES employeedata(emp_id),
    project_name VARCHAR(100),
    project_role VARCHAR(50),
    start_date DATE
);

INSERT INTO employee_projects (emp_id, project_name, project_role, start_date)
VALUES
    (1, 'Inventory System Upgrade', 'Lead Developer', '2021-01-10'),
    (1, 'Network Security Audit', 'Contributor', '2022-03-05'),
    (2, 'Employee Onboarding Revamp', 'Project Owner', '2020-05-12'),
    (3, 'Cloud Migration', 'Lead Developer', '2022-07-19'),
    (4, 'Budget Forecasting Tool', 'Analyst', '2019-11-01'),
    (5, 'Recruitment Portal', 'Project Owner', '2021-02-20'),
    (6, 'Social Media Campaign', 'Lead', '2021-06-15'),
    (7, 'Bug Tracking Dashboard', 'Developer', '2020-08-09'),
    (8, 'API Integration', 'Developer', '2022-01-25'),
    (9, 'Tax Compliance System', 'Analyst', '2020-10-30'),
    (10, 'Marketing Analytics Dashboard', 'Lead', '2022-04-14'),
    (3, 'Internal Tools Revamp', 'Contributor', '2023-01-05');


---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

/*
-- This scrpit consist Joins in postgres 
		
	-> Connecting two tables 
		Types of joins
		 1. Cross join
		 2. Inner join
		 3. Left join
		 4. Right join
		 5. Full join
		 6. Self

*/
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

select * from employeedata e ;

select * from employee_projects ep ;


------ INNER join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
inner join employee_projects p
on e.emp_id = p.emp_id;




------ Left join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
left join employee_projects p
on e.emp_id = p.emp_id;



------ Right join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
right join employee_projects p
on e.emp_id = p.emp_id;



------ Full join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
full join employee_projects p
on e.emp_id = p.emp_id;



------ Cross join


select e.fname, p.project_name
from employeedata e
cross join employee_projects p;


------ Self join

select a.fname AS emp1, b.fname AS emp2, a.dept
from employeedata a
join employeedata b
on a.dept = b.dept and a.emp_id < b.emp_id;


---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

-- Add an employee with NO projects
INSERT INTO employeedata (emp_id, fname, lname, email, dept, salary, hire_date)
VALUES (11, 'Meena', 'Iyer', 'meena.iyer@example.com', 'IT', 49000, '2022-03-01');

select * from employeedata e ;

select * from employee_projects ep ;


------ INNER join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
inner join employee_projects p
on e.emp_id = p.emp_id;




------ Left join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
left join employee_projects p
on e.emp_id = p.emp_id;



------ Right join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
right join employee_projects p
on e.emp_id = p.emp_id;



------ Full join

select e.emp_id, e.fname, e.lname, p.project_name
from employeedata e
full join employee_projects p
on e.emp_id = p.emp_id;



