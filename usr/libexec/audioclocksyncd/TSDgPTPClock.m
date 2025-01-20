@interface TSDgPTPClock
+ (id)availablegPTPClockIdentifiers;
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5;
- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)getSyncInfoWithSyncInfoValid:(BOOL *)a3 syncFlags:(char *)a4 timeSyncTime:(unint64_t *)a5 domainTimeHi:(unint64_t *)a6 domainTimeLo:(unint64_t *)a7 cumulativeScaledRate:(unint64_t *)a8 inverseCumulativeScaledRate:(unint64_t *)a9 grandmasterID:(unint64_t *)a10 localPortNumber:(unsigned __int16 *)a11 error:(id *)a12;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4;
- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (NSArray)gptpPath;
- (NSArray)ports;
- (TSDgPTPClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (id)_gptpPath;
- (id)clockName;
- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3;
- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)portWithPortNumber:(unsigned __int16)a3;
- (unint64_t)_grandmasterIdentity;
- (unint64_t)clockIdentity;
- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3;
- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3;
- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)grandmasterIdentity;
- (unint64_t)machAbsoluteFromgPTPTime:(id)a3;
- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3;
- (unsigned)clockAccuracy;
- (unsigned)clockClass;
- (unsigned)clockPriority1;
- (unsigned)clockPriority2;
- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4;
- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5;
- (void)_handleRefreshConnection;
- (void)_refreshGrandmasterIdentityOnNotificationQueue;
- (void)addImplClock:(id)a3;
- (void)dealloc;
- (void)removeImplClock:(id)a3;
- (void)setGptpPath:(id)a3;
- (void)setGrandmasterIdentity:(unint64_t)a3;
@end

@implementation TSDgPTPClock

+ (id)availablegPTPClockIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](&OBJC_CLASS___IOKService, "serviceMatching:", @"IOTimeSyncDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingServices:error:](&OBJC_CLASS___IOKService, "matchingServices:error:", v3, 0LL));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022360;
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
  v10[0] = @"IOTimeSyncDomain";
  v7 = @"ClockIdentifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  v10[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  return v5;
}

