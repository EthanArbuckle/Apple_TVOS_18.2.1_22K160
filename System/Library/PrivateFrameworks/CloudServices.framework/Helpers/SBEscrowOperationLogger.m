@interface SBEscrowOperationLogger
- (SBEscrowOperationLogger)init;
- (SBEscrowOperationLogger)initWithStorageProvider:(id)a3;
- (SecureBackupLog)currentLog;
- (id)addObserver:(id)a3;
- (id)addObserverBlock:(id)a3;
- (id)addOneShotObserverBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updateExistingOperations;
- (void)updateExistingOperationsWithContext:(id)a3;
- (void)updateStoreWithEvent:(id)a3;
- (void)updateStoreWithEvent:(id)a3 context:(id)a4;
@end

@implementation SBEscrowOperationLogger

- (SBEscrowOperationLogger)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___ESADefaultStorageProvider);
  v4 = -[SBEscrowOperationLogger initWithStorageProvider:](self, "initWithStorageProvider:", v3);

  return v4;
}

- (SBEscrowOperationLogger)initWithStorageProvider:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SBEscrowOperationLogger;
  v6 = -[SBEscrowOperationLogger init](&v20, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.sbd.transactionStore.updates", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.sbd.transactionStore.callbacks", v12);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v13;

    v6->_hasIncompleteActivities = 1;
    currentLog = v6->_currentLog;
    v6->_currentLog = 0LL;

    objc_storeStrong((id *)&v6->_storageProvider, a3);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    observers = v6->_observers;
    v6->_observers = v16;

    v18 = v6;
  }

  return v6;
}

- (id)addObserverBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[ESACallbackContainer initWithCallback:]( objc_alloc(&OBJC_CLASS___ESACallbackContainer),  "initWithCallback:",  v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLogger addObserver:](self, "addObserver:", v5));
  return v6;
}

- (id)addOneShotObserverBlock:(id)a3
{
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2020000000LL;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006A50;
  v7[3] = &unk_100068E88;
  dispatch_queue_t v9 = v10;
  id v4 = a3;
  id v8 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SBEscrowOperationLogger addObserverBlock:](self, "addObserverBlock:", v7));

  _Block_object_dispose(v10, 8);
  return v5;
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006B38;
  block[3] = &unk_100068EB0;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006C38;
  block[3] = &unk_100068EB0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateStoreWithEvent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_100006DB4;
  v18[4] = sub_100006DC4;
  id v19 = (id)0xAAAAAAAAAAAAAAAALL;
  id v19 = (id)os_transaction_create("com.apple.sbd.UpdateEscrowLogStore");
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100006DCC;
  v11[3] = &unk_100068F28;
  objc_copyWeak(&v16, &location);
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  v15 = v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);
}

- (void)updateStoreWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ESADefaultOperationLoggingContext);
  -[SBEscrowOperationLogger updateStoreWithEvent:context:](self, "updateStoreWithEvent:context:", v4, v5);
}

- (void)updateExistingOperationsWithContext:(id)a3
{
}

- (void)updateExistingOperations
{
  v3 = objc_alloc_init(&OBJC_CLASS___ESADefaultOperationLoggingContext);
  -[SBEscrowOperationLogger updateExistingOperationsWithContext:](self, "updateExistingOperationsWithContext:", v3);
}

- (SecureBackupLog)currentLog
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100006DB4;
  id v10 = sub_100006DC4;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000071FC;
  v5[3] = &unk_100068F50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SecureBackupLog *)v3;
}

- (void).cxx_destruct
{
}

@end