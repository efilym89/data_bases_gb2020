CREATE DATABASE next_hw;

USE next_hw;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными

CREATE TABLE IF NOT EXISTS users (
	created_at VARCHAR(100),
	updated_at VARCHAR(100)
	);

DESC users;

SELECT * FROM users;

-- Заполните их текущими датой и временем.

INSERT users (created_at, updated_at)
VALUES (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения

ALTER TABLE users
MODIFY COLUMN created_at DATETIME,
MODIFY COLUMN updated_at DATETIME;

-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
-- если товар закончился и выше нуля, если на складе имеются запасы. 

CREATE TABLE storehouses_products (
	value INT NOT NULL
);

DESC storehouses_products;

SELECT * FROM storehouses_products;

INSERT storehouses_products (value)
VALUES (0), (2500), (0), (30), (500), (1);

-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако нулевые запасы должны выводиться в конце, после всех записей.

SELECT * FROM storehouses_products
ORDER BY value = 0, value;



