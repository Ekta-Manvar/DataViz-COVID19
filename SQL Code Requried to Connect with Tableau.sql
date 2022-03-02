SELECT d.continent AS Continent, 
         CASE d.location 
		    WHEN 'United States' THEN 'US'
			WHEN 'United Kingdom' THEN 'UK'
			ELSE d.location
		 END
		 AS Country, 
        d.date AS Date, d.population AS Population, 
         ISNULL(d.new_cases,0) AS New_Cases, 
         ISNULL(d.new_deaths, 0) AS New_Deaths,  
         ISNULL(d.hosp_patients,0) AS Hospitalized, 
         ISNULL(d.icu_patients,0) AS ICU_Patients, 
         ISNULL(v.total_vaccinations,0) AS Total_Vaccinations, 
         ISNULL(v.people_vaccinated,0) AS People_Vaccinated, 
	     ISNULL(v.people_fully_vaccinated,0) AS People_Fully_Vaccinated, 
         ISNULL(v.total_boosters,0) AS Total_Boosters
  FROM portfolio.dbo.CovidDeaths d
  JOIN portfolio.dbo.CovidVaccinations v
  ON d.date=v.date and d.location=v.location
  WHERE d.continent is not null