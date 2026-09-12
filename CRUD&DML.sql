

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
/*
                SQL (Structured query langauge)

# Database: A data base is an organised collection of structured data stored on disk.


# DBMS : Database management system is a software that created manages and controls access to database.

what DBMS does:
1. storage (store data on disk efficiently)
2. security (controls the access)
3. concurrency (multiple user at time)
4. Backup and recovery (save and restore data)
5. Data integrity (enforce rules)
6. Query processing (runs sql query)


# Database servers: database server is the machine/process that runs the DBMS software and listens from incoming request.

# Local vs Remote Server:
Type							Meaning								Example
Localhost 				Server runs on your own 			PCLearning/development
Remote Server		 Server runs on another machine			   Production apps
Cloud Server				Hosted online					AWS RDS, Google Cloud SQL

# relational DBMS (RDBMS) : stored in rows and column, and related to each other using shared piece of datalike user_table

# Database vs Schema vs Table
Database = The House
Schema = A Room(e.g., the Kitchen, the Bedroom).
Table = A Closet/Cabinet


# Data types 
-- Text
CHAR(n)        -- fixed length
VARCHAR(n)     -- variable length

-- Numbers
INT            -- whole number
FLOAT          -- decimal
DECIMAL(8,2)   -- precise decimal

-- Date
DATE           -- 2024-01-15
DATETIME       -- 2024-01-15 10:30:00


# Keys & Constraints

PRIMARY KEY   -- uniquely identifies each row
FOREIGN KEY   -- links two tables
NOT NULL      -- cannot be empty
UNIQUE        -- no duplicates
DEFAULT       -- auto fills value
CHECK         -- validates condition
*/
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------


-- This scrpit consist of basics/syntax of 
/*  -- CRUD operations 
 * 
 *  1. Create
 *  2. Read
 *  3. Update
 *  4. Delete
 * 
 *  -- DML
 *  1. Insert into 
 *  2. Drop
 *  3. Alter
 */ 


---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

------------ Create ---------------
create database employeedb;

create schema employeedetail;

create table employeedata(
	emp_id int not null primary key,
	fname varchar(50) not null,
	lname varchar(50) not null,
	email varchar(50) not null unique,
	dept varchar(50),
	salary decimal(8,2) not null,
	hire_date Date not null
);



---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

------------ Insert into table ------------

insert into employeedata (emp_id, fname, lname, email, dept, salary, hire_date)
values 
    (1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000, '2020-01-15'),
    (2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000, '2019-03-22'),
    (3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000, '2021-06-01'),
    (4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000, '2018-07-30');

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

------------ Read ------------
-- reading data from tables --

select * from employeedata e;



------------ Drop ------------

drop table employeedata;



------------ Delete ------------
 
delete from employeedata 
	where dept = 'HR';


------------ Update ------------

update employeedata
	set salary = '67000'
	where emp_id = 1;

