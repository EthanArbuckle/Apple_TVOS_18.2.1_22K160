@interface _DASBatchingQueue
+ (id)queueWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7;
- (NSMutableArray)workItems;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_source)timer;
- (_DASBatchingQueue)initWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7;
- (double)maxDelay;
- (id)workHandler;
- (unint64_t)maxQueueDepth;
- (void)addWorkItem:(id)a3;
- (void)addWorkItems:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setMaxDelay:(double)a3;
- (void)setMaxQueueDepth:(unint64_t)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWorkHandler:(id)a3;
- (void)setWorkItems:(id)a3;
- (void)unprotectedExecuteWorkItems;
@end

@implementation _DASBatchingQueue

- (_DASBatchingQueue)initWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS____DASBatchingQueue;
  v15 = -[_DASBatchingQueue init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    v15->_maxDelay = a4;
    unint64_t v17 = 4LL;
    if (a5) {
      unint64_t v17 = a5;
    }
    v15->_maxQueueDepth = v17;
    id v18 = objc_retainBlock(v14);
    id workHandler = v16->_workHandler;
    v16->_id workHandler = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    workItems = v16->_workItems;
    v16->_workItems = (NSMutableArray *)v20;

    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    if (v13)
    {
      dispatch_queue_t v24 = (dispatch_queue_t)v13;
    }

    else
    {
      id v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"com.apple.dasbatchingqueue.executionqueue.%s", [v12 UTF8String]));
      v26 = (const char *)[v25 UTF8String];

      dispatch_queue_t v24 = dispatch_queue_create(v26, v23);
    }

    executionQueue = v16->_executionQueue;
    v16->_executionQueue = (OS_dispatch_queue *)v24;

    id v28 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"com.apple.dasbatchingqueue.syncqueue.%s", [v12 UTF8String]));
    v29 = (const char *)[v28 UTF8String];

    dispatch_queue_t v30 = dispatch_queue_create(v29, v23);
    syncQueue = v16->_syncQueue;
    v16->_syncQueue = (OS_dispatch_queue *)v30;

    dispatch_source_t v32 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v16->_syncQueue);
    timer = v16->_timer;
    v16->_timer = (OS_dispatch_source *)v32;

    dispatch_set_qos_class_fallback(v16->_timer, 17LL);
    v34 = (dispatch_source_s *)v16->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001D7D0;
    handler[3] = &unk_1001150D0;
    v39 = v16;
    dispatch_source_set_event_handler(v34, handler);
    v35 = (dispatch_source_s *)v16->_timer;
    dispatch_time_t v36 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 / 10.0 * 1000000000.0));
  }

  return v16;
}

+ (id)queueWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = [objc_alloc((Class)objc_opt_class(a1)) initWithName:v14 maxBatchingDelay:a5 maxQueueDepth:v13 queue:v12 workItemsHandler:a4];

  return v15;
}

- (void)unprotectedExecuteWorkItems
{
  v3 = (void *)os_transaction_create("com.apple.dasd.batchingQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", self->_workItems));
  if ([v4 count])
  {
    executionQueue = (dispatch_queue_s *)self->_executionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001D93C;
    block[3] = &unk_100115120;
    id v7 = v3;
    v8 = self;
    id v9 = v4;
    dispatch_async(executionQueue, block);
    -[NSMutableArray removeAllObjects](self->_workItems, "removeAllObjects");
    dispatch_suspend((dispatch_object_t)self->_timer);
  }
}

- (void)addWorkItem:(id)a3
{
  id v4 = a3;
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D9C8;
  block[3] = &unk_100115148;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
}

- (void)addWorkItems:(id)a3
{
  id v4 = a3;
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DB0C;
  block[3] = &unk_100115148;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (unint64_t)maxQueueDepth
{
  return self->_maxQueueDepth;
}

- (void)setMaxQueueDepth:(unint64_t)a3
{
  self->_maxQueueDepth = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (id)workHandler
{
  return self->_workHandler;
}

- (void)setWorkHandler:(id)a3
{
}

- (NSMutableArray)workItems
{
  return self->_workItems;
}

- (void)setWorkItems:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end