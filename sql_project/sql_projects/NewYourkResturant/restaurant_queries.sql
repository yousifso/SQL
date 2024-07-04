-- Retrieve all records from the 'nomnom' table
select *
from nomnom;

-- Select distinct neighborhoods from the 'nomnom' table to see the variety of areas covered
select distinct neighborhood
from nomnom;

-- Select distinct cuisines to identify the types of food available
select distinct cuisine
from nomnom;

-- Retrieve names of all restaurants offering Chinese cuisine
select name
from nomnom
where cuisine = 'Chinese';

-- Select names and reviews of restaurants with a review score greater than 4
select name, review
from nomnom
where review > 4;

-- Retrieve names and prices of Italian restaurants that are in the high price range ($$$)
select name, price
from nomnom
where cuisine = 'Italian' and price = '$$$';

-- Select names of restaurants that include 'meatball' in their name
select name
from nomnom
where name like '%meatball%';

-- Retrieve all records from neighborhoods Midtown, Downtown, or Chinatown
select *
from nomnom
where neighborhood = 'Midtown' OR neighborhood = 'Downtown' OR neighborhood = 'Chinatown';

-- Select names and health ratings of restaurants where the health rating is missing
select name, health
from nomnom
where health IS NULL;

-- Select names and reviews of the top 10 highest-rated restaurants, ordered by review score descending
select name, review
from nomnom
ORDER BY review DESC
LIMIT 10;

-- Classify restaurants by review scores with custom labels using CASE statements
select name,
  CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
  END AS Rating
FROM nomnom;

