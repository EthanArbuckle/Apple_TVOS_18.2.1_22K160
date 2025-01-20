@interface CKKSNearFutureScheduler
- (BOOL)keepProcessAlive;
- (BOOL)liveRequest;
- (CKKSCondition)liveRequestReceived;
- (CKKSNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7;
- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8;
- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9;
- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 qosClass:(unsigned int)a9 block:(id)a10;
- (CKKSResultOperation)operationDependency;
- (NSDate)nextFireTime;
- (NSDate)predictedNextFireTime;
- (NSOperationQueue)operationQueue;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (double)backoff;
- (id)description;
- (id)futureBlock;
- (id)makeOperationDependency;
- (int64_t)operationDependencyDescriptionCode;
- (unint64_t)currentDelay;
- (unint64_t)initialDelay;
- (unint64_t)maximumDelay;
- (void)_onqueueTimerTick;
- (void)_onqueueTrigger:(unint64_t)a3 maximumDelay:(unint64_t)a4;
- (void)cancel;
- (void)changeDelays:(unint64_t)a3 continuingDelay:(unint64_t)a4;
- (void)setBackoff:(double)a3;
- (void)setCurrentDelay:(unint64_t)a3;
- (void)setFutureBlock:(id)a3;
- (void)setInitialDelay:(unint64_t)a3;
- (void)setKeepProcessAlive:(BOOL)a3;
- (void)setLiveRequest:(BOOL)a3;
- (void)setLiveRequestReceived:(id)a3;
- (void)setMaximumDelay:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setOperationDependency:(id)a3;
- (void)setOperationDependencyDescriptionCode:(int64_t)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPredictedNextFireTime:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
- (void)trigger;
- (void)triggerAt:(unint64_t)a3;
- (void)waitUntil:(unint64_t)a3;
@end

@implementation CKKSNearFutureScheduler

- (CKKSNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7
{
  return -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( self,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  a3,  a4,  a4,  a5,  a6,  a7);
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8
{
  if (a4) {
    unint64_t v8 = a5 / a4;
  }
  else {
    unint64_t v8 = 1LL;
  }
  if (v8 <= 1) {
    unint64_t v8 = 1LL;
  }
  return -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( self,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  a3,  (double)v8);
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9
{
  return -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:qosClass:block:]( self,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:qosClass:block:",  a3,  a4,  a6,  a7,  a8,  0LL,  a5,  a9);
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 qosClass:(unsigned int)a9 block:(id)a10
{
  id v18 = a3;
  id v19 = a10;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CKKSNearFutureScheduler;
  v20 = -[CKKSNearFutureScheduler init](&v39, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a3);
    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_qos_class(v23, (dispatch_qos_class_t)a9, 0);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);

    id v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"near-future-scheduler-%@", v18));
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 UTF8String], v25);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v27;

    v21->_initialDelay = a4;
    v21->_currentDelay = a4;
    v21->_maximumDelay = a6;
    v21->_backoff = a5;
    id v29 = objc_retainBlock(v19);
    id futureBlock = v21->_futureBlock;
    v21->_id futureBlock = v29;

    v21->_liveRequest = 0;
    v31 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    liveRequestReceived = v21->_liveRequestReceived;
    v21->_liveRequestReceived = v31;

    predictedNextFireTime = v21->_predictedNextFireTime;
    v21->_predictedNextFireTime = 0LL;

    v21->_keepProcessAlive = a7;
    v34 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v21->_operationQueue;
    v21->_operationQueue = v34;

    v21->_operationDependencyDescriptionCode = a8;
    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler makeOperationDependency](v21, "makeOperationDependency"));
    operationDependency = v21->_operationDependency;
    v21->_operationDependency = (CKKSResultOperation *)v36;
  }

  return v21;
}

- (void)changeDelays:(unint64_t)a3 continuingDelay:(unint64_t)a4
{
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FC8C;
  block[3] = &unk_100284888;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);
}

- (id)makeOperationDependency
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"nfs-%@", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  v4,  &stru_1002848A8));

  objc_msgSend( v5,  "setDescriptionErrorCode:",  -[CKKSNearFutureScheduler operationDependencyDescriptionCode](self, "operationDependencyDescriptionCode"));
  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler nextFireTime](self, "nextFireTime"));
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSNearFutureScheduler(%@): next at %@",  v5,  v6));
  }

  else
  {
    v4 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler name](self, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSNearFutureScheduler(%@): no pending attempts",  v4));
  }

  return v7;
}

- (NSDate)nextFireTime
{
  if (-[CKKSNearFutureScheduler liveRequest](self, "liveRequest")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler liveRequestReceived](self, "liveRequestReceived")),
        id v4 = [v3 wait:50000],
        v3,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
  }

  else
  {
    v5 = 0LL;
  }

  return (NSDate *)v5;
}

