void start()
{
  void *v0;
  TSDDaemon *v1;
  void *v2;
  _BYTE v3[12];
  __int16 v4;
  const char *v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v3 = 136315394;
    *(void *)&v3[4] = "audioclocksyncd";
    v4 = 2080;
    v5 = "1320.8";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s %s\n\n", v3, 0x16u);
  }

  *(void *)v3 = 0xFE000100FF0001LL;
  task_policy_set(mach_task_self_, 9u, (task_policy_t)v3, 2u);
  v0 = objc_autoreleasePoolPush();
  v1 = objc_alloc_init(&OBJC_CLASS___TSDDaemon);
  v2 = (void *)qword_100047BE8;
  qword_100047BE8 = (uint64_t)v1;

  dispatch_main();
}

void sub_100004318( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_1000043A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v9 = 136316418;
    v10 = "strongSelf != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    v16 = &unk_100030E57;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v19 = 1024;
    int v20 = 73;
LABEL_12:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v9,  0x3Au);
    goto LABEL_5;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IOKRegistryEntry);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v9 = 136316418;
    v10 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    v16 = &unk_100030E57;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v19 = 1024;
    int v20 = 74;
    goto LABEL_12;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 propertyForKey:@"ClockIdentifier"]);
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v9 = 136316418;
    v10 = "clockIdenfierObj != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    v16 = &unk_100030E57;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v19 = 1024;
    int v20 = 77;
    goto LABEL_12;
  }

  v8 = v7;
  objc_msgSend(WeakRetained, "addStatisticsWithIdentifier:", objc_msgSend(v7, "unsignedLongLongValue"));

LABEL_5:
  objc_autoreleasePoolPop(v4);
}

void sub_100004638(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v9 = 136316418;
    v10 = "strongSelf != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    v16 = &unk_100030E57;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v19 = 1024;
    int v20 = 94;
LABEL_12:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v9,  0x3Au);
    goto LABEL_5;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IOKRegistryEntry);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v9 = 136316418;
    v10 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    v16 = &unk_100030E57;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v19 = 1024;
    int v20 = 95;
    goto LABEL_12;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 propertyForKey:@"ClockIdentifier"]);
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v9 = 136316418;
    v10 = "clockIdenfierObj != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    v16 = &unk_100030E57;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v19 = 1024;
    int v20 = 98;
    goto LABEL_12;
  }

  v8 = v7;
  objc_msgSend(WeakRetained, "removeStatisticsWithIdentifier:", objc_msgSend(v7, "unsignedLongLongValue"));

LABEL_5:
  objc_autoreleasePoolPop(v4);
}

void sub_1000048CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v7 = 136316418;
    v8 = "strongSelf != nil";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v17 = 1024;
    int v18 = 113;
LABEL_9:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v7,  0x3Au);
    goto LABEL_4;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IOKService);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v7 = 136316418;
    v8 = "[object isKindOfClass:[IOKService class]]";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v17 = 1024;
    int v18 = 114;
    goto LABEL_9;
  }

  [WeakRetained addNetworkPortWithService:v3];
LABEL_4:

  objc_autoreleasePoolPop(v4);
}

void sub_100004AAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v7 = 136316418;
    v8 = "strongSelf != nil";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v17 = 1024;
    int v18 = 127;
LABEL_9:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v7,  0x3Au);
    goto LABEL_4;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IOKService);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v7 = 136316418;
    v8 = "[object isKindOfClass:[IOKService class]]";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v17 = 1024;
    int v18 = 128;
    goto LABEL_9;
  }

  [WeakRetained removeNetworkPortWithService:v3];
LABEL_4:

  objc_autoreleasePoolPop(v4);
}

void sub_100004C8C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPManager sharedgPTPManager](&OBJC_CLASS___TSDgPTPManager, "sharedgPTPManager"));
    [v4 logInterfaceStatisticsWithError:0];

    if ([WeakRetained[3] count] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "==========================================\n",  buf,  2u);
    }

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = WeakRetained[3];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained[3],  "objectForKeyedSubscript:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)i),  (void)v11));
          [v10 logStatistics];
        }

        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v17 = "strongSelf != nil";
    __int16 v18 = 2048;
    uint64_t v19 = 0LL;
    __int16 v20 = 2048;
    uint64_t v21 = 0LL;
    __int16 v22 = 2080;
    v23 = &unk_100030E57;
    __int16 v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v26 = 1024;
    int v27 = 141;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100004EC8(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 48) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 56) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 64) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 72) primeNotification];
  objc_autoreleasePoolPop(v2);
}
}

void sub_100005958(id a1)
{
  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(&OBJC_CLASS___TSDCallbackRefconMap);
  id v3 = (void *)qword_100047BF0;
  qword_100047BF0 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

void sub_100005D5C(id a1)
{
  dword_100047C10 = getpid();
  dword_100047CE8 = 0;
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v2 = (void *)qword_100047C18;
  qword_100047C18 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TSDDaemonService sharedDaemonService](&OBJC_CLASS___TSDDaemonService, "sharedDaemonService"));
  v4 = (void *)qword_100047C00;
  qword_100047C00 = v3;

  if (![(id)qword_100047C00 registerProcess:dword_100047C10 withCallback:&stru_10003C550 error:0]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODConnection registerProcess failed\n",  v5,  2u);
  }

void sub_100005E2C(id a1, unsigned int a2, int a3, const unint64_t *a4, unsigned int a5)
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = *(void *)&a2;
  __int16 v9 = objc_autoreleasePoolPush();
  +[IODConnection dispatchNotificationForClientID:ioResult:args:numArgs:]( &OBJC_CLASS___IODConnection,  "dispatchNotificationForClientID:ioResult:args:numArgs:",  v8,  v7,  a4,  v5);
  objc_autoreleasePoolPop(v9);
}

uint64_t sub_1000060F4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1 + 48))( *(void *)(*(void *)(a1 + 32) + 48LL),  *(unsigned int *)(a1 + 56),  *(void *)(*(void *)(a1 + 40) + 8LL) + 32LL,  *(unsigned int *)(a1 + 60));
}

LABEL_10:
    __int16 v15 = 0;
    goto LABEL_11;
  }

  __int128 v12 = (IOKNotificationPort *)-[IOKNotificationPort initOnDispatchQueue:]( objc_alloc(&OBJC_CLASS___IOKNotificationPort),  "initOnDispatchQueue:",  v11);
  asyncCallbackPort = self->_asyncCallbackPort;
  self->_asyncCallbackPort = v12;

  __int128 v14 = self->_asyncCallbackPort;
  if (!v14) {
    goto LABEL_10;
  }
  v23 = a4;
  __int16 v24 = (const char *)a5;
  __int16 v15 = -[IOKConnection callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_iokConnection,  "callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:s calarOutputs:scalarOutputCount:error:",  v9,  -[IOKNotificationPort machPort](v14, "machPort"),  buf,  8LL,  0LL,  0LL,  0LL,  0LL,  0LL);
