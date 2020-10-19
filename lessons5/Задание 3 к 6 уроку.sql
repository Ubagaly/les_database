-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
-- 3.1 получаем посты самых молодых пользователей
select id as post_id from posts where user_id in (
	SELECT * FROM (
			SELECT id as user_id FROM users ORDER by birthday DESC LIMIT 10
		) as user_id );

 -- 3.2 считаем количество лайков пост самых молодых пользователей
 
SELECT count(*) as total FROM likes_posts WHERE post_id in ( 
	select id as post_id from posts where user_id in (
		SELECT * FROM (
			SELECT id as user_id FROM users ORDER by birthday DESC LIMIT 10
		) as user_id ) 	
);