-- FIND THE TOTAL ESTABLISHMENTS BY INDUSTRY FOR 2004 THEN DO SAME FOR 2007
-- FIND THE PERCENTAGE DIFFERENCE BETWEEN 2004 AND 2007. 
SELECT 
    naics_code,
    SUM(CASE WHEN year = 2004 THEN establishments ELSE 0 END) AS total_04,
    SUM(CASE WHEN year = 2007 THEN establishments ELSE 0 END) AS total_07,
    ROUND(
        (SUM(CASE WHEN year = 2007 THEN establishments ELSE 0 END) - 
         SUM(CASE WHEN year = 2004 THEN establishments ELSE 0 END)) / 
         SUM(CASE WHEN year = 2004 THEN establishments ELSE 0 END) * 100, 2
    ) AS pct_growth
FROM qcew_2004_2007
GROUP BY naics_code
HAVING total_04 > 0 -- Prevents "division by zero" errors
ORDER BY pct_growth DESC;