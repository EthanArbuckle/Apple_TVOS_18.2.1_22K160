@interface IDSHeartbeatCenter
+ (IDSHeartbeatCenter)sharedInstance;
- (BOOL)_registration:(id)a3 needsRenewal:(double *)a4;
- (CUTDeferredTaskQueue)reallyUpdateRegistrationHeartbeatTask;
- (IDSHeartbeatCenter)init;
- (double)_nextRegistrationHeartbeatTime;
- (double)registrationHBI;
- (id)_registrationsPendingHeartbeat;
- (void)__reallyUpdateRegistrationHeartbeat;
- (void)_bagReloaded:(id)a3;
- (void)_serverHeartBeat:(id)a3;
- (void)_serverHeartBeatTimerHit:(id)a3;
- (void)_serverHeartBeatTimerHitOnMain:(id)a3;
- (void)_startRegistrationHeartbeat;
- (void)_stopRegistrationHeartbeat;
- (void)_updateRegistrationHeartbeat;
- (void)addRegistrationInfo:(id)a3;
- (void)checkHeartbeat;
- (void)noteRegistrationStateChanged;
- (void)removeRegistrationInfo:(id)a3;
- (void)updateHeartbeat;
@end

@implementation IDSHeartbeatCenter

+ (IDSHeartbeatCenter)sharedInstance
{
  if (qword_1009BE888 != -1) {
    dispatch_once(&qword_1009BE888, &stru_1008F7D08);
  }
  return (IDSHeartbeatCenter *)(id)qword_1009BE890;
}

- (IDSHeartbeatCenter)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSHeartbeatCenter;
  v2 = -[IDSHeartbeatCenter init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v5 = im_primary_queue(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v3,  "initWithCapacity:queue:block:",  1LL,  v6,  &stru_1008F7D48);
    reallyUpdateRegistrationHeartbeatTask = v2->_reallyUpdateRegistrationHeartbeatTask;
    v2->_reallyUpdateRegistrationHeartbeatTask = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v9 addListener:v2];
  }

  return v2;
}

- (void)_serverHeartBeat:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
  [v4 setMostRecentIDSRegistrationReason:2];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRequestReasonContainer scheduledRequestWithSubreason:pathID:]( &OBJC_CLASS___IDSRequestReasonContainer,  "scheduledRequestWithSubreason:pathID:",  1LL,  2LL));
  [v5 setRegistrationRequestReason:v6];

  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting pending registrations...", buf, 2u);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v26 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHeartbeatCenter _registrationsPendingHeartbeat](self, "_registrationsPendingHeartbeat"));
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v9)
  {
    char v11 = 0;
    goto LABEL_30;
  }

  id v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v28;
  do
  {
    v13 = 0LL;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v13);
      if ([v14 registrationType]
        || +[IDSRegistrationController validSIMStateForRegistration]( &OBJC_CLASS___IDSRegistrationController,  "validSIMStateForRegistration"))
      {
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "    => %@", buf, 0xCu);
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
        unsigned __int8 v17 = [v16 sendRegistration:v14];

        if ((v17 & 1) != 0)
        {
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v19 = v18;
            v20 = "   * sent";
            uint32_t v21 = 2;
            goto LABEL_21;
          }
        }

        else
        {
          unsigned int v22 = [v14 canSendRegistration];
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          BOOL v23 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "   * NOT sent, forcing through the registration controller",  buf,  2u);
            }

            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
            -[os_log_s registerInfo:](v18, "registerInfo:", v14);
          }

          else if (v23)
          {
            *(_DWORD *)buf = 138412290;
            v32 = v14;
            v19 = v18;
            v20 = "   * Registration says it can't register, not registering: %@";
            uint32_t v21 = 12;
LABEL_21:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
          }
        }

        char v11 = 1;
        goto LABEL_23;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Skipping this registration for heartbeat consideration, it is an SMS one - and the SIM is not present: %@",  buf,  0xCu);
      }

- (void)_serverHeartBeatTimerHit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server heartbeat hit", v6, 2u);
  }

  sub_10012E874(0, @"Server Heartbeat", @"Need to re-register now", 1109LL);
  -[IDSHeartbeatCenter _serverHeartBeat:](self, "_serverHeartBeat:", v4);
}

