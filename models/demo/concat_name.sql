{{ 
    config
    ( 
        materialized='table'
    )
}}




-- select concat('John',' ','Smith') as name


-- We use macro instead of using above
select {{ concat_macro('John','Smith') }} as name
