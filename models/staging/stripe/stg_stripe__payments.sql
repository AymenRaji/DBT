select
    id as payment_id,
    orderid as Order_id,
    paymentmethod as payment_method,
    status,
    amount / 100 as Amount,
    created as created_at
from raw.stripe.payment