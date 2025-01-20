@interface BKTouchDeliveryObservationManager
+ (id)sharedInstance;
- (BKTouchDeliveryObservationManager)init;
- (OS_dispatch_queue)queue;
- (int)_pidForClientPort:(unsigned int)a3;
- (void)_queue_pendUpdate:(id)a3;
- (void)_queue_postPendingUpdates;
- (void)_queue_postUpdate:(id)a3 forTouchIdentifier:(unsigned int)a4;
- (void)_queue_postUpdate:(id)a3 toProcessPID:(int)a4;
- (void)_queue_setProcessPID:(int)a3 observesGlobalTouches:(BOOL)a4;
- (void)_queue_setProcessPID:(int)a3 observesTouch:(BOOL)a4 withIdentifier:(unsigned int)a5;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)noteTouchUpOccurred:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 clientPort:(unsigned int)a6;
- (void)setObservesAllTouches:(id)a3;
- (void)setObservesTouch:(id)a3 withIdentifier:(id)a4;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6;
- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4;
- (void)touchDidFinishProcessingTouchCollection;
@end

@implementation BKTouchDeliveryObservationManager

- (BKTouchDeliveryObservationManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___BKTouchDeliveryObservationManager;
  v2 = -[BKTouchDeliveryObservationManager init](&v18, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___BSMutableIntegerMap);
    touchIdentifierToPIDs = v2->_touchIdentifierToPIDs;
    v2->_touchIdentifierToPIDs = v3;

    v5 = objc_opt_new(&OBJC_CLASS___BSMutableIntegerMap);
    touchIdentifierToUpdate = v2->_touchIdentifierToUpdate;
    v2->_touchIdentifierToUpdate = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    globalTouchObserverPIDs = v2->_globalTouchObserverPIDs;
    v2->_globalTouchObserverPIDs = (NSMutableIndexSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.backboard.BKTouchDeliveryObservationManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(&OBJC_CLASS___BKHIDDomainServiceServer);
    v12 = v2->_queue;
    uint64_t v13 = BKLogTouchDeliveryObserver(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[BKHIDDomainServiceServer initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:]( v11,  "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:",  v2,  v2,  &OBJC_PROTOCOL___BKSTouchDeliveryObservationService_IPC,  &OBJC_PROTOCOL___BKSTouchDeliveryObserving_IPC,  BKSTouchDeliveryObservationBSServiceName,  v12,  v14,  BKObserveTouchDeliveryObservingEntitlement);
    server = v2->_server;
    v2->_server = v15;

    -[BKHIDDomainServiceServer activate](v2->_server, "activate");
  }

  return v2;
}

- (void)noteTouchUpOccurred:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 clientPort:(unsigned int)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017D94;
  block[3] = &unk_1000B5D18;
  block[4] = self;
  unsigned int v8 = a6;
  unsigned int v9 = a3;
  unsigned int v10 = a5;
  BOOL v11 = a4;
  dispatch_async(queue, block);
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = BKLogTouchDeliveryObserver(v6);
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "terminate %{public}@", buf, 0xCu);
  }

  signed int v9 = [v5 pid];
  -[NSMutableIndexSet removeIndex:](self->_globalTouchObserverPIDs, "removeIndex:", v9);
  touchIdentifierToPIDs = self->_touchIdentifierToPIDs;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017D84;
  v11[3] = &unk_1000B5D38;
  signed int v12 = v9;
  -[BSMutableIntegerMap enumerateWithBlock:](touchIdentifierToPIDs, "enumerateWithBlock:", v11);
}

- (void)setObservesAllTouches:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);

  id v7 = [v6 pid];
  uint64_t v8 = BKLogTouchDeliveryObserver(v7);
  signed int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
    int v11 = 138543874;
    signed int v12 = v6;
    __int16 v13 = 2114;
    id v14 = v10;
    __int16 v15 = 1024;
    unsigned int v16 = [v4 BOOLValue];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "process:%{public}@ (ctx:%{public}@) observes all touches:%{BOOL}u",  (uint8_t *)&v11,  0x1Cu);
  }

  -[BKTouchDeliveryObservationManager _queue_setProcessPID:observesGlobalTouches:]( self,  "_queue_setProcessPID:observesGlobalTouches:",  v7,  [v4 BOOLValue]);
}

