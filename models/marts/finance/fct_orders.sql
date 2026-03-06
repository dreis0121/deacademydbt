
with orders as ( 

    select * from {{ ref('stg_jaffle_shop_orders') }}

),

payments AS (
    select * from {{ ref('stg_stripe_payments') }}
),

order_payments AS (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount
    from payments
    group by 1
),

final as (
    SELECT
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount
    from orders
    left join order_payments using(order_id)
)

SELECT * FROM final