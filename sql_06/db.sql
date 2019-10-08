-- 性别交换
CREATE TABLE salary (
    id      integer         PRIMARY KEY NOT NULL,
    name    varchar(255),
    sex     varchar(20),
    salary  integer
);

INSERT INTO salary (id, name, sex, salary) values (0, 'Alice', 'f', 2500) ;
INSERT INTO salary (id, name, sex, salary) values (1, 'Bob', 'm', 4000) ;
INSERT INTO salary (id, name, sex, salary) values (2, 'Candy', 'f', 4000) ;
INSERT INTO salary (id, name, sex, salary) values (3, 'Dom', 'm', 4000) ;

-- Swap all the male and famale's values.
update salary 
    set sex = case sex 
    when 'm' then 'f' 
    else 'm' 
end;

-- 
select * from salary where id%2=1 and salary > 3000 order by id desc;