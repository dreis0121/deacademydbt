{{
    config
    (
        database = 'ANALYTICS',
        materialized = 'table'
    )
}}


with payments as(
 select * from {{ ref("stg_stripe_payments")}}
 where status = 'success'
),
final_pivot as (
    select
        order_id,
        {%- set payment_methods = ["bank_transfer", "credit_card", "coupon", "gift_card"] -%}
        {% for payment_method in payment_methods %}
          sum(CASE WHEN payment_method = '{{payment_method}}' THEN amount ELSE 0 END) AS {{payment_method}}_amount
          {%- if not loop.last -%}, {%- endif -%}
        {% endfor %}
    from payments
    GROUP BY 1
)

SELECT * FROM final_pivot
