# ������� 1 � 4 ���� 5 ����������
use snet2309;
select avg(timestampdiff(year, birthday, now())) as age from users;

# ������� 2 � 4 ���� 5 ����������
select 
date_format(date(concat_ws('-', year(now()), month(birthday), day (birthday))), '%W') as days, 
count(*) as total 
from users 
group by days
order by total desc;

# ������� 3 � 4 ���� 5 ����������
select round(exp(sum(ln(id)))) from storehouses_products; 