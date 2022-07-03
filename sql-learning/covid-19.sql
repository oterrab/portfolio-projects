UPDATE CovidDeaths
SET date = DATE(STR_TO_DATE(date, '%d/%m/%Y'));

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
where continent is not null
order by location, date;

-- Looking at total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths
where continent is not null
order by location, date;

-- Looking at total cases vs population
select location, date, population, total_cases, (total_cases/population)*100 as Infection
from CovidDeaths
where continent is not null
order by location, date;

-- Looking at Countries with Highest infection rate compared to population overall
-- Ideia: comparar com governos negacionistas ou não

select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as
    PercentPopulationInfected
from CovidDeaths
where continent is not null
group by location, population
order by PercentPopulationInfected DESC;

select location, date, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as
    PercentPopulationInfected
from CovidDeaths
where continent is not null
group by location, population, date
order by PercentPopulationInfected DESC;

-- Showing the countries with Highest Death Count per Population

select location, max(cast(total_deaths as unsigned)) as TotalDeathCount
from CovidDeaths
where continent is not null
group by location, population
order by TotalDeathCount DESC;

-- Showing the continents with Highest Death Count per Population

select location, max(cast(total_deaths as unsigned)) as TotalDeathCount
from CovidDeaths
where continent is null
and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount DESC;

-- Showing the global death percentage per date

select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(CovidDeaths.new_deaths)/sum(CovidDeaths.new_cases))*100 as DeathPercentage
from CovidDeaths
where continent is not null
group by date
order by 1, 2;

-- Showing the global death percentage total

select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(CovidDeaths.new_deaths)/sum(CovidDeaths.new_cases))*100 as DeathPercentage
from CovidDeaths
where continent is not null
order by 1, 2;

-- Working with both datasets

select * from CovidVaccinations;

UPDATE CovidVaccinations
SET date = DATE(STR_TO_DATE(date, '%d/%m/%Y'));

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(vac.new_vaccinations as unsigned)) OVER( PARTITION BY dea.location order by dea.location, dea.date) as rollingvac
from CovidDeaths dea
join CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
order by 2, 3;

-- USING Common Table Expression (CTE)

With PopvsVac (Continent, Location, Date, Population, new_vaccinations, rollingvac)
    as
(select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(vac.new_vaccinations as unsigned)) OVER( PARTITION BY dea.location order by dea.location, dea.date) as rollingvac
from CovidDeaths dea
join CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
)

select *, (rollingvac/population)*100 as rollingvacvspop
from PopvsVac;

-- TEMP Table

drop table if exists percentpopulationvaccinated
create table percentpopulationvaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
new_vaccinations numeric,
rollingvac numeric
)

insert into percentpopulationvaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(vac.new_vaccinations as unsigned)) OVER( PARTITION BY dea.location order by dea.location, dea.date) as rollingvac
from CovidDeaths dea
join CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null

select *, (rollingvac/population)*100 as rollingvacvspop
from percentpopulationvaccinated;

-- create view for data visualization later

create view PercentPopulationVaccinatedview as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(vac.new_vaccinations as unsigned)) OVER( PARTITION BY dea.location order by dea.location, dea.date) as rollingvac
from CovidDeaths dea
join CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null;

drop table if exists percentpopulationvaccinated;
select * from PercentPopulationVaccinatedview;