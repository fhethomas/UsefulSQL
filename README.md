# SQLutils
SQL utilities, frequently used queries/functions

# Useful SQL 

## Find Stored Procedure Using Specific text
```
SELECT
    OBJECT_NAME(id),
    text
FROM
    sys.syscomments 
WHERE
    OBJECTPROPERTY(id, 'IsProcedure') = 1 AND

    text Like '%SearchText%'
```

## Check Exists before drop table

```
IF OBJECT_ID('TableName') IS NOT NULL DROP TABLE Tablename
```

-- or if temp

```
IF OBJECT_ID('tempdb..#TableName') IS NOT NULL DROP TABLE #Tablename
```

## While + Cursor

```
DECLARE @named_variable AS VARCHAR(100)

DECLARE db_cursor FOR 
    SELECT column_name FROM table_name
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @named_variable

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @named_variable
        FETCH NEXT FROM db_cursor INTO @named_variable
    END
CLOSE db_cursor
DEALLCOATE db_cursor
```

## Simple create function

```
dbo.myFunc(@my_arg VARCHAR(7)) RETURNS DECIMAL
    BEGIN
        return (SELECT SUM(my_column1) FROM my_table WHERE my_column2 = @my_arg)
    END
```

## Identify data type

```
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'my_table'
    AND COLUMN_NAME = 'my_column'
```

## CASE WHEN

```
CASE WHEN x > 5 
    THEN
        'x'
    ELSE
        'y'
END
     
```

## Insert into multiple values

```
INSERT INTO #temp_table
VALUES ('A',1),('B',2)

```

## Update

```
UPDATE t
SET t.col1 = 'this'
FROM #table t
WHERE t.col2 = 'that'
```
