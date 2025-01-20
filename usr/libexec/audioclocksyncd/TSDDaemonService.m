@interface TSDDaemonService
+ (id)daemonService;
+ (id)sharedDaemonService;
- (BOOL)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(const unint64_t *)a5 scalarInputCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)a10 error:(id *)a11;
- (BOOL)closeDaemonClient:(int)a3 daemonClientID:(unsigned int)a4 error:(id *)a5;
- (BOOL)deregisterAsyncCallback;
- (BOOL)deregisterProcess:(int)a3 error:(id *)a4;
- (BOOL)registerAsyncCallback;
- (TSDDaemonService)init;
- (int)registerProcess:(int)a3 withCallback:(id)a4 error:(id *)a5;
- (unsigned)openDaemonClient:(int)a3 withRegistryEntryID:(unint64_t)a4 clientType:(unsigned int)a5 error:(id *)a6;
- (void)dealloc;
- (void)finalizeNotifications;
- (void)handleNotification:(int)a3 clientID:(unsigned int)a4 result:(int)a5 withArgs:(unint64_t *)a6 ofCount:(unsigned int)a7;
@end

@implementation TSDDaemonService

+ (id)sharedDaemonService
{
  if (qword_100047C78 != -1) {
    dispatch_once(&qword_100047C78, &stru_10003C7F0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001329C;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047C70, block);
  return (id)qword_100047C68;
}

+ (id)daemonService
{
  v2 = objc_alloc_init(&OBJC_CLASS___TSDDaemonService);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(&OBJC_CLASS___TSDDaemonService);
      if (v3 < 2) {
        break;
      }
      --v3;
    }

    while (!v2);
  }

  return v2;
}

- (TSDDaemonService)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TSDDaemonService;
  v2 = -[TSDDaemonService init](&v19, "init");
  unsigned int v3 = v2;
  if (v2)
  {
    v2->_asyncCallbackRefcon = 0LL;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    processCallbacks = v3->_processCallbacks;
    v3->_processCallbacks = (NSMutableDictionary *)v4;

    v3->_processCallbacksLock._os_unfair_lock_opaque = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncDaemonService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 propertyForKey:@"IOTimeSyncDaemonClientEntryIDMatching"]);
      v3->_supportsRegistryEntryIDDaemonClientMatching = v8 != 0LL;

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (v3->_supportsRegistryEntryIDDaemonClientMatching) {
          v9 = "YES";
        }
        else {
          v9 = "NO";
        }
        *(_DWORD *)buf = 136315138;
        v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "_supportsRegistryEntryIDDaemonClientMatching %s\n",  buf,  0xCu);
      }

      v10 = -[IOKConnection initWithService:andType:]( objc_alloc(&OBJC_CLASS___IOKConnection),  "initWithService:andType:",  v7,  42LL);
      connection = v3->_connection;
      v3->_connection = v10;

      if (v3->_connection)
      {
        dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
        v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
        dispatch_queue_t v14 = dispatch_queue_create("com.apple.TimeSync.daemon.service", v13);
        notificationsQueue = v3->_notificationsQueue;
        v3->_notificationsQueue = (OS_dispatch_queue *)v14;

        if (v3->_notificationsQueue)
        {
          v16 = (IOKNotificationPort *)-[IOKNotificationPort initOnDispatchQueue:]( objc_alloc(&OBJC_CLASS___IOKNotificationPort),  "initOnDispatchQueue:",  v3->_notificationsQueue);
          notificationPort = v3->_notificationPort;
          v3->_notificationPort = v16;

          if (v3->_connection)
          {
            -[TSDDaemonService registerAsyncCallback](v3, "registerAsyncCallback");
LABEL_12:

            return v3;
          }

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136316418;
          v21 = "_connection != nil";
          __int16 v22 = 2048;
          uint64_t v23 = 0LL;
          __int16 v24 = 2048;
          uint64_t v25 = 0LL;
          __int16 v26 = 2080;
          v27 = &unk_100030E57;
          __int16 v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
          __int16 v30 = 1024;
          int v31 = 131;
        }

        else
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_25:

            goto LABEL_26;
          }

          *(_DWORD *)buf = 136316418;
          v21 = "_notificationsQueue != nil";
          __int16 v22 = 2048;
          uint64_t v23 = 0LL;
          __int16 v24 = 2048;
          uint64_t v25 = 0LL;
          __int16 v26 = 2080;
          v27 = &unk_100030E57;
          __int16 v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
          __int16 v30 = 1024;
          int v31 = 128;
        }

        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        goto LABEL_25;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "_connection != nil";
        __int16 v22 = 2048;
        uint64_t v23 = 0LL;
        __int16 v24 = 2048;
        uint64_t v25 = 0LL;
        __int16 v26 = 2080;
        v27 = &unk_100030E57;
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
        __int16 v30 = 1024;
        int v31 = 124;
        goto LABEL_18;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "service != nil";
      __int16 v22 = 2048;
      uint64_t v23 = 0LL;
      __int16 v24 = 2048;
      uint64_t v25 = 0LL;
      __int16 v26 = 2080;
      v27 = &unk_100030E57;
      __int16 v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      __int16 v30 = 1024;
      int v31 = 118;
