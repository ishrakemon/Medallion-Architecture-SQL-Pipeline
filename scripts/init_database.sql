/*
===========================
Create Data Ware House
===========================

Author: Ishrakuzzaman Emon
Date: June 2024
Description: This script creates a new 'DataWarehouse' after dropping any existing database with the same name.
If the database exists, it is set to SINGLE_USER mode to terminate any active connections before dropping it.
Additionally, it creates three schemas: bronze, silver, and gold for organizing data layers.


WARNING: 
Executing this script will permanently delete the existing 'DataWarehouse' database and all its data.
*/


USE master;
GO

-- Drop the database if it already exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END

CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO

-- Create schemas for data layers
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
