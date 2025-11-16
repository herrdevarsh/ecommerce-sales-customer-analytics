-- Monthly revenue and profit
SELECT
    strftime('%Y-%m-01', order_date) AS month,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM orders
GROUP BY month
ORDER BY month;
