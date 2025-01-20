@interface TKHostToken
+ (BOOL)supportsSecureCoding;
+ (id)keychainItemClasses;
- (BOOL)persistent;
- (NSArray)keychainItems;
- (NSData)configurationData;
- (NSString)slotName;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (TKHostToken)initWithCoder:(id)a3;
- (TKHostToken)initWithTokenID:(id)a3 persistent:(BOOL)a4;
- (TKHostTokenDriver)driver;
- (TKHostTokenRegistry)registry;
- (TKTokenID)tokenID;
- (id)connectionWithError:(id *)a3;
- (id)description;
- (int64_t)connectionCount;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)setConnectionCount:(int64_t)a3;
- (void)setDriver:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setKeychainItems:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setSlotName:(id)a3;
@end

@implementation TKHostToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKHostToken)initWithTokenID:(id)a3 persistent:(BOOL)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TKHostToken;
  v8 = -[TKHostToken init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tokenID, a3);
    v9->_persistent = a4;
    keychainItems = v9->_keychainItems;
    v9->_keychainItems = (NSArray *)&__NSArray0__struct;

    id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"hosttoken:%@", v7));
    v12 = (const char *)[v11 UTF8String];
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v15;
  }

  return v9;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKHostToken;
  id v3 = -[TKHostToken description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[TKHostToken persistent](self, "persistent")) {
    v5 = "PERS";
  }
  else {
    v5 = "TRNS";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken tokenID](self, "tokenID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %s-%@",  v4,  v5,  v6));

  return v7;
}

- (id)connectionWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (-[TKHostToken connectionCount](v4, "connectionCount"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken driver](v4, "driver"));
    unsigned __int8 v6 = [v5 valid];

    if ((v6 & 1) != 0) {
      goto LABEL_4;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken registry](v4, "registry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 driverCache]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken tokenID](v4, "tokenID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 classID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 hostTokenDriverWithClassID:v10 error:a3]);
  -[TKHostToken setDriver:](v4, "setDriver:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken driver](v4, "driver"));
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken tokenID](v4, "tokenID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 acquireTokenWithTokenID:v13 error:a3]);
  -[TKHostToken setEndpoint:](v4, "setEndpoint:", v14);

  dispatch_queue_t v15 = (TKHostTokenConnection *)objc_claimAutoreleasedReturnValue(-[TKHostToken endpoint](v4, "endpoint"));
  if (v15) {
LABEL_4:
  }
    dispatch_queue_t v15 = -[TKHostTokenConnection initWithToken:](objc_alloc(&OBJC_CLASS___TKHostTokenConnection), "initWithToken:", v4);
  objc_sync_exit(v4);

  return v15;
}

- (void)setKeychainItems:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_keychainItems, "isEqualToArray:", v5))
  {
    id obj = a3;
    id v6 = [&__NSArray0__struct mutableCopy];
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v20 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v11) mutableCopy];
          [v12 removeObjectForKey:@"pubk"];
          [v12 removeObjectForKey:@"keyUsage"];
          [v6 addObject:v12];

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v9);
    }

    dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken registry](self, "registry"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 keychain]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000274C;
    v21[3] = &unk_10001C580;
    v21[4] = self;
    id v22 = v6;
    id v15 = v6;
    [v14 accessKeychainWithBlock:v21];

    objc_storeStrong((id *)&self->_keychainItems, obj);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken registry](self, "registry"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 beginTransaction:@"setKeychainItems"]);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 markModified]);
    [v18 commit];

    id v5 = v20;
  }
}

+ (id)keychainItemClasses
{
  if (qword_100024008 != -1) {
    dispatch_once(&qword_100024008, &stru_10001C5C0);
  }
  return (id)qword_100024010;
}

- (TKHostToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(TKTokenID) forKey:@"tokenid"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeBoolForKey:@"persistent"];
  id v8 = -[TKHostToken initWithTokenID:persistent:](self, "initWithTokenID:persistent:", v6, v7);
  if ((_DWORD)v7)
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    configurationData = v8->_configurationData;
    v8->_configurationData = (NSData *)v10;

    id v12 = [(id)objc_opt_class(v8) keychainItemClasses];
    dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"items"]);
    keychainItems = v8->_keychainItems;
    v8->_keychainItems = (NSArray *)v14;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken tokenID](self, "tokenID"));
  [v7 encodeObject:v4 forKey:@"tokenid"];

  objc_msgSend(v7, "encodeBool:forKey:", -[TKHostToken persistent](self, "persistent"), @"persistent");
  if (-[TKHostToken persistent](self, "persistent"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken configurationData](self, "configurationData"));
    [v7 encodeObject:v5 forKey:@"data"];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKHostToken keychainItems](self, "keychainItems"));
    [v7 encodeObject:v6 forKey:@"items"];
  }
}

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TKHostTokenRegistry)registry
{
  return (TKHostTokenRegistry *)objc_loadWeakRetained((id *)&self->_registry);
}

- (void)setRegistry:(id)a3
{
}

- (TKHostTokenDriver)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
}

- (NSString)slotName
{
  return self->_slotName;
}

- (void)setSlotName:(id)a3
{
}

- (BOOL)persistent
{
  return self->_persistent;
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
}

- (NSArray)keychainItems
{
  return self->_keychainItems;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (int64_t)connectionCount
{
  return self->_connectionCount;
}

- (void)setConnectionCount:(int64_t)a3
{
  self->_connectionCount = a3;
}

- (void).cxx_destruct
{
}

@end