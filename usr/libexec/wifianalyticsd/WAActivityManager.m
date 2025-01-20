@interface WAActivityManager
+ (id)sharedActivityManager;
- (BOOL)debugTimerEnabled;
- (BOOL)isEagerExitEnabled;
- (NSDate)dateFirstTransaction;
- (OS_dispatch_queue)queue;
- (WAActivityManager)init;
- (id)alternateExecutionBlockForCleanExit;
- (id)executeBeforePossibleEagerExit;
- (unint64_t)osTransactionsActive;
- (unint64_t)transactionsCompleted;
- (unint64_t)transactionsStarted;
- (void)_executeBeforePossibleEagerExit;
- (void)_executeTimerBlock;
- (void)debugTimer;
- (void)osTransactionComplete:(id)a3;
- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4;
- (void)setAlternateExecutionBlockForCleanExit:(id)a3;
- (void)setDateFirstTransaction:(id)a3;
- (void)setExecuteBeforePossibleEagerExit:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransactionsCompleted:(unint64_t)a3;
- (void)setTransactionsStarted:(unint64_t)a3;
@end

@implementation WAActivityManager

+ (id)sharedActivityManager
{
  if (qword_1000ED040 != -1) {
    dispatch_once(&qword_1000ED040, &stru_1000CDB70);
  }
  return (id)qword_1000ED048;
}

- (WAActivityManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___WAActivityManager;
  v2 = -[WAActivityManager init](&v25, "init");
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
    dispatch_queue_t v9 = dispatch_queue_create("WAActivityManager", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v3->BOOL isEagerExitEnabled = 0;
    uint64_t v11 = MGGetProductType();
    id v12 = WALogActivityManagerHandle();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11 == 3348380076LL)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[WAActivityManager init]";
        __int16 v28 = 1024;
        int v29 = 77;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:WAActivityManager is b520, setting isEagerExitEnabled",  buf,  0x12u);
      }

      v3->BOOL isEagerExitEnabled = 1;
    }

    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[WAActivityManager init]";
        __int16 v28 = 1024;
        int v29 = 80;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:WAActivityManager is not b520, no isEagerExitEnabled",  buf,  0x12u);
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistentDomainForName:@"com.apple.wifianalyticsd"]);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"eager-exit-enable"]);
    v18 = v17;
    if (v17)
    {
      v3->BOOL isEagerExitEnabled = [v17 BOOLValue];
      id v19 = WALogActivityManagerHandle();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isEagerExitEnabled = v3->isEagerExitEnabled;
        *(_DWORD *)buf = 136447234;
        v27 = "-[WAActivityManager init]";
        __int16 v28 = 1024;
        int v29 = 88;
        __int16 v30 = 2112;
        v31 = @"com.apple.wifianalyticsd";
        __int16 v32 = 2112;
        v33 = @"eager-exit-enable";
        __int16 v34 = 1024;
        BOOL v35 = isEagerExitEnabled;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found preference value in domain: %@ key: %@ value: %d",  buf,  0x2Cu);
      }
    }

    v3->waitingToInitDebugTimer = 0;
  }

  else
  {
    id v23 = WALogActivityManagerHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[WAActivityManager init]";
      __int16 v28 = 1024;
      int v29 = 100;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WAActivityManager init error!",  buf,  0x12u);
    }
  }

  return v3;
}

- (BOOL)isEagerExitEnabled
{
  return self->isEagerExitEnabled;
}

- (BOOL)debugTimerEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentDomainForName:@"com.apple.wifianalyticsd"]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"eager-exit-debug"]);
  if (v4)
  {
    id v5 = WALogActivityManagerHandle();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446978;
      v10 = "-[WAActivityManager debugTimerEnabled]";
      __int16 v11 = 1024;
      int v12 = 121;
      __int16 v13 = 2112;
      BOOL v14 = @"com.apple.wifianalyticsd";
      __int16 v15 = 2112;
      v16 = @"eager-exit-debug";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found preference value in domain: %@ key: %@",  (uint8_t *)&v9,  0x26u);
    }

    unsigned __int8 v7 = [v4 BOOLValue];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)debugTimer
{
  if (self->_periodicActiveListTimer)
  {
    id v4 = WALogActivityManagerHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v9 = "-[WAActivityManager debugTimer]";
      __int16 v10 = 1024;
      int v11 = 130;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:WAActivityManager debugTimer already setup",  buf,  0x12u);
    }
  }

  else
  {
    obj = self;
    objc_sync_enter(obj);
    if (obj->waitingToInitDebugTimer)
    {
      objc_sync_exit(obj);
    }

    else
    {
      id v2 = WALogActivityManagerHandle();
      v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v9 = "-[WAActivityManager debugTimer]";
        __int16 v10 = 1024;
        int v11 = 136;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:configuring _periodicActiveListTimer",  buf,  0x12u);
      }

      obj->waitingToInitDebugTimer = 1;
      objc_sync_exit(obj);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10007BD6C;
      block[3] = &unk_1000CCD80;
      block[4] = obj;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6 = a4;
  if (self->isEagerExitEnabled)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[1] = 3221225472LL;
    block[2] = sub_10007C180;
    block[3] = &unk_1000CDBC0;
    block[4] = self;
    id v8 = v6;
    block[0] = _NSConcreteStackBlock;
    id v10 = v6;
    int v11 = a3;
    dispatch_sync(queue, block);

    id v6 = v8;
  }
}

- (void)osTransactionComplete:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0LL;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  if (self->isEagerExitEnabled)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007C4D0;
    block[3] = &unk_1000CDC10;
    id v10 = v4;
    int v11 = self;
    int v12 = &v13;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v14 + 24))
    {
      id v7 = WALogActivityManagerHandle();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[WAActivityManager osTransactionComplete:]";
        __int16 v19 = 1024;
        int v20 = 269;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:osTransactionComplete TRANSACTION NOT FOUND ASSERT",  buf,  0x12u);
      }
    }
  }

  _Block_object_dispose(&v13, 8);
}

- (void)_executeBeforePossibleEagerExit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAActivityManager executeBeforePossibleEagerExit](self, "executeBeforePossibleEagerExit"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[WAActivityManager executeBeforePossibleEagerExit](self, "executeBeforePossibleEagerExit"));
    v4[2]();
  }

- (void)_executeTimerBlock
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[WAActivityManager alternateExecutionBlockForCleanExit]( self,  "alternateExecutionBlockForCleanExit"));
    v4[2]();
  }

- (unint64_t)osTransactionsActive
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007CD24;
  v5[3] = &unk_1000CCF20;
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

- (id)executeBeforePossibleEagerExit
{
  return self->_executeBeforePossibleEagerExit;
}

- (void)setExecuteBeforePossibleEagerExit:(id)a3
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
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
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