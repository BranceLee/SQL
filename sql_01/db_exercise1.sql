
-- 1.1 Select the name of all the products in store.
SELECT Name FROM PRODUCTS;

-- 1.2 Select the name and the price of all the products in the store.
SELECT Name, Price FROM PRODUCTS;
select name from Manufactures;

-- 1.3 Select the Price less 200 product and return name.
SELECT NAME FROM PRODUCTS WHERE PRICE <= 200;

-- 1.4 Select the price between 60 and 120.
SELECT * FROM PRODUCTS WHERE PRICE >= 60 AND price <= 120;

-- 1.5 四则运算
SELECT Name, price*100 FROM PRODUCTS;
select avg(price) from products;
select sum(price) from products;
select count(*) from products where price > 180;

-- 1.6 筛选后排序，优先排价格降序排，在相同的price 时，再按name 的顺序。
select name, price from products where price > 0 order by price desc, name asc;

-- 1.7 Select the all product info and exteral manufactor name  
select p.*, m.name from products p, Manufactures m where p.manufactor = m.code;

select p.*, m.name from products p join Manufactures m on (p.manufactor = m.code);

select Products.Name, Price, Manufactures.Name from Products INNER JOIN Manufactures ON Products.manufactor = Manufactures.code;

-- 1.8 Update the name of product 8 to 'Laser Printer'.
update products set name='Laser Printer' where code = 4;

-- 1.9 Set all the product off 0.1;
-- update products  set price=0.9*price ;