- (BOOL)_registration:(id)a3 needsRenewal:(double *)a4
{
  id v5 = a3;
  double v6 = -[IDSHeartbeatCenter registrationHBI]_0();
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 registrationDate]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 nextRegistrationDate]);
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    if (v8)
    {
      [v8 timeIntervalSinceNow];
      double v6 = v10;
    }

    else
    {
      double v6 = v6 - fabs(v9);
    }
  }

  if ([v5 registrationType])
  {
    if (([v5 canSendRegistration] & 1) == 0)
    {
      char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v16 = 138412290;
      double v17 = *(double *)&v5;
      uint64_t v12 = "Skipping this registration for heartbeat consideration, it is an Apple ID one - and it apparently can't register: %@";
      goto LABEL_18;
    }

- (double)registrationHBI
{
  if (IMGetCachedDomainBoolForKey(@"com.apple.conference", @"forceRandomHeartbeatInterval"))
  {
    uint64_t v0 = ((int)SecureRandomUInt() % 230 + 70);
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_100696404(v0, v1, v2, v3, v4, v5, v6, v7);
    }
LABEL_4:

    return (double)(int)v0;
  }

  uint64_t v0 = IMGetCachedDomainIntForKey(@"com.apple.conference", @"forceHeartbeatInterval");
  if ((int)v0 >= 1)
  {
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10069646C(v0, v1, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_4;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"vc-registration-hbi"]);

  if (!v16 || ([v16 doubleValue], double v8 = v17, v17 < 580.0))
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1006964D4((uint64_t)v16, v18);
    }

    double v8 = 2592000.0;
  }

  return v8;
}

- (double)_nextRegistrationHeartbeatTime
{
  double v3 = -[IDSHeartbeatCenter registrationHBI]_0();
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v4 = self->_registrations;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v18 = v6;
    double v9 = v3;
    while (1)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSRegistrationCenter,  "sharedInstance",  v18,  (void)v19));
        unsigned __int8 v13 = [v12 isRegistering:v11];

        if ((v13 & 1) == 0)
        {
          if ([v11 registrationType])
          {
            if (([v11 canSendRegistration] & 1) == 0)
            {
              uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v18;
                *(void *)&uint8_t buf[4] = v11;
                v15 = v14;
                int v16 = "Skipping this registration for heartbeat consideration, it is an Apple ID one - and it apparently "
                      "can't register: %@";
                goto LABEL_17;
              }

              goto LABEL_18;
            }
          }

          else if (!+[IDSRegistrationController validSIMStateForRegistration]( &OBJC_CLASS___IDSRegistrationController,  "validSIMStateForRegistration"))
          {
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              *(void *)&uint8_t buf[4] = v11;
              v15 = v14;
              int v16 = "Skipping this registration for heartbeat consideration, it is an SMS one - and the SIM is not present: %@";
LABEL_17:
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
            }

- (id)_registrationsPendingHeartbeat
{
  __int128 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  double v3 = self->_registrations;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v19,  v25,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(NSMutableArray **)(*((void *)&v19 + 1) + 8LL * (void)i);
        double v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
        unsigned int v10 = [v9 isRegistering:v8];

        if (v10)
        {
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v8;
            uint64_t v12 = v11;
            unsigned __int8 v13 = "  => *NOT* adding pending registration: %@, we're currently registering";
            goto LABEL_15;
          }

          goto LABEL_16;
        }

        unsigned int v14 = -[IDSHeartbeatCenter _registration:needsRenewal:](self, "_registration:needsRenewal:", v8, 0LL);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        BOOL v15 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (!v14)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v8;
            uint64_t v12 = v11;
            unsigned __int8 v13 = "  => *NOT* adding pending registration: %@";
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
          }

- (void)__reallyUpdateRegistrationHeartbeat
{
  self->_pendingHeartbeat = 0;
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating registration heartbeat", v4, 2u);
  }

  -[IDSHeartbeatCenter _startRegistrationHeartbeat](self, "_startRegistrationHeartbeat");
}

- (void)_updateRegistrationHeartbeat
{
  if (!self->_pendingHeartbeat)
  {
    self->_pendingHeartbeat = 1;
    -[CUTDeferredTaskQueue cancelPendingExecutions]( self->_reallyUpdateRegistrationHeartbeatTask,  "cancelPendingExecutions");
    -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_reallyUpdateRegistrationHeartbeatTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  10.0);
    double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Posting pending registration heartbeat update",  v4,  2u);
    }
  }

