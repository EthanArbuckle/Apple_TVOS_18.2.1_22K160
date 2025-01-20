@interface W5PeerDiagnosticsListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5DiagnosticsManager)diagnosticsManager;
- (W5PeerDiagnosticsListener)initWithDiagnosticsManager:(id)a3;
- (id)_runDiagnostics:(id)a3 uuid:(id)a4 configuration:(id)a5;
- (int64_t)currentVersion;
- (void)setDiagnosticsManager:(id)a3;
@end

@implementation W5PeerDiagnosticsListener

- (W5PeerDiagnosticsListener)initWithDiagnosticsManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5PeerDiagnosticsListener;
  v6 = -[W5PeerDiagnosticsListener init](&v12, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_diagnosticsManager, a3), !v7->_diagnosticsManager))
  {

    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[W5PeerDiagnosticsListener initWithDiagnosticsManager:]";
      __int16 v15 = 2080;
      v16 = "W5PeerDiagnosticsListener.m";
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
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136316418;
      v21 = "-[W5PeerDiagnosticsListener handleClientRequest:]";
      __int16 v22 = 2080;
      v23 = "W5PeerDiagnosticsListener.m";
      __int16 v24 = 1024;
      int v25 = 45;
      __int16 v26 = 2114;
      id v27 = v4;
      __int16 v28 = 2114;
      v29 = v6;
      __int16 v30 = 2114;
      v31 = v7;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@' version='%{public}@'",  &v20,  58);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___W5PeerDiagnosticsResponsePayload);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerDiagnosticsListener currentVersion](self, "currentVersion")));
    -[W5PeerDiagnosticsResponsePayload setVersion:](v10, "setVersion:", v11);

    -[W5PeerDiagnosticsResponsePayload setStatus:](v10, "setStatus:", 1LL);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 tests]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]( self,  "_runDiagnostics:uuid:configuration:",  v12,  v14,  v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"testResults"]);
    if (v16)
    {
      -[W5PeerDiagnosticsResponsePayload setResults:](v10, "setResults:", v16);
    }

    else
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"testError"]);
      -[W5PeerDiagnosticsResponsePayload setError:](v10, "setError:", v17);
    }

    int v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
    ((void (**)(void, W5PeerDiagnosticsResponsePayload *, void))v18)[2](v18, v10, 0LL);
  }

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerDiagnosticsRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.peerDiagnostics";
}

- (int64_t)currentVersion
{
  return 1LL;
}

- (id)_runDiagnostics:(id)a3 uuid:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_10001D7D8;
  v52 = sub_10001D7E8;
  id v53 = 0LL;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = sub_10001D7D8;
  v46 = sub_10001D7E8;
  id v47 = 0LL;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  char v41 = 0;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  char v39 = 0;
  v11 = objc_alloc_init(&OBJC_CLASS___NSLock);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  int v13 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestRequestInternal);
  -[W5DiagnosticsTestRequestInternal setUuid:](v13, "setUuid:", v9);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v13, "setTestRequests:", v8);
  -[W5DiagnosticsTestRequestInternal setConfiguration:](v13, "setConfiguration:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"IncludeEvents"]);
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v13, "setIncludeEvents:", [v14 BOOLValue]);

  __int16 v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472LL;
  __int16 v30 = sub_10001D7F0;
  v31 = &unk_1000D1B30;
  __int16 v15 = v11;
  v32 = v15;
  v34 = v40;
  v35 = v38;
  v36 = &v42;
  v37 = &v48;
  v16 = v12;
  v33 = v16;
  -[W5DiagnosticsTestRequestInternal setReply:](v13, "setReply:", &v28);
  -[W5DiagnosticsManager addRequest:](self->_diagnosticsManager, "addRequest:", v13);
  dispatch_time_t v17 = dispatch_time(0LL, 60000000000LL);
  if (dispatch_semaphore_wait(v16, v17) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v59 = 0x404E000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
  }

  if (v43[5])
  {
    uint64_t v18 = sub_10008C90C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v43[5];
      *(_DWORD *)buf = 136315906;
      uint64_t v59 = (uint64_t)"-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]";
      __int16 v60 = 2080;
      v61 = "W5PeerDiagnosticsListener.m";
      __int16 v62 = 1024;
      int v63 = 116;
      __int16 v64 = 2114;
      uint64_t v65 = v20;
      int v27 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) Replying with error %{public}@",  buf,  v27,  v28,  v29,  v30,  v31,  v32);
    }

    uint64_t v21 = v43[5];
    v56 = @"testError";
    uint64_t v57 = v21;
    __int16 v22 = &v56;
    v23 = &v57;
  }

  else
  {
    uint64_t v24 = v49[5];
    v54 = @"testResults";
    uint64_t v55 = v24;
    __int16 v22 = &v54;
    v23 = &v55;
  }

  int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  1LL));

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v25;
}

- (W5DiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end