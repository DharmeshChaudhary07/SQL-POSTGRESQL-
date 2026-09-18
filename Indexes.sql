-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains Indexes in postgres.
  
  
  					Indexes:
  					
  					A separate structure that lets Postgres find rows faster, without scanning the whole table.
  					eg. book and index page in book
  					
  					Basic Syntax -> 
  					
  						CREATE INDEX idx_employeedata_dept
  						ON employeedata (dept);
  						
  					When to add index ->
  					
  						1. Columns you frequently filter on (WHERE)
						2. Columns you frequently join on
						3. Columns you frequently sort by (ORDER BY)
						
  					## indexes speed up reads but slow down writes (INSERT/UPDATE/DELETE) ##
  					
					------------------------------
					

											
					Types of indexes:
					1. Index METHOD (the actual data structure/algorithm Postgres uses internally) — this is the real, fixed list. 
					   There are only 6 in Postgres:
									1. B-tree
									2. Hash
									3. GIN
									4. GiST
									5. SP-GiST
									6. BRIN

					2. Index USAGE PATTERN (how you're applying an index, regardless of which method it uses) — this is a separate, informal way people talk about indexes:

									Unique → a constraint added on top of any method (usually B-tree)
									Composite → just means "more than one column" — works with any method
									Partial → just means "add a WHERE clause" — works with any method
		
																								
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

--- creating index 

CREATE INDEX idx_employeedata_dept
ON employeedata (dept);


-- droping index 

drop index idx_employeedata_dept


-- check which indexes are present 
SELECT *
FROM pg_indexes

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- INDEX METHODS — basic syntax

----------------------------------------

-- 1. B-TREE (default — most common, fits employeedata naturally)

CREATE INDEX idx_salary ON employeedata (salary);

-- Good for salary > 50000, salary BETWEEN x AND y, ORDER BY salary

----------------------------------------

-- 2. HASH (only exact equality — rare, but syntax-wise fits fine)

CREATE INDEX idx_dept_hash ON employeedata USING HASH (dept);

-- Only helps: WHERE dept = 'IT'
-- Does NOT help: dept > 'H', ORDER BY dept, BETWEEN, etc.
-- In practice: almost never chosen over B-tree, since B-tree does equality too, PLUS ranges/sorting.

----------------------------------------

-- 3. GIN (needs "container" data — arrays/JSONB/text search; employeedata has none of these natively)
-- Doesn't fit employeedata as-is. Shown using employee_meta (your JSONB table) instead:

CREATE INDEX idx_details_gin ON employee_meta USING GIN (details);

-- If employeedata had an array column (e.g. skills TEXT[]), it'd look like:
-- CREATE INDEX idx_skills_gin ON employeedata USING GIN (skills);

----------------------------------------

-- 4. GiST (needs spatial/range/geometric data — employeedata has none)
-- Contrived example: pretend hire_date was a date RANGE instead of a single date

CREATE TABLE employee_tenure (
    emp_id INT,
    active_period DATERANGE
);

CREATE INDEX idx_tenure_gist ON employee_tenure USING GIST (active_period);

-- Real use: overlap checks, e.g. "was this employee active during this date range?"

----------------------------------------

-- 5. SP-GiST (needs clustered/non-balanced data — phone numbers, IPs, GIS; employeedata's email/phone COULD fit loosely)

CREATE INDEX idx_email_spgist ON employeedata USING SPGIST (email);
-- Realistic real-world use case instead: IP address or phone number ranges, not really emails.
-- Syntax is correct, but this specific example is a stretch — SP-GiST is rarely the right pick here.

----------------------------------------

-- 6. BRIN (needs a huge table with physically-ordered data — hire_date is the best-fit column you have)
CREATE INDEX idx_hire_date_brin ON employeedata USING BRIN (hire_date);
-- Only genuinely useful once employeedata has millions of rows inserted in date order.
-- On your current 11-row table, this creates fine but gives zero real benefit.


-------------------------------------------------------------------------------------------
-- MODIFIERS — apply on top of ANY method above
-------------------------------------------------------------------------------------------

-- A. UNIQUE — no duplicate values allowed
CREATE UNIQUE INDEX idx_email_unique ON employeedata (email);
-- IMPORTANT: this also acts as a constraint — inserting a duplicate email will ERROR.
-- PRIMARY KEY and UNIQUE columns get this automatically — you don't need to add it manually for those.


-- B. COMPOSITE — index on 2+ columns together
CREATE INDEX idx_dept_salary ON employeedata (dept, salary);
-- IMPORTANT: column ORDER matters.
--   Good for: WHERE dept = 'IT' AND salary > 50000   (uses both columns)
--   Good for: WHERE dept = 'IT'                       (uses only the first column)
--   NOT good for: WHERE salary > 50000 alone           (can't skip to the 2nd column)
-- Rule: put the column you filter on MOST OFTEN / most selectively FIRST.


-- C. PARTIAL — only indexes rows matching a WHERE condition

CREATE INDEX idx_high_earners ON employeedata (salary)
WHERE salary > 55000;

-- IMPORTANT: only helps queries whose WHERE clause matches (or is a subset of) the index's condition.
--   Uses it:     WHERE salary > 55000 AND dept = 'IT'
--   Doesn't use: WHERE salary > 40000   (outside the indexed condition)
--sSmaller and faster than a full index — but only IF your queries consistently use that same filter.


-------------------------------------------------------------------------------------------
-- THE 3 MOST IMPORTANT THINGS TO REMEMBER OVERALL
-------------------------------------------------------------------------------------------
/*
  1. B-tree is your default 95% of the time. Only reach for GIN/GiST/SP-GiST/BRIN
     when your data/query pattern SPECIFICALLY calls for it (JSON, spatial, huge+ordered).

  2. Indexes speed up READS but slow down WRITES (INSERT/UPDATE/DELETE), because every index must also be updated on every write.
     Don't over-index a table that's written to constantly.

  3. Always verify an index is ACTUALLY being used with EXPLAIN ANALYZE.
     On small tables (like your 11-row employeedata), Postgres will often ignore your index and do a Seq Scan anyway — that's correc
     behavior, not a bug, since a full scan is genuinely faster on tiny data.
*/

