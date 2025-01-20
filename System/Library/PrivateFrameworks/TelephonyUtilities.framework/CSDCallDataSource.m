@interface CSDCallDataSource
+ (Class)callClass;
- (BOOL)shouldRegisterCall:(id)a3;
- (BOOL)shouldTrackCall:(id)a3;
- (CSDCallDataSource)init;
- (CSDCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4;
- (CSDCallStateController)callStateController;
- (NSArray)calls;
- (NSMapTable)uniqueProxyIdentifierToCallTable;
- (NSMutableOrderedSet)currentCallSet;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)uniqueProxyIdentifierToCallTableSemaphore;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)_postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5;
- (void)disconnectAllCalls:(id)a3 withReason:(int)a4;
- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4;
- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6;
- (void)disconnectCalls:(id)a3 withReason:(int)a4 whileHoldingCalls:(id)a5 andUnholdingCalls:(id)a6 andUngroupingCalls:(id)a7;
- (void)groupCalls:(id)a3 withCalls:(id)a4;
- (void)handleBytesOfDataUsedChanged:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5;
- (void)handleCallStatusChanged:(id)a3;
- (void)handleFrequencyDataChanged:(id)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)handleMeterLevelChanged:(float)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4;
- (void)postClientNotificationName:(id)a3;
- (void)postClientNotificationName:(id)a3 forCall:(id)a4;
- (void)postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5;
- (void)registerCall:(id)a3;
- (void)setCurrentCallSet:(id)a3;
- (void)setTTYType:(int)a3 forCalls:(id)a4;
- (void)setUniqueProxyIdentifierToCallTable:(id)a3;
- (void)setUniqueProxyIdentifierToCallTableSemaphore:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4;
- (void)startTrackingCall:(id)a3;
- (void)stopTrackingCall:(id)a3;
- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4;
@end

@implementation CSDCallDataSource

- (CSDCallDataSource)init
{
  return -[CSDCallDataSource initWithCallStateController:queue:]( self,  "initWithCallStateController:queue:",  0LL,  &_dispatch_main_q);
}

- (CSDCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CSDCallDataSource;
  v8 = -[CSDCallDataSource init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_callStateController, v6);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    uniqueProxyIdentifierToCallTable = v9->_uniqueProxyIdentifierToCallTable;
    v9->_uniqueProxyIdentifierToCallTable = (NSMapTable *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(1LL);
    uniqueProxyIdentifierToCallTableSemaphore = v9->_uniqueProxyIdentifierToCallTableSemaphore;
    v9->_uniqueProxyIdentifierToCallTableSemaphore = (OS_dispatch_semaphore *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    currentCallSet = v9->_currentCallSet;
    v9->_currentCallSet = (NSMutableOrderedSet *)v14;
  }

  return v9;
}

- (NSArray)calls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource currentCallSet](self, "currentCallSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 array]);
  id v4 = [v3 copy];

  return (NSArray *)v4;
}

+ (Class)callClass
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:a1 file:@"CSDCallDataSource.m" lineNumber:52 description:@"All CSDCallDataSource subclasses must override +callClass"];

  return 0LL;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSource uniqueProxyIdentifierToCallTableSemaphore]( self,  "uniqueProxyIdentifierToCallTableSemaphore"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource uniqueProxyIdentifierToCallTable](self, "uniqueProxyIdentifierToCallTable"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSource uniqueProxyIdentifierToCallTableSemaphore]( self,  "uniqueProxyIdentifierToCallTableSemaphore"));
  dispatch_semaphore_signal(v8);

  return v7;
}

- (BOOL)shouldTrackCall:(id)a3
{
  id v4 = a3;
  if ([v4 status] == 6 || !objc_msgSend(v4, "status"))
  {
    char isKindOfClass = 0;
  }

  else
  {
    id v6 = objc_msgSend((id)objc_opt_class(self, v5), "callClass");
    char isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  }

  return isKindOfClass & 1;
}

- (BOOL)shouldRegisterCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource currentCallSet](self, "currentCallSet"));
  BOOL v6 = ([v5 containsObject:v4] & 1) != 0
    || -[CSDCallDataSource shouldTrackCall:](self, "shouldTrackCall:", v4)
    || [v4 disconnectedReason] == 21;

  return v6;
}

