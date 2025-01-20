@interface APSDaemon
- (APSDaemon)init;
- (APSIDSProxyManager)proxyManager;
- (APSPowerAssertion)courierConnectTimerPowerAssertion;
- (APSTaskListener)taskListener;
- (APSUserTracker)userTracker;
- (BOOL)_systemIsReady;
- (BOOL)hasEnabledCouriers;
- (BOOL)systemIsShuttingDown;
- (BOOL)systemReady;
- (NSDate)lastClientConnection;
- (NSMutableDictionary)environmentsToCouriers;
- (NSString)networkGuidanceString;
- (NSTimer)inactivityTerminationTimer;
- (OS_dispatch_source)sigTERMSource;
- (OS_dispatch_source)sigUSR1Source;
- (OS_xpc_object)connection;
- (PCSimpleTimer)courierConnectTimer;
- (double)keepAliveIntervalForEnvironment:(id)a3;
- (double)startupTime;
- (id)JSONDebugString:(BOOL)a3;
- (id)_connectionsDebuggingState;
- (id)courierForEnvironment:(id)a3;
- (id)courierForEnvironmentName:(id)a3;
- (id)createCourierForEnvironment:(id)a3;
- (id)environmentForConnectionPortName:(id)a3 connection:(id)a4;
- (id)getConnectionServerForEnvironment:(id)a3 connectionPortName:(id)a4 processName:(id)a5 enableDarkWake:(BOOL)a6 peerConnection:(id)a7 isNewConnection:(BOOL *)a8;
- (id)prettyStatus;
- (int)isConnectedToken;
- (int)systemReadyToken;
- (void)_clearCourierConnectTimerAndPowerAssertion;
- (void)_clearInactivityTerminationTimer;
- (void)_connectCouriersTimerFired;
- (void)_enableAllCouriers;
- (void)_inactivityTerminationTimerFired:(id)a3;
- (void)_performPeriodicSignal;
- (void)_receivedShutdownNotification;
- (void)_removeCourierForEnvironment:(id)a3;
- (void)_schedulePeriodicSignal;
- (void)_setupNotifyToken;
- (void)_startInactivityTerminationTimerIfNecessary;
- (void)_updateCourierConnectTimerAndPowerAssertion;
- (void)_updateNetworkGuidance;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)courierConnectionStatusDidChange:(id)a3;
- (void)courierHasNoConnections:(id)a3;
- (void)courierIsIdle:(id)a3;
- (void)dealloc;
- (void)finalizeProcessedUsers;
- (void)finishLoggingInUserID:(id)a3;
- (void)flushUser:(id)a3;
- (void)invalidateDeviceIdentity;
- (void)loginForUser:(id)a3;
- (void)loginInUserID:(id)a3;
- (void)logoutUser:(id)a3;
- (void)proxyManager:(id)a3 canUseProxyChanged:(BOOL)a4;
- (void)proxyManager:(id)a3 incomingPresenceWithGuid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 environmentName:(id)a12;
- (void)receivedClientConnection;
- (void)requestCourierConnections;
- (void)rollTokensForAllBAAEnvironments:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCourierConnectTimer:(id)a3;
- (void)setCourierConnectTimerPowerAssertion:(id)a3;
- (void)setEnvironmentsToCouriers:(id)a3;
- (void)setHasEnabledCouriers:(BOOL)a3;
- (void)setInactivityTerminationTimer:(id)a3;
- (void)setIsConnectedToken:(int)a3;
- (void)setLastClientConnection:(id)a3;
- (void)setNetworkGuidanceString:(id)a3;
- (void)setProxyManager:(id)a3;
- (void)setSigTERMSource:(id)a3;
- (void)setSigUSR1Source:(id)a3;
- (void)setStartupTime:(double)a3;
- (void)setSystemIsShuttingDown:(BOOL)a3;
- (void)setSystemReady:(BOOL)a3;
- (void)setSystemReadyToken:(int)a3;
- (void)setTaskListener:(id)a3;
- (void)setUserTracker:(id)a3;
- (void)setupUser:(id)a3;
- (void)shouldUseInternetDidChange:(id)a3;
- (void)updateSafeToSendFilterForce:(BOOL)a3;
@end

@implementation APSDaemon

