-- Database may not be case sensitive - please check to ensure correct regex
-- Select row that starts with A-Z letters and is of any length
SELECT *
FROM alphareg
WHERE Alphabetic LIKE '[A-Z]%';

-- Select rows where Alphabetic starts with T and second char is A or W and any length
SELECT *
FROM alphareg
WHERE Alphabetic LIKE '[T][AW]%';

-- Can start with any, then must have a T, then H or W, the O or R, then E or SPACE
SELECT *
FROM alphareg
WHERE Alphabetic LIKE '%[T][HW][OR][E ]%';

-- First char must be A-Z, then anything, then must be T, then H or W, then anything
SELECT *
FROM alphareg
WHERE Alphabetic LIKE '[A-Z]%[T][HW]%';

-- Returns only case matched occurances
SELECT *
FROM alphareg
WHERE Alphabetic COLLATE Latin1_General_BIN LIKE '[a-z]';

-- start lower case, then upper case after gap
SELECT *
FROM alphareg
WHERE Alphabetic COLLATE Latin1_General_BIN LIKE '[a-z]%[A-Z]%';

-- Works the same for numbers
SELECT * 
FROM alphanumreg
WHERE NumData LIKE '[2-5]%'