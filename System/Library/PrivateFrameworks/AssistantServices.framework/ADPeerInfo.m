@interface ADPeerInfo
+ (id)_queue;
+ (id)locallyPairedPeerInfo;
+ (void)updateSharedInfoWithIdentifier:(id)a3 productType:(id)a4 buildVersion:(id)a5;
- (ADPeerInfo)initWithAFPeerInfo:(id)a3;
- (ADPeerInfo)initWithIDSIdentifer:(id)a3;
- (ADPeerInfo)initWithIDSIdentifer:(id)a3 productType:(id)a4 buildVersion:(id)a5 name:(id)a6;
- (ADPeerInfo)initWithUniqueIdentifer:(id)a3;
- (BOOL)isDeviceOwnedByCurrentUser;
- (BOOL)isEqual:(id)a3;
- (NSArray)airPlayRouteIdentifiers;
- (NSDictionary)dictionaryRepresentation;
- (NSString)aceVersion;
- (NSString)assistantIdentifier;
- (NSString)buildVersion;
- (NSString)homeKitAccessoryIdentifier;
- (NSString)idsDeviceUniqueIdentifier;
- (NSString)idsFirstRoutableDestination;
- (NSString)idsIdentifier;
- (NSString)mediaSystemIdentifier;
- (NSString)name;
- (NSString)productType;
- (NSString)rapportEffectiveIdentifier;
- (NSString)roomName;
- (NSString)userInterfaceIdiom;
- (id)afPeerInfo;
- (id)description;
- (unint64_t)hash;
- (unint64_t)preferredMessagingOptionsForCommands;
- (void)setAceVersion:(id)a3;
- (void)setAirPlayRouteIdentifiers:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setDeviceOwnedByCurrentUser:(BOOL)a3;
- (void)setHomeKitAccessoryIdentifier:(id)a3;
- (void)setIdsDeviceUniqueIdentifier:(id)a3;
- (void)setIdsFirstRoutableDestination:(id)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setPreferredMessagingOptionsForCommands:(unint64_t)a3;
- (void)setRapportEffectiveIdentifier:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
@end

@implementation ADPeerInfo

- (ADPeerInfo)initWithIDSIdentifer:(id)a3 productType:(id)a4 buildVersion:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ADPeerInfo;
  v14 = -[ADPeerInfo init](&v24, "init");
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    idsIdentifier = v14->_idsIdentifier;
    v14->_idsIdentifier = v15;

    v17 = (NSString *)[v11 copy];
    productType = v14->_productType;
    v14->_productType = v17;

    v19 = (NSString *)[v12 copy];
    buildVersion = v14->_buildVersion;
    v14->_buildVersion = v19;

    v21 = (NSString *)[v13 copy];
    name = v14->_name;
    v14->_name = v21;

    v14->_deviceOwnedByCurrentUser = 1;
  }

  return v14;
}

- (ADPeerInfo)initWithIDSIdentifer:(id)a3
{
  return -[ADPeerInfo initWithIDSIdentifer:productType:buildVersion:name:]( self,  "initWithIDSIdentifer:productType:buildVersion:name:",  a3,  0LL,  0LL,  0LL);
}

- (ADPeerInfo)initWithUniqueIdentifer:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"device:",  a3));
  v5 = -[ADPeerInfo initWithIDSIdentifer:](self, "initWithIDSIdentifer:", v4);

  return v5;
}

- (ADPeerInfo)initWithAFPeerInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsIdentifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 productType]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 buildVersion]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    id v10 = -[ADPeerInfo initWithIDSIdentifer:productType:buildVersion:name:]( self,  "initWithIDSIdentifer:productType:buildVersion:name:",  v6,  v7,  v8,  v9);

    if (v10)
    {
      v10->_deviceOwnedByCurrentUser = [v5 isDeviceOwnedByCurrentUser];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceUniqueIdentifier]);
      id v12 = (NSString *)[v11 copy];
      idsDeviceUniqueIdentifier = v10->_idsDeviceUniqueIdentifier;
      v10->_idsDeviceUniqueIdentifier = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaSystemIdentifier]);
      v15 = (NSString *)[v14 copy];
      mediaSystemIdentifier = v10->_mediaSystemIdentifier;
      v10->_mediaSystemIdentifier = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue([v5 rapportEffectiveIdentifier]);
      v18 = (NSString *)[v17 copy];
      rapportEffectiveIdentifier = v10->_rapportEffectiveIdentifier;
      v10->_rapportEffectiveIdentifier = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue([v5 homeKitAccessoryIdentifier]);
      v21 = (NSString *)[v20 copy];
      homeKitAccessoryIdentifier = v10->_homeKitAccessoryIdentifier;
      v10->_homeKitAccessoryIdentifier = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue([v5 roomName]);
      objc_super v24 = (NSString *)[v23 copy];
      roomName = v10->_roomName;
      v10->_roomName = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue([v5 userInterfaceIdiom]);
      v27 = (NSString *)[v26 copy];
      userInterfaceIdiom = v10->_userInterfaceIdiom;
      v10->_userInterfaceIdiom = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue([v5 aceVersion]);
      v30 = (NSString *)[v29 copy];
      aceVersion = v10->_aceVersion;
      v10->_aceVersion = v30;

      v32 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaRouteIdentifier]);
      id v33 = [v32 copy];

      if (v33)
      {
        id v41 = v33;
        uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
        airPlayRouteIdentifiers = v10->_airPlayRouteIdentifiers;
        v10->_airPlayRouteIdentifiers = (NSArray *)v34;
      }

      else
      {
        airPlayRouteIdentifiers = v10->_airPlayRouteIdentifiers;
        v10->_airPlayRouteIdentifiers = 0LL;
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantIdentifier]);
      v38 = (NSString *)[v37 copy];
      assistantIdentifier = v10->_assistantIdentifier;
      v10->_assistantIdentifier = v38;
    }

    self = v10;
    v36 = self;
  }

  else
  {
    v36 = 0LL;
  }

  return v36;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADPeerInfo;
  id v4 = -[ADPeerInfo description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ idsIdentifier: %@ productType: %@ buildVersion: %@ name: %@",  v5,  self->_idsIdentifier,  self->_productType,  self->_buildVersion,  self->_name);

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", idsIdentifier, @"idsIdentifier");
  }
  productType = self->_productType;
  if (productType) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", productType, @"productType");
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", buildVersion, @"buildVersion");
  }
  return (NSDictionary *)v4;
}

