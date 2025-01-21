@interface BKHIDTouchSensitiveButtonScanningController
- (BKHIDTouchSensitiveButtonScanningController)initWithContext:(id)a3;
- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3;
- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)processDidTerminate:(int)a3;
- (void)serviceDidDisappear:(id)a3;
- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5;
@end

@implementation BKHIDTouchSensitiveButtonScanningController

- (BKHIDTouchSensitiveButtonScanningController)initWithContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = [BKHIDTouchSensitiveButtonScanningController class];
  BKHIDTouchSensitiveButtonScanningController *v5 = [[BKHIDTouchSensitiveButtonScanningController alloc] init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = BSDispatchQueueCreateWithQualityOfService("com.apple.backboardd.migration", 0LL, 33LL, 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    BKIOHIDServiceMatcher *v9 = [[BKIOHIDServiceMatcher alloc] init];
    v10 = [v4 serviceMatcherDataProvider];
    BKIOHIDServiceMatcher *v11 = [[BKIOHIDServiceMatcher alloc] initWithUsagePage:65280LL usage:102LL builtIn:1LL dataProvider:v10];
    serviceMatcher = v6->_serviceMatcher;
    v6->_serviceMatcher = v11;

    [v6->_serviceMatcher startObserving:v6 queue:v6->_queue];
    BKIOHIDServicePersistentPropertyController *v13 = [BKIOHIDServicePersistentPropertyController touchSensitiveButtonServicePersistentPropertyController];
    [v13 registerHandler:v6];
  }

  return v6;
}

- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5
{
  BOOL v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = sub_10003F124();
  v11 = [os_log_s class];
  v12 = v11;
  if (a4 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromBKSHIDTouchSensitiveButtonIdentifier(1LL);
      v14 = v13;
      *(_DWORD *)buf = 67109634;
      int v23 = v7;
      __int16 v24 = 2114;
      v25 = v14;
      __int16 v26 = 1024;
      int v27 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setScanningActive:%{BOOL}u button:%{public}@ pid:%d",  buf,  0x18u);
    }

    if (v7 && !self->_lock_activeCameraButtonScanningPIDs)
    {
      NSMutableIndexSet *v15 = [[NSMutableIndexSet alloc] init];
      lock_activeCameraButtonScanningPIDs = self->_lock_activeCameraButtonScanningPIDs;
      self->_lock_activeCameraButtonScanningPIDs = v15;

      NSMutableDictionary *v17 = [[NSMutableDictionary alloc] init];
      lock_pidToProcessDeathWatcher = self->_lock_pidToProcessDeathWatcher;
      self->_lock_pidToProcessDeathWatcher = v17;
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000F3D8;
    v19[3] = &unk_1000B5D60;
    BOOL v21 = v7;
    v19[4] = self;
    int v20 = a5;
    sub_10000F01C((uint64_t)self, v19);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = a4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "setScanningActive: unsupported touch button identifier: %d",  buf,  8u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_services = self->_lock_services;
  if (!lock_services)
  {
    NSMutableSet *v7 = [[NSMutableSet alloc] init];
    v8 = self->_lock_services;
    self->_lock_services = v7;

    lock_services = self->_lock_services;
  }

  [lock_services addObjectsFromArray:v5];
  BKSHIDEventSenderDescriptor *v9 = [BKSHIDEventSenderDescriptor build];
  id v10 = [BKIOHIDServicePersistentPropertyController touchSensitiveButtonServicePersistentPropertyController];
  v11 = (void *)[v10 allPersistentPropertiesForServicesMatchingDescriptor:v9];

  if (![v11 count])
  {

    v11 = 0LL;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        [v17 addDisappearanceObserver:self queue:self->_queue];
        if (v11) {
          [v17 setProperties:v11];
        }
        [self->_lock_activeCameraButtonScanningPIDs count] != 0LL
      }

      id v14 = [v12 countByEnumeratingWithState:v18 objects:v22 count:16];
    }

    while (v14);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)serviceDidDisappear:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [self->_lock_services removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 primaryPage] == 65280 && [v3 primaryUsage] == 102;

  return v4;
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_10000F32C;
  v16 = &unk_1000B6BB0;
  id v8 = [NSSet setWithObject:@"HalfPressThresholdModifier"];
  id v17 = v8;
  __int128 v18 = &v19;
  [v6 enumerateKeysAndObjectsUsingBlock:&v13];
  if (*((_BYTE *)v20 + 24))
  {
    id v9 = sub_10003F280();
    os_log_s *v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "BKHIDTouchSensitiveButton disallowed persistent properties: %{public}@",  buf,  0xCu);
    }

    int64_t v11 = 1LL;
  }

  else
  {
    os_unfair_lock_lock(&self->_lock);
    [self->_lock_services makeObjectsPerformSelector:@selector(asyncSetProperties:) withObject:v6 withObject:v13 withObject:v14 withObject:v15 withObject:v16];
    os_unfair_lock_unlock(&self->_lock);
    int64_t v11 = 2LL;
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (void)processDidTerminate:(int)a3
{
  uint64_t v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToProcessDeathWatcher = self->_lock_pidToProcessDeathWatcher;
  id v7 = [NSNumber numberWithInt:v3];
  [lock_pidToProcessDeathWatcher removeObjectForKey:v7];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F008;
  v8[3] = &unk_1000B7CF0;
  v8[4] = self;
  int v9 = v3;
  sub_10000F01C((uint64_t)self, v8);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end