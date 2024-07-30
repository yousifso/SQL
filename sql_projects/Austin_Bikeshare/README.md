# Austin Bikeshare Analysis

## Project Overview
This project utilizes public bikeshare data from Austin, Texas, to identify the bike that has been used the most in terms of total trip duration. Further analysis determines the most common departure station for this bike.

## Tools Used
- SQL
- Google BigQuery

## Files
- `longest_used_bike_analysis.sql`: Contains the SQL queries used for the analysis.

## Analysis Details
The SQL script includes a common table expression (CTE) that calculates the total duration each bike was used. It then identifies the bike with the maximum usage. Subsequently, the script finds the most frequent starting station for this particular bike using an INNER JOIN between the `bikeshare_trips` table and the CTE.

## Purpose
The purpose of this analysis is to help city planners and the bikeshare program understand bike usage patterns, which can assist in making decisions about bike distribution and maintenance schedules.

## How to Run
1. Import the SQL file into your Google BigQuery environment.
2. Execute the query to view the results.

Feel free to explore the data further or adapt the queries for different insights related to bikeshare usage patterns in Austin.

