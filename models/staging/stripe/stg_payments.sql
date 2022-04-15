WITH payments as (
    SELECT 
        ORDERID as order_id,
        AMOUNT
    FROM RAW.STRIPE.PAYMENT
)

SELECT * FROM payments