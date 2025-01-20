@interface CSDRecentsController
- (BOOL)_canAddCallToCallHistory:(id)a3;
- (CHManager)recentsManager;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDIncomingCallFilter)incomingCallFilter;
- (CSDRecentsController)init;
- (CSDRecentsController)initWithCallCenterObserver:(id)a3 transactionManager:(id)a4 queue:(id)a5 chManager:(id)a6;
- (CSDRecentsController)initWithQueue:(id)a3 chManager:(id)a4;
- (CSDTransactionManager)transactionManager;
- (CSDUserNotificationDelegate)delegate;
- (NSMutableArray)transactionObjectsAwaitingCallHistory;
- (NSMutableDictionary)cachedCallUUIDsToConversationAVMode;
- (NSMutableDictionary)cachedCalls;
- (OS_dispatch_queue)queue;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (id)_callHistoryTransactionObjectWithIdentifier:(id)a3;
- (id)_conversationProviderForCall:(id)a3;
- (void)_addCallToCallHistory:(id)a3;
- (void)_addPendingCallToCallHistory:(id)a3;
- (void)_callHistoryChanged:(id)a3;
- (void)_endTransactionForObjectAfterCallHistoryDatabaseChanges:(id)a3;
- (void)_handleCallHistoryChanged;
- (void)callCenterObserver:(id)a3 callChanged:(id)a4;
- (void)clearNotificationsIfNecessary;
- (void)dealloc;
- (void)providersChangedForProviderManager:(id)a3;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)updateBytesOfDataUsed:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5;
@end

@implementation CSDRecentsController

- (CSDRecentsController)init
{
  return 0LL;
}

- (CSDRecentsController)initWithQueue:(id)a3 chManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___CSDCallCenterObserver);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDTransactionManager sharedInstanceWithQueue:]( &OBJC_CLASS___CSDTransactionManager,  "sharedInstanceWithQueue:",  v7));
  v10 = -[CSDRecentsController initWithCallCenterObserver:transactionManager:queue:chManager:]( self,  "initWithCallCenterObserver:transactionManager:queue:chManager:",  v8,  v9,  v7,  v6);

  return v10;
}

- (CSDRecentsController)initWithCallCenterObserver:(id)a3 transactionManager:(id)a4 queue:(id)a5 chManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (dispatch_queue_s *)a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CSDRecentsController;
  v15 = -[CSDRecentsController init](&v34, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_storeStrong((id *)&v16->_callCenterObserver, a3);
    -[CSDCallCenterObserver setTriggers:](v16->_callCenterObserver, "setTriggers:", 1LL);
    -[CSDCallCenterObserver setDelegate:](v16->_callCenterObserver, "setDelegate:", v16);
    objc_storeStrong((id *)&v16->_transactionManager, a4);
    objc_storeStrong((id *)&v16->_recentsManager, a6);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    transactionObjectsAwaitingCallHistory = v16->_transactionObjectsAwaitingCallHistory;
    v16->_transactionObjectsAwaitingCallHistory = (NSMutableArray *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cachedCalls = v16->_cachedCalls;
    v16->_cachedCalls = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cachedCallUUIDsToConversationAVMode = v16->_cachedCallUUIDsToConversationAVMode;
    v16->_cachedCallUUIDsToConversationAVMode = (NSMutableDictionary *)v21;

    v23 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v16->_featureFlags;
    v16->_featureFlags = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 addObserver:v16 selector:"_callHistoryChanged:" name:kCallHistoryDatabaseChangedNotification object:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v26 addObserver:v16 selector:"_addPendingCallToCallHistory:" name:@"CSDIDSPendingMessageDidReceiveCancelNotification" object:0];

    v27 = objc_alloc_init(&OBJC_CLASS___CSDIncomingCallFilter);
    incomingCallFilter = v16->_incomingCallFilter;
    v16->_incomingCallFilter = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    callProviderManager = v16->_callProviderManager;
    v16->_callProviderManager = v29;

    -[TUCallProviderManager addDelegate:queue:](v16->_callProviderManager, "addDelegate:queue:", v16, v13);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001165E8;
    block[3] = &unk_1003D7730;
    v33 = v16;
    dispatch_async(v13, block);
  }

  return v16;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRecentsController;
  -[CSDRecentsController dealloc](&v4, "dealloc");
}

