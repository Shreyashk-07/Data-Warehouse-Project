/*
Stored Procedure to Load the data from CSV files into the Bronze Layer Tables.
*/
Create or Alter Procedure Bronze_layer.Load_bronze as
begin
Declare @start_time as datetime,@end_time as datetime;
	set @start_time=getdate();
	begin TRY
		Print '=============================================';
		Print 'Loading Bornze Layer';
		Print '=============================================';
		Print '---------------------------------------------';
		Print 'Loading CRM Tables'
		Print '---------------------------------------------';
		truncate table Bronze_layer.crm_cust_info;
		Bulk Insert Bronze_layer.crm_cust_info
		from 'C:\Users\Parmeshwar Kusumade\OneDrive\Pictures\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		With (
		Firstrow = 2,
		fieldterminator = ',',
		Tablock
		);
		set @end_time=getdate()
		Print'>> Load Duration:' + CAst(datediff(second,@start_time,@end_time)as Nvarchar)+ 'seconds';
		truncate table Bronze_layer.crm_prd_info;
		Bulk Insert Bronze_layer.crm_prd_info
		from 'C:\Users\Parmeshwar Kusumade\OneDrive\Pictures\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		With (
		Firstrow = 2,
		fieldterminator = ',',
		Tablock
		);

		truncate table Bronze_layer.crm_sales_details;
		Bulk Insert Bronze_layer.crm_sales_details
		from 'C:\Users\Parmeshwar Kusumade\OneDrive\Pictures\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		With (
		Firstrow = 2,
		fieldterminator = ',',
		Tablock
		);

		Print '---------------------------------------------';
		Print 'Loading ERP Tables'
		Print '---------------------------------------------';
		truncate table Bronze_layer.erp_loc_a101;
		Bulk Insert Bronze_layer.erp_cust_az12
		from 'C:\Users\Parmeshwar Kusumade\OneDrive\Pictures\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		With (
		Firstrow = 2,
		fieldterminator = ',',
		Tablock
		);
		truncate table Bronze_layer.erp_loc_a101;
		Bulk Insert Bronze_layer.erp_loc_a101
		from 'C:\Users\Parmeshwar Kusumade\OneDrive\Pictures\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		With (
		Firstrow = 2,
		fieldterminator = ',',
		Tablock
		);

		truncate table Bronze_layer.erp_px_cat_g1v2;
		Bulk Insert Bronze_layer.erp_px_cat_g1v2
		from 'C:\Users\Parmeshwar Kusumade\OneDrive\Pictures\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		With (
		Firstrow = 2,
		fieldterminator = ',',
		Tablock
		);
	END TRY
	begin catch

		Print '=============================================';
		Print 'Error occurred loading Bornze Layer';
		Print 'Error Message'+ Error_message();
		Print 'Erro Message'+ Error_number ();
		Print '=============================================';
	end catch
end
