@interface TSDKernelClock
+ (id)availableKernelClockIdentifiers;
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
+ (id)serviceForClockIdentifier:(unint64_t)a3;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)deregisterAsyncCallback;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)registerAsyncCallback;
- (IODConnection)connection;
- (IOKService)service;
- (NSString)clockName;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSDKernelClock)initWithClockIdentifier:(unint64_t)a3;
- (TSDKernelClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (double)hostRateRatio;
- (id)clients;
- (int)_lockState;
- (int)lockState;
- (unint64_t)clockIdentifier;
- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (unsigned)getCoreAudioReanchors;
- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4;
- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5;
- (void)_handleNotification:(unsigned int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5;
- (void)_handleRefreshConnection;
- (void)_refreshLockStateOnNotificationQueue;
- (void)addClient:(id)a3;
- (void)finalizeNotifications;
- (void)removeClient:(id)a3;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setLockState:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
- (void)updateCoreAudioReanchors:(unsigned int)a3;
@end

@implementation TSDKernelClock

+ (id)availableKernelClockIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingServices:error:](&OBJC_CLASS___IOKService, "matchingServices:error:", v3, 0LL));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100018924;
  v7[3] = &unk_10003C768;
  id v5 = v2;
  id v8 = v5;
  [v4 enumerateWithBlock:v7];

  return v5;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncService";
  v7 = @"ClockIdentifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  v10[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  return v5;
}

- (TSDKernelClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TSDKernelClock;
  v6 = -[TSDKernelClock init](&v37, "init");
  v7 = v6;
  if (v6)
  {
    v6->_clockIdentifier = a3;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    clients = v7->_clients;
    v7->_clients = (NSPointerArray *)v8;

    v7->_clientsLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class(v7);
    v11 = NSStringFromClass(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    if ((int)v4 <= 0) {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TimeSync.%@.0x%016llx.notification",  v12,  a3));
    }
    else {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TimeSync.%@.0x%016llx.notification.%d",  v12,  a3,  v4));
    }
    v15 = (void *)v14;

    id v16 = v15;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v17;

    v19 = v7->_notificationsQueue;
    if (v19)
    {
      objc_storeStrong((id *)&v7->_propertyUpdateQueue, v19);
      v7->_asyncCallbackRefcon = 0LL;
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      id v20 = [(id)objc_opt_class(v7) iokitMatchingDictionaryForClockIdentifier:a3];
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v21));
      service = v7->_service;
      v7->_service = (IOKService *)v22;

      if (v7->_service)
      {
        v24 = -[IODConnection initWithService:andType:]( objc_alloc(&OBJC_CLASS___IODConnection),  "initWithService:andType:",  v7->_service,  42LL);
        connection = v7->_connection;
        v7->_connection = v24;

        if (v7->_connection)
        {
          v7->_lockState = -[TSDKernelClock _lockState](v7, "_lockState");
          if (v7->_notificationsQueue)
          {
            v26 = objc_alloc(&OBJC_CLASS___IOKNotificationPort);
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](v7, "notificationQueue"));
            v28 = (IOKNotificationPort *)-[IOKNotificationPort initOnDispatchQueue:](v26, "initOnDispatchQueue:", v27);
            notificationPort = v7->_notificationPort;
            v7->_notificationPort = v28;

            if (v7->_notificationPort)
            {
              -[TSDKernelClock registerAsyncCallback](v7, "registerAsyncCallback");
              objc_initWeak((id *)location, v7);
              v30 = v7->_service;
              v31 = v7->_notificationPort;
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472LL;
              v35[2] = sub_1000190A4;
              v35[3] = &unk_10003C658;
              objc_copyWeak(&v36, (id *)location);
              uint64_t v32 = objc_claimAutoreleasedReturnValue( -[IOKService addInterestNotifcationOfType:usingNotificationPort:error:withHandler:]( v30,  "addInterestNotifcationOfType:usingNotificationPort:error:withHandler:",  IOKGeneralInterest,  v31,  0LL,  v35));
              interestNotification = v7->_interestNotification;
              v7->_interestNotification = (IOKInterestNotification *)v32;

              objc_destroyWeak(&v36);
              objc_destroyWeak((id *)location);
LABEL_11:

              return v7;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316418;
              *(void *)&location[4] = "_notificationPort != nil";
              __int16 v39 = 2048;
              uint64_t v40 = 0LL;
              __int16 v41 = 2048;
              uint64_t v42 = 0LL;
              __int16 v43 = 2080;
              v44 = &unk_100030E57;
              __int16 v45 = 2080;
              v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
              __int16 v47 = 1024;
              int v48 = 140;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316418;
            *(void *)&location[4] = "_notificationsQueue != nil";
            __int16 v39 = 2048;
            uint64_t v40 = 0LL;
            __int16 v41 = 2048;
            uint64_t v42 = 0LL;
            __int16 v43 = 2080;
            v44 = &unk_100030E57;
            __int16 v45 = 2080;
            v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
            __int16 v47 = 1024;
            int v48 = 137;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136316418;
          *(void *)&location[4] = "_connection != nil";
          __int16 v39 = 2048;
          uint64_t v40 = 0LL;
          __int16 v41 = 2048;
          uint64_t v42 = 0LL;
          __int16 v43 = 2080;
          v44 = &unk_100030E57;
          __int16 v45 = 2080;
          v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
          __int16 v47 = 1024;
          int v48 = 133;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136316418;
        *(void *)&location[4] = "_service != nil";
        __int16 v39 = 2048;
        uint64_t v40 = 0LL;
        __int16 v41 = 2048;
        uint64_t v42 = 0LL;
        __int16 v43 = 2080;
        v44 = &unk_100030E57;
        __int16 v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v47 = 1024;
        int v48 = 130;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(void *)&location[4] = "_notificationsQueue != nil";
      __int16 v39 = 2048;
      uint64_t v40 = 0LL;
      __int16 v41 = 2048;
      uint64_t v42 = 0LL;
      __int16 v43 = 2080;
      v44 = &unk_100030E57;
      __int16 v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
      __int16 v47 = 1024;
      int v48 = 122;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  location,  0x3Au);
    }

    v7 = 0LL;
    goto LABEL_11;
  }

  return v7;
}