- (APSDaemon)init
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___APSDaemon;
  id v2 = -[APSDaemon init](&v34, "init");
  if (v2)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "APS daemon launched %@", buf, 0xCu);
    }

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v4;

    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v6;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v2 + 5), &stru_10011ED20);
    dispatch_resume(*((dispatch_object_t *)v2 + 5));
    signal(15, (void (__cdecl *)(int))1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWeakReference weakRefWithObject:](&OBJC_CLASS___CUTWeakReference, "weakRefWithObject:", v2));
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0LL, &_dispatch_main_q);
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    v11 = (dispatch_source_s *)*((void *)v2 + 6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000425C8;
    handler[3] = &unk_10011E4F0;
    id v12 = v8;
    id v33 = v12;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    signal(30, (void (__cdecl *)(int))1);
    [v2 _schedulePeriodicSignal];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_10004269C,  @"com.apple.springboard.deviceWillShutDown",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    [v2 _setupNotifyToken];
    notify_register_check("PCPushIsConnectedToken", (int *)v2 + 4);
    notify_set_state(*((_DWORD *)v2 + 4), 0LL);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_10011ED60);

    v14 = objc_alloc_init(&OBJC_CLASS___APSIDSProxyManager);
    v15 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v14;

    [*((id *)v2 + 7) setDelegate:v2];
    if (!*((void *)v2 + 4))
    {
      v16 = &stru_10011EDA0;
      if (_os_feature_enabled_impl("APS", "SyncXPC"))
      {
        dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
        dispatch_queue_t v19 = dispatch_queue_create("com.apple.apsd.connection_queue", v18);

        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10004279C;
        v30[3] = &unk_10011EDF0;
        v31 = &stru_10011EDA0;
        v16 = objc_retainBlock(v30);
      }

      else
      {
        dispatch_queue_t v19 = &_dispatch_main_q;
      }

      uint64_t v20 = APSXPCCreateServerConnection("com.apple.apsd", 0LL, 0LL, v16, v19);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v21;

      APSSetXPCConnectionContext(*((void *)v2 + 4), v2);
      xpc_connection_resume(*((xpc_connection_t *)v2 + 4));
    }

    if (!*((void *)v2 + 8))
    {
      v23 = -[APSTaskListener initWithQueue:apsDaemon:]( objc_alloc(&OBJC_CLASS___APSTaskListener),  "initWithQueue:apsDaemon:",  &_dispatch_main_q,  v2);
      v24 = (void *)*((void *)v2 + 8);
      *((void *)v2 + 8) = v23;
    }

    v25 = sub_10003A140();
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v26;

    [*((id *)v2 + 3) setResponder:v2];
    [*((id *)v2 + 3) startup];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    *((void *)v2 + 15) = v28;
  }

  return (APSDaemon *)v2;
}

- (void)dealloc
{
  sigTERMSource = self->_sigTERMSource;
  self->_sigTERMSource = 0LL;

  dispatch_source_cancel((dispatch_source_t)self->_sigUSR1Source);
  sigUSR1Source = self->_sigUSR1Source;
  self->_sigUSR1Source = 0LL;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.deviceWillShutDown", 0LL);
  -[APSIDSProxyManager setDelegate:](self->_proxyManager, "setDelegate:", 0LL);
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v7 = self->_connection;
    self->_connection = 0LL;
  }

  taskListener = self->_taskListener;
  if (taskListener)
  {
    self->_taskListener = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSDaemon;
  -[APSDaemon dealloc](&v9, "dealloc");
}

- (id)prettyStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APSStatusPrinter statusPrinter](&OBJC_CLASS___APSStatusPrinter, "statusPrinter"));
  -[APSDaemon appendPrettyStatusToStatusPrinter:](self, "appendPrettyStatusToStatusPrinter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);

  return v4;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  if (-[NSMutableDictionary count](self->_environmentsToCouriers, "count")) {
    v5 = @"Running";
  }
  else {
    v5 = @"Down";
  }
  [v4 appendDescription:@"daemon status" stringValue:v5];
  [v4 appendDescription:@"startup time" timeIntervalValue:self->_startupTime];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  dispatch_source_t v6 = self->_environmentsToCouriers;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v11, (void)v14));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        [v4 appendDescription:@"connection environment" stringValue:v13];

        [v4 pushIndent];
        [v12 appendPrettyStatusToStatusPrinter:v4];
        [v4 popIndent];
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }
}

- (id)JSONDebugString:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = @"startupTime";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_startupTime));
  v29 = v5;
  dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
  id v7 = [v6 mutableCopy];

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = self->_environmentsToCouriers;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v13));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 JSONDebugState]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
        [v7 setObject:v15 forKeyedSubscript:v16];
      }

      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    }

    while (v10);
  }

  id v22 = 0LL;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  !v3,  &v22));
  id v18 = v22;
  if (v18)
  {
    dispatch_queue_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000BDA58((uint64_t)v18, v19);
    }

    uint64_t v20 = &stru_100123240;
  }

  else
  {
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString, "stringWithUTF8String:", [v17 bytes]));
  }

  return v20;
}

- (void)_setupNotifyToken
{
  if (!self->_systemReady)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100042F84;
    handler[3] = &unk_10011EE18;
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[CUTWeakReference weakRefWithObject:]( &OBJC_CLASS___CUTWeakReference,  "weakRefWithObject:",  self));
    id v12 = v3;
    uint32_t v4 = notify_register_dispatch( "APSSafeToSendFilterNotification",  &self->_systemReadyToken,  &_dispatch_main_q,  handler);
    if (v4)
    {
      int v5 = v4;
      dispatch_source_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_1000BDACC(v5, v6);
      }
    }

    dispatch_time_t v7 = dispatch_time(0LL, 120000000000LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100042FB8;
    v10[3] = &unk_10011E4F0;
    v10[4] = self;
    dispatch_after(v7, &_dispatch_main_q, v10);

    id v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastClientConnection = self->_lastClientConnection;
    self->_lastClientConnection = v8;

    -[APSDaemon updateSafeToSendFilterForce:](self, "updateSafeToSendFilterForce:", 0LL);
  }

