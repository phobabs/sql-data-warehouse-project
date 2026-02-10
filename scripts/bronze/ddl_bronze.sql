

/*
====================================================

DDL Script: Create Bronze Layer Tables

====================================================
Script Purpose:
  This script creates tables in the 'Bronze' schema, dropping existing tables
  if they already exist.
  Run this script to re-define the DDL structure of 'Bronze' Tables 

===================================
--DATA DEFINITION LANGUAGE
====================================

	Creating tables
*/

IF OBJECT_ID ('bronze.crm_cust_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info  (
	cst_id INT,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_material_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date DATE
);

IF OBJECT_ID ('bronze.crm_prod_info' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_prod_info;

CREATE TABLE bronze.crm_prod_info (
prd_id  INT,
prd_key NVARCHAR(50),
prd_nm  nvarchar(50),
prod_cost  INT,
prd_line nvarchar(50),
prod_start_dt  DATETIME,
prod_end_dt DATETIME
);

IF OBJECT_ID ('bronze.crm_sales_details' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);


IF OBJECT_ID ('bronze.erp_loc_a101' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50)
);



IF OBJECT_ID ('bronze.erp_px_cat_giv2' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_giv2;

CREATE TABLE bronze.erp_px_cat_giv2(
	id nvarchar(50),
	cat nvarchar(50),
	subcat nvarchar(50),
	maintenance nvarchar(50)
);

IF OBJECT_ID ('bronze.erp_cust_az12' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12(
	cid nvarchar(50),
	bdate DATE,
	gen nvarchar(50)
);
