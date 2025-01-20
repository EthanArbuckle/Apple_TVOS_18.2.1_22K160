@interface W5PeerGenericResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)info;
- (NSNumber)version;
- (W5PeerGenericResponsePayload)initWithRequest:(id)a3;
- (id)__allowedClasses;
- (id)encode;
- (int64_t)status;
- (void)setInfo:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerGenericResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (id)__allowedClasses
{
  v11[0] = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  v11[1] = objc_opt_class(&OBJC_CLASS___NSDictionary, v2);
  v11[2] = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  v11[3] = objc_opt_class(&OBJC_CLASS___NSString, v4);
  v11[4] = objc_opt_class(&OBJC_CLASS___NSData, v5);
  v11[5] = objc_opt_class(&OBJC_CLASS___NSDate, v6);
  v11[6] = objc_opt_class(&OBJC_CLASS___NSError, v7);
  v11[7] = objc_opt_class(&OBJC_CLASS___W5Event, v8);
  v11[8] = objc_opt_class(&OBJC_CLASS___W5Peer, v9);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v11,  9LL));
}

- (W5PeerGenericResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___W5PeerGenericResponsePayload;
  uint64_t v5 = -[W5PeerGenericResponsePayload init](&v20, "init");
  if (!v5)
  {
    id v10 = 0LL;
    uint64_t v6 = 0LL;
LABEL_10:

    uint64_t v15 = sub_10008C90C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[W5PeerGenericResponsePayload initWithRequest:]";
      __int16 v23 = 2080;
      v24 = "W5PeerGenericResponsePayload.m";
      __int16 v25 = 1024;
      int v26 = 43;
      LODWORD(v17) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v21,  v17,  v18);
    }

    uint64_t v5 = 0LL;
    goto LABEL_8;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"payload"]);
  if (!v6)
  {
    id v10 = 0LL;
    goto LABEL_8;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericResponsePayload __allowedClasses](v5, "__allowedClasses"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  id v19 = 0LL;
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v8,  v6,  &v19));
  id v10 = v19;
  info = v5->_info;
  v5->_info = (NSDictionary *)v9;

  if (!v5->_info)
  {
    uint64_t v12 = sub_10008C90C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315906;
      v22 = "-[W5PeerGenericResponsePayload initWithRequest:]";
      __int16 v23 = 2080;
      v24 = "W5PeerGenericResponsePayload.m";
      __int16 v25 = 1024;
      int v26 = 35;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to unarchive generic response payload, return error (%{public}@)",  &v21,  38);
    }

    goto LABEL_10;
  }

- (id)encode
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericResponsePayload info](self, "info"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericResponsePayload info](self, "info"));
    id v11 = 0LL;
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  &v11));
    id v7 = v11;

    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"payload");
    }

    else
    {
      uint64_t v9 = sub_10008C90C();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        v13 = "-[W5PeerGenericResponsePayload encode]";
        __int16 v14 = 2080;
        uint64_t v15 = "W5PeerGenericResponsePayload.m";
        __int16 v16 = 1024;
        int v17 = 55;
        __int16 v18 = 2114;
        id v19 = v7;
        int v10 = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to archive generic response payload, return error (%{public}@)",  &v12,  v10);
      }
    }
  }

  return v3;
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

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end