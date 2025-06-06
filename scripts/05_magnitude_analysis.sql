/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/


-- Find total customers by countries
SELECT country,
COUNT(customer_id) AS Total_Customers
FROM [dbo].[gold.dim_customers]
GROUP BY country
ORDER BY Total_Customers DESC;

-- Find total customers by gender
SELECT gender,
COUNT(customer_id) AS Total_Customers
FROM [dbo].[gold.dim_customers]
GROUP BY gender
ORDER BY Total_Customers DESC;


-- Find total products by category
SELECT category,
COUNT(product_key) AS Total_Products
FROM [dbo].[gold.dim_products]
GROUP BY category
ORDER BY Total_Products DESC;

-- What is the average costs in each category?

SELECT 
category,
AVG(cost) AS Average_Cost
FROM [dbo].[gold.dim_products]
GROUP BY category
ORDER BY Average_Cost DESC;


-- What is the total revenue generated for each category?

SELECT 
p.category,
sum(f.sales_amount) AS total_revenue
FROM [dbo].[gold.fact_sales] f
LEFT JOIN [dbo].[gold.dim_products] p
ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

-- What is the total revenue generated by each customer?

SELECT 
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) AS total_revenue
FROM [dbo].[gold.fact_sales] f
LEFT JOIN [dbo].[gold.dim_customers] c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC;

-- What is the distribution of sold items across countries?

SELECT 
c.country,
sum(f.quantity) AS total_sold_items
FROM [dbo].[gold.fact_sales] f
LEFT JOIN [dbo].[gold.dim_customers] c
ON f.customer_key = c.customer_key
GROUP BY c.country 
ORDER BY total_sold_items DESC;