-- Lifetime revenue & profit per customer
SELECT
    o.customer_id,
    c.customer_name,
    c.segment,
    c.country,
    c.region,
    SUM(o.sales) AS lifetime_revenue,
    SUM(o.profit) AS lifetime_profit,
    COUNT(DISTINCT o.order_id) AS num_orders,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS last_order_date
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name, c.segment, c.country, c.region
ORDER BY lifetime_revenue DESC;

