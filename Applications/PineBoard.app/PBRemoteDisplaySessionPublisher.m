@interface PBRemoteDisplaySessionPublisher
- (BOOL)internetIsAvailable;
- (BOOL)isDedicated;
- (BOOL)systemIsAwake;
- (BSAtomicSignal)invalidationSignal;
- (NSString)continuityDeviceModel;
- (NSString)remoteDisplayDiscoveryPeerIdentifier;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)retryTimer;
- (PBRemoteDisplaySessionPublisher)init;
- (PBRemoteDisplaySessionPublisher)initWithSystemStatusSink:(id)a3 remoteDisplayDiscovery:(id)a4;
- (PBSSystemStatusSink)systemStatusSink;
- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery;
- (unint64_t)retryCount;
- (unint64_t)sessionType;
- (unint64_t)startSessionTime;
- (unsigned)remoteDisplayDiscoveryState;
- (void)_queue_activate;
- (void)_queue_cancelRetryTimer;
- (void)_queue_requestDedicatedConnectionIfNecessary;
- (void)_queue_retryIfNecessary;
- (void)_queue_sendMessageIfNecessary;
- (void)_queue_setRetryTime:(int64_t)a3;
- (void)_queue_updateRemoteDisplayDiscoveryStateSystemStatus;
- (void)_reportAnalyticsForCompletedSession;
- (void)_setupRetryTimer;
- (void)_trackAnalyticsForDevice:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setInternetIsAvailable:(BOOL)a3;
- (void)setIsDedicated:(BOOL)a3;
- (void)setRemoteDisplayDiscoveryState:(unsigned __int8)a3;
- (void)setRemoteDisplayDiscoveryState:(unsigned __int8)a3 peerIdentifier:(id)a4;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setStartSessionTime:(unint64_t)a3;
- (void)setSystemIsAwake:(BOOL)a3;
- (void)systemDidSleep;
- (void)systemDidWake;
@end

@implementation PBRemoteDisplaySessionPublisher

- (PBRemoteDisplaySessionPublisher)initWithSystemStatusSink:(id)a3 remoteDisplayDiscovery:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"systemStatusSink != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273C54();
    }
LABEL_15:
    _bs_set_crash_log_message([v26 UTF8String]);
    __break(0);
    JUMPOUT(0x1000503FCLL);
  }

  id v9 = v8;
  Class v10 = NSClassFromString(@"RPRemoteDisplayDiscovery");
  if (!v9)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273D10();
    }
    _bs_set_crash_log_message([v27 UTF8String]);
    __break(0);
    JUMPOUT(0x100050460LL);
  }

  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:RPRemoteDisplayDiscoveryClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273DB4();
    }
    goto LABEL_15;
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___PBRemoteDisplaySessionPublisher;
  v11 = -[PBRemoteDisplaySessionPublisher init](&v37, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_systemStatusSink, a3);
    v12->_queue_systemIsAwake = 1;
    -[PBRemoteDisplaySessionPublisher _trackAnalyticsForDevice:](v12, "_trackAnalyticsForDevice:", 0LL);
    v13 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
    invalidationSignal = v12->_invalidationSignal;
    v12->_invalidationSignal = v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.PineBoard.RemoteDisplaySessionPublisher", v18);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v19;

    objc_initWeak(&location, v12);
    objc_storeStrong((id *)&v12->_queue_remoteDisplayDiscovery, a4);
    -[RPRemoteDisplayDiscovery setDiscoveryFlags:]( v12->_queue_remoteDisplayDiscovery,  "setDiscoveryFlags:",  (unint64_t)-[RPRemoteDisplayDiscovery discoveryFlags](v12->_queue_remoteDisplayDiscovery, "discoveryFlags") | 3);
    -[RPRemoteDisplayDiscovery setDispatchQueue:](v12->_queue_remoteDisplayDiscovery, "setDispatchQueue:", v12->_queue);
    queue_remoteDisplayDiscovery = v12->_queue_remoteDisplayDiscovery;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100050510;
    v34[3] = &unk_1003D1FB8;
    objc_copyWeak(&v35, &location);
    -[RPRemoteDisplayDiscovery setDiscoverySessionStateChangedHandler:]( queue_remoteDisplayDiscovery,  "setDiscoverySessionStateChangedHandler:",  v34);
    v22 = v12->_queue_remoteDisplayDiscovery;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10005074C;
    v32[3] = &unk_1003D1FE0;
    objc_copyWeak(&v33, &location);
    -[RPRemoteDisplayDiscovery setDedicatedDeviceChangedHandler:](v22, "setDedicatedDeviceChangedHandler:", v32);
    v23 = v12->_queue_remoteDisplayDiscovery;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100050858;
    v30[3] = &unk_1003D1FE0;
    objc_copyWeak(&v31, &location);
    -[RPRemoteDisplayDiscovery setDeviceFoundHandler:](v23, "setDeviceFoundHandler:", v30);
    -[PBRemoteDisplaySessionPublisher _setupRetryTimer](v12, "_setupRetryTimer");
    v24 = (dispatch_queue_s *)v12->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005098C;
    block[3] = &unk_1003CFF08;
    v29 = v12;
    dispatch_async(v24, block);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (PBRemoteDisplaySessionPublisher)init
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___PBSSystemStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDiscovery);
  v6 = -[PBRemoteDisplaySessionPublisher initWithSystemStatusSink:remoteDisplayDiscovery:]( self,  "initWithSystemStatusSink:remoteDisplayDiscovery:",  v4,  v5);

  return v6;
}

