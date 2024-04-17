SELECT
    products_id
    ,date_date
    ,orders_id
    ,revenue
    ,quantity
    , CAST(purchase_price AS float64) AS purchase_price
    , ROUND((revenue - CAST(purchase_price AS float64)),2) AS margin
FROM {{ ref("stg_raw__sales") }} AS sales
LEFT JOIN {{ ref("stg_raw__product") }} AS product
ON sales.pdt_id = product.products_id 