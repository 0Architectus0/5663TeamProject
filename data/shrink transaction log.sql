USE [Distance_Team11];  
GO  
-- Truncate the log by changing the database recovery model to SIMPLE.  
ALTER DATABASE [Distance_Team11]
SET RECOVERY SIMPLE;  
GO  
-- Shrink the truncated log file to 1 MB.  
DBCC SHRINKFILE ([Distance_Team11_log], 1);  
GO  
-- Reset the database recovery model.  
ALTER DATABASE [Distance_Team11]
SET RECOVERY FULL;  
GO 