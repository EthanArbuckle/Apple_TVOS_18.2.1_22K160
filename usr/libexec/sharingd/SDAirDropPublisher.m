@interface SDAirDropPublisher
- (SDAirDropPublisher)initWithPort:(id)a3 identity:(__SecIdentity *)a4;
- (SDAirDropPublisherDelegate)delegate;
- (void)addObservers;
- (void)dealloc;
- (void)invalidate;
- (void)publish;
- (void)publishCallBack:(id *)a3;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)updateTXTRecordAndNotify;
@end

@implementation SDAirDropPublisher

- (SDAirDropPublisher)initWithPort:(id)a3 identity:(__SecIdentity *)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SDAirDropPublisher;
  v8 = -[SDAirDropPublisher init](&v24, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_port, a3);
    objc_storeWeak((id *)&v9->_delegate, 0LL);
    v9->_service = 0LL;
    v9->_retryCount = 0LL;
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    txtRecord = v9->_txtRecord;
    v9->_txtRecord = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v9->_properties;
    v9->_properties = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v9->_monitor;
    v9->_monitor = (SDStatusMonitor *)v14;

    if (a4) {
      v16 = (__SecIdentity *)CFRetain(a4);
    }
    else {
      v16 = 0LL;
    }
    v9->_identity = v16;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000246C4;
    v22[3] = &unk_1005CB2F8;
    v17 = v9;
    v23 = v17;
    v18 = sub_100114598(0, &_dispatch_main_q, v22);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    restartTimer = v17->_restartTimer;
    v17->_restartTimer = (OS_dispatch_source *)v19;

    v17->_bonjourNameConflictDetected = 0;
    dispatch_resume((dispatch_object_t)v17->_restartTimer);
    -[SDAirDropPublisher addObservers](v17, "addObservers");
  }

  return v9;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropPublisher;
  -[SDAirDropPublisher dealloc](&v4, "dealloc");
}

- (void)publishCallBack:(id *)a3
{
  p_int var1 = &a3->var1;
  int var1 = a3->var1;
  if (a3->var0 == kCFStreamErrorDomainNetServices && var1 == -72001)
  {
    v12 = (os_log_s *)sub_100033FB8(0LL, 0);
    uint64_t v16 = airdrop_log(v12);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002516C((uint64_t)v12, v17, v18, v19, v20, v21, v22, v23);
    }

    self->_bonjourNameConflictDetected = 1;
    sub_100034244();
    restartTimer = self->_restartTimer;
    dispatch_time_t v25 = sub_100114580(1.0);
    sub_100114638((dispatch_source_s *)restartTimer, v25);
    goto LABEL_20;
  }

  if (!var1)
  {
    self->_int64_t retryCount = 0LL;
    uint64_t v26 = airdrop_log(self);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef Name = CFNetServiceGetName(self->_service);
      *(_DWORD *)v31 = 138412290;
      *(void *)&v31[4] = Name;
      v28 = "Bonjour advertise %@ started";
      v29 = v12;
      uint32_t v30 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, v31, v30);
    }

