select
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount /100  as amount -- stored in cents by default, this stores it as dollars

from {{ source('stripe','payment') }}