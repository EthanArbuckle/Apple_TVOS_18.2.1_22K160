@interface ACCPlatformTransactionManager
+ (id)sharedManager;
- (ACCPlatformTransactionManager)init;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_queue)transactionsLock;
- (OS_dispatch_source)timerSource;
- (void)addTransactionForConnectionUUID:(id)a3;
- (void)dealloc;
- (void)removeTransactionForConnectionUUID:(id)a3;
- (void)setTimerQueue:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)setTransactions:(id)a3;
- (void)setTransactionsLock:(id)a3;
@end

@implementation ACCPlatformTransactionManager

- (ACCPlatformTransactionManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ACCPlatformTransactionManager;
  id v2 = -[ACCPlatformTransactionManager init](&v15, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessoryd.transactionsListLock", 0LL);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessoryd.lastTransactionTimerQueue", 0LL);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 3));
    v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    v11 = (dispatch_source_s *)*((void *)v2 + 4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __37__ACCPlatformTransactionManager_init__block_invoke;
    handler[3] = &unk_1001F96F8;
    id v14 = v2;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 4), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume(*((dispatch_object_t *)v2 + 4));
  }

  return (ACCPlatformTransactionManager *)v2;
}

void __37__ACCPlatformTransactionManager_init__block_invoke(uint64_t a1)
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactionsLock]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __37__ACCPlatformTransactionManager_init__block_invoke_2;
  block[3] = &unk_1001F96F8;
  id v4 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);
}

void __37__ACCPlatformTransactionManager_init__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactions]);
  id v3 = [v2 count];

  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    v6 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[#Transactions] lastTransactionTimer FIRED!! count: %lu",  (uint8_t *)&v11,  0xCu);
  }

  if (v3 == (id)1)
  {
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([*v1 transactions]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.accessoryd.daemonDirty"));
    [v7 removeObjectForKey:v8];
  }

  if (gLogObjects && gNumLogObjects >= 7)
  {
    dispatch_source_t v9 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    dispatch_source_t v9 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(v1);
  }

  dispatch_source_set_timer(*((dispatch_source_t *)*v1 + 4), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource) {
    dispatch_source_cancel((dispatch_source_t)timerSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ACCPlatformTransactionManager;
  -[ACCPlatformTransactionManager dealloc](&v4, "dealloc");
}

- (void)addTransactionForConnectionUUID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCPlatformTransactionManager transactionsLock](self, "transactionsLock"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke;
    block[3] = &unk_1001F9798;
    id v7 = v5;
    v8 = self;
    dispatch_sync(v4, block);
  }
}

void __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithUTF8String:]( &OBJC_CLASS___NSMutableString,  "stringWithUTF8String:",  "com.apple.accessoryd."));
  uint64_t v3 = a1 + 32;
  [v2 appendString:*(void *)(a1 + 32)];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    v6 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v29 = 138412290;
    v30 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[#Transactions] transactionIDKey %@",  (uint8_t *)&v29,  0xCu);
  }

  v8 = *(void **)(a1 + 40);
  id v7 = (id *)(a1 + 40);
  dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transactions]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v2]);

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      int v11 = (os_log_s *)*(id *)(gLogObjects + 48);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v11 = (os_log_s *)&_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke_cold_3( v3,  v11,  v13,  v14,  v15,  v16,  v17,  v18);
    }
  }

  id v19 = v2;
  v20 = (void *)os_transaction_create([v19 UTF8String]);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([*v7 transactions]);
    [v21 setObject:v20 forKey:v19];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([*v7 transactions]);
  id v23 = [v22 count];

  if (v23 == (id)1)
  {
    v24 = (void *)os_transaction_create("com.apple.accessoryd.daemonDirty");
    v25 = (void *)objc_claimAutoreleasedReturnValue([*v7 transactions]);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.accessoryd.daemonDirty"));
    [v25 setObject:v24 forKey:v26];
  }

  if (gLogObjects && gNumLogObjects >= 7)
  {
    v27 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v27 = (os_log_s *)&_os_log_default;
    id v28 = &_os_log_default;
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(v7);
  }
}

- (void)removeTransactionForConnectionUUID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCPlatformTransactionManager transactionsLock](self, "transactionsLock"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke;
    block[3] = &unk_1001F9798;
    id v7 = v5;
    v8 = self;
    dispatch_sync(v4, block);
  }
}

void __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithUTF8String:]( &OBJC_CLASS___NSMutableString,  "stringWithUTF8String:",  "com.apple.accessoryd."));
  uint64_t v3 = a1 + 32;
  [v2 appendString:*(void *)(a1 + 32)];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    v6 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412290;
    id v28 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[#Transactions] transactionIDKey %@",  (uint8_t *)&v27,  0xCu);
  }

  v8 = *(void **)(a1 + 40);
  id v7 = (id *)(a1 + 40);
  dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 transactions]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v2]);

  if (v10)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([*v7 transactions]);
    [v11 removeObjectForKey:v2];
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v11 = *(id *)(gLogObjects + 48);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v11 = &_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke_cold_4( v3,  (os_log_s *)v11,  v13,  v14,  v15,  v16,  v17,  v18);
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([*v7 transactions]);
  id v20 = [v19 count];

  if (v20 == (id)1)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v21 = (os_log_s *)*(id *)(gLogObjects + 48);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v21 = (os_log_s *)&_os_log_default;
      id v22 = &_os_log_default;
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "[#Transactions] starting lastTransactionTimer!!",  (uint8_t *)&v27,  2u);
    }

    id v23 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*v7 timerSource]);
    dispatch_time_t v24 = dispatch_walltime(0LL, 60000000000LL);
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  if (gLogObjects && gNumLogObjects >= 7)
  {
    v25 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v25 = (os_log_s *)&_os_log_default;
    id v26 = &_os_log_default;
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(v7);
  }
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __46__ACCPlatformTransactionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_once_8 != -1) {
    dispatch_once(&sharedManager_once_8, block);
  }
  return (id)sharedManager_sharedInstance_8;
}

void __46__ACCPlatformTransactionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedManager_sharedInstance_8;
  sharedManager_sharedInstance_8 = (uint64_t)v1;
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (OS_dispatch_queue)transactionsLock
{
  return self->_transactionsLock;
}

- (void)setTransactionsLock:(id)a3
{
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
}

void __37__ACCPlatformTransactionManager_init__block_invoke_2_cold_1(id *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 transactions]);
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "[#Transactions] transactions: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __65__ACCPlatformTransactionManager_addTransactionForConnectionUUID___block_invoke_cold_3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __68__ACCPlatformTransactionManager_removeTransactionForConnectionUUID___block_invoke_cold_4( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end