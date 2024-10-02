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
DECLARE @named_variable1 AS VARCHAR(100)
DECLARE @named_variable2 AS VARCHAR(100)

DECLARE db_cursor FOR 
    SELECT column_name1, column_name2 FROM table_name
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @named_variable1, @named_variable2

WHILE @@FETCH_STATUS = 0
    BEGIN
        IF(@named_variable1 = 'x') PRINT @named_variable
        FETCH NEXT FROM db_cursor INTO @named_variable1, @named_variable2
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

## Identify data type, Max Length

```
SELECT COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH AS MAX_LENGTH
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

## Add column

```
ALTER TABLE table_name
ADD column_1 VARCHAR(50)
DEFAULT 'default text' WITH VALUES;
```

## Add Primary Key
```
ALTER TABLE table_name
ADD PRIMARY KEY (column_1);
```
## Create Quick Lookup table
```
SELECT * FROM
	(
		VALUES
			('A', 5),
			('B', 4),
			('C', 3),
			('D', 2),
			('E', 1)
	)
		AS lkup(Grade, Score)
```

## Rank
```
RANK() OVER(PARTITION BY MONTH(date_column) ORDER BY score_column DESC)
```

## Get info about table (TSQL)
```
EXEC sp_help 'dbase.dbo.table_name'

SELECT * FROM sys.sql_modules

SELECT * FROM sys.objects
WHERE OBJECTPROPERY(OBJECT_ID,'IsProcedure')
```

## Return Database name 
```
DB_NAME()
```

## Execute SQL for each database
```
EXECUTE sp_MSforeachdb

'USE ?
SELECT s.object_id,
     OBJECT_NAME(s.object_id),
     DB_NAME()
FROM sys.sql_modules s
WHERE s.definition LIKE '%Some Text%'
```

## STRPOS() (PostgreSQL)
Find the matching element of a substring, so you can find where first name matches the substring of a full name and same for last name.
[Full explanation](https://www.w3resource.com/PostgreSQL/strpos-function.php)
```
SELECT  t1.first_name, 
        t1.last_name, 
        t2.credit_limit
FROM customers t1
JOIN (SELECT 
        UPPER(full_name) as full_name, 
        MAX(credit_limit) credit_limit 
    FROM creditTbl 
    GROUP BY full_name) t2 
ON STRPOS(t2.full_name,upper(t1.first_name)) > 0 AND STRPOS(t2.full_name,upper(t1.last_name)) > 0

-- Can also do case insensitive Regex mapping using ~* in postgreSQL

```
