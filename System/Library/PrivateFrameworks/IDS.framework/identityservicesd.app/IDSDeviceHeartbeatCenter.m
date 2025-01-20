@interface IDSDeviceHeartbeatCenter
+ (id)sharedInstance;
- (BOOL)_fetchExpiryDatesIfNecessary;
- (BOOL)_scheduleDependentRegistrations;
- (IDSDeviceHeartbeatCenter)init;
- (id)_getNextExpirationDate;
- (void)_cleanupKeychain;
- (void)_heartBeat;
- (void)_heartbeatTimerFiredOnMain;
- (void)_scheduleRescueHeartBeat;
- (void)_updateDependentRegistrationTimerFiredOnMain;
- (void)_updateDependentRegistrations;
- (void)_updateExpiry:(double)a3 forUser:(id)a4;
- (void)accountsChanged;
- (void)dealloc;
- (void)invalidateTimer;
- (void)printInfo;
- (void)resetExpiryForUser:(id)a3;
- (void)setup;
@end

@implementation IDSDeviceHeartbeatCenter

+ (id)sharedInstance
{
  if (qword_1009BE580 != -1) {
    dispatch_once(&qword_1009BE580, &stru_1008F5FE8);
  }
  return (id)qword_1009BE588;
}

- (IDSDeviceHeartbeatCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSDeviceHeartbeatCenter;
  v2 = -[IDSDeviceHeartbeatCenter init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v3 addListener:v2];

    getDependentHeartbeatTimer = v2->_getDependentHeartbeatTimer;
    v2->_getDependentHeartbeatTimer = 0LL;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    usersToHeartbeatDatesMap = v2->_usersToHeartbeatDatesMap;
    v2->_usersToHeartbeatDatesMap = v5;
  }

  return v2;
}

- (void)setup
{
  if (!self->_isSetup)
  {
    self->_isSetup = 1;
    -[IDSDeviceHeartbeatCenter accountsChanged](self, "accountsChanged");
    -[IDSDeviceHeartbeatCenter printInfo](self, "printInfo");
    -[IDSDeviceHeartbeatCenter _fetchExpiryDatesIfNecessary](self, "_fetchExpiryDatesIfNecessary");
    -[IDSDeviceHeartbeatCenter _cleanupKeychain](self, "_cleanupKeychain");
  }

- (void)_heartBeat
{
  if (!-[IDSDeviceHeartbeatCenter _scheduleDependentRegistrations](self, "_scheduleDependentRegistrations"))
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Did not find any date to schedule a heart beat, triggering get dependent request",  v5,  2u);
    }

    -[IDSDeviceHeartbeatCenter _scheduleRescueHeartBeat](self, "_scheduleRescueHeartBeat");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    [v4 issueGetDependentRequest];
  }

- (id)_getNextExpirationDate
{
  if (!IMGetCachedDomainBoolForKey( @"com.apple.conference",  @"forceRandomDeviceHeartbeatInterval"))
  {
    int v3 = IMGetCachedDomainIntForKey(@"com.apple.conference", @"forceDeviceHeartbeat");
    if (v3)
    {
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_100693CD0();
      }
      goto LABEL_8;
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_usersToHeartbeatDatesMap, "allValues", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      v10 = 0LL;
      char v11 = 0;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if ((v11 & 1) == 0
            || ([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) doubleValue],
                double v16 = v15,
                [v10 doubleValue],
                v16 < v17))
          {
            id v18 = v14;

            v10 = v18;
          }

          char v11 = 1;
        }

        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);

      if (v10)
      {
        v19 = objc_alloc(&OBJC_CLASS___NSDate);
        [v10 doubleValue];
        v20 = -[NSDate initWithTimeIntervalSince1970:](v19, "initWithTimeIntervalSince1970:");
LABEL_24:
        v5 = v20;

        goto LABEL_9;
      }
    }

    else
    {

      v10 = 0LL;
    }

    v20 = 0LL;
    goto LABEL_24;
  }

  int v3 = (int)SecureRandomUInt() % 230 + 70;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100693C64();
  }
LABEL_8:

  v5 =  -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  (double)v3);
LABEL_9:

  return v5;
}

- (void)dealloc
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v3 removeListener:self];

  -[IDSDeviceHeartbeatCenter invalidateTimer](self, "invalidateTimer");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDeviceHeartbeatCenter;
  -[IDSDeviceHeartbeatCenter dealloc](&v4, "dealloc");
}

