-- Retrieves the first 20 records from the 'stream' table
SELECT * FROM stream LIMIT 20;

-- Retrieves the first 20 records from the 'chat' table
SELECT * FROM chat LIMIT 20;

-- Selects distinct game titles from the 'stream' table
SELECT DISTINCT game FROM stream;

-- Selects distinct channel names from the 'stream' table
SELECT DISTINCT channel FROM stream;

-- Counts and lists viewers per game, sorted by viewer count in descending order
SELECT game, COUNT(*) AS 'viewers' FROM stream GROUP BY 1 ORDER BY 2 DESC;

-- Counts viewers by country for the game 'League of Legends'
SELECT country, COUNT(*) FROM stream WHERE game = 'League of Legends' GROUP BY 1 ORDER BY 2 DESC;

-- Counts appearances of each player in the 'stream' table
SELECT player, COUNT(*) FROM stream GROUP BY 1 ORDER BY 2 DESC;

-- Assigns a genre to each game and counts appearances, sorting by count descending
SELECT game,
 CASE
  WHEN game IN ('Dota 2', 'League of Legends', 'Heroes of the Storm') THEN 'MOBA'
  WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
  WHEN game IN ('DayZ', 'ARK: Survival Evolved') THEN 'Survival'
  ELSE 'Other'
 END AS 'genre',
 COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

-- Retrieves the first 10 timestamps from the 'stream' table
SELECT time FROM stream LIMIT 10;

-- Extracts seconds from time stamps in the 'stream' table
SELECT time, strftime('%S', time) FROM stream GROUP BY 1 LIMIT 20;

-- Counts streams per hour for viewers in the Netherlands
SELECT STRFTIME('%H', time), COUNT(*) FROM stream WHERE country = 'NL' GROUP BY 1;

-- Joins 'stream' and 'chat' tables on device_id and retrieves all joined records
SELECT * FROM stream JOIN chat ON stream.device_id = chat.device_id;
