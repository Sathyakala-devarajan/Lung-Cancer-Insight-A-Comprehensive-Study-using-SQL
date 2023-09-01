create database lung_cancer;
use lung_cancer;

select * from lung_cancer;

/* TASK – 1: Write an SQL query to solve the given problem statement.
How many values are there in the given dataset */
select count(*) from lung_cancer;


/* Task - 2: Write an SQL query to solve the given problem statement.
Select the average age of individuals in the given dataset */
Select avg(age) from lung_cancer;

/* Task – 3: Write an SQL query to solve the given problem statement.
Select the total count of 'Smokers' in the given dataset */
select count(distinct Smoking_Category) 
from lung_cancer 
where Smoking_Category in ('Heavy Smokers','Light Smokers','Mediocre Smokers');

/* TASK – 4: Write an SQL query to solve the given problem statement.
Select the 'Name', 'Age', and 'Alcohol Category' columns for 'Mediocare Drinkers' */
SELECT Name, Age, Alcohol_Category
FROM lung_cancer
WHERE Alcohol_Category = 'Mediocre Drinkers';

/* TASK – 5: Write an SQL query to solve the given problem statement.
Select the 'Name' and 'Age' of the oldest individual in the given dataset. */
SELECT Name, Age
FROM lung_cancer
ORDER BY Age DESC limit 2;

/* TASK – 6: Write an SQL query to solve the given problem statement.
Select the 'Name' and 'Surname' of individuals whose names start with 'A'. */
select Name, Surname
from lung_cancer
where Name like 'A%';

/* Task – 7: Write an SQL query to solve the given problem statement.
Select the 'Name', 'Age', and 'Alcohol' columns for individuals who are both 'Heavy Smokers' and 'Mediocare Drinkers' */
select Name, Age, Alcohol
from lung_cancer
where Smoking_Category = 'Heavy Smokers' and Alcohol_Category = 'Mediocre Drinkers';

/* Task – 8: Write an SQL query to solve the given problem statement.
Find out the percentage of lung cancer for individuals whose age is greater than 18.
Hint: Result column specifies the cancer detection.
Note : Use 100.0 while finding the percentage. */
SELECT Result,
    COUNT(*) AS Count,
    (COUNT(*) / (SELECT COUNT(*) FROM lung_cancer WHERE Age > 18)) * 100.0 AS Percentage
FROM lung_cancer
WHERE Age > 18
GROUP BY Result;

/* Task – 9: Write an SQL query to solve the given problem statement.
Select the names and ages of individuals whose names contain the word "John". */
select Name, Age 
from lung_cancer
where Name like '%John%';

/* Task – 10: Write an SQL query to solve the given problem statement.
Find the count of people who have lung cancer with different 'Smoking Category'. */
SELECT Smoking_Category,
    COUNT(*) AS Count
FROM lung_cancer
WHERE Result = 1
GROUP BY Smoking_Category
ORDER BY Count DESC;

/* Task – 11: Write an SQL query to solve the given problem statement.
Find the count of people who have lung cancer with different 'Alcohol Category'. */
SELECT
    Alcohol_Category,
    COUNT(*) AS Count_of_Lung_Cancer
FROM lung_cancer
WHERE Result = 1
GROUP BY Alcohol_Category;
