-- ===========================================
--TIER 1
-- ===========================================

---ALL CUSTOMERS FROM NIGERIA
SELECT *
FROM customers
WHERE country = 'Nigeria'
ORDER BY signup_date;


--All products priced above $30, sorted from most to least expensive.
SELECT *
FROM products
WHERE unit_price > 30
ORDER BY unit_price DESC


---TOTAL COMPLETED ORDERS
SELECT COUNT(*) AS Total_Completed_Orders
FROM orders
WHERE status = 'Completed'



---AVERAGE UNIT PRICE
SELECT ROUND(AVG (unit_price),1) AS Avg_Unit_Price
FROM products

