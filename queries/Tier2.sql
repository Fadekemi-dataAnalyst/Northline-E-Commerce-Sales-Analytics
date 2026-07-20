-- ===========================================
--TIER 2
-- ===========================================

---CUSTOMERS FULL NAME AND ORDER DATE
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


---TOTAL REVENUE
SELECT order_id,
       SUM(quantity * item_price) AS total_revenue
FROM order_items
GROUP BY order_id;



---TOTAL REVENUE BY PRODUCTS CATEGORY FOR COMPLETED ORDERS
SELECT category,
       SUM(oi.quantity * oi.item_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY category
ORDER BY total_revenue DESC;


---CUSTOMERS THAT PLACED ORDER THE MOST

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_orders DESC;


---PRODUCTS WITH ITS TOTAL UNIT SOLD
SELECT
    p.product_name,
    SUM(ISNULL(oi.quantity, 0)) AS total_units_sold
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

