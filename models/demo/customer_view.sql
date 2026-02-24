-- creating a view from customer table to see only country where equal to USA

{{
    config
    (
        materialized = 'view'
    )
}}



SELECT * FROM {{ ref('customer') }} -- This is from right-clicking the customer.sql file and selecting 'Copy as Ref'
WHERE COUNTRY = 'USA'