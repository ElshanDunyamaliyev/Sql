-- CTE
with tags as
         (select user_id, created_at
          from caption_tags
          union all
          select user_id, created_at
          from photo_tags)

select username, tags.created_at
from users u
         join
     tags on tags.user_id = u.id
where tags.created_at < '2010-01-07';

-- Recursive CTE

with recursive countdown(number) as (
    select 10 as number
    union
    select number - 1 from countdown where number > 1
)
select * from countdown;

create table employees(
                          id serial primary key ,
                          name varchar(50),
                          manager_id integer,
                          constraint fk_employees_user foreign key (manager_id) references users(id)
);

-- we must use union in recursive cte

WITH RECURSIVE subordinates AS (
    -- Anchor: Start with Alice
    SELECT id, name, manager_id
    FROM employees
    WHERE name = 'Alice'

    UNION ALL

    -- Recursive: Find employees who report to the previous ones
    SELECT e.id, e.name, e.manager_id
    FROM employees e
             JOIN subordinates s ON e.manager_id = s.id
)
SELECT * FROM subordinates;

with recursive suggestions(leader_id,follower_id,depth) as (
    select leader_id,follower_id, 1 as depth from followers
    where follower_id = 1000
    union
    select f.leader_id,f.follower_id, depth + 1 from followers f
                                                         join suggestions on suggestions.leader_id = f.follower_id
    where depth < 4
)
select username, id, s.depth from users u join suggestions s on u.id = s.leader_id;
