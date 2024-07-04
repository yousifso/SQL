-- Calculate the running average temperature for each state over the years
SELECT state, year, tempf,
AVG(tempf) OVER (
  PARTITION BY state
  ORDER BY year
) AS running_avg_temp
FROM state_climate;

-- Determine the lowest recorded temperature for each state across all years
SELECT state, year, tempf,
FIRST_VALUE(tempf) OVER (
  PARTITION BY state
  ORDER BY tempf
) AS lowest_temp
FROM state_climate;

-- Determine the highest recorded temperature (in Celsius) for each state across all years
SELECT state, year, tempc,
LAST_VALUE(tempc) OVER (
  PARTITION BY state
  ORDER BY tempc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS highest_tempc
FROM state_climate;

-- Calculate the change in temperature from the previous record within each state
SELECT state, year, tempc,
   LAG(tempc, 1, -1) OVER (
     PARTITION BY state
     ORDER BY tempc
   ) AS change_in_temp
   FROM state_climate
   ORDER BY change_in_temp DESC;

-- Rank states within each year by their recorded temperatures to identify the coldest
SELECT year, state, tempf,
   RANK() OVER (
     PARTITION BY year
     ORDER BY tempf DESC
   ) AS coldest_rank
   FROM state_climate;

-- Assign each temperature record to a quartile within each state based on descending temperature
SELECT 
 NTILE(4) OVER (
  PARTITION BY state
  ORDER BY tempf DESC
) AS quartile, year, state, tempf
FROM state_climate;

-- Assign each temperature record to a quintile across all states based on descending temperature
SELECT 
 NTILE(5) OVER (
  ORDER BY tempf DESC
) AS quintile, year, state, tempf
FROM state_climate;