LABEL_11:

  return v15;
}

    v4 = 0LL;
    goto LABEL_4;
  }

  if (([v3 conformsToIOClassName:@"IOTimeSyncClockManager"] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = 136316418;
      __int128 v11 = "[service conformsToIOClassName:@kIOTimeSyncClockManagerClass]";
      __int128 v12 = 2048;
      __int128 v13 = 0LL;
      __int128 v14 = 2048;
      __int16 v15 = 0LL;
      v16 = 2080;
      __int16 v17 = &unk_100030E57;
      __int16 v18 = 2080;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v20 = 1024;
      uint64_t v21 = 522;
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ioClassName]);
  [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"TimeSyncTimeClockID"]);
  [v4 setObject:v6 forKeyedSubscript:@"TimeSyncTimeClockID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"TranslationClockID"]);
  [v4 setObject:v7 forKeyedSubscript:@"TranslationClockID"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"TimeSyncTimeCoreAudioClockDomain"]);
  [v4 setObject:v8 forKeyedSubscript:@"TimeSyncTimeCoreAudioClockDomain"];

LABEL_4:
  return v4;
}

LABEL_15:
        return 0LL;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v8 = "_sharedTSDIOKServiceMatcherNotificationsPort != nil";
      __int16 v9 = 2048;
      uint64_t v10 = 0LL;
      __int128 v11 = 2048;
      __int128 v12 = 0LL;
      __int128 v13 = 2080;
      __int128 v14 = &unk_100030E57;
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v17 = 1024;
      __int16 v18 = 44;
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v8 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
      __int16 v9 = 2048;
      uint64_t v10 = 0LL;
      __int128 v11 = 2048;
      __int128 v12 = 0LL;
      __int128 v13 = 2080;
      __int128 v14 = &unk_100030E57;
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v17 = 1024;
      __int16 v18 = 43;
    }

LABEL_14:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    goto LABEL_15;
  }

  return v2;
}

void sub_100006880(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSIOKServiceMatcherClassNotifier.sharedNotificationsQueue", 0LL);
  v2 = (void *)qword_100047C20;
  qword_100047C20 = (uint64_t)v1;

  uint64_t v3 = objc_alloc(&OBJC_CLASS___IOKNotificationPort);
  id v4 = -[IOKNotificationPort initOnDispatchQueue:](v3, "initOnDispatchQueue:", qword_100047C20);
  uint64_t v5 = (void *)qword_100047C28;
  qword_100047C28 = (uint64_t)v4;
}

void sub_100006CB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_100006CE4(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
    if (v5)
    {
      id v6 = (void *)v5;
      do
      {
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___IOKService);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
          [WeakRetained handleServiceMatched:v6];
        }
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v9 nextObject]);

        id v6 = (void *)v8;
      }

      while (v8);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100006DA0(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
    if (v5)
    {
      id v6 = (void *)v5;
      do
      {
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___IOKService);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
          [WeakRetained handleServiceTerminated:v6];
        }
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v9 nextObject]);

        id v6 = (void *)v8;
      }

      while (v8);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100006E5C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 8) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 16) primeNotification];
  objc_autoreleasePoolPop(v2);
}

void sub_100007704(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  int v3 = [*(id *)(a1 + 32) getMatchedCount];
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3 < 1)
  {
    if (v4)
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v6;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, saving notification block",  (uint8_t *)&v11,  0x12u);
    }

    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 40LL);
    id v9 = [v7 copy];
    id v10 = objc_retainBlock(v9);
    [v8 addObject:v10];
  }

  else
  {
    if (v4)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v5;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, dispatching notification",  (uint8_t *)&v11,  0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000079DC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  unsigned int v3 = [*(id *)(a1 + 32) getMatchedCount];
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v5;
      __int16 v13 = 1024;
      unsigned int v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, saving notification block",  (uint8_t *)&v11,  0x12u);
    }

    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48LL);
    id v8 = [v6 copy];
    id v9 = objc_retainBlock(v8);
    [v7 addObject:v9];
  }

  else
  {
    if (v4)
    {
      id v10 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v10;
      __int16 v13 = 1024;
      unsigned int v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, dispatching notification",  (uint8_t *)&v11,  0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100007C2C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v7) + 16LL))();
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = *(id *)(a1 + 40);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12) + 16LL))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12));
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v10);
  }

  objc_autoreleasePoolPop(v2);
}

LABEL_18:
        uint64_t v7 = 0LL;
        goto LABEL_9;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136316418;
      v29 = "_service != nil";
      v30 = 2048;
      v31 = 0LL;
      v32 = 2048;
      v33 = 0LL;
      v34 = 2080;
      v35 = &unk_100030E57;
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v38 = 1024;
      v39 = 74;
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136316418;
      v29 = "_notificationsQueue != nil";
      v30 = 2048;
      v31 = 0LL;
      v32 = 2048;
      v33 = 0LL;
      v34 = 2080;
      v35 = &unk_100030E57;
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      v38 = 1024;
      v39 = 69;
    }

    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    goto LABEL_19;
  }

LABEL_17:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    goto LABEL_18;
  }

  return v7;
}

void sub_100008868(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getObject:a1]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TSDClockSync);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    id v11 = v9;
    id v12 = v11;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000LL) {
        [v11 _handleRefreshConnection];
      }
    }

    else if (a4 >= 5)
    {
      [v11 _handleNotification:*a3 withArgs:a3 + 2 ofCount:a4 - 1];
    }
  }

  objc_autoreleasePoolPop(v7);
}

LABEL_7:
  -[NSPointerArray compact](self->_updateClients, "compact");
  os_unfair_lock_unlock(&self->_updateClientsLock);
}

  id v12 = v11;

  return v12;
}

LABEL_19:
          uint64_t v7 = 0LL;
          goto LABEL_8;
        }

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = "_notificationPort != nil";
        __int16 v22 = 2048;
        v23 = 0LL;
        __int16 v24 = 2048;
        v25 = 0LL;
        __int16 v26 = 2080;
        int v27 = &unk_100030E57;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        v30 = 1024;
        v31 = 258;
      }

      else
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = "_sharedNotificationsQueue != nil";
        __int16 v22 = 2048;
        v23 = 0LL;
        __int16 v24 = 2048;
        v25 = 0LL;
        __int16 v26 = 2080;
        int v27 = &unk_100030E57;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        v30 = 1024;
        v31 = 251;
      }
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "_service != nil";
      __int16 v22 = 2048;
      v23 = 0LL;
      __int16 v24 = 2048;
      v25 = 0LL;
      __int16 v26 = 2080;
      int v27 = &unk_100030E57;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
      v30 = 1024;
      v31 = 242;
    }

LABEL_9:
  return v7;
}

void sub_1000092D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000092FC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPPort.sharedNotificationsQueue", 0LL);
  v2 = (void *)qword_100047C38;
  qword_100047C38 = (uint64_t)v1;
}

void sub_100009328(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  id v5 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == -536870608)
    {
      if (WeakRetained[32]) {
        [WeakRetained updateProperties];
      }
    }

    else if (a3 == -536870896)
    {
      [WeakRetained serviceTerminated];
    }
  }

  objc_autoreleasePoolPop(v5);
}

