/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW titanic_dirty AS
SELECT TOP (1000) [PassengerId]
      ,[Survived]
      ,[Pclass]
      ,[Name]
      ,[Sex]
      ,[Age]
      ,[SibSp]
      ,[Parch]
      ,[Ticket]
      ,[Fare]
      ,[Cabin]
      ,[Embarked]
      ,[Hometown]
      ,[Destination]
        FROM [Titanic].[dbo].[titanic_complete];