- (void)updateSafeToSendFilterForce:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v6 = @"NO";
    if (v3) {
      dispatch_source_t v6 = @"YES";
    }
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    __int128 v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: updateSafeToSendFilter force: %@",  (uint8_t *)&v11,  0x16u);
  }

  if (!self->_hasEnabledCouriers)
  {
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 timeIntervalSinceDate:self->_lastClientConnection];
    double v9 = v8;

    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = *(APSDaemon **)&v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "timeSinceLastConnection: %f",  (uint8_t *)&v11,  0xCu);
    }

    if (v3 || v9 < 10.0)
    {
      if (!v3)
      {
LABEL_14:
        -[APSDaemon _updateCourierConnectTimerAndPowerAssertion](self, "_updateCourierConnectTimerAndPowerAssertion");
        return;
      }
    }

    else if (!-[APSDaemon _systemIsReady](self, "_systemIsReady"))
    {
      goto LABEL_14;
    }

    -[APSDaemon _enableAllCouriers](self, "_enableAllCouriers");
    goto LABEL_14;
  }

- (void)_updateCourierConnectTimerAndPowerAssertion
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:self->_lastClientConnection];
  double v5 = v4;

  double v6 = 10.0 - v5;
  dispatch_time_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = -[APSDaemon _systemIsReady](self, "_systemIsReady");
    double v9 = @"NO";
    BOOL hasEnabledCouriers = self->_hasEnabledCouriers;
    if (v8) {
      int v11 = @"YES";
    }
    else {
      int v11 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    double v24 = *(double *)&v11;
    if (hasEnabledCouriers) {
      double v9 = @"YES";
    }
    __int16 v25 = 2112;
    __int128 v26 = v9;
    __int16 v27 = 2048;
    double v28 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "UpdateCourierConnectTimerAndPowerAssertion: systemIsReady %@  hasEnabledCouriers %@  delay %f",  buf,  0x20u);
  }

  if (-[APSDaemon _systemIsReady](self, "_systemIsReady"))
  {
    BOOL v12 = self->_hasEnabledCouriers;
    -[APSDaemon _clearCourierConnectTimerAndPowerAssertion](self, "_clearCourierConnectTimerAndPowerAssertion");
    if (!v12 && v6 > 2.22044605e-16)
    {
      __int16 v13 = objc_autoreleasePoolPush();
      double v14 = v6 + 1.0;
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Delaying connect for %g secs", buf, 0xCu);
      }

      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v24 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Delaying courier connection for %g seconds",  buf,  0xCu);
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-connectcouriers",  APSBundleIdentifier));
      id v18 = -[APSPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:holdDuration:",  v17,  210LL,  30.0);
      -[APSDaemon setCourierConnectTimerPowerAssertion:](self, "setCourierConnectTimerPowerAssertion:", v18);

      dispatch_queue_t v19 = -[PCSimpleTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCSimpleTimer),  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  @"APSDaemon-courierconnecttimer",  self,  "_connectCouriersTimerFired",  0LL,  v14);
      courierConnectTimer = self->_courierConnectTimer;
      self->_courierConnectTimer = v19;

      uint64_t v21 = self->_courierConnectTimer;
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      -[PCSimpleTimer scheduleInRunLoop:](v21, "scheduleInRunLoop:", v22);

      objc_autoreleasePoolPop(v13);
    }
  }

  else
  {
    -[APSDaemon _clearCourierConnectTimerAndPowerAssertion](self, "_clearCourierConnectTimerAndPowerAssertion");
  }

- (BOOL)_systemIsReady
{
  if (self->_systemReady)
  {
    return 1;
  }

  else
  {
    uint64_t state64 = 0LL;
    notify_get_state(self->_systemReadyToken, &state64);
    self->_systemReady = state64 != 0;
    if (sub_100077B38())
    {
      BOOL v2 = 1;
      self->_systemReady = 1;
    }

    else
    {
      return self->_systemReady;
    }
  }

  return v2;
}

- (void)_receivedShutdownNotification
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: System is shutting down! Disabling all couriers cleanly.",  buf,  0xCu);
  }

  self->_systemIsShuttingDown = 1;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  double v4 = self->_environmentsToCouriers;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  (void)v10));
        [v9 setEnabled:0];

        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }
}