- (void)printInfo
{
  if (IMShouldLog(@"Registration", 0LL))
  {
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Expiration dates per user: ", buf, 2u);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_usersToHeartbeatDatesMap, "allKeys"));
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v20;
      *(void *)&__int128 v6 = 138412546LL;
      __int128 v18 = v6;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v9);
          char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat", v18));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_usersToHeartbeatDatesMap, "objectForKey:", v10));
            [v12 doubleValue];
            v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
            *(_DWORD *)buf = v18;
            __int128 v24 = v10;
            __int16 v25 = 2112;
            v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ => %@", buf, 0x16u);
          }

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v7);
    }

    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceHeartbeatCenter _getNextExpirationDate](self, "_getNextExpirationDate"));
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceHeartbeatCenter _getNextExpirationDate](self, "_getNextExpirationDate"));
      [v16 timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      __int128 v24 = v15;
      __int16 v25 = 2048;
      v26 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Next heartbeat date: %@ (in %.0f seconds)",  buf,  0x16u);
    }
  }

- (void)invalidateTimer
{
  getDependentHeartbeatTimer = self->_getDependentHeartbeatTimer;
  self->_getDependentHeartbeatTimer = 0LL;
}

- (BOOL)_scheduleDependentRegistrations
{
  int v3 = objc_autoreleasePoolPush();
  -[IDSDeviceHeartbeatCenter invalidateTimer](self, "invalidateTimer");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceHeartbeatCenter _getNextExpirationDate](self, "_getNextExpirationDate"));
  id v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceNow];
    double v7 = v6;
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 134218242;
      double v17 = v7;
      __int16 v18 = 2112;
      __int128 v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "_scheduleDependentRegistrations for %.0f - %@",  (uint8_t *)&v16,  0x16u);
    }

    id v9 = objc_alloc(&OBJC_CLASS___IMTimer);
    uint64_t v11 = im_primary_queue(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    v13 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v9,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  @"com.apple.identityservices.device-hbi",  0LL,  self,  "_updateDependentRegistrations",  0LL,  v12,  v7);
    getDependentHeartbeatTimer = self->_getDependentHeartbeatTimer;
    self->_getDependentHeartbeatTimer = v13;
  }

  else
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "We did not find any heartbeat to schedule",  (uint8_t *)&v16,  2u);
    }
  }

  objc_autoreleasePoolPop(v3);
  return v5 != 0LL;
}

- (void)_updateDependentRegistrationTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007E64;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_scheduleRescueHeartBeat
{
  if (-[NSMutableDictionary count](self->_usersToHeartbeatDatesMap, "count"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"vc-temporary-get-dependent-interval"]);

    [v4 doubleValue];
    double v6 = v5;

    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "_scheduleRescueHeartBeat for %.0f",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v8 = objc_alloc(&OBJC_CLASS___IMTimer);
    uint64_t v10 = im_primary_queue(v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v8,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  @"com.apple.identityservices.device-hbi",  0LL,  self,  "_heartBeat",  0LL,  v11,  v6);
    getDependentHeartbeatTimer = self->_getDependentHeartbeatTimer;
    self->_getDependentHeartbeatTimer = v12;
  }

- (void)_heartbeatTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000803C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_updateDependentRegistrations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  [v2 updateExpiredDependent];

  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_updateDependentRegistrations fired", v4, 2u);
  }

  if (qword_1009BE598 != -1) {
    dispatch_once(&qword_1009BE598, &stru_1008F6030);
  }
  if (off_1009BE590) {
    ((void (*)(uint64_t, const __CFString *, NSDictionary *, void))off_1009BE590)( 13LL,  @"IdentityServicesDeviceHeartbeat",  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"sending IdentityServices Device Heartbeat",  @"action"),  0LL);
  }
}

- (void)resetExpiryForUser:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting expiry for %@", (uint8_t *)&v6, 0xCu);
  }

  -[IDSDeviceHeartbeatCenter _updateExpiry:forUser:](self, "_updateExpiry:forUser:", v4, 0.0);
}

- (void)_updateExpiry:(double)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_isSetup)
  {
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not setup yet, ignoring expiry update...",  (uint8_t *)&v18,  2u);
    }

    goto LABEL_16;
  }

  if (![v6 length])
  {
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100693D3C((uint64_t)v7, v17);
    }
