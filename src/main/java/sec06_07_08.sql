-- offset teyin elediyim qeder elementleri pass edir

select paid, count(*) from orders  group by paid;
select first_name, last_name,paid from orders o join users u on o.user_id = u.id;
-- select * from phones order by price desc limit 2 offset 1;

(select name,price from products order by price desc limit 4)
union
(select name,price from products order by price/weight desc limit 4);

-- union 2 querinin neticesini birlesdirir
-- union all duplicatlari da elave edir

(select name from products order by price desc limit 4)
union
(select weight from products order by price/weight desc limit 4); -- union eden zaman data tipler eyni olmalidir
-- meselen burda string integer birlesdirmek isteyirik xeta atir

(select price from products order by price desc limit 4)
union
(select weight from products order by price/weight desc limit 4);


-- iki queride ortaqlari tapir interserct, duplicatlari silir
-- iki queride ortaqlari tapir interserct all, duplicatlari silmir
(select * from products order by price desc limit 4)
intersect
(select * from products order by price/weight desc limit 4);


-- birinci queride olub ikincide olmayan neticeleri getir duplikatsiz except
-- birinci queride olub ikincide olmayan neticeleri getir duplikatli except all
(select * from products order by price desc limit 4)
except
(select * from products order by price/weight desc limit 4);