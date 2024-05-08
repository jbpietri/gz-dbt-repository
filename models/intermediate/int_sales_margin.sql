select
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    CAST(purchase_price AS FLOAT64),
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64)) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
    FROM {{ref("stg_source1__sales")}} AS s 
    LEFT JOIN {{ref("stg_source1__product")}} AS p 
    USING (products_id)
