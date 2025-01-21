@interface BKHumanPresenceHIDEventProcessor
- (BKHumanPresenceHIDEventProcessor)init;
- (BKIOHIDServiceMatcher)presenceServiceMatcher;
- (BKIOHIDServiceMatcher)proximityServiceMatcher;
- (NSMutableDictionary)displayUUIDToSensorRecords;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_setPresence:(BOOL)a3 forDisplayUUID:(id)a4;
- (void)_setProximityInCentimeters:(double)a3 forDisplayUUID:(id)a4;
- (void)dealloc;
- (void)getStatus:(unint64_t *)a3 presence:(BOOL *)a4 proximityInCentimeters:(double *)a5 forDisplayUUID:(id)a6;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setDisplayUUIDToSensorRecords:(id)a3;
- (void)setPresenceServiceMatcher:(id)a3;
- (void)setProximityServiceMatcher:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BKHumanPresenceHIDEventProcessor

- (BKHumanPresenceHIDEventProcessor)init
{
  v13.receiver = self;
  [v13 super_class] = [BKHumanPresenceHIDEventProcessor class];
  BKHumanPresenceHIDEventProcessor *v2 = [[BKHumanPresenceHIDEventProcessor alloc] init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.BKHumanPresenceHIDEventProcessor");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    NSMutableDictionary *v5 = [[NSMutableDictionary alloc] init];
    queue_displayUUIDToSensorRecords = v2->_queue_displayUUIDToSensorRecords;
    v2->_queue_displayUUIDToSensorRecords = v5;

    BKHIDSystemInterface *v7 = [[BKHIDSystemInterface sharedInstance] autorelease];
    BKIOHIDServiceMatcher *v8 = [[BKIOHIDServiceMatcher alloc] initWithUsagePage:32 usage:17 builtIn:0 dataProvider:v7];
    presenceServiceMatcher = v2->_presenceServiceMatcher;
    v2->_presenceServiceMatcher = v8;

    [v2->_presenceServiceMatcher startObserving:v2 queue:v2->_queue];
    BKIOHIDServiceMatcher *v10 = [[BKIOHIDServiceMatcher alloc] initWithUsagePage:32 usage:18 builtIn:0 dataProvider:v7];
    proximityServiceMatcher = v2->_proximityServiceMatcher;
    v2->_proximityServiceMatcher = v10;

    [v2->_proximityServiceMatcher startObserving:v2 queue:v2->_queue];
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = [BKHumanPresenceHIDEventProcessor class];
  [v3 dealloc];
}

- (NSString)description
{
  BSDescriptionBuilder *v3 = [BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_queue_displayUUIDToSensorRecords withName:@"sensors"];
  v5 = (void *)[v3 build];

  return (NSString *)v5;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:v23 objects:v31 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v24;
    *(void *)&__int128 v8 = 138543618LL;
    __int128 v22 = v8;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v11);
        uint64_t v13 = BKLogCommon(v7);
        v14 = (os_log_s *)v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = [self class];
          *(_DWORD *)buf = v22;
          v28 = v16;
          __int16 v29 = 2114;
          v30 = v12;
          id v17 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: found %{public}@", buf, 0x16u);
        }

        v18 = [v12 displayUUID];
        v19 = sub_10002E518(v18);
        v20 = v19;

        v21 = [self->_queue_displayUUIDToSensorRecords objectForKey:v20];
        if (!v21)
        {
          BKHIDHumanPresenceSensorRecord *v21 = [[BKHIDHumanPresenceSensorRecord alloc] init];
          [self->_queue_displayUUIDToSensorRecords setObject:v21 forKey:v20];
        }

        [v21 addService:v12 serviceType:v22 serviceID:v23];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v7 = [v6 countByEnumeratingWithState:v23 objects:v31 count:16];
      id v9 = v7;
    }

    while (v7);
  }
}

- (void)serviceDidDisappear:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = BKLogCommon(v5);
  os_log_s *v7 = [v6 autorelease];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543618;
    id v17 = [self class];
    __int16 v18 = 2114;
    id v19 = v4;
    id v9 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@: removing %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v10 = (void *)[v4 displayUUID];
  v11 = sub_10002E518(v10);
  v12 = v11;

  uint64_t v13 = [self->_queue_displayUUIDToSensorRecords objectForKey:v12];
  [v13 removeService:v4];
  v14 = [v13 services];
  id v15 = [v14 count];

  if (!v15) {
    [self->_queue_displayUUIDToSensorRecords removeObjectForKey:v12];
  }
}

- (void)_setProximityInCentimeters:(double)a3 forDisplayUUID:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E734;
  block[3] = &unk_1000B6F40;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_setPresence:(BOOL)a3 forDisplayUUID:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E63C;
  block[3] = &unk_1000B6B18;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)getStatus:(unint64_t *)a3 presence:(BOOL *)a4 proximityInCentimeters:(double *)a5 forDisplayUUID:(id)a6
{
  id v10 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E56C;
  block[3] = &unk_1000B6540;
  block[4] = self;
  id v14 = v10;
  id v15 = a4;
  int v16 = a5;
  id v17 = a3;
  id v12 = v10;
  dispatch_sync(queue, block);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7 = a4;
  id v8 = *a3;
  int IntegerValue = IOHIDEventGetIntegerValue(v8, 1900544LL);
  if (!IntegerValue)
  {
    double FloatValue = IOHIDEventGetFloatValue(v8, 1900545LL);
    uint64_t v21 = BKLogCommon(v20);
    os_log_s *v22 = [v21 autorelease];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v28 = 138543618;
      [self class]
      *(_WORD *)&v28[12] = 2048;
      *(double *)&v28[14] = FloatValue;
      id v24 = *(id *)&v28[4];
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%{public}@: human proximity event %g",  v28,  0x16u);
    }

    __int128 v25 = (void *)[v7 displayUUID];
    __int128 v26 = sub_10002E518(v25);
    __int16 v18 = [v26 autorelease];

    [self _setProximityInCentimeters:FloatValue forDisplayUUID:v18];
    goto LABEL_9;
  }

  if (IntegerValue == 3)
  {
    double v10 = IOHIDEventGetFloatValue(v8, 1900545LL);
    uint64_t v12 = BKLogCommon(v11);
    uint64_t v13 = [v12];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v28 = 138543618;
      [self setEventProcessorOfClass:[v14 class]];
      *(_WORD *)&v28[12] = 2048;
      *(double *)&v28[14] = v10;
      id v15 = v28[4];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%{public}@: human presence event %g",  v28,  0x16u);
    }

    int v16 = (void *)[v7 displayUUID];
    id v17 = sub_10002E518(v16);
    __int16 v18 = [v17 autorelease];

    [self _setPresence:v10 > 0.0 forDisplayUUID:v18 anchorPoint:CGPointMake(*(_OWORD *)v28, *(void *)&v28[16])];
LABEL_9:
  }

  return 0LL;
}

- (NSMutableDictionary)displayUUIDToSensorRecords
{
  return self->_queue_displayUUIDToSensorRecords;
}

- (void)setDisplayUUIDToSensorRecords:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BKIOHIDServiceMatcher)presenceServiceMatcher
{
  return self->_presenceServiceMatcher;
}

- (void)setPresenceServiceMatcher:(id)a3
{
}

- (BKIOHIDServiceMatcher)proximityServiceMatcher
{
  return self->_proximityServiceMatcher;
}

- (void)setProximityServiceMatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end