-- This is ephemeral so if you build it, it won't show up in the data warehouse, we have to create another model for reference(final_orders)
 

{{
    config
    (
        materialized = 'ephemeral'
    )
}}




WITH base_orders AS (
    SELECT
      ORDER_ID,
    ORDER_DATE,
    CUSTOMER_ID,
    CASE WHEN CUSTOMER_NAME is null then 'N/A' else upper(CUSTOMER_NAME) end as CUSTOMER_NAME,
    CREATED_AT
    from {{source('orders','BASE_ORDERS')}}
    WHERE ORDER_DATE IS NOT NULL
)

SELECT * FROM base_orders
