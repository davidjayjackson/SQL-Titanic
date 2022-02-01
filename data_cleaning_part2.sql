-- Data/Kaggle: dhttps://www.kaggle.com/pavlofesenko/titanic-extended
-- Author: Pavlo Fesenko (https://www.kaggle.com/pavlofesenko)


SELECT 
s.Lived,
p.Class,
-- Parsed first and last name (title)
	RIGHT(t.Name,LEN(t.Name) - CHARINDEX(',',t.Name)) AS [FirstName],
	LEFT(t.Name,CHARINDEX(',',t.Name)-1) AS [LastName],
t.Sex AS Gender,
t.Age,
-- Creat five and ten you buckets for histograms
CEILING(Age/5)*5 AS five_year_bucket,
CEILING(Age/10)*10 AS ten_year_bucket,
-- Calculate family size
(t.SibSp + t.Parch) +1 AS family_size,
e.DeparturePort,
-- Parse home state and country
RIGHT(t.Hometown,LEN(t.Hometown) - CHARINDEX(',',t.Hometown)) AS [hometown_state_country],
-- Parse destination state country
RIGHT(t.Destination,LEN(t.Destination) - CHARINDEX(',',t.Destination)) AS [destination_state_country]
-- Define new table
INTO titanic_clean
FROM Training t
LEFT JOIN LiveDied s ON t.Survived = s.Survived
LEFT JOIN PassengerClass p ON t.Pclass = p.Pclass
LEFT JOIN Embarked e ON t.Embarked = e.ID