- (void)waitUntil:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008FC78;
  v6[3] = &unk_100285790;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)triggerAt:(unint64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FC10;
  block[3] = &unk_1002848D0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_onqueueTimerTick
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[CKKSNearFutureScheduler liveRequest](self, "liveRequest"))
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler operationDependency](self, "operationDependency"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler makeOperationDependency](self, "makeOperationDependency"));
    -[CKKSNearFutureScheduler setOperationDependency:](self, "setOperationDependency:", v4);

    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler futureBlock](self, "futureBlock"));
    v5[2]();

    -[CKKSNearFutureScheduler setLiveRequest:](self, "setLiveRequest:", 0LL);
    v6 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    -[CKKSNearFutureScheduler setLiveRequestReceived:](self, "setLiveRequestReceived:", v6);

    -[CKKSNearFutureScheduler setTransaction:](self, "setTransaction:", 0LL);
    if (-[CKKSNearFutureScheduler currentDelay](self, "currentDelay"))
    {
      double v7 = (double)-[CKKSNearFutureScheduler currentDelay](self, "currentDelay");
      -[CKKSNearFutureScheduler backoff](self, "backoff");
      double v9 = v8 * v7;
      double v10 = (double)-[CKKSNearFutureScheduler maximumDelay](self, "maximumDelay");
      if (v9 < v10) {
        double v10 = v9;
      }
      unint64_t v11 = (unint64_t)v10;
    }

    else
    {
      unint64_t v11 = -[CKKSNearFutureScheduler maximumDelay](self, "maximumDelay");
    }

    -[CKKSNearFutureScheduler setCurrentDelay:](self, "setCurrentDelay:", v11);
    v13 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
    dispatch_time_t v14 = dispatch_walltime(0LL, -[CKKSNearFutureScheduler currentDelay](self, "currentDelay"));
    dispatch_source_set_timer(v13, v14, -[CKKSNearFutureScheduler currentDelay](self, "currentDelay"), 0x2FAF080uLL);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler operationQueue](self, "operationQueue"));
    [v15 addOperation:v17];

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)-[CKKSNearFutureScheduler currentDelay](self, "currentDelay") / 1000000000.0));
    -[CKKSNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", v16);
  }

  else
  {
    v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
    dispatch_source_cancel(v12);

    -[CKKSNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", 0LL);
    -[CKKSNearFutureScheduler setCurrentDelay:]( self,  "setCurrentDelay:",  -[CKKSNearFutureScheduler initialDelay](self, "initialDelay"));
  }

- (void)trigger
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008FBB0;
  v4[3] = &unk_100291A38;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_onqueueTrigger:(unint64_t)a3 maximumDelay:(unint64_t)a4
{
  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (-[CKKSNearFutureScheduler keepProcessAlive](self, "keepProcessAlive"))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler transaction](self, "transaction"));

    if (!v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler name](self, "name"));
      id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.securityd.%@", v9));
      unint64_t v11 = (void *)os_transaction_create([v10 UTF8String]);
      -[CKKSNearFutureScheduler setTransaction:](self, "setTransaction:", v11);
    }
  }

  if (a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)a3 / 1000000000.0));
      dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
      id v15 = [v13 compare:v14];

      if (v15 == (id)1)
      {
        v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
        dispatch_source_cancel(v16);

        -[CKKSNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", 0LL);
      }
    }
  }

  if (a4 != -1LL)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));

    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)a3 / 1000000000.0));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
      id v20 = [v18 compare:v19];

      if (v20 != (id)1)
      {
        v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
        dispatch_source_cancel(v21);

        -[CKKSNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", 0LL);
      }
    }
  }

  dispatch_queue_attr_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
  if (!v22
    || (v23 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer")),
        uint64_t v24 = dispatch_source_testcancel(v23),
        v23,
        v22,
        v24))
  {
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
    dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v25);
    -[CKKSNearFutureScheduler setTimer:](self, "setTimer:", v26);

    dispatch_queue_t v27 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10008FB84;
    handler[3] = &unk_100291A38;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v27, handler);

    unint64_t v28 = -[CKKSNearFutureScheduler currentDelay](self, "currentDelay");
    if (v28 <= a3) {
      unint64_t v29 = a3;
    }
    else {
      unint64_t v29 = v28;
    }
    if (!a3) {
      unint64_t v29 = v28;
    }
    if (v29 >= a4) {
      unint64_t v30 = a4;
    }
    else {
      unint64_t v30 = v29;
    }
    if (a4 == -1LL) {
      int64_t v31 = v29;
    }
    else {
      int64_t v31 = v30;
    }
    v32 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
    dispatch_time_t v33 = dispatch_walltime(0LL, v31);
    dispatch_source_set_timer(v32, v33, -[CKKSNearFutureScheduler currentDelay](self, "currentDelay"), 0x2FAF080uLL);

    v34 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler timer](self, "timer"));
    dispatch_resume(v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(unint64_t)v31 / 1000000000.0));
    -[CKKSNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", v35);

    objc_destroyWeak(&v37);
  }

  objc_destroyWeak(&location);
}

- (void)cancel
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FAF4;
  block[3] = &unk_1002927F0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)futureBlock
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFutureBlock:(id)a3
{
}

- (CKKSResultOperation)operationDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOperationDependency:(id)a3
{
}

- (CKKSCondition)liveRequestReceived
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLiveRequestReceived:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setName:(id)a3
{
}

- (unint64_t)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(unint64_t)a3
{
  self->_initialDelay = a3;
}

- (unint64_t)currentDelay
{
  return self->_currentDelay;
}

- (void)setCurrentDelay:(unint64_t)a3
{
  self->_currentDelay = a3;
}

- (unint64_t)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setMaximumDelay:(unint64_t)a3
{
  self->_maximumDelay = a3;
}

- (double)backoff
{
  return self->_backoff;
}

- (void)setBackoff:(double)a3
{
  self->_backoff = a3;
}

- (int64_t)operationDependencyDescriptionCode
{
  return self->_operationDependencyDescriptionCode;
}

- (void)setOperationDependencyDescriptionCode:(int64_t)a3
{
  self->_operationDependencyDescriptionCode = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSDate)predictedNextFireTime
{
  return (NSDate *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setPredictedNextFireTime:(id)a3
{
}

- (BOOL)liveRequest
{
  return self->_liveRequest;
}

- (void)setLiveRequest:(BOOL)a3
{
  self->_liveRequest = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)keepProcessAlive
{
  return self->_keepProcessAlive;
}

- (void)setKeepProcessAlive:(BOOL)a3
{
  self->_keepProcessAlive = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end