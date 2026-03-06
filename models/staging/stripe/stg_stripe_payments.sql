select
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    {{ cents_to_dollars("amount") }}  as amount -- stored in cents by default, this stores it as dollars

from {{ source('stripe','payment') }}