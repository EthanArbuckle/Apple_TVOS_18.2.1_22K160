@interface W5PeerStatusRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5PeerStatusRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerStatusRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerStatusRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___W5PeerStatusRequestPayload;
  uint64_t v5 = -[W5PeerStatusRequestPayload init](&v11, "init");
  if (!v5
    || (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0LL))
  {

    uint64_t v7 = sub_10008C90C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      v13 = "-[W5PeerStatusRequestPayload initWithRequest:]";
      __int16 v14 = 2080;
      v15 = "W5PeerStatusRequestPayload.m";
      __int16 v16 = 1024;
      int v17 = 37;
      __int16 v18 = 2114;
      uint64_t v19 = 0LL;
      int v10 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@'",  &v12,  v10);
    }

    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (self->_version)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequestPayload version](self, "version"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"version");
  }

  if (-[NSMutableDictionary count](v3, "count")) {
    return v3;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerStatusRequestPayload encode]"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v6,  0LL));

  objc_exception_throw(v7);
  return -[W5PeerStatusRequestPayload version](v8, v9);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

@end