- (void)_callHistoryChanged:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001166EC;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)clearNotificationsIfNecessary
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDRecentsController delegate](self, "delegate"));
  if (v8)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController recentsManager](self, "recentsManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CHRecentCall predicateForCallsWithStatusRead:]( &OBJC_CLASS___CHRecentCall,  "predicateForCallsWithStatusRead:",  0LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 callsWithPredicate:v5 limit:0 offset:0 batchSize:0]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"callerId"]);
    [v8 clearReadNotificationsIgnoringHandleIds:v7];
  }
}

- (void)updateBytesOfDataUsed:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218498;
    int64_t v22 = a3;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "bytesOfDataUsed: %ld uniqueProxyIdentifier: %@ callHistoryIdentifier: %@",  (uint8_t *)&v21,  0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController cachedCalls](self, "cachedCalls"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v8]);

  id v15 = sub_1001704C4();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      int v21 = 138412290;
      int64_t v22 = (int64_t)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Call still exists so updating its bytes of data used: %@",  (uint8_t *)&v21,  0xCu);
    }

    [v14 setBytesOfDataUsed:a3];
  }

  else
  {
    if (v17)
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No call still exists so updating bytes of data used via CHManager",  (uint8_t *)&v21,  2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController recentsManager](self, "recentsManager"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v18 updateBytesOfDataUsedFor:v9 with:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController _callHistoryTransactionObjectWithIdentifier:]( self,  "_callHistoryTransactionObjectWithIdentifier:",  v9));
    -[CSDRecentsController _endTransactionForObjectAfterCallHistoryDatabaseChanges:]( self,  "_endTransactionForObjectAfterCallHistoryDatabaseChanges:",  v20);
  }
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100116B50;
  v13[3] = &unk_1003D8F98;
  id v14 = v8;
  id v15 = v9;
  v16 = self;
  unint64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_addCallToCallHistory:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = -[CHRecentCall initWithCall:](objc_alloc(&OBJC_CLASS___CHRecentCall), "initWithCall:", v4);
  if (-[CHRecentCall mediaType](v6, "mediaType") == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController cachedCallUUIDsToConversationAVMode]( self,  "cachedCallUUIDsToConversationAVMode"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
    unsigned int v10 = [v9 intValue];

    if (v10 == 1) {
      -[CHRecentCall setMediaType:](v6, "setMediaType:", 1LL);
    }
  }

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Writing recent call to history: %@",  (uint8_t *)&v14,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController recentsManager](self, "recentsManager"));
  [v13 addToCallHistory:v6];
}

- (void)_addPendingCallToCallHistory:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CSDIDSPendingCallKey"]);
  id v6 = -[CHRecentCall initWithCall:](objc_alloc(&OBJC_CLASS___CHRecentCall), "initWithCall:", v5);
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Writing recent pending call to history: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController recentsManager](self, "recentsManager"));
  [v9 addToCallHistory:v6];
}

- (void)_handleCallHistoryChanged
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSDRecentsController clearNotificationsIfNecessary](self, "clearNotificationsIfNecessary");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController transactionObjectsAwaitingCallHistory]( self,  "transactionObjectsAwaitingCallHistory",  0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8);
        int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController transactionManager](self, "transactionManager"));
        [v10 endTransactionIfNecessaryForObject:v9];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController transactionObjectsAwaitingCallHistory]( self,  "transactionObjectsAwaitingCallHistory"));
  [v11 removeAllObjects];
}

