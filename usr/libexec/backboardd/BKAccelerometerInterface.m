@interface BKAccelerometerInterface
+ (id)sharedInstance;
- (BKAccelerometerInterface)init;
- (NSString)description;
- (id)_lock_existingClientForSendRight:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_handleAccelerometerRequestForPort:(id)a3 auditToken:(id *)a4 updateBlock:(id)a5;
- (void)_lock_clearSystemAppOrientationClient;
- (void)_lock_systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5;
- (void)_updateSettings;
- (void)bksAccelerometerClientRequestedAccelerometerEvents:(id)a3 updateInterval:(double)a4 xThreshold:(float)a5 yThreshold:(float)a6 zThreshold:(float)a7 auditToken:(id *)a8;
- (void)bksAccelerometerClientRequestedOrientationEvents:(id)a3 enabled:(BOOL)a4 passiveEvents:(BOOL)a5 auditToken:(id *)a6;
- (void)clientDied:(id)a3;
- (void)dealloc;
- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6;
- (void)systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5;
@end

@implementation BKAccelerometerInterface

- (BKAccelerometerInterface)init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___BKAccelerometerInterface;
  v2 = -[BKAccelerometerInterface init](&v27, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    lock_accelerometerClients = v2->_lock_accelerometerClients;
    v2->_lock_accelerometerClients = v5;

    id v7 = sub_100065B98();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    lock_orientationManager = v2->_lock_orientationManager;
    v2->_lock_orientationManager = (BKOrientationManager *)v8;

    v10 = sub_100067104((id *)&v2->_lock_orientationManager->super.isa, v2);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    id lock_orientationManagerObservationAssertion = v2->_lock_orientationManagerObservationAssertion;
    v2->_id lock_orientationManagerObservationAssertion = (id)v11;

    uint64_t v13 = (uint64_t)v2->_lock_orientationManager;
    uint64_t v14 = sub_100066880(v13);
    v15 = v2->_lock_orientationManager;
    if (v15)
    {
      uint64_t v29 = 0LL;
      v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      char v32 = 0;
      queue = (dispatch_queue_s *)v15->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100066930;
      block[3] = &unk_1000B8080;
      block[4] = v15;
      block[5] = &v29;
      dispatch_sync(queue, block);
      BOOL v17 = *((_BYTE *)v30 + 24) != 0;
      _Block_object_dispose(&v29, 8);
    }

    else
    {
      BOOL v17 = 0LL;
    }

    -[BKAccelerometerInterface orientationManager:deviceOrientationMayHaveChanged:changeSource:isDeviceOrientationLocked:]( v2,  "orientationManager:deviceOrientationMayHaveChanged:changeSource:isDeviceOrientationLocked:",  v13,  v14,  0LL,  v17);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    localDefaults = v2->_localDefaults;
    v2->_localDefaults = (BKSLocalDefaults *)v18;

    v20 = objc_alloc(&OBJC_CLASS___SLGNotificationActivatedLogger);
    id v21 = objc_alloc(&OBJC_CLASS___SLGActivatableLogger);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](&OBJC_CLASS___SLGLog, "sharedInstance"));
    id v23 = [v21 initWithLogger:v22];
    v24 = -[SLGNotificationActivatedLogger initWithLogger:](v20, "initWithLogger:", v23);
    studyLog = v2->_studyLog;
    v2->_studyLog = v24;

    -[SLGNotificationActivatedLogger addBeginNotification:endNotification:]( v2->_studyLog,  "addBeginNotification:endNotification:",  @"SBStudyLogBeginCameraButtonLogging",  @"SBStudyLogEndCameraButtonLogging");
  }

  return v2;
}

- (void)dealloc
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"this object should not be deallocated"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138544642;
    v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = @"BKAccelerometerInterface.m";
    __int16 v19 = 1024;
    int v20 = 90;
    __int16 v21 = 2114;
    v22 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v11,  0x3Au);
  }

  _bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
}

- (void)bksAccelerometerClientRequestedAccelerometerEvents:(id)a3 updateInterval:(double)a4 xThreshold:(float)a5 yThreshold:(float)a6 zThreshold:(float)a7 auditToken:(id *)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004091C;
  v8[3] = &unk_1000B6D68;
  *(double *)&v8[4] = a4;
  float v9 = a5;
  float v10 = a6;
  float v11 = a7;
  -[BKAccelerometerInterface _handleAccelerometerRequestForPort:auditToken:updateBlock:]( self,  "_handleAccelerometerRequestForPort:auditToken:updateBlock:",  a3,  a8,  v8);
}

