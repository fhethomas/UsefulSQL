# SQLutils
SQL utilities, frequently used queries/functions

# Useful SQL 

# Find Stored Procedure Using Specific text

SELECT

    OBJECT_NAME(id),

    text

FROM
    
    sys.syscomments 
    
WHERE

    OBJECTPROPERTY(id, 'IsProcedure') = 1 AND

    text Like '%SearchText%'

# Check Exists before drop table

IF OBJECT_ID('TableName') IS NOT NULL DROP TABLE Tablename

-- or if temp

IF OBJECT_ID('tempdb..#TableName') IS NOT NULL DROP TABLE #Tablename