- (void)_updateNetworkGuidance
{
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  BOOL v3 = self->_environmentsToCouriers;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v32,  v43,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v33;
    char v7 = 1;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)i)));
        if ([v9 shouldUseInternet])
        {
          if ([v9 isConnectedToService])
          {

            goto LABEL_13;
          }

          char v7 = 0;
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v32,  v43,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
LABEL_13:
    char v7 = 1;
  }

  __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v11 = @"NO";
    if ((v7 & 1) != 0) {
      __int128 v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ updating network guidance isConnected? %@",  buf,  0x16u);
  }

  notify_set_state(self->_isConnectedToken, v7 & 1);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v12 = self->_environmentsToCouriers;
  id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v38,  16LL);
  if (v13)
  {
    id v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v29;
    while (2)
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)j)));
        if ([v18 shouldUseInternet])
        {
          id v19 = objc_claimAutoreleasedReturnValue([v18 ifname]);
          uint64_t v20 = (const char *)[v19 cStringUsingEncoding:4];

          if (v20)
          {

            goto LABEL_35;
          }

          char v15 = 1;
        }
      }

      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v38,  16LL);
      if (v14) {
        continue;
      }
      break;
    }

    if ((v15 & 1) != 0)
    {
      uint64_t v20 = 0LL;
      goto LABEL_35;
    }
  }

  else
  {
  }

  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ no courier should be enabled - providing no guidance",  buf,  0xCu);
  }

  uint64_t v20 = (const char *)kNetworkConfigPersistentInterfaceNoGuidance;
LABEL_35:
  else {
    id v22 = v20;
  }
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v22));
  if (!-[NSString isEqualToString:](self->_networkGuidanceString, "isEqualToString:", v23))
  {
    -[APSDaemon setNetworkGuidanceString:](self, "setNetworkGuidanceString:", v23);
    networkGuidanceString = self->_networkGuidanceString;
    id v36 = @"Guidance";
    v37 = networkGuidanceString;
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    APSPowerLog(@"Network Guidance", v25);
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = self->_networkGuidanceString;
      *(_DWORD *)buf = 138412546;
      v40 = self;
      __int16 v41 = 2112;
      v42 = (const __CFString *)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@ providing network guidance %@",  buf,  0x16u);
    }

    network_config_set_persistent_interface(v20);
  }
}

- (void)_clearCourierConnectTimerAndPowerAssertion
{
  courierConnectTimer = self->_courierConnectTimer;
  self->_courierConnectTimer = 0LL;

  courierConnectTimerPowerAssertion = self->_courierConnectTimerPowerAssertion;
  if (courierConnectTimerPowerAssertion)
  {
    self->_courierConnectTimerPowerAssertion = 0LL;
  }

- (void)_connectCouriersTimerFired
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Courier connections delay finished", buf, 2u);
  }

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Courier connection timer fired. Connecting couriers.",  v5,  2u);
  }

  -[APSDaemon _clearCourierConnectTimerAndPowerAssertion](self, "_clearCourierConnectTimerAndPowerAssertion");
  -[APSDaemon _enableAllCouriers](self, "_enableAllCouriers");
}

- (void)_enableAllCouriers
{
  BOOL systemIsShuttingDown = self->_systemIsShuttingDown;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (systemIsShuttingDown)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Ignoring call to _enableAllCouriers - system is shutting down",  buf,  0xCu);
    }
  }

  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling all couriers", buf, 2u);
    }

    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Enabling all couriers", buf, 0xCu);
    }

    self->_BOOL hasEnabledCouriers = 1;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = self->_environmentsToCouriers;
    id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        __int128 v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v4);
          }
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10),  (void)v12));
          [v11 setEnabled:1];

          __int128 v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }
  }
}

- (void)receivedClientConnection
{
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastClientConnection = self->_lastClientConnection;
  self->_lastClientConnection = v3;

  if (!self->_hasEnabledCouriers)
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client connected, bump filter time", buf, 2u);
    }

    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received client connection and we have not yet enabled couriers",  v7,  2u);
    }

    -[APSDaemon updateSafeToSendFilterForce:](self, "updateSafeToSendFilterForce:", 0LL);
  }

