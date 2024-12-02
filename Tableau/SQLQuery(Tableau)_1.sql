# Queries for tableau project
--1
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_Cases)*100 as DeathPercentage
From coviddeathdata
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2
--2
-- Just a double check based on the data provided
-- The Second includes  the "International"  Location
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From coviddeathdata
WHERE location = 'World'
Group By date
order by 1,2
-- EUROPEAN UNION IS PART OF EUROPE
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From coviddeathdata
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc
--3
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddeathdata
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc
--4
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddeathdata
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc


