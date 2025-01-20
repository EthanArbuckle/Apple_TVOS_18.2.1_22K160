@interface CSDUserActivityCommunicator
- (CSDUserActivity)currentlyBroadcastedActivity;
- (CSDUserActivityCommunicator)init;
- (CSDUserActivityCommunicatorDelegate)delegate;
- (NSMutableDictionary)listeningIdentifiersByActivityType;
- (NSMutableOrderedSet)activityQueue;
- (OS_dispatch_queue)queue;
- (UABestAppSuggestion)mostRecentBestAppSuggestion;
- (UABestAppSuggestionManager)bestAppSuggestionManager;
- (id)_untrackListenedActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4;
- (id)queuedActivitiesOfType:(unsigned int)a3;
- (void)_broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5;
- (void)_listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_stopBroadcastingActivity:(id)a3;
- (void)_stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4;
- (void)_stopListeningForBestAppSuggestionIfAppropriate;
- (void)_trackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_untrackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)_updateCurrentlyBroadcastedActivity;
- (void)bestAppSuggestionChanged:(id)a3;
- (void)broadcastActivity:(id)a3;
- (void)broadcastActivity:(id)a3 withTimeout:(double)a4;
- (void)broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5;
- (void)listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)setActivityQueue:(id)a3;
- (void)setBestAppSuggestionManager:(id)a3;
- (void)setCurrentlyBroadcastedActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListeningIdentifiersByActivityType:(id)a3;
- (void)setMostRecentBestAppSuggestion:(id)a3;
- (void)setQueue:(id)a3;
- (void)stopBroadcastingActivity:(id)a3;
- (void)stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4;
@end

@implementation CSDUserActivityCommunicator

- (CSDUserActivityCommunicator)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDUserActivityCommunicator;
  v2 = -[CSDUserActivityCommunicator init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.useractivitycommunicator", 0LL);
    -[CSDUserActivityCommunicator setQueue:](v2, "setQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    -[CSDUserActivityCommunicator setActivityQueue:](v2, "setActivityQueue:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[CSDUserActivityCommunicator setListeningIdentifiersByActivityType:]( v2,  "setListeningIdentifiersByActivityType:",  v5);

    v6 = objc_alloc_init(&OBJC_CLASS___UABestAppSuggestionManager);
    -[CSDUserActivityCommunicator setBestAppSuggestionManager:](v2, "setBestAppSuggestionManager:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator bestAppSuggestionManager](v2, "bestAppSuggestionManager"));
    [v7 setDelegate:v2];
  }

  return v2;
}

- (CSDUserActivity)currentlyBroadcastedActivity
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10011A78C;
  v11 = sub_10011A79C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10011A7A4;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CSDUserActivity *)v4;
}

- (id)queuedActivitiesOfType:(unsigned int)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_10011A78C;
  v14 = sub_10011A79C;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011A8B4;
  block[3] = &unk_1003DA7F8;
  unsigned int v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)broadcastActivity:(id)a3
{
}

- (void)broadcastActivity:(id)a3 withTimeout:(double)a4
{
}

- (void)broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5
{
  id v8 = a3;
  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10011AAD0;
  v11[3] = &unk_1003DA820;
  v11[4] = self;
  id v12 = v8;
  double v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)stopBroadcastingActivity:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011AB7C;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011AC28;
  block[3] = &unk_1003D9D80;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011ACD8;
  block[3] = &unk_1003D9D80;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011AD88;
  block[3] = &unk_1003D9D80;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)_updateCurrentlyBroadcastedActivity
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  currentlyBroadcastedActivity = self->_currentlyBroadcastedActivity;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator activityQueue](self, "activityQueue"));
  id v6 = (CSDUserActivity *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  if (currentlyBroadcastedActivity != v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator activityQueue](self, "activityQueue"));
    id v8 = (CSDUserActivity *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    unsigned int v9 = self->_currentlyBroadcastedActivity;
    self->_currentlyBroadcastedActivity = v8;

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivity userActivity](self->_currentlyBroadcastedActivity, "userActivity"));
    [v10 becomeCurrent];

    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = self->_currentlyBroadcastedActivity;
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updated currently broadcasted activity to %@",  (uint8_t *)&v14,  0xCu);
    }
  }

- (void)_broadcastActivity:(id)a3 withTimeout:(double)a4 shouldPrioritize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2048;
      double v25 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Queueing activity at beginning of queue: %@ (timeout: %f)",  buf,  0x16u);
    }

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator activityQueue](self, "activityQueue"));
    [v13 insertObject:v8 atIndex:0];
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2048;
      double v25 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Queueing activity at end of queue: %@ (timeout: %f)",  buf,  0x16u);
    }

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator activityQueue](self, "activityQueue"));
    [v13 addObject:v8];
  }

  if (a4 >= 0.0)
  {
    dispatch_time_t v14 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_10011B0C8;
    v19 = &unk_1003D7758;
    v20 = self;
    id v21 = v8;
    dispatch_after(v14, v15, &v16);
  }

  -[CSDUserActivityCommunicator _updateCurrentlyBroadcastedActivity]( self,  "_updateCurrentlyBroadcastedActivity",  v16,  v17,  v18,  v19,  v20);
}

- (void)_stopBroadcastingActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dequeueing activity: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator activityQueue](self, "activityQueue"));
  [v8 removeObject:v4];

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userActivity]);
  [v9 invalidate];

  -[CSDUserActivityCommunicator _updateCurrentlyBroadcastedActivity](self, "_updateCurrentlyBroadcastedActivity");
}

- (void)_listenForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    +[CSDUserActivity registerActivityType:dynamicIdentifier:]( &OBJC_CLASS___CSDUserActivity,  "registerActivityType:dynamicIdentifier:",  v4,  v6);
    -[CSDUserActivityCommunicator _trackListenedActivityType:dynamicIdentifier:]( self,  "_trackListenedActivityType:dynamicIdentifier:",  v4,  v6);
    unsigned int v8 = +[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:]( &OBJC_CLASS___CSDUserActivity,  "activityTypeRequiresBestAppSuggestionListener:",  v4);
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
        int v22 = 67109634;
        int v23 = v4;
        __int16 v24 = 2112;
        id v25 = v6;
        __int16 v26 = 2112;
        v27 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Registered to listen for activity type %d and dynamic identifier %@ and started listening for best app suggest ions, now tracking: %@",  (uint8_t *)&v22,  0x1Cu);
      }

      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator bestAppSuggestionManager](self, "bestAppSuggestionManager"));
      -[os_log_s startListeningForBestAppSuggestions](v10, "startListeningForBestAppSuggestions");
    }

    else if (v11)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
      int v22 = 67109634;
      int v23 = v4;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Registered to listen for activity type %d and dynamic identifier %@, now tracking: %@",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  else
  {
    id v13 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1002B6EF8(v10, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_stopListeningForActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  +[CSDUserActivity unregisterActivityType:dynamicIdentifier:]( &OBJC_CLASS___CSDUserActivity,  "unregisterActivityType:dynamicIdentifier:",  v4,  v6);
  -[CSDUserActivityCommunicator _untrackListenedActivityType:dynamicIdentifier:]( self,  "_untrackListenedActivityType:dynamicIdentifier:",  v4,  v6);
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    v11[0] = 67109634;
    v11[1] = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unregistered to listen for activity type %d and dynamic identifier %@, now tracking: %@",  (uint8_t *)v11,  0x1Cu);
  }

  if (+[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:]( &OBJC_CLASS___CSDUserActivity,  "activityTypeRequiresBestAppSuggestionListener:",  v4))
  {
    -[CSDUserActivityCommunicator _stopListeningForBestAppSuggestionIfAppropriate]( self,  "_stopListeningForBestAppSuggestionIfAppropriate");
  }
}

