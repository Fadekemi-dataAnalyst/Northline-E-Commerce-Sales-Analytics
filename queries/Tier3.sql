-- ===========================================
--TIER 3
-- ===========================================

---CUSTOMERS WHO HAS NEVER PLACED ORDER
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


---TOP 3 HIGHEST REVENUE PRODUCTS

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.item_price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT TOP 3
    product_id,
    product_name,
    total_revenue
FROM product_revenue
ORDER BY total_revenue DESC;


---PERCENTAGE OF ORDERS THAT WERE RETURNED
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN status = 'returned' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS pct_returned
FROM orders;


---CUSTOMERS TOTAL LIFETIME SPEND
WITH customer_spend AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.item_price) AS total_spend
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT
    customer_id,
    total_spend
FROM customer_spend
WHERE total_spend > 100
ORDER BY total_spend DESC;.