- (TSDgPTPClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = (NSPointerArray *)objc_claimAutoreleasedReturnValue( +[NSPointerArray weakObjectsPointerArray]( &OBJC_CLASS___NSPointerArray,  "weakObjectsPointerArray"));
  implClocks = self->_implClocks;
  self->_implClocks = v7;

  self->_implClocksLock._os_unfair_lock_opaque = 0;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TSDgPTPClock;
  v9 = -[TSDKernelClock initWithClockIdentifier:pid:](&v14, "initWithClockIdentifier:pid:", a3, v4);
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TSDgPTPClock _gptpPath](v9, "_gptpPath"));
    gptpPath = v10->_gptpPath;
    v10->_gptpPath = (NSArray *)v11;

    v10->_grandmasterIdentity = -[TSDgPTPClock _grandmasterIdentity](v10, "_grandmasterIdentity");
  }

  return v10;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  int v6 = 1;
  unint64_t v19 = -1LL;
  uint64_t v20 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:32 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    objc_super v14 = &unk_100030E57;
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v17 = 1024;
    int v18 = 136;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (a5 < 0xC)
  {
    uint64_t v19 = 0LL;
    BOOL v20 = 1;
    if (!a5) {
      return v20;
    }
    goto LABEL_13;
  }

  uint64_t v9 = 0LL;
  unsigned int v25 = 12 * ((a5 - 12) / 0xC);
  char v26 = 1;
  uint64_t v10 = a3;
  do
  {
    uint64_t v11 = 0LL;
    int v27 = 12;
    uint64_t v12 = v10;
    do
    {
      __int128 v13 = *(_OWORD *)v12;
      v12 += 4;
      *(void *)&__int128 v14 = v13;
      *((void *)&v14 + 1) = DWORD1(v13);
      __int128 v15 = v14;
      *(void *)&__int128 v14 = DWORD2(v13);
      *((void *)&v14 + 1) = HIDWORD(v13);
      v16 = &v40[v11];
      _OWORD *v16 = v15;
      v16[1] = v14;
      v11 += 4LL;
    }

    while (v11 != 12);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v18 = [v17 callMethodWithSelector:33 scalarInputs:v40 scalarInputCount:12 scalarOutputs:&a4[v9] scalarOutputCount:&v27 error:0];

    if ((v18 & 1) == 0)
    {
      char v26 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0LL;
        __int16 v32 = 2048;
        uint64_t v33 = 0LL;
        __int16 v34 = 2080;
        v35 = &unk_100030E57;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 164;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        char v26 = 0;
      }
    }

    uint64_t v5 = (v5 - 12);
    v9 += 12LL;
    v10 += 12;
  }

  while (v5 > 0xB);
  BOOL v20 = v26;
  uint64_t v19 = v25 + 12;
  if ((_DWORD)v5)
  {
LABEL_13:
    uint64_t v21 = 0LL;
    int v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }

    while (v5 != v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v23 = [v22 callMethodWithSelector:33 scalarInputs:v40 scalarInputCount:v5 scalarOutputs:&a4[v19] scalarOutputCount:&v27 error:0];

    if ((v23 & 1) == 0)
    {
      BOOL v20 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0LL;
        __int16 v32 = 2048;
        uint64_t v33 = 0LL;
        __int16 v34 = 2080;
        v35 = &unk_100030E57;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 184;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        return 0;
      }
    }
  }

  return v20;
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  uint64_t v24 = -1LL;
  uint64_t v25 = -1LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = 0LL;
  uint64_t v26 = -1LL;
  int v11 = 5;
  unint64_t v29 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v4 = [v3 callMethodWithSelector:37 scalarInputs:&v29 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = v28 & 1;
    uint64_t v6 = (v28 >> 1) & 1;
    unsigned int v7 = (v28 >> 2) & 1;
    id v8 = objc_alloc(&OBJC_CLASS___TSgPTPTime);
    LOBYTE(v10) = v7;
    return  -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:]( v8,  "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:",  v24,  v25,  v26,  (unsigned __int16)v27,  v5,  v6,  v10);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int128 v13 = "callResult == YES";
      __int16 v14 = 2048;
      uint64_t v15 = 0LL;
      __int16 v16 = 2048;
      uint64_t v17 = 0LL;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_100030E57;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v22 = 1024;
      int v23 = 205;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    return 0LL;
  }

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  unint64_t v22 = -1LL;
  int v9 = 1;
  id v4 = a3;
  v23[0] = [v4 seconds];
  unsigned int v5 = [v4 nanoseconds];

  v23[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v7 = [v6 callMethodWithSelector:36 scalarInputs:v23 scalarInputCount:2 scalarOutputs:&v22 scalarOutputCount:&v9 error:0];

  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2080;
    uint64_t v17 = &unk_100030E57;
    __int16 v18 = 2080;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v20 = 1024;
    int v21 = 234;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v7) {
    return v22;
  }
  else {
    return -1LL;
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7 = -1LL;
  uint64_t v25 = -1LL;
  uint64_t v26 = -1LL;
  unint64_t v27 = -1LL;
  uint64_t v28 = 0xFFFFLL;
  int v12 = 4;
  unint64_t v29 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:35 scalarInputs:&v29 scalarInputCount:1 scalarOutputs:&v25 scalarOutputCount:&v12 error:0];

  if ((v9 & 1) != 0)
  {
    uint64_t v7 = v25;
    unint64_t v10 = v26;
    if (a4) {
      *a4 = v27;
    }
    if (a5) {
      *a5 = v28;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v14 = "callResult == YES";
      __int16 v15 = 2048;
      uint64_t v16 = 0LL;
      __int16 v17 = 2048;
      uint64_t v18 = 0LL;
      __int16 v19 = 2080;
      __int16 v20 = &unk_100030E57;
      __int16 v21 = 2080;
      unint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v23 = 1024;
      int v24 = 254;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    unint64_t v10 = -1LL;
  }

  unint64_t v11 = v7;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7 = -1LL;
  uint64_t v24 = -1LL;
  unint64_t v25 = -1LL;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:34 scalarInputs:&v27 scalarInputCount:2 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v9 & 1) != 0)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2080;
    __int16 v19 = &unk_100030E57;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 285;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v7;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7 = -1LL;
  uint64_t v24 = -1LL;
  unint64_t v25 = -1LL;
  uint64_t v26 = 0LL;
  int v11 = 3;
  unint64_t v27 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:38 scalarInputs:&v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v9 & 1) != 0)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2080;
    __int16 v19 = &unk_100030E57;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 314;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v7;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7 = -1LL;
  uint64_t v24 = -1LL;
  unint64_t v25 = -1LL;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  unint64_t v27 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:39 scalarInputs:&v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v9 & 1) != 0)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2080;
    __int16 v19 = &unk_100030E57;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 343;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v7;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  int64x2_t v31 = vdupq_n_s64(1uLL);
  unint64_t v32 = -1LL;
  unint64_t v33 = -1LL;
  unint64_t v34 = -1LL;
  uint64_t v35 = 0xFFFFLL;
  int v18 = 6;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v16 = [v15 callMethodWithSelector:40 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v31 scalarOutputCount:&v18 error:0];

  if ((v16 & 1) != 0)
  {
    if (a3) {
      *a3 = v31.i64[0];
    }
    if (a4) {
      *a4 = v31.u64[1];
    }
    if (a5) {
      *a5 = v32;
    }
    if (a6) {
      *a6 = v33;
    }
    if (a7) {
      *a7 = v34;
    }
    if (a8) {
      *a8 = v35;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v20 = "result == YES";
    __int16 v21 = 2048;
    uint64_t v22 = 0LL;
    __int16 v23 = 2048;
    uint64_t v24 = 0LL;
    __int16 v25 = 2080;
    uint64_t v26 = &unk_100030E57;
    __int16 v27 = 2080;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v29 = 1024;
    int v30 = 369;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v16;
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  int v6 = 1;
  unint64_t v19 = -1LL;
  uint64_t v20 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v4 = [v3 callMethodWithSelector:43 scalarInputs:&v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0LL;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E57;
    __int16 v15 = 2080;
    unsigned __int8 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v17 = 1024;
    int v18 = 420;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v4) {
    return v19;
  }
  else {
    return -1LL;
  }
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (a5 < 0xC)
  {
    uint64_t v19 = 0LL;
    BOOL v20 = 1;
    if (!a5) {
      return v20;
    }
    goto LABEL_13;
  }

  uint64_t v9 = 0LL;
  unsigned int v25 = 12 * ((a5 - 12) / 0xC);
  char v26 = 1;
  uint64_t v10 = a3;
  do
  {
    uint64_t v11 = 0LL;
    int v27 = 12;
    uint64_t v12 = v10;
    do
    {
      __int128 v13 = *(_OWORD *)v12;
      v12 += 4;
      *(void *)&__int128 v14 = v13;
      *((void *)&v14 + 1) = DWORD1(v13);
      __int128 v15 = v14;
      *(void *)&__int128 v14 = DWORD2(v13);
      *((void *)&v14 + 1) = HIDWORD(v13);
      unsigned __int8 v16 = &v40[v11];
      _OWORD *v16 = v15;
      v16[1] = v14;
      v11 += 4LL;
    }

    while (v11 != 12);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v18 = [v17 callMethodWithSelector:44 scalarInputs:v40 scalarInputCount:12 scalarOutputs:&a4[v9] scalarOutputCount:&v27 error:0];

    if ((v18 & 1) == 0)
    {
      char v26 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0LL;
        __int16 v32 = 2048;
        uint64_t v33 = 0LL;
        __int16 v34 = 2080;
        uint64_t v35 = &unk_100030E57;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 448;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        char v26 = 0;
      }
    }

    uint64_t v5 = (v5 - 12);
    v9 += 12LL;
    v10 += 12;
  }

  while (v5 > 0xB);
  BOOL v20 = v26;
  uint64_t v19 = v25 + 12;
  if ((_DWORD)v5)
  {
LABEL_13:
    uint64_t v21 = 0LL;
    int v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }

    while (v5 != v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    unsigned __int8 v23 = [v22 callMethodWithSelector:44 scalarInputs:v40 scalarInputCount:v5 scalarOutputs:&a4[v19] scalarOutputCount:&v27 error:0];

    if ((v23 & 1) == 0)
    {
      BOOL v20 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0LL;
        __int16 v32 = 2048;
        uint64_t v33 = 0LL;
        __int16 v34 = 2080;
        uint64_t v35 = &unk_100030E57;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 468;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        return 0;
      }
    }
  }

  return v20;
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  uint64_t v24 = -1LL;
  uint64_t v25 = -1LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = 0LL;
  uint64_t v26 = -1LL;
  int v11 = 5;
  unint64_t v29 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v4 = [v3 callMethodWithSelector:48 scalarInputs:&v29 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = v28 & 1;
    uint64_t v6 = (v28 >> 1) & 1;
    unsigned int v7 = (v28 >> 2) & 1;
    id v8 = objc_alloc(&OBJC_CLASS___TSgPTPTime);
    LOBYTE(v10) = v7;
    return  -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:]( v8,  "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:",  v24,  v25,  v26,  (unsigned __int16)v27,  v5,  v6,  v10);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int128 v13 = "callResult == YES";
      __int16 v14 = 2048;
      uint64_t v15 = 0LL;
      __int16 v16 = 2048;
      uint64_t v17 = 0LL;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_100030E57;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v22 = 1024;
      int v23 = 489;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    return 0LL;
  }

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  unint64_t v22 = -1LL;
  int v9 = 1;
  id v4 = a3;
  v23[0] = [v4 seconds];
  unsigned int v5 = [v4 nanoseconds];

  v23[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned int v7 = [v6 callMethodWithSelector:47 scalarInputs:v23 scalarInputCount:2 scalarOutputs:&v22 scalarOutputCount:&v9 error:0];

  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2080;
    uint64_t v17 = &unk_100030E57;
    __int16 v18 = 2080;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v20 = 1024;
    int v21 = 518;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (v7) {
    return v22;
  }
  else {
    return -1LL;
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7 = -1LL;
  uint64_t v25 = -1LL;
  uint64_t v26 = -1LL;
  unint64_t v27 = -1LL;
  uint64_t v28 = 0xFFFFLL;
  int v12 = 4;
  unint64_t v29 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:46 scalarInputs:&v29 scalarInputCount:1 scalarOutputs:&v25 scalarOutputCount:&v12 error:0];

  if ((v9 & 1) != 0)
  {
    uint64_t v7 = v25;
    unint64_t v10 = v26;
    if (a4) {
      *a4 = v27;
    }
    if (a5) {
      *a5 = v28;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v14 = "callResult == YES";
      __int16 v15 = 2048;
      uint64_t v16 = 0LL;
      __int16 v17 = 2048;
      uint64_t v18 = 0LL;
      __int16 v19 = 2080;
      __int16 v20 = &unk_100030E57;
      __int16 v21 = 2080;
      unint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v23 = 1024;
      int v24 = 538;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    unint64_t v10 = -1LL;
  }

  unint64_t v11 = v7;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7 = -1LL;
  uint64_t v24 = -1LL;
  unint64_t v25 = -1LL;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:45 scalarInputs:&v27 scalarInputCount:2 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v9 & 1) != 0)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2080;
    __int16 v19 = &unk_100030E57;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 569;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v7;
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7 = -1LL;
  uint64_t v24 = -1LL;
  unint64_t v25 = -1LL;
  uint64_t v26 = 0LL;
  int v11 = 3;
  unint64_t v27 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:49 scalarInputs:&v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v9 & 1) != 0)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2080;
    __int16 v19 = &unk_100030E57;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 598;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v7;
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7 = -1LL;
  uint64_t v24 = -1LL;
  unint64_t v25 = -1LL;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  unint64_t v27 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v9 = [v8 callMethodWithSelector:50 scalarInputs:&v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if ((v9 & 1) != 0)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0LL;
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2080;
    __int16 v19 = &unk_100030E57;
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 627;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v7;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  int64x2_t v31 = vdupq_n_s64(1uLL);
  unint64_t v32 = -1LL;
  unint64_t v33 = -1LL;
  unint64_t v34 = -1LL;
  uint64_t v35 = 0xFFFFLL;
  int v18 = 6;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v16 = [v15 callMethodWithSelector:51 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v31 scalarOutputCount:&v18 error:0];

  if ((v16 & 1) != 0)
  {
    if (a3) {
      *a3 = v31.i64[0];
    }
    if (a4) {
      *a4 = v31.u64[1];
    }
    if (a5) {
      *a5 = v32;
    }
    if (a6) {
      *a6 = v33;
    }
    if (a7) {
      *a7 = v34;
    }
    if (a8) {
      *a8 = v35;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v20 = "result == YES";
    __int16 v21 = 2048;
    uint64_t v22 = 0LL;
    __int16 v23 = 2048;
    uint64_t v24 = 0LL;
    __int16 v25 = 2080;
    uint64_t v26 = &unk_100030E57;
    __int16 v27 = 2080;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v29 = 1024;
    int v30 = 653;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v16;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TSDgPTPClock;
  -[TSDKernelClock _handleInterestNotification:withArgument:]( &v24,  "_handleInterestNotification:withArgument:",  *(void *)&a3,  a4);
  if (a3 == -536870608)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    if (!v6) {
      uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue"));
    }
    unint64_t v7 = -[TSDgPTPClock _grandmasterIdentity](self, "_grandmasterIdentity");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002467C;
    block[3] = &unk_10003C6F0;
    block[4] = self;
    block[5] = v7;
    dispatch_async(v6, block);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000246C4;
    v20[3] = &unk_10003C610;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock _gptpPath](self, "_gptpPath"));
    id v21 = v8;
    uint64_t v22 = self;
    dispatch_async(v6, v20);
    p_implClocksLock = &self->_implClocksLock;
    os_unfair_lock_lock(&self->_implClocksLock);
    -[NSPointerArray compact](self->_implClocks, "compact");
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    unint64_t v10 = self->_implClocks;
    id v11 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v25,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (objc_msgSend( v15,  "conformsToProtocol:",  &OBJC_PROTOCOL___TSDgPTPClockImplProtocol,  (void)v16)) {
            [v15 updateGrandmasterIdentity:v7 andgPTPPath:v8];
          }
        }

        id v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v25,  16LL);
      }

      while (v12);
    }

    os_unfair_lock_unlock(p_implClocksLock);
  }

