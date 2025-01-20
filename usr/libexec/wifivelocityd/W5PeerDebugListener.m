@interface W5PeerDebugListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5DebugManager)debugManager;
- (W5PeerDebugListener)initWithDebugManager:(id)a3;
- (int64_t)currentVersion;
- (void)setDebugManager:(id)a3;
@end

@implementation W5PeerDebugListener

- (W5PeerDebugListener)initWithDebugManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5PeerDebugListener;
  v6 = -[W5PeerDebugListener init](&v12, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_debugManager, a3), !v7->_debugManager))
  {

    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[W5PeerDebugListener initWithDebugManager:]";
      __int16 v15 = 2080;
      v16 = "W5PeerDebugListener.m";
      __int16 v17 = 1024;
      int v18 = 36;
      LODWORD(v11) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v13,  v11,  LODWORD(v12.receiver));
    }

    v7 = 0LL;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  id v6 = [v5 requestType];
  uint64_t v7 = sub_10008C90C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 configuration]);
    int v38 = 136316674;
    v39 = "-[W5PeerDebugListener handleClientRequest:]";
    __int16 v40 = 2080;
    v41 = "W5PeerDebugListener.m";
    __int16 v42 = 1024;
    int v43 = 46;
    __int16 v44 = 2114;
    id v45 = v4;
    __int16 v46 = 2114;
    v47 = v5;
    __int16 v48 = 2114;
    v49 = v9;
    __int16 v50 = 2050;
    id v51 = [v5 requestType];
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@', debug_config='%{public}@', type='%{public}ld'",  &v38,  68);
  }

  v10 = objc_alloc_init(&OBJC_CLASS___W5PeerDebugResponsePayload);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerDebugListener currentVersion](self, "currentVersion")));
  -[W5PeerDebugResponsePayload setVersion:](v10, "setVersion:", v11);

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
  id v13 = [v12 integerValue];
  int64_t v14 = -[W5PeerDebugListener currentVersion](self, "currentVersion");

  if (v13 != (id)v14)
  {
    -[W5PeerDebugResponsePayload setStatus:](v10, "setStatus:", 3LL);
    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    v33 = @"W5NotSupportedErr";
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  4LL,  v17));
LABEL_21:

    goto LABEL_22;
  }

  if (v6 == (id)2)
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue([v5 configuration]);
    if (v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugListener debugManager](self, "debugManager"));
      [v20 setDebugConfiguration:v17 reply:0];
      int v18 = 0LL;
      uint64_t v21 = 1LL;
    }

    else
    {
      uint64_t v25 = sub_10008C90C();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315650;
        v39 = "-[W5PeerDebugListener handleClientRequest:]";
        __int16 v40 = 2080;
        v41 = "W5PeerDebugListener.m";
        __int16 v42 = 1024;
        int v43 = 69;
        LODWORD(v29) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) failed to unarchive responseObject object",  (const char *)&v38,  v29,  v30);
      }

      NSErrorUserInfoKey v34 = NSLocalizedFailureReasonErrorKey;
      v35 = @"W5ParamErr";
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v20));
      uint64_t v21 = 2LL;
    }

    -[W5PeerDebugResponsePayload setStatus:](v10, "setStatus:", v21);
    goto LABEL_21;
  }

  if (v6 == (id)1)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugListener debugManager](self, "debugManager"));
    id v31 = 0LL;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 queryDebugConfigurationAndReturnError:&v31]);
    id v17 = v31;

    if (v17 || !v16)
    {
      uint64_t v22 = sub_10008C90C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315906;
        v39 = "-[W5PeerDebugListener handleClientRequest:]";
        __int16 v40 = 2080;
        v41 = "W5PeerDebugListener.m";
        __int16 v42 = 1024;
        int v43 = 60;
        __int16 v44 = 2114;
        id v45 = v17;
        LODWORD(v29) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) failed to retrieve debug configuration error='%{public}@'",  &v38,  v29);
      }

      NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
      v37 = @"W5ParamErr";
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
      int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v24));

      uint64_t v19 = 2LL;
    }

    else
    {
      -[W5PeerDebugResponsePayload setConfiguration:](v10, "setConfiguration:", v16);
      int v18 = 0LL;
      uint64_t v19 = 1LL;
    }

    -[W5PeerDebugResponsePayload setStatus:](v10, "setStatus:", v19);

    goto LABEL_21;
  }

  int v18 = 0LL;
LABEL_22:
  v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
  ((void (**)(void, W5PeerDebugResponsePayload *, void *))v27)[2](v27, v10, v18);

  return 1;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.debugConfiguration";
}

- (int64_t)currentVersion
{
  return 1LL;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerDebugRequestPayload, a2);
}

- (W5DebugManager)debugManager
{
  return self->_debugManager;
}

- (void)setDebugManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end