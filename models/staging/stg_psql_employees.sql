--config schema does concatenate with the schema configured in .dbt/profiles.yaml
--it overwrites config in dbt_project.yaml
{{ config(materialized='view') }}

SELECT *, 2000 + FLOOR(RANDOM() * 3001) AS salary FROM employees.employee
ORDER BY id ASC 