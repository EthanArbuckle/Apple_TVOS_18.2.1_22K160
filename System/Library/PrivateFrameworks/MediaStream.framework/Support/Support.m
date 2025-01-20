}

LABEL_16:
    v18 = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
    v19 = [v18 isWaitingForAuth];

    if (v19)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "We are waiting for the user to refresh their iCloud passcode. Not quitting.",  (uint8_t *)&v24,  2u);
      }

LABEL_26:
      -[MediaStreamMonitor _startIdleTimerWithInterval:](self, "_startIdleTimerWithInterval:", 1800.0);
      goto LABEL_27;
    }

    if (v9)
    {
      v20 = v9;
      [v20 timeIntervalSinceNow];
      if (v21 > 0.0 && v21 < 1800.0)
      {
        v22 = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
        v23 = [v22 isInRetryState];

        if (v23)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v24 = 138412290;
            v25 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "We have retries pending. The next event is scheduled for %@, which is less than 30 minutes away. Not quitting.",  (uint8_t *)&v24,  0xCu);
          }

          goto LABEL_26;
        }
      }
    }

    -[NSTimer invalidate](self->_idleTimer, "invalidate");
    byte_10001E380 = 1;
LABEL_31:
    dispatch_async(&_dispatch_main_q, &stru_1000188D0);
LABEL_32:

    goto LABEL_33;
  }

  -[MediaStreamMonitor performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "mstreamdIdleTimerDidFire:",  v4,  1LL);
LABEL_33:
}
}

void sub_100005F38(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Checking for idle on main loop",  v1,  2u);
  }

OS_xpc_object *__cdecl sub_100005F94(id a1, NSDate *a2)
{
  v2 = a2;
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v4 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
  -[NSDate timeIntervalSinceReferenceDate](v2, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(v3, v4, v5);
  v6 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
  -[NSDate timeIntervalSinceReferenceDate](v2, "timeIntervalSinceReferenceDate");
  double v8 = v7;

  xpc_dictionary_set_double(v3, v6, v8 + 86400.0);
  xpc_dictionary_set_BOOL(v3, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v3, kBackgroundTaskAgentCellularAllowed, 1);
  xpc_dictionary_set_BOOL(v3, kBackgroundTaskAgentAllowedDuringRoaming, 1);
  xpc_dictionary_set_double(v3, kBackgroundTaskAgentRequiredBatteryLevel, 20.0);
  return (OS_xpc_object *)v3;
}

void sub_100006090(uint64_t a1)
{
  else {
    NSLog(@"Device is locked - waiting\n");
  }
}

uint64_t sub_1000060D4(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_1000060F8(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  return result;
}

void sub_100006130(id a1)
{
  byte_10001E381 = os_variant_has_internal_diagnostics("com.apple.Photos");
}

BOOL sub_100006154(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  v4 = a2;
  if (-[NSString hasPrefix:](v4, "hasPrefix:", @"-")) {
    unsigned __int8 v5 = -[NSString hasSuffix:](v4, "hasSuffix:", @"com.apple.CoreData.ConcurrencyDebug");
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  if (MKBDeviceUnlockedSinceBoot() != 1)
  {
    uint64_t v34 = 0LL;
    v35 = &v34;
    uint64_t v36 = 0x2020000000LL;
    int v37 = 0;
    dispatch_semaphore_t v1 = dispatch_semaphore_create(0LL);
    v2 = dispatch_queue_create("com.apple.mstreamd.wait-unlock", 0LL);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100006090;
    v41[3] = &unk_100018C30;
    xpc_object_t v3 = v1;
    v42 = v3;
    v4 = objc_retainBlock(v41);
    unsigned __int8 v5 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    v6 = (int *)(v35 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000060D4;
    handler[3] = &unk_1000188F8;
    v40 = &v34;
    double v7 = v4;
    id v39 = v7;
    uint64_t v8 = notify_register_dispatch(v5, v6, v2, handler);
    if ((_DWORD)v8)
    {
      NSLog(@"can't register notifications, status %d", v8);
      exit(0);
    }

    dispatch_async(v2, v7);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000060F8;
    block[3] = &unk_100018920;
    block[4] = &v34;
    dispatch_sync(v2, block);

    _Block_object_dispose(&v34, 8);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_1000189C0);
  uint64_t v9 = MSAlbumSharingInitialize();
  MSPathCreateDirectories(v9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(handler[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mstreamd starting up.",  (uint8_t *)handler,  2u);
  }

  CFPreferencesAppSynchronize(@"com.apple.mediastream.mstreamd");
  CFPropertyListRef v10 = CFPreferencesCopyAppValue(@"forceProtocolVersion", @"com.apple.mediastream.mstreamd");
  if (v10) {
    _MSSPCForcedProtocolVersionString = v10;
  }
  XPCSetLogBlocks(&stru_100018A00, &stru_100018A40);
  v11 = objc_alloc_init(&OBJC_CLASS___MSIOSAlbumSharingDaemon);
  _MSASSetDaemon();
  v12 = objc_alloc_init(&OBJC_CLASS___MediaStreamMonitor);
  -[MediaStreamMonitor setAlbumSharingDaemon:](v12, "setAlbumSharingDaemon:", v11);
  -[MSIOSAlbumSharingDaemon setDelegate:](v11, "setDelegate:", v12);
  -[MSIOSAlbumSharingDaemon start](v11, "start");
  if (qword_10001E388 != -1) {
    dispatch_once(&qword_10001E388, &stru_100018940);
  }
  if (byte_10001E381)
  {
    v13 = objc_autoreleasePoolPush();
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 arguments]);

    v16 = (char *)[v15 indexOfObjectPassingTest:&stru_100018980];
    if (v16 == (char *)0x7FFFFFFFFFFFFFFFLL || [v15 count] <= v16 + 1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v20 removeObjectForKey:@"com.apple.CoreData.ConcurrencyDebug"];
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:"));
      BOOL v18 = [v17 intValue] == 0;

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v19 removeObjectForKey:@"com.apple.CoreData.ConcurrencyDebug"];

      if (v18) {
        goto LABEL_17;
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v41[0] = @"com.apple.CoreData.ConcurrencyDebug";
    handler[0] = &__kCFBooleanTrue;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  handler,  v41,  1LL));
    [v21 registerDefaults:v22];

LABEL_17:
    objc_autoreleasePoolPop(v13);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100006770;
  v31[3] = &unk_100018A68;
  v23 = v11;
  v32 = v23;
  BackgroundTaskAgentInit("com.apple.mediastream.mstreamd", &_dispatch_main_q, v31);

  if ((byte_10001E380 & 1) == 0)
  {
    while (1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      unsigned __int8 v26 = [v24 runMode:NSDefaultRunLoopMode beforeDate:v25];

      if ((v26 & 1) == 0) {
        break;
      }
      if (byte_10001E380 == 1) {
        goto LABEL_23;
      }
    }

    byte_10001E380 = 1;
  }

LABEL_23:
  -[MSIOSAlbumSharingDaemon shutDownCompletionBlock:](v23, "shutDownCompletionBlock:", &stru_100018A88);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  v12,  "doNothingTimer:",  0LL,  1LL,  10.0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v28 addTimer:v27 forMode:NSRunLoopCommonModes];

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v29 run];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}
}

