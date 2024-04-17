SELECT
    margin.orders_id
    ,margin.date_date
    , margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost AS operational_margin
    , margin.quantity
    , margin.revenue
    , margin.purchase_cost
    , margin.margin
    , ship.shipping_fee
    , ship.logcost
    , ship.ship_cost
FROM {{ ref("int_orders_margin") }} AS margin
LEFT JOIN {{ ref("stg_raw__ship") }} AS ship 
    USING(orders_id)
ORDER BY orders_id DESC 
