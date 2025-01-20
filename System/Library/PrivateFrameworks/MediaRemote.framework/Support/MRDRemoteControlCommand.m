@interface MRDRemoteControlCommand
- (BOOL)alwaysIgnoreDuringCall;
- (BOOL)alwaysIgnoreDuringSharePlay;
- (BOOL)isAVRCPCommand;
- (BOOL)isContextSensitive;
- (BOOL)isNavigational;
- (BOOL)nowPlayingAppStackEligible;
- (BOOL)originatedFromAccessory;
- (BOOL)originatedFromHID;
- (BOOL)shouldImplicitlyLaunchApplication;
- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 options:(id)a7;
- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 optionsData:(id)a7;
- (MRPlayerPath)playerPath;
- (MRPlayerPath)unresolvedPlayerPath;
- (NSData)optionsData;
- (NSData)protobufData;
- (NSDate)dateCreated;
- (NSString)commandID;
- (NSString)contextID;
- (NSString)destinationAppDisplayID;
- (NSString)remoteControlInterfaceID;
- (NSString)routeUID;
- (NSString)senderAppDisplayID;
- (NSString)senderID;
- (id)_completionHandler;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)_optionsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)optionValueForKey:(__CFString *)a3;
- (int)destinationAppProcessID;
- (unsigned)appOptions;
- (unsigned)commandType;
- (void)_setCompletionHandler:(id)a3;
@end

@implementation MRDRemoteControlCommand

- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 optionsData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MRDRemoteControlCommand;
  v16 = -[MRDRemoteControlCommand init](&v31, "init");
  v17 = v16;
  if (v16)
  {
    v16->_commandType = a3;
    v18 = (MRPlayerPath *)[v12 copy];
    playerPath = v17->_playerPath;
    v17->_playerPath = v18;

    v20 = (MRPlayerPath *)[v13 copy];
    unresolvedPlayerPath = v17->_unresolvedPlayerPath;
    v17->_unresolvedPlayerPath = v20;

    v22 = (NSString *)[v14 copy];
    senderAppDisplayID = v17->_senderAppDisplayID;
    v17->_senderAppDisplayID = v22;

    v24 = (NSData *)[v15 copy];
    optionsData = v17->_optionsData;
    v17->_optionsData = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlCommand optionValueForKey:]( v17,  "optionValueForKey:",  kMRMediaRemoteOptionSendOptionsNumber));
    v17->_appOptions = [v26 intValue];

    v27 = objc_alloc_init(&OBJC_CLASS___NSDate);
    dateCreated = v17->_dateCreated;
    v17->_dateCreated = v27;

    parsedOptionsDict = v17->_parsedOptionsDict;
    v17->_parsedOptionsDict = 0LL;
  }

  return v17;
}

- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 options:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = -[MRDRemoteControlCommand initWithCommandType:playerPath:unresolvedPlayerPath:senderAppDisplayID:optionsData:]( self,  "initWithCommandType:playerPath:unresolvedPlayerPath:senderAppDisplayID:optionsData:",  v10,  a4,  a5,  a6,  0LL);
  if (v13)
  {
    id v14 = (NSMutableDictionary *)[v12 mutableCopy];
    parsedOptionsDict = v13->_parsedOptionsDict;
    v13->_parsedOptionsDict = v14;
  }

  return v13;
}

- (id)description
{
  v3 = (void *)MRMediaRemoteCopyCommandDescription(self->_commandType);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand senderID](self, "senderID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand commandID](self, "commandID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand remoteControlInterfaceID](self, "remoteControlInterfaceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p, command = %@, %@\n, commandID = %@\n, remote control interface = %@\n, appOptions = %ld\n, path = %@\n, unresolvedPath = %@\n>",  v4,  self,  v3,  v5,  v6,  v7,  -[MRDRemoteControlCommand appOptions](self, "appOptions"),  self->_playerPath,  self->_unresolvedPlayerPath));

  return v8;
}

