@interface W5PeerGenericRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)info;
- (NSNumber)version;
- (W5PeerGenericRequestPayload)initWithRequest:(id)a3;
- (id)__allowedClasses;
- (id)encode;
- (void)setInfo:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerGenericRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (id)__allowedClasses
{
  v12[0] = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  v12[1] = objc_opt_class(&OBJC_CLASS___NSDictionary, v2);
  v12[2] = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  v12[3] = objc_opt_class(&OBJC_CLASS___NSString, v4);
  v12[4] = objc_opt_class(&OBJC_CLASS___NSData, v5);
  v12[5] = objc_opt_class(&OBJC_CLASS___NSDate, v6);
  v12[6] = objc_opt_class(&OBJC_CLASS___NSError, v7);
  v12[7] = objc_opt_class(&OBJC_CLASS___W5Event, v8);
  v12[8] = objc_opt_class(&OBJC_CLASS___W5Peer, v9);
  v12[9] = objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v10);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v12,  10LL));
}

- (W5PeerGenericRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___W5PeerGenericRequestPayload;
  uint64_t v5 = -[W5PeerGenericRequestPayload init](&v20, "init");
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
      v22 = "-[W5PeerGenericRequestPayload initWithRequest:]";
      __int16 v23 = 2080;
      v24 = "W5PeerGenericRequestPayload.m";
      __int16 v25 = 1024;
      int v26 = 42;
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

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestPayload __allowedClasses](v5, "__allowedClasses"));
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
      v22 = "-[W5PeerGenericRequestPayload initWithRequest:]";
      __int16 v23 = 2080;
      v24 = "W5PeerGenericRequestPayload.m";
      __int16 v25 = 1024;
      int v26 = 34;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to unarchive generic request payload, return error (%{public}@)",  &v21,  38);
    }

    goto LABEL_10;
  }

- (id)encode
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestPayload info](self, "info"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestPayload info](self, "info"));
    id v12 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  &v12));
    id v6 = v12;

    if (v4)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"payload");
    }

    else
    {
      uint64_t v8 = sub_10008C90C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        v14 = "-[W5PeerGenericRequestPayload encode]";
        __int16 v15 = 2080;
        v16 = "W5PeerGenericRequestPayload.m";
        __int16 v17 = 1024;
        int v18 = 54;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to archive generic request payload, return error (%{public}@)",  &v13,  38);
      }

      id v4 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerGenericRequestPayload encode]"));
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v10,  0LL));

    objc_exception_throw(v11);
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