void sub_100006750( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100006770(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v13 = 136315138;
    *(void *)&v13[4] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Got notification for job %s",  v13,  0xCu);
  }

  if (!strcmp(a2, "com.apple.mediastream.mstreamd.as.wakeup"))
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, kBackgroundTaskAgentJobStatus);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 134217984;
      *(void *)&v13[4] = int64;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Background task agent sent Shared Photo Stream event status: %llu...",  v13,  0xCu);
    }

    BOOL v11 = xpc_dictionary_get_BOOL(v5, kBackgroundTaskAgentJobExpired);
    if (int64 == 2 || v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        uint64_t v9 = "...checking for pending Shared Photo Stream activities.";
        goto LABEL_19;
      }

LABEL_20:
      objc_msgSend(*(id *)(a1 + 32), "retryOutstandingActivities", *(void *)v13);
      goto LABEL_26;
    }

    if (int64 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Background task agent could not schedule the next Shared Photo Stream task.",  v13,  2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "...ignoring.", v13, 2u);
    }
  }

  else if (!strcmp(a2, "com.apple.mediastream.mstreamd.pluggedin"))
  {
    int64_t v6 = xpc_dictionary_get_int64(v5, kBackgroundTaskAgentJobStatus);
    BOOL v7 = xpc_dictionary_get_BOOL(v5, kBackgroundTaskAgentJobExpired);
    if (v6 == 2 || v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        uint64_t v9 = "Checking for pending activities because external power has been applied.";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v9, v13, 2u);
        goto LABEL_20;
      }

      goto LABEL_20;
    }
  }

void sub_100006A0C(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mstreamd shutting down.",  v1,  2u);
  }

  exit(0);
}

