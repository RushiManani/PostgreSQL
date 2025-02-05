CREATE TABLE cars (
  brand VARCHAR(255),
  model VARCHAR(255),
  year INT
);

SELECT * FROM CARS

INSERT INTO CARS
(brand,model,year)
VALUES
('Ford','Mustang',1964)

INSERT INTO cars (brand, model, year)
VALUES
  ('Volvo', 'p1800', 1968),
  ('BMW', 'M1', 1978),
  ('Toyota', 'Celica', 1975);

 SELECT * FROM CARS

 ALTER TABLE CARS
 ADD COLOR VARCHAR(255)

 UPDATE CARS
 SET COLOR='Red'
 WHERE BRAND='Ford'

 UPDATE CARS
 SET COLOR='Blue', Year=1975
 WHERE BRAND='Toyota'

ALTER TABLE cars
ALTER COLUMN color TYPE VARCHAR(30);

-- <> is same as !=
SELECT * FROM cars
WHERE brand <> 'Volvo';

-- Like AND ILike
-- Like is Case sensitive while ILike is case insensitive
SELECT * FROM CARS
WHERE BRAND LIKE 't%'

SELECT * FROM CARS
WHERE BRAND ILIKE 'T%'


SELECT * FROM cars
WHERE brand IN ('Volvo', 'Mercedes');

SELECT * FROM cars
WHERE year BETWEEN 1970 AND 1980;

SELECT * FROM cars
WHERE model IS NOT NULL;