LABEL_18:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    v13 = (dispatch_queue_attr_s *)v3;
LABEL_26:
    unsigned int v3 = 0LL;
    goto LABEL_12;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TSDDaemonService;
  -[TSDDaemonService dealloc](&v3, "dealloc");
}

- (void)finalizeNotifications
{
  notificationPort = self->_notificationPort;
  self->_notificationPort = 0LL;
}

- (int)registerProcess:(int)a3 withCallback:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v27[0] = 0LL;
  v27[1] = (int)v6;
  uint64_t v26 = 0LL;
  int v13 = 1;
  if ((-[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  0LL,  v27,  2LL,  &v26,  &v13,  a5) & 1) != 0)
  {
    if (v26) {
      int v9 = 2;
    }
    else {
      int v9 = 1;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    os_unfair_lock_lock(&self->_processCallbacksLock);
    id v11 = objc_retainBlock(v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_processCallbacks,  "setObject:forKeyedSubscript:",  v11,  v10);

    os_unfair_lock_unlock(&self->_processCallbacksLock);
  }

  else
  {
    int v9 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "methodResult == YES";
      __int16 v16 = 2048;
      uint64_t v17 = 0LL;
      __int16 v18 = 2048;
      uint64_t v19 = 0LL;
      __int16 v20 = 2080;
      v21 = &unk_100030E57;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      __int16 v24 = 1024;
      int v25 = 160;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
      int v9 = 0;
    }
  }

  return v9;
}

- (BOOL)deregisterProcess:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  p_processCallbacksLock = &self->_processCallbacksLock;
  os_unfair_lock_lock(&self->_processCallbacksLock);
  processCallbacks = self->_processCallbacks;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary removeObjectForKey:](processCallbacks, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(p_processCallbacksLock);
  int v12 = 0;
  v25[0] = 1LL;
  v25[1] = (int)v5;
  unsigned __int8 v10 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  0LL,  v25,  2LL,  0LL,  &v12,  a4);
  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    dispatch_queue_t v14 = "result == YES";
    __int16 v15 = 2048;
    uint64_t v16 = 0LL;
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2080;
    __int16 v20 = &unk_100030E57;
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
    __int16 v23 = 1024;
    int v24 = 190;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v10;
}

- (unsigned)openDaemonClient:(int)a3 withRegistryEntryID:(unint64_t)a4 clientType:(unsigned int)a5 error:(id *)a6
{
  v30[0] = 4LL;
  v30[1] = a3;
  unint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v29 = 0LL;
  int v16 = 1;
  if (!self->_supportsRegistryEntryIDDaemonClientMatching)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService entryIDMatching:](&OBJC_CLASS___IOKService, "entryIDMatching:", a4));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v8));

    if (!v9)
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      unsigned int result = 0;
      if (v15)
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = "service != nil";
        __int16 v19 = 2048;
        uint64_t v20 = 0LL;
        __int16 v21 = 2048;
        uint64_t v22 = 0LL;
        __int16 v23 = 2080;
        int v24 = &unk_100030E57;
        __int16 v25 = 2080;
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
        __int16 v27 = 1024;
        int v28 = 208;
        goto LABEL_15;
      }

      return result;
    }

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 propertyForKey:@"IOTimeSyncDaemonServiceUniqueID"]);
    if (!v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = "uniqueIOServiceIDProp != nil";
        __int16 v19 = 2048;
        uint64_t v20 = 0LL;
        __int16 v21 = 2048;
        uint64_t v22 = 0LL;
        __int16 v23 = 2080;
        int v24 = &unk_100030E57;
        __int16 v25 = 2080;
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
        __int16 v27 = 1024;
        int v28 = 211;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
      }

      return 0;
    }

    id v11 = v10;
    unint64_t v31 = [v10 unsignedIntValue];
  }

  if ((-[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:s calarOutputCount:structOutput:structOutputSize:error:",  0LL,  v30,  4LL,  0LL,  0LL,  &v29,  &v16,  0LL,  0LL,  a6) & 1) != 0)
  {
    if (v16 == 1) {
      return v29;
    }
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    unsigned int result = 0;
    if (v14)
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = "scalarOutInt64Count == 1";
      __int16 v19 = 2048;
      uint64_t v20 = 0LL;
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2080;
      int v24 = &unk_100030E57;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      __int16 v27 = 1024;
      int v28 = 218;
      goto LABEL_15;
    }
  }

  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    unsigned int result = 0;
    if (v13)
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = "methodResult == YES";
      __int16 v19 = 2048;
      uint64_t v20 = 0LL;
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2080;
      int v24 = &unk_100030E57;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      __int16 v27 = 1024;
      int v28 = 217;
LABEL_15:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
      return 0;
    }
  }

  return result;
}

