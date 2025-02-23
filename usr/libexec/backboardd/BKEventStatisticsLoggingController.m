@interface BKEventStatisticsLoggingController
+ (OS_dispatch_queue)workQueue;
- (BKEventStatisticsLoggingController)initWithLabel:(id)a3 logCategory:(id)a4;
- (NSArray)statistics;
- (id)beginTransactionForReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setStatistics:(id)a3;
- (void)updateStatistics:(id)a3;
@end

@implementation BKEventStatisticsLoggingController

- (BKEventStatisticsLoggingController)initWithLabel:(id)a3 logCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = [BKEventStatisticsLoggingController class];
  BKEventStatisticsLoggingController *v8 = [[BKEventStatisticsLoggingController alloc] init];
  v9 = v8;
  if (v8)
  {
    v8->_resetStartTime = 1;
    v10 = (NSString *)[v6 copy];
    label = v9->_label;
    v9->_label = v10;

    [v9 setLogCategory:a4];
    objc_initWeak(&location, v9);
    v12 = [@"BKEventStatistics-" stringByAppendingString:v6];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10004E820;
    v23 = &unk_1000B7380;
    [location copy];
    uint64_t v13 = [BSCompoundAssertion assertionWithIdentifier:v12 stateDidChangeHandler:v20];
    transactionAssertion = v9->_transactionAssertion;
    v9->_transactionAssertion = (BSCompoundAssertion *)v13;

    v16 = [v9 class];
    uint64_t v17 = [v16 workQueue:v20 withIdentifier:v21 withPriority:v22 withQoSClass:v23];
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    [v24 release];
    [location release];
  }

  return v9;
}

- (void)dealloc
{
  if (!self->_invalid)
  {
    v4 = [NSString stringWithFormat:@"someone forgot to invoke -invalidate on %@" self];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      id v6 = v5;
      v8 = [self class];
      v9 = NSStringFromClass(v8);
      v10 = [v9 autorelease];
      *(_DWORD *)buf = 138544642;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKEventStatisticsLoggingController.m";
      __int16 v20 = 1024;
      int v21 = 439;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x10004E238LL);
  }

  v11.receiver = self;
  v11.super_class = [BKEventStatisticsLoggingController class];
  [v11 dealloc];
}

- (id)beginTransactionForReason:(id)a3
{
  return [self->_transactionAssertion acquireForReason:a3];
}

- (void)updateStatistics:(id)a3
{
  id v4 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004E66C;
  v7[3] = &unk_1000B73F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)invalidate
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004E38C;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (NSArray)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (OS_dispatch_queue)workQueue
{
  if (qword_1000DC188 != -1) {
    dispatch_once(&qword_1000DC188, &stru_1000B7358);
  }
  return (OS_dispatch_queue *)(id)qword_1000DC190;
}

@end