- (void)bksAccelerometerClientRequestedOrientationEvents:(id)a3 enabled:(BOOL)a4 passiveEvents:(BOOL)a5 auditToken:(id *)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000408D4;
  v6[3] = &unk_1000B6D88;
  BOOL v7 = a4;
  BOOL v8 = a5;
  -[BKAccelerometerInterface _handleAccelerometerRequestForPort:auditToken:updateBlock:]( self,  "_handleAccelerometerRequestForPort:auditToken:updateBlock:",  a3,  a6,  v6);
}

- (void)systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = BKLogOrientationDevice(-[NSLock lock](self->_lock, "lock"));
  float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "systemAppSetOrientationEventsClient:%{public}@ wantsOrientationEvents:%{BOOL}u",  (uint8_t *)&v11,  0x12u);
  }

  -[BKAccelerometerInterface _lock_systemAppSetOrientationEventsClient:wantsOrientationEvents:auditToken:]( self,  "_lock_systemAppSetOrientationEventsClient:wantsOrientationEvents:auditToken:",  v8,  v6,  a5);
  -[NSLock unlock](self->_lock, "unlock");
  -[BKAccelerometerInterface _updateSettings](self, "_updateSettings");
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  lock_orientationManager = self->_lock_orientationManager;
  if (lock_orientationManager)
  {
    uint64_t v13 = 0LL;
    BOOL v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    queue = (dispatch_queue_s *)lock_orientationManager->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100065C24;
    v12[3] = &unk_1000B8080;
    v12[4] = lock_orientationManager;
    v12[5] = &v13;
    dispatch_sync(queue, v12);
    BOOL v6 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  id v7 = [v3 appendBool:v6 withName:@"eventsEnabled"];
  id v8 = [v3 appendObject:self->_lock_accelerometerClients withName:@"clients"];
  id v9 =  [v3 appendObject:self->_lock_systemAppOrientationClient withName:@"systemAppOrientationClient"];
  float v10 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v10;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  BOOL v6 = *a3;
  uint64_t TimeStamp = IOHIDEventGetTimeStamp(*a3);
  double v8 = BSMonotonicReferencedTimeFromMachTime(TimeStamp);
  double FloatValue = IOHIDEventGetFloatValue(v6, 851968LL);
  double v10 = IOHIDEventGetFloatValue(v6, 851969LL);
  double v11 = IOHIDEventGetFloatValue(v6, 851970LL);
  int IntegerValue = IOHIDEventGetIntegerValue(v6, 851971LL);
  id v13 = sub_10003F450();
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    int v36 = IntegerValue;
    __int16 v37 = 2048;
    double v38 = FloatValue;
    __int16 v39 = 2048;
    double v40 = v10;
    __int16 v41 = 2048;
    double v42 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Acc (type %d): %f %f %f", buf, 0x26u);
  }

  -[NSLock lock](self->_lock, "lock");
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v15 = self->_lock_accelerometerClients;
  id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
  if (v16)
  {
    id v20 = v16;
    uint64_t v21 = *(void *)v31;
    do
    {
      v25 = 0LL;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v15);
        }
        float v22 = FloatValue;
        *(float *)&double v17 = v22;
        float v23 = v10;
        *(float *)&double v18 = v23;
        float v24 = v11;
        *(float *)&double v19 = v24;
        [*(id *)(*((void *)&v30 + 1) + 8 * (void)v25) handleAccelerometerEventWithTimestamp:v8 x:v17 y:v18 z:v19 samplingInterval:self->_lock_samplingInterval];
        v25 = (char *)v25 + 1;
      }

      while (v20 != v25);
      id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
    }

    while (v20);
  }

  -[NSLock unlock](self->_lock, "unlock");
  if ((-[BKSLocalDefaults disableStudyLogAccelerometerLogging]( self->_localDefaults,  "disableStudyLogAccelerometerLogging") & 1) == 0)
  {
    studyLog = self->_studyLog;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10004077C;
    v28[3] = &unk_1000B6DA8;
    *(double *)&v28[4] = FloatValue;
    *(double *)&v28[5] = v10;
    *(double *)&v28[6] = v11;
    int v29 = IntegerValue;
    -[SLGNotificationActivatedLogger logBlock:domain:]( studyLog,  "logBlock:domain:",  v28,  @"com.apple.backboard.hid.accelerometer");
  }

  return 1LL;
}

- (void)clientDied:(id)a3
{
  lock = self->_lock;
  v5 = (BKAccelerometerClient *)a3;
  -[NSLock lock](lock, "lock");
  -[BKHIDEventClient invalidate](v5, "invalidate");
  -[NSMutableSet removeObject:](self->_lock_accelerometerClients, "removeObject:", v5);
  lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;

  if (lock_systemAppOrientationClient == v5) {
    -[BKAccelerometerInterface _lock_clearSystemAppOrientationClient](self, "_lock_clearSystemAppOrientationClient");
  }
  -[NSLock unlock](self->_lock, "unlock");
  -[BKAccelerometerInterface _updateSettings](self, "_updateSettings");
}