- (TSDKernelClock)initWithClockIdentifier:(unint64_t)a3
{
  return -[TSDKernelClock initWithClockIdentifier:pid:](self, "initWithClockIdentifier:pid:", a3, 0LL);
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  v19[0] = -1LL;
  v19[1] = 0LL;
  int v6 = 2;
  v20[0] = a3;
  v20[1] = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:0 scalarInputs:v20 scalarInputCount:2 scalarOutputs:v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 178;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19[0];
  }
  else {
    return -1LL;
  }
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  v19[0] = -1LL;
  v19[1] = 0LL;
  int v6 = 2;
  v20[0] = a3;
  v20[1] = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:1 scalarInputs:v20 scalarInputCount:2 scalarOutputs:v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 200;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19[0];
  }
  else {
    return -1LL;
  }
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  if (a5 < 0xC)
  {
    uint64_t v15 = 0LL;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }

  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&__int128 v5 = 136316418LL;
  __int128 v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    unsigned __int8 v14 = [v13 callMethodWithSelector:4 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 222;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        BOOL v10 = 0;
      }
    }

    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }

  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    int v21 = v6;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v17 = [v16 callMethodWithSelector:4 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 236;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        return 0;
      }
    }
  }

  return v10;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  if (a5 < 0xC)
  {
    uint64_t v15 = 0LL;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }

  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&__int128 v5 = 136316418LL;
  __int128 v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    unsigned __int8 v14 = [v13 callMethodWithSelector:5 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 257;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        BOOL v10 = 0;
      }
    }

    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }

  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    int v21 = v6;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v17 = [v16 callMethodWithSelector:5 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 271;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        return 0;
      }
    }
  }

  return v10;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  unint64_t v19 = -1LL;
  unint64_t v20 = a3;
  int v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:9 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    unsigned __int8 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 292;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  unint64_t v19 = -1LL;
  unint64_t v20 = a3;
  int v6 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:10 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    unsigned __int8 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 312;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (int)_lockState
{
  int v6 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v3 = [v2 callMethodWithSelector:2 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v3 & 1) != 0) {
    return v19;
  }
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  int result = 0;
  if (v5)
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    unsigned __int8 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 329;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    return 0;
  }

  return result;
}