void sub_100006A60(id a1, int a2, NSString *a3, char *a4)
{
  uint64_t v5 = *(void *)&a2;
  BOOL v11 = a3;
  uint64_t v6 = MSPlatform();
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = [v7 shouldLogAtLevel:v5];

  if (v8)
  {
    uint64_t v9 = MSPlatform();
    CFPropertyListRef v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v10 logFacility:0 level:v5 format:v11 args:a4];
  }
}

BOOL sub_100006AE0(id a1, int a2)
{
  uint64_t v2 = *(void *)&a2;
  uint64_t v3 = MSPlatform(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = [v4 shouldLogAtLevel:v2];

  return v2;
}

void sub_100006B1C(id a1, OS_xpc_object *a2)
{
}

id sub_100008D6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

id sub_100008D9C(void *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008E48;
  block[3] = &unk_100018C30;
  id v8 = a1;
  uint64_t v1 = qword_10001E398;
  id v2 = v8;
  uint64_t v3 = v2;
  if (v1 == -1)
  {
    id v4 = v2;
  }

  else
  {
    dispatch_once(&qword_10001E398, block);
    id v4 = v8;
  }

  id v5 = (id)qword_10001E390;

  return v5;
}

void sub_100008E48(uint64_t a1)
{
  uint64_t v1 = MSPathSubscribeDirForPersonID(*(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"powerBudget.plist"]);
  uint64_t v3 = (void *)qword_10001E390;
  qword_10001E390 = v2;
}

id sub_100008E94(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

void sub_100008EC4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSBatteryPowerMonitor defaultMonitor](&OBJC_CLASS___MSBatteryPowerMonitor, "defaultMonitor"));
  unsigned int v3 = [v2 isExternalPowerConnected];

  if (v3)
  {
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personIDToPowerBudgetMap]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)i) didBeginExternalPower];
        }

        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000090DC;
    block[3] = &unk_100018C30;
    id v21 = *(id *)(a1 + 32);
    dispatch_async(&_dispatch_main_q, block);
    CFPropertyListRef v10 = v21;
  }

  else
  {
    __int128 v18 = 0uLL;
    __int128 v19 = 0uLL;
    __int128 v16 = 0uLL;
    __int128 v17 = 0uLL;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "personIDToPowerBudgetMap", 0));
    CFPropertyListRef v10 = (void *)objc_claimAutoreleasedReturnValue([v11 allValues]);

    id v12 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) didEndExternalPower];
        }

        id v13 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }

      while (v13);
    }
  }
}

id sub_1000090DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

void sub_10000998C(_Unwind_Exception *a1)
{
}

LABEL_15:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    __int128 v16 = xpc_connection_get_pid(v5);
    token.val[0] = 138543618;
    *(void *)&token.val[1] = self;
    LOWORD(token.val[3]) = 1024;
    *(unsigned int *)((char *)&token.val[3] + 2) = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Rejecting incoming connection from pid %d lacking of the correct entitlement.",  (uint8_t *)&token,  0x12u);
  }

  uint64_t v14 = 0;
LABEL_18:

  return v14;
}

LABEL_10:
  -[MSIOSAlbumSharingDaemon releaseBusy](self, "releaseBusy");
}

void sub_10000B198(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerBudgetPersistedParameters]);
  if (!v2
    || (unsigned int v3 = (void *)v2,
        id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerBudgetPersistedParameters]),
        unsigned __int8 v5 = [v4 isEqualToDictionary:*(void *)(a1 + 40)],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    [*(id *)(a1 + 32) setPowerBudgetPersistedParameters:*(void *)(a1 + 40)];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) personID]);
    [v6 setPersistentObject:v7 forKey:@"MSIOSAlbumSharingDaemon.powerBudgetParams" personID:v8];
  }

void sub_10000B24C(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKey:@"albumData"]);
  if (v2)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    {
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___MSASAlbum);
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
      id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  v7,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v20 = 0LL;
      CFPropertyListRef v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v9,  v2,  &v20));
      id v11 = v20;

      if (!v10 || (uint64_t v12 = objc_opt_class(&OBJC_CLASS___MSASAlbum), (objc_opt_isKindOfClass(v10, v12) & 1) == 0))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to decode album information in incoming message: %@",  buf,  0xCu);
        }

        goto LABEL_22;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKey:@"type"]);
      if (!v13) {
        goto LABEL_8;
      }
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to decode album type in incoming message: %@",  buf,  0xCu);
        }

        goto LABEL_21;
      }

      if (![v13 isEqualToString:@"new"])
      {
        unsigned int v15 = [v13 isEqualToString:@"delete"];
        BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v16)
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Removing album: %@",  buf,  0xCu);
          }

          id v17 = a1[6];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
          [v17 deleteAlbumWithGUID:v18 inviterAddress:a1[5]];
        }

        else if (v16)
        {
          *(_DWORD *)buf = 138543618;
          id v22 = v13;
          __int16 v23 = 2112;
          __int128 v24 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Unknown operation %{public}@ for %@",  buf,  0x16u);
        }
      }

      else
      {
LABEL_8:
        [v10 setRelationshipState:1];
        if ([a1[5] length])
        {
          [v10 setMetadataValue:a1[5] forKey:kMSASAlbumMetadataInviterAddressKey];
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v19 = a1[5];
          *(_DWORD *)buf = 138412290;
          id v22 = v19;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get inviter address from %@",  buf,  0xCu);
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Adding new pending album: %@",  buf,  0xCu);
        }

        [a1[6] addAlbum:v10];
      }

