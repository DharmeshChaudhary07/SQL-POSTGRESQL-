-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains 
  
		1. Atler table -> Chnage tables column(drop/add column to table)
						  Changing type (default set not null).
						  Rename column name	
		2. check constraints
		

 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

select * from employeedata e ;

create table person ( 
	name varchar(20), 
	country varchar(20), 
	lastname varchar(20),
	mobileno varchar(15) unique
)

insert into person
values ('raj', 'aus', 'stokes', '61456389424');


select * from person p 

-- add column 

alter table person 
add column citizen varchar(3);

select * from person p 


-- drop column

alter table person 
drop column citizen 


select * from person p 

-----------

insert into person
values ('raj', 'aus', 'stokes');

select * from person p ;

-- change default value null to something 

alter table person
alter column mobileno set default 'unknown';


select * from person p ;

-- rename 

alter table person
rename column mobileno to cellno;

select * from person p ;


