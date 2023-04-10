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