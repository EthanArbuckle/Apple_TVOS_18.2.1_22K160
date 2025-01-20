@interface W5ActivityManager
+ (id)sharedActivityManager;
- (BOOL)debugTimerEnabled;
- (NSDate)dateFirstTransaction;
- (OS_dispatch_queue)queue;
- (W5ActivityManager)init;
- (id)alternateExecutionBlockForCleanExit;
- (unint64_t)osTransactionsActive;
- (unint64_t)transactionsCompleted;
- (unint64_t)transactionsStarted;
- (void)_executeTimerBlock;
- (void)debugTimer;
- (void)osTransactionComplete:(id)a3;
- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4;
- (void)setAlternateExecutionBlockForCleanExit:(id)a3;
- (void)setDateFirstTransaction:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransactionsCompleted:(unint64_t)a3;
- (void)setTransactionsStarted:(unint64_t)a3;
@end

@implementation W5ActivityManager

+ (id)sharedActivityManager
{
  if (qword_1000F74F0 != -1) {
    dispatch_once(&qword_1000F74F0, &stru_1000D1628);
  }
  return (id)qword_1000F74F8;
}

- (W5ActivityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___W5ActivityManager;
  v2 = -[W5ActivityManager init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    eagerExitTimeout = v2->_eagerExitTimeout;
    v2->_eagerExitTimeout = 0LL;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    active_transactions = v3->_active_transactions;
    v3->_active_transactions = (NSMutableArray *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("W5ActivityManager", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] W5ActivityManager init error!",  v12,  2u);
  }

  return v3;
}

- (BOOL)debugTimerEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentDomainForName:@"com.apple.wifivelocity"]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"eager-exit-debug"]);
  if (v4)
  {
    NSLog( @"%s: Found preference value in domain: %@ key: %@",  "-[W5ActivityManager debugTimerEnabled]",  @"com.apple.wifivelocity",  @"eager-exit-debug");
    unsigned __int8 v5 = [v4 BOOLValue];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)debugTimer
{
  periodicActiveListTimer = self->_periodicActiveListTimer;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (periodicActiveListTimer)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager debugTimer already setup",  buf,  2u);
    }
  }

  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] W5ActivityManager configuring _periodicActiveListTimer",  buf,  2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100016BB8;
    block[3] = &unk_1000D11C8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016EDC;
  block[3] = &unk_1000D1678;
  block[4] = self;
  id v10 = v6;
  v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)osTransactionComplete:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017178;
  block[3] = &unk_1000D16F0;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  v11 = &v12;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v13 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_queue_attr_t v7 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] W5ActivityManager osTransactionComplete TRANSACTION NOT FOUND ASSERT",  v7,  2u);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_executeTimerBlock
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5ActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[W5ActivityManager alternateExecutionBlockForCleanExit]( self,  "alternateExecutionBlockForCleanExit"));
    v4[2]();
  }

- (unint64_t)osTransactionsActive
{
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000177DC;
  v5[3] = &unk_1000D1718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)alternateExecutionBlockForCleanExit
{
  return self->_alternateExecutionBlockForCleanExit;
}

- (void)setAlternateExecutionBlockForCleanExit:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)transactionsStarted
{
  return self->_transactionsStarted;
}

- (void)setTransactionsStarted:(unint64_t)a3
{
  self->_transactionsStarted = a3;
}

- (NSDate)dateFirstTransaction
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
}

- (unint64_t)transactionsCompleted
{
  return self->_transactionsCompleted;
}

- (void)setTransactionsCompleted:(unint64_t)a3
{
  self->_transactionsCompleted = a3;
}

- (void).cxx_destruct
{
}

@end