LABEL_21:
LABEL_22:
      goto LABEL_23;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to decode album data in incoming message: %@",  buf,  0xCu);
  }

void sub_10000BE14(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Client disconnected: %{public}@",  (uint8_t *)&v4,  0x16u);
  }

void sub_10000BEC0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v148 = v2;
    __int16 v149 = 2114;
    uint64_t v150 = v3;
    __int16 v151 = 2114;
    uint64_t v152 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Serving message %{public}@ from client %{public}@",  buf,  0x20u);
  }

  uint64_t v5 = MSASPlatform();
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 albumSharingDaemon]);

  if ([*(id *)(a1 + 40) isEqualToString:kMSASNextActivityDateFn])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nextActivityDate]);
    uint64_t v9 = *(void **)(a1 + 56);
    CFPropertyListRef v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  kMSASRetvalKey,  0LL));
    id v11 = v9;
LABEL_5:
    [v11 sendReply:v10];
LABEL_6:

LABEL_7:
    goto LABEL_27;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASIsInRetryStateFn])
  {
    id v12 = [v7 isInRetryState];
    id v13 = *(void **)(a1 + 56);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
LABEL_10:
    unsigned int v15 = (void *)v14;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v14,  kMSASRetvalKey,  0LL));
    [v13 sendReply:v16];

    goto LABEL_27;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASRetryOutstandingActivitiesFn])
  {
    [v7 retryOutstandingActivities];
LABEL_26:
    [*(id *)(a1 + 56) sendReply:0];
    goto LABEL_27;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASRetryOutstandingActivitiesForPersonIDFn])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    if (v8 && (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v8, v17) & 1) != 0))
    {
      [v7 retryOutstandingActivitiesForPersonID:v8];
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Failed to properly decode personID from incoming message in %@",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v148 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@",  buf,  0xCu);
      }

      NSErrorUserInfoKey v145 = NSLocalizedDescriptionKey;
      v146 = v19;
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v146,  &v145,  1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AlbumSharingDaemon",  0LL,  v20));

      uint64_t v143 = kMSASErrorKey;
      v144 = v21;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v144,  &v143,  1LL));
      [*(id *)(a1 + 56) sendReply:v22];
    }

    [*(id *)(a1 + 56) sendReply:0];
    goto LABEL_7;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASCancelActivitiesFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 cancelActivitiesForPersonID:v18];
