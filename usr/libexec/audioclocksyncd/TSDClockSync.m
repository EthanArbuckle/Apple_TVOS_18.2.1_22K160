@interface TSDClockSync
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)deregisterAsyncCallback;
- (BOOL)registerAsyncCallback;
- (TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (id)connection;
- (id)service;
- (unint64_t)clockIdentifier;
- (unint64_t)releaseReference;
- (void)_handleNotification:(int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5;
- (void)addReference;
- (void)addUpdateClient:(id)a3;
- (void)removeUpdateClient:(id)a3;
@end

@implementation TSDClockSync

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncService";
  v7 = @"ClockIdentifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  return v5;
}

- (TSDClockSync)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TSDClockSync;
  v6 = -[TSDClockSync init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    v6->_referenceCount = 1LL;
    v6->_clockIdentifier = a3;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    updateClients = v7->_updateClients;
    v7->_updateClients = (NSPointerArray *)v8;

    v7->_updateClientsLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class(v7);
    v11 = NSStringFromClass(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    if ((_DWORD)v4) {
      v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification.%d",  v12,  a3,  v4);
    }
    else {
      v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TimeSync.TSDClockSync.%@.0x%016llx.notification",  v12,  a3,  v26);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    id v16 = v15;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    notificationsQueue = v7->_notificationsQueue;
    v7->_notificationsQueue = (OS_dispatch_queue *)v17;

    if (v7->_notificationsQueue)
    {
      v7->_serviceLock._os_unfair_lock_opaque = 0;
      id v19 = [(id)objc_opt_class(v7) iokitMatchingDictionaryForClockIdentifier:a3];
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v20));
      service = v7->_service;
      v7->_service = (IOKService *)v21;

      if (v7->_service)
      {
        v23 = -[IODConnection initWithService:andType:]( objc_alloc(&OBJC_CLASS___IODConnection),  "initWithService:andType:",  v7->_service,  24LL);
        connection = v7->_connection;
        v7->_connection = v23;

        if (v7->_connection)
        {
          v7->_asyncCallbackRefcon = 0LL;
          -[TSDClockSync registerAsyncCallback](v7, "registerAsyncCallback");
LABEL_9:

          return v7;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v29 = "_connection != nil";
          __int16 v30 = 2048;
          uint64_t v31 = 0LL;
          __int16 v32 = 2048;
          uint64_t v33 = 0LL;
          __int16 v34 = 2080;
          v35 = &unk_100030E57;
          __int16 v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
          __int16 v38 = 1024;
          int v39 = 77;
          goto LABEL_17;
        }

- (id)service
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  uint64_t v4 = self->_service;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (id)connection
{
  p_serviceLock = &self->_serviceLock;
  os_unfair_lock_lock(&self->_serviceLock);
  uint64_t v4 = self->_connection;
  os_unfair_lock_unlock(p_serviceLock);
  return v4;
}

- (void)_handleNotification:(int)a3 withArgs:(unint64_t *)a4 ofCount:(unsigned int)a5
{
  if (a3 == 3001)
  {
    if (a5 == 7)
    {
      unint64_t v34 = a4[1];
      unint64_t v36 = *a4;
      unint64_t v19 = a4[4];
      unint64_t v32 = a4[3];
      unint64_t v33 = a4[2];
      unint64_t v20 = a4[6];
      lock = &self->_updateClientsLock;
      unint64_t v31 = a4[5];
      os_unfair_lock_lock(&self->_updateClientsLock);
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      uint64_t v21 = self->_updateClients;
      id v22 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v37,  v45,  16LL);
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            if ([v26 conformsToProtocol:&OBJC_PROTOCOL___TSDClockSyncGeneralSyncClient])
            {
              LOWORD(v29) = v20;
              [v26 updateWithSyncInfoValid:(v20 & 0xFF000000) != 0 syncFlags:BYTE2(v20) timeSyncTime:v33 domainTimeHi:v32 domainTimeLo:v19 cumulativeScaledRate:v36 inverseCum ulativeScaledRate:v34 grandmasterID:v31 localPortNumber:v29];
            }
          }

          id v23 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v37,  v45,  16LL);
        }

        while (v23);
      }

      v18 = lock;
      goto LABEL_25;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)v48 = "numArgs == 7";
      *(_WORD *)&v48[8] = 2048;
      uint64_t v49 = 0LL;
      __int16 v50 = 2048;
      uint64_t v51 = 0LL;
      __int16 v52 = 2080;
      v53 = &unk_100030E57;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v56 = 1024;
      int v57 = 142;
      objc_super v27 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
      goto LABEL_34;
    }
  }

  else
  {
    if (a3 != 3000)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v48 = a3;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = a5;
      objc_super v27 = "TSDClockSync _handleNotification unhandled notification %u numArgs %u\n";
      uint32_t v28 = 14;
      goto LABEL_28;
    }

    if (a5 == 4)
    {
      unint64_t v8 = *a4;
      unint64_t v9 = a4[1];
      unint64_t v10 = a4[2];
      unint64_t v11 = a4[3];
      p_updateClientsLock = &self->_updateClientsLock;
      os_unfair_lock_lock(&self->_updateClientsLock);
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      uint64_t v12 = self->_updateClients;
      id v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v42;
        do
        {
          for (j = 0LL; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v12);
            }
            dispatch_queue_t v17 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)j);
          }

          id v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
        }

        while (v14);
      }

      v18 = p_updateClientsLock;