- (double)keepAliveIntervalForEnvironment:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[APSEnvironment environmentForName:](&OBJC_CLASS___APSEnvironment, "environmentForName:", a3));
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v4));
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 currentKeepAliveInterval];
      double v8 = v7;
    }

    else
    {
      double v8 = 0.0;
    }
  }

  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)getConnectionServerForEnvironment:(id)a3 connectionPortName:(id)a4 processName:(id)a5 enableDarkWake:(BOOL)a6 peerConnection:(id)a7 isNewConnection:(BOOL *)a8
{
  __int128 v13 = (APSDaemon *)a3;
  __int128 v14 = (__CFString *)a4;
  id v15 = a5;
  id v16 = a7;
  __int128 v17 = v16;
  if (!self->_systemIsShuttingDown)
  {
    if (!v16)
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 138412290;
      v75 = self;
      id v19 = "%@: Ignoring call to getConnectionServerForEnvironment - missing peer";
      goto LABEL_4;
    }

    v61 = a8;
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSEnvironment environmentForName:](&OBJC_CLASS___APSEnvironment, "environmentForName:", v13));
    if (!v18)
    {
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v13;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Unknown environment '%@'", buf, 0xCu);
      }

      uint64_t v20 = 0LL;
      goto LABEL_57;
    }

    uint64_t v60 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-getconnectionserver-%@",  APSBundleIdentifier,  v13));
    v59 = -[APSPowerAssertion_NoHold initWithName:category:]( objc_alloc(&OBJC_CLASS___APSNoOpPowerAssertion),  "initWithName:category:",  v60,  211LL);
    -[APSNoOpPowerAssertion hold](v59, "hold");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 userForConnection:v17]);

    v64 = v17;
    v65 = (void *)v22;
    if (v14)
    {
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      id v23 = -[NSMutableDictionary copy](self->_environmentsToCouriers, "copy");
      id v24 = [v23 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v71;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v71 != v26) {
              objc_enumerationMutation(v23);
            }
            if (*(os_log_s **)(*((void *)&v70 + 1) + 8LL * (void)i) != v18)
            {
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:"));
              [v28 removeConnectionForConnectionPortName:v14 user:v65];
            }
          }

          id v25 = [v23 countByEnumeratingWithState:&v70 objects:v79 count:16];
        }

        while (v25);
      }

      __int128 v17 = v64;
      uint64_t v22 = (uint64_t)v65;
    }

    __int128 v29 = (APSDaemon *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v18));
    id v62 = v15;
    v63 = v13;
    if (v29)
    {
      if (!v14) {
        goto LABEL_39;
      }
    }

    else
    {
      v58 = v14;
      __int128 v29 = (APSDaemon *)objc_claimAutoreleasedReturnValue(-[APSDaemon createCourierForEnvironment:](self, "createCourierForEnvironment:", v18));
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sortedLoggedInUsers]);

      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v33 = v32;
      id v34 = [v33 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v67;
        do
        {
          for (j = 0LL; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v67 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)j);
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 dependenciesForUser:v38]);

            -[APSDaemon setupForUser:dependencies:](v29, "setupForUser:dependencies:", v38, v40);
          }

          id v35 = [v33 countByEnumeratingWithState:&v66 objects:v78 count:16];
        }

        while (v35);
      }

      __int128 v14 = v58;
      id v15 = v62;
      __int128 v17 = v64;
      uint64_t v22 = (uint64_t)v65;
      if (!v58) {
        goto LABEL_39;
      }
    }

    uint64_t v20 = (APSDaemon *)objc_claimAutoreleasedReturnValue( -[APSDaemon connectionForConnectionPortName:user:]( v29,  "connectionForConnectionPortName:user:",  v14,  v22));
    __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v75 = v20;
      __int16 v76 = 2112;
      v77 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Found existing connection %@ for port name: %@",  buf,  0x16u);
    }

    if (v20)
    {
      sub_1000445EC(v42, v20, v17);
      -[APSDaemon setUser:](v20, "setUser:", v22);
      -[APSDaemon setConnection:](v20, "setConnection:", v17);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon publicTokenForUser:](v29, "publicTokenForUser:", v22));
      -[APSDaemon setPublicToken:needsAck:](v20, "setPublicToken:needsAck:", v43, 0LL);
      v44 = (void *)v22;
LABEL_56:

      -[APSDaemon _clearInactivityTerminationTimer](self, "_clearInactivityTerminationTimer");
      -[APSNoOpPowerAssertion clear](v59, "clear");

      __int128 v30 = (os_log_s *)v60;
      __int128 v13 = v63;
LABEL_57:

      goto LABEL_58;
    }

- (id)environmentForConnectionPortName:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userForConnection:v6]);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dependenciesForUser:v9]);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userPreferences]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[APSConnectionServer environmentForNamedPort:userPreferences:]( &OBJC_CLASS___APSConnectionServer,  "environmentForNamedPort:userPreferences:",  v7,  v12));

  return v13;
}

- (void)requestCourierConnections
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Explicit courier connect request!", buf, 2u);
  }

  if (self->_hasEnabledCouriers)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = self->_environmentsToCouriers;
    id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v15;
      *(void *)&__int128 v6 = 138412546LL;
      __int128 v13 = v6;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v10, v13, (void)v14));
          __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            id v19 = v11;
            __int16 v20 = 2112;
            uint64_t v21 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Requesting courier connection %@ %@",  buf,  0x16u);
          }

          [v11 requestConnectionIfNeeded];
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
      }

      while (v7);
    }
  }

  else
  {
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Couriers have not yet been enabled",  buf,  2u);
    }
  }
}

- (void)invalidateDeviceIdentity
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "We've been told that the device identity is invalid!",  buf,  2u);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_environmentsToCouriers;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v13 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v10, v13, (void)v14));
        __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          id v19 = v11;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Telling courier %@ %@ to invalidate device identity.",  buf,  0x16u);
        }

        [v11 invalidateDeviceIdentity];
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
    }

    while (v7);
  }
}

