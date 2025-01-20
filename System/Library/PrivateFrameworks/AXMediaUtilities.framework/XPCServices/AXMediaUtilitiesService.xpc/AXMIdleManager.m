@interface AXMIdleManager
- (AXMIdleManager)init;
- (AXMIdleManagerDelegate)delegate;
- (OS_os_transaction)transaction;
- (void)_queue_addActiveReason:(id)a3;
- (void)_queue_removeActiveReason:(id)a3;
- (void)_queue_voiceOverActivityOccurred;
- (void)setDelegate:(id)a3;
- (void)setTransaction:(id)a3;
- (void)voiceOverActivityOccurred;
@end

@implementation AXMIdleManager

- (AXMIdleManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AXMIdleManager;
  v2 = -[AXMIdleManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXMIdleManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    queue_activeReasons = v2->_queue_activeReasons;
    v2->_queue_activeReasons = (NSMutableArray *)v5;

    v7 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  v2->_queue);
    queue_voiceOverActivityTimer = v2->_queue_voiceOverActivityTimer;
    v2->_queue_voiceOverActivityTimer = v7;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v2->_queue_voiceOverActivityTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  return v2;
}

- (void)voiceOverActivityOccurred
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __43__AXMIdleManager_voiceOverActivityOccurred__block_invoke;
  block[3] = &unk_100008268;
  block[4] = self;
  dispatch_async(queue, block);
}

id __43__AXMIdleManager_voiceOverActivityOccurred__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_voiceOverActivityOccurred");
}

- (void)_queue_voiceOverActivityOccurred
{
  if ((-[NSMutableArray containsObject:]( self->_queue_activeReasons,  "containsObject:",  @"VoiceOverActivity") & 1) == 0) {
    -[AXMIdleManager _queue_addActiveReason:](self, "_queue_addActiveReason:", @"VoiceOverActivity");
  }
  queue_voiceOverActivityTimer = self->_queue_voiceOverActivityTimer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __50__AXMIdleManager__queue_voiceOverActivityOccurred__block_invoke;
  v4[3] = &unk_100008268;
  v4[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:cancelBlock:]( queue_voiceOverActivityTimer,  "afterDelay:processBlock:cancelBlock:",  v4,  0LL,  180.0);
}

id __50__AXMIdleManager__queue_voiceOverActivityOccurred__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeActiveReason:", @"VoiceOverActivity");
}

- (void)_queue_addActiveReason:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_queue_activeReasons, "containsObject:", v4))
  {
    uint64_t v5 = AXMediaLogCommon();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXMIdleManager _queue_addActiveReason:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  id v13 = -[NSMutableArray count](self->_queue_activeReasons, "count");
  uint64_t v14 = AXMediaLogService(-[NSMutableArray addObject:](self->_queue_activeReasons, "addObject:", v4));
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    queue_activeReasons = self->_queue_activeReasons;
    int v21 = 138412546;
    id v22 = v4;
    __int16 v23 = 2112;
    v24 = queue_activeReasons;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Added activeReason: '%@'. all:[%@]",  (uint8_t *)&v21,  0x16u);
  }

  if (!v13 && !self->_queue_transitioningToIdle)
  {
    uint64_t v18 = AXMediaLogService(v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Will begin xpc transaction now",  (uint8_t *)&v21,  2u);
    }

    v20 = (void *)os_transaction_create([v4 UTF8String]);
    -[AXMIdleManager setTransaction:](self, "setTransaction:", v20);
  }
}

- (void)_queue_removeActiveReason:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_queue_activeReasons, "containsObject:", v4) & 1) == 0)
  {
    uint64_t v5 = AXMediaLogCommon();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXMIdleManager _queue_removeActiveReason:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  uint64_t v13 = AXMediaLogService(-[NSMutableArray removeObject:](self->_queue_activeReasons, "removeObject:", v4));
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    queue_activeReasons = self->_queue_activeReasons;
    *(_DWORD *)buf = 138412546;
    id v21 = v4;
    __int16 v22 = 2112;
    __int16 v23 = queue_activeReasons;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removed activeReason: '%@'. all:[%@]",  buf,  0x16u);
  }

  if (!-[NSMutableArray count](self->_queue_activeReasons, "count"))
  {
    uint64_t v16 = AXMediaLogService(0LL);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No activeReasons remain. Will transition to idle",  buf,  2u);
    }

    self->_queue_transitioningToIdle = 1;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AXMIdleManager delegate](self, "delegate"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __44__AXMIdleManager__queue_removeActiveReason___block_invoke;
    v19[3] = &unk_100008268;
    v19[4] = self;
    [v18 willBecomeIdle:self completion:v19];
  }
}

void __44__AXMIdleManager__queue_removeActiveReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(dispatch_queue_s **)(v1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__AXMIdleManager__queue_removeActiveReason___block_invoke_2;
  block[3] = &unk_100008268;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __44__AXMIdleManager__queue_removeActiveReason___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  uint64_t v3 = AXMediaLogService(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "activeReason added while transitioning to idle. aborting",  v6,  2u);
    }
  }

  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will end xpc transaction now", buf, 2u);
    }

    [*(id *)(a1 + 32) setTransaction:0];
  }

- (AXMIdleManagerDelegate)delegate
{
  return (AXMIdleManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void)_queue_addActiveReason:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_queue_removeActiveReason:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end