- (id)debugDescription
{
  v3 = (void *)MRMediaRemoteCopyCommandDescription(self->_commandType);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand senderID](self, "senderID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand commandID](self, "commandID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand remoteControlInterfaceID](self, "remoteControlInterfaceID"));
  uint64_t v8 = -[MRDRemoteControlCommand appOptions](self, "appOptions");
  playerPath = self->_playerPath;
  unresolvedPlayerPath = self->_unresolvedPlayerPath;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand _optionsDictionary](self, "_optionsDictionary"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p, command = %@, %@\n, commandID = %@\n, remote control interface = %@\n, appOptions = %ld\n, path = %@\n, unresolvedPath = %@\n, options = %@\n>",  v4,  self,  v3,  v5,  v6,  v7,  v8,  playerPath,  unresolvedPlayerPath,  v11));

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MRDRemoteControlCommand _copyWithZone:usingConcreteClass:]( self,  "_copyWithZone:usingConcreteClass:",  a3,  objc_opt_class(self));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MRDRemoteControlCommand _copyWithZone:usingConcreteClass:]( self,  "_copyWithZone:usingConcreteClass:",  a3,  objc_opt_class(&OBJC_CLASS___MRDMutableRemoteControlCommand));
}

- (NSData)protobufData
{
  cachedProtobufData = self->_cachedProtobufData;
  if (!cachedProtobufData)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath origin](self->_playerPath, "origin"));
    id v5 = objc_alloc_init(&OBJC_CLASS____MRReceivedCommandProtobuf);
    [v5 setCommand:MRMediaRemoteCommandToProtobuf(self->_commandType)];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand _optionsDictionary](self, "_optionsDictionary"));
    uint64_t v7 = MRMediaRemoteCommandOptionsToProtobuf();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v5 setOptions:v8];

    if (v4) {
      id v9 = [v4 identifier];
    }
    else {
      id v9 = 0LL;
    }
    [v5 setOriginUID:v9];
    [v5 setSenderAppDisplayID:self->_senderAppDisplayID];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand destinationAppDisplayID](self, "destinationAppDisplayID"));
    [v5 setDestinationAppDisplayID:v10];

    objc_msgSend( v5,  "setDestinationAppProcessID:",  -[MRDRemoteControlCommand destinationAppProcessID](self, "destinationAppProcessID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand remoteControlInterfaceID](self, "remoteControlInterfaceID"));
    [v5 setRemoteControlInterfaceID:v11];

    uint64_t v12 = MRProtobufFromSendCommandAppOptions(self->_appOptions);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v5 setAppOptions:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath protobuf](self->_playerPath, "protobuf"));
    [v5 setPlayerPath:v14];

    id v15 = (NSData *)objc_claimAutoreleasedReturnValue([v5 data]);
    v16 = self->_cachedProtobufData;
    self->_cachedProtobufData = v15;

    cachedProtobufData = self->_cachedProtobufData;
  }

  return cachedProtobufData;
}

- (int)destinationAppProcessID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSString)destinationAppDisplayID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_playerPath, "client"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);

  return (NSString *)v3;
}

- (NSString)routeUID
{
  return (NSString *)-[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionSourceID);
}

- (NSString)contextID
{
  return (NSString *)-[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionContextID);
}

- (BOOL)isNavigational
{
  return MRMediaRemoteCommandIsNavigational(self->_commandType, a2) != 0;
}

- (NSData)optionsData
{
  parsedOptionsDict = self->_parsedOptionsDict;
  if (parsedOptionsDict)
  {
    uint64_t v4 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  parsedOptionsDict,  200LL,  0LL,  0LL));
    optionsData = self->_optionsData;
    self->_optionsData = v4;
  }

  return self->_optionsData;
}

- (NSString)remoteControlInterfaceID
{
  return (NSString *)-[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionRemoteControlInterfaceIdentifier);
}

- (NSString)commandID
{
  return (NSString *)-[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionCommandID);
}

- (NSString)senderID
{
  return (NSString *)-[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionSenderID);
}

- (BOOL)alwaysIgnoreDuringCall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionAlwaysIgnoreDuringCall));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)alwaysIgnoreDuringSharePlay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlCommand optionValueForKey:]( self,  "optionValueForKey:",  kMRMediaRemoteOptionAlwaysIgnoreDuringSharePlay));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isContextSensitive
{
  unsigned int commandType = self->_commandType;
  BOOL v3 = commandType == 125;
  if (commandType == 122) {
    BOOL v3 = 1;
  }
  BOOL v4 = commandType > 0x1A;
  int v5 = (1 << commandType) & 0x6000001;
  return !v4 && v5 != 0 || v3;
}