- (void)courierIsIdle:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Courier %@ is idle", (uint8_t *)&v6, 0x16u);
  }

  -[APSDaemon _startInactivityTerminationTimerIfNecessary](self, "_startInactivityTerminationTimerIfNecessary");
  -[APSDaemon _setActivePushConnectionState](self, "_setActivePushConnectionState");
}

- (APSIDSProxyManager)proxyManager
{
  return self->_proxyManager;
}

- (void)courierConnectionStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ received courierConnectionStatusDidChange from %@.",  (uint8_t *)&v6,  0x16u);
  }

  -[APSDaemon _updateNetworkGuidance](self, "_updateNetworkGuidance");
}

- (void)shouldUseInternetDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ received shouldUseInternetDidChange from %@.",  (uint8_t *)&v6,  0x16u);
  }

  -[APSDaemon _updateNetworkGuidance](self, "_updateNetworkGuidance");
}

- (void)courierHasNoConnections:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 environment]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v5));

  if (v6 == v4)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing courier %@", (uint8_t *)&v8, 0xCu);
    }

    [v4 setEnabled:0];
    -[APSDaemon _removeCourierForEnvironment:](self, "_removeCourierForEnvironment:", v5);
    -[APSDaemon _startInactivityTerminationTimerIfNecessary](self, "_startInactivityTerminationTimerIfNecessary");
  }
}

- (void)rollTokensForAllBAAEnvironments:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ was notified of a BAA identity change, rolling push tokens for all BAA environments",  buf,  0xCu);
  }

  __int128 v15 = v4;

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = self->_environmentsToCouriers;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i)));
        if (sub_1000784BC())
        {
          __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 environment]);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
            *(_DWORD *)buf = 138412546;
            id v21 = v11;
            __int16 v22 = 2112;
            id v23 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ is currently using a BAA identity provider, rolling token for environment %@",  buf,  0x16u);
          }

          [v11 rollTokenAndReconnect];
        }
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v8);
  }
}

- (void)proxyManager:(id)a3 canUseProxyChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v4) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ canUseProxyChanged %@", buf, 0x16u);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = self->_environmentsToCouriers;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12),  (void)v14));
        [v13 canUseProxyChanged];

        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v10);
  }
}

- (void)proxyManager:(id)a3 incomingPresenceWithGuid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 environmentName:(id)a12
{
  id v44 = a4;
  id v43 = a5;
  id v42 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = v22;
  if (self->_systemIsShuttingDown)
  {
    id v24 = v22;
    id v25 = v21;
    uint64_t v26 = v20;
    __int16 v27 = v18;
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    v45 = v28;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@ is shutting down, ignoring incomingPresence from proxy client",  buf,  0xCu);
    }

    __int128 v30 = v43;
    __int128 v29 = v44;
    __int128 v31 = v42;
  }

  else
  {
    id v40 = v17;
    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[APSEnvironment environmentForName:](&OBJC_CLASS___APSEnvironment, "environmentForName:", v22));
    __int16 v41 = self;
    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v32));
    id v34 = (void *)v33;
    v45 = (void *)v32;
    if (v32 && !v33)
    {
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v41;
        __int16 v48 = 2112;
        uint64_t v49 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@ creating courier for environment %@ for incoming presence",  buf,  0x16u);
      }

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon createCourierForEnvironment:](v41, "createCourierForEnvironment:", v32));
      id v34 = v36;
      if (v41->_hasEnabledCouriers) {
        [v36 setEnabled:1];
      }
    }

    __int16 v27 = v18;
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v47 = v41;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v34;
      __int16 v50 = 2112;
      id v51 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%@ incomingPresence we have courier %@ for environment %@",  buf,  0x20u);
    }

    id v24 = v23;

    id v38 = v20;
    id v39 = v21;
    __int128 v29 = v44;
    uint64_t v26 = v20;
    __int128 v30 = v43;
    id v25 = v21;
    __int128 v31 = v42;
    id v17 = v40;
    [v34 incomingPresenceWithGuid:v44 token:v43 hwVersion:v42 swVersion:v40 swBuild:v27 certificate:v19 nonce:v38 signature:v39];
    -[APSDaemon _clearInactivityTerminationTimer](v41, "_clearInactivityTerminationTimer");
  }
}

- (void)_schedulePeriodicSignal
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWeakReference weakRefWithObject:](&OBJC_CLASS___CUTWeakReference, "weakRefWithObject:", self));
  dispatch_time_t v3 = dispatch_time(0LL, 86400000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045670;
  block[3] = &unk_10011E4F0;
  id v6 = v2;
  id v4 = v2;
  dispatch_after(v3, &_dispatch_main_q, block);
}

