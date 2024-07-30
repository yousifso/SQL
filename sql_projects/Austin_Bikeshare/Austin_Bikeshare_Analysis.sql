WITH
  -- CTE to find the bike with the highest total trip duration
  longest_used_bike AS (
    SELECT
      bike_id, 
      SUM(duration_minutes) AS trip_duration  -- Summing up all trip durations per bike
    FROM 
      bigquery-public-data.austin_bikeshare.bikeshare_trips
    GROUP BY 
      bike_id
    ORDER BY
      trip_duration DESC
    LIMIT 1  -- Selects only the top bike with the maximum usage
  ) 

-- Query to find the station from which the most-used bike departs most frequently
SELECT
  trips.start_station_id, 
  COUNT(*) AS trip_ct,  -- Counts the number of trips starting from each station
FROM
  longest_used_bike AS longest
INNER JOIN
  bigquery-public-data.austin_bikeshare.bikeshare_trips AS trips
ON longest.bike_id = trips.bike_id  -- Joining on bike_id to filter trips for the longest used bike
GROUP BY
  trips.start_station_id
ORDER BY
  trip_ct DESC
  LIMIT 1  -- Limits the output to the most frequent start station