LABEL_25:

    goto LABEL_26;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASPushFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:v18];
    goto LABEL_25;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAlbumGUIDsFn])
  {
    __int16 v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E074;
    block[3] = &unk_100018B28;
    id v140 = v7;
    id v141 = *(id *)(a1 + 64);
    id v142 = *(id *)(a1 + 56);
    dispatch_async(v23, block);

    __int128 v24 = v140;
LABEL_48:

    goto LABEL_27;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAlbumWithGUIDFn])
  {
    __int128 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472LL;
    v135[2] = sub_10000E1FC;
    v135[3] = &unk_100018B28;
    id v136 = v7;
    id v137 = *(id *)(a1 + 64);
    id v138 = *(id *)(a1 + 56);
    dispatch_async(v25, v135);

    __int128 v24 = v136;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAccessControlGUIDsFn])
  {
    unsigned __int8 v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472LL;
    v131[2] = sub_10000E2D4;
    v131[3] = &unk_100018B28;
    id v132 = v7;
    id v133 = *(id *)(a1 + 64);
    id v134 = *(id *)(a1 + 56);
    dispatch_async(v26, v131);

    __int128 v24 = v132;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAccessControlWithGUIDFn])
  {
    v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472LL;
    v127[2] = sub_10000E484;
    v127[3] = &unk_100018B28;
    id v128 = v7;
    id v129 = *(id *)(a1 + 64);
    id v130 = *(id *)(a1 + 56);
    dispatch_async(v27, v127);

    __int128 v24 = v128;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelInvitationGUIDsFn])
  {
    v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472LL;
    v123[2] = sub_10000E55C;
    v123[3] = &unk_100018B28;
    id v124 = v7;
    id v125 = *(id *)(a1 + 64);
    id v126 = *(id *)(a1 + 56);
    dispatch_async(v28, v123);

    __int128 v24 = v124;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelInvitationWithGUIDFn])
  {
    v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472LL;
    v119[2] = sub_10000E6E4;
    v119[3] = &unk_100018B28;
    id v120 = v7;
    id v121 = *(id *)(a1 + 64);
    id v122 = *(id *)(a1 + 56);
    dispatch_async(v29, v119);

    __int128 v24 = v120;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAssetCollectionGUIDsFn])
  {
    v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472LL;
    v115[2] = sub_10000E7BC;
    v115[3] = &unk_100018B28;
    id v116 = v7;
    id v117 = *(id *)(a1 + 64);
    id v118 = *(id *)(a1 + 56);
    dispatch_async(v30, v115);

    __int128 v24 = v116;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAssetCollectionWithGUIDFn])
  {
    v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472LL;
    v111[2] = sub_10000E96C;
    v111[3] = &unk_100018B28;
    id v112 = v7;
    id v113 = *(id *)(a1 + 64);
    id v114 = *(id *)(a1 + 56);
    dispatch_async(v31, v111);

    __int128 v24 = v112;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelVideoURLForAssetCollectionWithGUIDFn])
  {
    v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472LL;
    v107[2] = sub_10000EA44;
    v107[3] = &unk_100018B28;
    id v108 = v7;
    id v109 = *(id *)(a1 + 64);
    id v110 = *(id *)(a1 + 56);
    dispatch_async(v32, v107);

    __int128 v24 = v108;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelVideoURLsForAssetCollectionWithGUIDFn])
  {
    v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472LL;
    v103[2] = sub_10000EB18;
    v103[3] = &unk_100018B28;
    id v104 = v7;
    id v105 = *(id *)(a1 + 64);
    id v106 = *(id *)(a1 + 56);
    dispatch_async(v33, v103);

    __int128 v24 = v104;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelIsAssetCollectionMarkedAsViewedFn])
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 modelForPersonID:v34]);

    v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey]);
    CFPropertyListRef v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 isAssetCollectionWithGUIDMarkedAsUnviewed:v35]));

    uint64_t v36 = *(void **)(a1 + 56);
    int v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v10,  kMSASRetvalKey));
    [v36 sendReply:v37];

    goto LABEL_6;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelCommentGUIDsFn])
  {
    v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = sub_10000EC20;
    v99[3] = &unk_100018B28;
    id v100 = v7;
    id v101 = *(id *)(a1 + 64);
    id v102 = *(id *)(a1 + 56);
    dispatch_async(v38, v99);

    __int128 v24 = v100;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelCommentWithGUIDFn])
  {
    id v39 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472LL;
    v95[2] = sub_10000EDEC;
    v95[3] = &unk_100018B28;
    id v96 = v7;
    id v97 = *(id *)(a1 + 64);
    id v98 = *(id *)(a1 + 56);
    dispatch_async(v39, v95);

    __int128 v24 = v96;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelServerSideConfigFn])
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serverSideConfigurationForPersonID:v40]);

    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
    CFPropertyListRef v10 = v41;
    if (v8) {
      [v41 setObject:v8 forKey:kMSASRetvalKey];
    }
    id v11 = *(void **)(a1 + 56);
    goto LABEL_5;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelFetchClientOrgKeyFn])
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASRecordID]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASZoneName]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASOwnerUserID]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v7 clientOrgKeyForRecordID:v42 zoneName:v43 ownerUserID:v44 personID:v45]);

    v47 = *(void **)(a1 + 56);
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v46,  kMSASRetvalKey,  0LL));
    [v47 sendReply:v48];

    goto LABEL_27;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshFn])
  {
    dispatch_time_t v49 = dispatch_time(0LL, 1000000000LL);
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472LL;
    v92[2] = sub_10000EEC4;
    v92[3] = &unk_100018BE0;
    id v93 = v7;
    id v94 = *(id *)(a1 + 64);
    dispatch_after(v49, &_dispatch_main_q, v92);
    [*(id *)(a1 + 56) sendReply:0];

    __int128 v24 = v93;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshContentOfAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASResetSyncKey]);
    id v51 = [v50 BOOLValue];
    v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 refreshContentOfAlbumWithGUID:v18 resetSync:v51 personID:v52 info:v53];