LABEL_16:

    goto LABEL_17;
  }

  uint64_t v8 = objc_autoreleasePoolPush();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 timeIntervalSince1970];
  double v11 = v10;

  objc_autoreleasePoolPop(v8);
  if (v11 > a3)
  {
    if (a3 > 2.22044605e-16)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412802;
        __int128 v19 = @"DeviceHeartbeat";
        __int16 v20 = 2048;
        double v21 = 60.0;
        __int16 v22 = 2048;
        double v23 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ -  updateExpiry failed sanity check. Returning current date + %f seconds expiry was %f",  (uint8_t *)&v18,  0x20u);
      }
    }

    a3 = v11 + 60.0;
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  a3));
    int v18 = 138412802;
    __int128 v19 = v14;
    __int16 v20 = 2048;
    double v21 = a3;
    __int16 v22 = 2112;
    double v23 = *(double *)&v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Setting new expiry %@ (seconds %f) for user %@",  (uint8_t *)&v18,  0x20u);
  }

  usersToHeartbeatDatesMap = self->_usersToHeartbeatDatesMap;
  int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[NSMutableDictionary setObject:forKey:](usersToHeartbeatDatesMap, "setObject:forKey:", v16, v7);

  -[IDSDeviceHeartbeatCenter _heartBeat](self, "_heartBeat");
LABEL_17:
}

- (void)accountsChanged
{
  BOOL isSetup = self->_isSetup;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isSetup)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Accounts changed, updating expiry map",  buf,  2u);
    }

    -[NSMutableDictionary removeAllObjects](self->_usersToHeartbeatDatesMap, "removeAllObjects");
    context = objc_autoreleasePoolPush();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accounts]);
    id v8 = [v7 _copyForEnumerating];

    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          if (([v15 isAdHocAccount] & 1) == 0
            && [v15 isEnabled]
            && [v15 isRegistered])
          {
            int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 registration]);
            double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 idsUserID]);

            if ([v17 length])
            {
              if ((-[NSMutableSet containsObject:](v9, "containsObject:", v17) & 1) == 0)
              {
                int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 registration]);
                __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dependentRegistrationsTTL]);

                if (v19)
                {
                  [v19 timeIntervalSince1970];
                  -[IDSDeviceHeartbeatCenter _updateExpiry:forUser:](self, "_updateExpiry:forUser:", v17);
                  -[NSMutableSet addObject:](v9, "addObject:", v17);
                }

                else
                {
                  __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v27 = v17;
                    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Did not find existing expiry for user %@",  buf,  0xCu);
                  }
                }

                goto LABEL_21;
              }
            }

            else
            {
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
              if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v27 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Missing userID for account %@, ignoring...",  buf,  0xCu);
              }

- (BOOL)_fetchExpiryDatesIfNecessary
{
  if (self->_isSetup)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accounts]);
    id v4 = [v3 _copyForEnumerating];

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v5 = v4;
    id v6 = (os_log_s *)[v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (!v6)
    {
LABEL_30:
      int v18 = v5;
LABEL_31:

      goto LABEL_32;
    }

    char v7 = 0;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v6; i = (os_log_s *)((char *)i + 1))
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "isAdHocAccount", (void)v20) & 1) == 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 registration]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dependentRegistrationResponseCode]);
          id v13 = [v12 integerValue];
          if ([v10 isEnabled])
          {
            BOOL v14 = !v12 || v13 == 0LL;
            BOOL v15 = !v14;
            if ([v10 isRegistered] && !v15)
            {
              int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 registration]);
              double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dependentRegistrationsTTL]);

              if (v17)
              {

                LOBYTE(v6) = 0;
                goto LABEL_30;
              }

              char v7 = 1;
            }
          }
        }
      }

      id v6 = (os_log_s *)[v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    if ((v7 & 1) != 0)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "There is one or more valid accounts but none of them has an expiry date, refreshing the entire list!",  buf,  2u);
      }

      int v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
      [v18 issueGetDependentRequest];
      LOBYTE(v6) = 1;
      goto LABEL_31;
    }
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Not setup yet, ignoring _fetchExpiryTimeIfNecessary",  buf,  2u);
    }
  }

  LOBYTE(v6) = 0;
LABEL_32:

  return (char)v6;
}

- (void)_cleanupKeychain
{
  int v3 = 0;
  IMRemoveKeychainData(@"com.apple.ids", @"DeviceHBI", &v3);
  if (v3)
  {
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceHeartbeat](&OBJC_CLASS___IMRGLog, "deviceHeartbeat"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v5 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Did not delete the heart beat date from the keychain, error: %d",  buf,  8u);
    }
  }

- (void).cxx_destruct
{
}

@end