@interface W5PeerSnifferResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)filePaths;
- (NSNumber)version;
- (NSUUID)uuid;
- (W5PeerSnifferResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setFilePaths:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSnifferResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSnifferResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___W5PeerSnifferResponsePayload;
  uint64_t v5 = -[W5PeerSnifferResponsePayload init](&v26, "init");
  if (v5
    && (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) != 0LL)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"])) != 0)
  {
    v8 = v7;
    v5->_status = (int64_t)[v7 integerValue];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"paths"]);
    if (v10)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v12);
      v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  v13,  objc_opt_class(&OBJC_CLASS___NSURL, v14),  0LL);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v25 = 0LL;
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v10,  &v25));
      id v18 = v25;
      filePaths = v5->_filePaths;
      v5->_filePaths = (NSDictionary *)v17;
    }

    else
    {
      id v18 = 0LL;
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"uuid"]);
    uuid = (os_log_s *)v5->_uuid;
    v5->_uuid = (NSUUID *)v20;
  }

  else
  {

    uint64_t v24 = sub_10008C90C();
    uuid = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(uuid, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315906;
      v28 = "-[W5PeerSnifferResponsePayload initWithRequest:]";
      __int16 v29 = 2080;
      v30 = "W5PeerSnifferResponsePayload.m";
      __int16 v31 = 1024;
      int v32 = 55;
      __int16 v33 = 2114;
      uint64_t v34 = 0LL;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  uuid,  0LL,  "[wifivelocity] %s (%s:%u) Init Error (error='%{public}@'",  &v27,  38);
    }

    v10 = 0LL;
    v8 = 0LL;
    id v18 = 0LL;
    uint64_t v5 = 0LL;
  }

  v22 = v5;
  return v22;
}

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload version](self, "version"));

  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload version](self, "version"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"version");

  if (!-[W5PeerSnifferResponsePayload status](self, "status"))
  {
    id v4 = 0LL;
LABEL_16:
    id v8 = 0LL;
    goto LABEL_13;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerSnifferResponsePayload status](self, "status")));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"status");

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload filePaths](self, "filePaths"));
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload filePaths](self, "filePaths"));
    id v16 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v16));
    id v8 = v16;

    if (!v4 || v8)
    {
      uint64_t v9 = sub_10008C90C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        id v18 = "-[W5PeerSnifferResponsePayload encode]";
        __int16 v19 = 2080;
        uint64_t v20 = "W5PeerSnifferResponsePayload.m";
        __int16 v21 = 1024;
        int v22 = 82;
        __int16 v23 = 2114;
        id v24 = v8;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) Failed to encode channels with error='%{public}@'",  &v17,  38);
      }
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"paths");
    }
  }

  else
  {
    id v8 = 0LL;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload uuid](self, "uuid"));

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload uuid](self, "uuid"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, @"uuid");
  }

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSDictionary)filePaths
{
  return self->_filePaths;
}

- (void)setFilePaths:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end