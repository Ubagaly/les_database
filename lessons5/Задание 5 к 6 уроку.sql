-- 5 Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
-- Под активностью я понимаю: -
  # наименьшее количество постов, 
  # меньше всего пишут сообщений другим пользователям (инициаторы),
  # меньше всего состоят в группах,
  # меньше всего ставят лайки
 -- Вывод будем делать на основе подсчета количества действий
-- 5.1 Количество постов пользователя
select user_id, count(*)  as active from posts group by user_id;

-- 5.2 Количество сообщений пользователя 
select from_user_id as id, count(*) as active from messages group by from_user_id;
	

-- 5.3 Количество групп пользователя
select user_id, count(*)  as active from users_communities group by user_id;

-- 5.4 Количество лайков
select user_id, count(*)  as active from likes_posts group by user_id;

-- 5.5 Теперь всё объединяем

SELECT id, SUM(active) from (
	SELECT * from (
		select user_id as id , count(*) as active from posts group by user_id) as tbl_1 
			union all 
	SELECT * from (
		select from_user_id as id, count(*) as active from messages group by from_user_id) as_tbl_2
			union all 
	SELECT * from (
		select user_id as id, count(*) as active from users_communities group by user_id) as tbl_3
			union all 
	SELECT * from (
		select user_id as id, count(*) as active from likes_posts group by user_id) as tbl_4 
	) as tbl_active
GROUP by id
ORDER by SUM(active)
LIMIT 10
;
