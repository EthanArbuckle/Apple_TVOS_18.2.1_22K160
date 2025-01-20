@interface PCSDelayedAction
- (BOOL)running;
- (NSOperationQueue)operationQueue;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)waitSource;
- (OS_os_transaction)pendingTransaction;
- (PCSDelayedAction)initWithLabel:(id)a3 delay:(unint64_t)a4 operationQueue:(id)a5;
- (id)actionOnTrigger;
- (int64_t)noTransaction;
- (unint64_t)delayInSeconds;
- (void)run;
- (void)setAction:(id)a3;
- (void)setActionOnTrigger:(id)a3;
- (void)setDelayInSeconds:(unint64_t)a3;
- (void)setHoldTransaction:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNoTransaction:(int64_t)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingTransaction:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setWaitSource:(id)a3;
- (void)trigger;
@end

@implementation PCSDelayedAction

- (PCSDelayedAction)initWithLabel:(id)a3 delay:(unint64_t)a4 operationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PCSDelayedAction;
  v10 = -[PCSDelayedAction init](&v21, "init");
  v11 = v10;
  if (v10)
  {
    -[PCSDelayedAction setLabel:](v10, "setLabel:", v8);
    objc_initWeak(&location, v11);
    objc_storeStrong((id *)&v11->_operationQueue, a5);
    v11->_delayInSeconds = a4;
    id v12 = sub_10000C638();
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0LL, 0LL, v13);
    waitSource = v11->_waitSource;
    v11->_waitSource = (OS_dispatch_source *)v14;

    v16 = (dispatch_source_s *)v11->_waitSource;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000C678;
    v18[3] = &unk_100024DD0;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)setAction:(id)a3
{
  if (!self->_running)
  {
    id v4 = objc_retainBlock(a3);
    id actionOnTrigger = self->_actionOnTrigger;
    self->_id actionOnTrigger = v4;
  }

- (void)run
{
  self->_running = 1;
  dispatch_resume((dispatch_object_t)self->_waitSource);
}

- (void)setHoldTransaction:(BOOL)a3
{
  id v5 = sub_10000C638();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000C948;
  v7[3] = &unk_100024B88;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(v6, v7);
}

- (void)trigger
{
  id v3 = sub_10000C638();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CA08;
  block[3] = &unk_100024DF8;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLabel:(id)a3
{
}

- (id)actionOnTrigger
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActionOnTrigger:(id)a3
{
}

- (unint64_t)delayInSeconds
{
  return self->_delayInSeconds;
}

- (void)setDelayInSeconds:(unint64_t)a3
{
  self->_delayInSeconds = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)waitSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setWaitSource:(id)a3
{
}

- (OS_os_transaction)pendingTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPendingTransaction:(id)a3
{
}

- (int64_t)noTransaction
{
  return self->_noTransaction;
}

- (void)setNoTransaction:(int64_t)a3
{
  self->_noTransaction = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
}

@end