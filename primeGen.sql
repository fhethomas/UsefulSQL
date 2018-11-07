WITH prime AS(SELECT * FROM generate_series(1, 100) prime)
SELECT * FROM prime
	WHERE (prime%2!=0 OR prime=2)
	AND (prime%3!=0 OR prime=3) 
	AND (prime%5!=0 OR prime=5)
	AND (prime%7!=0 OR prime=7)
	AND prime!=1;
