

/*
====================================================
Script to insert data into tables

Data Full load into bronze ayer from raw data source
======================================================

It is always better to create a Store Procedure since we 
a script that is frequently use

*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_batch_time DATETIME, @end_batch_time DATETIME;
	SET @start_batch_time = GETDATE();
	BEGIN TRY
		PRINT '====================================='
		PRINT 'Loading Bronze Layer'
		PRINT '====================================='


		PRINT '--------------------------------------'
		PRINT 'Loading CRM Tables';
		PRINT '---------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into: Bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		--C:\Users\Ahmed.BabalolaLasisi\Desktop
		FROM 'C:\Users\Ahmed.BabalolaLasisi\Desktop\sql_datawarehouse\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds' ;
		PRINT '-------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_prod_info;	
	
		PRINT '>> Inserting Data Into: Bronze.crm_cust_info';
		BULK INSERT bronze.crm_prod_info
		--C:\Users\Ahmed.BabalolaLasisi\Desktop
		FROM 'C:\Users\Ahmed.BabalolaLasisi\Desktop\sql_datawarehouse\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds' ;
		PRINT '-------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;	
	
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Ahmed.BabalolaLasisi\Desktop\sql_datawarehouse\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds' ;
		PRINT '-------------'


		PRINT '--------------------------------------'
		PRINT 'Loading ERP Tables';
		PRINT '---------------------------------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Ahmed.BabalolaLasisi\Desktop\sql_datawarehouse\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds' ;
		PRINT '-------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Ahmed.BabalolaLasisi\Desktop\sql_datawarehouse\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds' ;
		PRINT '-------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_giv2';
		TRUNCATE TABLE bronze.erp_px_cat_giv2;

		PRINT '>> Inserting Data Into: bronze.erp_px_cat_giv2';
		BULK INSERT bronze.erp_px_cat_giv2
		FROM 'C:\Users\Ahmed.BabalolaLasisi\Desktop\sql_datawarehouse\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds' ;
		PRINT '-------------'

		SET @end_batch_time = GETDATE();
		PRINT '================================================'
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '>> Total Loading Duration: '+ CAST(DATEDIFF(second, @start_batch_time, @end_batch_time) AS NVARCHAR) + 'seconds' ;
		PRINT '================================================'
    END TRY
	BEGIN CATCH
		PRINT '================================================'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '================================================'		
	END CATCH
	

END
