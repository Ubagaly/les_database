#������� 1 � 3 ���� 5 ����������
use snet2309;
alter table users add column updated_at datetime;
alter table users add column created_atnow datetime;
update users set  created_atnow = now(), updated_at = now();

 # ������� 2 � 3 ���� 5 ����������
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

# ������� 3 � 3 ���� 5 ����������
create table storehouses_products (
	id serial primary key,
	name varchar(50),
	value int unsigned
	);

insert into storehouses_products (id, name, value) values (1, '����������', 576),
  (2, '����������� �����', 0),
  (3, '����������', 234),
  (4, '������� �����', 4),
  (5, '����������� ������', 56),
  (6, '��������', 0),
  (7, '��������', 307);
  
 select * from storehouses_products order by if (value>0, 0, 1), value;
 
# ������� 4 � 3 ���� 5 ����������
select name, surname, date_format(birthday, '%M') from users where date_format(birthday, '%M') in ('may', 'August'); 

# ������� 5 � 3 ���� 5 ����������
select id, name from storehouses_products where id in (5, 1, 2) order by field(id, 5, 1, 2); 