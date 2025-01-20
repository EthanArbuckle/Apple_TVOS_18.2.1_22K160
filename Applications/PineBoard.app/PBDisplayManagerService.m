@interface PBDisplayManagerService
- (BOOL)ensuredValidEntitlementWithReply:(id)a3;
- (PBDisplayManagerService)init;
- (PBDisplayManagerService)initWithRemoteConnection:(id)a3;
- (PBSystemServiceConnection)remoteConnection;
- (void)displayAssistantDidCompleteForKind:(id)a3;
- (void)displayAssistantDidStartForKind:(id)a3;
- (void)enableAtmos:(BOOL)a3;
- (void)enableHDR10PlusMetadata:(BOOL)a3;
- (void)enableModeSwitchingForDynamicRange:(BOOL)a3;
- (void)enableModeSwitchingForFrameRate:(BOOL)a3;
- (void)enableQMSForFrameRateSwitching:(BOOL)a3;
- (void)fetchCurrentDisplayStateWithReply:(id)a3;
- (void)forgetDisplaysForDisplayAssistant;
- (void)handleRegionChangeWithNewCountryCode:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)presentDisplayAssistantWithRequest:(id)a3 reply:(id)a4;
- (void)removeCableCheckHistory;
- (void)setAudioLatency:(id)a3 forKey:(id)a4;
- (void)setColorCalibration:(id)a3 forKey:(id)a4;
- (void)setColorCalibration:(id)a3 forKeys:(id)a4;
- (void)setColorGains:(id)a3;
- (void)sleepDisplayWithReply:(id)a3;
- (void)updateDisplayManagerWithRequest:(id)a3 reply:(id)a4;
- (void)updateSoftwareDisplaySize:(CGSize)a3;
- (void)wakeDisplayWithReply:(id)a3;
@end

@implementation PBDisplayManagerService

- (PBDisplayManagerService)init
{
  return 0LL;
}

- (PBDisplayManagerService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBDisplayManagerService;
  v5 = -[PBDisplayManagerService init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
  }

  return v6;
}

- (void)invalidate
{
  id v3 = sub_100082A9C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "displayManagerService invalidated %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (BOOL)ensuredValidEntitlementWithReply:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteConnection]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.appletv.pbs.display-manager-service-access"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    id v9 = sub_100082A9C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100277D84(v10);
    }

    if (v4)
    {
      v11 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
      v16 = @"You do not have the right entitlement to update the display.";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      v13 = -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  @"com.apple.PineBoard.PBDisplayManagerService",  0LL,  v12);
      v4[2](v4, 0LL, v13);
    }
  }

  return v8;
}

- (void)updateDisplayManagerWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", v7))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100080B78;
    v8[3] = &unk_1003D0070;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)sleepDisplayWithReply:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", v4))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100080CCC;
    block[3] = &unk_1003D0110;
    id v6 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)wakeDisplayWithReply:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", v4))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100080E20;
    block[3] = &unk_1003D0110;
    id v6 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)handleRegionChangeWithNewCountryCode:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", v7))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100080F9C;
    v8[3] = &unk_1003D0070;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)presentDisplayAssistantWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", v7))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100081118;
    v8[3] = &unk_1003D0070;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)forgetDisplaysForDisplayAssistant
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL)) {
    dispatch_async(&_dispatch_main_q, &stru_1003D34F0);
  }
}

- (void)removeCableCheckHistory
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL)) {
    dispatch_async(&_dispatch_main_q, &stru_1003D3510);
  }
}

- (void)displayAssistantDidStartForKind:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008144C;
    block[3] = &unk_1003CFF08;
    id v6 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)setAudioLatency:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000815C8;
    v8[3] = &unk_1003CFEB8;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)setColorCalibration:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100081744;
    v8[3] = &unk_1003CFEB8;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)setColorCalibration:(id)a3 forKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000818C0;
    v8[3] = &unk_1003CFEB8;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)setColorGains:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100081A14;
    block[3] = &unk_1003CFF08;
    id v6 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)displayAssistantDidCompleteForKind:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100081B68;
    block[3] = &unk_1003CFF08;
    id v6 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)fetchCurrentDisplayStateWithReply:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100081CAC;
  block[3] = &unk_1003D0110;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)enableModeSwitchingForDynamicRange:(BOOL)a3
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100081DE4;
    block[3] = &unk_1003D3530;
    BOOL v5 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)enableModeSwitchingForFrameRate:(BOOL)a3
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100081F1C;
    block[3] = &unk_1003D3530;
    BOOL v5 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)enableQMSForFrameRateSwitching:(BOOL)a3
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100082054;
    block[3] = &unk_1003D3530;
    BOOL v5 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)enableHDR10PlusMetadata:(BOOL)a3
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008218C;
    block[3] = &unk_1003D3530;
    BOOL v5 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)enableAtmos:(BOOL)a3
{
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000822C4;
    block[3] = &unk_1003D3530;
    BOOL v5 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)updateSoftwareDisplaySize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (-[PBDisplayManagerService ensuredValidEntitlementWithReply:](self, "ensuredValidEntitlementWithReply:", 0LL))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100082400;
    v5[3] = &unk_1003D32B0;
    *(CGFloat *)&v5[4] = width;
    *(CGFloat *)&v5[5] = height;
    dispatch_async(&_dispatch_main_q, v5);
  }

- (PBSystemServiceConnection)remoteConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (void).cxx_destruct
{
}

@end