void sub_10000945C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) clockIdentifier] != *(id *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setClockIdentifier:");
  }
  objc_autoreleasePoolPop(v2);
}

LABEL_24:
    uint64_t v7 = 0LL;
    goto LABEL_21;
  }

  uint64_t v6 = &OBJC_CLASS___TSDgPTPEthernetPort;
LABEL_20:
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class diagnosticInfoForService:](v6, "diagnosticInfoForService:", v5));
LABEL_21:

  return v7;
}
  }

  return v5;
}

void sub_10000ACC4(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  if ([*(id *)(a1 + 32) remoteClockIdentity] != *(id *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteClockIdentity:");
  }
  unsigned int v3 = [*(id *)(a1 + 32) remoteIsSameDevice];
  int v4 = *(unsigned __int8 *)(a1 + 128);
  if (v4 != v3) {
    [*(id *)(a1 + 32) setRemoteIsSameDevice:v4 != 0];
  }
  unsigned int v5 = [*(id *)(a1 + 32) isASCapable];
  int v6 = *(unsigned __int8 *)(a1 + 129);
  if (v6 != v5) {
    [*(id *)(a1 + 32) setAsCapable:v6 != 0];
  }
  unsigned __int8 v7 = [*(id *)(a1 + 32) localSyncLogMeanInterval];
  int v8 = *(unsigned __int8 *)(a1 + 130);
  if (v8 != v7) {
    [*(id *)(a1 + 32) setLocalSyncLogMeanInterval:(char)v8];
  }
  unsigned __int8 v9 = [*(id *)(a1 + 32) remoteSyncLogMeanInterval];
  int v10 = *(unsigned __int8 *)(a1 + 131);
  if (v10 != v9) {
    [*(id *)(a1 + 32) setRemoteSyncLogMeanInterval:(char)v10];
  }
  unsigned __int8 v11 = [*(id *)(a1 + 32) localAnnounceLogMeanInterval];
  int v12 = *(unsigned __int8 *)(a1 + 132);
  if (v12 != v11) {
    [*(id *)(a1 + 32) setLocalAnnounceLogMeanInterval:(char)v12];
  }
  unsigned __int8 v13 = [*(id *)(a1 + 32) remoteAnnounceLogMeanInterval];
  int v14 = *(unsigned __int8 *)(a1 + 133);
  if (v14 != v13) {
    [*(id *)(a1 + 32) setRemoteAnnounceLogMeanInterval:(char)v14];
  }
  unsigned int v15 = [*(id *)(a1 + 32) hasLocalFrequencyToleranceLower];
  int v16 = *(unsigned __int8 *)(a1 + 140);
  if (v16 != v15) {
    [*(id *)(a1 + 32) setHasLocalFrequencyToleranceLower:v16 != 0];
  }
  unsigned int v17 = [*(id *)(a1 + 32) hasLocalFrequencyToleranceUpper];
  int v18 = *(unsigned __int8 *)(a1 + 141);
  if (v18 != v17) {
    [*(id *)(a1 + 32) setHasLocalFrequencyToleranceUpper:v18 != 0];
  }
  unsigned int v19 = [*(id *)(a1 + 32) hasRemoteFrequencyToleranceLower];
  int v20 = *(unsigned __int8 *)(a1 + 142);
  if (v20 != v19) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyToleranceLower:v20 != 0];
  }
  unsigned int v21 = [*(id *)(a1 + 32) hasRemoteFrequencyToleranceUpper];
  int v22 = *(unsigned __int8 *)(a1 + 143);
  if (v22 != v21) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyToleranceUpper:v22 != 0];
  }
  unsigned int v23 = [*(id *)(a1 + 32) hasLocalFrequencyStabilityLower];
  int v24 = *(unsigned __int8 *)(a1 + 144);
  if (v24 != v23) {
    [*(id *)(a1 + 32) setHasLocalFrequencyStabilityLower:v24 != 0];
  }
  unsigned int v25 = [*(id *)(a1 + 32) hasLocalFrequencyStabilityUpper];
  int v26 = *(unsigned __int8 *)(a1 + 145);
  if (v26 != v25) {
    [*(id *)(a1 + 32) setHasLocalFrequencyStabilityUpper:v26 != 0];
  }
  unsigned int v27 = [*(id *)(a1 + 32) hasRemoteFrequencyStabilityLower];
  int v28 = *(unsigned __int8 *)(a1 + 146);
  if (v28 != v27) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyStabilityLower:v28 != 0];
  }
  unsigned int v29 = [*(id *)(a1 + 32) hasRemoteFrequencyStabilityUpper];
  int v30 = *(unsigned __int8 *)(a1 + 147);
  if (v30 != v29) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyStabilityUpper:v30 != 0];
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sourceAddressString]);
  unsigned __int8 v32 = [v31 isEqualToString:*(void *)(a1 + 40)];

  if ((v32 & 1) == 0) {
    [*(id *)(a1 + 32) setSourceAddressString:*(void *)(a1 + 40)];
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) destinationAddressString]);
  unsigned __int8 v34 = [v33 isEqualToString:*(void *)(a1 + 48)];

  if ((v34 & 1) == 0) {
    [*(id *)(a1 + 32) setDestinationAddressString:*(void *)(a1 + 48)];
  }
  unsigned int v35 = [*(id *)(a1 + 32) overridenReceiveMatching];
  int v36 = *(unsigned __int8 *)(a1 + 148);
  if (v36 != v35) {
    [*(id *)(a1 + 32) setOverridenReceiveMatching:v36 != 0];
  }
  if ([*(id *)(a1 + 32) overridenReceiveClockIdentity] != *(id *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceiveClockIdentity:");
  }
  unsigned int v37 = [*(id *)(a1 + 32) enabled];
  int v38 = *(unsigned __int8 *)(a1 + 149);
  if (v38 != v37) {
    [*(id *)(a1 + 32) setEnabled:v38 != 0];
  }
  objc_autoreleasePoolPop(v2);
}

id sub_10000C6E4(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = [*(id *)(a1 + 32) portRole];
  *(_DWORD *)(*(void *)(a1 + 40) + 4) = [*(id *)(a1 + 32) portType];
  *(_BYTE *)(*(void *)(a1 + 40) + 8) = [*(id *)(a1 + 32) localLinkType];
  *(_BYTE *)(*(void *)(a1 + 40) + 9) = [*(id *)(a1 + 32) remoteLinkType];
  *(_BYTE *)(*(void *)(a1 + 40) + 10) = [*(id *)(a1 + 32) localTimestampingMode];
  *(_BYTE *)(*(void *)(a1 + 40) + 11) = [*(id *)(a1 + 32) remoteTimestampingMode];
  *(void *)(*(void *)(a1 + 40) + 16) = [*(id *)(a1 + 32) remoteClockIdentity];
  id result = [*(id *)(a1 + 32) remotePortNumber];
  *(_WORD *)(*(void *)(a1 + 40) + 24LL) = (_WORD)result;
  return result;
}

