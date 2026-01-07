-- 1) Row Count 

SELECT COUNT(*) 
FROM customer_metrics;

-- 2) Revenue Sanity

-- Total revenue from customer_metrics should match total revenue from transactions_clean for sales with known customers

SELECT
    SUM(total_revenue) AS customer_revenue_sum
FROM customer_metrics;

SELECT
    SUM(line_revenue)
FROM transactions_clean
WHERE is_sale = TRUE
  AND customer_id IS NOT NULL;

-- 3) Spot -check Extremes

SELECT *
FROM customer_metrics
ORDER BY total_revenue DESC
LIMIT 10;
