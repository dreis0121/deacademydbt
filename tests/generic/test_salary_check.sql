{% test salary_check(model,column_name) %}

select * FROM
{{ model }}
where {{ column_name }} < 10000

{% endtest %}

-- We can now use this test case in the YAML file

