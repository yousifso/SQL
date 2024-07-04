-- Retrieve the first 10 records from the 'survey' table to preview the data
SELECT *
FROM survey
LIMIT 10;

-- Count the number of unique users per question from the 'survey' table
SELECT question, COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

-- Retrieve the first 5 records from the 'quiz' table to preview the data
SELECT *
FROM quiz
LIMIT 5;

-- Retrieve the first 5 records from the 'home_try_on' table to preview the data
SELECT *
FROM home_try_on
LIMIT 5;

-- Retrieve the first 5 records from the 'purchase' table to preview the data
SELECT *
FROM purchase
LIMIT 5;

-- Join 'quiz', 'home_try_on', and 'purchase' tables to see user engagement across different stages, checking if users participated in home try-on and made a purchase
SELECT DISTINCT q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',  -- Indicates if the user had a home try-on
  h_number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'      -- Indicates if the user made a purchase
FROM quiz q
LEFT JOIN home_try_on h
  ON q.user_id = h.user_id
LEFT JOIN purchase p
  ON p.user_id = q.user_id
LIMIT 5;

