-- Drop database testdb;
-- Create database testdb;
\c testdb;

Create Table public.User  (
    UserID                  int             primary key     not null    unique,
    UUID                    uuid            not null,
    Email                   varchar(255),
    Password                varchar(255)    ,
    PasswordHash            varchar(255)    not null,                          
    Verified                boolean,
    OAuthToken              varchar(255),
    TokenCreateAt           bigint,
    TokenExpiresAt          bigint,
    MQTTClientID            varchar(128),
    AllowPushNotification   boolean          default false,
    EnableTwoFactorLogin   boolean          default true,
       
    Foreign key(MQTTClientID) References VmqAuthACL(ClientID)
);

Create Table Device (
    DeviceID                int             primary key     not null,
    Kind                    int             not null,
    Owner                   int,
    Token                   varchar(255),
    SN                      varchar(128)    unique not null,
    MQTTClientID            varchar(128),
    Version                 varchar(128)    not null,
    DID                     varchar(255)    not null,
    Foreign key (SN) References SN(SNID),
    Foreign key (MQTTClientID) References VmqAuthACL(ClientID)
);

Create Table SN (
    SNID                    int             primary key,
    Value                   varchar(255)
);

Create Table DeviceUserShare (
    ID                      int             primary key,
    DeviceSN                varchar(255)    unique,
    UserID                  int             unique,
    Status                  varchar(255),
    Foreign key (UserID) References User(UserID)
);

Create Table VmqAuthACL (
    Mountpoint              varchar(10)     not null,
    ClientID                varchar(128)    not null    unique,
    Username                varchar(128)    not null    unique,
    PublishACL              json,
    SubscribeACL            json,
    primary key(Mountpoint, ClientID, Username)
);