- (void)_handleAccelerometerRequestForPort:(id)a3 auditToken:(id *)a4 updateBlock:(id)a5
{
  id v10 = a3;
  double v8 = (void (**)(id, BKAccelerometerClientBKSAccelerometer *))a5;
  -[NSLock lock](self->_lock, "lock");
  id v9 = (BKAccelerometerClientBKSAccelerometer *)objc_claimAutoreleasedReturnValue( -[BKAccelerometerInterface _lock_existingClientForSendRight:]( self,  "_lock_existingClientForSendRight:",  v10));
  if (!v9)
  {
    id v9 = -[BKHIDEventClient initWithPid:sendRight:]( objc_alloc(&OBJC_CLASS___BKAccelerometerClientBKSAccelerometer),  "initWithPid:sendRight:",  BSPIDForAuditToken(a4),  v10);
    -[BKHIDEventClient setDelegate:](v9, "setDelegate:", self);
    if (v9) {
      -[NSMutableSet addObject:](self->_lock_accelerometerClients, "addObject:", v9);
    }
  }

  if (v8) {
    v8[2](v8, v9);
  }
  -[NSLock unlock](self->_lock, "unlock");
  -[BKAccelerometerInterface _updateSettings](self, "_updateSettings");
}

- (void)_updateSettings
{
  self->_double lock_samplingInterval = 0.0;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v3 = self->_lock_accelerometerClients;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v32,  v42,  16LL);
  if (!v4)
  {
    char v6 = 0;
    float v9 = 0.0;
    double v8 = 0.0;
    goto LABEL_50;
  }

  id v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v33;
  double v8 = 0.0;
  float v9 = 0.0;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v3);
      }
      double v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
      objc_msgSend(v11, "accelerometerUpdateInterval", (void)v32);
      if (v12 > 0.0)
      {
        double lock_samplingInterval = self->_lock_samplingInterval;
        if (lock_samplingInterval <= 0.0 || v12 < lock_samplingInterval)
        {
          if (lock_samplingInterval <= 0.0) {
            double v8 = v12;
          }
          else {
            double v8 = self->_lock_samplingInterval;
          }
          self->_double lock_samplingInterval = v12;
        }

        else if (lock_samplingInterval == v8 || v12 < v8)
        {
          double v8 = v12;
        }
      }

      [v11 xThreshold];
      if (v16 > 0.0)
      {
        if (v16 >= v9) {
          float v17 = v9;
        }
        else {
          float v17 = v16;
        }
        if (v9 > 0.0) {
          float v9 = v17;
        }
        else {
          float v9 = v16;
        }
      }

      [v11 yThreshold];
      if (v18 >= v9) {
        float v19 = v9;
      }
      else {
        float v19 = v18;
      }
      if (v9 <= 0.0) {
        float v19 = v18;
      }
      if (v18 > 0.0) {
        float v20 = v19;
      }
      else {
        float v20 = v9;
      }
      [v11 zThreshold];
      if (v21 <= 0.0)
      {
        float v9 = v20;
        if ((v6 & 1) != 0) {
          goto LABEL_41;
        }
      }

      else
      {
        float v9 = v21;
        if (v20 > 0.0 && v21 >= v20) {
          float v9 = v20;
        }
        if ((v6 & 1) != 0)
        {
LABEL_41:
          char v6 = 1;
          continue;
        }
      }

      else {
        char v6 = 0;
      }
    }

    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v32,  v42,  16LL);
  }

  while (v5);
LABEL_50:

  double v22 = self->_lock_samplingInterval;
  if (v22 >= 0.0) {
    double v23 = self->_lock_samplingInterval;
  }
  else {
    double v23 = 0.0;
  }
  if (v8 >= 0.0) {
    double v24 = v8;
  }
  else {
    double v24 = 0.0;
  }
  if (v24 / v23 > 1.25 && v24 / v23 < 1.75) {
    double v25 = v23 * 0.5;
  }
  else {
    double v25 = v23;
  }
  if (v22 < 0.0 || v24 / v23 > 1.25 && v24 / v23 < 1.75) {
    self->_double lock_samplingInterval = v25;
  }
  -[NSLock unlock](self->_lock, "unlock", (void)v32);
  lock_orientationManager = self->_lock_orientationManager;
  if (lock_orientationManager)
  {
    queue = (dispatch_queue_s *)lock_orientationManager->_queue;
    block = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472LL;
    double v38 = sub_100065C14;
    __int16 v39 = &unk_1000B7ED8;
    double v40 = lock_orientationManager;
    double v41 = v25;
    dispatch_async(queue, &block);
    v28 = self->_lock_orientationManager;
    if (v28)
    {
      int v29 = (dispatch_queue_s *)v28->_queue;
      block = _NSConcreteStackBlock;
      uint64_t v37 = 3221225472LL;
      double v38 = sub_100065C04;
      __int16 v39 = &unk_1000B7CF0;
      double v40 = v28;
      *(float *)&double v41 = v9;
      dispatch_async(v29, &block);
      __int128 v30 = self->_lock_orientationManager;
      if (v30)
      {
        __int128 v31 = (dispatch_queue_s *)v30->_queue;
        block = _NSConcreteStackBlock;
        uint64_t v37 = 3221225472LL;
        double v38 = sub_100065C38;
        __int16 v39 = &unk_1000B7D18;
        double v40 = v30;
        LOBYTE(v41) = v6;
        dispatch_async(v31, &block);
      }
    }
  }

