CREATE TABLE family (
  id  INTEGER,
  name  TEXT,
  birthday  DATE
);

INSERT INTO family (id, name, birthday
)
VALUES (1, 'Yousif gurma', '1991-06-06');
INSERT INTO family (id, name, birthday
)
VALUES (2, 'Maxime gurma', '1992-12-29');
INSERT INTO family (id, name, birthday
)
VALUES (3, 'Amal gurma', '2021-08-11');

INSERT INTO family (id, name, birthday
)
VALUES (3, 'Malik gurma', '2022-11-24');

UPDATE family
SET name = 'Storm'
WHERE id = 1;

UPDATE family
SET name = 'wind'
WHERE id = 2;

UPDATE family
SET birthday = "1992-11-27"
WHERE id = 2;

ALTER TABLE family
ADD COLUMN email TEXT;

ALTER TABLE family
ADD COLUMN phone INTEGER;

UPDATE family
SET email = 'yousif_hse@yahoo.com'
WHERE id = 1;

DELETE FROM family
WHERE id = 1;

SELECT *
FROM family;
