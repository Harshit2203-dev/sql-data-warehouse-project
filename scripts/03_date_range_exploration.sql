/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Find the date of the first and last order.

select 
MIN(order_date) as first_Order_date,
MAX(order_date) as last_Order_date
from [dbo].[gold.fact_sales]

-- How many year of the sales are avaiable

select 
MIN(order_date) as first_Order_date,
MAX(order_date) as last_Order_date,
Datediff(year, MIN(order_date), MAX(order_date)) as order_range_year
from [dbo].[gold.fact_sales]

select 
MIN(order_date) as first_Order_date,
MAX(order_date) as last_Order_date,
Datediff(MONTH, MIN(order_date), MAX(order_date)) as order_range_months
from [dbo].[gold.fact_sales]


-- Find the youngest and oldest customer

select 
MIN(birthdate) as oldest_birthdate,
Datediff(year, MIN(birthdate), GETDATE()) as oldest_age,
MAX(birthdate) as youngest_birthdate,
Datediff(year, MAX(birthdate), GETDATE()) as youngest_age
from [dbo].[gold.dim_customers]
