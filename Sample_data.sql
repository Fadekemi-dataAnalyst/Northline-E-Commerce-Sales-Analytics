-- ===========================================
-- Northline E-Commerce Sales Analytics
-- Sample Data Load Script
-- ===========================================

INSERT INTO customers (customer_id, first_name, last_name, email, signup_date, country) VALUES
(1, 'Ada', 'Okoye', 'ada.okoye@mail.com', '2023-01-15', 'Nigeria'),
(2, 'Ben', 'Chukwu', 'ben.c@mail.com', '2023-02-20', 'Nigeria'),
(3, 'Chloe', 'Smith', 'chloe.s@mail.com', '2023-03-05', 'UK'),
(4, 'David', 'Lee', 'david.lee@mail.com', '2023-03-18', 'USA'),
(5, 'Efe', 'Bello', 'efe.bello@mail.com', '2023-05-01', 'Nigeria'),
(6, 'Fatima', 'Yusuf', 'fatima.y@mail.com', '2023-06-10', 'Nigeria'),
(7, 'George', 'Adams', 'george.a@mail.com', '2023-07-22', 'USA'),
(8, 'Hana', 'Kim', 'hana.kim@mail.com', '2023-08-14', 'South Korea'),
(9, 'Ivan', 'Petrov', 'ivan.p@mail.com', '2023-09-09', 'Russia'),
(10, 'Joy', 'Eze', 'joy.eze@mail.com', '2023-10-30', 'Nigeria');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(1, 'Wireless Mouse', 'Electronics', 15.99),
(2, 'Mechanical Keyboard', 'Electronics', 49.99),
(3, 'USB-C Hub', 'Electronics', 24.99),
(4, 'Office Chair', 'Furniture', 129.99),
(5, 'Standing Desk', 'Furniture', 249.99),
(6, 'Notebook Set', 'Stationery', 6.99),
(7, 'Desk Lamp', 'Furniture', 34.99),
(8, 'Bluetooth Speaker', 'Electronics', 39.99),
(9, 'Water Bottle', 'Accessories', 12.99),
(10, 'Backpack', 'Accessories', 44.99);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1, 1, '2023-06-01', 'Completed'),
(2, 2, '2023-06-03', 'Completed'),
(3, 1, '2023-06-15', 'Completed'),
(4, 3, '2023-07-01', 'Returned'),
(5, 4, '2023-07-10', 'Completed'),
(6, 5, '2023-07-20', 'Completed'),
(7, 2, '2023-08-01', 'Completed'),
(8, 6, '2023-08-05', 'Cancelled'),
(9, 7, '2023-08-15', 'Completed'),
(10, 1, '2023-09-01', 'Completed'),
(11, 8, '2023-09-10', 'Completed'),
(12, 9, '2023-09-20', 'Returned'),
(13, 4, '2023-10-01', 'Completed'),
(14, 10, '2023-10-05', 'Completed'),
(15, 5, '2023-11-01', 'Completed');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 2, 15.99),
(2, 1, 6, 3, 6.99),
(3, 2, 2, 1, 49.99),
(4, 3, 4, 1, 129.99),
(5, 4, 5, 1, 249.99),
(6, 5, 3, 2, 24.99),
(7, 6, 8, 1, 39.99),
(8, 7, 1, 1, 15.99),
(9, 7, 9, 2, 12.99),
(10, 8, 7, 1, 34.99),
(11, 9, 10, 1, 44.99),
(12, 10, 2, 1, 49.99),
(13, 10, 6, 5, 6.99),
(14, 11, 4, 2, 129.99),
(15, 12, 5, 1, 249.99),
(16, 13, 8, 2, 39.99),
(17, 14, 9, 3, 12.99),
(18, 15, 1, 1, 15.99),
(19, 15, 3, 1, 24.99);

INSERT INTO employees (employee_id, employee_name, region) VALUES
(1, 'Sarah Johnson', 'West Africa'),
(2, 'Mike Chen', 'North America'),
(3, 'Priya Patel', 'Europe');
