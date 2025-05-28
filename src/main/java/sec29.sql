select date_part('week', created_at)
from likes;

create materialized view comment_post_likes as
(
select date_trunc('week', coalesce(c.created_at, p.created_at)) as week,
       count(c.id)                                              as comment_likes,
       count(p.id)                                              as post_likes
from likes l
         left join comments c on c.id = l.comment_id
         left join posts p on p.id = l.comment_id
group by week
order by week
    ) with data ;

delete from comments where created_at < '2010-01-26';

refresh materialized view comment_post_likes;

drop materialized view comment_post_likes;

select date_trunc('week', coalesce(c.created_at, p.created_at)) as week,
       count(c.id)                                              as comment_likes,
       count(p.id)                                              as post_likes
from likes l
         left join comments c on c.id = l.comment_id
         left join posts p on p.id = l.comment_id
group by week
order by week;

select * from comment_post_likes;