- (void)updateTXTRecordAndNotify
{
  if (self->_service)
  {
    if (SFWalletAppAvailable())
    {
      if (-[SDStatusMonitor myAppleIDIsManaged](self->_monitor, "myAppleIDIsManaged")) {
        uint64_t v3 = 871LL;
      }
      else {
        uint64_t v3 = 887LL;
      }
    }

    else
    {
      uint64_t v3 = 871LL;
    }

    int v4 = MGGetBoolAnswer(@"jMiqevikb6QWeHOhvLsw6A");
    uint64_t v5 = v3 | 0x80;
    if (!v4) {
      uint64_t v5 = v3;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v5));
    p_txtRecord = &self->_txtRecord;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_txtRecord,  "setObject:forKeyedSubscript:",  v6,  @"flags");

    if (-[SDStatusMonitor enableStrangers](self->_monitor, "enableStrangers"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self->_monitor, "discoverableMode"));
      unsigned int v9 = [v8 isEqual:kSFOperationDiscoverableModeEveryone];

      if (v9)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bleAuthTag]);

        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( *p_txtRecord,  "setObject:forKeyedSubscript:",  v12,  @"atag");
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( *p_txtRecord,  "setObject:forKeyedSubscript:",  0LL,  @"atag");
      }
    }

    BOOL v13 = (const __CFData *)objc_claimAutoreleasedReturnValue( +[NSNetService dataFromTXTRecordDictionary:]( &OBJC_CLASS___NSNetService,  "dataFromTXTRecordDictionary:",  *p_txtRecord));
    if (v13)
    {
      CFNetServiceSetTXTData(self->_service, v13);
    }

    else
    {
      uint64_t v14 = airdrop_log(0LL);
      dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000252A8(v15, v16, v17, v18, v19, v20, v21, v22);
      }

      uint64_t v24 = airdrop_log(v23);
      dispatch_time_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100025240((uint64_t)&self->_txtRecord, v25, v26, v27, v28, v29, v30, v31);
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100024B90;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.UserPictureChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.ComputerNameChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"SDNotificationNameNearbyBLEAuthTagChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)publish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    service = self->_service;

    if (!service)
    {
      clientContext.version = 0LL;
      clientContext.info = self;
      clientContext.retain = (CFAllocatorRetainCallBack)&_CFRetain;
      clientContext.release = (CFAllocatorReleaseCallBack)&_CFRelease;
      clientContext.copyDescription = 0LL;
      uint64_t v5 = sub_100033FB8(0LL, self->_bonjourNameConflictDetected);
      self->_bonjourNameConflictDetected = 0;
      if (v5)
      {
        v6 = v5;
        error.domain = 0LL;
        *(void *)&error.CFStreamError error = 0LL;
        uint64_t v7 = sub_10008E590();
        v8 = CFNetServiceCreate( kCFAllocatorDefault,  @"local",  v7,  v6,  -[NSNumber intValue](self->_port, "intValue"));
        self->_service = v8;
        CFNetServiceSetClient(v8, (CFNetServiceClientCallBack)sub_100024F04, &clientContext);
        unsigned int v9 = self->_service;
        Main = CFRunLoopGetMain();
        CFNetServiceScheduleWithRunLoop(v9, Main, kCFRunLoopDefaultMode);
        -[SDAirDropPublisher updateTXTRecordAndNotify](self, "updateTXTRecordAndNotify");
        BOOL v11 = sub_1001164C4();
        if (v11 || (BOOL v11 = -[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode")))
        {
          CFOptionFlags v12 = 2049LL;
        }

        else
        {
          BOOL v11 = -[SDStatusMonitor registerAllInterfaces](self->_monitor, "registerAllInterfaces");
          if (v11) {
            CFOptionFlags v12 = 1050625LL;
          }
          else {
            CFOptionFlags v12 = 3147777LL;
          }
        }

        uint64_t v22 = airdrop_log(v11);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Bonjour advertise %@", buf, 0xCu);
        }

        uint64_t v24 = CFNetServiceRegisterWithOptions(self->_service, v12, &error);
        if (!(_DWORD)v24)
        {
          uint64_t v25 = airdrop_log(v24);
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_100025310();
          }
        }

        CFRelease(v6);
      }

      else
      {
        uint64_t v13 = airdrop_log(0LL);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000252DC(v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }
  }

- (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100024F68;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)stop
{
  if (self->_service)
  {
    -[NSMutableDictionary removeAllObjects](self->_txtRecord, "removeAllObjects");
    uint64_t v3 = airdrop_log(-[SDStatusMonitor setAirDropPublished:](self->_monitor, "setAirDropPublished:", 0LL));
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef Name = CFNetServiceGetName(self->_service);
      int v8 = 138412290;
      CFStringRef v9 = Name;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Bonjour advertise %@ stopped",  (uint8_t *)&v8,  0xCu);
    }

    service = self->_service;
    Main = CFRunLoopGetMain();
    CFNetServiceUnscheduleFromRunLoop(service, Main, kCFRunLoopDefaultMode);
    CFNetServiceSetClient(self->_service, 0LL, 0LL);
    CFNetServiceCancel(self->_service);
    CFRelease(self->_service);
    if (!-[SDStatusMonitor disableRotation](self->_monitor, "disableRotation")) {
      sub_100034244();
    }
    self->_service = 0LL;
  }

- (void)invalidate
{
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    dispatch_source_cancel((dispatch_source_t)restartTimer);
    int v4 = self->_restartTimer;
    self->_restartTimer = 0LL;
  }

- (SDAirDropPublisherDelegate)delegate
{
  return (SDAirDropPublisherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end