void sub_10000C91C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) didChangeASCapable:*(unsigned __int8 *)(a1 + 48) forPort:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10000CE14(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) didChangeASCapable:*(void *)(a1 + 48) != 0 forPort:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10000CF00(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  unsigned __int8 v7 = objc_autoreleasePoolPush();
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getObject:a1]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TSDgPTPNetworkPort);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    id v11 = v9;
    int v12 = v11;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000LL) {
        [v11 _handleRefreshConnection];
      }
    }

    else if (a4 >= 7)
    {
      [v11 _handleNotification:*a3 withArg1:*((void *)a3 + 1) arg2:*((void *)a3 + 2) arg3:*((void *)a3 + 3) arg4:*((void *)a3 + 4) arg5:*((void *)a3 + 5) arg6:*((void *)a3 + 6)];
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_10000D774(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = objc_autoreleasePoolPush();
  if (([v5 conformsToIOClassName:@"IOEthernetInterface"] & 1) != 0
    || [v5 conformsToIOClassName:@"IOTimeSyncInterfaceAdapter"])
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"BSD Name"]);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"BSD Name"];
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10000DF9C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  unsigned __int8 v3 = [*(id *)(a1 + 32) localPDelayLogMeanInterval];
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != v3) {
    [*(id *)(a1 + 32) setLocalPDelayLogMeanInterval:(char)v4];
  }
  unsigned __int8 v5 = [*(id *)(a1 + 32) remotePDelayLogMeanInterval];
  int v6 = *(unsigned __int8 *)(a1 + 49);
  if (v6 != v5) {
    [*(id *)(a1 + 32) setRemotePDelayLogMeanInterval:(char)v6];
  }
  unsigned int v7 = [*(id *)(a1 + 32) multipleRemotes];
  int v8 = *(unsigned __int8 *)(a1 + 50);
  if (v8 != v7) {
    [*(id *)(a1 + 32) setMultipleRemotes:v8 != 0];
  }
  unsigned int v9 = [*(id *)(a1 + 32) measuringPDelay];
  int v10 = *(unsigned __int8 *)(a1 + 51);
  if (v10 != v9) {
    [*(id *)(a1 + 32) setMeasuringPDelay:v10 != 0];
  }
  [*(id *)(a1 + 32) setStatistics:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10000F81C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) setStatistics:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_1000119EC(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___TSTimeConverter);
  v2 = (void *)qword_100047C48;
  qword_100047C48 = (uint64_t)v1;
}

void sub_10001253C(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  v2 = (void *)qword_100047C58;
  qword_100047C58 = (uint64_t)v1;

  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", @"UTC"));
  [(id)qword_100047C58 setTimeZone:v3];

  [(id)qword_100047C58 setFormatOptions:3955];
}

void sub_100013270(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSDDaemonService.shared", 0LL);
  v2 = (void *)qword_100047C70;
  qword_100047C70 = (uint64_t)v1;
}

void sub_10001329C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  if (!qword_100047C68)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) daemonService]);
    int v4 = (void *)qword_100047C68;
    qword_100047C68 = v3;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10001448C(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  int v8 = objc_autoreleasePoolPush();
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getObject:a1]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TSDDaemonService);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && a4 >= 3) {
    [v10 handleNotification:*a3 clientID:a3[2] result:a2 withArgs:a3 + 4 ofCount:a4 - 2];
  }

  objc_autoreleasePoolPop(v8);
}

_DWORD *sub_100014974(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0LL;
  }
  id v3 = [(id)objc_opt_class(*(void *)(a1 + 32)) diagnosticInfoForClockIdentifier:*(void *)(a1 + 40)];
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  0LL));
  int v6 = v5;
  if (v5)
  {
    id v7 = [v5 length];
    int v8 = calloc(1uLL, (size_t)v7 + 200);
    if (v8)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clockName]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ State:", v9));

      _DWORD *v8 = 1;
      v8[1] = (_DWORD)v7;
      id v11 = v10;
      __strlcpy_chk(v8 + 34, [v11 UTF8String], 64, 64);
      memcpy(v8 + 50, [v6 bytes], (size_t)v7);
    }
  }

  else
  {
    int v8 = 0LL;
  }

  return v8;
}