- (BOOL)shouldImplicitlyLaunchApplication
{
  unsigned int commandType = self->_commandType;
  BOOL result = 1;
  if ((commandType - 122 > 0x10 || ((1 << (commandType - 122)) & 0x1C809) == 0) && commandType != 0 && commandType != 2) {
    return 0;
  }
  return result;
}

- (BOOL)originatedFromAccessory
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.iapd",  @"com.apple.iap2d",  @"com.apple.BTAvrcp",  0LL));
  LOBYTE(self) = [v3 containsObject:self->_senderAppDisplayID];

  return (char)self;
}

- (BOOL)originatedFromHID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.rcd",  @"rcd",  0LL));
  LOBYTE(self) = [v3 containsObject:self->_senderAppDisplayID];

  return (char)self;
}

- (BOOL)isAVRCPCommand
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand remoteControlInterfaceID](self, "remoteControlInterfaceID"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.AVRCP"];

  return v3;
}

- (id)optionValueForKey:(__CFString *)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand _optionsDictionary](self, "_optionsDictionary"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:a3]);

  return v5;
}

- (BOOL)nowPlayingAppStackEligible
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v4 = [v3 supportMultiplayerHost];

  if ((v4 & 1) == 0)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v6 = [v5 computeNowPlayingApplication];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v7 nowPlayingAppStackFailedPlayInterval];
      double v9 = v8;

      if (v9 > 0.0)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 origin]);
        unsigned int v12 = [v11 isLocal];

        if (v12)
        {
          if (-[MRDRemoteControlCommand commandType](self, "commandType") == 2)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 nowPlayingServer]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 queryExistingPlayerPath:v15]);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 playerClient]);
            unsigned __int8 v18 = [v17 isPlaying];

            if ((v18 & 1) == 0) {
              return 1;
            }
          }

          else if (!-[MRDRemoteControlCommand commandType](self, "commandType"))
          {
            return 1;
          }
        }
      }
    }
  }

  return 0;
}

- (id)_completionHandler
{
  return objc_retainBlock(self->_completionHandler);
}

- (void)_setCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;
}

- (id)_optionsDictionary
{
  parsedOptionsDict = self->_parsedOptionsDict;
  if (!parsedOptionsDict)
  {
    optionsData = self->_optionsData;
    if (optionsData) {
      int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  optionsData,  0LL,  0LL,  0LL));
    }
    else {
      int v5 = &__NSDictionary0__struct;
    }
    unsigned __int8 v6 = (NSMutableDictionary *)[v5 mutableCopy];
    uint64_t v7 = self->_parsedOptionsDict;
    self->_parsedOptionsDict = v6;

    parsedOptionsDict = self->_parsedOptionsDict;
  }

  return parsedOptionsDict;
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  int v5 = -[objc_class allocWithZone:](a4, "allocWithZone:", a3);
  uint64_t commandType = self->_commandType;
  playerPath = self->_playerPath;
  unresolvedPlayerPath = self->_unresolvedPlayerPath;
  senderAppDisplayID = self->_senderAppDisplayID;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand optionsData](self, "optionsData"));
  v11 = -[objc_class initWithCommandType:playerPath:unresolvedPlayerPath:senderAppDisplayID:optionsData:]( v5,  "initWithCommandType:playerPath:unresolvedPlayerPath:senderAppDisplayID:optionsData:",  commandType,  playerPath,  unresolvedPlayerPath,  senderAppDisplayID,  v10);

  LODWORD(v11[7].isa) = self->_appOptions;
  unsigned int v12 = (objc_class *)[self->_completionHandler copy];
  Class isa = v11[8].isa;
  v11[8].Class isa = v12;

  objc_storeStrong((id *)&v11[5].isa, self->_dateCreated);
  return v11;
}

- (unsigned)commandType
{
  return self->_commandType;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)senderAppDisplayID
{
  return self->_senderAppDisplayID;
}

- (unsigned)appOptions
{
  return self->_appOptions;
}

- (void).cxx_destruct
{
}

@end