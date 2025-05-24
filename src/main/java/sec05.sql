select user_id, count(id), max(id)
from comments
group by user_id;

select count(user_id)
from photos; -- null value olanda saymir
select count(*)
from photos; -- * isledende sayir

select photo_id, count(*)
from comments
group by photo_id;

select photo_id, count(*) as num_of_comments
from comments
where photo_id < 3
group by photo_id
having count(*) > 2;

select user_id, count(*) from comments where photo_id<50 group by user_id having count(*) > 20 ;

-- group by isledirikse selectde istediyimiz columnlari sece bilmerik
-- sece bileceklerimiz: group byda isletdiyimiz column, aggregate functionlarla isletdiyimiz
-- having where ile eynidir tek ferqi bu group by ile islenir ve ozunden sonra aggregate func ile islenir