#задание 1 к 3 теме 5 видеоурока
use snet2309;
alter table users add column updated_at datetime;
update users set  created_ad = now(), updated_at = now();

 