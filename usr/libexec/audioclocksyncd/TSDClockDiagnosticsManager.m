@interface TSDClockDiagnosticsManager
- (BOOL)addNetworkPortWithService:(id)a3;
- (BOOL)addStatisticsWithIdentifier:(unint64_t)a3;
- (BOOL)removeNetworkPortWithService:(id)a3;
- (BOOL)removeStatisticsWithIdentifier:(unint64_t)a3;
- (TSDClockDiagnosticsManager)init;
- (void)dealloc;
- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4;
- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4;
- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9;
- (void)didTerminateServiceForPort:(id)a3;
- (void)didTimeoutOnMACLookupForPort:(id)a3;
@end

@implementation TSDClockDiagnosticsManager

- (TSDClockDiagnosticsManager)init
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___TSDClockDiagnosticsManager;
  id v2 = -[TSDClockDiagnosticsManager init](&v47, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    if (*((void *)v2 + 3))
    {
      v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v6 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v5;

      if (*((void *)v2 + 4))
      {
        dispatch_queue_t v7 = dispatch_queue_create("com.apple.timesyncd.statistics", 0LL);
        v8 = (void *)*((void *)v2 + 1);
        *((void *)v2 + 1) = v7;

        v9 = (dispatch_queue_s *)*((void *)v2 + 1);
        if (v9)
        {
          dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 1uLL, v9);
          v11 = (void *)*((void *)v2 + 2);
          *((void *)v2 + 2) = v10;

          if (*((void *)v2 + 2))
          {
            id v12 = -[IOKNotificationPort initOnDispatchQueue:]( objc_alloc(&OBJC_CLASS___IOKNotificationPort),  "initOnDispatchQueue:",  *((void *)v2 + 1));
            v13 = (void *)*((void *)v2 + 5);
            *((void *)v2 + 5) = v12;

            if (*((void *)v2 + 5))
            {
              objc_initWeak((id *)location, v2);
              v14 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncService"));
              uint64_t v15 = *((void *)v2 + 5);
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472LL;
              v45[2] = sub_1000043A4;
              v45[3] = &unk_10003C460;
              objc_copyWeak(&v46, (id *)location);
              uint64_t v16 = IOKMatchedNotification;
              uint64_t v17 = objc_claimAutoreleasedReturnValue( +[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:]( &OBJC_CLASS___IOKService,  "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:",  IOKMatchedNotification,  v14,  v15,  0LL,  v45));
              v18 = (void *)*((void *)v2 + 6);
              *((void *)v2 + 6) = v17;

              v19 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncService"));
              uint64_t v20 = *((void *)v2 + 5);
              v43[0] = _NSConcreteStackBlock;
              v43[1] = 3221225472LL;
              v43[2] = sub_100004638;
              v43[3] = &unk_10003C460;
              objc_copyWeak(&v44, (id *)location);
              uint64_t v21 = IOKTerminatedNotification;
              uint64_t v22 = objc_claimAutoreleasedReturnValue( +[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:]( &OBJC_CLASS___IOKService,  "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:",  IOKTerminatedNotification,  v19,  v20,  0LL,  v43));
              v23 = (void *)*((void *)v2 + 7);
              *((void *)v2 + 7) = v22;

              v24 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncNetworkPort"));
              uint64_t v25 = *((void *)v2 + 5);
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472LL;
              v41[2] = sub_1000048CC;
              v41[3] = &unk_10003C460;
              objc_copyWeak(&v42, (id *)location);
              uint64_t v26 = objc_claimAutoreleasedReturnValue( +[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:]( &OBJC_CLASS___IOKService,  "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:",  v16,  v24,  v25,  0LL,  v41));
              v27 = (void *)*((void *)v2 + 8);
              *((void *)v2 + 8) = v26;

              v28 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncNetworkPort"));
              uint64_t v29 = *((void *)v2 + 5);
              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472LL;
              v39[2] = sub_100004AAC;
              v39[3] = &unk_10003C460;
              objc_copyWeak(&v40, (id *)location);
              uint64_t v30 = objc_claimAutoreleasedReturnValue( +[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:]( &OBJC_CLASS___IOKService,  "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:",  v21,  v28,  v29,  0LL,  v39));
              v31 = (void *)*((void *)v2 + 9);
              *((void *)v2 + 9) = v30;

              v32 = (dispatch_source_s *)*((void *)v2 + 2);
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472LL;
              handler[2] = sub_100004C8C;
              handler[3] = &unk_10003C488;
              objc_copyWeak(&v38, (id *)location);
              dispatch_source_set_event_handler(v32, handler);
              dispatch_source_set_timer(*((dispatch_source_t *)v2 + 2), 0LL, 0xDF8475800uLL, 0LL);
              dispatch_resume(*((dispatch_object_t *)v2 + 2));
              v33 = (dispatch_queue_s *)*((void *)v2 + 1);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_100004EC8;
              block[3] = &unk_10003C4B0;
              id v2 = v2;
              id v36 = v2;
              dispatch_async(v33, block);

              objc_destroyWeak(&v38);
              objc_destroyWeak(&v40);
              objc_destroyWeak(&v42);
              objc_destroyWeak(&v44);
              objc_destroyWeak(&v46);
              objc_destroyWeak((id *)location);
              return (TSDClockDiagnosticsManager *)v2;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316418;
              *(void *)&location[4] = "_notificationPort != nil";
              __int16 v49 = 2048;
              uint64_t v50 = 0LL;
              __int16 v51 = 2048;
              uint64_t v52 = 0LL;
              __int16 v53 = 2080;
              v54 = &unk_100030E57;
              __int16 v55 = 2080;
              v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
              __int16 v57 = 1024;
              int v58 = 63;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316418;
            *(void *)&location[4] = "_statisticsTimer != nil";
            __int16 v49 = 2048;
            uint64_t v50 = 0LL;
            __int16 v51 = 2048;
            uint64_t v52 = 0LL;
            __int16 v53 = 2080;
            v54 = &unk_100030E57;
            __int16 v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
            __int16 v57 = 1024;
            int v58 = 60;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136316418;
          *(void *)&location[4] = "_statisticsQueue != nil";
          __int16 v49 = 2048;
          uint64_t v50 = 0LL;
          __int16 v51 = 2048;
          uint64_t v52 = 0LL;
          __int16 v53 = 2080;
          v54 = &unk_100030E57;
          __int16 v55 = 2080;
          v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
          __int16 v57 = 1024;
          int v58 = 57;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136316418;
        *(void *)&location[4] = "_networkPorts != nil";
        __int16 v49 = 2048;
        uint64_t v50 = 0LL;
        __int16 v51 = 2048;
        uint64_t v52 = 0LL;
        __int16 v53 = 2080;
        v54 = &unk_100030E57;
        __int16 v55 = 2080;
        v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
        __int16 v57 = 1024;
        int v58 = 54;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(void *)&location[4] = "_statistics != nil";
      __int16 v49 = 2048;
      uint64_t v50 = 0LL;
      __int16 v51 = 2048;
      uint64_t v52 = 0LL;
      __int16 v53 = 2080;
      v54 = &unk_100030E57;
      __int16 v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
      __int16 v57 = 1024;
      int v58 = 51;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
    }

    return 0LL;
  }

  return (TSDClockDiagnosticsManager *)v2;
}

- (BOOL)addStatisticsWithIdentifier:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statistics, "objectForKeyedSubscript:", v5));
  if (!v6)
  {
    dispatch_queue_t v7 = -[TSDClockStatistics initWithClockIdentifier:]( objc_alloc(&OBJC_CLASS___TSDClockStatistics),  "initWithClockIdentifier:",  a3);
    if (v7)
    {
      statistics = self->_statistics;
      if (statistics)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](statistics, "setObject:forKeyedSubscript:", v7, v5);
        goto LABEL_6;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316418;
        id v12 = "_statistics != nil";
        __int16 v13 = 2048;
        uint64_t v14 = 0LL;
        __int16 v15 = 2048;
        uint64_t v16 = 0LL;
        __int16 v17 = 2080;
        v18 = &unk_100030E57;
        __int16 v19 = 2080;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
        __int16 v21 = 1024;
        int v22 = 190;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v11,  0x3Au);
      }
    }

    BOOL v9 = 0;
    goto LABEL_7;
  }

  dispatch_queue_t v7 = (TSDClockStatistics *)v6;
