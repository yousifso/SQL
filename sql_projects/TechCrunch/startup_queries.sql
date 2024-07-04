-- Retrieve all records from the 'startups' table
select *
from startups;

-- Count the total number of companies listed in the 'startups' table
select count(*) as 'total nbr of companies'
from startups;

-- Calculate the total valuation of all companies
select sum(valuation) as 'total value'
from startups;

-- Find the highest amount raised by any company in the 'Seed' stage
select max(raised) as 'highest rasied'
from startups
where stage = 'Seed';

-- Retrieve the name of the company and the earliest founding year across all records
select name, min(founded)
from startups;

-- Calculate the average valuation of all companies
select avg(valuation) as 'average valuation'
from startups;

-- Calculate the average valuation per category and sort these averages in descending order
select category, round(avg(valuation), 2) as 'average valuation'
from startups
group by 1
order by 2 desc;

-- Count the number of companies in each category where there are more than 3 companies, sorted by count in descending order
select category, count(*)
from startups
group by 1
having count(*) > 3
order by 2 desc;

-- Calculate the average number of employees per location for locations with an average of more than 500 employees, sorted in descending order
select location, avg(employees)
from startups
group by 1
having avg(employees) > 500
order by 2 desc;