- (void)_performPeriodicSignal
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:self->_lastClientConnection];
  double v5 = v4;

  double v6 = 10.0 - v5;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = *(void *)&v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "_performPeriodicSignal - timeSinceLastConnection %f",  buf,  0xCu);
  }

  if (v6 <= 2.22044605e-16)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v10 = self->_environmentsToCouriers;
    id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  (void)v16));
          [v15 periodicSignalFired];
        }

        id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
      }

      while (v12);
    }

    -[APSDaemon _schedulePeriodicSignal](self, "_schedulePeriodicSignal");
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = (uint64_t)(v6 + 1.0);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delaying periodic signal by %lld", buf, 0xCu);
    }

    dispatch_time_t v9 = dispatch_time(0LL, 1000000000 * (uint64_t)(v6 + 1.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100045908;
    block[3] = &unk_10011E4F0;
    void block[4] = self;
    dispatch_after(v9, &_dispatch_main_q, block);
  }

- (void)_startInactivityTerminationTimerIfNecessary
{
  if (!-[NSMutableDictionary count](self->_environmentsToCouriers, "count"))
  {
    dispatch_time_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = 0x402E000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Starting inactivity termination timer for %g seconds",  (uint8_t *)&v6,  0xCu);
    }

    double v4 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_inactivityTerminationTimerFired:",  0LL,  0LL,  15.0));
    inactivityTerminationTimer = self->_inactivityTerminationTimer;
    self->_inactivityTerminationTimer = v4;
  }

- (void)_clearInactivityTerminationTimer
{
  if (self->_inactivityTerminationTimer)
  {
    dispatch_time_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Clearing inactivity termination timer",  v5,  2u);
    }

    -[NSTimer invalidate](self->_inactivityTerminationTimer, "invalidate");
    inactivityTerminationTimer = self->_inactivityTerminationTimer;
    self->_inactivityTerminationTimer = 0LL;
  }

- (void)_inactivityTerminationTimerFired:(id)a3
{
  inactivityTerminationTimer = self->_inactivityTerminationTimer;
  self->_inactivityTerminationTimer = 0LL;
}

- (void)_removeCourierForEnvironment:(id)a3
{
}

- (id)createCourierForEnvironment:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "createCourierForEnvironment '%@'",  (uint8_t *)&v12,  0xCu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultUser]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dependenciesForUser:v7]);

  id v10 = -[APSCourier initWithEnvironment:defaultUser:userDependencies:delegate:]( objc_alloc(&OBJC_CLASS___APSCourier),  "initWithEnvironment:defaultUser:userDependencies:delegate:",  v4,  v7,  v9,  self);
  -[NSMutableDictionary setObject:forKey:](self->_environmentsToCouriers, "setObject:forKey:", v10, v4);

  return v10;
}

- (id)courierForEnvironment:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_environmentsToCouriers, "objectForKey:", a3);
}

- (id)courierForEnvironmentName:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSEnvironment environmentForName:](&OBJC_CLASS___APSEnvironment, "environmentForName:", v4));
  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v5));
  }

  else
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "courierForEnvironmentName Unknown environment '%@'",  (uint8_t *)&v9,  0xCu);
    }

    int v6 = 0LL;
  }

  return v6;
}

- (id)_connectionsDebuggingState
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_environmentsToCouriers, "allValues"));
  uint64_t v3 = APSPrettyPrintCollection(v2, 1LL, 0LL, 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)loginInUserID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  [v5 manuallySetupAndLoginUser:v4];
}

- (void)finishLoggingInUserID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  [v5 manuallyLoginUser:v4];
}

- (void)setupUser:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_environmentsToCouriers;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9),  (void)v13));
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dependenciesForUser:v4]);
        [v10 setupForUser:v4 dependencies:v12];

        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v7);
  }
}