- (double)hostRateRatio
{
  int v6 = 2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v3 = [v2 callMethodWithSelector:3 scalarInputs:0 scalarInputCount:0 scalarOutputs:v18 scalarOutputCount:&v6 error:0];

  if ((v3 & 1) != 0)
  {
    mach_timebase_info((mach_timebase_info_t)info);
  }

  else
  {
    double v4 = 1.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)info = 136316418;
      *(void *)&info[4] = "callResult == YES";
      __int16 v8 = 2048;
      uint64_t v9 = 0LL;
      __int16 v10 = 2048;
      uint64_t v11 = 0LL;
      __int16 v12 = 2080;
      __int16 v13 = &unk_100030E57;
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
      __int16 v16 = 1024;
      int v17 = 346;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  info,  0x3Au);
    }
  }

  return v4;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  int64x2_t v27 = vdupq_n_s64(1uLL);
  unint64_t v28 = -1LL;
  unint64_t v29 = -1LL;
  int v14 = 4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", a3, a4, a5, a6, a7));
  unsigned __int8 v12 = [v11 callMethodWithSelector:8 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v27 scalarOutputCount:&v14 error:0];

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v25 = 1024;
    int v26 = 370;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (a3) {
    *a3 = v27.i64[0];
  }
  if (a4) {
    *a4 = v27.u64[1];
  }
  if (a5) {
    *a5 = v28;
  }
  if (a6) {
    *a6 = v29;
  }
  return v12;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  unint64_t v19 = -1LL;
  unint64_t v20 = a3;
  int v6 = 1;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:11 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    int v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 409;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  unint64_t v19 = -1LL;
  unint64_t v20 = a3;
  int v6 = 1;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:12 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    int v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 430;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  if (a5 < 0xC)
  {
    uint64_t v15 = 0LL;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }

  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&__int128 v5 = 136316418LL;
  __int128 v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    unsigned __int8 v14 = [v13 callMethodWithSelector:13 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        unint64_t v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 451;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        BOOL v10 = 0;
      }
    }

    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }

  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    int v21 = v6;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v17 = [v16 callMethodWithSelector:13 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        unint64_t v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 465;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        return 0;
      }
    }
  }

  return v10;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a5;
  if (a5 < 0xC)
  {
    uint64_t v15 = 0LL;
    BOOL v10 = 1;
    if (!a5) {
      return v10;
    }
    goto LABEL_11;
  }

  unsigned int v20 = 12 * ((a5 - 12) / 0xC);
  BOOL v10 = 1;
  *(void *)&__int128 v5 = 136316418LL;
  __int128 v19 = v5;
  __int16 v11 = a4;
  uint64_t v12 = a3;
  do
  {
    int v21 = 12;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", v19));
    unsigned __int8 v14 = [v13 callMethodWithSelector:14 scalarInputs:v12 scalarInputCount:12 scalarOutputs:v11 scalarOutputCount:&v21 error:0];

    if ((v14 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        unint64_t v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 486;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        BOOL v10 = 0;
      }
    }

    uint64_t v6 = (v6 - 12);
    v12 += 12;
    v11 += 12;
  }

  while (v6 > 0xB);
  uint64_t v15 = v20 + 12;
  if ((_DWORD)v6)
  {
LABEL_11:
    int v21 = v6;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v17 = [v16 callMethodWithSelector:14 scalarInputs:&a3[v15] scalarInputCount:v6 scalarOutputs:&a4[v15] scalarOutputCount:&v21 error:0];

    if ((v17 & 1) == 0)
    {
      BOOL v10 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v23 = "callResult == YES";
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2048;
        uint64_t v27 = 0LL;
        __int16 v28 = 2080;
        unint64_t v29 = &unk_100030E57;
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
        __int16 v32 = 1024;
        int v33 = 500;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        return 0;
      }
    }
  }

  return v10;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  unint64_t v19 = -1LL;
  unint64_t v20 = a3;
  int v6 = 1;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:16 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    unsigned __int8 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 521;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  unint64_t v19 = -1LL;
  unint64_t v20 = a3;
  int v6 = 1;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:17 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    unsigned __int8 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 541;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  int64x2_t v27 = vdupq_n_s64(1uLL);
  unint64_t v28 = -1LL;
  unint64_t v29 = -1LL;
  int v14 = 4;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection", a3, a4, a5, a6, a7));
  unsigned __int8 v12 = [v11 callMethodWithSelector:15 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v27 scalarOutputCount:&v14 error:0];

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v25 = 1024;
    int v26 = 558;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (a3) {
    *a3 = v27.i64[0];
  }
  if (a4) {
    *a4 = v27.u64[1];
  }
  if (a5) {
    *a5 = v28;
  }
  if (a6) {
    *a6 = v29;
  }
  return v12;
}

