# SQL Projects

- Project 1: Explore Data in sql using queries on covid 19 dataset.
- Project 2: Data cleaning in sql on Nashville Housing data.
- Project 3: Create SQL database and ER Diagram as well Relational Model. Further data explored using queries.
NB: These projects are just to show demonstration of my database management and sql queries skills.

## Database-exploration

Here we explore the Database by applying sql queries
We extracted two tables contaning information regarding Covid deaths and covid vaccinations 
from original dataset from https://github.com/owid/covid-19-data/tree/master/public/data
using the sql queries we explore the data.

### Covid19 Data exploration queries

1. Select Data that we are going to be starting with

2. Total Cases vs Total Deaths: Shows likelihood of dying if you contract covid in your country

3. Total Cases vs Population: Shows what percentage of population infected with Covid

4. Countries with Highest Infection Rate compared to Population

5. Countries with Highest Death Count per Population

6. BREAKING THINGS DOWN BY CONTINENT: Showing contintents with the highest death count per population

7. GLOBAL NUMBERS

8. Using CTE to perform Calculation on Partition By in previous query

9. Using Temp Table to perform Calculation on Partition By in previous query

10. Creating View to store data for later visualizations

### Tableau Dashboard Covid Dataset


# Data Cleaning

  Using queries to clean the Nashville housing data in SQL
  
## Nashville housing Cleaning data queries.

1. Standardize Date Format

2. Populate Property Address data

3. Breaking out Address into Individual Columns (Address, City, State)

4. Change Y and N to Yes and No in "Sold as Vacant" field

5. Remove Duplicates

6. Delete Unused Columns

## Olympics dataset 

Steps:
- Created ER diagram and Relational table model.
- Build the database
- Explore data with queries.

### Queries for Olympics database:Postgresql database server.

1. Determine the names and number of categories athletes participated in of all athletes having participated in at least 3 categories at Olympic Games.
	 A query that uses an aggregate function in the SELECT, a GROUP BY and a HAVING.

2. Determine the names of the countries where their athletes won medals (gold,silver,bronze). 
	 A query that makes use of NOT IN in a WHERE or HAVING clause.

3. For each Finnish athlete, retrieve his/her name and results and the total number of Finnish athletes with the same results. 
	A query that contains a window function.

4. List names of countries which paticpated in olympics but never host the olympics yet?
	This query result the names of countries from country table which never host the olympics.

5. List the name of countries and the times they represented by thier athletes, 5times or more?
	A Query using agg function and select, grouby, having.

6. For each athlete, determine their country, age and number of athlete with similar age using window function.