LABEL_6:
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)removeStatisticsWithIdentifier:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statistics, "objectForKeyedSubscript:", v4));
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 finalizeClock];
    -[NSMutableDictionary removeObjectForKey:](self->_statistics, "removeObjectForKey:", v4);
  }

  return v6 != 0LL;
}

- (BOOL)addNetworkPortWithService:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPPort gPTPPortWithService:](&OBJC_CLASS___TSDgPTPPort, "gPTPPortWithService:", v4));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSDgPTPNetworkPort);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"0x%016llx",  [v4 entryID]));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_networkPorts, "objectForKeyedSubscript:", v8));

    if (!v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_networkPorts, "setObject:forKeyedSubscript:", v5, v8);
      [v5 addClient:self];
      [v5 registerAsyncCallbackError:0];
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "[networkPort isKindOfClass:[TSDgPTPNetworkPort class]]";
      __int16 v13 = 2048;
      uint64_t v14 = 0LL;
      __int16 v15 = 2048;
      uint64_t v16 = 0LL;
      __int16 v17 = 2080;
      v18 = &unk_100030E57;
      __int16 v19 = 2080;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
      __int16 v21 = 1024;
      int v22 = 228;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    v8 = 0LL;
  }

  return isKindOfClass & 1;
}

- (BOOL)removeNetworkPortWithService:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"0x%016llx",  [a3 entryID]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_networkPorts, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_networkPorts, "objectForKeyedSubscript:", v4));
    [v6 deregisterAsyncCallbackError:0];
    [v6 removeClient:self];
    -[NSMutableDictionary removeObjectForKey:](self->_networkPorts, "removeObjectForKey:", v4);
  }

  return v5 != 0LL;
}

- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4
{
  BOOL v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a4;
    id v7 = [v6 clockIdentifier];
    if (v5) {
      v8 = "YES";
    }
    else {
      v8 = "NO";
    }
    unsigned int v9 = [v6 portNumber];

    int v10 = 134218498;
    id v11 = v7;
    __int16 v12 = 2080;
    __int16 v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: AS Capable %s on port %hu\n",  (uint8_t *)&v10,  0x1Cu);
  }

- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4
{
  BOOL v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a4;
    id v7 = [v6 clockIdentifier];
    if (v5) {
      v8 = "YES";
    }
    else {
      v8 = "NO";
    }
    unsigned int v9 = [v6 portNumber];

    int v10 = 134218498;
    id v11 = v7;
    __int16 v12 = 2080;
    __int16 v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Administrative Enabled %s on port %hu\n",  (uint8_t *)&v10,  0x1Cu);
  }

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a3;
    id v5 = [v4 clockIdentifier];
    unsigned int v6 = [v4 portNumber];

    int v7 = 134218240;
    id v8 = v5;
    __int16 v9 = 1024;
    unsigned int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: MAC lookup timeout on port %hu\n",  (uint8_t *)&v7,  0x12u);
  }

- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = a9;
    id v16 = [v15 clockIdentifier];
    unsigned int v17 = [v15 portNumber];

    int v18 = 134219776;
    id v19 = v16;
    __int16 v20 = 1024;
    unsigned int v21 = v17;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2048;
    int64_t v29 = a6;
    __int16 v30 = 2048;
    int64_t v31 = a7;
    __int16 v32 = 1024;
    unsigned int v33 = a8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Sync timeout on port %hu with mean %llu median %llu stddev %llu min %llu max %llu num samples %u\n",  (uint8_t *)&v18,  0x4Au);
  }

- (void)didTerminateServiceForPort:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a3;
    id v5 = [v4 clockIdentifier];
    unsigned int v6 = [v4 portNumber];

    int v7 = 134218240;
    id v8 = v5;
    __int16 v9 = 1024;
    unsigned int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Terminate for port %hu\n",  (uint8_t *)&v7,  0x12u);
  }

- (void)dealloc
{
  statisticsTimer = self->_statisticsTimer;
  if (statisticsTimer) {
    dispatch_source_cancel((dispatch_source_t)statisticsTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TSDClockDiagnosticsManager;
  -[TSDClockDiagnosticsManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end