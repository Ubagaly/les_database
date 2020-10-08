use test_baza;

-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select id, name, birthday_at from users where id in (
select * from 
(select user_id as id from orders group by user_id) as tbl);

-- Выведите список товаров products и разделов catalogs, который соответствует товару.
select p.name, p.price, c.name
	from 
		catalogs as c
	join
		products as p;

-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label 
-- содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
SELECT
	id,
	(SELECT name FROM cities WHERE label = `from`) AS `from`,
	(SELECT name FROM cities WHERE label = `to`) AS `to`
FROM
	flights
ORDER BY
	id;
	
	
	
-- Создание таблиц к третьему заданию	
	DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255),
  name VARCHAR(255));
  
	
	
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id serial primary key,
  `from` VARCHAR(255),
  `to` VARCHAR(255));
  #primary key(`from`, `to`));
  #foreign key (`from`) references cities (label),
  #foreign key (`to`) references cities (label));
 
 INSERT INTO cities
  (label, name)
VALUES
  ('Moscow', 'Москва'),
  ('Irkutsk', 'Иркутск'),
  ('Novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
  
 INSERT INTO flights
  (id, `from`, `to` )
VALUES
  (1, 'Moscow', 'omsk'),
  (2, 'Novgorod', 'kazan'),
  (3, 'Novgorod', 'Moscow'),
  (4, 'omsk', 'Irkutsk'),
  (5, 'Moscow', 'kazan');
  
 
