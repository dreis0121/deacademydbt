select
    id as order_id,
    user_id as customer_id,
    order_date,
    status AS order_status

from {{ source('jaffle_shop','orders') }}