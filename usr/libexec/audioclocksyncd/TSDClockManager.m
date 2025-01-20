@interface TSDClockManager
+ (id)clockManager;
+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3;
+ (id)defaultClockPersonalities;
+ (id)diagnosticInfo;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4;
+ (id)sharedClockManager;
+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhenClockManagerIsAvailable:(id)a3;
+ (void)notifyWhenClockManagerIsUnavailable:(id)a3;
- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5;
- (BOOL)addTSNCaptureServicesWithError:(id *)a3;
- (BOOL)addgPTPServicesWithError:(id *)a3;
- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4;
- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeTSNCaptureServicesWithError:(id *)a3;
- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removegPTPServicesWithError:(id *)a3;
- (BOOL)timeSyncTimeIsMachAbsoluteTime;
- (TSDClockManager)init;
- (TSDClockManager)initWithPid:(int)a3;
- (TSDKernelClock)translationClock;
- (id)availableClockIdentifiers;
- (id)classNameForClockService:(id)a3;
- (id)clockWithClockIdentifier:(unint64_t)a3;
- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7;
- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3;
- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3;
- (unint64_t)timeSyncTimeClockIdentifier;
- (unint64_t)translationClockIdentifier;
@end

@implementation TSDClockManager

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TSDClockManager) == a1)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TSDKextNotifier);
    v3 = (void *)qword_100047CB8;
    qword_100047CB8 = (uint64_t)v2;

    uint64_t v4 = qword_100047CB8;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncClockManager"));
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
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v16 = 1024;
      int v17 = 60;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v6,  0x3Au);
    }
  }

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047CB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100020008;
  v6[3] = &unk_10003CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsAvailable:v6];
}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047CB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000200A8;
  v6[3] = &unk_10003CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsUnavailable:v6];
}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ATSAC:%016llx", a3);
}

+ (id)sharedClockManager
{
  if (qword_100047CD0 != -1) {
    dispatch_once(&qword_100047CD0, &stru_10003CEA8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000201A4;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047CC8, block);
  return (id)qword_100047CC0;
}

+ (id)clockManager
{
  v2 = objc_alloc_init(&OBJC_CLASS___TSDClockManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(&OBJC_CLASS___TSDClockManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }

    while (!v2);
  }

  return v2;
}

+ (id)defaultClockPersonalities
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v20[0] = @"IOClassName";
  v20[1] = @"ProbeScore";
  v21[0] = @"IOTimeSyncService";
  v21[1] = &off_10003F228;
  v20[2] = @"ClassName";
  unsigned int v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSDKernelClock);
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21[2] = v5;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
  -[NSMutableArray addObject:](v2, "addObject:", v6);

  v18[0] = @"IOClassName";
  v18[1] = @"ProbeScore";
  v19[0] = @"IOTimeSyncDomain";
  v19[1] = &off_10003F240;
  v18[2] = @"ClassName";
  id v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSDgPTPClock);
  __int16 v8 = NSStringFromClass(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19[2] = v9;
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  -[NSMutableArray addObject:](v2, "addObject:", v10);

  v16[0] = @"IOClassName";
  v16[1] = @"ProbeScore";
  v17[0] = @"IOTimeSyncUserFilteredService";
  v17[1] = &off_10003F240;
  v16[2] = @"ClassName";
  uint64_t v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSDUserFilteredClock);
  __int16 v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[2] = v13;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  -[NSMutableArray addObject:](v2, "addObject:", v14);

  return v2;
}

- (TSDClockManager)init
{
  return -[TSDClockManager initWithPid:](self, "initWithPid:", 0LL);
}

