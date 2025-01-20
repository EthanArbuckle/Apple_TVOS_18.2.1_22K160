@interface KTStateMultiStateArrivalWatcher
- (BOOL)completed;
- (BOOL)timeoutCanOccur;
- (KTResultOperation)initialTimeoutListenerOp;
- (KTResultOperation)result;
- (NSDictionary)failStates;
- (NSOperationQueue)operationQueue;
- (NSSet)states;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5;
- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6;
- (id)timeout:(unint64_t)a3;
- (void)_onqueuePerformTimeoutWithUnderlyingError;
- (void)completeWithErrorIfPending:(id)a3;
- (void)onqueueEnterState:(id)a3;
- (void)onqueueHandleTransition:(id)a3;
- (void)onqueueStartFinishOperation:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setInitialTimeoutListenerOp:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
@end

@implementation KTStateMultiStateArrivalWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5
{
  return -[KTStateMultiStateArrivalWatcher initNamed:serialQueue:states:failStates:]( self,  "initNamed:serialQueue:states:failStates:",  a3,  a4,  a5,  &__NSDictionary0__struct);
}

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___KTStateMultiStateArrivalWatcher;
  v15 = -[KTStateMultiStateArrivalWatcher init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromArray:v17]);
    states = v16->_states;
    v16->_states = (NSSet *)v18;

    objc_storeStrong((id *)&v16->_failStates, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"watcher-%@", v11));
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlock:]( &OBJC_CLASS___KTResultOperation,  "named:withBlock:",  v20,  &stru_100287F30));
    v22 = v16->_result;
    v16->_result = (KTResultOperation *)v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v23;

    objc_storeStrong((id *)&v16->_queue, a4);
    *(_WORD *)&v16->_completed = 256;
  }

  return v16;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher states](self, "states"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTStateMultiStateArrivalWatcher(%@): states: %@, result: %@>",  v3,  v4,  v5));

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 nextState]);
  -[KTStateMultiStateArrivalWatcher onqueueEnterState:](self, "onqueueEnterState:", v6);
}

- (void)onqueueEnterState:(id)a3
{
  id v8 = a3;
  if (!-[KTStateMultiStateArrivalWatcher completed](self, "completed"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher states](self, "states"));
    unsigned int v5 = [v4 containsObject:v8];

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher failStates](self, "failStates"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);

      -[KTStateMultiStateArrivalWatcher onqueueStartFinishOperation:](self, "onqueueStartFinishOperation:", v7);
    }
  }
}

- (void)_onqueuePerformTimeoutWithUnderlyingError
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateMultiStateArrivalWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[KTStateMultiStateArrivalWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher name](self, "name"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher states](self, "states"));
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Operation(%@) timed out waiting to start for any state in [%@]",  v4,  v5));

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"KTResultOperationError",  3LL,  v7));
    -[KTStateMultiStateArrivalWatcher onqueueStartFinishOperation:](self, "onqueueStartFinishOperation:", v6);
  }

- (id)timeout:(unint64_t)a3
{
  id location = 0LL;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0LL, a3);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001A50D0;
  v8[3] = &unk_100276D20;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)onqueueStartFinishOperation:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[KTStateMultiStateArrivalWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher result](self, "result"));
  [v6 setError:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher operationQueue](self, "operationQueue"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher result](self, "result"));
  [v7 addOperation:v8];

  -[KTStateMultiStateArrivalWatcher setCompleted:](self, "setCompleted:", 1LL);
}

- (void)completeWithErrorIfPending:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A5240;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (KTResultOperation)result
{
  return (KTResultOperation *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSSet)states
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDictionary)failStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (KTResultOperation)initialTimeoutListenerOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setInitialTimeoutListenerOp:(id)a3
{
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end