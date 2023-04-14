USE world;

# Retrieve all of the information from table city
SELECT * from City;

# Retrieve all of the information from table country
SELECT * from Country;

# How many records city has 
SELECT count(*) FROM City;

# How many rows/record in country
SELECT count(*) FROM Country;

# Get set of records matching some criteria population more than 7 million
SELECT * FROM City WHERE Population > 7000000;

# Get Name and head of state name where population more than 5 million and life expectancy 70
SELECT Name, HeadOfState FROM Country WHERE Population > 5000000 and LifeExpectancy = 70;

# List Name and Population fields from country table that are Caribbean region and Population is 9 million
SELECT Name, Population FROM Country WHERE Region = 'Caribbean' and Population > 9000000;

# Make it descending
SELECT Name, Population FROM Country WHERE Region = 'Caribbean' and Population > 8000000
ORDER BY population desc;

#Give the name and the per capita GNP for those countries a population of at least 200 million and having GNPper capota atleast .005
SELECT Name, GNP/Population as GNPperCapita FROM Country 
WHERE Population > 200000000
having GNPperCapita < 0.005;

# Show the name and population for France, Germany, Italy
SELECT Name, Population FROM Country WHERE Name IN ('France','Germany','Italy');

#A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population and area.
SELECT Name, Population, SurfaceArea FROM Country 
WHERE SurfaceArea > 3000000 or Population > 250000000
ORDER BY Population desc;

# The name of three countries which are least populated among the countries which have at least 40,0000 people
SELECT Name, Population FROM Country
WHERE Population > 400000
ORDER BY Population limit 3;

# Search for population in the last table where Name contains ‘U.S.’
SELECT Name, Population FROM Country
WHERE Name like "%U.S.%";

# Search for records in the Country table where the head of state’s name 'bush'
SELECT Name, HeadOfState, Population FROM Country
WHERE HeadOfState like "%Bush%";

# Search for records in the Country table where the head of state’s name end with 'II'
SELECT Name, HeadOfState, Population FROM Country
WHERE HeadOfState like "%II%";

# Search for records in the Country table where the head of state’s name ends with ‘i’, 
SELECT Name, HeadOfState, Population FROM Country
WHERE HeadOfState like "%i";

# And the country name starts with a ‘U’. 
SELECT Name, HeadOfState, Population FROM Country
WHERE Name like "u%";

# Select the country with the minimum population
SELECT  Name, Population
FROM   City
WHERE  (Population =(SELECT  MIN(Population) AS 'Maximum Population'
                               FROM  City AS City_1));

# Select the city name with the maximum population
SELECT  Name, Population
FROM   City
WHERE  (Population =(SELECT  MAX(Population) AS 'Maximum Population'
                               FROM  City AS City_1));

# Find out the language spoken for the cities started with UZ
Select CountryCode
FROM City
WHERE Name like "UZ%";	# country code for cities starting with UZ is UKR

Select Language
FROM CountryLanguage
WHERE CountryCode like "UKR";