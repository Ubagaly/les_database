#������� 1 � 3 ���� 5 ����������
use snet2309;
alter table users add column updated_at datetime;
update users set  created_ad = now(), updated_at = now();

 