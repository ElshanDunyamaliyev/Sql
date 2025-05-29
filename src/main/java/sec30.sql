-- What is connection: If you are querying db, your application is talking to db this is happens with connection
-- if you open multiple query consoles console_1,console_2,console_3 there are 3 connections to db

-- shows how many connections established
SELECT sum(numbackends) FROM pg_stat_database;

create table accounts(
                         id serial primary key,
                         name varchar,
                         balance decimal
);

insert into accounts(name,balance) values('alice',100),('bob',20);


-- in successful case we have to commit
begin;

update accounts set balance = balance - 10 where name = 'alice';

commit;

-- if any error happened during transaction we have to rollback we cant execute any more query

begin;
-- table is not exist will throw error
select * from erotret;

-- transaction is aborted, command is ignored until end of transaction
select * from accounts;

-- now we have to rollback
rollback;