LABEL_65:

LABEL_66:
LABEL_70:

    goto LABEL_25;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshAccessControlListOfAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 refreshAccessControlListOfAlbumWithGUID:v18 personID:v50 info:v54];
LABEL_69:

    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshCommentsForAssetCollectionWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASResetSyncKey]);
    id v55 = [v50 BOOLValue];
    v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 refreshCommentsForAssetCollectionWithGUID:v18 resetSync:v55 personID:v52 info:v53];
    goto LABEL_65;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddAlbumFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 addAlbum:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelModifyAlbumMetadataFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 modifyAlbumMetadata:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetClientOrgKeyForAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASClientOrgKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 setClientOrgKey:v18 forAlbumWithGUID:v50 personID:v54 info:v56];
LABEL_79:

    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetMigrationMarkerFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPVMigrationMarkerKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 setMigrationMarker:v18 personID:v50];
    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 deleteAlbumWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAlbumGUIDAsViewedFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASMoveLastViewedAssetCollectionKey]);
    id v57 = [v54 BOOLValue];
    v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 markAlbumGUIDAsViewed:v18 personID:v50 moveLastViewedAssetCollectionMarker:v57 info:v58];

    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSubscribeToAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 subscribeToAlbumWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelUnsubscribeFromAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 unsubscribeFromAlbumWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAsSpamInvitationWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInvitationGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 markAsSpamInvitationWithGUID:v18 personID:v50];
    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAsSpamAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 markAsSpamAlbumWithGUID:v18 personID:v50];
    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAsSpamInvitationWithTokenFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInvitationTokenKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 markAsSpamInvitationWithToken:v18 personID:v50];
    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAcceptInvitationWithTokenFn])
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInvitationTokenKey]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_10000EF6C;
    v90[3] = &unk_100018C08;
    id v91 = *(id *)(a1 + 56);
    [v7 acceptInvitationWithToken:v59 personID:v60 info:v61 completionBlock:v90];

    __int128 v24 = v91;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAcceptInvitationWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInvitationGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 acceptInvitationWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRejectInvitationWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInvitationGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 rejectInvitationWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddAccessControlsFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASSharingRelationshipsKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 addAccessControlEntries:v18 toAlbumWithGUID:v50 personID:v54 info:v56];
    goto LABEL_79;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRemoveAccessControlEntryWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASSharingRelationshipGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 removeAccessControlEntryWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddAssetCollectionsFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionsKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 addAssetCollections:v18 toAlbumWithGUID:v50 personID:v54 info:v56];
    goto LABEL_79;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteAssetCollectionWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 deleteAssetCollectionWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteAssetCollectionsWithGUIDsFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDsKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 deleteAssetCollectionsWithGUIDs:v18 personID:v50];
    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkCommentsForAssetCollectionWithGUIDAsViewedFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASLastViewedDateKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 markCommentsForAssetCollectionWithGUID:v18 asViewedWithLastViewedDate:v50 personID:v54 info:v56];
    goto LABEL_79;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddCommentsToAssetCollectionWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASCommentsKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 addComments:v18 toAssetCollectionWithGUID:v50 personID:v54 info:v56];
    goto LABEL_79;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteCommentWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASCommentGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASInfoKey]);
    [v7 deleteCommentWithGUID:v18 personID:v50 info:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRetrieveAssetsInAlbumWithGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetsKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 retrieveAssets:v18 inAlbumWithGUID:v50 personID:v54];
    goto LABEL_69;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRetrieveAssetsFromAssetCollectionsWithGUIDs])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDsKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetTypeFlagsKey]);
    id v62 = [v50 intValue];
    v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 retrieveAssetsInAssetCollectionsWithGUIDs:v18 assetTypeFlags:v62 personID:v52];
    goto LABEL_66;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelForgetEverythingFn])
  {
    uint64_t v63 = kMSASPersonIDKey;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    if (v8)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:v63]);
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472LL;
      v88[2] = sub_10000F014;
      v88[3] = &unk_100018C30;
      v65 = &v89;
      id v89 = *(id *)(a1 + 56);
      [v7 forgetEverythingAboutPersonID:v64 completionBlock:v88];
    }

    else
    {
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472LL;
      v86[2] = sub_10000F020;
      v86[3] = &unk_100018C30;
      v65 = &v87;
      id v87 = *(id *)(a1 + 56);
      [v7 forgetEverythingCompletionBlock:v86];
    }

    goto LABEL_7;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASSetIsUIForegroundFn])
  {
    [*(id *)(a1 + 32) _handleForegroundPing:*(void *)(a1 + 64) request:*(void *)(a1 + 56)];
    goto LABEL_27;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelActivityIsThrottledByLackOfDiskSpaceFn])
  {
    uint64_t v66 = MSASPlatform();
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    if ([v67 deviceHasEnoughDiskSpaceRemainingToOperate])
    {
      id v68 = 0LL;
    }

    else
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
      v70 = (void *)objc_claimAutoreleasedReturnValue([v7 existingModelForPersonID:v69]);
      id v68 = [v70 hasEnqueuedActivities];
    }

    id v13 = *(void **)(a1 + 56);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v68));
    goto LABEL_10;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASSetFocusAlbumFn])
  {
    [*(id *)(a1 + 32) _handleFocusAlbum:*(void *)(a1 + 64)];
    goto LABEL_26;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetFocusAssetCollectionGUIDFn])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    [v7 setFocusAssetCollectionGUID:v18 forPersonID:v50];
    goto LABEL_70;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetPublicAccessEnabledFn])
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASEnabledKey]);
    id v72 = [v71 BOOLValue];
    v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v74 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_10000F02C;
    v84[3] = &unk_100018C58;
    id v85 = *(id *)(a1 + 56);
    [v7 setPublicAccessEnabled:v72 forAlbumWithGUID:v73 personID:v74 completionBlock:v84];

    __int128 v24 = v85;
    goto LABEL_48;
  }

  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetMultipleContributorsEnabledFn])
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASEnabledKey]);
    id v76 = [v75 BOOLValue];
    v77 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey]);
    v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey]);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472LL;
    v82[2] = sub_10000F088;
    v82[3] = &unk_100018C58;
    id v83 = *(id *)(a1 + 56);
    [v7 setMultipleContributorsEnabled:v76 forAlbumWithGUID:v77 personID:v78 completionBlock:v82];

    __int128 v24 = v83;
    goto LABEL_48;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v79 = *(void **)(a1 + 32);
    uint64_t v80 = *(void *)(a1 + 40);
    uint64_t v81 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v148 = v79;
    __int16 v149 = 2114;
    uint64_t v150 = v80;
    __int16 v151 = 2114;
    uint64_t v152 = v81;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Unknown request %{public}@ from client %{public}@. Ignoring.",  buf,  0x20u);
  }

