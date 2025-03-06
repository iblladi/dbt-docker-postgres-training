{{ config(materialized='view') }}

SELECT * FROM employees.department_employee
ORDER BY employee_id ASC, department_id ASC 