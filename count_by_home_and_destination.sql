SELECT five_year_ceiling,COUNT(*) As Bins
FROM titanic_clean
GROUP BY five_year_ceiling;

SELECT hometown_state_country,COUNT(hometown_state_country) AS count_by_home_country
FROM Titanic_clean
GROUP BY hometown_state_country 
ORDER BY COUNT(hometown_state_country)DESC;

SELECT destination_state_country,COUNT(destination_state_country) AS count_by_distination
FROM Titanic_clean
GROUP BY destination_state_country
ORDER BY COUNT(destination_state_country)DESC;

SELECT
LEFT(Hometown,CHARINDEX(',',Hometown)) AS home_state,
RIGHT(Hometown,LEN(Hometown) - CHARINDEX(',',Hometown)) AS [home_country],

LEFT(destination,CHARINDEX(',',destination)) AS destination_state,
RIGHT(destination,LEN(destination) - CHARINDEX(',',destination)) AS [destination_country]

FROM titanic_dirty;

SELECT home_state,home_country,destination_country,destination_state
FROM titanic_clean;