- (void)dealloc
{
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___PBRemoteDisplaySessionPublisher;
    -[PBRemoteDisplaySessionPublisher dealloc](&v4, "dealloc");
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_invalidationSignal hasBeenSignalled]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273E58();
    }
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
  }

- (void)activate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050B20;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemDidWake
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050B90;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemDidSleep
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050C0C;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setInternetIsAvailable:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100050C88;
  v4[3] = &unk_1003D2008;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (BOOL)internetIsAvailable
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050D5C;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)invalidate
{
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    id v3 = sub_1000F77BC();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%p] Invalidating...", buf, 0xCu);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100050E58;
    block[3] = &unk_1003CFF08;
    void block[4] = self;
    dispatch_barrier_async_and_wait(queue, block);
  }

- (void)setRemoteDisplayDiscoveryState:(unsigned __int8)a3 peerIdentifier:(id)a4
{
  int v5 = a3;
  id v7 = (NSString *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_remoteDisplayDiscoveryState != v5 || self->_queue_remoteDisplayDiscoveryPeerIdentifier != v7)
  {
    id v8 = sub_1000F77BC();
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      Class v10 = "?";
      if (v5 == 1) {
        Class v10 = "InSession";
      }
      int v11 = 134218498;
      v12 = self;
      if (!v5) {
        Class v10 = "OutOfSession";
      }
      __int16 v13 = 2082;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[%p] RemoteDisplayDiscovery state updated {state=%{public}s} with %@",  (uint8_t *)&v11,  0x20u);
    }

    self->_queue_remoteDisplayDiscoveryState = v5;
    objc_storeStrong((id *)&self->_queue_remoteDisplayDiscoveryPeerIdentifier, a4);
    -[PBRemoteDisplaySessionPublisher _queue_updateRemoteDisplayDiscoveryStateSystemStatus]( self,  "_queue_updateRemoteDisplayDiscoveryStateSystemStatus");
  }
}

- (void)_queue_activate
{
  id v3 = sub_1000F77BC();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    char v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%p] RemoteDisplayDiscovery activating...",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue_remoteDisplayDiscovery = self->_queue_remoteDisplayDiscovery;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000510FC;
  v6[3] = &unk_1003D2030;
  objc_copyWeak(&v7, (id *)buf);
  -[RPRemoteDisplayDiscovery activateWithCompletion:](queue_remoteDisplayDiscovery, "activateWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_queue_updateRemoteDisplayDiscoveryStateSystemStatus
{
  BOOL v2 = self->_queue_remoteDisplayDiscoveryState == 1;
  id v3 = self->_systemStatusSink;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000512D4;
  v5[3] = &unk_1003D2008;
  uint64_t v6 = v3;
  BOOL v7 = v2;
  objc_super v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)_queue_requestDedicatedConnectionIfNecessary
{
  id v3 = sub_1000F77BC();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    uint64_t v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "[%p] send dedicated connection request if necessary",  (uint8_t *)&v5,  0xCu);
  }

  -[PBRemoteDisplaySessionPublisher _queue_sendMessageIfNecessary](self, "_queue_sendMessageIfNecessary");
}

