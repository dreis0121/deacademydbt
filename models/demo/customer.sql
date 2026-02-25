

-- If you don't provide a configuration then it will automatically get saved as a 'view' instead of materialized. 

{{
    config
    (
        materialized = 'table'
    )
}}

with customer_src as
(
    select
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE,
    COUNTRY,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS -- this is a new column we are inserting, showing when new record has been inserted
    FROM {{source('customer','CUSTOMER_SRC')}} -- only works when you have it defined in YAML

)
SELECT * FROM customer_src
