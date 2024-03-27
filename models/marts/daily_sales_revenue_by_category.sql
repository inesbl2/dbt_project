{{ config(materialized='table') }}

select
    a.sale_date,
    b.category,
    sum(a.quantity * b.price) as daily_revenue
from {{ ref('stg_sales') }} a
join {{ ref('stg_products') }} b
on a.product_id = b.product_id
group by a.sale_date, b.category