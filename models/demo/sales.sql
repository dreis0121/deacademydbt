 -- create an incremental with append to avoid having to constantly recreate entire table whenever we get a new insert
{{
    config
    (
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
}}





with sales_src as
(
    select
    SALE_ID,
    SALE_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    QUANTITY,
    TOTAL_AMOUNT,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
     from {{source('sales','SALES_SRC')}}


 {% if is_incremental() %}
    where CREATED_AT > (select max(INSERT_DTS) from {{this}}) -- If model is incremental then created at must be greater than latest insert date, 'this' = sales model, these are the records it will update
 {% endif %}
)



SELECT * FROM sales_src
