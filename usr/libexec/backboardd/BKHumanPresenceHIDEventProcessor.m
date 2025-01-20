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
  v13.super_class = (Class)&OBJC_CLASS___BKHumanPresenceHIDEventProcessor;
  v2 = -[BKHumanPresenceHIDEventProcessor init](&v13, "init");
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.BKHumanPresenceHIDEventProcessor");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queue_displayUUIDToSensorRecords = v2->_queue_displayUUIDToSensorRecords;
    v2->_queue_displayUUIDToSensorRecords = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
    v8 = -[BKIOHIDServiceMatcher initWithUsagePage:usage:builtIn:dataProvider:]( objc_alloc(&OBJC_CLASS___BKIOHIDServiceMatcher),  "initWithUsagePage:usage:builtIn:dataProvider:",  32LL,  17LL,  0LL,  v7);
    presenceServiceMatcher = v2->_presenceServiceMatcher;
    v2->_presenceServiceMatcher = v8;

    -[BKIOHIDServiceMatcher startObserving:queue:](v2->_presenceServiceMatcher, "startObserving:queue:", v2, v2->_queue);
    v10 = -[BKIOHIDServiceMatcher initWithUsagePage:usage:builtIn:dataProvider:]( objc_alloc(&OBJC_CLASS___BKIOHIDServiceMatcher),  "initWithUsagePage:usage:builtIn:dataProvider:",  32LL,  18LL,  0LL,  v7);
    proximityServiceMatcher = v2->_proximityServiceMatcher;
    v2->_proximityServiceMatcher = v10;

    -[BKIOHIDServiceMatcher startObserving:queue:]( v2->_proximityServiceMatcher,  "startObserving:queue:",  v2,  v2->_queue);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKHumanPresenceHIDEventProcessor;
  -[BKHumanPresenceHIDEventProcessor dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_queue_displayUUIDToSensorRecords withName:@"sensors"];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

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
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
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
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = (void *)objc_opt_class(self, v15);
          *(_DWORD *)buf = v22;
          v28 = v16;
          __int16 v29 = 2114;
          v30 = v12;
          id v17 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: found %{public}@", buf, 0x16u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 displayUUID]);
        v19 = sub_10002E518(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

        v21 = (_BKHIDHumanPresenceSensorRecord *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queue_displayUUIDToSensorRecords,  "objectForKey:",  v20));
        if (!v21)
        {
          v21 = objc_alloc_init(&OBJC_CLASS____BKHIDHumanPresenceSensorRecord);
          -[NSMutableDictionary setObject:forKey:]( self->_queue_displayUUIDToSensorRecords,  "setObject:forKey:",  v21,  v20);
        }

        -[_BKHIDHumanPresenceSensorRecord addService:](v21, "addService:", v12, v22, (void)v23);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
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
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543618;
    id v17 = (id)objc_opt_class(self, v8);
    __int16 v18 = 2114;
    id v19 = v4;
    id v9 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@: removing %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 displayUUID]);
  v11 = sub_10002E518(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_displayUUIDToSensorRecords, "objectForKey:", v12));
  [v13 removeService:v4];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 services]);
  id v15 = [v14 count];

  if (!v15) {
    -[NSMutableDictionary removeObjectForKey:](self->_queue_displayUUIDToSensorRecords, "removeObjectForKey:", v12);
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
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v28 = 138543618;
      *(void *)&v28[4] = objc_opt_class(self, v23);
      *(_WORD *)&v28[12] = 2048;
      *(double *)&v28[14] = FloatValue;
      id v24 = *(id *)&v28[4];
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%{public}@: human proximity event %g",  v28,  0x16u);
    }

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 displayUUID]);
    __int128 v26 = sub_10002E518(v25);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v26);

    -[BKHumanPresenceHIDEventProcessor _setProximityInCentimeters:forDisplayUUID:]( self,  "_setProximityInCentimeters:forDisplayUUID:",  v18,  FloatValue);
    goto LABEL_9;
  }

  if (IntegerValue == 3)
  {
    double v10 = IOHIDEventGetFloatValue(v8, 1900545LL);
    uint64_t v12 = BKLogCommon(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v28 = 138543618;
      *(void *)&v28[4] = objc_opt_class(self, v14);
      *(_WORD *)&v28[12] = 2048;
      *(double *)&v28[14] = v10;
      id v15 = *(id *)&v28[4];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%{public}@: human presence event %g",  v28,  0x16u);
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 displayUUID]);
    id v17 = sub_10002E518(v16);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    -[BKHumanPresenceHIDEventProcessor _setPresence:forDisplayUUID:]( self,  "_setPresence:forDisplayUUID:",  v10 > 0.0,  v18,  *(_OWORD *)v28,  *(void *)&v28[16]);
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