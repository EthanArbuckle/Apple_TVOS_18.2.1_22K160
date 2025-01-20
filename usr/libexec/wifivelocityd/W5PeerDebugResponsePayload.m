@interface W5PeerDebugResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5DebugConfiguration)configuration;
- (W5PeerDebugResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setConfiguration:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDebugResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDebugResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___W5PeerDebugResponsePayload;
  uint64_t v5 = -[W5PeerDebugResponsePayload init](&v33, "init");
  if (!v5
    || (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0LL))
  {
    v8 = 0LL;
    goto LABEL_13;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"]);
  v8 = v7;
  if (!v7)
  {
LABEL_13:
    id v16 = 0LL;
    v10 = 0LL;
    goto LABEL_15;
  }

  v5->_status = (int64_t)[v7 integerValue];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"config"]);
  if (!v10)
  {
    id v16 = 0LL;
    goto LABEL_15;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___W5DebugConfiguration, v9);
  v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v12),  0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v32 = 0LL;
  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v10,  &v32));
  id v16 = v32;
  configuration = v5->_configuration;
  v5->_configuration = (W5DebugConfiguration *)v15;

  v18 = v5->_configuration;
  if (!v18)
  {
LABEL_15:

    uint64_t v30 = sub_10008C90C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 136315906;
      v35 = "-[W5PeerDebugResponsePayload initWithRequest:]";
      __int16 v36 = 2080;
      v37 = "W5PeerDebugResponsePayload.m";
      __int16 v38 = 1024;
      int v39 = 63;
      __int16 v40 = 2114;
      id v41 = v16;
      LODWORD(v31) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) init error, decoding errror='%{public}@'",  &v34,  v31);
    }

    uint64_t v5 = 0LL;
    goto LABEL_10;
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[W5DebugConfiguration diagnosticsMode](v18, "diagnosticsMode"));
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DebugConfiguration diagnosticsMode](v5->_configuration, "diagnosticsMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);

    if (!v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DebugConfiguration diagnosticsMode](v5->_configuration, "diagnosticsMode"));
      [v24 setUuid:v23];

      uint64_t v25 = sub_10008C90C();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload configuration](v5, "configuration"));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 diagnosticsMode]);
        int v34 = 136315906;
        v35 = "-[W5PeerDebugResponsePayload initWithRequest:]";
        __int16 v36 = 2080;
        v37 = "W5PeerDebugResponsePayload.m";
        __int16 v38 = 1024;
        int v39 = 56;
        __int16 v40 = 2114;
        id v41 = v28;
        LODWORD(v31) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) generating UUID for diagnosticsMode='%{public}@'",  &v34,  v31);
      }

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload version](self, "version"));

  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload version](self, "version"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"version");

  if (!-[W5PeerDebugResponsePayload status](self, "status"))
  {
    v8 = 0LL;
    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerDebugResponsePayload status](self, "status")));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"status");

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload configuration](self, "configuration"));
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload configuration](self, "configuration"));
    id v16 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v16));
    id v4 = v16;

    if (!v4 && v8)
    {
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"config");
LABEL_7:
      id v4 = 0LL;
      goto LABEL_11;
    }

    uint64_t v9 = sub_10008C90C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      v18 = "-[W5PeerDebugResponsePayload encode]";
      __int16 v19 = 2080;
      v20 = "W5PeerDebugResponsePayload.m";
      __int16 v21 = 1024;
      int v22 = 87;
      __int16 v23 = 2114;
      id v24 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'",  &v17,  38);
    }
  }

  else
  {
LABEL_16:
    v8 = 0LL;
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

- (W5DebugConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end