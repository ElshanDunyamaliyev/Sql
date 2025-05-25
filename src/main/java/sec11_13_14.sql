select name, greatest(weight * 2, 30)
from products;

select name, least(weight * 2, 30)
from products;

select name,
       price,
       case
           when price > 600 then 'high'
           when price < 300 then 'low'
           else 'medium'
           end
from products;

select ('nov 28 1920':: date);
select ('nov-28-1920':: date);
select ('10:20':: time without time zone);
select ('5:30 am':: time without time zone);
select ('10:30 pm':: time without time zone);
select ('10:30 pm est':: time with time zone);
select ('nov 28 1920 10:30 pm pst':: timestamp with time zone);



select ('1 day' :: interval);
select ('1 D' :: interval);
select ('1 d 20 h 15 m' :: interval);
select ('1 d 20 h 15 m' :: interval) - ('1 d' :: interval);

-- Constraints

create table products
(
    id         serial primary key,
    name       varchar(50),
    department varchar(50),
    price      integer,
    weight     integer
);

insert into products(name, department, price, weight)
values ('test', 'rwa', 10, 2);
insert into products(name, department, price, weight)
values ('test', null, 10, 2);

-- 1 . Not null

alter table products
    alter column price set not null;

-- will throw exception
insert into products(name, department, price, weight)
values ('test3', 'test1', null, 2);

-- will throw exception because department has null value. if we want to apply this constraint we have delete null or give some default value
alter table products
    alter column department set not null;

-- 2. Default constraint
alter table products
    alter column price set default 20;

insert into products(name, department, weight)
values ('test5', 'test6', 2);

-- 3. Unique
alter table products
    add unique (name);
-- will throw error same name exists
insert into products(name, department, weight)
values ('test5', 'test6', 2);

-- show constraints
\d products;

-- drop constraint
-- alter table products drop constraint products_name_key;
alter table products
    add unique (name, department);
-- burda unique lik name ve department ile bir yerde teyin olunub
-- yeni eyni adla product ola biler amma different deparmentde olmalidir

-- 4. Check
-- checking if price above zero when inserted
alter table products
    add check ( price > 0 );
insert into products(name, department, price, weight)
values ('test9', 'test13', -5, 10);

create table orders
(
    id           serial primary key,
    name         varchar   not null,
    created_at   timestamp not null,
    delivered_at timestamp not null,
    check ( created_at < delivered_at )
);


insert into orders(name, created_at, delivered_at)
VALUES ('iphone', 'nov 18 1920 10:20 am', 'nov 17 1920 10:20 am');
insert into orders(name, created_at, delivered_at)
VALUES ('iphone', 'nov 18 1920 10:20 am', 'nov 19 1920 10:20 am');
