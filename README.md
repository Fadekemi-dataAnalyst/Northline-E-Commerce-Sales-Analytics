# Northline E-Commerce Sales Analytics

This project demonstrates how SQL can be used to analyze e-commerce data and generate actionable business insights.

### PROJECT STRUCTURE

- Problem Statement
- Database Schema
- Setup Instructions
- Key Findings


### Problem Statement
This project demonstrates how SQL can be used to solve real business problems in an e-commerce environment. Using Northline's sales data, I analyzed customer purchasing behavior, product performance, and revenue to answer common business questions. The goal was to transform raw transactional data into actionable insights that could help management make informed, data-driven decisions.

### Database Schema
The database consists of five tables: Customers, Orders, Order Items, Products, and Employees. The relationships between these tables are illustrated below.


<img width="1196" height="764" alt="Image" src="https://github.com/user-attachments/assets/72322a3d-51cf-4207-ad21-29fae9dbb103" />


### Setup Instructions

To run this project, follow these steps:

- Clone this repository or download the project files.

- Open Microsoft SQL Server Management Studio (SSMS) and connect to your SQL Server instance.

- Create a new database.

- Open and execute `schema.sql` to create the database tables.

- Open and execute `sample_data.sql` to populate the tables with sample data.

- Navigate to the `queries` folder and execute the SQL files (`Tier1.sql` through `Tier5.sql`) to reproduce the analysis.

- Review the findings in `insights.md` and the ER diagram to understand the database structure and key business insights.


### Key Findings

- **Customer 1 generated $267.88 in revenue across 3 orders, making them the company's highest-value customer.** This highlights the importance of customer retention strategies such as loyalty rewards and personalized offers.

- **Seven out of ten customers (70%) placed only one order, indicating a low repeat purchase rate.** This suggests an opportunity to improve customer retention through follow-up marketing campaigns and loyalty programs.

- **Two customers met the at-risk criteria, having purchased within their first 60 days but not returned in over 90 days.** Targeted re-engagement campaigns could help bring these customers back and reduce customer churn.

For a more detailed explanation of these findings, see **[`insights.md`](insights.md)**.


