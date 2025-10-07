-- ====================================
-- ( Checking gold.dim_customers ) 
-- ====================================
-- check for duplicates ( uniqueness of customer_key ) 
SELECT 
  customer_key,
  COUNT (*) AS duplicate_count
FROM gold.dim_customer
GROUP BY customer_key
HAVING COUNT (*) > 1 ; 


-- ====================================
-- ( Checking gold.dim_products ) 
-- ====================================
-- check for duplicates ( uniqueness of product_key ) 
SELECT 
  product_key,
  COUNT (*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT (*) > 1 ;   
  
-- ========================================
-- ( Checking 'gold.fact_sales' ) 
-- ========================================
-- foreign key integrity (Dimensions)
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c 
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p 
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL ; 
