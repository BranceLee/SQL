CREATE TABLE IF NOT EXISTS USERS (
    UserID          INTEGER        NOT NULL,
    Email           VARCHAR(30) NOT NULL,
    UserName        VARCHAR(30),
    DeviceID        INTEGER,
    PRIMARY KEY (UserID), 
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID)
);

CREATE TABLE IF NOT EXISTS DEVICE (
    DeviceID        INTEGER     PRIMARY KEY     NOT NULL,
    EventID         INTEGER,
    RelatedPerson   INTEGER,
    FOREIGN KEY (RelatedPerson) REFERENCES PERSON(PersonID),
    FOREIGN KEY (EventID) REFERENCES EVENTS(EventID)
);

CREATE TABLE IF NOT EXISTS EVENTS (
    EventID     INTEGER         PRIMARY KEY     NOT NULL,
    PersonID    INTEGER,
    TimeStamp   DATE,
    FOREIGN KEY (PersonID) REFERENCES PERSON(PersonID)
);

CREATE TABLE IF NOT EXISTS PERSON (
    PersonID    INTEGER         PRIMARY KEY     NOT NULL,
    FaceID      INTEGER,
    Tag         VARCHAR(30),
    FOREIGN KEY (FaceID) REFERENCES FACE(FaceID)
);

CREATE TABLE IF NOT EXISTS FACE (
    FaceID      INTEGER         PRIMARY KEY     NOT NULL,  
    FaceImage   VARCHAR(255),
    Feature     INTEGER
);
