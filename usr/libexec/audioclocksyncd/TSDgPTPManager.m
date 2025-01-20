@interface TSDgPTPManager
+ (id)diagnosticInfo;
+ (id)gPTPManager;
+ (id)sharedgPTPManager;
+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhengPTPManagerIsAvailable:(id)a3;
+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3;
- (BOOL)addAVBDomainIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addDomain:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)logInterfaceStatisticsWithError:(id *)a3;
- (BOOL)removeAVBDomainWithIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3;
- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3;
- (BOOL)removeDomainWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (TSDgPTPClock)systemDomain;
- (TSDgPTPManager)init;
- (unint64_t)airPlayPTPInstanceClockIdentifier;
- (unint64_t)avbPTPInstance0ClockIdentifier;
- (unint64_t)avbPTPInstance1ClockIdentifier;
- (unint64_t)avbPTPInstance2ClockIdentifier;
- (unint64_t)avbPTPInstance3ClockIdentifier;
- (unint64_t)copresencePTPInstanceClockIdentifier;
- (unint64_t)systemDomainClockIdentifier;
- (void)dealloc;
@end

@implementation TSDgPTPManager

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TSDgPTPManager) == a1)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TSDKextNotifier);
    v3 = (void *)qword_100047C98;
    qword_100047C98 = (uint64_t)v2;

    uint64_t v4 = qword_100047C98;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncgPTPManager"));
    LOBYTE(v4) = [(id)v4 startNotificationsWithMatchingDictionary:v5];

    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316418;
      v7 = "startedNotifier";
      __int16 v8 = 2048;
      uint64_t v9 = 0LL;
      __int16 v10 = 2048;
      uint64_t v11 = 0LL;
      __int16 v12 = 2080;
      v13 = &unk_100030E57;
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v16 = 1024;
      int v17 = 54;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v6,  0x3Au);
    }
  }

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047C98;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001E3BC;
  v6[3] = &unk_10003CE10;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsAvailable:v6];
}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047C98;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001E444;
  v6[3] = &unk_10003CE10;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsUnavailable:v6];
}

+ (id)sharedgPTPManager
{
  if (qword_100047CB0 != -1) {
    dispatch_once(&qword_100047CB0, &stru_10003CE30);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E53C;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047CA8, block);
  return (id)qword_100047CA0;
}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001E6B8;
  v10[3] = &unk_10003C4B0;
  id v5 = dispatch_semaphore_create(0LL);
  uint64_t v11 = v5;
  [a1 notifyWhengPTPManagerIsAvailable:v10];
  dispatch_time_t v6 = dispatch_time(0LL, 1000000 * a3);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to find gPTP manager within the timeout period.\n",  v9,  2u);
    }

    id v7 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedgPTPManager]);
  }

  return v7;
}

+ (id)gPTPManager
{
  v2 = objc_alloc_init(&OBJC_CLASS___TSDgPTPManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(&OBJC_CLASS___TSDgPTPManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }

    while (!v2);
  }

  return v2;
}

- (TSDgPTPManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TSDgPTPManager;
  v2 = -[TSDgPTPManager init](&v14, "init");
  if (v2)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncgPTPManager"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v3));
    service = v2->_service;
    v2->_service = (IOKService *)v4;

    if (v2->_service)
    {
      dispatch_time_t v6 = -[IODConnection initWithService:andType:]( objc_alloc(&OBJC_CLASS___IODConnection),  "initWithService:andType:",  v2->_service,  42LL);
      connection = v2->_connection;
      v2->_connection = v6;

      if (v2->_connection)
      {
        __int16 v8 = (TSDgPTPManager *)objc_claimAutoreleasedReturnValue( -[IOKService iodPropertyForKey:]( v2->_service,  "iodPropertyForKey:",  @"SystemDomainIdentifier"));
        uint64_t v9 = v8;
        if (v8) {
          uint64_t v10 = (uint64_t)-[TSDgPTPManager unsignedLongLongValue](v8, "unsignedLongLongValue");
        }
        else {
          uint64_t v10 = -1LL;
        }
        v2->_systemDomainClockIdentifier = v10;
        dispatch_queue_t v11 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.systemDomain", 0LL);
        systemDomainQueue = v2->_systemDomainQueue;
        v2->_systemDomainQueue = (OS_dispatch_queue *)v11;

        goto LABEL_8;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v16 = "_connection != nil";
        __int16 v17 = 2048;
        uint64_t v18 = 0LL;
        __int16 v19 = 2048;
        uint64_t v20 = 0LL;
        __int16 v21 = 2080;
        v22 = &unk_100030E57;
        __int16 v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
        __int16 v25 = 1024;
        int v26 = 147;
        goto LABEL_14;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v16 = "_service != nil";
      __int16 v17 = 2048;
      uint64_t v18 = 0LL;
      __int16 v19 = 2048;
      uint64_t v20 = 0LL;
      __int16 v21 = 2080;
      v22 = &unk_100030E57;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v25 = 1024;
      int v26 = 144;
LABEL_14:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    uint64_t v9 = v2;
    v2 = 0LL;
LABEL_8:
  }

  return v2;
}

- (TSDgPTPClock)systemDomain
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10001EA40;
  uint64_t v10 = sub_10001EA50;
  id v11 = 0LL;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001EA58;
  v5[3] = &unk_10003CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)systemDomainQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSDgPTPClock *)v3;
}