- (void)updateCoreAudioReanchors:(unsigned int)a3
{
  uint64_t v19 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    LODWORD(v8) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Updating Core Audio Reanchors += %u\n",  (uint8_t *)&v7,  8u);
  }

  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v6 = [v5 callMethodWithSelector:53 scalarInputs:&v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:0 error:0];

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136316418;
    __int16 v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    int v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v17 = 1024;
    int v18 = 591;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v7,  0x3Au);
  }

- (unsigned)getCoreAudioReanchors
{
  int v5 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v3 = [v2 callMethodWithSelector:54 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v18 scalarOutputCount:&v5 error:0];

  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "callResult == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0LL;
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
    __int16 v16 = 1024;
    int v17 = 600;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v18;
}

- (IOKService)service
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  unsigned int v4 = self->_service;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (IODConnection)connection
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  unsigned int v4 = self->_connection;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (void)_refreshLockStateOnNotificationQueue
{
  uint64_t v3 = -[TSDKernelClock _lockState](self, "_lockState");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
  if (!v4
    || (int v5 = (void *)v4,
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue")),
        int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue")),
        v7,
        v6,
        v5,
        v6 == v7))
  {
    if ((_DWORD)v3 != -[TSDKernelClock lockState](self, "lockState")) {
      -[TSDKernelClock setLockState:](self, "setLockState:", v3);
    }
  }

  else
  {
    __int16 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001B134;
    block[3] = &unk_10003CD00;
    int v20 = v3;
    block[4] = self;
    dispatch_sync(v8, block);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock clients](self, "clients", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "didChangeLockStateTo:forClock:") & 1) != 0) {
          [v14 didChangeLockStateTo:v3 forClock:self];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v11);
  }
}

