@interface CSDTransactionManager
+ (CSDTransactionManager)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (CSDTransactionManager)initWithQueue:(id)a3;
- (NSMapTable)openTransactions;
- (OS_dispatch_queue)queue;
- (void)beginTransactionIfNecessaryForObject:(id)a3 withReason:(id)a4;
- (void)dealloc;
- (void)endTransactionIfNecessaryForObject:(id)a3;
- (void)handleCallStatusChanged:(id)a3;
- (void)handleSessionStateChanged:(id)a3;
@end

@implementation CSDTransactionManager

+ (CSDTransactionManager)sharedInstance
{
  return (CSDTransactionManager *)+[CSDTransactionManager sharedInstanceWithQueue:]( &OBJC_CLASS___CSDTransactionManager,  "sharedInstanceWithQueue:",  0LL);
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000AD80;
  v8[3] = &unk_1003D7708;
  id v9 = a3;
  id v10 = a1;
  uint64_t v4 = qword_10044CDF8;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_10044CDF8, v8);
  }
  id v6 = (id)qword_10044CDF0;

  return v6;
}

- (CSDTransactionManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CSDTransactionManager;
  id v5 = -[CSDTransactionManager init](&v30, "init");
  if (v5)
  {
    if (v4)
    {
      id v6 = (OS_dispatch_queue *)v4;
      queue = v5->_queue;
      v5->_queue = v6;
    }

    else
    {
      v8 = &_dispatch_main_q;
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)&_dispatch_main_q;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    openTransactions = v5->_openTransactions;
    v5->_openTransactions = (NSMapTable *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v5 selector:"handleCallStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v5 selector:"handleCallStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v5 selector:"handleSessionStateChanged:" name:@"CSDIDSDualSessionStateChangedNotification" object:0];

    -[CSDTransactionManager beginTransactionIfNecessaryForObject:withReason:]( v5,  "beginTransactionIfNecessaryForObject:withReason:",  v5,  @"CSDTransactionManager");
    dispatch_time_t v14 = dispatch_time(0LL, 10000000000LL);
    v15 = (dispatch_queue_s *)v5->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B07C;
    block[3] = &unk_1003D7730;
    v16 = v5;
    v29 = v16;
    dispatch_after(v14, v15, block);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance", 0LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _allCalls]);

    id v19 = [v18 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          -[CSDTransactionManager beginTransactionIfNecessaryForObject:withReason:]( v16,  "beginTransactionIfNecessaryForObject:withReason:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v22),  @"TUCallCenter_allCalls");
          v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }

      while (v20);
    }
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDTransactionManager;
  -[CSDTransactionManager dealloc](&v4, "dealloc");
}

- (void)beginTransactionIfNecessaryForObject:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);

    if (!v10)
    {
      id v11 = objc_claimAutoreleasedReturnValue( [@"com.apple.calls.callservicesd." stringByAppendingFormat:@"%@:%@", v7, v6]);
      v12 = (void *)os_transaction_create([v11 UTF8String]);

      id v13 = sub_1001704C4();
      dispatch_time_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
        *(_DWORD *)buf = 138412802;
        id v18 = v6;
        __int16 v19 = 2048;
        id v20 = [v15 count];
        __int16 v21 = 2112;
        v22 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning transaction for %@. Transaction count is now %lu. Added transaction: %@",  buf,  0x20u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
      [v16 setObject:v12 forKey:v6];
    }
  }
}

- (void)endTransactionIfNecessaryForObject:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
      [v10 removeObjectForKey:v4];

      id v11 = sub_1001704C4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager openTransactions](self, "openTransactions"));
        int v14 = 138412802;
        id v15 = v4;
        __int16 v16 = 2048;
        id v17 = [v13 count];
        __int16 v18 = 2112;
        __int16 v19 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Ending transaction for %@. Transaction count is now %lu. Ended transaction: %@",  (uint8_t *)&v14,  0x20u);
      }
    }
  }
}

- (void)handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  else {
    -[CSDTransactionManager beginTransactionIfNecessaryForObject:withReason:]( self,  "beginTransactionIfNecessaryForObject:withReason:",  v6,  @"handleCallStatusChanged");
  }
}

- (void)handleSessionStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTransactionManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B524;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSMapTable)openTransactions
{
  return self->_openTransactions;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end