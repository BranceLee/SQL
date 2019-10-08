CREATE TABLE USER (
    UserID          INTEGER     PRIMARY KEY     NOT NULL,
    Email           VARCHAR(30) NOT NULL,
    UserName        VARCHAR(30),
    DeviceID        INTEGER,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID)
);

CREATE TABLE DEVICE (
    DeviceID        INTEGER     PRIMARY KEY     NOT NULL,
    EventID         INTEGER,
    RelatedPerson   INTEGER,
    FOREIGN KEY (RelatedPerson) REFERENCES PERSON(PersonID),
    FOREIGN KEY (EventID) REFERENCES EVENT(EventID)
);

CREATE TABLE EVENT (
    EventID     INTEGER         PRIMARY KEY     NOT NULL,
    PersonID    INTEGER,
    TimeStamp   DATE,
    FOREIGN KEY (PersonID) REFERENCES PERSON(PersonID)
);

CREATE TABLE PERSON (
    PersonID    INTEGER         PRIMARY KEY     NOT NULL,
    FaceID      INTEGER,
    Tag         VARCHAR(30),
    FOREIGN KEY (FaceID) REFERENCES FACE(FaceID)
);

CREATE TABLE FACE (
    FaceID      INTEGER         PRIMARY KEY     NOT NULL,  
    FaceImage   VARCHAR(255),
    Feature     INTEGER
);
