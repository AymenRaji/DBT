select
    id as payment_id,
    orderid as Order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, convert it to dollars
    amount / 100 as Amount,
    created as created_at
from {{ source('stripe', 'payment') }} 