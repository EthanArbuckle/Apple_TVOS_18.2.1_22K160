@interface _XBMemoryMonitor
- (_XBMemoryMonitor)init;
- (id)_getProcessMemoryUsed;
- (void)_publishMemoryReportForPressureType:(id)a3;
- (void)_setupProcessMemoryPressureMonitor;
- (void)recordMemoryForBundleID:(id)a3;
@end

@implementation _XBMemoryMonitor

- (_XBMemoryMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____XBMemoryMonitor;
  v2 = -[_XBMemoryMonitor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 10LL);
    accessLock_memoryRecords = v3->_accessLock_memoryRecords;
    v3->_accessLock_memoryRecords = v4;

    -[_XBMemoryMonitor _setupProcessMemoryPressureMonitor](v3, "_setupProcessMemoryPressureMonitor");
  }

  return v3;
}

- (void)recordMemoryForBundleID:(id)a3
{
  v5 = (__CFString *)a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  uint64_t v7 = (uint64_t)-[NSMutableArray count](self->_accessLock_memoryRecords, "count");
  if (v7 >= 11)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2 object:self file:@"XBLaunchImageProviderServer.m" lineNumber:365 description:@"memory record count should not be greater than the max allowed size"];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_XBMemoryMonitor _getProcessMemoryUsed](self, "_getProcessMemoryUsed"));
  if (v8)
  {
    if (v7 == 10) {
      -[NSMutableArray removeObjectAtIndex:](self->_accessLock_memoryRecords, "removeObjectAtIndex:", 0LL);
    }
    if (!v5) {
      v5 = @"<nil>";
    }
    v24[0] = @"bundleID";
    v24[1] = @"memory";
    v25[0] = v5;
    v25[1] = v8;
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
    -[NSMutableArray addObject:](self->_accessLock_memoryRecords, "addObject:", v9);
    id v10 = sub_1000026E8();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v20 = 138543618;
      v21 = v8;
      __int16 v22 = 2114;
      v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Recorded process memory: %{public}@ Bytes while processing bundleID: %{public}@",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    id v12 = sub_1000026E8();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100007198((uint64_t)v5, v9, v13, v14, v15, v16, v17, v18);
    }
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_setupProcessMemoryPressureMonitor
{
  self->_memoryPressureStatus = 1;
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_memorypressure,  0LL,  0x31uLL,  &_dispatch_main_q);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  v5 = self->_memoryPressureSource;
  if (v5)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100006B60;
    handler[3] = &unk_10000C730;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
  }

- (void)_publishMemoryReportForPressureType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SDRDiagnosticReporter);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 signatureWithDomain:@"SplashBoard" type:@"MemoryPressure" subType:v4 detectedProcess:@"splashboardd" triggerThresholdValues:0]);
  uint64_t v15 = kSymptomDiagnosticActionGetNetworkInfo;
  uint64_t v16 = &__kCFBooleanFalse;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  id v9 = -[NSMutableArray copy](self->_accessLock_memoryRecords, "copy");
  os_unfair_lock_unlock(p_accessLock);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006D68;
  v12[3] = &unk_10000C7D0;
  id v13 = v4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v4;
  [v5 snapshotWithSignature:v6 duration:v10 events:0 payload:v7 actions:v12 reply:0.0];
}

- (id)_getProcessMemoryUsed
{
  mach_msg_type_number_t task_info_outCnt = 93;
  if (task_info(mach_task_self_, 0x16u, task_info_out, &task_info_outCnt)) {
    return 0LL;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v5));
  }
}

- (void).cxx_destruct
{
}

@end