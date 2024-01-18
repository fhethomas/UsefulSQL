-- Create a string of today's date in the format yyyymmdd
DECLARE @todayStr AS VARCHAR(100)


 SET @todayStr = CAST(DATEPART(year, GETDATE()) AS varchar)+ 
	CASE WHEN DATEPART(month, GETDATE())<10
		THEN
			'0'
		ELSE
			''
	END
	
	+ CAST(DATEPART(month, GETDATE()) AS varchar) 
	+ CASE WHEN DATEPART(day, GETDATE())<10
		THEN
			'0'
		ELSE
			''
	END
	
	+ CAST(DATEPART(day, GETDATE()) AS varchar)

SELECT @todayStr;