- (TSDClockManager)initWithPid:(int)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TSDClockManager;
  uint64_t v4 = -[TSDClockManager init](&v15, "init");
  id v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    mach_timebase_info(&v4->_timebaseInfo);
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncClockManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v6));

    if (v7)
    {
      __int16 v8 = -[IODConnection initWithService:andType:]( objc_alloc(&OBJC_CLASS___IODConnection),  "initWithService:andType:",  v7,  42LL);
      connection = v5->_connection;
      v5->_connection = v8;

      if (v5->_connection)
      {
        -[TSDClockManager getTimeSyncTimeClockID:error:]( v5,  "getTimeSyncTimeClockID:error:",  &v5->_timeSyncTimeClockIdentifier,  0LL);
        v5->_translationClockIdentifier = v5->_timeSyncTimeClockIdentifier + 1;
        -[TSDClockManager getTimeSyncTimeIsMachAbsolute:error:]( v5,  "getTimeSyncTimeIsMachAbsolute:error:",  &v5->_timeSyncTimeIsMachAbsoluteTime,  0LL);
        __int16 v10 = -[TSDKernelClock initWithClockIdentifier:]( objc_alloc(&OBJC_CLASS___TSDKernelClock),  "initWithClockIdentifier:",  v5->_translationClockIdentifier);
        translationClock = v5->_translationClock;
        v5->_translationClock = v10;

        __int16 v12 = (NSMutableArray *)[(id)objc_opt_class(v5) defaultClockPersonalities];
        clockPersonalities = v5->_clockPersonalities;
        v5->_clockPersonalities = v12;
LABEL_5:

        return v5;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        int v17 = "_connection != nil";
        __int16 v18 = 2048;
        uint64_t v19 = 0LL;
        __int16 v20 = 2048;
        uint64_t v21 = 0LL;
        __int16 v22 = 2080;
        v23 = &unk_100030E57;
        __int16 v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
        __int16 v26 = 1024;
        int v27 = 159;
        goto LABEL_11;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "service != nil";
      __int16 v18 = 2048;
      uint64_t v19 = 0LL;
      __int16 v20 = 2048;
      uint64_t v21 = 0LL;
      __int16 v22 = 2080;
      v23 = &unk_100030E57;
      __int16 v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v26 = 1024;
      int v27 = 156;
LABEL_11:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    clockPersonalities = v5;
    id v5 = 0LL;
    goto LABEL_5;
  }

  return v5;
}

- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  unint64_t v20 = 0LL;
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
    objc_super v15 = &unk_100030E57;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 194;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20;
  return v5;
}

- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  uint64_t v20 = 0LL;
  BOOL v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  11LL,  0LL,  0LL,  &v20,  &v7,  a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    objc_super v15 = &unk_100030E57;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 212;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20 != 0;
  return v5;
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  1LL,  0LL,  0LL,  &v20,  &v7,  a4);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    objc_super v15 = &unk_100030E57;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 230;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a3 = v20;
  return v5;
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  2LL,  &v19,  1LL,  0LL,  &v6,  a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 248;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v4;
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  unint64_t v9 = a3;
  if (!a3) {
    return 0;
  }
  int v8 = 1;
  BOOL v6 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  3LL,  &v9,  1LL,  &v22,  &v8,  a5);
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v11 = "result == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2080;
    __int16 v17 = &unk_100030E57;
    __int16 v18 = 2080;
    unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 263;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  *a4 = v22;
  return v6;
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  4LL,  &v19,  1LL,  0LL,  &v6,  a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 281;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v4;
}

- (BOOL)addgPTPServicesWithError:(id *)a3
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
    __int16 v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 293;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (BOOL)removegPTPServicesWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  6LL,  0LL,  0LL,  0LL,  &v5,  a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0LL;
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 305;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
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
    __int16 v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 317;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  10LL,  0LL,  0LL,  0LL,  &v5,  a3);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0LL;
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E57;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 329;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v3;
}

- (id)availableClockIdentifiers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v6 = 0LL;
  if (-[TSDClockManager getTimeSyncTimeClockID:error:](self, "getTimeSyncTimeClockID:error:", &v6, 0LL))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSDKernelClock availableKernelClockIdentifiers]( &OBJC_CLASS___TSDKernelClock,  "availableKernelClockIdentifiers"));
    [v3 addObjectsFromArray:v4];
  }

  return v3;
}

