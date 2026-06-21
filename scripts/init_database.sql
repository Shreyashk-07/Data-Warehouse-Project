-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA Bronze_layer;
GO

CREATE SCHEMA Silver_layer;
GO

CREATE SCHEMA Gold_layer;
GO
-- Used to check schema is present in DB or not
SELECT schema_name
FROM information_schema.schemata;

