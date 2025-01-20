@interface AXAssetsActivityTransactionManager
- (AXAssetsActivityTransactionManager)init;
- (AXAssetsActivityTransactionManagerDelegate)delegate;
- (OS_os_transaction)transaction;
- (void)_queue_addActiveReason:(id)a3;
- (void)_queue_handleInactiveTimerFired;
- (void)_queue_removeActiveReason:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransaction:(id)a3;
- (void)simpleTaskFinished:(id)a3;
- (void)simpleTaskStarted:(id)a3;
@end

@implementation AXAssetsActivityTransactionManager

- (AXAssetsActivityTransactionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AXAssetsActivityTransactionManager;
  v2 = -[AXAssetsActivityTransactionManager init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("AXAssetsActivityTransactionManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    queue_activeReasons = v2->_queue_activeReasons;
    v2->_queue_activeReasons = (NSMutableArray *)v7;

    v9 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  v2->_queue);
    queue_activityTimer = v2->_queue_activityTimer;
    v2->_queue_activityTimer = v9;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v2->_queue_activityTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  return v2;
}

- (void)simpleTaskStarted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FF80;
  block[3] = &unk_100020828;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)simpleTaskFinished:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010008;
  v7[3] = &unk_100020828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_queue_addActiveReason:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray containsObject:](self->_queue_activeReasons, "containsObject:", v4);
  if ((_DWORD)v5)
  {
    uint64_t v6 = AXLogAssetDaemon(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100015370((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_4:

    goto LABEL_9;
  }

  -[AXDispatchTimer cancel](self->_queue_activityTimer, "cancel");
  id v14 = -[NSMutableArray count](self->_queue_activeReasons, "count");
  uint64_t v15 = AXLogAssetDaemon(-[NSMutableArray addObject:](self->_queue_activeReasons, "addObject:", v4));
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = -[NSMutableArray count](self->_queue_activeReasons, "count");
    int v21 = 138412546;
    id v22 = v4;
    __int16 v23 = 2048;
    id v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "AXATM: Added active reason: '%@'. Reason count=%ld",  (uint8_t *)&v21,  0x16u);
  }

  if (!v14 && !self->_queue_transitioningToIdle)
  {
    uint64_t v19 = AXLogAssetDaemon(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "AXATM: Will begin os_transaction",  (uint8_t *)&v21,  2u);
    }

    uint64_t v7 = (os_log_s *)os_transaction_create("AXAssetsActivityTransactionManager");
    -[AXAssetsActivityTransactionManager setTransaction:](self, "setTransaction:", v7);
    goto LABEL_4;
  }

- (void)_queue_removeActiveReason:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray containsObject:](self->_queue_activeReasons, "containsObject:", v4);
  if ((v5 & 1) != 0)
  {
    uint64_t v6 = AXLogAssetDaemon(-[NSMutableArray removeObject:](self->_queue_activeReasons, "removeObject:", v4));
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = -[NSMutableArray count](self->_queue_activeReasons, "count");
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = (uint64_t)v4;
      __int16 v23 = 2048;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AXATM: Removed active reason: '%@'. Reason count=%ld",  buf,  0x16u);
    }

    if (!-[NSMutableArray count](self->_queue_activeReasons, "count"))
    {
      uint64_t v9 = AXLogAssetDaemon(0LL);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = 0x4020000000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AXATM: No active reasons remain. Beginning timer of %.2f seconds before we go inactive",  buf,  0xCu);
      }

      queue_activityTimer = self->_queue_activityTimer;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100010364;
      v20[3] = &unk_1000209B8;
      v20[4] = self;
      -[AXDispatchTimer afterDelay:processBlock:cancelBlock:]( queue_activityTimer,  "afterDelay:processBlock:cancelBlock:",  v20,  0LL,  8.0);
    }
  }

  else
  {
    uint64_t v12 = AXLogAssetDaemon(v5);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000153D8((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_queue_handleInactiveTimerFired
{
  uint64_t v3 = AXLogAssetDaemon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "AXATM: Inactive timer fired. Will give delegate a chance to clean up and then transition to idle",  (uint8_t *)buf,  2u);
  }

  self->_queue_transitioningToIdle = 1;
  objc_initWeak(buf, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsActivityTransactionManager delegate](self, "delegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010488;
  v6[3] = &unk_100020770;
  objc_copyWeak(&v7, buf);
  [v5 willBecomeIdle:self completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (AXAssetsActivityTransactionManagerDelegate)delegate
{
  return (AXAssetsActivityTransactionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end