LABEL_27:
}

void sub_10000E074(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 albumGUIDs]);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      CFPropertyListRef v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        CFPropertyListRef v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  id v11 = *(void **)(a1 + 48);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v11 sendReply:v12];
}

void sub_10000E1FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAlbumGUIDKey]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 albumWithGUID:v4]);

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v6 sendReply:v7];
}

void sub_10000E2D4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAlbumGUIDKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 accessControlGUIDsForAlbumWithGUID:v6]);

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  id v12 = *(void **)(a1 + 48);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v12 sendReply:v13];
}

void sub_10000E484(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAccessControlGUIDKey]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 accessControlWithGUID:v4]);

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v6 sendReply:v7];
}

void sub_10000E55C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 invitationGUIDs]);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  id v11 = *(void **)(a1 + 48);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v11 sendReply:v12];
}

void sub_10000E6E4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASInvitationGUIDKey]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 invitationWithGUID:v4]);

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v6 sendReply:v7];
}

void sub_10000E7BC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAlbumGUIDKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 assetCollectionGUIDsInAlbumWithGUID:v6]);

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  id v12 = *(void **)(a1 + 48);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v12 sendReply:v13];
}

void sub_10000E96C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 assetCollectionWithGUID:v4]);

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v6 sendReply:v7];
}

void sub_10000EA44(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F1B8;
  v6[3] = &unk_100018B90;
  id v7 = *(id *)(a1 + 48);
  [v4 videoURLForAssetCollectionWithGUID:v5 completionBlock:v6];
}

void sub_10000EB18(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey]);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSAssetMediaAssetTypeKey]);
  id v7 = [v6 unsignedIntegerValue];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F0E4;
  v8[3] = &unk_100018BB8;
  id v9 = *(id *)(a1 + 48);
  [v4 videoURLsForAssetCollectionWithGUID:v5 forMediaAssetType:v7 completionBlock:v8];
}

void sub_10000EC20(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 commentsForAssetCollectionWithGUID:v6]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) GUID]);
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  __int128 v13 = *(void **)(a1 + 48);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v13 sendReply:v14];
}