- (void)_handleRefreshConnection
{
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  unsigned __int16 v15 = a5;
  if (a3 == 2001)
  {
    -[TSDKernelClock _refreshLockStateOnNotificationQueue](self, "_refreshLockStateOnNotificationQueue");
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock clients](self, "clients"));
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      unsigned int v11 = a3 - 2000;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          switch(v11)
          {
            case 0u:
              if ((objc_opt_respondsToSelector(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i), "didResetClock:") & 1) != 0) {
                [v13 didResetClock:self];
              }
              break;
            case 2u:
              if ((objc_opt_respondsToSelector( *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  "didChangeClockMasterForClock:") & 1) != 0) {
                [v13 didChangeClockMasterForClock:self];
              }
              break;
            case 3u:
              if ((objc_opt_respondsToSelector( *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  "didBeginClockGrandmasterChangeForClock:") & 1) != 0) {
                [v13 didBeginClockGrandmasterChangeForClock:self];
              }
              if ((objc_opt_respondsToSelector( v13,  "didBeginClockGrandmasterChangeWithGrandmasterID:localPort:forClock:") & 1) != 0) {
                [v13 didBeginClockGrandmasterChangeWithGrandmasterID:a4 localPort:v15 forClock:self];
              }
              break;
            case 4u:
              if ((objc_opt_respondsToSelector( *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  "didEndClockGrandmasterChangeForClock:") & 1) != 0) {
                [v13 didEndClockGrandmasterChangeForClock:self];
              }
              if ((objc_opt_respondsToSelector( v13,  "didEndClockGrandmasterChangeWithGrandmasterID:localPort:forClock:") & 1) != 0) {
                [v13 didEndClockGrandmasterChangeWithGrandmasterID:a4 localPort:v15 forClock:self];
              }
              break;
            case 5u:
              if ((objc_opt_respondsToSelector(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i), "didProcessSync:") & 1) != 0) {
                [v13 didProcessSync:self];
              }
              break;
            case 6u:
              if ((objc_opt_respondsToSelector( *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  "didChangeLocalPortWithGrandmasterID:localPort:forClock:") & 1) != 0) {
                [v13 didChangeLocalPortWithGrandmasterID:a4 localPort:v15 forClock:self];
              }
              break;
            default:
              continue;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

- (void)_handleNotification:(unsigned int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5
{
  if (a3 == 2007 && a5 == 7)
  {
    uint64_t v18 = *(unsigned __int16 *)a4;
    unint64_t v5 = a4[3];
    unint64_t v16 = a4[2];
    unint64_t v17 = a4[1];
    unint64_t v6 = a4[4];
    unint64_t v7 = a4[5];
    int v8 = *((_DWORD *)a4 + 12);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock clients](self, "clients"));
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector( v14,  "didGetStatsOfLocalPortNumber:mean:median:stddev:min:max:numberOfSamples:forClock:") & 1) != 0)
          {
            LODWORD(v15) = v8;
            [v14 didGetStatsOfLocalPortNumber:v18 mean:v17 median:v16 stddev:v5 min:v6 max:v7 numberOfSamples:v15 forClock:self];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v11);
    }
  }

  else if (a5 == 2)
  {
    -[TSDKernelClock _handleNotification:withArg1:andArg2:](self, "_handleNotification:withArg1:andArg2:");
  }

- (BOOL)registerAsyncCallback
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  self->_asyncCallbackRefcon = (unint64_t)[v3 allocateRefcon:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v5 = [v4 registerAsyncNotificationsWithSelector:6 callBack:sub_10001B770 refcon:self->_asyncCallbackRefcon callbackQueue:self->_notificationsQueue];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      id v9 = "result == YES";
      __int16 v10 = 2048;
      uint64_t v11 = 0LL;
      __int16 v12 = 2048;
      uint64_t v13 = 0LL;
      __int16 v14 = 2080;
      uint64_t v15 = &unk_100030E57;
      __int16 v16 = 2080;
      unint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKernelClock.m";
      __int16 v18 = 1024;
      int v19 = 797;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v8,  0x3Au);
    }

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }

  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  [v3 releaseRefcon:self->_asyncCallbackRefcon];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  LOBYTE(v3) = [v4 deregisterAsyncNotificationsWithSelector:7];

  return (char)v3;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  if (a3 == -536870608)
  {
    unsigned int v7 = -[TSDKernelClock _lockState](self, "_lockState", *(void *)&a3, a4);
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    if (!v8) {
      int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue"));
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_10001B998;
    v9[3] = &unk_10003CD00;
    unsigned int v10 = v7;
    v9[4] = self;
    dispatch_async(v8, v9);
  }

  else if (a3 == -536870896)
  {
    os_unfair_lock_lock(&self->_serviceLock);
    connection = self->_connection;
    self->_connection = 0LL;

    service = self->_service;
    self->_service = 0LL;

    os_unfair_lock_unlock(&self->_serviceLock);
  }

- (void)addClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_claimAutoreleasedReturnValue([v4 description]);
    id v6 = [v5 UTF8String];
    id v7 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock description](self, "description"));
    *(_DWORD *)buf = 136315394;
    id v19 = v6;
    __int16 v20 = 2080;
    id v21 = [v7 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Adding Client %s to clock %s\n",  buf,  0x16u);
  }

  -[NSPointerArray compact](self->_clients, "compact");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v8 = self->_clients;
  id v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    while (2)
    {
      __int16 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v13 + 1) + 8LL * (void)v12) == v4)
        {

          goto LABEL_13;
        }

        __int16 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (void)v13);