LABEL_475:
LABEL_476:
                v59 = v294;
                v57 = v295;
                goto LABEL_477;
              }

              if (!v257) {
                goto LABEL_475;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v365 - v362;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v234 - v371;
              v259 = "        Received PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_404:
              v260 = 14;
LABEL_474:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v259,  buf,  v260);
              goto LABEL_475;
            }

            v204 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDEtEPort);
            if ((objc_opt_isKindOfClass(v62, v204) & 1) == 0) {
              goto LABEL_476;
            }
            else {
              v205 = 0;
            }
            else {
              v206 = 0;
            }
            v366 = v206;
            v207 = [v63 receivedDelayRequestCounter];
            v208 = [v104 receivedDelayRequestCounter];
            v209 = v207 - v208;
            v210 = [v63 transmittedDelayResponseCounter];
            v211 = [v104 transmittedDelayResponseCounter];
            v329 = [v63 attemptedDelayResponseCounter];
            v326 = [v104 attemptedDelayResponseCounter];
            v335 = [v63 transmittedDelayRequestCounter];
            v332 = [v104 transmittedDelayRequestCounter];
            v341 = [v63 attemptedDelayRequestCounter];
            v338 = [v104 attemptedDelayRequestCounter];
            v355 = [v63 receivedDelayResponseCounter];
            v352 = [v104 receivedDelayResponseCounter];
            v363 = [v63 supersededSyncCounter];
            v360 = [v104 supersededSyncCounter];
            v372 = [v63 supersededDelayCounter];
            v369 = [v104 supersededDelayCounter];
            v212 = v207 - v208 < v205 - 1 && v205 != 0;
            v213 = &_os_log_default;
            v214 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v212 || v209 > v205 + 1)
            {
              if (v214)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v207 - v208;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v205;
                v215 = "        Received Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_407:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v215,  buf,  0xEu);
              }
            }

            else if (v214)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v207 - v208;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v205;
              v215 = "        Received Delay Request Counter: %u expected %u\n";
              goto LABEL_407;
            }

            v261 = v210 - v211;

            v262 = &_os_log_default;
            v263 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v264 = v210 - v211 >= v209 - 1 || v207 == v208;
            v265 = v209 + 1;
            if (v264 && v261 <= v265)
            {
              if (v263)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v261;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v207 - v208;
                v266 = "        Transmitted Delay Response Counter: %u expected %u\n";
                goto LABEL_418;
              }
            }

            else if (v263)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v261;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v207 - v208;
              v266 = "        Transmitted Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_418:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v266,  buf,  0xEu);
            }

            v267 = &_os_log_default;
            v268 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v269 = v329 - v326 >= v209 - 1 || v207 == v208;
            if (v269 && v329 - v326 <= v265)
            {
              v62 = v349;
              v270 = v297;
              if (v268)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v329 - v326;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v209;
                v271 = "        Attempted Delay Response Counter: %u expected %u\n";
                goto LABEL_429;
              }
            }

            else
            {
              v62 = v349;
              v270 = v297;
              if (v268)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v329 - v326;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v209;
                v271 = "        Attempted Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_429:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v271,  buf,  0xEu);
              }
            }

            v272 = &_os_log_default;
            v273 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v274 = v335 - v332 >= v270 || v347 == v345;
            if (v274 && v335 - v332 <= v296)
            {
              if (v273)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v335 - v332;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v347 - v345;
                v275 = "        Transmitted Delay Request Counter: %u expected %u\n";
                goto LABEL_440;
              }
            }

            else if (v273)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v335 - v332;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v347 - v345;
              v275 = "        Transmitted Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_440:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v275,  buf,  0xEu);
            }

            v276 = &_os_log_default;
            v277 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            v278 = v341 - v338 >= v270 || v347 == v345;
            if (v278 && v341 - v338 <= v296)
            {
              if (v277)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v341 - v338;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v347 - v345;
                v279 = "        Attempted Delay Request Counter: %u expected %u\n";
                goto LABEL_451;
              }
            }

            else if (v277)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v341 - v338;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v347 - v345;
              v279 = "        Attempted Delay Request Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_451:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v279,  buf,  0xEu);
            }

            v280 = v355 - v352 < v366 - 1 && v366 != 0;
            v281 = &_os_log_default;
            v282 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v280 || v355 - v352 > v366 + 1)
            {
              if (v282)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v355 - v352;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v366;
                v283 = "        Received Delay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_461:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v283,  buf,  0xEu);
              }
            }

            else if (v282)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v355 - v352;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              v283 = "        Received Delay Response Counter: %u expected %u\n";
              goto LABEL_461;
            }

            v284 = &_os_log_default;
            v285 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v363 == v360)
            {
              v286 = v372;
              if (v285)
              {
                *(void *)buf = 67109120LL;
                v287 = "        Superseded Sync Counter: %u expected 0\n";
                goto LABEL_467;
              }
            }

            else
            {
              v286 = v372;
              if (v285)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v363 - v360;
                v287 = "        Superseded Sync Counter: %u out of expected bounds (0)\n";
LABEL_467:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v287,  buf,  8u);
              }
            }

            v288 = &_os_log_default;
            v289 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v286 == v369)
            {
              if (!v289) {
                goto LABEL_475;
              }
              *(void *)buf = 67109120LL;
              v259 = "        Superseded Delay Counter: %u expected 0\n";
            }

            else
            {
              if (!v289) {
                goto LABEL_475;
              }
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v286 - v369;
              v259 = "        Superseded Delay Counter: %u out of expected bounds (0)\n";
            }

            v260 = 8;
            goto LABEL_474;
          }

LABEL_477:
          v60 = v356 + 1;
        }

        while (v303 != (id)(v356 + 1));
        v303 = [v59 countByEnumeratingWithState:&v375 objects:v392 count:16];
        if (!v303)
        {
LABEL_479:

          int v6 = v292;
          v45 = v342;
          break;
        }
      }
    }

    v57->_firstStatistics = 0;
    v57->_lastStatisticsTime = v3;
    objc_storeStrong((id *)&v57->_lastStatistics, obj);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = -[TSDKernelClock clockIdentifier](self->_clock, "clockIdentifier");
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Clock Statistics for 0x%016llx\n",  buf,  0xCu);
    }

    int v14 = -[TSDKernelClock lockState](self->_clock, "lockState");
    if (v14 > 2) {
      unsigned int v15 = @"Unknown";
    }
    else {
      unsigned int v15 = off_10003C858[v14];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = -[__CFString UTF8String](v15, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Clock lock state: %s\n",  buf,  0xCu);
    }

    unsigned int v25 = self->_clock;
    v374 = 0LL;
    int v26 = -[TSDKernelClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:]( v25,  "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:",  &v391,  &v390,  &v389,  &v387,  &v374);
    unsigned int v27 = v374;
    int v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        v395 = v390;
        v396 = 2048;
        v397 = (double)v391 / (double)v390;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Rate Ratio: %llu/%llu (%0.12f)\n",  buf,  0x20u);
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v389;
        *(_WORD *)&buf[12] = 2048;
        v395 = v387;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Anchors: %llu, %llu\n",  buf,  0x16u);
      }
    }

    else if (v28)
    {
      int v36 = objc_claimAutoreleasedReturnValue([v27 localizedDescription]);
      unsigned int v37 = [v36 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Sync Info: failed to get rate ratio and anchors with error %s\n",  buf,  0xCu);
    }

    int v38 = self->_clock;
    v373 = v27;
    v39 = -[TSDKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:]( v38,  "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:",  &v391,  &v390,  &v388,  &v387,  &v373);
    v40 = v373;

    v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v39)
    {
      if (v41)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        v395 = v390;
        v396 = 2048;
        v397 = (double)v391 / (double)v390;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Rate Ratio: %llu/%llu (%0.12f)\n",  buf,  0x20u);
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v388;
        *(_WORD *)&buf[12] = 2048;
        v395 = v387;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Anchors: %llu, %llu\n",  buf,  0x16u);
      }
    }

    else if (v41)
    {
      v290 = objc_claimAutoreleasedReturnValue([v40 localizedDescription]);
      v291 = [v290 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v291;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Sync Info: failed to get rate ratio and anchors with error %s\n",  buf,  0xCu);
    }
  }

unint64_t sub_100017C60(int a1)
{
  if (a1 < 4)
  {
    if (a1 > -7)
    {
      if (a1 < 0) {
        return 0x3B9ACA00uLL >> -(char)a1;
      }
      else {
        return 1000000000LL << a1;
      }
    }

    else
    {
      uint64_t v1 = 15625000LL;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100027E94();
      }
    }
  }

  else
  {
    uint64_t v1 = 8000000000LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100027E28();
    }
  }

  return v1;
}

void sub_100018848( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100018924(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_autoreleasePoolPush();
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"ClockIdentifier"]);
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100019080( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1000190A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterestNotification:a3 withArgument:a4];

  objc_autoreleasePoolPop(v7);
}

