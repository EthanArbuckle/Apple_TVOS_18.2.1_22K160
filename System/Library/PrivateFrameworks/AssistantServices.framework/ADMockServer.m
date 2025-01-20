@interface ADMockServer
+ (id)sharedServer;
- (BOOL)_establishConnectionIfNeeded;
- (void)replayWithFileURL:(id)a3 completion:(id)a4;
@end

@implementation ADMockServer

- (BOOL)_establishConnectionIfNeeded
{
  if (!self->_connection)
  {
    v3 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.siri.MockServer");
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AMSMockServerProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_connection, "resume");
    v7 = self->_connection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007D56C;
    v11[3] = &unk_1004FBD90;
    v11[4] = self;
    v8 = (AMSMockServerProtocol *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( v7,  "remoteObjectProxyWithErrorHandler:",  v11));
    remoteProxy = self->_remoteProxy;
    self->_remoteProxy = v8;
  }

  return self->_remoteProxy != 0LL;
}

- (void)replayWithFileURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0LL;
  unsigned int v8 = [v6 checkResourceIsReachableAndReturnError:&v18];
  id v9 = v18;
  if (v8)
  {
    if (_AFPreferencesAuthenticationDisabled())
    {
      if (-[ADMockServer _establishConnectionIfNeeded](self, "_establishConnectionIfNeeded"))
      {
        remoteProxy = self->_remoteProxy;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10007D558;
        v16[3] = &unk_1004FCC00;
        id v17 = v7;
        -[AMSMockServerProtocol startMockServerWithReplayFile:withReply:]( remoteProxy,  "startMockServerWithReplayFile:withReply:",  v6,  v16);

        goto LABEL_10;
      }

      NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
      v26 = @"mock server connection not available";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      uint64_t v13 = kAFAssistantErrorDomain;
      uint64_t v14 = 2301LL;
    }

    else
    {
      NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
      v24 = @"mock server requires mobile default com.apple.assistant 'Authentication Disabled' set to YES";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      uint64_t v13 = kAFAssistantErrorDomain;
      uint64_t v14 = 2300LL;
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v14,  v12));

    id v9 = (id)v15;
    goto LABEL_10;
  }

  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ADMockServer replayWithFileURL:completion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Cannot play MockServer replay file at: %@",  buf,  0x16u);
  }

- (void).cxx_destruct
{
}

+ (id)sharedServer
{
  if (qword_100577B10 != -1) {
    dispatch_once(&qword_100577B10, &stru_1004EF2B0);
  }
  return (id)qword_100577B18;
}

@end