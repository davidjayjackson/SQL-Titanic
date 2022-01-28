USE Titanic
GO

-- Histogram of Ages
-- YouTube: https://youtu.be/BU31YbPjXzo
-- Author: Kenneth Truong

-- Histrogram for 5 Year Bins(Ceiling)
DROP VIEW five_year_bins
CREATE VIEW five_year_bins AS
SELECT CEILING(Age/5)*5 AS five_years,
COUNT(*) AS Bin
FROM titanic_clean
GROUP BY CEILING(Age/5)*5;
-- ORDER BY CEILING(Age/5)*5;

-- Histrogram with 10 year bins(Ceiling).
DROP VIEW ten_year_bins
CREATE VIEW ten_year_bins AS
SELECT 
CEILING(Age/10)*10 AS ten_years,
COUNT(*) AS Bin
FROM titanic_clean
GROUP BY CEILING(Age/10)*10;

-- 10 Year Age Group by Gender: Male

DROP VIEW ten_year_gender_male;

CREATE VIEW ten_year_gender_male AS
SELECT 
Ceiling(Age/10)*10 AS ten_years_ceiling,
COUNT(*) AS Male
FROM titanic_clean
WHERE Gender ='Male'
GROUP BY ceiling(Age/10)*10;

-- 10 Year Age Group by Gender: Female

DROP VIEW ten_year_gender_female

CREATE VIEW ten_year_gender_female AS
SELECT 
Ceiling(Age/10)*10 AS ten_years_ceiling,
COUNT(*) AS Female
FROM titanic_clean
WHERE Gender ='Female'
GROUP BY ceiling(Age/10)*10;

-- Histogram by age and gender

CREATE VIEW five_year_ceiling_age_gender AS
SELECT Gender,
CEILING(Age/5)*5 AS five_years,
COUNT(*) AS Bin
FROM titanic_clean
GROUP BY Gender,CEILING(Age/5)*5;

SELECT 
Ceiling(Age/10)*10 AS ten_years_ceiling,
COUNT(*) AS Count
FROM titanic_clean
GROUP BY ceiling(Age/10)*10;

-- Count Passengers by Port of Embarkment

-- DROP VIEW port_embarked;

CREATE VIEW port_embarked AS
SELECT
Embarked, COUNT(Embarked) AS 'Passengers Count'
FROM titanic_clean
WHERE [Embarked] != 'NULL'
GROUP BY [Embarked];

-- Count by Gender
-- DROP VIEW gender_count;

CREATE VIEW gender_count AS
SELECT 
[Gender],
COUNT([Gender]) AS [Count_by_Gender]
FROM titanic_clean
GROUP BY [Gender];

-- Passenger Count by Cabin Class

CREATE VIEW class_count AS
SELECT
[Cabin Class],COUNT([Cabin Class]) AS Count_by_Class
FROM titanic_clean
GROUP BY [Cabin Class];

-- Count by Family Size

CREATE VIEW family_size AS
SELECT [FamilySize],COUNT([FamilySize]) AS count_by_family
FROM titanic_clean
GROUP BY [FamilySize];

-- Count by Survived or Died

CREATE VIEW survived_count AS
SELECT
[Survived],COUNT([Survived]) AS survived_count
FROM titanic_clean
GROUP BY [Survived];

-- Count by Age and Cabin Class

CREATE VIEW count_age_cabin AS
SELECT
[Age],[Cabin Class],COUNT(*) AS count_age_cabin
FROM titanic_clean
GROUP BY [Age],[Cabin Class];

-- Count by Age and Survival

CREATE VIEW count_age_survived AS
SELECT
[Age],[Survived],COUNT(*) AS count_age_survived
FROM titanic_clean
GROUP BY [Age],[Survived];



	