-- check for unwanted spaces
SELECT *
FROM bronze.crm_sales_details
WHERE sls_ord_num != TRIM (sls_ord_num); 

-- check for null or 0
SELECT sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0;

SELECT NULLIF (sls_order_dt, 0 ) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0;

-- Data Standardization & Consistency
SELECT DISTINCT prd_line 
FROM bronze.crm_prd_info;

SELECT DISTINCT cntry
FROM bronze.erp_loc_a101
ORDER BY cntry ; 

--check for invalid date orders
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- check the input to silver schema
SELECT * 
FROM bronze.crm_prd_info; 

SELECT * 
FROM bronze.crm_sales_details;

-- check for invalid dates (bronze.crm_sales_details)
SELECT NULLIF (sls_order_dt, 0 ) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0;

-- check for invalid dates (bronze.crm_sales_details) OR less than 8 int
SELECT NULLIF (sls_order_dt, 0 ) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0 OR LEN (sls_order_dt) !=8;

-- check for sales, quantity, price ( zero, negative..)
SELECT DISTINCT 
sls_sales,
sls_quantity,
sls_price
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <0 OR sls_quantity <0 OR sls_price <0  
ORDER BY sls_sales,sls_quantity,sls_price ;

-- check for out of renge dates in bronze.erp_cust_az12
SELECT DISTINCT bdate 
FROM bronze.erp_cust_az12 
WHERE bdate < '1924-01-01' OR bdate > GETDATE() ; 

-- Check for Nulls or Duplicates in Primary Key

SELECT * 
FROM bronze.crm_cust_info;

SELECT cst_id,COUNT (*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT (*) > 1 OR cst_id IS NULL; 

-- check for unwanted spaces
SELECT cst_firstname
FROM bronze.crm_cust_info;

SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM (cst_firstname); 

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM (cst_lastname); 

-- Data Stardardization & Consistency 
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info;

-- ( Primary checks in bronze schema and double check by changing to silver schema ) 

SELECT * 
FROM silver.crm_cust_info;

SELECT cst_id,COUNT (*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT (*) > 1 OR cst_id IS NULL; 

-- check for unwanted spaces
SELECT cst_firstname
FROM silver.crm_cust_info;

SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM (cst_firstname); 

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM (cst_lastname); 

-- Data Stardardization & Consistency 
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info;

-- Data Stardardization & Consistency 
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info;