- (id)afPeerInfo
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100345C50;
  v3[3] = &unk_1004FD2E8;
  v3[4] = self;
  return +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v3);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_idsIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADPeerInfo *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADPeerInfo);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo idsIdentifier](v6, "idsIdentifier"));
      idsIdentifier = self->_idsIdentifier;
      if (idsIdentifier == v7)
      {
        id v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo productType](v6, "productType"));
      }

      else
      {
        if (!idsIdentifier)
        {
          id v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo productType](v6, "productType"));
          goto LABEL_15;
        }

        unsigned int v9 = -[NSString isEqualToString:](idsIdentifier, "isEqualToString:", v7);
        id v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo productType](v6, "productType"));
        if (!v9) {
          goto LABEL_15;
        }
      }

      productType = self->_productType;
      if (productType == v10)
      {
        v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADPeerInfo buildVersion](v6, "buildVersion"));
LABEL_20:
        buildVersion = self->_buildVersion;
        if (buildVersion == v14)
        {
          unsigned __int8 v11 = 1;
          goto LABEL_17;
        }

        if (buildVersion)
        {
          unsigned __int8 v11 = -[NSString isEqualToString:](buildVersion, "isEqualToString:", v14);
          goto LABEL_17;
        }

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)idsDeviceUniqueIdentifier
{
  return self->_idsDeviceUniqueIdentifier;
}

- (void)setIdsDeviceUniqueIdentifier:(id)a3
{
}

- (BOOL)isDeviceOwnedByCurrentUser
{
  return self->_deviceOwnedByCurrentUser;
}

- (void)setDeviceOwnedByCurrentUser:(BOOL)a3
{
  self->_deviceOwnedByCurrentUser = a3;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)idsFirstRoutableDestination
{
  return self->_idsFirstRoutableDestination;
}

- (void)setIdsFirstRoutableDestination:(id)a3
{
}

- (NSArray)airPlayRouteIdentifiers
{
  return self->_airPlayRouteIdentifiers;
}

- (void)setAirPlayRouteIdentifiers:(id)a3
{
}

- (NSString)rapportEffectiveIdentifier
{
  return self->_rapportEffectiveIdentifier;
}

- (void)setRapportEffectiveIdentifier:(id)a3
{
}

- (NSString)homeKitAccessoryIdentifier
{
  return self->_homeKitAccessoryIdentifier;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
}

- (NSString)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (void)setMediaSystemIdentifier:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (unint64_t)preferredMessagingOptionsForCommands
{
  return self->_preferredMessagingOptionsForCommands;
}

- (void)setPreferredMessagingOptionsForCommands:(unint64_t)a3
{
  self->_preferredMessagingOptionsForCommands = a3;
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(id)a3
{
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (void)setAceVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_queue
{
  if (qword_100578690 != -1) {
    dispatch_once(&qword_100578690, &stru_1004FD2C0);
  }
  return (id)qword_100578688;
}

+ (id)locallyPairedPeerInfo
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  unsigned int v9 = sub_100345FA0;
  id v10 = sub_100345FB0;
  id v11 = 0LL;
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100345FB8;
  block[3] = &unk_1004FDB20;
  block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (void)updateSharedInfoWithIdentifier:(id)a3 productType:(id)a4 buildVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[ADPeerInfo initWithIDSIdentifer:productType:buildVersion:name:]( objc_alloc(&OBJC_CLASS___ADPeerInfo),  "initWithIDSIdentifer:productType:buildVersion:name:",  v10,  v9,  v8,  0LL);

  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100345F90;
  block[3] = &unk_1004FD940;
  v15 = v11;
  unsigned int v13 = v11;
  dispatch_async(v12, block);
}

@end