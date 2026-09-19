-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains JSON, JSONB and Indexing it, in postgres
  
  					1. JSON, JSONB 
  					
  							JSON vs JSONB — the key difference
																			JSON							JSONB
									Storage								Exact text copy				Decomposed binary format
									Preserves whitespace/key order?			Yes									No
									Duplicate keys						Keeps all						Keeps last only
									Query speed						Slower (reparses each time)				Faster
									Indexable							Very limited						Yes (GIN)
									Write speed						Slightly faster					Slightly slower (conversion cost)
				
  							use JSONB unless you specifically need to preserve the exact original text. That's the case ~95% of the time.
  							
  						-> querying Jsonb
  						-> filtering jsonb
  						-> Expanding JSON arrays into rows
  						
  					2. Indexing it 


*/

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- 1. JSONB 


-- create jsonb table

CREATE TABLE employee_meta (
    emp_id INT REFERENCES employeedata(emp_id),
    details JSONB
);

-- insert jsonb table

INSERT INTO employee_meta VALUES
    (1, '{"skills": ["SQL", "Python"], "certified": true, "location": {"city": "Sydney", "country": "AU"}}'),
    (2, '{"skills": ["Recruiting"], "certified": false, "location": {"city": "Mumbai", "country": "IN"}}'),
    (3, '{"skills": ["SQL", "AWS", "Docker"], "certified": true, "location": {"city": "Pune", "country": "IN"}}');

select * from employee_meta em 

------------------------------------

-- use ->> when you want a plain value you can compare/filter on; use -> when you need to keep drilling deeper into nested JSON.

-- querying Jsonb

-- ->  returns JSON/JSONB
SELECT details -> 'certified' FROM employee_meta;        -- true (as jsonb)

-- ->> returns TEXT
SELECT details ->> 'certified' FROM employee_meta;       -- "true" (as text)

-- Nested access with ->
SELECT details -> 'location' ->> 'city' FROM employee_meta;   -- Sydney, Mumbai, Pune

-- #> and #>> for path access (array of keys)
SELECT details #>> '{location,city}' FROM employee_meta;      -- Sydney, Mumbai, Pune

SELECT details #>> '{location,country}' FROM employee_meta; 

------------------------------------

-- filtering jsonb


-- Containment: @> ("does this JSONB contain this?")
SELECT * FROM employee_meta
WHERE details @> '{"certified": true}';


-- Key existence: ?
SELECT * FROM employee_meta
WHERE details ? 'skills';


-- Array containment
SELECT * FROM employee_meta
WHERE details -> 'skills' @> '"SQL"';


-- Extract and compare as text
SELECT * FROM employee_meta
WHERE details ->> 'certified' = 'true';


-- Nested value filter
SELECT * FROM employee_meta
WHERE details #>> '{location,country}' = 'IN';

------------------------------------

-- Expanding JSON arrays into rows


SELECT emp_id, skill
FROM employee_meta,
     jsonb_array_elements_text(details -> 'skills') AS skill;


-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
-- 2. Indexing JSONB


/*
  GIN index (default) — supports @>, ?, ?|, ?&
  General-purpose choice. Indexes all keys and values.
*/
CREATE INDEX idx_details_gin ON employee_meta USING GIN (details);


/*
  GIN with jsonb_path_ops — smaller/faster, but ONLY supports @>
  Use if you only ever filter with containment (@>).
*/
CREATE INDEX idx_details_pathops ON employee_meta USING GIN (details jsonb_path_ops);


/*
  B-tree on a specific extracted field — best when you always query ONE key.
  Needs double parentheses — required for expression indexes.
*/
CREATE INDEX idx_details_city ON employee_meta ((details #>> '{location,city}'));


-- Choosing between them:
--   GIN (details)              -> many different keys, use ? and @>
--   GIN (jsonb_path_ops)       -> only @> queries, smaller index
--   B-tree on expression       -> always filter on one specific key


/*
  IMPORTANT GOTCHA:
  A GIN index does NOT help ->> equality comparisons.
  This will IGNORE the GIN index:
      WHERE details ->> 'certified' = 'true'

  Rewrite as containment to actually use the index:
      WHERE details @> '{"certified": true}'
*/

-- Check if an index is actually being used:
EXPLAIN ANALYZE
SELECT * FROM employee_meta WHERE details @> '{"certified": true}';