- (void)_queue_sendMessageIfNecessary
{
  int v21 = _os_feature_enabled_impl("Sharing", "DedicatedLaguna");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = [v3 BOOLForKey:@"disableAutomaticDedicatedConnection"];

  int queue_remoteDisplayDiscoveryState = self->_queue_remoteDisplayDiscoveryState;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery dedicatedDevice](self->_queue_remoteDisplayDiscovery, "dedicatedDevice"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentIdentifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery discoveredDevices](self->_queue_remoteDisplayDiscovery, "discoveredDevices"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000516AC;
  v25[3] = &unk_1003D1F90;
  id v9 = v7;
  id v26 = v9;
  unsigned int v10 = objc_msgSend(v8, "bs_containsObjectPassingTest:", v25);

  BOOL queue_internetIsAvailable = self->_queue_internetIsAvailable;
  BOOL queue_systemIsAwake = self->_queue_systemIsAwake;
  BOOL v13 = !self->_queue_systemIsAwake;
  char v14 = v21 ^ 1 | v4 | (queue_remoteDisplayDiscoveryState == 1);
  if (!v9) {
    char v14 = 1;
  }
  char v15 = v14 | v10 ^ 1;
  else {
    char v16 = 1;
  }
  id v17 = sub_1000F77BC();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (((v16 | v13) & 1) != 0)
  {
    if (v19)
    {
      *(_DWORD *)buf = 134219776;
      v28 = self;
      __int16 v29 = 1024;
      *(_DWORD *)v30 = v21;
      *(_WORD *)&void v30[4] = 1024;
      *(_DWORD *)&v30[6] = v4;
      __int16 v31 = 1024;
      BOOL v32 = queue_remoteDisplayDiscoveryState == 1;
      __int16 v33 = 1024;
      BOOL v34 = v9 != 0LL;
      __int16 v35 = 1024;
      unsigned int v36 = v10;
      __int16 v37 = 1024;
      BOOL v38 = queue_internetIsAvailable;
      __int16 v39 = 1024;
      BOOL v40 = queue_systemIsAwake;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%p] skipping automatic connection message isEnabled:%{BOOL}d disableDedicatedDefault:%{BOOL}d isActive:%{BOOL}d hasDedicatedDevice:%{BOOL}d dedicatedDeviceIsDiscovered:%{BOOL}d isInternetAvailable:%{BOOL}d isSystemAwake:%{BOOL}d",  buf,  0x36u);
    }
  }

  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 134218242;
      v28 = self;
      __int16 v29 = 2112;
      *(void *)v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%p] send automatic connection message to %@",  buf,  0x16u);
    }

    objc_initWeak((id *)buf, self);
    queue_remoteDisplayDiscovery = self->_queue_remoteDisplayDiscovery;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000516EC;
    v22[3] = &unk_1003D2058;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v9;
    -[RPRemoteDisplayDiscovery requestDedicatedDeviceConfirmationWithCompletion:]( queue_remoteDisplayDiscovery,  "requestDedicatedDeviceConfirmationWithCompletion:",  v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_trackAnalyticsForDevice:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 statusFlags];
    unint64_t v7 = (unint64_t)[v5 statusFlags];
    unint64_t v8 = (unint64_t)[v5 statusFlags];
    if ((v6 & 0x80000) != 0)
    {
      unint64_t v10 = 1LL;
    }

    else if ((v7 & 0x1000000000LL) != 0)
    {
      unint64_t v10 = 2LL;
    }

    else
    {
      if ((v8 & 0x2000000000LL) == 0)
      {
        self->_sessionType = 0LL;
LABEL_11:
        int v11 = (NSString *)objc_claimAutoreleasedReturnValue([v5 model]);
        continuityDeviceModel = self->_continuityDeviceModel;
        self->_continuityDeviceModel = v11;

        self->_startSessionTime = mach_continuous_time();
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDiscovery dedicatedDevice]( self->_queue_remoteDisplayDiscovery,  "dedicatedDevice"));
        char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistentIdentifier]);

        char v15 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentIdentifier]);
        self->_isDedicated = [v15 isEqualToString:v14];

        goto LABEL_12;
      }

      unint64_t v10 = 3LL;
    }

    self->_sessionType = v10;
    goto LABEL_11;
  }

  id v9 = self->_continuityDeviceModel;
  self->_continuityDeviceModel = 0LL;

  self->_sessionType = 0LL;
  self->_startSessionTime = 0LL;
  self->_isDedicated = 0;
LABEL_12:
}

- (void)_reportAnalyticsForCompletedSession
{
  if (self->_startSessionTime)
  {
    uint64_t v3 = mach_continuous_time();
    id v4 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (int)BSTimeDifferenceFromMachTimeToMachTime(self->_startSessionTime, v3));
    int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    continuityDeviceModel = (__CFString *)self->_continuityDeviceModel;
    if (!continuityDeviceModel) {
      continuityDeviceModel = @"Unknown";
    }
    unint64_t v7 = continuityDeviceModel;
    unint64_t v8 = self->_sessionType - 1;
    if (v8 > 2) {
      id v9 = @"unknown";
    }
    else {
      id v9 = *(&off_1003D20A0 + v8);
    }
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isDedicated));
    v21[0] = @"continuityDeviceModel";
    v21[1] = @"duration";
    v22[0] = v7;
    v22[1] = v5;
    v21[2] = @"isDedicated";
    v21[3] = @"sessionType";
    v22[2] = v10;
    v22[3] = v9;
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
    id v12 = sub_1000F77BC();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "[%p] Record analytics for completed session: %@",  buf,  0x16u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100051B20;
    v15[3] = &unk_1003D2080;
    id v16 = v11;
    id v14 = v11;
    AnalyticsSendEventLazy(@"com.apple.pineboard.continuitycamerasession", v15);
    -[PBRemoteDisplaySessionPublisher _trackAnalyticsForDevice:](self, "_trackAnalyticsForDevice:", 0LL);
  }