LABEL_25:
      os_unfair_lock_unlock(v18);
      return;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)v48 = "numArgs == 4";
      *(_WORD *)&v48[8] = 2048;
      uint64_t v49 = 0LL;
      __int16 v50 = 2048;
      uint64_t v51 = 0LL;
      __int16 v52 = 2080;
      v53 = &unk_100030E57;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v56 = 1024;
      int v57 = 123;
      objc_super v27 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
LABEL_34:
      uint32_t v28 = 58;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
    }
  }

- (BOOL)registerAsyncCallback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  self->_asyncCallbackRefcon = (unint64_t)[v3 allocateRefcon:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDClockSync connection](self, "connection"));
  unsigned __int8 v5 = [v4 registerAsyncNotificationsWithSelector:0 callBack:sub_100008868 refcon:self->_asyncCallbackRefcon callbackQueue:self->_notificationsQueue];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      unint64_t v9 = "result == YES";
      __int16 v10 = 2048;
      uint64_t v11 = 0LL;
      __int16 v12 = 2048;
      uint64_t v13 = 0LL;
      __int16 v14 = 2080;
      uint64_t v15 = &unk_100030E57;
      __int16 v16 = 2080;
      dispatch_queue_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockSync.m";
      __int16 v18 = 1024;
      int v19 = 206;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v8,  0x3Au);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }

  return v5;
}

- (BOOL)deregisterAsyncCallback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  [v3 releaseRefcon:self->_asyncCallbackRefcon];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDClockSync connection](self, "connection"));
  LOBYTE(v3) = [v4 deregisterAsyncNotificationsWithSelector:1];

  return (char)v3;
}

- (void)addUpdateClient:(id)a3
{
  p_updateClientsLock = &self->_updateClientsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_updateClientsLock);
  -[NSPointerArray addPointer:](self->_updateClients, "addPointer:", v5);

  -[NSPointerArray compact](self->_updateClients, "compact");
  os_unfair_lock_unlock(p_updateClientsLock);
}

- (void)removeUpdateClient:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_updateClientsLock);
  if (-[NSPointerArray count](self->_updateClients, "count"))
  {
    uint64_t v4 = 0LL;
    while (-[NSPointerArray pointerAtIndex:](self->_updateClients, "pointerAtIndex:", v4) != v5)
    {
    }

    -[NSPointerArray removePointerAtIndex:](self->_updateClients, "removePointerAtIndex:", v4);
  }

- (void)addReference
{
}

- (unint64_t)releaseReference
{
  unint64_t v2 = self->_referenceCount - 1;
  self->_referenceCount = v2;
  return v2;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
}

@end