@interface MTTimedOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isSleepingOnStartDelay;
- (BOOL)requiresStartDelayToAvoidClampErrors;
- (MTTimedOperation)init;
- (NSUUID)identifier;
- (OS_dispatch_queue)workQueue;
- (double)startDelay;
- (int64_t)operationType;
- (void)cancel;
- (void)finish;
- (void)main;
- (void)setIdentifier:(id)a3;
- (void)setIsSleepingOnStartDelay:(BOOL)a3;
- (void)setMainBlock:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setStartDelay:(double)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
- (void)waitForStartDelay;
@end

@implementation MTTimedOperation

- (MTTimedOperation)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTimedOperation;
  v2 = -[MTTimedOperation init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    LOBYTE(v2->super._private1) = 0;
    BYTE1(v2->super._private1) = 0;
    *(void *)&v2->_executing = 0x3FF0000000000000LL;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id mainBlock = v3->_mainBlock;
    v3->_id mainBlock = (id)v4;

    dispatch_queue_t v6 = dispatch_queue_create("MTTimedOperation.workQueue", 0LL);
    double startDelay = v3->_startDelay;
    *(void *)&v3->_double startDelay = v6;
  }

  return v3;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)finish
{
  LOBYTE(self->super._private1) = 0;
  BYTE1(self->super._private1) = 1;
  -[MTTimedOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
  -[MTTimedOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isFinished");
  v7[0] = @"MTTimedOperationIsCancelledKey";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MTTimedOperation isCancelled](self, "isCancelled")));
  v7[1] = @"MTTimedOperationIdentifierKey";
  v8[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimedOperation identifier](self, "identifier"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"MTTimedOperationFinished" object:0 userInfo:v5];
}

- (void)start
{
  if (-[MTTimedOperation isCancelled](self, "isCancelled"))
  {
    -[MTTimedOperation finish](self, "finish");
  }

  else
  {
    -[MTTimedOperation willChangeValueForKey:](self, "willChangeValueForKey:", @"isExecuting");
    LOBYTE(self->super._private1) = 1;
    -[MTTimedOperation didChangeValueForKey:](self, "didChangeValueForKey:", @"isExecuting");
    -[MTTimedOperation startDelay](self, "startDelay");
    if (v3 <= 0.0) {
      -[MTTimedOperation main](self, "main");
    }
    else {
      -[MTTimedOperation waitForStartDelay](self, "waitForStartDelay");
    }
  }

- (void)main
{
  if ((-[MTTimedOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    double v3 = (void (**)(void))self->super._private;
    if (v3) {
      v3[2]();
    }
  }

  -[MTTimedOperation finish](self, "finish");
}

- (void)waitForStartDelay
{
  if ((-[MTTimedOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[MTTimedOperation setIsSleepingOnStartDelay:](self, "setIsSleepingOnStartDelay:", 1LL);
    objc_initWeak(&location, self);
    -[MTTimedOperation startDelay](self, "startDelay");
    dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(v3 * 1000000000.0));
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTTimedOperation workQueue](self, "workQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000800DC;
    v6[3] = &unk_100240290;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTimedOperation;
  -[MTTimedOperation cancel](&v3, "cancel");
  -[MTTimedOperation setIsSleepingOnStartDelay:](self, "setIsSleepingOnStartDelay:", 0LL);
  -[MTTimedOperation finish](self, "finish");
}

- (void)setMainBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id v5 = self->super._private;
  self->super._private = v4;
}

- (BOOL)isExecuting
{
  return self->super._private1;
}

- (BOOL)isFinished
{
  return BYTE1(self->super._private1);
}

- (NSUUID)identifier
{
  return (NSUUID *)self->_mainBlock;
}

- (void)setIdentifier:(id)a3
{
}

- (double)startDelay
{
  return *(double *)&self->_executing;
}

- (void)setStartDelay:(double)a3
{
  *(double *)&self->_executing = a3;
}

- (int64_t)operationType
{
  return (int64_t)self->_identifier;
}

- (void)setOperationType:(int64_t)a3
{
  self->_identifier = (NSUUID *)a3;
}

- (BOOL)isSleepingOnStartDelay
{
  return BYTE2(self->super._private1) & 1;
}

- (void)setIsSleepingOnStartDelay:(BOOL)a3
{
  BYTE2(self->super._private1) = a3;
}

- (OS_dispatch_queue)workQueue
{
  return *(OS_dispatch_queue **)&self->_startDelay;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)requiresStartDelayToAvoidClampErrors
{
  int64_t v2 = -[MTTimedOperation operationType](self, "operationType");
  return v2 != 5 && v2 != 10;
}

@end