- (void)_setupRetryTimer
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  retryTimer = self->_retryTimer;
  self->_retryTimer = v3;

  dispatch_source_set_timer( (dispatch_source_t)self->_retryTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0xF4240uLL);
  objc_initWeak(&location, self);
  int v5 = self->_retryTimer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100051C14;
  v6[3] = &unk_1003D0890;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v5, v6);
  dispatch_activate((dispatch_object_t)self->_retryTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_queue_cancelRetryTimer
{
  id v3 = sub_1000F77BC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unsigned int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%p] Cancel retry timer", (uint8_t *)&v5, 0xCu);
  }

  self->_retryCount = 0LL;
  dispatch_source_set_timer( (dispatch_source_t)self->_retryTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0xF4240uLL);
}

- (void)_queue_setRetryTime:(int64_t)a3
{
  if (self->_retryCount <= 1 && self->_queue_remoteDisplayDiscoveryState != 1)
  {
    id v6 = sub_1000F77BC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      int v11 = self;
      __int16 v12 = 2050;
      int64_t v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%p] Queueing up dedicated camera message to be sent if necessary in %{public}zu seconds...",  (uint8_t *)&v10,  0x16u);
    }

    retryTimer = self->_retryTimer;
    dispatch_time_t v9 = dispatch_time(0LL, 1000000000 * a3);
    dispatch_source_set_timer((dispatch_source_t)retryTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  }

- (void)_queue_retryIfNecessary
{
  unint64_t retryCount = self->_retryCount;
  if (retryCount > 1 || self->_queue_remoteDisplayDiscoveryState == 1)
  {
    -[PBRemoteDisplaySessionPublisher _queue_cancelRetryTimer](self, "_queue_cancelRetryTimer");
  }

  else
  {
    self->_unint64_t retryCount = retryCount + 1;
    id v5 = sub_1000F77BC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = self->_retryCount;
      int v9 = 134218754;
      int v10 = self;
      __int16 v11 = 2080;
      __int16 v12 = "-[PBRemoteDisplaySessionPublisher _queue_retryIfNecessary]";
      __int16 v13 = 2048;
      unint64_t v14 = v8;
      __int16 v15 = 1024;
      int v16 = 2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[%p] %s: retryCount: %zu / %i",  (uint8_t *)&v9,  0x26u);
    }

    -[PBRemoteDisplaySessionPublisher _queue_sendMessageIfNecessary](self, "_queue_sendMessageIfNecessary");
  }

- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery
{
  return self->_queue_remoteDisplayDiscovery;
}

- (unsigned)remoteDisplayDiscoveryState
{
  return self->_queue_remoteDisplayDiscoveryState;
}

- (void)setRemoteDisplayDiscoveryState:(unsigned __int8)a3
{
  self->_int queue_remoteDisplayDiscoveryState = a3;
}

- (NSString)remoteDisplayDiscoveryPeerIdentifier
{
  return self->_queue_remoteDisplayDiscoveryPeerIdentifier;
}

- (BOOL)systemIsAwake
{
  return self->_queue_systemIsAwake;
}

- (void)setSystemIsAwake:(BOOL)a3
{
  self->_BOOL queue_systemIsAwake = a3;
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_unint64_t retryCount = a3;
}

- (unint64_t)startSessionTime
{
  return self->_startSessionTime;
}

- (void)setStartSessionTime:(unint64_t)a3
{
  self->_startSessionTime = a3;
}

- (NSString)continuityDeviceModel
{
  return self->_continuityDeviceModel;
}

- (BOOL)isDedicated
{
  return self->_isDedicated;
}

- (void)setIsDedicated:(BOOL)a3
{
  self->_isDedicated = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (BSAtomicSignal)invalidationSignal
{
  return self->_invalidationSignal;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PBSSystemStatusSink)systemStatusSink
{
  return self->_systemStatusSink;
}

- (void).cxx_destruct
{
}

  ;
}

@end