- (void)_startRegistrationHeartbeat
{
  registrationHeartbeatTimer = self->_registrationHeartbeatTimer;
  self->_registrationHeartbeatTimer = 0LL;

  double v4 = -[IDSHeartbeatCenter registrationHBI]_0();
  -[IDSHeartbeatCenter _nextRegistrationHeartbeatTime](self, "_nextRegistrationHeartbeatTime");
  double v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v8 = IDSServerBagFinishedLoadingNotification;
  [v7 removeObserver:self name:IDSServerBagFinishedLoadingNotification object:0];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 addObserver:self selector:"_bagReloaded:" name:v8 object:0];

  self->_listeningForRegStateChanges = 1;
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134217984;
    double v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Starting registration heartbeat with interval: %f",  (uint8_t *)&v24,  0xCu);
  }

  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134217984;
    double v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "                    Time to next registration: %f",  (uint8_t *)&v24,  0xCu);
  }

  int v12 = IMGetCachedDomainIntForKey(@"com.apple.conference", @"forceHeartbeat");
  double v13 = (double)v12;
  if (v12 <= 0) {
    double v13 = v6;
  }
  if (v13 <= 0.0) {
    double v14 = 300.0;
  }
  else {
    double v14 = v13;
  }
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134217984;
    double v25 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "                  Setting heartbeat timer for: %f",  (uint8_t *)&v24,  0xCu);
  }

  int v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v14));
  registrationHeartbeatDate = self->_registrationHeartbeatDate;
  self->_registrationHeartbeatDate = v16;

  __int128 v18 = objc_alloc(&OBJC_CLASS___IMTimer);
  uint64_t v20 = im_primary_queue(v18, v19);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  __int128 v22 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v18,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  @"com.apple.identityservices.registration-hbi",  1LL,  self,  "_serverHeartBeatTimerHit:",  0LL,  v21,  v14);
  BOOL v23 = self->_registrationHeartbeatTimer;
  self->_registrationHeartbeatTimer = v22;
}

- (void)_serverHeartBeatTimerHitOnMain:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005003C;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)_stopRegistrationHeartbeat
{
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping registration heartbeat", v6, 2u);
  }

  -[IMTimer invalidate](self->_registrationHeartbeatTimer, "invalidate");
  registrationHeartbeatTimer = self->_registrationHeartbeatTimer;
  self->_registrationHeartbeatTimer = 0LL;

  self->_pendingHeartbeat = 0;
  -[CUTDeferredTaskQueue cancelPendingExecutions]( self->_reallyUpdateRegistrationHeartbeatTask,  "cancelPendingExecutions");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:IDSServerBagFinishedLoadingNotification object:0];

  self->_listeningForRegStateChanges = 0;
}

- (void)checkHeartbeat
{
  if (v3 < 0.0)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "We missed a heartbeat, we should fire",  v5,  2u);
    }

    -[IDSHeartbeatCenter _serverHeartBeatTimerHit:]( self,  "_serverHeartBeatTimerHit:",  self->_registrationHeartbeatTimer);
  }

- (void)updateHeartbeat
{
  id v3 = -[NSMutableArray count](self->_registrations, "count");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating heartbeats if necessary", v5, 2u);
  }

  if (v3) {
    -[IDSHeartbeatCenter _updateRegistrationHeartbeat](self, "_updateRegistrationHeartbeat");
  }
  else {
    -[IDSHeartbeatCenter _stopRegistrationHeartbeat](self, "_stopRegistrationHeartbeat");
  }
}

- (void)noteRegistrationStateChanged
{
  if (self->_listeningForRegStateChanges)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registration state changed, re-checking registrations",  v4,  2u);
    }

    -[IDSHeartbeatCenter _serverHeartBeat:](self, "_serverHeartBeat:", self->_registrationHeartbeatTimer);
  }

- (void)_bagReloaded:(id)a3
{
  id v4 = a3;
  if (self->_registrationHeartbeatTimer)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bag reloaded, checking intervals", buf, 2u);
    }

    double v6 = -[IDSHeartbeatCenter registrationHBI]_0();
    if (floor(v6) != floor(self->_baseRegistrationHBI))
    {
      self->_baseRegistrationHBI = v6;
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "These differ, reseting timer!", v8, 2u);
      }

      -[IDSHeartbeatCenter _updateRegistrationHeartbeat](self, "_updateRegistrationHeartbeat");
    }
  }
}

- (void)addRegistrationInfo:(id)a3
{
  id v4 = a3;
  registrations = self->_registrations;
  if (!registrations)
  {
    double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_registrations;
    self->_registrations = v6;

    registrations = self->_registrations;
  }

  if ((-[NSMutableArray containsObject:](registrations, "containsObject:", v4) & 1) == 0)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Adding registration info to heartbeat: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[NSMutableArray addObject:](self->_registrations, "addObject:", v4);
    -[IDSHeartbeatCenter updateHeartbeat](self, "updateHeartbeat");
  }
}

- (void)removeRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_registrations, "containsObject:", v4))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing registration info from heartbeat: %@",  (uint8_t *)&v7,  0xCu);
    }

    -[NSMutableArray removeObject:](self->_registrations, "removeObject:", v4);
    -[IDSHeartbeatCenter updateHeartbeat](self, "updateHeartbeat");
  }

  if (!-[NSMutableArray count](self->_registrations, "count"))
  {
    registrations = self->_registrations;
    self->_registrations = 0LL;
  }
}

- (CUTDeferredTaskQueue)reallyUpdateRegistrationHeartbeatTask
{
  return self->_reallyUpdateRegistrationHeartbeatTask;
}

- (void).cxx_destruct
{
}

@end