void sub_10001B134(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  int v3 = *(_DWORD *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

void sub_10001B770(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  id v7 = objc_autoreleasePoolPush();
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getObject:a1]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TSDKernelClock);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    id v11 = v9;
    int v12 = v11;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000LL) {
        [v11 _handleRefreshConnection];
      }
    }

    else if (a4 >= 3)
    {
      [v11 _handleNotification:*a3 withArgs:a3 + 2 ofCount:a4 - 1];
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_10001B998(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  int v3 = *(_DWORD *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

void sub_10001C42C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[TSDDaemonService sharedDaemonService](&OBJC_CLASS___TSDDaemonService, "sharedDaemonService"));
  v2 = (void *)qword_100047CF0;
  qword_100047CF0 = v1;

  os_log_t v3 = os_log_create("TimeSync", "iokit_get_property_proxy_server");
  int v4 = (void *)qword_100047C80;
  qword_100047C80 = (uint64_t)v3;
}

void sub_10001C660( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_10001C684(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = (dispatch_queue_s *)WeakRetained[2];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001C738;
  v5[3] = &unk_10003CD48;
  objc_copyWeak(&v7, v2);
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void sub_10001C738(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = WeakRetained[3];
    id v7 = v5;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (*(id *)(v12 + 8) == v7)
          {
            unsigned __int8 v13 = *(void **)(v12 + 16);
            *(void *)(v12 + 16) = 0LL;

            int v14 = *(void **)(v12 + 8);
            *(void *)(v12 + 8) = 0LL;

            [v6 removeObject:v12];
            goto LABEL_12;
          }
        }

        id v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

LABEL_12:
    objc_msgSend( (id)qword_100047CF0,  "deregisterProcess:error:",  objc_msgSend(*(id *)(a1 + 32), "processIdentifier"),  0);
    if (![v4[3] count])
    {
      id v15 = v4[4];
      v4[4] = 0LL;
    }
  }

  objc_autoreleasePoolPop(v2);
}

    usleep(0x2710u);

    if (++v7 == 11) {
      return 0LL;
    }
  }

  uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[TSDClockManager classNameForClockService:](self, "classNameForClockService:", v9));
  id v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int128 v17 = a3;
      uint64_t v12 = "Could not find class match for clock identifier: 0x%016llx\n";
      unsigned __int8 v13 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
      goto LABEL_12;
    }

    goto LABEL_12;
  }

  int v14 = [objc_alloc(NSClassFromString(v10)) initWithClockIdentifier:a3 pid:self->_pid];

  return v14;
}

void sub_10001C8D4(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  os_log_t v3 = (NSXPCConnection *)*(id *)(a1 + 40);
  id v4 = v2;
  id v5 = objc_alloc_init(&OBJC_CLASS___ConnectionData);
  clientConnection = v5->clientConnection;
  v5->clientConnection = v3;
  id v7 = v3;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[BarrierBlockTimout create](&OBJC_CLASS___BarrierBlockTimout, "create"));
  barrierBlockTimout = v5->barrierBlockTimout;
  v5->barrierBlockTimout = (BarrierBlockTimout *)v8;

  [v4 addObject:v5];
  uint64_t v10 = (void *)qword_100047CF0;
  if (qword_100047CF0)
  {
    id v11 = [*(id *)(a1 + 40) processIdentifier];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001CAE4;
    v19[3] = &unk_10003CD70;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    id v20 = *(id *)(a1 + 40);
    unsigned int v12 = [v10 registerProcess:v11 withCallback:v19 error:0];
    if (v12)
    {
      [*(id *)(a1 + 40) resume];
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) remoteObjectProxy]);
      int v14 = v13;
      if (v12 == 2) {
        [v13 daemonClientRefresh];
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemonServiceServer registerProcess failed\n",  (uint8_t *)v18,  2u);
      }

      objc_msgSend( (id)qword_100047CF0,  "deregisterProcess:error:",  objc_msgSend(*(id *)(a1 + 40), "processIdentifier"),  0);
    }

    objc_destroyWeak(&v21);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 24) count] == (id)1)
  {
    uint64_t v15 = os_transaction_create("TSDDaemonServiceServer keepalive");
    uint64_t v16 = *(void *)(a1 + 32);
    __int128 v17 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v15;
  }

void sub_10001CAC8(_Unwind_Exception *a1)
{
}

void sub_10001CAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend( WeakRetained,  "dispatchDaemonServiceCallbackForProcess:clientID:ioResult:args:numArgs:",  objc_msgSend(*(id *)(a1 + 32), "processIdentifier"),  a2,  a3,  a4,  a5);
  }

  objc_autoreleasePoolPop(v10);
}

void sub_10001CBCC(uint64_t a1)
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24LL);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v6[1] processIdentifier] == *(_DWORD *)(a1 + 48)
          && *(void *)(a1 + 40)
          && *(_DWORD *)(a1 + 52) <= 0x10u)
        {
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v6[1] remoteObjectProxy]);
          __memmove_chk(v16, *(void *)(a1 + 40), 8LL * *(unsigned int *)(a1 + 52), 136LL);
          int v17 = *(_DWORD *)(a1 + 52);
          if ([v6[2] armAndTestIfExpired])
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v8 = *(_DWORD *)(a1 + 48);
              int v9 = *(_DWORD *)(a1 + 56);
              uint64_t v10 = *(void **)(a1 + 40);
              if (v10)
              {
                if (*(_DWORD *)(a1 + 52)) {
                  uint64_t v10 = (void *)*v10;
                }
                else {
                  uint64_t v10 = 0LL;
                }
              }

              LODWORD(location) = 67109632;
              HIDWORD(location) = v8;
              __int16 v23 = 1024;
              int v24 = v9;
              __int16 v25 = 2048;
              int v26 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "dispatchDaemonServiceCallbackForProcess process %u appears suspended, dropping message to client %u arg0 %llu\n",  (uint8_t *)&location,  0x18u);
            }
          }

          else
          {
            [v7 daemonClientNotification:*(unsigned int *)(a1 + 56) ioResult:*(unsigned int *)(a1 + 60) arguments:v16];
            objc_initWeak(&location, v6);
            id v11 = v6[1];
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472LL;
            v12[2] = sub_10001CE70;
            v12[3] = &unk_10003CDC0;
            objc_copyWeak(&v14, &location);
            int v15 = *(_DWORD *)(a1 + 48);
            id v13 = v7;
            [v11 scheduleSendBarrierBlock:v12];

            objc_destroyWeak(&v14);
            objc_destroyWeak(&location);
          }

          goto LABEL_21;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

LABEL_21:
}

void sub_10001CE4C(_Unwind_Exception *a1)
{
}

void sub_10001CE70(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && [WeakRetained[2] disarmAndTestIfWasExpired])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 48);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemonServiceServer process %d resumed\n",  (uint8_t *)v5,  8u);
    }

    [*(id *)(a1 + 32) daemonClientRefresh];
  }
}

void sub_10001D8E0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemon clock manager is available\n",  buf,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](&OBJC_CLASS___TSDClockManager, "sharedClockManager"));
  [v3 addgPTPServicesWithError:0];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemon waiting for gPTP manager to become available\n",  buf,  2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001DA00;
  v4[3] = &unk_10003C4B0;
  v4[4] = *(void *)(a1 + 32);
  +[TSDgPTPManager notifyWhengPTPManagerIsAvailable:]( &OBJC_CLASS___TSDgPTPManager,  "notifyWhengPTPManagerIsAvailable:",  v4);
  objc_autoreleasePoolPop(v2);
}

