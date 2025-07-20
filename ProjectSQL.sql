--Projeto que visa analisar dados de Covid com foco na América do Sul e Brasil--
--Skills usadas: Joins, aggregate functions, entre outros

select location, date, total_cases, total_deaths, population, total_deaths/total_cases as deaths_per_case
from PortfolioProject..CovidDeaths
where continent = 'South America' and total_cases is not null
order by 2, 5 desc

select location, date, total_cases, total_deaths, population, total_deaths/total_cases as deaths_per_case
from PortfolioProject..CovidDeaths
where location = 'Brazil' and total_cases is not null 
order by 2

select d.location, d.date, v.people_vaccinated, v.people_fully_vaccinated, v.total_vaccinations, d.new_cases
from PortfolioProject..CovidDeaths d
join PortfolioProject..CovidVaccinations v on d.date = v.date
where d.continent = 'South America' and v.people_vaccinated is not null
order by 2

select d.location, d.date, v.people_vaccinated, v.people_fully_vaccinated, v.total_vaccinations, d.new_cases
from PortfolioProject..CovidDeaths d
join PortfolioProject..CovidVaccinations v on d.date = v.date
where d.location = 'Brazil' and v.people_vaccinated is not null
order by 2

select location, population, max(total_cases) as peak,  max((total_cases/population))*100 as percentage_of_population_infected
from PortfolioProject..CovidDeaths
where continent = 'South America'
group by location, population
order by percentage_of_population_infected desc

select d.location, d.population, (max(v.people_vaccinated)/d.population)*100 as percentage_of_population_vaccinated
from PortfolioProject..CovidDeaths d
join PortfolioProject..CovidVaccinations v on d.location = v.location
where d.continent = 'South America' and v.people_vaccinated is not null
group by d.location, d.population
order by 3 desc
