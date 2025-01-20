@interface W5PeerFileTransferRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSData)publicKey;
- (NSNumber)version;
- (NSString)targetID;
- (NSURL)remotePath;
- (W5PeerFileTransferRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)type;
- (void)setPublicKey:(id)a3;
- (void)setRemotePath:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerFileTransferRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerFileTransferRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___W5PeerFileTransferRequestPayload;
  uint64_t v5 = -[W5PeerFileTransferRequestPayload init](&v27, "init");
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = (NSNumber *)[v4 objectForKey:@"version"];
  v5->_version = v6;
  if (!v6
    || (v7 = objc_alloc(&OBJC_CLASS___NSURL),
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"url"]),
        v9 = -[NSURL initWithString:](v7, "initWithString:", v8),
        remotePath = v5->_remotePath,
        v5->_remotePath = v9,
        remotePath,
        v8,
        !v5->_remotePath))
  {
LABEL_11:
    id v16 = 0LL;
    v11 = 0LL;
    goto LABEL_12;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"type"]);
  v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___NSNumber, v12),  0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v26 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v11,  &v26));
  id v16 = v26;
  v5->_int64_t type = (int64_t)[v15 integerValue];

  int64_t type = v5->_type;
  if (type == 1)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"targetID"]);
    targetID = v5->_targetID;
    v5->_targetID = (NSString *)v18;

    if (v5->_targetID)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"publicKey"]);
      publicKey = v5->_publicKey;
      v5->_publicKey = (NSData *)v20;
LABEL_9:

      goto LABEL_10;
    }

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload version](self, "version"));

  if (v4
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload version](self, "version")),
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"version"),
        v5,
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload remotePath](self, "remotePath")),
        v4,
        v4))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload remotePath](self, "remotePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"url");

    if (-[W5PeerFileTransferRequestPayload type](self, "type"))
    {
      v8 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[W5PeerFileTransferRequestPayload type](self, "type"));
      id v20 = 0LL;
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v20));
      id v9 = v20;

      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"type");
      if ((id)-[W5PeerFileTransferRequestPayload type](self, "type") == (id)1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload targetID](self, "targetID"));

        if (!v10) {
          goto LABEL_12;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload targetID](self, "targetID"));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"targetID");
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload publicKey](self, "publicKey"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload publicKey](self, "publicKey"));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v13, @"publicKey");
      }

      uint64_t v14 = sub_10008C90C();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315906;
        v22 = "-[W5PeerFileTransferRequestPayload encode]";
        __int16 v23 = 2080;
        v24 = "W5PeerFileTransferRequestPayload.m";
        __int16 v25 = 1024;
        int v26 = 85;
        __int16 v27 = 2114;
        int v28 = v3;
        int v19 = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Payload: %{public}@",  &v21,  v19);
      }
    }

    else
    {
      id v9 = 0LL;
      id v4 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
}

- (NSURL)remotePath
{
  return self->_remotePath;
}

- (void)setRemotePath:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
}

@end