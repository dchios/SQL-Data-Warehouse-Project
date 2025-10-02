USE Datawarehouse;

CREATE TABLE bronze.crm_cust_info (
      cst_id NVARCHAR (50),
      cst_key NVARCHAR (50),
      cst_firstname NVARCHAR (50),
      cst_lastname NVARCHAR (50),
      cst_marital_status NVARCHAR (50),
      cst_gndr NVARCHAR (50),
      cst_create_date DATE  
); 

ALTER TABLE bronze.crm_cust_info
ALTER COLUMN cst_id INT;

CREATE TABLE bronze.crm_prd_info (
      prd_id INT,
      prd_key NVARCHAR (50),
      prd_nm NVARCHAR (50),
      prd_cost INT,
      prd_line NVARCHAR (50),
      prd_start_dt DATE,
      prd_end_dt DATE
);

BEGIN TRANSACTION;

ALTER TABLE bronze.crm_prd_info
ALTER COLUMN prd_start_dt DATETIME;

ALTER TABLE bronze.crm_prd_info
ALTER COLUMN prd_end_dt DATETIME;

COMMIT;

CREATE TABLE bronze.crm_sales_details (
      sls_ord_num NVARCHAR (50),
      sls_prd_key NVARCHAR (50),
      sls_cust_id INT,
      sls_order_dt DATE,
      sls_ship_dt DATE,
      sls_due_dt DATE,
      sls_sales INT,
      sls_quantity INT,
      sls_price INT
);

ALTER TABLE bronze.crm_sales_details
DROP COLUMN sls_order_dt;

ALTER TABLE bronze.crm_sales_details
ADD sls_order_dt INT;

ALTER TABLE bronze.crm_sales_details
DROP COLUMN sls_ship_dt;

ALTER TABLE bronze.crm_sales_details
ADD sls_ship_dt INT;

ALTER TABLE bronze.crm_sales_details
DROP COLUMN sls_due_dt;

ALTER TABLE bronze.crm_sales_details
ADD sls_due_dt INT;

CREATE TABLE bronze.erp_cust_az12 (
      cid NVARCHAR (50),
      bdate DATE,
      gen NVARCHAR (50) 
); 

CREATE TABLE bronze.erp_loc_a101 (
      cid NVARCHAR (50),
      cntry NVARCHAR (50) 
); 

CREATE TABLE bronze.erp_px_cat_g1v2 (
      id INT,
      cat NVARCHAR (50),
      subcat NVARCHAR (50),
      maintenance NVARCHAR (50)
); 


ALTER TABLE bronze.erp_px_cat_g1v2
ALTER COLUMN id NVARCHAR;

