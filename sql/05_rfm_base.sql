-- RFM base table
WITH base AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(sales) AS monetary
    FROM orders
    GROUP BY customer_id
)
SELECT * FROM base;
