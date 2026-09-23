# SQL-POSTGRESQL-

A collection of PostgreSQL scripts covering core to advanced SQL concepts — built as a hands-on reference and practice repository for working with PostgreSQL.

## 📖 Overview

This repo is organized as a set of standalone `.sql` files, each focused on a specific PostgreSQL topic. It's meant to serve as both a learning log and a quick-reference guide for common SQL patterns and PostgreSQL-specific features.


## 📂 Contents

| File | Topic |
|---|---|
| `CRUD&DML.sql` | Basic CRUD operations and Data Manipulation Language (INSERT, UPDATE, DELETE, SELECT) |
| `Data_filtering.sql` | Filtering rows with `WHERE`, comparison and logical operators |
| `operators.sql` | Arithmetic, comparison, and logical operators in PostgreSQL |
| `Conditional_statement.sql` | `CASE` expressions and conditional logic |
| `Joins.sql` | INNER, LEFT, RIGHT, FULL, and CROSS joins |
| `Subquery.sql` | Subqueries — scalar, correlated, and nested |
| `Set_operators.sql` | `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT` |
| `aggregate_functions.sql` | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` |
| `window_function.sql` | Window functions — `ROW_NUMBER`, `RANK`, `LEAD`/`LAG`, partitions |
| `CTEs.sql` | Common Table Expressions, including recursive CTEs |
| `String_functions.sql` | String manipulation functions (`CONCAT`, `SUBSTRING`, `TRIM`, etc.) |
| `Number&Null_functions.sql` | Numeric functions and NULL-handling (`COALESCE`, `NULLIF`, rounding, etc.) |
| `Datetime_function.sql` | Date and time functions and formatting |
| `Temporary _table.sql` | Temporary tables and their use cases |
| `View.sql` | Creating and using views |
| `Atler_table.sql` | `ALTER TABLE` — modifying schema, columns, and constraints |
| `Indexes.sql` | Creating and using indexes to optimize queries |
| `Explain:Explain_Analyze.sql` | Query planning with `EXPLAIN` and `EXPLAIN ANALYZE` |
| `Stored_procedure.sql` | Stored procedures and PL/pgSQL basics |
| `triggers.sql` | Triggers and trigger functions |
| `JSON:JSONB.sql` | Working with `JSON` and `JSONB` data types |

## 🛠️ Prerequisites

- [PostgreSQL](https://www.postgresql.org/download/) (v13+ recommended)
- A SQL client such as [DBeaver](https://dbeaver.io/), pgAdmin, or `psql`

## 🚀 How to Use

1. Clone the repo:
   ```bash
   git clone https://github.com/DharmeshChaudhary07/SQL-POSTGRESQL-.git
   ```
2. Open any `.sql` file in your preferred SQL client connected to a PostgreSQL instance.
3. Run the queries individually to see each concept in action — most files are self-contained with example tables/data where needed.

## 📌 Notes

This is an evolving reference repo — new topics and examples are added as they're learned and practiced.

## 📄 License

No license specified yet. Feel free to open an issue if you'd like to suggest one.
