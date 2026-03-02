{%- macro cents_to_dollars(column_name, decimal=2) -%}

ROUND({{ column_name}} / 100, {{decimal}})

{%- endmacro -%}