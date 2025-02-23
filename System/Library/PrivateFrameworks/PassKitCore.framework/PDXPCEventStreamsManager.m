@interface PDXPCEventStreamsManager
+ (id)eventStreamManager;
- (PDXPCEventStreamsManager)init;
- (id)_init;
- (id)_managerForEventStream:(id)a3;
- (void)beginEventDelivery;
- (void)pauseEventDelivery;
- (void)registerForLaunchEvents;
- (void)registerObserver:(id)a3 forEventStream:(id)a4;
- (void)registerObserver:(id)a3 forEventStream:(id)a4 withReplyQueue:(id)a5;
- (void)unregisterObserver:(id)a3 forEventStream:(id)a4;
@end

@implementation PDXPCEventStreamsManager

+ (id)eventStreamManager
{
  if (qword_100707938 != -1) {
    dispatch_once(&qword_100707938, &stru_10063C058);
  }
  return (id)qword_100707930;
}

- (PDXPCEventStreamsManager)init
{
  return 0LL;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDXPCEventStreamsManager;
  v2 = -[PDXPCEventStreamsManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_pauseCounter = 1LL;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    streamToStreamManagerMap = v3->_streamToStreamManagerMap;
    v3->_streamToStreamManagerMap = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passd.xpcEventStreamsManager.state", 0LL);
    stateQueue = v3->_stateQueue;
    v3->_stateQueue = (OS_dispatch_queue *)v6;
  }

  return v3;
}

- (void)registerForLaunchEvents
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040E24;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

- (void)pauseEventDelivery
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040ED0;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

- (void)beginEventDelivery
{
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040FE8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

- (void)registerObserver:(id)a3 forEventStream:(id)a4
{
}

- (void)registerObserver:(id)a3 forEventStream:(id)a4 withReplyQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    v18 = sub_1000412B4;
    v19 = sub_1000412C4;
    id v20 = 0LL;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000412CC;
    block[3] = &unk_10063C080;
    v14 = &v15;
    block[4] = self;
    id v13 = v9;
    dispatch_sync((dispatch_queue_t)stateQueue, block);
    [(id)v16[5] registerObserver:v8 withReplyQueue:v10];

    _Block_object_dispose(&v15, 8);
  }
}

- (void)unregisterObserver:(id)a3 forEventStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    uint64_t v15 = sub_1000412B4;
    v16 = sub_1000412C4;
    id v17 = 0LL;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100041410;
    block[3] = &unk_10063C080;
    v11 = &v12;
    block[4] = self;
    id v10 = v7;
    dispatch_sync((dispatch_queue_t)stateQueue, block);
    [(id)v13[5] unregisterObserver:v6];

    _Block_object_dispose(&v12, 8);
  }
}

- (id)_managerForEventStream:(id)a3
{
  id v4 = a3;
  v5 = (PDXPCEventStreamManager *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_streamToStreamManagerMap,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    v5 = -[PDXPCEventStreamManager initWithEventStream:startedPaused:]( objc_alloc(&OBJC_CLASS___PDXPCEventStreamManager),  "initWithEventStream:startedPaused:",  v4,  self->_pauseCounter != 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_streamToStreamManagerMap,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end