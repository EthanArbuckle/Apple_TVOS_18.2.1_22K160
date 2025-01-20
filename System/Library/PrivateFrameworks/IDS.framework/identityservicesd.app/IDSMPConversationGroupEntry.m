@interface IDSMPConversationGroupEntry
+ (id)entryFromPublicDataRepresentation:(id)a3 error:(id *)a4;
- (ENGroupID)groupID;
- (IDSMPConversationGroupEntry)initWithStableGroupID:(id)a3 groupServerEntry:(id)a4;
- (NSData)data;
- (NSData)forwardingTicket;
- (NSData)publicKeyData;
- (NSData)signature;
- (id)description;
- (id)publicDataRepresentationWithError:(id *)a3;
- (void)setData:(id)a3;
- (void)setForwardingTicket:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setPublicKeyData:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation IDSMPConversationGroupEntry

- (IDSMPConversationGroupEntry)initWithStableGroupID:(id)a3 groupServerEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSMPConversationGroupEntry;
  v8 = -[IDSMPConversationGroupEntry init](&v21, "init");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"key"]);
    publicKeyData = v8->_publicKeyData;
    v8->_publicKeyData = (NSData *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"data"]);
    data = v8->_data;
    v8->_data = (NSData *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"signature"]);
    signature = v8->_signature;
    v8->_signature = (NSData *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"forwarding-sig"]);
    forwardingTicket = v8->_forwardingTicket;
    v8->_forwardingTicket = (NSData *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"version"]);
    v18 = -[ENGroupID initWithStableGroupID:generation:]( [ENGroupID alloc],  "initWithStableGroupID:generation:",  v6,  [v17 intValue]);
    groupID = v8->_groupID;
    v8->_groupID = v18;
  }

  return v8;
}

+ (id)entryFromPublicDataRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  a4));
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___IDSMPConversationGroupEntry);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"data"]);
    -[IDSMPConversationGroupEntry setData:](v7, "setData:", v8);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"key"]);
    -[IDSMPConversationGroupEntry setPublicKeyData:](v7, "setPublicKeyData:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"signature"]);
    -[IDSMPConversationGroupEntry setSignature:](v7, "setSignature:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"forwarding-sig"]);
    -[IDSMPConversationGroupEntry setForwardingTicket:](v7, "setForwardingTicket:", v11);

    v12 = objc_alloc(&OBJC_CLASS___ENGroupID);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"groupID"]);
    v14 = -[ENGroupID initWithDataRepresentation:](v12, "initWithDataRepresentation:", v13);
    -[IDSMPConversationGroupEntry setGroupID:](v7, "setGroupID:", v14);
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10069B898();
    }

    id v7 = 0LL;
  }

  return v7;
}

- (id)publicDataRepresentationWithError:(id *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry publicKeyData](self, "publicKeyData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"key");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry data](self, "data"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"data");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry signature](self, "signature"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, @"signature");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry groupID](self, "groupID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataRepresentation]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, @"groupID");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry forwardingTicket](self, "forwardingTicket"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, @"forwarding-sig");

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  a3));
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ENLog groupContext](&OBJC_CLASS___ENLog, "groupContext"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10069B914((uint64_t *)a3, (uint64_t)v5, v15);
    }
  }

  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry publicKeyData](self, "publicKeyData"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry groupID](self, "groupID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry data](self, "data"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 length]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMPConversationGroupEntry signature](self, "signature"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 length]));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p key: %@, groupID: %@, data.length: %@, signature.length: %@>",  v3,  self,  v4,  v5,  v7,  v9));

  return v10;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (void)setPublicKeyData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSData)forwardingTicket
{
  return self->_forwardingTicket;
}

- (void)setForwardingTicket:(id)a3
{
}

- (void).cxx_destruct
{
}

@end