LABEL_13:
  os_unfair_lock_unlock(&self->_clientsLock);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_claimAutoreleasedReturnValue([v4 description]);
    id v6 = [v5 UTF8String];
    id v7 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock description](self, "description"));
    *(_DWORD *)buf = 136315394;
    id v21 = v6;
    __int16 v22 = 2080;
    id v23 = [v7 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Removing Client %s from clock %s\n",  buf,  0x16u);
  }

  -[NSPointerArray compact](self->_clients, "compact");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  int v8 = self->_clients;
  id v9 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      __int128 v13 = 0LL;
      __int128 v14 = &v10[(void)v11];
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v15 + 1) + 8LL * (void)v13) == v4)
        {

          -[NSPointerArray removePointerAtIndex:]( self->_clients,  "removePointerAtIndex:",  &v13[(void)v11],  (void)v15);
          goto LABEL_13;
        }

        ++v13;
      }

      while (v10 != v13);
      id v10 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      uint64_t v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_13:
  os_unfair_lock_unlock(&self->_clientsLock);
}

- (id)clients
{
  p_clientsLock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPointerArray allObjects](self->_clients, "allObjects"));
  os_unfair_lock_unlock(p_clientsLock);
  return v4;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationsQueue;
}

- (NSString)clockName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ioClassName]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ 0x%016llx",  v5,  -[TSDKernelClock clockIdentifier](self, "clockIdentifier")));
  }

  else
  {
    id v7 = (objc_class *)objc_opt_class(self);
    int v8 = NSStringFromClass(v7);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ 0x%016llx",  v4,  -[TSDKernelClock clockIdentifier](self, "clockIdentifier")));
  }

  return (NSString *)v6;
}

- (void)finalizeNotifications
{
  interestNotification = self->_interestNotification;
  self->_interestNotification = 0LL;

  notificationPort = self->_notificationPort;
  self->_notificationPort = 0LL;
}

+ (id)serviceForClockIdentifier:(unint64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 iokitMatchingDictionaryForClockIdentifier:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v3));

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ioClassName]);
  [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 iodProperties]);
  [v4 addEntriesFromDictionary:v6];

  [v4 removeObjectForKey:@"IOUserClientClass"];
  [v4 removeObjectForKey:@"IOGeneralInterest"];
  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  [v5 setObject:v6 forKeyedSubscript:@"ClockIdentifier"];

  id v7 = [(id)objc_opt_class(a1) clockNameForClockIdentifier:a3];
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setObject:v8 forKeyedSubscript:@"ClockName"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 serviceForClockIdentifier:a3]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 diagnosticInfoForService:v9]);
    [v5 addEntriesFromDictionary:v10];
  }

  return v5;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceForClockIdentifier:"));
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 ioClassName]);
  }

  else
  {
    int v8 = (objc_class *)objc_opt_class(a1);
    id v9 = NSStringFromClass(v8);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v9);
  }

  id v10 = (void *)v7;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ 0x%016llx",  v7,  a3));

  return v11;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (int)lockState
{
  return self->_lockState;
}

- (void)setLockState:(int)a3
{
  self->_lockState = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end