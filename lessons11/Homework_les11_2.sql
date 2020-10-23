-- Для выполнения данного задания DBeaver использован просто как текстовый редактор для скрипта

-- 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.*/
HSET ipaddr 127.0.0.3 1
HSET ipaddr 192.168.0.1 2
/*
2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, 
поиск электронного адреса пользователя по его имени.*/
SET Juliya mail@gmail.com
GET juliya 

SET mail@gmail.com Juliya
GET mail@gmail.com

/*
3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
-- Реализовать скрипт в СУБД MongoDB не получилось возникла ошибка connect (фото приложила)
*/
db.shop.insert({razdel: 'Бытовая химия'})
db.shop.insert({razdel: 'Одноразовая посуда'})

db.shop.update({razdel: 'Бытовая химия'}, {$set: { products:['мыло', 'шампунь', 'порошок'] }})
db.shop.update({category: 'Одноразовая посуда'}, {$set: { products:['стаканы', 'контейнеры', 'тарелки'] }})

db.shop.find()