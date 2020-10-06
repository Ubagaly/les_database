#задание 1 к 3 теме 5 видеоурока
use snet2309;
alter table users add column updated_at datetime;
alter table users add column created_atnow datetime;
update users set  created_atnow = now(), updated_at = now();

 # задание 2 к 3 теме 5 видеоурока
ALTER TABLE users DROP COLUMN updated_at;
ALTER TABLE users DROP column created_atnow;
alter table users add column updated_at varchar(50);
alter table users add column created_atnow varchar(50);
update users set  created_atnow = '01.07.2016 12:05', updated_at = '26.08.2019 12:05' where id <= 10;
update users set  created_atnow = '25.03.2014 17:05', updated_at = '23.12.2018 12:54' where id <= 10;
update users set  created_atnow = '15.09.2015 13:05', updated_at = '09.01.2020 17:05' where id <= 10;
update users set 
			created_atnow = str_to_date (created_atnow, '%d.%m.%Y %k:%i'),
			updated_at = str_to_date (updated_at, '%d.%m.%Y %k:%i');
alter table users change created_atnow created_atnow datetime default current_timestamp on update current_timestamp;
alter table users change updated_at updated_at datetime default current_timestamp on update current_timestamp;

# задание 3 к 3 теме 5 видеоурока
create table storehouses_products (
	id serial primary key,
	name varchar(50),
	value int unsigned
	);

insert into storehouses_products (id, name, value) values (1, 'Процессоры', 576),
  (2, 'Материнские платы', 0),
  (3, 'Видеокарты', 234),
  (4, 'Жесткие диски', 4),
  (5, 'Оперативная память', 56),
  (6, 'Мониторы', 0),
  (7, 'Ноутбуки', 307);
  
 select * from storehouses_products order by if (value>0, 0, 1), value;
 
# задание 4 к 3 теме 5 видеоурока
select name, surname, date_format(birthday, '%M') from users where date_format(birthday, '%M') in ('may', 'August'); 

# задание 5 к 3 теме 5 видеоурока
select id, name from storehouses_products where id in (5, 1, 2) order by field(id, 5, 1, 2); 