void sub_10001DA00(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemon gPTP manager is available\n",  v9,  2u);
  }

  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = objc_alloc_init(&OBJC_CLASS___TSDClockDiagnosticsManager);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  if (!*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___TSDDaemonServiceServer);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001E3BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10001E444(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001E4E4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.shared", 0LL);
  uint64_t v2 = (void *)qword_100047CA8;
  qword_100047CA8 = (uint64_t)v1;

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](&OBJC_CLASS___TSDClockManager, "sharedClockManager"));
  [v3 addgPTPServicesWithError:0];
}

void sub_10001E53C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (!qword_100047CA0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](&OBJC_CLASS___TSDClockManager, "sharedClockManager"));
    [v3 addgPTPServicesWithError:0];
    uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gPTPManager]);
    id v5 = (void *)qword_100047CA0;
    qword_100047CA0 = v4;
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001E6B8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10001EA40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001EA50(uint64_t a1)
{
}

void sub_10001EA58(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (!v2)
  {
    id v3 = -[TSDKernelClock initWithClockIdentifier:]( [TSDgPTPClock alloc],  "initWithClockIdentifier:",  [*(id *)(a1 + 32) systemDomainClockIdentifier]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v2);
}

LABEL_26:
    uint64_t v4 = 0LL;
    goto LABEL_20;
  }

  if (([v3 conformsToIOClassName:@"IOTimeSyncgPTPManager"] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int128 v20 = "[service conformsToIOClassName:@kIOTimeSyncgPTPManagerClass]";
      __int128 v21 = 2048;
      int v22 = 0LL;
      __int16 v23 = 2048;
      int v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      unsigned int v27 = 2080;
      int v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      unsigned int v29 = 1024;
      int v30 = 447;
      goto LABEL_25;
    }

    goto LABEL_26;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ioClassName]);
  [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"SystemDomainIdentifier"]);
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"SystemDomainIdentifier"];
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"AVB0ClockID"]);

  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"AVB0ClockID"];
  }
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"AVB1ClockID"]);

  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"AVB1ClockID"];
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"AVB2ClockID"]);

  if (v9) {
    [v4 setObject:v9 forKeyedSubscript:@"AVB2ClockID"];
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"AVB3ClockID"]);

  if (v10) {
    [v4 setObject:v10 forKeyedSubscript:@"AVB3ClockID"];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"AirPlayClockID"]);

  if (v11) {
    [v4 setObject:v11 forKeyedSubscript:@"AirPlayClockID"];
  }
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v3 iodPropertyForKey:@"CopresenceClockID"]);

  if (v12) {
    [v4 setObject:v12 forKeyedSubscript:@"CopresenceClockID"];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 childIteratorInServicePlaneWithError:0]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001FD2C;
  v17[3] = &unk_10003C768;
  int v15 = v13;
  __int128 v18 = v15;
  [v14 enumerateWithBlock:v17];
  if ([v15 count]) {
    [v4 setObject:v15 forKeyedSubscript:@"PTPInstances"];
  }

LABEL_20:
  return v4;
}

void sub_10001FD2C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_autoreleasePoolPush();
  if ([v5 conformsToIOClassName:@"IOTimeSyncDomain"])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSDgPTPClock diagnosticInfoForService:]( &OBJC_CLASS___TSDgPTPClock,  "diagnosticInfoForService:",  v5));
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10001FF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FFF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100020008(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100020090( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000200A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100020178(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSDClockManager.shared", 0LL);
  uint64_t v2 = (void *)qword_100047CC8;
  qword_100047CC8 = (uint64_t)v1;
}

void sub_1000201A4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (!qword_100047CC0)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clockManager]);
    uint64_t v4 = (void *)qword_100047CC0;
    qword_100047CC0 = v3;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100020408(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_10002071C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10002137C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021624( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100021868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021E74(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100022074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022360(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 iodPropertyForKey:@"ClockIdentifier"]);
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10002467C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(id *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) grandmasterIdentity]) {
    [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 40)];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000246C4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) gptpPath]);
  LOBYTE(v3) = [v3 isEqual:v4];

  objc_autoreleasePoolPop(v2);
}

void sub_100024988(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(id *)(a1 + 48);
  if (v3 != [*(id *)(a1 + 32) grandmasterIdentity]) {
    [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 48)];
  }
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gptpPath]);
  LOBYTE(v4) = [v4 isEqual:v5];

  objc_autoreleasePoolPop(v2);
}

void sub_100026C08(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_autoreleasePoolPush();
  if ([v5 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPPort gPTPPortWithService:](&OBJC_CLASS___TSDgPTPPort, "gPTPPortWithService:", v5));
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100026D78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100026D90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100026DA0(uint64_t a1)
{
}

void sub_100026DA8(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_autoreleasePoolPush();
  if ([v9 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 iodPropertyForKey:@"PortNumber"]);
    id v5 = v4;
    if (v4 && [v4 unsignedShortValue] == *(unsigned __int16 *)(a1 + 40))
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[TSDgPTPPort gPTPPortWithService:](&OBJC_CLASS___TSDgPTPPort, "gPTPPortWithService:", v9));
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100027014(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_autoreleasePoolPush();
  if ([v7 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPEthernetPort;
LABEL_19:
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class diagnosticInfoForService:](v5, "diagnosticInfoForService:", v7));
    [v4 addObject:v6];

    goto LABEL_20;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPUnicastLinkLayerPtPPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPUnicastUDPv4PtPPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPUnicastUDPv6PtPPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPLocalClockPort;
    goto LABEL_19;
  }

  if ([v7 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = &OBJC_CLASS___TSDgPTPPort;
    goto LABEL_19;
  }

LABEL_20:
  objc_autoreleasePoolPop(v3);
}

uint64_t sub_1000277D4(uint64_t a1, uint64_t a2)
{
  return a2 * a1;
}

uint64_t sub_100027830(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)a1 << a2;
  if (a2 > 63) {
    uint64_t v2 = 0LL;
  }
  if (a2 == 64) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = v2;
  }
  if (a2) {
    return v3;
  }
  else {
    return *(void *)a1;
  }
}

uint64_t sub_100027874(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

__n128 sub_10002788C@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = sub_1000277D4(v4, v6);
  uint64_t v10 = v9;
  uint64_t v11 = sub_1000277D4(v5, v7);
  uint64_t v13 = v12;
  uint64_t v24 = sub_1000277D4(v4, v7);
  uint64_t v25 = v14;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  *(void *)&__int128 v22 = sub_1000277D4(v5, v6);
  *((void *)&v22 + 1) = v15;
  __int128 v23 = 0uLL;
  sub_1000279A0((unint64_t *)&v24, (unint64_t *)&v22, v28);
  uint64_t v26 = v8;
  uint64_t v27 = v10;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_100027A28(v28, 64, (uint64_t)&v20);
  __int128 v22 = v20;
  __int128 v23 = v21;
  __int128 v21 = 0uLL;
  *(void *)&__int128 v20 = v11;
  *((void *)&v20 + 1) = v13;
  sub_1000279A0((unint64_t *)&v24, (unint64_t *)&v22, (unint64_t *)&v18);
  __n128 v16 = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = v16;
  sub_1000279A0((unint64_t *)a3, (unint64_t *)&v20, (unint64_t *)&v18);
  __n128 result = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = result;
  return result;
}

