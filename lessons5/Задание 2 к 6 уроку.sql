-- 2. Из всех друзей этого пользователя найдите человека, который больше всех общался с пользователем с id=14
use snet1509;
-- 1.1 Определяем друзей пользователя
select id, name, surname from users where id in ( select * from 	
	(select 
	case
		when initiator_user_id = 14 and status = 'approved' then target_user_id
		when target_user_id = 14 and status = 'approved' then initiator_user_id
	end as friend_id
	from friend_requests) as fr_tbl where friend_id is not null);
-- 2.2 Определяем с кем пользователь из друзей общался 

select * from messages 
	where (from_user_id = 14 and 
	to_user_id in ( select * from 	
	(select 
	case
		when initiator_user_id = 14 and status = 'approved' then target_user_id
		when target_user_id = 14 and status = 'approved' then initiator_user_id
	end as friend_id
	from friend_requests) as fr_tbl where friend_id is not null)) 
		or 
	(to_user_id = 14 and 
	from_user_id in ( select * from 	
	(select 
	case
		when initiator_user_id = 14 and status = 'approved' then target_user_id
		when target_user_id = 14 and status = 'approved' then initiator_user_id
	end as friend_id
	from friend_requests) as fr_tbl where friend_id is not null)); 
	
SELECT user_id FROM (
	(SELECT to_user_id as user_id, COUNT(*) as message_total FROM messages WHERE from_user_id = 14 GROUP BY to_user_id)
	UNION ALL
	(SELECT from_user_id as user_id, COUNT(*) as message_total FROM messages WHERE to_user_id = 14 GROUP BY from_user_id)
) as my_tmp_table
GROUP by user_id
ORDER BY SUM(message_total) DESC
;
-- 2.3 Определяем с кем пользователь из друзей общался больше всего
SELECT user_id, SUM(message_total) FROM (
	(SELECT to_user_id as user_id, COUNT(*) as message_total FROM messages 
	WHERE (from_user_id = 14 and 
	to_user_id in ( select * from 	
	(select 
	case
		when initiator_user_id = 14 and status = 'approved' then target_user_id
		when target_user_id = 14 and status = 'approved' then initiator_user_id
	end as friend_id
	from friend_requests) as fr_tbl where friend_id is not null)) GROUP BY to_user_id)
		UNION ALL
	(SELECT from_user_id as user_id, COUNT(*) as message_total FROM messages 
	WHERE (to_user_id = 14 and 
	from_user_id in ( select * from 
	(select 
	case
		when initiator_user_id = 14 and status = 'approved' then target_user_id
		when target_user_id = 14 and status = 'approved' then initiator_user_id
	end as friend_id
	from friend_requests) as fr_tbl where friend_id is not null)) GROUP BY from_user_id)
) as my_tmp_table GROUP by user_id
ORDER BY SUM(message_total) desc limit 1
;





