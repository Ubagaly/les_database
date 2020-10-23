use test_baza;
-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;


DROP TRIGGER IF EXISTS logs_users;
delimiter //
CREATE TRIGGER logs_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


DROP TRIGGER IF EXISTS logs_catalogs;
delimiter //
CREATE TRIGGER logs_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS logs_products;
delimiter //
CREATE TRIGGER logs_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;


-- Проверяем

INSERT INTO users (name, birthday_at)
VALUES ('Юлия', '1992-10-05');

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO catalogs (name)
VALUES ('Ноутбук'),
		('Монитор');

SELECT * FROM catalogs;
SELECT * FROM logs;


INSERT INTO products (name, desription, price, catalog_id)
VALUES ('Acer', 'Ноутбук', 25000, 6),
		('Samsung', 'Монитор', 10500, 7);
		
SELECT * FROM products;
SELECT * FROM logs;

-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.



DROP TABLE IF EXISTS example_users; 
CREATE TABLE example_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP PROCEDURE IF EXISTS insert_users ;
delimiter //
CREATE PROCEDURE insert_users ()
BEGIN
	DECLARE x INT DEFAULT 1000;
	DECLARE y INT DEFAULT 1;
	WHILE x > 0 DO
		INSERT INTO example_users(name, birthday_at) VALUES (CONCAT('username_', y), NOW());
		SET y = y + 1;
		SET x = x - 1;
	END WHILE;
END //
delimiter ;


-- Проверяем

CALL insert_users();

SELECT * FROM example_users LIMIT 3;