/* 
=========================================================================
Crate database and schemas
=========================================================================
Script Purpose : 
This script creates a new datbase "Datawarehouse" and schemas ( Bronze, Silver, Gold ) for demo project in data architecture and engineering
*/


USE master;
GO
-- Create Database "Datawarehouse"
CREATE DATABASE Datawarehouse;
GO

USE Datawarehouse;
GO

  -- Create Schemas 
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
