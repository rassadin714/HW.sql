CREATE TABLE employee(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL
);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Иван', 'Иванов', 'муж', 25), ('Михаил', 'Михайлов', 'муж', 26), ('Илья', 'Пушкин', 'муж', 30);
SELECT * FROM employee;
UPDATE employee SET first_name = 'Петр', last_name ='Петров', age = 65 WHERE id = 3;
SELECT * FROM employee;
DELETE FROM employee WHERE id = 2;
SELECT * FROM employee;
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Максим' , 'Максимо', 'муж', 20), ('Юлия', 'Юлиева', 'жен', 15), ('Антон', 'Антонов', 'муж', 20);
SELECT * FROM employee;
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Михаил', 'Михайлов', 'муж', 26), ('Илья', 'Пушкин', 'муж', 30);
SELECT * FROM employee;
SELECT first_name AS Имя, last_name AS Фамилия
From employee;
SELECT * FROM employee
WHERE age < 30 OR age > 50;
SELECT * FROM employee
WHERE age BETWEEN  30 AND 50;
SELECT * FROM employee
ORDER BY last_name DESC;
SELECT * FROM employee
WHERE first_name LIKE '____%';
UPDATE employee SET first_name = 'Юлия' WHERE id = 8;
UPDATE employee SET first_name = 'Максим' WHERE id = 7;
SELECT first_name AS Имя,
       SUM(age) AS Суммарный_Возраст
From employee GROUP BY Имя;
SELECT first_name AS Имя,
       age AS Самый_юный_возраст
FROM employee
WHERE age = (SELECT MIN(age) FROM employee);
SELECT first_name AS Имя,
       MAX(age) AS Максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY MAX(age);



CREATE TABLE city(
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

ALTER TABLE employee ADD city_id INT;
ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES  city(city_id);

INSERT INTO city (city_name)
VALUES ('Нижний Новгород'), ('Екатеринбург'), ('Уфа'), ('Санкт-Петербург'), ('Сочи'), ('Москва');

UPDATE employee SET city_id = '1' WHERE id = 1;
UPDATE employee SET city_id = '3' WHERE id = 5;
UPDATE employee SET city_id = '4' WHERE id = 4;
UPDATE employee SET city_id = '2' WHERE id = 3;
UPDATE employee SET city_id = '4' WHERE id = 6;
UPDATE employee SET city_id = '1' WHERE id = 7;
UPDATE employee SET city_id = '5' WHERE id = 8;

SELECT employee.first_name, employee.last_name, city.city_name
FROM employee
JOIN city ON employee.city_id = city.city_id;

SELECT city.city_name, employee.first_name, employee.last_name
FROM city
LEFT JOIN employee ON employee.city_id = city.city_id;

SELECT employee.first_name, city.city_name
FROM employee
FULL OUTER JOIN city ON employee.city_id = city.city_id;

SELECT employee.first_name, city.city_name
FROM employee
CROSS JOIN city;

SELECT city_name
FROM city
LEFT JOIN employee ON employee.city_id = city.city_id
WHERE employee.city_id IS NULL;