CREATE TABLE Movies (
    Code        INTEGER  PRIMARY KEY,
    Title       VARCHAR(255) NOT NULL,
    Rating      VARCHAR(255)   
);

CREATE TABLE MovieTheater (
    Code        INTEGER  PRIMARY KEY,
    Name        VARCHAR(255)  NOT NULL,
    Movie       INTEGER,
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
);

INSERT INTO Movies(Code, Title, Rating) VALUES (1, 'Citizen Kane', 'PG');
INSERT INTO Movies(Code, Title, Rating) VALUES (2, 'Singin'' in the Rain', 'G');
INSERT INTO Movies(Code, Title, Rating) VALUES (3, 'The Wizard of OZ', 'G');

INSERT INTO MovieTheater(Code, Name, Movie) VALUES (1, 'Wan Da', 1);
INSERT INTO MovieTheater(Code, Name, Movie) VALUES (2, 'BL M', 2);
INSERT INTO MovieTheater(Code, Name, Movie) Values (3, 'zh', 3);