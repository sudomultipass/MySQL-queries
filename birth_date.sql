ALTER TABLE 
	customer 
ADD COLUMN 
	birth_date DATE 
GENERATED ALWAYS AS (
	DATE(
		CONCAT_WS(
			'-',
			birth_year,
			CASE 
				WHEN birth_month = 'January' OR birth_month = 'Jan' THEN 01
				WHEN birth_month = 'February' OR birth_month = 'Feb' THEN 02
				WHEN birth_month = 'March' OR birth_month = 'Mar' THEN 03
				WHEN birth_month = 'April' OR birth_month = 'Apr' THEN 04
				WHEN birth_month = 'May' THEN 05
				WHEN birth_month = 'June' OR birth_month = 'Jun' THEN 06
				WHEN birth_month = 'July' OR birth_month = 'Jul' THEN 07
				WHEN birth_month = 'August' OR birth_month = 'Aug' THEN 08
				WHEN birth_month = 'September' OR birth_month = 'Sep' THEN 09
				WHEN birth_month = 'October' OR birth_month = 'Oct' THEN 10
				WHEN birth_month = 'November' OR birth_month = 'Nov' THEN 11
				WHEN birth_month = 'December' OR birth_month = 'Dec' THEN 12
				ELSE 00
			END,
			birth_day
			)
		)
	)
STORED
AFTER 
	last_name;