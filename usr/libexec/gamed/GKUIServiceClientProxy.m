@interface GKUIServiceClientProxy
- (BOOL)isUIService;
- (GKClientProxy)hostClient;
- (void)dealloc;
- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)handleNewHostClient:(id)a3;
- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4;
- (void)setHostClient:(id)a3;
- (void)setHostPID:(int)a3 reply:(id)a4;
- (void)terminateWithCompletionHandler:(id)a3;
@end

@implementation GKUIServiceClientProxy

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  [v3 setViewService:0];

  -[GKUIServiceClientProxy setHostClient:](self, "setHostClient:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKUIServiceClientProxy;
  -[GKClientProxy dealloc](&v4, "dealloc");
}

- (BOOL)isUIService
{
  return 1;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid attempt to set extension proxy(%@) on viewService(%@)",  a4,  a3,  self));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUIServiceClientProxy.m"));
  id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v4,  "-[GKUIServiceClientProxy setExtensionProxy:forBundleID:]",  [v6 UTF8String],  35));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v7);
}

- (void)terminateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001009D8;
    block[3] = &unk_10026B120;
    id v7 = v3;
    dispatch_barrier_async(v5, block);
  }
}

- (void)handleNewHostClient:(id)a3
{
}

- (void)setHostPID:(int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForProcessIdentifier:](&OBJC_CLASS___GKClientProxy, "clientForProcessIdentifier:", v4));
  v8 = (void *)v7;
  if (!v7)
  {
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers(0LL);
    }
    v20 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_1001011A4(v4, v20);
      if (v6) {
        goto LABEL_13;
      }
    }

    else if (v6)
    {
      goto LABEL_13;
    }

    v16 = 0LL;
    goto LABEL_15;
  }

  -[GKUIServiceClientProxy setHostClient:](self, "setHostClient:", v7);
  id v9 = -[GKUIServiceClientProxy handleNewHostClient:](self, "handleNewHostClient:", v8);
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers(v9);
  }
  v11 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v8;
    __int16 v31 = 1024;
    int v32 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Associating view service %@ with client %@ : pid(%d)",  buf,  0x1Cu);
  }

  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 currentGame]);
  id v14 = [v8 environment];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100100CD8;
  v25[3] = &unk_10026B670;
  v15 = v12;
  v26 = v15;
  -[GKClientProxy setCurrentGame:serverEnvironment:reply:]( self,  "setCurrentGame:serverEnvironment:reply:",  v13,  v14,  v25);

  dispatch_group_enter(v15);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100100CE0;
  v23[3] = &unk_100271B50;
  v23[4] = self;
  v16 = v15;
  v24 = v16;
  [v8 getAuthenticatedLocalPlayersWithStatus:1 handler:v23];

  if (v6)
  {
    if (v16)
    {
      v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100100D60;
      v21[3] = &unk_10026B120;
      v22 = (dispatch_queue_s *)v6;
      dispatch_group_notify(v16, v17, v21);

      v18 = v22;
LABEL_14:

      goto LABEL_15;
    }

- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v17 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy clientForProcessIdentifier:]( &OBJC_CLASS___GKClientProxy,  "clientForProcessIdentifier:",  v6));
  -[GKUIServiceClientProxy setHostClient:](self, "setHostClient:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  unsigned int v11 = [v10 isExtension];

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 hostClient]);

    id v9 = (void *)v13;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 credentialForPlayer:v17]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 transportWithCredential:v14]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  -[GKClientProxy getServicesWithTransport:forClient:reply:]( self,  "getServicesWithTransport:forClient:reply:",  v15,  v16,  v8);
}

- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  if (v10)
  {
    unsigned int v11 = v10;
    if ([v10 pid] != a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUIServiceClientProxy.m"));
      id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (hostClient.pid == pid)\n[%s (%s:%d)]",  v12,  "-[GKUIServiceClientProxy getPrivateServicesForPID:localPlayer:reply:]",  [v14 UTF8String],  129));

      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
    unsigned int v17 = [v16 isExtension];

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 hostClient]);

      unsigned int v11 = (void *)v19;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v11 credentialForPlayer:v8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v11 transportWithCredential:v20]);
    -[GKClientProxy getPrivateServicesWithTransport:forClient:reply:]( self,  "getPrivateServicesWithTransport:forClient:reply:",  v21,  v11,  v9);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers(0LL);
    }
    v23 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100101218(v23);
    }
    v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001010E0;
    block[3] = &unk_10026B120;
    id v26 = v9;
    dispatch_async(v24, block);

    unsigned int v11 = v26;
  }
}

- (GKClientProxy)hostClient
{
  return (GKClientProxy *)objc_loadWeakRetained((id *)&self->_hostClient);
}

- (void)setHostClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end