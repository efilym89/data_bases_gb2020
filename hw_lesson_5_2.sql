USE next_hw;

CREATE TABLE users_2 (
	name VARCHAR (100) NOT NULL,
	birthday DATETIME
);

DESC users_2 ;

ALTER TABLE users_2 ADD COLUMN age INT NOT NULL;

SELECT name, DATE_FORMAT(birthday, '%d.%m.%Y') FROM users_2;

-- Подсчитайте средний возраст пользователей в таблице users.

SELECT name, FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) AS age FROM users_2;

-- (по желанию) Подсчитайте произведение чисел в столбце таблицы.

UPDATE users_2 SET age = FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25);

SELECT SUM(age) FROM users_2; 

SELECT name, DATE_FORMAT(birthday, '%d.%m.%Y'), age FROM users_2;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.


SELECT DAYNAME(birthday) AS dofw FROM users_2; 

ALTER TABLE users_2 ADD COLUMN dofw VARCHAR(100);

UPDATE users_2 SET dofw = DAYNAME(birthday);

SELECT name, DATE_FORMAT(birthday, '%d.%m.%Y'), age, dofw FROM users_2;

UPDATE users_2 SET birthday = DATE_FORMAT(birthday ,'2020-%m-%d');

UPDATE users_2 SET dofw = DAYNAME(birthday);

SELECT dofw, COUNT(dofw) FROM users_2 GROUP BY dofw;