- (void)_refreshGrandmasterIdentityOnNotificationQueue
{
  v3 = -[TSDgPTPClock _grandmasterIdentity](self, "_grandmasterIdentity");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock _gptpPath](self, "_gptpPath"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
  if (!v5
    || (uint64_t v6 = (void *)v5,
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue")),
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue")),
        v8,
        v7,
        v6,
        v7 == v8))
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock gptpPath](self, "gptpPath"));
    unsigned __int8 v11 = [v4 isEqual:v10];

    if ((v11 & 1) == 0) {
      -[TSDgPTPClock setGptpPath:](self, "setGptpPath:", v4);
    }
  }

  else
  {
    unsigned __int8 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100024988;
    block[3] = &unk_10003C740;
    __int16 v25 = v3;
    block[4] = self;
    id v24 = v4;
    dispatch_sync(v9, block);
  }

  p_implClocksLock = &self->_implClocksLock;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v13 = self->_implClocks;
  id v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v26,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        __int128 v18 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if (objc_msgSend( v18,  "conformsToProtocol:",  &OBJC_PROTOCOL___TSDgPTPClockImplProtocol,  (void)v19)) {
          [v18 updateGrandmasterIdentity:v3 andgPTPPath:v4];
        }
      }

      id v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v26,  16LL);
    }

    while (v15);
  }

  os_unfair_lock_unlock(p_implClocksLock);
}

