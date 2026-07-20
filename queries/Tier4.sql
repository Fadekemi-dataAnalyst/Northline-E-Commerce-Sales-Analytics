-- ===========================================
--TIER 4
-- ===========================================

---RANKING CUSTOMERS BY TOTAL SPEND
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
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS spend_rank
FROM customer_spend
ORDER BY spend_rank;


---RUNNING TOTAL OF SPEND OVER TIME FOR EACH CUSTOMER
WITH order_spend AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        SUM(oi.quantity * oi.item_price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id, o.order_id, o.order_date
)
SELECT
    customer_id,
    order_id,
    order_date,
    order_total,
    SUM(order_total) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM order_spend
ORDER BY customer_id, order_date;



---CUSTOMERS MOST RECENT ORDER USING ROW NUMBER
WITH ranked_orders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        status,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS rn
    FROM orders
)


---MONTH OVER MONTH REVENUE GROWTH
WITH monthly_revenue AS (
    SELECT
        DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1) AS order_month,
        SUM(oi.quantity * oi.item_price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1)
),
revenue_with_lag AS (
    SELECT
        order_month,
        revenue,
        LAG(revenue) OVER (ORDER BY order_month) AS prev_month_revenue
    FROM monthly_revenue
)
SELECT
    order_month,
    revenue,
    prev_month_revenue,
    ROUND(
        100.0 * (revenue - prev_month_revenue) / NULLIF(prev_month_revenue, 0),
        2
    ) AS pct_growth
FROM revenue_with_lag
ORDER BY order_month;


---SEGMENT OF CUSTOMERS INTO FOUR SPEND QUARTILES USING NTILE

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
    total_spend,
    NTILE(4) OVER (ORDER BY total_spend DESC) AS spend_quartile
FROM customer_spend
ORDER BY spend_quartile, total_spend DESC;