- (id)_lock_existingClientForSendRight:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1000406D8;
  float v16 = sub_1000406E8;
  id v17 = 0LL;
  lock_accelerometerClients = self->_lock_accelerometerClients;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000406F0;
  v9[3] = &unk_1000B6DD0;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  -[NSMutableSet enumerateObjectsUsingBlock:](lock_accelerometerClients, "enumerateObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_lock_clearSystemAppOrientationClient
{
  if (self->_lock_systemAppOrientationClient)
  {
    -[NSMutableSet removeObject:](self->_lock_accelerometerClients, "removeObject:");
    -[BKHIDEventClient invalidate](self->_lock_systemAppOrientationClient, "invalidate");
    lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;
    self->_lock_systemAppOrientationClient = 0LL;
  }

- (void)_lock_systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  uint64_t ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(v7, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
  id v11 = [v10 pidForBundleID:v7];

  if (v7 && (int)v11 >= 1 && v5)
  {
    p_lock_systemAppOrientationClient = (id *)&self->_lock_systemAppOrientationClient;
    if (-[BKHIDEventClient pid](self->_lock_systemAppOrientationClient, "pid") != (_DWORD)v11)
    {
      -[BKAccelerometerInterface _lock_clearSystemAppOrientationClient](self, "_lock_clearSystemAppOrientationClient");
      id v13 = -[BKHIDEventClient initWithPid:sendRight:]( objc_alloc(&OBJC_CLASS___BKAccelerometerClientUIApp),  "initWithPid:sendRight:",  v11,  0LL);
      -[BKHIDEventClient setDelegate:](v13, "setDelegate:", self);
      -[BKAccelerometerClient setWantsOrientationEvents:](v13, "setWantsOrientationEvents:", 1LL);
      -[NSMutableSet addObject:](self->_lock_accelerometerClients, "addObject:", v13);
      objc_storeStrong((id *)&self->_lock_systemAppOrientationClient, v13);
      uint64_t v20 = 0LL;
      BOOL v14 = sub_100066954((uint64_t)self->_lock_orientationManager, (uint64_t)&v20);
      uint64_t v15 = BKLogOrientationDevice(v14);
      float v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = *p_lock_systemAppOrientationClient;
        uint64_t v18 = BSDeviceOrientationDescription(v20);
        float v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138543874;
        id v22 = v17;
        __int16 v23 = 2114;
        double v24 = v19;
        __int16 v25 = 1024;
        BOOL v26 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "systemAppSetOrientationEventsClient:%{public}@ currentOrientation:%{public}@ orientationLocked:%{BOOL}u",  buf,  0x1Cu);
      }

      if (v20) {
        [*p_lock_systemAppOrientationClient handleOrientationEvent:v20 orientationLocked:v14];
      }
    }
  }

  else
  {
    -[BKAccelerometerInterface _lock_clearSystemAppOrientationClient](self, "_lock_clearSystemAppOrientationClient");
  }

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  BOOL v6 = a6;
  -[NSLock lock](self->_lock, "lock", a3, a4, a5);
  lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;
  if (lock_systemAppOrientationClient)
  {
    -[BKAccelerometerClient handleOrientationEvent:orientationLocked:]( lock_systemAppOrientationClient,  "handleOrientationEvent:orientationLocked:",  a4,  v6);
  }

  else
  {
    else {
      uint64_t v10 = (a4 + 100);
    }
    uint64_t v11 = mach_absolute_time();
    uint64_t DeviceOrientationEventWithUsage = IOHIDEventCreateDeviceOrientationEventWithUsage(0LL, v11, v10, 0LL);
    if (DeviceOrientationEventWithUsage)
    {
      id v13 = (const void *)DeviceOrientationEventWithUsage;
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDUnknownSender unknownSenderInfo](&OBJC_CLASS___BKHIDUnknownSender, "unknownSenderInfo"));
      [v14 postEvent:v13 fromSender:v15];

      CFRelease(v13);
    }
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC0E8 != -1) {
    dispatch_once(&qword_1000DC0E8, &stru_1000B6D48);
  }
  return (id)qword_1000DC0E0;
}

@end