- (BOOL)addDomain:(unint64_t *)a3 error:(id *)a4
{
  return -[TSDgPTPManager addPTPInstance:error:](self, "addPTPInstance:error:", a3, a4);
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  0LL,  0LL,  0LL,  &v20,  &v7,  a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_100030E57;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 196;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20;
  return v5;
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  6LL,  0LL,  0LL,  &v20,  &v7,  a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_100030E57;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 214;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20;
  return v5;
}

- (BOOL)removeDomainWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return -[TSDgPTPManager removePTPInstanceWithIdentifier:error:]( self,  "removePTPInstanceWithIdentifier:error:",  a3,  a4);
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  1LL,  &v19,  1LL,  0LL,  &v6,  a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v17 = 1024;
    int v18 = 237;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v4;
}

- (BOOL)addAVBDomainIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  return -[TSDgPTPManager addAVBPTPInstanceIndex:identifier:error:]( self,  "addAVBPTPInstanceIndex:identifier:error:",  a3,  a4,  a5);
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  if (!a4) {
    return 0;
  }
  uint64_t v22 = a3;
  int v8 = 1;
  BOOL v6 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  2LL,  &v22,  1LL,  &v21,  &v8,  a5);
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v10 = "result == YES";
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2080;
    __int16 v16 = &unk_100030E57;
    __int16 v17 = 2080;
    int v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v19 = 1024;
    int v20 = 258;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a4 = v21;
  return v6;
}

- (BOOL)removeAVBDomainWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  return -[TSDgPTPManager removeAVBPTPInstanceWithIndex:error:](self, "removeAVBPTPInstanceWithIndex:error:", a3, a4);
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  int v6 = 0;
  uint64_t v19 = a3;
  BOOL v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  3LL,  &v19,  1LL,  0LL,  &v6,  a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v17 = 1024;
    int v18 = 281;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v4;
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", @"AVB0ClockID"));
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", @"AVB1ClockID"));
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", @"AVB2ClockID"));
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", @"AVB3ClockID"));
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", @"AirPlayClockID"));
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  4LL,  0LL,  0LL,  &v20,  &v7,  a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    __int16 v15 = &unk_100030E57;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 361;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20;
  return v5;
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  5LL,  0LL,  0LL,  0LL,  &v5,  a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0LL;
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 376;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", @"CopresenceClockID"));
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  7LL,  0LL,  0LL,  &v20,  &v7,  a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    __int16 v15 = &unk_100030E57;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 404;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20;
  return v5;
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  8LL,  0LL,  0LL,  0LL,  &v5,  a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0LL;
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 419;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (BOOL)logInterfaceStatisticsWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  9LL,  0LL,  0LL,  0LL,  &v5,  a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0LL;
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 431;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (void)dealloc
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](&OBJC_CLASS___TSDClockManager, "sharedClockManager"));
  [v3 removegPTPServicesWithError:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TSDgPTPManager;
  -[TSDgPTPManager dealloc](&v4, "dealloc");
}

+ (id)diagnosticInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncgPTPManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v2));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v20 = "service != nil";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v29 = 1024;
      int v30 = 446;
LABEL_25:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

- (unint64_t)systemDomainClockIdentifier
{
  return self->_systemDomainClockIdentifier;
}

- (void).cxx_destruct
{
}

@end