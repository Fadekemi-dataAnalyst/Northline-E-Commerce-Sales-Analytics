-- ===========================================
--TIER 5
-- ===========================================

---RECENCY FREQUENCY MONETARY ANALYSIS
WITH customer_orders AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        SUM(oi.quantity * oi.item_price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id, o.order_id, o.order_date
),
rfm AS (
    SELECT
        customer_id,
        DATEDIFF(DAY, MAX(order_date), GETDATE()) AS recency_days,
        COUNT(order_id) AS frequency,
        SUM(order_total) AS monetary
    FROM customer_orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    recency_days,
    frequency,
    monetary
FROM rfm
ORDER BY monetary DESC;


---THOSE WHO ORDERED WITHIN THEIR FIRST 60 DAYS BUT HAVE NOT ORDERED IN THE LAST 90 DAYS
WITH customer_order_dates AS (
    SELECT
        customer_id,
        order_date,
        MIN(order_date) OVER (PARTITION BY customer_id) AS first_order_date,
        MAX(order_date) OVER (PARTITION BY customer_id) AS last_order_date
    FROM orders
),
customer_flags AS (
    SELECT
        customer_id,
        first_order_date,
        last_order_date,
        MAX(CASE
            WHEN order_date <= DATEADD(DAY, 60, first_order_date)
                 AND order_date > first_order_date
            THEN 1 ELSE 0
        END) AS ordered_within_60_days
    FROM customer_order_dates
    GROUP BY customer_id, first_order_date, last_order_date
)
SELECT
    customer_id,
    first_order_date,
    last_order_date,
    DATEDIFF(DAY, last_order_date, GETDATE()) AS days_since_last_order
FROM customer_flags
WHERE ordered_within_60_days = 1
  AND last_order_date < DATEADD(DAY, -90, GETDATE())
ORDER BY days_since_last_order DESC;
