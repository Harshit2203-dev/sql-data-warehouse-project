/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

select * from [dbo].[gold.fact_sales]

-- Find the total sales 
select sum(sales_amount) AS Total_Sales from [dbo].[gold.fact_sales]

-- Find how many items are sold
select sum(quantity) AS Total_Quantity from [dbo].[gold.fact_sales]

-- Find the average selling price
select avg(price) AS avg_price from [dbo].[gold.fact_sales]

-- Find the Total number of Orders
select count(order_number) AS Total_orders from [dbo].[gold.fact_sales]
select count(distinct order_number) AS Total_orders from [dbo].[gold.fact_sales]

-- Find the total number of products
select count(product_name) AS Total_product from [dbo].[gold.dim_products]
select count(distinct product_name) AS Total_product from [dbo].[gold.dim_products]

-- Find the total number of customers
select count(customer_id) AS Total_customers from [dbo].[gold.dim_customers]

-- Find the total number of customers that has placed an order
select count(distinct customer_key) AS Total_customers from [dbo].[gold.fact_sales]

-- Generate a Report that shows all key metrics of the business

select 'Total Sales' as Measure_name, sum(sales_amount) AS Measure_value from [dbo].[gold.fact_sales]
union all
select 'Total Quantity' as Measure_name, sum(quantity) AS Measure_value from [dbo].[gold.fact_sales]
union all
select 'Average' as Measure_name, avg(price) as Measure_value from [dbo].[gold.fact_sales]
union all
select 'Total No. Orders' as Measure_name, count(distinct order_number) as Measure_value from [dbo].[gold.fact_sales]
union all
select 'Total No. Products' as Measure_name, count(product_name) as Measure_value from [dbo].[gold.dim_products]
union all
select 'Total No. Customers' as Measure_name, count(customer_key) as Measure_value from [dbo].[gold.dim_customers]
