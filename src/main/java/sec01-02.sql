create table cities(
                       name varchar(250),
                       country varchar(250),
                       population integer,
                       area integer
);

insert into cities(name, country, population, area)
values ('test1','test',1000,48),
       ('test2','test',3000,18);

select * from cities;

select name,country from cities;

update cities set name = 'istanbul', country = 'turkiye' where area = 48;

select name, population / area as density from cities;

select concat(name,' - ',country) as concated_country from cities;

-- select name, manufacturer from phones where manufacturer in ('Apple','Samsung')
-- select name, manufacturer from phones where manufacturer = 'Apple' or manufacturer = 'Samsung';

select name, population / area as density from cities where population/area > 6000;

delete from cities where name = 'baki';

create database PhotoSharing;

\connect PhotoSharing;
