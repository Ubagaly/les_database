-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT gender, total FROM (
	SELECT "m" as gender, COUNT(*) as total FROM likes_posts WHERE user_id IN (SELECT id as user_id FROM users WHERE gender ='m')
	UNION
	SELECT "f" as gender, COUNT(*) as total FROM likes_posts WHERE user_id IN (SELECT id as user_id FROM users WHERE gender ='f')
) as my_sort
ORDER BY total DESC
LIMIT 1;