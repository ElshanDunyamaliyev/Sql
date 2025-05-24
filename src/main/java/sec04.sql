-- Query 1
select c.contents, u.username
from comments c
         left join users u on c.user_id = u.id
where c.photo_id = 3;

-- Query 2
select p.id, p.url, count(c.id) as number_of_comments
from photos p
         join comments c on c.photo_id = p.id
where p.id = 10
group by p.id;

-- Query 3

select u.username, sum(c.id) + count(p.id) as user_activity
from users u
         join comments c on c.user_id = u.id
         join photos p on p.user_id = u.id
group by u.username order by user_activity desc limit 1;