- (void)_handleRefreshConnection
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TSDgPTPClock;
  -[TSDKernelClock _handleRefreshConnection](&v3, "_handleRefreshConnection");
  -[TSDgPTPClock _refreshGrandmasterIdentityOnNotificationQueue](self, "_refreshGrandmasterIdentityOnNotificationQueue");
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (a3 == 2004) {
    -[TSDgPTPClock _refreshGrandmasterIdentityOnNotificationQueue]( self,  "_refreshGrandmasterIdentityOnNotificationQueue");
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSDgPTPClock;
  -[TSDKernelClock _handleNotification:withArg1:andArg2:](&v9, "_handleNotification:withArg1:andArg2:", v7, a4, a5);
}

- (unint64_t)_grandmasterIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"GrandmasterID"]);

  if (v3) {
    unint64_t v4 = (unint64_t)[v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (id)_gptpPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ASPath"]);

  if (v3) {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3));
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (unint64_t)clockIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ClockIdentity"]);

  if (v3) {
    unint64_t v4 = (unint64_t)[v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (unsigned)clockPriority1
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ClockPriority1"]);

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)clockPriority2
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ClockPriority2"]);

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)clockClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ClockClass"]);

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)clockAccuracy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ClockAccuracy"]);

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  uint64_t v27 = 0LL;
  int v14 = 1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v10 = v8;
  unsigned __int8 v11 = objc_msgSend( v9,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  18,  0,  0,  objc_msgSend(v10, "bytes"),  objc_msgSend(v10, "length"),  &v27,  &v14,  a5);

  if ((v11 & 1) != 0)
  {
    if (a4)
    {
      unsigned __int16 v12 = v27;
LABEL_4:
      *a4 = v12;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v16 = "result == YES";
      __int16 v17 = 2048;
      uint64_t v18 = 0LL;
      __int16 v19 = 2048;
      uint64_t v20 = 0LL;
      __int16 v21 = 2080;
      __int128 v22 = &unk_100030E57;
      __int16 v23 = 2080;
      id v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v25 = 1024;
      int v26 = 982;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a4)
    {
      unsigned __int16 v12 = -1;
      goto LABEL_4;
    }
  }

  return v11;
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v8 = v6;
  unsigned __int8 v9 = objc_msgSend( v7,  "callMethodWithSelector:structInput:structInputSize:error:",  19,  objc_msgSend(v8, "bytes"),  objc_msgSend(v8, "length"),  a4);

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136316418;
    unsigned __int16 v12 = "result == YES";
    __int16 v13 = 2048;
    uint64_t v14 = 0LL;
    __int16 v15 = 2048;
    uint64_t v16 = 0LL;
    __int16 v17 = 2080;
    uint64_t v18 = &unk_100030E57;
    __int16 v19 = 2080;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v21 = 1024;
    int v22 = 1009;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v11,  0x3Au);
  }

  return v9;
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  uint64_t v31 = 0LL;
  int v17 = 1;
  unsigned int v18 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v18,  4LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);

  [v10 appendData:v11];
  unsigned __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v13 = v10;
  unsigned __int8 v14 = objc_msgSend( v12,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  20,  0,  0,  objc_msgSend(v13, "bytes"),  objc_msgSend(v13, "length"),  &v31,  &v17,  a6);

  if ((v14 & 1) != 0)
  {
    if (a5)
    {
      unsigned __int16 v15 = v31;
LABEL_4:
      *a5 = v15;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = "result == YES";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v29 = 1024;
      int v30 = 1025;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a5)
    {
      unsigned __int16 v15 = -1;
      goto LABEL_4;
    }
  }

  return v14;
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  unsigned int v14 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", &v14, 4LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);

  [v8 appendData:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v11 = v8;
  unsigned __int8 v12 = objc_msgSend( v10,  "callMethodWithSelector:structInput:structInputSize:error:",  21,  objc_msgSend(v11, "bytes"),  objc_msgSend(v11, "length"),  a5);

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v25 = 1024;
    int v26 = 1053;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v12;
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  uint64_t v31 = 0LL;
  int v18 = 1;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 16LL));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);

  [v11 appendData:v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v14 = v11;
  unsigned __int8 v15 = objc_msgSend( v13,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  22,  0,  0,  objc_msgSend(v14, "bytes"),  objc_msgSend(v14, "length"),  &v31,  &v18,  a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      unsigned __int16 v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = "result == YES";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v29 = 1024;
      int v30 = 1070;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a5)
    {
      unsigned __int16 v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 16LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  [v9 appendData:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v12 = v9;
  unsigned __int8 v13 = objc_msgSend( v11,  "callMethodWithSelector:structInput:structInputSize:error:",  23,  objc_msgSend(v12, "bytes"),  objc_msgSend(v12, "length"),  a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316418;
    unsigned __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v25 = 1024;
    int v26 = 1098;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v15,  0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  uint64_t v31 = 0LL;
  int v18 = 1;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 6LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);

  [v11 appendData:v12];
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v14 = v11;
  unsigned __int8 v15 = objc_msgSend( v13,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  24,  0,  0,  objc_msgSend(v14, "bytes"),  objc_msgSend(v14, "length"),  &v31,  &v18,  a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      unsigned __int16 v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = "result == YES";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v29 = 1024;
      int v30 = 1114;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a5)
    {
      unsigned __int16 v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 6LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  [v9 appendData:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v12 = v9;
  unsigned __int8 v13 = objc_msgSend( v11,  "callMethodWithSelector:structInput:structInputSize:error:",  25,  objc_msgSend(v12, "bytes"),  objc_msgSend(v12, "length"),  a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316418;
    unsigned __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v25 = 1024;
    int v26 = 1142;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v15,  0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  uint64_t v31 = 0LL;
  int v17 = 1;
  unsigned int v18 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v18,  4LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);

  [v10 appendData:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v13 = v10;
  unsigned __int8 v14 = objc_msgSend( v12,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  26,  0,  0,  objc_msgSend(v13, "bytes"),  objc_msgSend(v13, "length"),  &v31,  &v17,  a6);

  if ((v14 & 1) != 0)
  {
    if (a5)
    {
      unsigned __int16 v15 = v31;
LABEL_4:
      *a5 = v15;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = "result == YES";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v29 = 1024;
      int v30 = 1158;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a5)
    {
      unsigned __int16 v15 = -1;
      goto LABEL_4;
    }
  }

  return v14;
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  unsigned int v14 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", &v14, 4LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);

  [v8 appendData:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v11 = v8;
  unsigned __int8 v12 = objc_msgSend( v10,  "callMethodWithSelector:structInput:structInputSize:error:",  27,  objc_msgSend(v11, "bytes"),  objc_msgSend(v11, "length"),  a5);

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    unsigned __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v25 = 1024;
    int v26 = 1186;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v12;
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  uint64_t v31 = 0LL;
  int v18 = 1;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 16LL));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);

  [v11 appendData:v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v14 = v11;
  unsigned __int8 v15 = objc_msgSend( v13,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  28,  0,  0,  objc_msgSend(v14, "bytes"),  objc_msgSend(v14, "length"),  &v31,  &v18,  a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      unsigned __int16 v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = "result == YES";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v29 = 1024;
      int v30 = 1202;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a5)
    {
      unsigned __int16 v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 16LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  [v9 appendData:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v12 = v9;
  unsigned __int8 v13 = objc_msgSend( v11,  "callMethodWithSelector:structInput:structInputSize:error:",  29,  objc_msgSend(v12, "bytes"),  objc_msgSend(v12, "length"),  a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316418;
    unsigned __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v25 = 1024;
    int v26 = 1230;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v15,  0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  uint64_t v31 = 0LL;
  int v18 = 1;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 6LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);

  [v11 appendData:v12];
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v14 = v11;
  unsigned __int8 v15 = objc_msgSend( v13,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  30,  0,  0,  objc_msgSend(v14, "bytes"),  objc_msgSend(v14, "length"),  &v31,  &v18,  a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      unsigned __int16 v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = "result == YES";
      __int16 v21 = 2048;
      uint64_t v22 = 0LL;
      __int16 v23 = 2048;
      uint64_t v24 = 0LL;
      __int16 v25 = 2080;
      int v26 = &unk_100030E57;
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v29 = 1024;
      int v30 = 1246;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
    }

    if (a5)
    {
      unsigned __int16 v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", a4, 6LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  [v9 appendData:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v12 = v9;
  unsigned __int8 v13 = objc_msgSend( v11,  "callMethodWithSelector:structInput:structInputSize:error:",  31,  objc_msgSend(v12, "bytes"),  objc_msgSend(v12, "length"),  a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316418;
    unsigned __int16 v16 = "result == YES";
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2048;
    uint64_t v20 = 0LL;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_100030E57;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v25 = 1024;
    int v26 = 1274;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v15,  0x3Au);
  }

  return v13;
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  v26[0] = a4;
  v26[1] = a5;
  int v13 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v10 = v8;
  unsigned __int8 v11 = objc_msgSend( v9,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  41,  v26,  2,  objc_msgSend(v10, "bytes"),  objc_msgSend(v10, "length"),  0,  &v13,  a6);

  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v15 = "result == YES";
    __int16 v16 = 2048;
    uint64_t v17 = 0LL;
    __int16 v18 = 2048;
    uint64_t v19 = 0LL;
    __int16 v20 = 2080;
    __int16 v21 = &unk_100030E57;
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v24 = 1024;
    int v25 = 1293;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v11;
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v25 = a4;
  int v12 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  id v9 = v7;
  unsigned __int8 v10 = objc_msgSend( v8,  "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutput s:scalarOutputCount:error:",  42,  &v25,  1,  objc_msgSend(v9, "bytes"),  objc_msgSend(v9, "length"),  0,  &v12,  a5);

  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v14 = "result == YES";
    __int16 v15 = 2048;
    uint64_t v16 = 0LL;
    __int16 v17 = 2048;
    uint64_t v18 = 0LL;
    __int16 v19 = 2080;
    __int16 v20 = &unk_100030E57;
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v23 = 1024;
    int v24 = 1311;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  return v10;
}

- (BOOL)getSyncInfoWithSyncInfoValid:(BOOL *)a3 syncFlags:(char *)a4 timeSyncTime:(unint64_t *)a5 domainTimeHi:(unint64_t *)a6 domainTimeLo:(unint64_t *)a7 cumulativeScaledRate:(unint64_t *)a8 inverseCumulativeScaledRate:(unint64_t *)a9 grandmasterID:(unint64_t *)a10 localPortNumber:(unsigned __int16 *)a11 error:(id *)a12
{
  unint64_t v34 = -1LL;
  unint64_t v35 = -1LL;
  unint64_t v36 = -1LL;
  int64x2_t v37 = vdupq_n_s64(1uLL);
  uint64_t v39 = 0LL;
  uint64_t v40 = 0LL;
  unint64_t v38 = -1LL;
  uint64_t v41 = 0xFFFFLL;
  int v21 = 9;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  unsigned __int8 v19 = [v18 callMethodWithSelector:52 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v34 scalarOutputCount:&v21 error:a12];

  if ((v19 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v23 = "result == YES";
    __int16 v24 = 2048;
    uint64_t v25 = 0LL;
    __int16 v26 = 2048;
    uint64_t v27 = 0LL;
    __int16 v28 = 2080;
    __int16 v29 = &unk_100030E57;
    __int16 v30 = 2080;
    uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v32 = 1024;
    int v33 = 1324;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
  }

  if (a5) {
    *a5 = v34;
  }
  if (a6) {
    *a6 = v35;
  }
  if (a7) {
    *a7 = v36;
  }
  if (a8) {
    *a8 = v37.i64[0];
  }
  if (a9) {
    *a9 = v37.u64[1];
  }
  if (a10) {
    *a10 = v38;
  }
  if (a3) {
    *a3 = v39 != 0;
  }
  if (a4) {
    *a4 = v40;
  }
  if (a11) {
    *a11 = v41;
  }
  return v19;
}

- (id)clockName
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gPTP Domain with Clock Identifier 0x%016llx",  -[TSDKernelClock clockIdentifier](self, "clockIdentifier"));
}

- (NSArray)ports
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 childIteratorInServicePlaneWithError:0]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100026C08;
  v8[3] = &unk_10003C768;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateWithBlock:v8];

  return (NSArray *)v6;
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  uint64_t v10 = 0LL;
  unsigned __int8 v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  int v13 = sub_100026D90;
  id v14 = sub_100026DA0;
  id v15 = 0LL;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 childIteratorInServicePlaneWithError:0]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100026DA8;
  v8[3] = &unk_10003CED0;
  unsigned __int16 v9 = a3;
  void v8[4] = &v10;
  [v5 enumerateWithBlock:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)getMetrics
{
  return -[TSDClockMetrics initWithClock:](objc_alloc(&OBJC_CLASS___TSDClockMetrics), "initWithClock:", self);
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock getMetrics](self, "getMetrics"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getDelta:v4]);

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TSDgPTPClock;
  -[TSDgPTPClock dealloc](&v2, "dealloc");
}

+ (id)diagnosticInfoForService:(id)a3
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___TSDgPTPClock;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v12, "diagnosticInfoForService:", v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 childIteratorInServicePlaneWithError:0]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100027014;
  v10[3] = &unk_10003C768;
  id v11 = v6;
  id v8 = v6;
  [v7 enumerateWithBlock:v10];
  [v5 setObject:v8 forKeyedSubscript:@"Ports"];

  return v5;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gPTP Domain with Clock Identifier 0x%016llx",  a3);
}

- (void)addImplClock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v5 = self->_implClocks;
  id v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      unsigned __int16 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8LL * (void)v9) == v4)
        {

          goto LABEL_11;
        }

        unsigned __int16 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_implClocks, "addPointer:", v4, (void)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);
}

- (void)removeImplClock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_implClocks;
  id v6 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      __int128 v10 = 0LL;
      __int128 v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8LL * (void)v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:]( self->_implClocks,  "removePointerAtIndex:",  &v10[(void)v8],  (void)v12);
          goto LABEL_11;
        }

        ++v10;
      }

      while (v7 != v10);
      id v7 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);
}

- (NSArray)gptpPath
{
  return self->_gptpPath;
}

- (void)setGptpPath:(id)a3
{
}

- (unint64_t)grandmasterIdentity
{
  return self->_grandmasterIdentity;
}

- (void)setGrandmasterIdentity:(unint64_t)a3
{
  self->_grandmasterIdentity = a3;
}

- (void).cxx_destruct
{
}

@end