- (void)_stopListeningForActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator _untrackListenedActivityType:matchingDynamicIdentifierSubstring:]( self,  "_untrackListenedActivityType:matchingDynamicIdentifierSubstring:",  v4,  v6));
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v33 = v4;
      __int16 v34 = 2112;
      id v35 = v6;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unregistering dynamic identifiers of type %d, matching substring %@: %@",  buf,  0x1Cu);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          +[CSDUserActivity unregisterActivityType:dynamicIdentifier:]( &OBJC_CLASS___CSDUserActivity,  "unregisterActivityType:dynamicIdentifier:",  v4,  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v15),  (void)v27);
          uint64_t v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v13);
    }

    id v16 = sub_1001704C4();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
      *(_DWORD *)buf = 67109378;
      int v33 = v4;
      __int16 v34 = 2112;
      id v35 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unregistered to listen for activity type %d, now tracking: %@",  buf,  0x12u);
    }

    if (+[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:]( &OBJC_CLASS___CSDUserActivity,  "activityTypeRequiresBestAppSuggestionListener:",  v4))
    {
      -[CSDUserActivityCommunicator _stopListeningForBestAppSuggestionIfAppropriate]( self,  "_stopListeningForBestAppSuggestionIfAppropriate");
    }
  }

  else
  {
    id v19 = sub_1001704C4();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT)) {
      sub_1002B6F2C((os_log_s *)v11, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (void)_stopListeningForBestAppSuggestionIfAppropriate
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      int v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      if (+[CSDUserActivity activityTypeRequiresBestAppSuggestionListener:]( CSDUserActivity,  "activityTypeRequiresBestAppSuggestionListener:",  [v10 intValue]))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
        id v13 = [v12 count];

        if (v13) {
          break;
        }
      }

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:

    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Stopped listening for best app suggestions",  v16,  2u);
    }

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator bestAppSuggestionManager](self, "bestAppSuggestionManager"));
    [v5 stopListeningForBestAppSuggestions];
  }
}

- (void)_trackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v13 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
    [v12 addObject:v13];
  }

  else
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v13));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (void)_untrackListenedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v20 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
    id v13 = v12;
    if (v20) {
      objc_msgSend(v12, "removeObject:");
    }
    else {
      [v12 removeAllObjects];
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);
    id v17 = [v16 count];

    if (!v17)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
      [v18 setObject:0 forKeyedSubscript:v19];
    }
  }
}

- (id)_untrackListenedActivityType:(unsigned int)a3 matchingDynamicIdentifierSubstring:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v40 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
  uint64_t v9 = &OBJC_CLASS___IDSMessageContext_ptr;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);
    id v15 = [v14 copy];

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v42;
      id v38 = v6;
      uint64_t v39 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          if ([v21 containsString:v6])
          {
            [v40 addObject:v21];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
            uint64_t v23 = v9;
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9[50] numberWithUnsignedInt:v4]);
            id v25 = v18;
            id v26 = v16;
            __int128 v27 = self;
            uint64_t v28 = v4;
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v24]);
            [v29 removeObject:v21];

            uint64_t v4 = v28;
            self = v27;
            id v16 = v26;
            id v18 = v25;

            uint64_t v9 = v23;
            id v6 = v38;
            uint64_t v19 = v39;
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }

      while (v18);
    }

    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v9[50] numberWithUnsignedInt:v4]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v31]);
    int v33 = v9;
    id v34 = [v32 count];

    if (!v34)
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityCommunicator listeningIdentifiersByActivityType]( self,  "listeningIdentifiersByActivityType"));
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v33[50] numberWithUnsignedInt:v4]);
      [v35 setObject:0 forKeyedSubscript:v36];
    }
  }

  return v40;
}

- (void)bestAppSuggestionChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityCommunicator queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011BF98;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (CSDUserActivityCommunicatorDelegate)delegate
{
  return (CSDUserActivityCommunicatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableOrderedSet)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (void)setCurrentlyBroadcastedActivity:(id)a3
{
}

- (UABestAppSuggestionManager)bestAppSuggestionManager
{
  return self->_bestAppSuggestionManager;
}

- (void)setBestAppSuggestionManager:(id)a3
{
}

- (UABestAppSuggestion)mostRecentBestAppSuggestion
{
  return self->_mostRecentBestAppSuggestion;
}

- (void)setMostRecentBestAppSuggestion:(id)a3
{
}

- (NSMutableDictionary)listeningIdentifiersByActivityType
{
  return self->_listeningIdentifiersByActivityType;
}

- (void)setListeningIdentifiersByActivityType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end