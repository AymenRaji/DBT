select
    id as payment_id,
    orderid as Order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, convert it to dollars
   {{cents_to_dollar('amount', 10)}} as amount,
    created as created_at
from {{ source('stripe', 'payment') }} 

