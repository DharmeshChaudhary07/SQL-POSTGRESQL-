-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*
  In this script contains Temporary in postgres.
  
  
  					Temp table
  						- A table that exists only for your current session (or transaction) — it's automatically dropped when the session ends.
  					

  
 */
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


CREATE TEMP TABLE temp_high_earners AS
SELECT emp_id, fname, salary
FROM employeedata
WHERE salary > 50000;


select * from temp_high_earners;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

Temp table vs. view vs. CTE — quick comparison

Temp 								Table									View										CTE
		
Stores actual data?					Yes									No (recalculates)						No (scoped to one query)
		
Reusable across queries?			Yes, within session					 Yes, always							No — one query only

Persists after						No									Yes (permanent)									no
session ends?

Good for					Multi-step scratch work in one session		Reusable saved query, long-term				Breaking up one complex query