- (void)loginForUser:(id)a3
{
  id v4 = a3;
  id v42 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](self, "userTracker"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dependenciesForUser:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userPreferences]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[APSConnectionServer serverEnvironmentNamesForUserPreferences:]( &OBJC_CLASS___APSConnectionServer,  "serverEnvironmentNamesForUserPreferences:",  v7));

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v8;
  id v38 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v52;
    *(void *)&__int128 v9 = 134218498LL;
    __int128 v35 = v9;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
        int v12 = (void *)objc_claimAutoreleasedReturnValue( +[APSEnvironment environmentForName:]( &OBJC_CLASS___APSEnvironment,  "environmentForName:",  v11,  v35));
        if (v12)
        {
          uint64_t v39 = v11;
          id v40 = i;
          __int16 v41 = v12;
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon courierForEnvironment:](v42, "courierForEnvironment:", v12));
          if (!v13)
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon createCourierForEnvironment:](v42, "createCourierForEnvironment:", v41));
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](v42, "userTracker"));
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sortedLoggedInUsers]);

            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            id v16 = v15;
            id v17 = [v16 countByEnumeratingWithState:&v47 objects:v62 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v48;
              do
              {
                for (j = 0LL; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v48 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)j);
                  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSDaemon userTracker](v42, "userTracker"));
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 dependenciesForUser:v21]);

                  [v13 setupForUser:v21 dependencies:v23];
                }

                id v18 = [v16 countByEnumeratingWithState:&v47 objects:v62 count:16];
              }

              while (v18);
            }
          }

          id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 userPreferences]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 connectionServersForUser:v4]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v13 connectionServerDelegateForUser:v4 dependencies:v6]);
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[APSConnectionServer serversWithEnvironmentName:user:userPreferences:excludeServers:delegate:]( &OBJC_CLASS___APSConnectionServer,  "serversWithEnvironmentName:user:userPreferences:excludeServers:delegate:",  v39,  v4,  v24,  v25,  v26));

          __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog daemon](&OBJC_CLASS___APSLog, "daemon"));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v27 count];
            *(_DWORD *)buf = v35;
            id v57 = v29;
            __int16 v58 = 2112;
            id v59 = v4;
            __int16 v60 = 2112;
            uint64_t v61 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Loaded %ld connection servers for user %@ environment %@",  buf,  0x20u);
          }

          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v30 = v27;
          id v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v44;
            do
            {
              for (k = 0LL; k != v32; k = (char *)k + 1)
              {
                if (*(void *)v44 != v33) {
                  objc_enumerationMutation(v30);
                }
                [v13 addConnection:*(void *)(*((void *)&v43 + 1) + 8 * (void)k) forUser:v4 dependencies:v6];
              }

              id v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
            }

            while (v32);
          }

          [v13 setEnabled:1];
          i = v40;
          int v12 = v41;
        }
      }

      id v38 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    }

    while (v38);
  }

  -[APSDaemon _setActivePushConnectionState](v42, "_setActivePushConnectionState");
  -[APSDaemon _startInactivityTerminationTimerIfNecessary](v42, "_startInactivityTerminationTimerIfNecessary");
}

- (void)flushUser:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_environmentsToCouriers;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9),  (void)v11));
        [v10 flushUser:v4];

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)logoutUser:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_environmentsToCouriers;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[APSDaemon courierForEnvironment:]( self,  "courierForEnvironment:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9),  (void)v11));
        [v10 logoutUser:v4];

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  -[APSDaemon _startInactivityTerminationTimerIfNecessary](self, "_startInactivityTerminationTimerIfNecessary");
  -[APSDaemon _setActivePushConnectionState](self, "_setActivePushConnectionState");
}

- (void)finalizeProcessedUsers
{
}

- (APSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_source)sigTERMSource
{
  return self->_sigTERMSource;
}

- (void)setSigTERMSource:(id)a3
{
}

- (OS_dispatch_source)sigUSR1Source
{
  return self->_sigUSR1Source;
}

- (void)setSigUSR1Source:(id)a3
{
}

- (void)setProxyManager:(id)a3
{
}

- (int)systemReadyToken
{
  return self->_systemReadyToken;
}

- (void)setSystemReadyToken:(int)a3
{
  self->_systemReadyToken = a3;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (void)setSystemReady:(BOOL)a3
{
  self->_systemReady = a3;
}

- (int)isConnectedToken
{
  return self->_isConnectedToken;
}

- (void)setIsConnectedToken:(int)a3
{
  self->_isConnectedToken = a3;
}

- (BOOL)hasEnabledCouriers
{
  return self->_hasEnabledCouriers;
}

- (void)setHasEnabledCouriers:(BOOL)a3
{
  self->_BOOL hasEnabledCouriers = a3;
}

- (BOOL)systemIsShuttingDown
{
  return self->_systemIsShuttingDown;
}

- (void)setSystemIsShuttingDown:(BOOL)a3
{
  self->_BOOL systemIsShuttingDown = a3;
}

- (APSTaskListener)taskListener
{
  return self->_taskListener;
}

- (void)setTaskListener:(id)a3
{
}

- (NSMutableDictionary)environmentsToCouriers
{
  return self->_environmentsToCouriers;
}

- (void)setEnvironmentsToCouriers:(id)a3
{
}

- (PCSimpleTimer)courierConnectTimer
{
  return self->_courierConnectTimer;
}

- (void)setCourierConnectTimer:(id)a3
{
}

- (NSTimer)inactivityTerminationTimer
{
  return self->_inactivityTerminationTimer;
}

- (void)setInactivityTerminationTimer:(id)a3
{
}

- (APSPowerAssertion)courierConnectTimerPowerAssertion
{
  return self->_courierConnectTimerPowerAssertion;
}

- (void)setCourierConnectTimerPowerAssertion:(id)a3
{
}

- (NSString)networkGuidanceString
{
  return self->_networkGuidanceString;
}

- (void)setNetworkGuidanceString:(id)a3
{
}

- (NSDate)lastClientConnection
{
  return self->_lastClientConnection;
}

- (void)setLastClientConnection:(id)a3
{
}

- (double)startupTime
{
  return self->_startupTime;
}

- (void)setStartupTime:(double)a3
{
  self->_startupTime = a3;
}

- (void).cxx_destruct
{
}

@end