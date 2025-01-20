@interface W5LogItemRequestInternal
- (BOOL)includeEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLogItemRequestInternal:(id)a3;
- (NSArray)itemRequests;
- (NSDate)addedAt;
- (NSDictionary)configuration;
- (NSString)filename;
- (NSURL)additionalLog;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (W5LogItemRequestInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reply;
- (unint64_t)hash;
- (unsigned)gid;
- (unsigned)uid;
- (void)dealloc;
- (void)setAddedAt:(id)a3;
- (void)setAdditionalLog:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setFilename:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setIncludeEvents:(BOOL)a3;
- (void)setItemRequests:(id)a3;
- (void)setReply:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5LogItemRequestInternal

- (W5LogItemRequestInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5LogItemRequestInternal;
  v2 = -[W5LogItemRequestInternal init](&v5, "init");
  if (v2)
  {
    uint64_t v3 = os_transaction_create("com.apple.wifivelocity.W5LogItemRequestInternal");
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.W5LogItemRequestInternal",  v3);
    v2->_transaction = (OS_os_transaction *)v3;
  }

  return v2;
}

- (void)dealloc
{
  self->_transaction = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___W5LogItemRequestInternal;
  -[W5LogItemRequestInternal dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"UUID: %@\n", self->_uuid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"UID: %d\n", self->_uid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"GID: %d\n", self->_gid);
  if (self->_includeEvents) {
    v4 = "Yes";
  }
  else {
    v4 = "No";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Events: %s\n", v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Filename: %@\n", self->_filename);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"AdditionalLog: %@\n", self->_additionalLog);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Configuration: %@\n", self->_configuration);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"AddedAt: %@\n", self->_addedAt);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Requests:\n");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  itemRequests = self->_itemRequests;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( itemRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(itemRequests);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( itemRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)isEqualToLogItemRequestInternal:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", [a3 uuid]);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    uint64_t v5 = objc_opt_class(self, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0) {
      return -[W5LogItemRequestInternal isEqualToLogItemRequestInternal:](self, "isEqualToLogItemRequestInternal:", a3);
    }
  }

  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[W5LogItemRequestInternal init]( +[W5LogItemRequestInternal allocWithZone:](&OBJC_CLASS___W5LogItemRequestInternal, "allocWithZone:", a3),  "init");
  -[W5LogItemRequestInternal setUuid:](v4, "setUuid:", self->_uuid);
  -[W5LogItemRequestInternal setItemRequests:](v4, "setItemRequests:", self->_itemRequests);
  -[W5LogItemRequestInternal setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5LogItemRequestInternal setFilename:](v4, "setFilename:", self->_filename);
  -[W5LogItemRequestInternal setAdditionalLog:](v4, "setAdditionalLog:", self->_additionalLog);
  -[W5LogItemRequestInternal setUid:](v4, "setUid:", self->_uid);
  -[W5LogItemRequestInternal setGid:](v4, "setGid:", self->_gid);
  -[W5LogItemRequestInternal setIncludeEvents:](v4, "setIncludeEvents:", self->_includeEvents);
  -[W5LogItemRequestInternal setAddedAt:](v4, "setAddedAt:", self->_addedAt);
  -[W5LogItemRequestInternal setReply:](v4, "setReply:", self->_reply);
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSArray)itemRequests
{
  return self->_itemRequests;
}

- (void)setItemRequests:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSURL)additionalLog
{
  return self->_additionalLog;
}

- (void)setAdditionalLog:(id)a3
{
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (BOOL)includeEvents
{
  return self->_includeEvents;
}

- (void)setIncludeEvents:(BOOL)a3
{
  self->_includeEvents = a3;
}

- (NSDate)addedAt
{
  return self->_addedAt;
}

- (void)setAddedAt:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end