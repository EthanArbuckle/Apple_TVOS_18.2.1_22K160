@interface RMStatusEngine
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMDebounceTimer)debouncer;
- (RMStatusEngine)initWithManagementSourceObjectID:(id)a3 statusQuerier:(id)a4 inContext:(id)a5;
- (RMStatusEngineDelegate)delegate;
- (RMStatusQuerier)statusQuerier;
- (id)_queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:(BOOL)a3;
- (id)_queryForStatusWithLastReceivedDateByKeyPath:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4;
- (id)queryForStatusSubscriptions;
- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3;
- (id)queryForStatusSubscriptionsWithKeyPaths:(id)a3;
- (id)queryForStatusWithKeyPaths:(id)a3;
- (id)queryForUnacknowledgedStatusSubscriptions;
- (void)_notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded;
- (void)_statusDidChange:(id)a3;
- (void)_subscribeToStatusKeyPaths:(id)a3 sourceType:(signed __int16)a4;
- (void)acknowledgeStatusSubscriptions:(id)a3;
- (void)clearAllLastAcknowledgedDate;
- (void)implicitlySubscribeToStatusKeyPaths:(id)a3;
- (void)setContext:(id)a3;
- (void)setDebouncer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagementSourceObjectID:(id)a3;
- (void)setStatusQuerier:(id)a3;
- (void)start;
- (void)subscribeToStatusKeyPathsThenStopAfterAcknowledged:(id)a3;
@end

@implementation RMStatusEngine

- (RMStatusEngine)initWithManagementSourceObjectID:(id)a3 statusQuerier:(id)a4 inContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RMStatusEngine;
  v12 = -[RMStatusEngine init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a5);
    objc_storeStrong((id *)&v13->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v13->_statusQuerier, a4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[RMDebounceTimer debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:]( &OBJC_CLASS___RMDebounceTimer,  "debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:",  v13,  @"RMStatusEngine",  5.0,  60.0));
    debouncer = v13->_debouncer;
    v13->_debouncer = (RMDebounceTimer *)v14;
  }

  return v13;
}

- (void)start
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10005B7B4(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 addObserver:self selector:"_statusDidChange:" name:@"RMSubscribedStatusKeyPathDidChangeNotification" object:0];

  -[RMStatusEngine _notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded]( self,  "_notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Started status engine...", v13, 2u);
  }
}

- (void)_statusDidChange:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"RMUserInfoKeyUpdatedManagementSourceObjectIDs"]);
  if (!v4
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusEngine managementSourceObjectID](self, "managementSourceObjectID")),
        unsigned int v6 = [v4 containsObject:v5],
        v5,
        v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusEngine debouncer](self, "debouncer"));
    [v7 trigger];
  }
}

- (void)_notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusEngine managementSourceObjectID](self, "managementSourceObjectID"));
  id v5 = v3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_10005B6A0;
  v22 = &unk_1000BA2B0;
  id v6 = v4;
  id v23 = v6;
  v24 = &v25;
  [v5 performBlockAndWait:&v19];
  int v7 = *((unsigned __int8 *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine", v19, v20, v21, v22));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10005B7E4(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusEngine delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v16, "statusEngineHasUnacknowledgedSubscription:") & 1) != 0)
    {
      objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Notifying delegate of unacknowledged status subscriptions...",  (uint8_t *)&v19,  2u);
      }

      [v16 statusEngineHasUnacknowledgedSubscription:self];
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Notified delegate of unacknowledged status subscriptions.",  (uint8_t *)&v19,  2u);
      }
    }
  }

- (id)queryForUnacknowledgedStatusSubscriptions
{
  return -[RMStatusEngine _queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:]( self,  "_queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:",  1LL);
}

- (id)queryForStatusSubscriptions
{
  return -[RMStatusEngine _queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:]( self,  "_queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:",  0LL);
}

- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100058E28;
  v21 = sub_100058E38;
  id v22 = 0LL;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_100058E40;
  uint64_t v12 = &unk_1000B9D28;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  id v13 = v5;
  uint64_t v14 = self;
  id v6 = v4;
  id v15 = v6;
  v16 = &v17;
  [v5 performBlockAndWait:&v9];
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusEngine _queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:]( self,  "_queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:",  v18[5],  0LL,  v9,  v10,  v11,  v12));

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (id)queryForStatusWithKeyPaths:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100058E28;
  v30 = sub_100058E38;
  id v31 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100059374;
  v21[3] = &unk_1000B9D28;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  id v22 = v5;
  id v23 = self;
  id v6 = v4;
  id v24 = v6;
  uint64_t v25 = &v26;
  [v5 performBlockAndWait:v21];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "objectForKeyedSubscript:", v11, (void)v17));
        BOOL v13 = v12 == 0LL;

        if (v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
          [(id)v27[5] setObject:v14 forKeyedSubscript:v11];
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v32 count:16];
    }

    while (v8);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusEngine _queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:]( self,  "_queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:",  v27[5],  0LL));
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (id)queryForStatusSubscriptionsWithKeyPaths:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  __int128 v20 = sub_100058E28;
  v21 = sub_100058E38;
  id v22 = 0LL;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_100059788;
  uint64_t v12 = &unk_1000B9D28;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  id v13 = v5;
  uint64_t v14 = self;
  id v6 = v4;
  id v15 = v6;
  v16 = &v17;
  [v5 performBlockAndWait:&v9];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusEngine _queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:]( self,  "_queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:",  v18[5],  0LL,  v9,  v10,  v11,  v12));

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (void)clearAllLastAcknowledgedDate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100059AE8;
  v4[3] = &unk_1000B90A0;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  id v6 = self;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (id)_queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:(BOOL)a3
{
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100058E28;
  id v23 = sub_100058E38;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_100058E28;
  uint64_t v17 = sub_100058E38;
  id v18 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100059EFC;
  v7[3] = &unk_1000B9D00;
  BOOL v12 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  id v8 = v4;
  uint64_t v9 = self;
  uint64_t v10 = &v13;
  uint64_t v11 = &v19;
  [v4 performBlockAndWait:v7];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusEngine _queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:]( self,  "_queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:",  v20[5],  v14[5]));

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v5;
}

- (id)_queryForStatusWithLastReceivedDateByKeyPath:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    __int128 v20 = sub_100058E28;
    uint64_t v21 = sub_100058E38;
    id v22 = 0LL;
    context = self->_context;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005A6A8;
    v16[3] = &unk_1000BA2B0;
    v16[4] = self;
    v16[5] = &v17;
    -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v16);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusEngine statusQuerier](self, "statusQuerier"));
    if (v7) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( [v11 queryForUnacknowledgedStatusWithKeyPaths:v10 lastAcknowledgedDateByKeyPath:v7 onBehalfOfManagementChannel:v18[5]]);
    }
    else {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 queryForStatusWithKeyPaths:v10 onBehalfOfManagementChannel:v18[5]]);
    }
    uint64_t v14 = (void *)v12;

    uint64_t v13 = -[RMStatusSubscriptionQueryResult initWithQueryResult:lastReceivedDateByKeyPath:]( objc_alloc(&OBJC_CLASS___RMStatusSubscriptionQueryResult),  "initWithQueryResult:lastReceivedDateByKeyPath:",  v14,  v6);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    uint64_t v13 = objc_opt_new(&OBJC_CLASS___RMStatusSubscriptionQueryResult);
  }

  return v13;
}

- (void)acknowledgeStatusSubscriptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 statusKeyPaths]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingSelector:"localizedCompare:"]);

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10005B94C(v7);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005A86C;
  v12[3] = &unk_1000BA820;
  id v13 = v4;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
  uint64_t v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v14;
  id v11 = v4;
  [v10 performBlockAndWait:v12];
}

- (RMStatusEngineDelegate)delegate
{
  return (RMStatusEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void)setManagementSourceObjectID:(id)a3
{
}

- (RMStatusQuerier)statusQuerier
{
  return self->_statusQuerier;
}

- (void)setStatusQuerier:(id)a3
{
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)implicitlySubscribeToStatusKeyPaths:(id)a3
{
}

- (void)subscribeToStatusKeyPathsThenStopAfterAcknowledged:(id)a3
{
}

- (void)_subscribeToStatusKeyPaths:(id)a3 sourceType:(signed __int16)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusEngine](&OBJC_CLASS___RMLog, "statusEngine"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10005BAAC(v6);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005AEF8;
    v9[3] = &unk_1000BA848;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusEngine context](self, "context"));
    id v11 = self;
    signed __int16 v13 = a4;
    id v12 = v6;
    id v8 = v10;
    [v8 performBlockAndWait:v9];
  }
}

@end