void sub_10000EDEC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 modelForPersonID:v3]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASCommentGUIDKey]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 commentWithGUID:v4]);

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kMSASRetvalKey,  0LL));
  [v6 sendReply:v7];
}

void sub_10000EEC4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASResetSyncKey]);
  id v3 = [v6 BOOLValue];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kMSASInfoKey]);
  [v2 refreshResetSync:v3 personID:v4 info:v5];
}

void sub_10000EF6C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v7) {
    [v6 setObject:v7 forKey:kMSASInfoKey];
  }
  if (v5) {
    [v6 setObject:v5 forKey:kMSASErrorKey];
  }
  [*(id *)(a1 + 32) sendReply:v6];
}

id sub_10000F014(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReply:0];
}

id sub_10000F020(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReply:0];
}

void sub_10000F02C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a2,  kMSASErrorKey,  0LL));
  [v2 sendReply:v3];
}

void sub_10000F088(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a2,  kMSASErrorKey,  0LL));
  [v2 sendReply:v3];
}

void sub_10000F0E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:kMSASRetvalKey];
  }
  if (v8) {
    [v10 setObject:v8 forKey:kMSASURLExpirationKey];
  }
  if (v11) {
    [v10 setObject:v11 forKey:kMSASErrorKey];
  }
  [*(id *)(a1 + 32) sendReply:v10];
}

void sub_10000F1B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:kMSASRetvalKey];
  }
  if (v8) {
    [v10 setObject:v8 forKey:kMSASURLExpirationKey];
  }
  if (v11) {
    [v10 setObject:v11 forKey:kMSASErrorKey];
  }
  [*(id *)(a1 + 32) sendReply:v10];
}

void sub_10000F28C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("MSMSASServiceConnection work queue", 0LL);
  uint64_t v2 = (void *)qword_10001E3A8;
  qword_10001E3A8 = (uint64_t)v1;
}

void sub_10000F2B8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Shared Streams daemon shutting down.",  buf,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) busyPingTimer]);
  [v3 invalidate];

  [*(id *)(a1 + 32) setBusyPingTimer:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:*(void *)(a1 + 32)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(v5 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F3F8;
  v8[3] = &unk_100018B00;
  void v8[4] = v5;
  id v9 = v6;
  [v7 shutDownCompletionBlock:v8];
}

void sub_10000F3F8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000F47C;
  v3[3] = &unk_100018B00;
  dispatch_queue_t v1 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v1;
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  objc_msgSendSuper2(&v2, "shutDownCompletionBlock:", v3);
}

void sub_10000F47C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F4E8;
  v2[3] = &unk_100018B00;
  dispatch_queue_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(&_dispatch_main_q, v2);
}

void sub_10000F4E8(uint64_t a1)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "personIDToPowerBudgetMap", 0));
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personIDToPowerBudgetMap]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

        [v9 shutDown];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v4);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personIDToPowerBudgetMap]);
  [v10 removeAllObjects];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Shared Streams daemon has shut down.",  buf,  0xCu);
  }

  id v12 = *(void **)(a1 + 40);
  if (v12) {
    dispatch_async(&_dispatch_main_q, v12);
  }
}

void sub_10000F688(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKey:kMSASServerSideConfigPersonIDKey]);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readPowerBudgetParametersForPersonID:v5];
}

void sub_10000F6F4(uint64_t a1)
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSBatteryPowerMonitor defaultMonitor](&OBJC_CLASS___MSBatteryPowerMonitor, "defaultMonitor"));
  unsigned int v3 = [v2 isExternalPowerConnected];

  if (v3)
  {
    __int128 v21 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v19 = 0uLL;
    __int128 v20 = 0uLL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personIDToPowerBudgetMap]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * (void)i) didBeginExternalPower];
        }

        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v7);
    }
  }

  else
  {
    __int128 v17 = 0uLL;
    __int128 v18 = 0uLL;
    __int128 v15 = 0uLL;
    __int128 v16 = 0uLL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "personIDToPowerBudgetMap", 0));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);

    id v11 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) didEndExternalPower];
        }

        id v12 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }

      while (v12);
    }
  }
}

id sub_10000F8BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

void sub_10000F8C4(uint64_t a1, void *a2)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a2 object]);
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 personID]);
  [v3 stopAssetDownloadsForPersonID:v4];
}

id sub_10000F91C(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

id objc_msgSend__updatePushNotificationTopicsOutListenToProduction_outListenToDevelopment_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:");
}

id objc_msgSend_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_personID_info_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:personID:info:");
}

id objc_msgSend_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultipleContributorsEnabled:forAlbumWithGUID:personID:completionBlock:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}