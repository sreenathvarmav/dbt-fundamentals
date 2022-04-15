with payments as (
    select * from {{ref('stg_payments')}}
),
orders as (
    select * from {{ref('stg_orders')}}
),
payment_amount as
(
    select order_id,
    SUM(amount) as amount
    from payments
    group by order_id
),

final as (
    select orders.order_id,
    orders.customer_id,
    payment_amount.amount
    from orders
    left join payment_amount using (order_id)
)

select * from final