- (id)classNameForClockService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    obj = self->_clockPersonalities;
    int v5 = 0LL;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      signed int v8 = -1;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          __int16 v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"IOClassName"]);
          unsigned int v12 = [v4 conformsToIOClassName:v11];

          if (v12)
          {
            if (v5)
            {
              __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ProbeScore"]);
              signed int v14 = [v13 intValue];

              if (v14 > v8)
              {
                uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ClassName"]);

                int v5 = (void *)v15;
                signed int v8 = v14;
              }
            }

            else
            {
              __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ProbeScore"]);
              signed int v8 = [v16 intValue];

              int v5 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ClassName"]);
            }
          }
        }

        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "service != nil";
      __int16 v26 = 2048;
      uint64_t v27 = 0LL;
      __int16 v28 = 2048;
      uint64_t v29 = 0LL;
      __int16 v30 = 2080;
      v31 = &unk_100030E57;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v34 = 1024;
      int v35 = 358;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    int v5 = 0LL;
  }

  return v5;
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  if (-[TSDClockManager timeSyncTimeClockIdentifier](self, "timeSyncTimeClockIdentifier") == a3) {
    return 0LL;
  }
  if (-[TSDClockManager translationClockIdentifier](self, "translationClockIdentifier") == a3) {
    return (id)objc_claimAutoreleasedReturnValue(-[TSDClockManager translationClock](self, "translationClock"));
  }
  int v7 = 1;
  *(void *)&__int128 v5 = 67109120LL;
  __int128 v15 = v5;
  while (1)
  {
    signed int v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:]( &OBJC_CLASS___TSDKernelClock,  "iokitMatchingDictionaryForClockIdentifier:",  a3,  v15));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v8));

    if (v9) {
      break;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v15;
      LODWORD(v17) = v7;
      unsigned int v12 = "TSDClockManager clockWithClockIdentifier unable to find service retry = %d\n";
      uint32_t v13 = 8;
      goto LABEL_11;
    }

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  int v9 = 1;
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  unsigned int v7 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  7LL,  v23,  4LL,  &v22,  &v9,  a7);
  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2080;
    unint64_t v17 = &unk_100030E57;
    __int16 v18 = 2080;
    __int128 v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 450;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v7) {
    return v22;
  }
  else {
    return -1LL;
  }
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:]( self->_connection,  "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:",  8LL,  &v19,  1LL,  0LL,  &v6,  a4);
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    signed int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 469;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v4;
}

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer = self->_timebaseInfo.numer;
  if ((_DWORD)numer != self->_timebaseInfo.denom)
  {
    *(void *)&__int128 v7 = sub_1000277D4(a3, numer);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0LL;
    return sub_100027AD8(&v7, v8);
  }

  return a3;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != (_DWORD)denom)
  {
    *(void *)&__int128 v7 = sub_1000277D4(a3, denom);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0LL;
    return sub_100027AD8(&v7, v8);
  }

  return a3;
}

+ (id)diagnosticInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncClockManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v2));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      __int16 v11 = "service != nil";
      __int16 v12 = 2048;
      uint64_t v13 = 0LL;
      __int16 v14 = 2048;
      uint64_t v15 = 0LL;
      __int16 v16 = 2080;
      __int16 v17 = &unk_100030E57;
      __int16 v18 = 2080;
      unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v20 = 1024;
      int v21 = 521;
LABEL_9:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v10,  0x3Au);
    }

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:]( &OBJC_CLASS___TSDKernelClock,  "iokitMatchingDictionaryForClockIdentifier:",  a3));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v6));

  if (v7)
  {
    signed int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedClockManager]);
    __int16 v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 classNameForClockService:v7]);

    if (v9)
    {
      id v10 = -[objc_class diagnosticInfoForService:](NSClassFromString(v9), "diagnosticInfoForService:", v7);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }

    __int16 v11 = 0LL;
    if (a4)
    {
LABEL_6:
      __int16 v9 = v9;
      *a4 = v9;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316418;
      uint64_t v15 = "service != nil";
      __int16 v16 = 2048;
      uint64_t v17 = 0LL;
      __int16 v18 = 2048;
      uint64_t v19 = 0LL;
      __int16 v20 = 2080;
      int v21 = &unk_100030E57;
      __int16 v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v24 = 1024;
      int v25 = 542;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v14,  0x3Au);
    }

    __int16 v9 = 0LL;
    __int16 v11 = 0LL;
  }

+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:]( &OBJC_CLASS___TSDKernelClock,  "iokitMatchingDictionaryForClockIdentifier:",  a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v4));

  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedClockManager]);
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 classNameForClockService:v5]);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      id v10 = "service != nil";
      __int16 v11 = 2048;
      uint64_t v12 = 0LL;
      __int16 v13 = 2048;
      uint64_t v14 = 0LL;
      __int16 v15 = 2080;
      __int16 v16 = &unk_100030E57;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v19 = 1024;
      int v20 = 565;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v9,  0x3Au);
    }

    __int128 v7 = 0LL;
  }

  return v7;
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return self->_timeSyncTimeClockIdentifier;
}

- (unint64_t)translationClockIdentifier
{
  return self->_translationClockIdentifier;
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return self->_timeSyncTimeIsMachAbsoluteTime;
}

- (TSDKernelClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
}

@end