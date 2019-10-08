CREATE TABLE Person (
    id      INTEGER         PRIMARY KEY,
    email   varchar(255)
);

INSERT INTO Person (id, email) Values (0, 'a@b.com');
INSERT INTO Person (id, email) Values (1, 'c@s.com');
INSERT INTO Person (id, email) Values (2, 'a@b.com');

-- Query to find all the dumplate email in table named Person
Select email from Person group by email having count(*) > 1;