unint64_t *sub_1000279A0@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3 = result[2];
  unint64_t v4 = a2[2];
  unint64_t v5 = v4 + v3;
  LODWORD(v6) = __CFADD__(v4, v3);
  if (v5 < v4) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v6;
  }
  uint64_t v7 = a2[3] + result[3] + v6;
  unint64_t v9 = *result;
  unint64_t v8 = result[1];
  unint64_t v11 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v12 = *a2 + *result;
  LODWORD(v13) = __CFADD__(*a2, *result);
  if (v12 < v11) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = v13;
  }
  unint64_t v14 = v10 + v8 + v13;
  *a3 = v12;
  a3[1] = v14;
  a3[2] = v5;
  a3[3] = v7;
  if (v10 > v14
    || (v8 == v14 ? (BOOL v15 = v12 >= v9) : (BOOL v15 = 1),
        v15 ? (int v16 = 0) : (int v16 = 1),
        v12 < v11 ? (BOOL v17 = v10 == v14) : (BOOL v17 = 0),
        !v17 ? (BOOL v18 = v8 > v14) : (BOOL v18 = 1),
        !v18 ? (BOOL v19 = v16 == 0) : (BOOL v19 = 0),
        !v19))
  {
    a3[2] = v5 + 1;
    if (v5 == -1LL) {
      a3[3] = v7 + 1;
    }
  }

  return result;
}

_OWORD *sub_100027A28@<X0>(_OWORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  __int128 v3 = result[1];
  *(_OWORD *)a3 = *result;
  *(_OWORD *)(a3 + 16) = v3;
  if (a2)
  {
    int v6 = a2 - 128;
    if (v6)
    {
      if (a2 <= 127)
      {
        unint64_t v7 = sub_100027BA8((void *)a3, 128 - a2);
        uint64_t v9 = v8;
        *(void *)(a3 + 16) = sub_100027830(a3 + 16, a2) | v7;
        *(void *)(a3 + 24) = v10 | v9;
        __n128 result = (_OWORD *)sub_100027830(a3, a2);
        *(void *)a3 = result;
        *(void *)(a3 + _Block_object_dispose(va, 8) = v11;
        return result;
      }

      __n128 result = (_OWORD *)sub_100027830(a3, v6);
      *(void *)(a3 + 16) = result;
      *(void *)(a3 + 24) = v12;
    }

    else
    {
      *(_OWORD *)(a3 + 16) = *(_OWORD *)a3;
    }

    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
  }

  return result;
}

uint64_t sub_100027AD8(__int128 *a1, unint64_t *a2)
{
  __int128 v10 = *a1;
  __int128 v11 = 0uLL;
  int v3 = 128;
  do
  {
    sub_100027A28(&v10, 1, (uint64_t)&v8);
    __int128 v11 = v9;
    uint64_t result = v8;
    __int128 v10 = v8;
    unint64_t v5 = *a2;
    unint64_t v6 = a2[1];
    if (*((void *)&v9 + 1) > v6 || (*((void *)&v9 + 1) == v6 ? (BOOL v7 = (unint64_t)v9 >= v5) : (BOOL v7 = 0), v7))
    {
      __int128 v11 = v9 - __PAIR128__(v6, v5);
      uint64_t result = v8 | 1;
      *(void *)&__int128 v10 = v8 | 1;
    }

    --v3;
  }

  while (v3);
  return result;
}

double sub_100027B60@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a2;
  v4[1] = 0LL;
  *(void *)&double result = sub_10002788C(a1, v4, a3).n128_u64[0];
  return result;
}

double sub_100027B84@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a1;
  v4[1] = 0LL;
  *(void *)&double result = sub_10002788C(v4, a2, a3).n128_u64[0];
  return result;
}

unint64_t sub_100027BA8(void *a1, int a2)
{
  unint64_t v2 = a1[1];
  unint64_t v3 = v2 >> a2;
  if (a2 <= 63) {
    unint64_t v3 = (v2 << -(char)a2) | (*a1 >> a2);
  }
  if (a2 == 64) {
    unint64_t v3 = a1[1];
  }
  if (a2) {
    return v3;
  }
  else {
    return *a1;
  }
}

void sub_100027C2C(id a1)
{
  dispatch_queue_t v1 = objc_autoreleasePoolPush();
  unint64_t v2 = objc_alloc_init(&OBJC_CLASS___TSDClockSyncManager);
  unint64_t v3 = (void *)qword_100047CE0;
  qword_100047CE0 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

void sub_100027E28()
{
}

void sub_100027E94()
{
}

void sub_100027F00()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "DaemonServiceMatcher failed waiting for daemon service\n",  v0,  2u);
}

id objc_msgSend_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:");
}

id objc_msgSend_addNotificationOfType_forMatching_usingNotificationPort_error_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:");
}

id objc_msgSend_callAsyncMethodWithSelector_wakePort_reference_referenceCount_scalarInputs_scalarInputCount_scalarOutputs_scalarOutputCount_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:sca larOutputCount:error:");
}

id objc_msgSend_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scal arOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodWithSelector_scalarInputs_scalarInputCount_scalarOutputs_scalarOutputCount_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodWithSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodWithSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_structOutput_structOutputSize_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCo unt:structOutput:structOutputSize:error:");
}

id objc_msgSend_didGetStatsOfLocalPortNumber_mean_median_stddev_min_max_numberOfSamples_forClock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didGetStatsOfLocalPortNumber:mean:median:stddev:min:max:numberOfSamples:forClock:");
}

id objc_msgSend_didSyncTimeoutWithMean_median_standardDeviation_minimum_maximum_numberOfSamples_forPort_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:");
}

id objc_msgSend_getMachAbsoluteRateRatioNumerator_denominator_machAnchor_andDomainAnchor_forGrandmasterIdentity_portNumber_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:");
}

id objc_msgSend_getMachAbsoluteRateRatioNumerator_denominator_machAnchor_andDomainAnchor_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:");
}

id objc_msgSend_getTimeSyncTimeRateRatioNumerator_denominator_timeSyncAnchor_andDomainAnchor_forGrandmasterIdentity_portNumber_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:");
}

id objc_msgSend_getTimeSyncTimeRateRatioNumerator_denominator_timeSyncAnchor_andDomainAnchor_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:");
}

id objc_msgSend_initWithNanosecondsSinceEpoch_onGrandmaster_withLocalPortNumber_ptpTimescale_timeTraceable_frequencyTraceable_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:");
}

id objc_msgSend_initWithSeconds_nanoseconds_onGrandmaster_withLocalPortNumber_ptpTimescale_timeTraceable_frequencyTraceable_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:");
}

id objc_msgSend_updateWithSyncInfoValid_syncFlags_timeSyncTime_domainTimeHi_domainTimeLo_cumulativeScaledRate_inverseCumulativeScaledRate_grandmasterID_localPortNumber_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulati veScaledRate:grandmasterID:localPortNumber:");
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}