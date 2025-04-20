
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/


use [DataWarehouseAnalytics];

SELECT * FROM [dbo].[gold.dim_customers]
SELECT * FROM [dbo].[gold.dim_products]
SELECT * FROM [dbo].[gold.fact_sales]

-- Explore All Countries our customers come from.

SELECT distinct country from [dbo].[gold.dim_customers]

-- Explore All Categories "The major Divisions"

SELECT DISTINCT category, subcategory, product_name FROM [dbo].[gold.dim_products]
ORDER BY 1, 2, 3
