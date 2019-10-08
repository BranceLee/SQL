CREATE TABLE salary (
    id      integer         PRIMARY KEY,
    name    varchar(255),
    sex     varchar(20),
    salary  decimal(100,2)
);

INSERT INTO salary ('Alice', 'f', 2500) values (name, sex, salary);
INSERT INTO salary ('Bob', 'm', 4000) values (name, sex, salary);

-- Swap all the male and famale's values.
update salary 
    set sex = case sex 
    when 'm' then 'f' 
    else 'm' 
end;
