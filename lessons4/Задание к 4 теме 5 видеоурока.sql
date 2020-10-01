# задание 1 к 4 теме 5 видеоурока
use snet2309;
select avg(timestampdiff(year, birthday, now())) as age from users;

# задание 2 к 4 теме 5 видеоурока
select 
date_format(date(concat_ws('-', year(now()), month(birthday), day (birthday))), '%W') as days, 
count(*) as total 
from users 
group by days
order by total desc;

# задание 3 к 4 теме 5 видеоурока
select round(exp(sum(ln(id)))) from storehouses_products; 