- (id)_conversationProviderForCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 isConversation])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeConversationForCall:v4]);

    if (v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 provider]);
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)_canAddCallToCallHistory:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController _conversationProviderForCall:](self, "_conversationProviderForCall:", v4));
  if ([v4 supportsRecents])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    if (![v7 supportsRecents]
      || ([v4 isVoicemail] & 1) != 0
      || [v4 disconnectedReason] == 17)
    {
      LOBYTE(v8) = 0;
    }

    else
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController featureFlags](self, "featureFlags"));
      id v11 = [v10 groupFacetimeAsAServiceEnabled];
      if ((_DWORD)v11 && v6 && (id v11 = [v6 isDefaultProvider], !(_DWORD)v11)) {
        LOBYTE(v8) = 0;
      }
      else {
        int v8 = TUSimulatedModeEnabled(v11) ^ 1;
      }
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_callHistoryTransactionObjectWithIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  objc_opt_class(self, v5),  v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)_endTransactionForObjectAfterCallHistoryDatabaseChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding transaction object to transactionObjectsAwaitingCallHistory: %@",  buf,  0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController transactionObjectsAwaitingCallHistory]( self,  "transactionObjectsAwaitingCallHistory"));
  [v8 addObject:v4];

  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100117378;
  v12[3] = &unk_1003D7758;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v9, v10, v12);
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v24 = self;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 providers]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v4 count]));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    __int16 v25 = (void *)kCHServiceProviderTelephony;
    dispatch_time_t v9 = (void *)kCHServiceProviderFaceTime;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)i), "identifier", v24));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 faceTimeProvider]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        unsigned __int8 v14 = [v11 isEqualToString:v13];

        id v15 = v9;
        if ((v14 & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "telephonyProvider", v9));
          unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
          unsigned int v18 = [v11 isEqualToString:v17];

          if (v18) {
            id v15 = v25;
          }
          else {
            id v15 = v11;
          }
        }

        [v5 addObject:v15];
      }

      id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v7);
  }

  if ([v5 count])
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CHRecentCall predicateForCallsWithAnyServiceProviders:]( &OBJC_CLASS___CHRecentCall,  "predicateForCallsWithAnyServiceProviders:",  v19));
    int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v20));

    int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController recentsManager](v24, "recentsManager"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100117730;
    v27[3] = &unk_1003D97D0;
    id v28 = v21;
    id v23 = v21;
    [v22 deleteCallsWithPredicate:v23 completion:v27];
  }
}

- (void)callCenterObserver:(id)a3 callChanged:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "call: %@", (uint8_t *)&v25, 0xCu);
  }

  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueProxyIdentifier]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController _callHistoryTransactionObjectWithIdentifier:]( self,  "_callHistoryTransactionObjectWithIdentifier:",  v9));

  unsigned int v11 = [v5 status];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRecentsController cachedCalls](self, "cachedCalls"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueProxyIdentifier]);
  if (v11 != 6)
  {
    [v12 setObject:v5 forKeyedSubscript:v13];

    if ([v5 isConversation])
    {
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteParticipantHandles]);
      if ((unint64_t)[v14 count] < 2)
      {
LABEL_11:

        goto LABEL_12;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController cachedCallUUIDsToConversationAVMode]( self,  "cachedCallUUIDsToConversationAVMode"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueProxyIdentifier]);
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

      if (!v17)
      {
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v18 activeConversationForCall:v5]);

        if (v14)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v14 resolvedAudioVideoMode]));
          v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRecentsController cachedCallUUIDsToConversationAVMode]( self,  "cachedCallUUIDsToConversationAVMode"));
          int v21 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueProxyIdentifier]);
          [v20 setObject:v19 forKeyedSubscript:v21];
        }

        goto LABEL_11;
      }
    }

- (CSDIncomingCallFilter)incomingCallFilter
{
  return self->_incomingCallFilter;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (CSDTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (CHManager)recentsManager
{
  return self->_recentsManager;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDUserNotificationDelegate)delegate
{
  return (CSDUserNotificationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSMutableArray)transactionObjectsAwaitingCallHistory
{
  return self->_transactionObjectsAwaitingCallHistory;
}

- (NSMutableDictionary)cachedCalls
{
  return self->_cachedCalls;
}

- (NSMutableDictionary)cachedCallUUIDsToConversationAVMode
{
  return self->_cachedCallUUIDsToConversationAVMode;
}

- (void).cxx_destruct
{
}

@end