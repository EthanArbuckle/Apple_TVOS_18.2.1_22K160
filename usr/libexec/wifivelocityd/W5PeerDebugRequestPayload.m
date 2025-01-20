@interface W5PeerDebugRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5DebugConfiguration)configuration;
- (W5PeerDebugRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (unint64_t)requestType;
- (void)setConfiguration:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDebugRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDebugRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___W5PeerDebugRequestPayload;
  uint64_t v5 = -[W5PeerDebugRequestPayload init](&v26, "init");
  if (!v5
    || (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0LL)
    || (v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"type"])) == 0)
  {

    uint64_t v22 = sub_10008C90C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      int v24 = 2;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] init error!",  &v27,  v24);
    }

    v8 = 0LL;
    v10 = 0LL;
    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

  v8 = v7;
  v5->_requestType = (unint64_t)[v7 integerValue];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"config"]);
  if (v10)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___W5DebugConfiguration, v9);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v12),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v25 = 0LL;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v10,  &v25));
    v16 = (os_log_s *)v25;
    configuration = v5->_configuration;
    v5->_configuration = (W5DebugConfiguration *)v15;

    if (v16)
    {
      uint64_t v18 = sub_10008C90C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138543362;
        id v28 = v4;
        LODWORD(v23) = 12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] failed to decode configuration from raw payload='%{public}@'",  &v27,  v23);
      }
    }

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload version](self, "version"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload version](self, "version"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"version");

    if (-[W5PeerDebugRequestPayload requestType](self, "requestType"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[W5PeerDebugRequestPayload requestType](self, "requestType")));
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"type");

      if ((id)-[W5PeerDebugRequestPayload requestType](self, "requestType") == (id)2)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload configuration](self, "configuration"));

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload configuration](self, "configuration"));
          id v16 = 0LL;
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v16));
          id v10 = v16;

          if (v10 || !v9)
          {
            uint64_t v11 = sub_10008C90C();
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v17 = 138543362;
              id v18 = v10;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] failed to encode configuration with error='%{public}@'",  &v17,  12);
            }
          }

          else
          {
            -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"config");
          }
        }
      }
    }
  }

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerDebugRequestPayload encode]"));
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v14,  0LL));

    objc_exception_throw(v15);
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

- (W5DebugConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
}

@end