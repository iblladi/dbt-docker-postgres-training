{{ config(materialized='view') }}

SELECT * FROM employees.department
ORDER BY id ASC 