- (void)registerCall:(id)a3
{
  id v9 = a3;
  if (-[CSDCallDataSource shouldTrackCall:](self, "shouldTrackCall:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    [v4 setCallDelegatesIfNeeded:v9];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource currentCallSet](self, "currentCallSet"));
    unsigned __int8 v6 = [v5 containsObject:v9];

    if ((v6 & 1) == 0) {
      -[CSDCallDataSource startTrackingCall:](self, "startTrackingCall:", v9);
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource currentCallSet](self, "currentCallSet"));
    unsigned int v8 = [v7 containsObject:v9];

    if (v8) {
      -[CSDCallDataSource stopTrackingCall:](self, "stopTrackingCall:", v9);
    }
  }
}

- (void)startTrackingCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource currentCallSet](self, "currentCallSet"));
  [v5 addObject:v4];

  unsigned __int8 v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSource uniqueProxyIdentifierToCallTableSemaphore]( self,  "uniqueProxyIdentifierToCallTableSemaphore"));
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource uniqueProxyIdentifierToCallTable](self, "uniqueProxyIdentifierToCallTable"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v7 setObject:v4 forKey:v8];

  id v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSource uniqueProxyIdentifierToCallTableSemaphore]( self,  "uniqueProxyIdentifierToCallTableSemaphore"));
  dispatch_semaphore_signal(v9);

  id v10 = sub_1001704C4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Started tracking call: %@",  (uint8_t *)&v12,  0xCu);
  }
}

- (void)stopTrackingCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource currentCallSet](self, "currentCallSet"));
  [v5 removeObject:v4];

  unsigned __int8 v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSource uniqueProxyIdentifierToCallTableSemaphore]( self,  "uniqueProxyIdentifierToCallTableSemaphore"));
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource uniqueProxyIdentifierToCallTable](self, "uniqueProxyIdentifierToCallTable"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v7 removeObjectForKey:v8];

  id v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSource uniqueProxyIdentifierToCallTableSemaphore]( self,  "uniqueProxyIdentifierToCallTableSemaphore"));
  dispatch_semaphore_signal(v9);

  id v10 = sub_1001704C4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stopped tracking call: %@",  (uint8_t *)&v12,  0xCu);
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_1001704C4();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Asked to answer call %@ while disconnecting calls %@ and holding calls %@",  buf,  0x20u);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v15 = v12;
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * (void)v19) hold];
        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v17);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v20 = v11;
  id v21 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      v24 = 0LL;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)v24), "disconnect", (void)v25);
        v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v22);
  }

  [v9 answerWithRequest:v10];
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6
{
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5
{
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5
{
}

- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v5;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to hold calls %@ while unholding calls %@",  buf,  0x16u);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v13) hold];
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v11);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v18), "unhold", (void)v19);
        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v16);
  }
}

- (void)groupCalls:(id)a3 withCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v5;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to group calls %@ with calls %@",  buf,  0x16u);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
        [v14 groupWithOtherCall:v15];
      }

      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v11);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        __int128 v21 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
      }

      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v18);
  }
}

- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to ungroup call %@ from other calls in group %@",  buf,  0x16u);
  }

  [v5 ungroup];
  if ([v6 count] == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    [v9 ungroup];
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect call %@ while ungrouping call %@",  buf,  0x16u);
  }

  id v13 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v12 = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  -[CSDCallDataSource disconnectCalls:withReason:whileHoldingCalls:andUnholdingCalls:andUngroupingCalls:]( self,  "disconnectCalls:withReason:whileHoldingCalls:andUnholdingCalls:andUngroupingCalls:",  v10,  0LL,  &__NSArray0__struct,  &__NSArray0__struct,  v11);
}

- (void)disconnectAllCalls:(id)a3 withReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect all calls %@",  (uint8_t *)&v9,  0xCu);
  }

  -[CSDCallDataSource disconnectCalls:withReason:whileHoldingCalls:andUnholdingCalls:andUngroupingCalls:]( self,  "disconnectCalls:withReason:whileHoldingCalls:andUnholdingCalls:andUngroupingCalls:",  v6,  v4,  &__NSArray0__struct,  &__NSArray0__struct,  &__NSArray0__struct);
}

- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6
{
}

- (void)disconnectCalls:(id)a3 withReason:(int)a4 whileHoldingCalls:(id)a5 andUnholdingCalls:(id)a6 andUngroupingCalls:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = sub_1001704C4();
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v58 = v11;
    __int16 v59 = 2048;
    uint64_t v60 = (int)v10;
    __int16 v61 = 2112;
    id v62 = v12;
    __int16 v63 = 2112;
    id v64 = v13;
    __int16 v65 = 2112;
    id v66 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect calls %@ reason: %lu, while holding calls %@ and unholding calls %@ and ungrouping calls %@",  buf,  0x34u);
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v17 = v11;
  id v18 = [v17 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v50;
    do
    {
      __int128 v21 = 0LL;
      do
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * (void)v21) disconnectCallWithReason:v10];
        __int128 v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }

    while (v19);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v22 = v12;
  id v23 = [v22 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      __int128 v26 = 0LL;
      do
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * (void)v26) hold];
        __int128 v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }

    while (v24);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v27 = v13;
  id v28 = [v27 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v42;
    do
    {
      __int16 v31 = 0LL;
      do
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * (void)v31) unhold];
        __int16 v31 = (char *)v31 + 1;
      }

      while (v29 != v31);
      id v29 = [v27 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }

    while (v29);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v32 = v14;
  id v33 = [v32 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v38;
    do
    {
      id v36 = 0LL;
      do
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v32);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)v36), "ungroup", (void)v37);
        id v36 = (char *)v36 + 1;
      }

      while (v34 != v36);
      id v34 = [v32 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }

    while (v34);
  }
}

- (void)setTTYType:(int)a3 forCalls:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = v4;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to set TTY type to %d for calls %@",  buf,  0x12u);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "setTtyType:", v4, (void)v13);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v19 = v4;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to set uplink muted to %d for calls %@",  buf,  0x12u);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "setUplinkMuted:", v4, (void)v13);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "handleCallStatusChanged %@",  (uint8_t *)&v7,  0xCu);
  }

  [v4 propertiesChanged];
  -[CSDCallDataSource registerCall:](self, "registerCall:", v4);
}

- (void)handleBytesOfDataUsedChanged:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = sub_1001704C4();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218242;
    int64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "bytesOfDataUsed: %ld callHistoryIdentifier: %@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recentsController]);

  [v13 updateBytesOfDataUsed:a3 forCallWithUniqueProxyIdentifier:v9 callHistoryIdentifier:v8];
}

- (void)handleFrequencyDataChanged:(id)a3 inDirection:(int)a4 forCalls:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  [v10 updateClientsWithFrequency:v9 inDirection:v5 forCalls:v8];
}

- (void)handleMeterLevelChanged:(float)a3 inDirection:(int)a4 forCalls:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  *(float *)&double v9 = a3;
  [v10 updateClientsWithMeterLevel:v5 inDirection:v8 forCalls:v9];
}

- (void)postClientNotificationName:(id)a3
{
}

- (void)postClientNotificationName:(id)a3 forCall:(id)a4
{
}

- (void)postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5
{
}

- (void)_postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  [v11 sendClientsNotificationName:v10 forCall:v9 userInfo:v8];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallStateController)callStateController
{
  return (CSDCallStateController *)objc_loadWeakRetained((id *)&self->_callStateController);
}

- (NSMapTable)uniqueProxyIdentifierToCallTable
{
  return self->_uniqueProxyIdentifierToCallTable;
}

- (void)setUniqueProxyIdentifierToCallTable:(id)a3
{
}

- (OS_dispatch_semaphore)uniqueProxyIdentifierToCallTableSemaphore
{
  return self->_uniqueProxyIdentifierToCallTableSemaphore;
}

- (void)setUniqueProxyIdentifierToCallTableSemaphore:(id)a3
{
}

- (NSMutableOrderedSet)currentCallSet
{
  return self->_currentCallSet;
}

- (void)setCurrentCallSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end