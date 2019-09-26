
CREATE TABLE IF NOT EXISTS Manufactures(
    Code    INTEGER,
    Name    VARCHAR(255) NOT NULL,
    PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS PRODUCTS(
    Code        INTEGER,
    Name        VARCHAR(255)    NOT NULL,
    Price       DECIMAL         NOT NULL,
    Manufactor  INTEGER         NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Manufactor) References Manufactures(Code)
);
-- innoDB 外键约束的数据存储引擎, 具有缓存池，不加锁的读取，增加并发读取数量，跳高性能.

INSERT INTO Manufactures (Code, Name) VALUES (1, 'Sony');
INSERT INTO Manufactures (Code, Name) VALUES (2, 'Creative Labs');
INSERT INTO Manufactures (Code, Name) VALUES (3, 'Hua Wei');
INSERT INTO Manufactures(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufactures(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufactures(Code,Name) VALUES(6,'Winchester');

INSERT INTO PRODUCTS(Code, Name, Price, Manufactor) VALUES (1, 'Hard drive', 240, 5);
INSERT INTO PRODUCTS(Code, Name, Price, Manufactor) VALUES (2, 'Memory', 120, 6);
INSERT INTO PRODUCTS(Code, Name, Price, Manufactor) VALUES (3, 'ZIP drive', 150, 4);
INSERT INTO PRODUCTS(Code, Name, Price, Manufactor) VALUES (4, 'Key board', 100, 3);
