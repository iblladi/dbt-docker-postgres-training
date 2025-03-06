{{ config(materialized='table', schema='dbt') }}

{% set departments = dbt_utils.get_column_values(table=ref('stg_psql_department'), column='dept_name') %}

{% set pivot_query %}
SELECT
    {% for department in departments %}
        SUM(CASE WHEN d.dept_name = '{{department}}' THEN 1 ELSE 0 END) AS "{{department}}" {% if not loop.last %} , {% endif %}
    {% endfor %}
FROM
    {{ ref('stg_psql_employees') }} e
JOIN
    {{ ref('stg_psql_employees_department') }} ed ON e.id = ed.employee_id
JOIN
    {{ ref('stg_psql_department') }} d ON ed.department_id = d.id
{% endset %}

{{ pivot_query }}