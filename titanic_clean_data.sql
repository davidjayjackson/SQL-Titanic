USE Titanic
GO

-- Change NULL to -1 In TitanicData

-- UPDATE TitanicData
--	SET Age = 999
--	WHERE Age = -1;


 -- DROP VIEW titanic_clean;

-- CREATE VIEW titanic_clean AS
SELECT
-- Parsed first and last name (title)
	RIGHT(Name,LEN(Name) - CHARINDEX(',',Name)) AS [FirstName],
	LEFT(Name,CHARINDEX(',',Name)-1) AS [LastName],
-- Assign Cabin Class
	CASE Pclass 
	WHEN 1 THEN 'First Class'
	WHEN 2 THEN 'Second Class'
	WHEN 3 THEN 'Third Class'
	ELSE 'Not Recorded'
	END AS 'Cabin Class',
-- Change case for Gender
	CASE Sex
	WHEN 'male' THEN 'Male'
	ELSE 'Female'
	END  'Gender',
-- Create Age group for 5 and 10 years. ceiling
	Age,
	CEILING(Age/5)*5 AS five_year_ceiling,
	CEILING(Age/10)*10 AS ten_year_ceiling,
	SibSp,
	Parch,
-- Family
	(SibSp + Parch +1) AS [FamilySize],
-- Departure Port
	CASE Embarked
	WHEN 'S' THEN 'Southampton'
	WHEN 'Q' THEN 'Queenstown'
	WHEN 'C' THEN 'Cherbourg'
	ELSE 'Not Recorded'
	END  'Embarked',
-- Did person survive?
	CASE Survived
	WHEN 0 THEN 'Died'
	WHEN 1 THEN 'Survived'
	END AS 'Survived',
-- Seperate Hometown and state
RIGHT(Hometown,LEN(Hometown) - CHARINDEX(',',Hometown)) AS [hometown_state_country],
RIGHT(Destination,LEN(Destination) - CHARINDEX(',',Destination)) AS [destination_state_country]

-- Split out state and country

-- LEFT(Hometown,CHARINDEX(',',[hometown])) AS home_state,
-- RIGHT([hometown],LEN([hometown]) - CHARINDEX(',',[hometown])) AS [home_country],
-- LEFT([Destination],CHARINDEX(',',[destination])) AS destination_state,
-- RIGHT([destination],LEN([destination]) - CHARINDEX(',',[destination])) AS [destination_country]
INTO titanic_clean
FROM titanic_dirty;


