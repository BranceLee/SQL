-- 性别交换
CREATE TABLE salary (
    id      integer         PRIMARY KEY NOT NULL,
    name    varchar(255),
    sex     varchar(20),
    salarys  integer
);

INSERT INTO salary (id, name, sex, salarys) values (0, 'Alice', 'f', 2500) ;
INSERT INTO salary (id, name, sex, salarys) values (1, 'Bob', 'm', 4000) ;

-- Swap all the male and famale's values.
update salary 
    set sex = case sex 
    when 'm' then 'f' 
    else 'm' 
end;
