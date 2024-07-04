-- Retrieve all records from the 'trips' table
select * from trips;

-- Retrieve all records from the 'riders' table
select * from riders;

-- Retrieve all records from the 'cars' table
select * from cars;

-- Join 'riders' and 'cars' tables and select first and last names of riders along with the car models
select riders.first, riders.last, cars.model
from riders, cars;

-- Perform a left join to combine 'trips' with 'riders' based on rider ID and retrieve all columns
select *
from trips
left join riders
  on trips.rider_id = riders.id;

-- Perform an inner join to combine 'trips' with 'cars' based on car ID and retrieve all columns
select *
from trips
join cars
  on trips.car_id = cars.id;

-- Union the data from 'riders' table with another table 'riders2' to consolidate similar records
select *
from riders
union
select *
from riders2;

-- Calculate the average cost for all trips
select avg(cost) as 'avg cost for a trip'
from trips;

-- Group riders by ID and filter to only show those with fewer than 500 total trips
select id, total_trips
from riders
group by 1
having total_trips < 500;

-- Select all active cars from the 'cars' table
select *
from cars
where status = 'active';

-- Retrieve all cars, order them by the number of trips completed, and limit the result to the top 2
select *
from cars
order by trips_completed desc
limit 2;
