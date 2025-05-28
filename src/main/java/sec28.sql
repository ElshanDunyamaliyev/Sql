select username, count(*) from users u
                                   join photo_tags pt on pt.user_id = u.id
                                   join caption_tags ct on ct.user_id = u.id
group by username order by count(*) desc;

create view user_tags as (
                         select user_id from photo_tags
                         UNION ALL
                         select user_id from caption_tags

                             );

-- select username, count(*) from users u
--                                    join (
--                                        select user_id from photo_tags
--                                                       UNION ALL
--                                        select user_id from caption_tags
--
-- ) as tags on tags.user_id = u.id
-- group by username order by count(*) desc;

-- instead lets use view

select username, count(*) from users u
                                   join user_tags on user_tags.user_id = u.id
group by username order by count(*) desc;

-- update view

create or replace view user_tags as (
                                    select user_id from photo_tags
                                    UNION ALL
                                    select user_id from caption_tags
                                    where user_id < 500
                                        );

drop view user_tags;