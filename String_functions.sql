-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains 
  
  	 Sring functions in postgresql
  	 
  	 1. Concat
  	 2. ||
  	 3. Length/len
  	 4. Upper
  	 5. Lower
  	 6. Substring/substr
  	 7. Trim
  	 8. Left
  	 9. Right
  	 10.Replace

 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


select * from employeedata e ;

----------------------------------

-- concat-> combine two string.

select 
	concat(fname, lname),
	concat(fname, ' ' ,lname),
	concat(' ', fname , lname),
	fname || lname as name
from employeedata e ;

----------------------------------

-- length -> length of the string.

select 
	length(e.fname ),
	length(e.email)
from employeedata e;

----------------------------------

-- upper -> upper case to string. 
-- lower -> lower case to string.

select 
	upper(e.fname ),
	lower(e.email),
	upper(e.email )
from employeedata e;

----------------------------------

-- substring -> gives the from string n to n.

select 
	SUBSTRING(e.fname, 1, 3)
from employeedata e;

----------------------------------

-- trim -> trim from the left and right side of the string.

select 
	trim(e.fname)
from employeedata e ;

----------------------------------

-- left -> gives the char from the left side upto n.

select 
	left(e.fname, 6)
from employeedata e ;

----------------------------------

-- right -> gives the char from the right side upto n.

select 
	right(e.fname, 6)
from employeedata e ;

----------------------------------

-- replace -> replace the string from 'x' to 'y'

select 
	replace(e.fname ,'a', 'A')
from employeedata e 

----------------------------------