- (void)setObservesTouch:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  signed int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteProcess]);

  id v10 = [v9 pid];
  id v11 = [v7 unsignedIntValue];
  uint64_t v12 = BKLogTouchDeliveryObserver(v11);
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109632;
    v14[1] = (_DWORD)v10;
    __int16 v15 = 1024;
    unsigned int v16 = [v6 BOOLValue];
    __int16 v17 = 1024;
    int v18 = (int)v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "pid:%d observes touch:%{BOOL}u identifier:%X",  (uint8_t *)v14,  0x14u);
  }

  -[BKTouchDeliveryObservationManager _queue_setProcessPID:observesTouch:withIdentifier:]( self,  "_queue_setProcessPID:observesTouch:withIdentifier:",  v10,  [v6 BOOLValue],  v11);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100017CA4;
  v7[3] = &unk_1000B5D60;
  v7[4] = self;
  unsigned int v8 = a3;
  BOOL v9 = a6;
  dispatch_async(queue, v7);
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  id v6 = a4;
  id v7 = [v6 copy];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017AFC;
  block[3] = &unk_1000B80A8;
  id v11 = v7;
  uint64_t v12 = self;
  unsigned int v13 = a3;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)touchDidFinishProcessingTouchCollection
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017AF4;
  block[3] = &unk_1000B8058;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_queue_setProcessPID:(int)a3 observesTouch:(BOOL)a4 withIdentifier:(unsigned int)a5
{
  BOOL v5 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToPIDs, "objectForKey:", a5));
  if (v9) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v5;
  }
  if (!v8)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    -[BSMutableIntegerMap setObject:forKey:](self->_touchIdentifierToPIDs, "setObject:forKey:");
  }

  if (v5) {
    [v9 addIndex:a3];
  }
  else {
    [v9 removeIndex:a3];
  }
}

- (void)_queue_setProcessPID:(int)a3 observesGlobalTouches:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  globalTouchObserverPIDs = self->_globalTouchObserverPIDs;
  if (v4) {
    -[NSMutableIndexSet addIndex:](globalTouchObserverPIDs, "addIndex:", a3);
  }
  else {
    -[NSMutableIndexSet removeIndex:](globalTouchObserverPIDs, "removeIndex:", a3);
  }
}

- (void)_queue_pendUpdate:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v4 = [v9 touchIdentifier];
  unsigned int v5 = [v9 contextID];
  uint64_t v6 = v4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToUpdate, "objectForKey:", v4));
  BOOL v8 = (void *)v7;
  if (v5 || !v7) {
    -[BSMutableIntegerMap setObject:forKey:](self->_touchIdentifierToUpdate, "setObject:forKey:", v9, v6);
  }
}

- (void)_queue_postPendingUpdates
{
  touchIdentifierToUpdate = self->_touchIdentifierToUpdate;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100017AE8;
  v4[3] = &unk_1000B5D88;
  v4[4] = self;
  -[BSMutableIntegerMap enumerateWithBlock:](touchIdentifierToUpdate, "enumerateWithBlock:", v4);
  -[BSMutableIntegerMap removeAllObjects](self->_touchIdentifierToUpdate, "removeAllObjects");
}

- (void)_queue_postUpdate:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [v6 pid];
  int v8 = (int)v7;
  uint64_t v9 = BKLogTouchDeliveryObserver(v7);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v23 = a4;
    __int16 v24 = 1024;
    int v25 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "touch %X sent to destination pid:%d",  buf,  0xEu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToPIDs, "objectForKey:", a4));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100017AC8;
  v20[3] = &unk_1000B5DB0;
  v20[4] = self;
  id v12 = v6;
  id v21 = v12;
  [v11 enumerateIndexesUsingBlock:v20];
  id v13 = -[NSMutableIndexSet mutableCopy](self->_globalTouchObserverPIDs, "mutableCopy");
  id v14 = v13;
  if (v11) {
    [v13 removeIndexes:v11];
  }
  if (v8 >= 1 && [v14 count])
  {
    id v15 = [v12 copy];
    [v15 setTouchIdentifier:0];
    globalTouchObserverPIDs = self->_globalTouchObserverPIDs;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100017AD8;
    v18[3] = &unk_1000B5DB0;
    v18[4] = self;
    id v17 = v15;
    id v19 = v17;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](globalTouchObserverPIDs, "enumerateIndexesUsingBlock:", v18);
  }
}

- (void)_queue_postUpdate:(id)a3 toProcessPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = BKLogTouchDeliveryObserver(v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109376;
    v11[1] = [v6 touchIdentifier];
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "post update for touch:%X to pid:%d",  (uint8_t *)v11,  0xEu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer connectionForPID:](self->_server, "connectionForPID:", v4));
  id v10 = (BKTouchObservationClient *)objc_claimAutoreleasedReturnValue( -[BKHIDDomainServiceServer userInfoForConnection:]( self->_server,  "userInfoForConnection:",  v9));
  if (!v10)
  {
    id v10 = -[BKTouchObservationClient initWithConnection:pid:]( objc_alloc(&OBJC_CLASS___BKTouchObservationClient),  "initWithConnection:pid:",  v9,  v4);
    -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:");
  }

  -[BKTouchObservationClient sendTouchUpdate:](v10, "sendTouchUpdate:", v6);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)_pidForClientPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(self, a2);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientForTaskPort:v3]);
  uint64_t v7 = v6;
  if (v6) {
    int v8 = [v6 pid];
  }
  else {
    int v8 = -1;
  }

  return v8;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DBF18 != -1) {
    dispatch_once(&qword_1000DBF18, &stru_1000B5CF0);
  }
  return (id)qword_1000DBF10;
}

@end