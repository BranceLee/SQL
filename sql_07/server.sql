Drop database if exists testdb;
Create database testdb;
\c testdb;

Create Table VmqAuthACL (
    Mountpoint              varchar(10)     not null,
    ClientID                varchar(128)    not null    unique,
    Username                varchar(128)    not null    unique,
    PublishACL              json,
    SubscribeACL            json,
    primary key(Mountpoint, ClientID, Username)
);

Create Table SN (
    SNID                    int             primary key,
    Value                   varchar(255)    unique
);

Create Table Users  (
    UserID                  int             primary key,
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
    CreatedAt               timestamp        not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp        not null,

    Foreign key(MQTTClientID) References VmqAuthACL(ClientID)
);

Create Table Device (
    DeviceID                int             primary key,
    Kind                    int             not null,
    Owner                   int,
    Token                   varchar(255),
    SN                      varchar(128)    unique not null,
    MQTTClientID            varchar(128),
    Version                 varchar(128)    not null,
    DID                     varchar(255)    not null,
    CreatedAt               timestamp        not null,     
    UpdatedAt               timestamp        not null,
    DeletedAt               timestamp        not null,

    Foreign key (SN) References SN(Value),
    Foreign key (MQTTClientID) References VmqAuthACL(ClientID)
);

Create Table DeviceUserShare (
    ID                      int             primary key ,
    DeviceSN                varchar(255)    unique,
    UserID                  int             unique  not null,
    Status                  varchar(255),
    Foreign key (UserID) References Users(UserID),
    Foreign key (DeviceSN) References Device(SN)
);

Create Table DeviceSetting (
    DeviceSettingID         int             primary key,
    UUID                    uuid            unique  not null,
    UserID                  int             unique  not null,
    DeviceSN                varchar(255)    unique  not null,
    DeviceName              varchar(255)    not null,
    AllowMotionNotification  boolean         not null,
    AllowRingNotification    boolean         not null,
    DoorbellVolume          int             not null,
    ChimeVolume             int             not null,
    AllowFacialRecognition  boolean         not null,
    EnableLight             boolean         not null,
    EnableAntiTheftAlert    boolean         not null,
    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key (UserID) References Users(UserID),
    Foreign key (DeviceSN) References Device(SN)
);

Create Table Media(
    MediaID                 int             primary key,
    UserID                  int             not null unique,
    Type                    int             not null,
    S3Key                   varchar(255)    not null,
    S3Bucket                varchar(255)    not null,
    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key (UserID) References Users(UserID)
);
  
Create Table VideoThumbnail(
    VideoThumbnailID        int             primary key,
    MediaID                 int             not null,
    S3Key                   varchar(255)    not null,
    S3Bucket                varchar(255)    not null,
    Width                   int             not null,
    Height                  int             not null,
    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key (MediaID) References Media(MediaID)
);

Create Table VideoStream(
    VideoStreamID           int             primary key,
    MediaID                 int             not null,
    S3Key                   varchar(255)    not null,
    S3Bucket                varchar(255)    not null,
    Width                   int             not null,
    Height                  int             not null,
    Bitrate                 int             not null,
    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key (MediaID) References Media(MediaID)
);

Create Table Event (
    EventID                 int             primary key,
    UUID                    uuid            not null,
    UserID                  int             not null,
    MediaID                 int             not null,
    Kind                    int             not null,
    Timestamp               bigint          not null,
    Filename                varchar(255)    not null,
    DeviceSN                varchar(255)    not null,
    Duration                int             not null,
    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key (UserID) References Users(UserID),
    Foreign key (DeviceSN) References Device(SN),
    Foreign key (MediaID) References Media(MediaID)
);

Create Table FaceProfile(
    FaceProfileID            int             primary key,
    Name                    varchar(255)    not null,
    Tags                    varchar(255)    not null,
    UUID                    uuid            not null unique,

    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null
);

Create Table FaceImage(
    FaceImageID             int             primary key,
    Owner                   int             not null,
    DeviceSN                varchar(255)    not null,
    FaceID                  uuid            not null unique, 
    EventID                 int             not null,
    FaceProfileID            int,
    S3Bucket                varchar(255)    not null,
    S3Key                   varchar(255)    not null,

    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key(DeviceSN) References Device(SN),
    Foreign key(EventID) References Event(EventID),
    Foreign key(FaceProfileID) References FaceProfile(FaceProfileID)
);

Create Table SysNotification(
    SysNotificationID        int             primary key,
    Title                   varchar(255)    not null,
    Content                 varchar(255)    not null,
    UUID                    uuid            not null unique,
    Timestamp               bigint          not null,

    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null
);

Create Table SysNotificationStatus (
    SysNotificationStatusID  int             primary key,
    UserID                  int             not null,
    Read                    boolean         not null,
    SysNotificationID        int             not null,

    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key(UserID) References Users(UserID),
    Foreign key(SysNotificationID) References SysNotification(SysNotificationID)
);

Create Table SupportMessage (
    SupportMessageID        int             primary key,
    UserID                  int             not null,
    Content                 varchar(255)    not null,
    Images                  jsonb,

    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key(UserID) References Users(UserID)
);

Create Table QuickReply (
    QuickReplyID            int             primary key,
    UserID                  int             not null,
    UUID                    uuid            not null unique,
    S3Bucket                varchar(255)    not null,
    S3Key                   varchar(255)    not null,
    Name                    varchar(255)    not null,

    CreatedAt               timestamp       not null,     
    UpdatedAt               timestamp       not null,
    DeletedAt               timestamp       not null,

    Foreign key(UserID) References Users(UserID)
);