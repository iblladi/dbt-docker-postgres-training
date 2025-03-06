--Macros : blocks of code that are reused
{% macro salary_int_to_char_visualization(column_name) %}
   CONCAT({{ column_name }}::text , ' $') AS salary_viz
{% endmacro %}