- (BOOL)closeDaemonClient:(int)a3 daemonClientID:(unsigned int)a4 error:(id *)a5
{
  v20[0] = 5LL;
  v20[1] = a3;
  v20[2] = a4;
  int v7 = 0;
  unsigned __int8 v5 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  0LL,  v20,  3LL,  0LL,  &v7,  a5);
  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    BOOL v15 = &unk_100030E57;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
    __int16 v18 = 1024;
    int v19 = 234;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v5;
}

- (BOOL)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(const unint64_t *)a5 scalarInputCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)a10 error:(id *)a11
{
  if (a6 > 0xE) {
    return 0;
  }
  memset(v24, 0, sizeof(v24));
  v23[0] = a3;
  v23[1] = a4;
  if (a6) {
    memcpy(v24, a5, 8LL * a6);
  }
  unsigned __int8 v17 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:structOutput:structOutputSize:error:",  1LL,  v23,  a6 + 2,  a7,  a8,  a9,  a10,  0LL,  0LL,  a11);
  if ((v17 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v20 = a3;
    __int16 v21 = 1024;
    unsigned int v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemonService callMethodForDaemonClient failed clientID %u, clientMethodSelector %u\n",  buf,  0xEu);
  }

  return v17;
}

- (void)handleNotification:(int)a3 clientID:(unsigned int)a4 result:(int)a5 withArgs:(unint64_t *)a6 ofCount:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  p_processCallbacksLock = &self->_processCallbacksLock;
  os_unfair_lock_lock(&self->_processCallbacksLock);
  processCallbacks = self->_processCallbacks;
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11));
  __int16 v16 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( processCallbacks,  "objectForKey:",  v15));

  os_unfair_lock_unlock(p_processCallbacksLock);
  if (v16)
  {
    ((void (**)(void, uint64_t, uint64_t, unint64_t *, uint64_t))v16)[2](v16, v10, v9, a6, v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = -[NSMutableDictionary count](self->_processCallbacks, "count");
    v18[0] = 67109632;
    v18[1] = v11;
    __int16 v19 = 1024;
    int v20 = v10;
    __int16 v21 = 1024;
    unsigned int v22 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TSDDaemonService NOT calling callback processID %u client %d process count %u\n",  (uint8_t *)v18,  0x14u);
  }
}

- (BOOL)registerAsyncCallback
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  self->_unint64_t asyncCallbackRefcon = (unint64_t)[v3 allocateRefcon:self];

  unint64_t asyncCallbackRefcon = self->_asyncCallbackRefcon;
  notificationPort = self->_notificationPort;
  int v24 = sub_10001448C;
  unint64_t v25 = asyncCallbackRefcon;
  uint64_t v22 = 2LL;
  int v9 = 0;
  unsigned __int8 v6 = -[IOKConnection callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:sc alarOutputs:scalarOutputCount:error:",  0LL,  -[IOKNotificationPort machPort](notificationPort, "machPort"),  v23,  8LL,  &v22,  1LL,  0LL,  &v9,  0LL);
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v11 = "result == YES";
      __int16 v12 = 2048;
      uint64_t v13 = 0LL;
      __int16 v14 = 2048;
      uint64_t v15 = 0LL;
      __int16 v16 = 2080;
      unsigned int v17 = &unk_100030E57;
      __int16 v18 = 2080;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
      __int16 v20 = 1024;
      int v21 = 313;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
    [v8 releaseRefcon:self->_asyncCallbackRefcon];
  }

  return v6;
}

- (BOOL)deregisterAsyncCallback
{
  uint64_t v19 = 3LL;
  int v6 = 0;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSDCallbackRefconMap sharedTSDCallbackRefconMap]( &OBJC_CLASS___TSDCallbackRefconMap,  "sharedTSDCallbackRefconMap"));
  [v3 releaseRefcon:self->_asyncCallbackRefcon];

  unsigned __int8 v4 = -[IOKConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  0LL,  &v19,  1LL,  0LL,  &v6,  0LL);
  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDDaemonService.m";
    __int16 v17 = 1024;
    int v18 = 333;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end