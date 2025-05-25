select *
from products
where price > (select max(price)
               from products
               where department = 'Toys');

-- Subquery isletme qaydalari

-- selectden sonra isledirikse burda yazacagimiz subquery bize sadece 1 netice qaytarmalidir
select name, price, price * 1.0 / (select max(price) from products) as weight_ratio
from products;

-- fromdan sonra isledirikse yazdigimiz subquery selectde secdiyimiz columnlari qaytarmalidir
-- hemcinin hemin querini alias vermeliyik (as p)
select name, price_weight_ratio
from (select name, price * 1.0 / weight as price_weight_ratio from products) as p;

select *
from (select max(price) from products) as p;

select max_price
from (select max(price) as max_price from products) as p;

select user_id, count(*)
from orders
group by user_id;

select avg(order_count)
from (select user_id, count(*) as order_count
      from orders o
               right join users u on o.user_id = u.id
      group by user_id) as p;

SELECT AVG(order_count)
FROM (SELECT user_id, COUNT(*) AS order_count
      FROM orders
      GROUP BY user_id) AS p;

-- joinden sonra subquery
select first_name
from users u
         join (select user_id from orders where product_id = 3) as o on u.id = o.user_id;

-- wheredan sonra subquery
select id
from orders
where product_id in (select id from products where price > 600);

-- Burda exception atacaq cunki select price from products where department = 'Industrial' 2 price qaytarir ve
-- where sadece 1 price ile isleye biler
select name, department, price
from products
where price > (select price from products where department = 'Industrial');

-- Bunu hell etmek ucun where All ifadesini islede bilerik
select name, department, price
from products
where price > ALL (select price from products where department = 'Industrial');

select name, department, price
from products
where price > SOME (select price from products where department = 'Industrial');


select department, max(price)
from products
group by department;

-- correlated subquery
-- bunu for loop kimi nezerde tuta bilerik
-- p1 outer fordusa p2 innerdi p1 1ci loopunda p2 butun recordlari loop edecek sonra p2 2ye kecende p1 1 den baslayacaq
select name, department, price
from products p1
where p1.price >= (select max(price) from products p2 where p2.department = p1.department);

select o1.product_id, (select count(*) from orders o2 where o2.product_id = o1.product_id)
from orders o1;

-- select without from sadece 1 netice qaytarirsa islede bilerik
select (select max(price) from products) / (select avg(price) from products) as price_ratio;

select distinct department from products;

select count(distinct department) from products;

select distinct department, name from products;