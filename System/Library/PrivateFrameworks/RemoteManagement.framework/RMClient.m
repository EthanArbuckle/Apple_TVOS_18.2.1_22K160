@interface RMClient
+ (id)_makeConduitWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (BOOL)_haltSyncing;
- (NSOperationQueue)operationQueue;
- (NSString)managementSourceIdentifier;
- (RMActivationEngine)activationEngine;
- (RMClient)initWithConduit:(id)a3 activationEngine:(id)a4 statusEngine:(id)a5 managementSourceIdentifier:(id)a6;
- (RMClient)initWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6;
- (RMClientDelegate)delegate;
- (RMConduit)conduit;
- (RMStatusEngine)statusEngine;
- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3;
- (void)_handleConduitError;
- (void)_processConduitErrorState:(signed __int16)a3;
- (void)_sendStatusQueryResultIfNeeded:(id)a3 fullReport:(BOOL)a4 completionHandler:(id)a5;
- (void)_setNeedsSyncing:(BOOL)a3;
- (void)_syncConduitOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_syncIfNeeded;
- (void)_syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)applyNowWithCompletionHandler:(id)a3;
- (void)conduitNeedsToSendStatusForKeyPaths:(id)a3;
- (void)conduitNeedsToSync:(id)a3;
- (void)enrollWithCompletionHandler:(id)a3;
- (void)reenrollWithCompletionHandler:(id)a3;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setActivationEngine:(id)a3;
- (void)setConduit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setStatusEngine:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)statusEngineHasUnacknowledgedSubscription:(id)a3;
- (void)syncIfNeededWithCompletionHandler:(id)a3;
- (void)syncWithCompletionHandler:(id)a3;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMClient

- (RMClient)initWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 newBackgroundContext];
  [v14 setAutomaticallyMergesChangesFromParent:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"conduit",  v10));
  [v14 setTransactionAuthor:v15];

  id v16 = v10;
  id v17 = [v11 newBackgroundContext];
  [v17 setAutomaticallyMergesChangesFromParent:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"engine",  v16));

  [v17 setTransactionAuthor:v18];
  id v20 = objc_msgSend((id)objc_opt_class(self, v19), "_makeConduitWithManagementSourceObjectID:inContext:", v13, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = -[RMActivationEngine initWithManagementSourceObjectID:context:]( objc_alloc(&OBJC_CLASS___RMActivationEngine),  "initWithManagementSourceObjectID:context:",  v13,  v17);
  v23 = -[RMStatusEngine initWithManagementSourceObjectID:statusQuerier:inContext:]( objc_alloc(&OBJC_CLASS___RMStatusEngine),  "initWithManagementSourceObjectID:statusQuerier:inContext:",  v13,  v12,  v14);

  v24 = -[RMClient initWithConduit:activationEngine:statusEngine:managementSourceIdentifier:]( self,  "initWithConduit:activationEngine:statusEngine:managementSourceIdentifier:",  v21,  v22,  v23,  v16);
  return v24;
}

- (RMClient)initWithConduit:(id)a3 activationEngine:(id)a4 statusEngine:(id)a5 managementSourceIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___RMClient;
  v15 = -[RMClient init](&v25, "init");
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_conduit, a3);
    [v11 setDelegate:v16];
    objc_storeStrong((id *)&v16->_activationEngine, a4);
    objc_storeStrong((id *)&v16->_statusEngine, a5);
    objc_storeStrong((id *)&v16->_managementSourceIdentifier, a6);
    id v17 = objc_opt_new(&OBJC_CLASS___NSObject);
    needsSyncingLock = v16->_needsSyncingLock;
    v16->_needsSyncingLock = v17;

    v16->_needsSyncing = 1;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RMClient-%@",  v14));
    id v20 = (RMSharedLock *)+[RMSharedLock newSharedLockWithDescription:]( &OBJC_CLASS___RMSharedLock,  "newSharedLockWithDescription:",  v19);
    syncLock = v16->_syncLock;
    v16->_syncLock = v20;

    v16->_firstSync = 1;
    v22 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    -[NSOperationQueue setName:](v16->_operationQueue, "setName:", @"com.apple.remotemanagementd.client");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v16->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setQualityOfService:](v16->_operationQueue, "setQualityOfService:", 17LL);
  }

  return v16;
}

+ (id)_makeConduitWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_10000CF70;
  v18 = sub_10000CF80;
  id v19 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000CF88;
  v10[3] = &unk_1000B8DA8;
  id v6 = a4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v13 = &v14;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Starting",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting client...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  [v7 setDelegate:self];
  [v7 start];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000D1CC;
  v10[3] = &unk_1000B8F08;
  void v10[4] = self;
  id v9 = v4;
  id v11 = v9;
  [v8 startWithCompletionHandler:v10];

  os_activity_scope_leave(&state);
}

- (void)enrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Enrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Enrolling...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 statusItemsToImplicitlySubscribeTo]);
  [v7 implicitlySubscribeToStatusKeyPaths:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 statusItemsToSendDuringEnrollment]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 queryForStatusWithKeyPaths:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 statusByKeyPath]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000D53C;
  v18[3] = &unk_1000B8F30;
  id v15 = v7;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v4;
  id v21 = v17;
  [v13 enrollWithStatusItems:v14 completionHandler:v18];

  os_activity_scope_leave(&state);
}

- (void)reenrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Re-enrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "re-enrolling...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  [v7 clearAllLastAcknowledgedDate];
  v24[0] = RMModelStatusItemManagementClientCapabilities;
  v24[1] = RMModelStatusItemManagementDeclarations;
  v24[2] = RMModelStatusItemManagementPushToken;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 3LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  [v7 implicitlySubscribeToStatusKeyPaths:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 statusItemsToSendDuringEnrollment]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 queryForStatusWithKeyPaths:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 statusByKeyPath]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000D86C;
  v18[3] = &unk_1000B8F30;
  id v15 = v7;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v4;
  id v21 = v17;
  [v13 enrollWithStatusItems:v14 completionHandler:v18];

  os_activity_scope_leave(&state);
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Unenrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unenrolling...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000D9FC;
  v9[3] = &unk_1000B8F58;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [v7 unenrollWithCompletionHandler:v9];

  os_activity_scope_leave(&state);
}

- (void)syncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Syncing",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v6);
  -[RMClient _syncOnlyIfNeeded:completionHandler:](self, "_syncOnlyIfNeeded:completionHandler:", 0LL, v4);
  os_activity_scope_leave(&v6);
}

- (void)syncIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Syncing if needed",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v6);
  -[RMClient _syncOnlyIfNeeded:completionHandler:](self, "_syncOnlyIfNeeded:completionHandler:", 1LL, v4);
  os_activity_scope_leave(&v6);
}

- (void)_syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = self->_needsSyncingLock;
  objc_sync_enter(v7);
  self->_needsSyncing = 0;
  objc_sync_exit(v7);

  -[RMSharedLock lock](self->_syncLock, "lock");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = &stru_1000BB450;
    if (v4) {
      id v9 = @" only if needed";
    }
    *(_DWORD *)buf = 138543362;
    objc_super v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Syncing%{public}@...", buf, 0xCu);
  }

  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  id v12 = v11;
  if (v4) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 queryForUnacknowledgedStatusSubscriptions]);
  }
  else {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 queryForStatusSubscriptions]);
  }
  BOOL v14 = !v4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000DDAC;
  v18[3] = &unk_1000B8FD0;
  id v19 = v10;
  id v20 = self;
  BOOL v23 = v4;
  id v21 = v13;
  id v22 = v6;
  id v15 = v13;
  id v16 = v6;
  id v17 = v10;
  -[RMClient _sendStatusQueryResultIfNeeded:fullReport:completionHandler:]( self,  "_sendStatusQueryResultIfNeeded:fullReport:completionHandler:",  v15,  v14,  v18);
}

- (void)_syncConduitOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  unsigned __int8 v8 = [v7 isSyncAllowed];

  if ((v8 & 1) != 0)
  {
    if (!-[RMClient _haltSyncing](self, "_haltSyncing"))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10000E598;
      v12[3] = &unk_1000B8F58;
      v12[4] = self;
      id v13 = v6;
      [v11 syncOnlyIfNeeded:v4 completionHandler:v12];

      goto LABEL_9;
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000FD38();
    }
  }

  else
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000FD64();
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createStatePreventsSyncingError]( &OBJC_CLASS___RMErrorUtilities,  "createStatePreventsSyncingError"));
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v10);

LABEL_9:
}

- (void)applyNowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RMClient activationEngine](self, "activationEngine"));
  [v5 syncWithCompletionHandler:v4];
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Updating via push message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  -[RMSharedLock lock](self->_syncLock, "lock");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating via push message...", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000E7F8;
  v12[3] = &unk_1000B8EE0;
  v12[4] = self;
  id v11 = v7;
  id v13 = v11;
  [v10 updateWithPushMessage:v6 completionHandler:v12];

  os_activity_scope_leave(&state);
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Updating via sync tokens",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  -[RMSharedLock lock](self->_syncLock, "lock");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating via sync tokens...", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000EA04;
  v12[3] = &unk_1000B8EE0;
  v12[4] = self;
  id v11 = v7;
  id v13 = v11;
  [v10 updateWithTokensResponse:v6 completionHandler:v12];

  os_activity_scope_leave(&state);
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "Client: Sending arbitrary status",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  unsigned __int8 v10 = [v9 isSyncAllowed];

  if ((v10 & 1) == 0)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000FE48();
    }
    goto LABEL_8;
  }

  if (-[RMClient _haltSyncing](self, "_haltSyncing"))
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000FE1C();
    }
LABEL_8:

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createStatePreventsSyncingError]( &OBJC_CLASS___RMErrorUtilities,  "createStatePreventsSyncingError"));
    v7[2](v7, v12);

    goto LABEL_12;
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sending arbitrary status...", buf, 2u);
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000ECE8;
  v15[3] = &unk_1000B8EE0;
  v15[4] = self;
  id v16 = v7;
  [v14 sendStatusData:v6 completionHandler:v15];

LABEL_12:
  os_activity_scope_leave(&state);
}

- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "Client: querying for status subscriptions",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v23);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));

    *(_DWORD *)buf = 138543362;
    objc_super v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Querying for status subscriptions with identifiers %{public}@...",  buf,  0xCu);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 queryForStatusSubscriptionsWithIdentifiers:v4]);

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));

    *(_DWORD *)buf = 138543362;
    objc_super v25 = v22;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Found status from status subscriptions with identifiers %{public}@",  buf,  0xCu);
  }

  id v13 = v11;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 statusByKeyPath]);
  if ([v14 count])
  {
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 errorByKeyPath]);
    BOOL v16 = [v15 count] == 0;

    if (v16)
    {
      v18 = &__NSDictionary0__struct;
      goto LABEL_9;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 protocolStatusReportWithFullReport:0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serializeWithType:1]);

LABEL_9:
  os_activity_scope_leave(&v23);

  return v18;
}

- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "Client: sending status for subscriptions",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v19);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", @", "));

    *(_DWORD *)buf = 138543362;
    id v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Querying for status subscriptions with identifiers %{public}@ then sending status...",  buf,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 queryForStatusSubscriptionsWithIdentifiers:v6]);

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));

    *(_DWORD *)buf = 138543362;
    id v21 = v18;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Found status from status subscriptions with identifiers %{public}@",  buf,  0xCu);
  }

  -[RMClient _sendStatusQueryResultIfNeeded:fullReport:completionHandler:]( self,  "_sendStatusQueryResultIfNeeded:fullReport:completionHandler:",  v14,  0LL,  v7);
  os_activity_scope_leave(&v19);
}

- (void)_sendStatusQueryResultIfNeeded:(id)a3 fullReport:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 statusByKeyPath]);
  if ([v10 count])
  {

LABEL_4:
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 protocolStatusReportWithFullReport:v6]);
    id v19 = 0LL;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serializeAsDataWithType:1 error:&v19]);
    id v15 = v19;
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
    id v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10000FF60();
      }

      -[RMClient sendStatusData:completionHandler:](self, "sendStatusData:completionHandler:", v14, v9);
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000FF00();
      }

      v9[2](v9, v15);
    }

    goto LABEL_12;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 errorByKeyPath]);
  id v12 = [v11 count];

  if (v12) {
    goto LABEL_4;
  }
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "There was no status report to send.", buf, 2u);
  }

  v9[2](v9, 0LL);
LABEL_12:
}

- (BOOL)_haltSyncing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  unsigned int v3 = [v2 errorState];

  return (v3 & 0xFFFFFFFE) == 4;
}

- (void)_handleConduitError
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient conduit](self, "conduit"));
  id v4 = [v3 errorState];

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000FF8C((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  -[RMClient _processConduitErrorState:](self, "_processConduitErrorState:", v4);
}

- (void)_processConduitErrorState:(signed __int16)a3
{
  int v3 = (unsigned __int16)a3;
  if ((a3 & 0xFFFE) == 0) {
    int v3 = 1;
  }
  if (a3 >= 2 && (v3 & 0xFFFE) != 2)
  {
    if (v3 == 5)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMClient delegate](self, "delegate"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient managementSourceIdentifier](self, "managementSourceIdentifier"));
      [v6 clientNeedsToReenrollWithManagementSourceIdentifier:v5];
      goto LABEL_10;
    }

    if (v3 == 4)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMClient delegate](self, "delegate"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient managementSourceIdentifier](self, "managementSourceIdentifier"));
      [v6 clientNeedsToUnenrollWithManagementSourceIdentifier:v5];
LABEL_10:
    }
  }

- (void)conduitNeedsToSync:(id)a3
{
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000FFF4();
  }

  -[RMClient _setNeedsSyncing:](self, "_setNeedsSyncing:", 1LL);
}

- (void)conduitNeedsToSendStatusForKeyPaths:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100010020(v4, v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient statusEngine](self, "statusEngine"));
  [v6 subscribeToStatusKeyPathsThenStopAfterAcknowledged:v4];

  -[RMClient _setNeedsSyncing:](self, "_setNeedsSyncing:", 1LL);
}

- (void)statusEngineHasUnacknowledgedSubscription:(id)a3
{
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000100EC();
  }

  -[RMClient _setNeedsSyncing:](self, "_setNeedsSyncing:", 1LL);
}

- (void)_setNeedsSyncing:(BOOL)a3
{
  if (a3)
  {
    id v4 = self->_needsSyncingLock;
    objc_sync_enter(v4);
    if (self->_needsSyncing)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100010144();
      }
    }

    else
    {
      self->_needsSyncing = 1;
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100010118();
      }

      uint64_t v7 = (void *)os_transaction_create("com.apple.remotemanagementd.needs-syncing");
      objc_initWeak(&location, self);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClient operationQueue](self, "operationQueue"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10000F91C;
      v9[3] = &unk_1000B8FF8;
      objc_copyWeak(&v11, &location);
      id v5 = v7;
      uint64_t v10 = v5;
      [v8 addOperationWithBlock:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

    objc_sync_exit(v4);
  }

  else
  {
    id v4 = objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG)) {
      sub_100010170();
    }
  }
}

- (void)_syncIfNeeded
{
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog client](&OBJC_CLASS___RMLog, "client"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001019C();
  }

  -[RMClient _syncOnlyIfNeeded:completionHandler:](self, "_syncOnlyIfNeeded:completionHandler:", 1LL, &stru_1000B9018);
}

- (RMClientDelegate)delegate
{
  return (RMClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)managementSourceIdentifier
{
  return self->_managementSourceIdentifier;
}

- (RMConduit)conduit
{
  return self->_conduit;
}

- (void)setConduit:(id)a3
{
}

- (RMActivationEngine)activationEngine
{
  return self->_activationEngine;
}

- (void)setActivationEngine:(id)a3
{
}

- (RMStatusEngine)statusEngine
{
  return self->_statusEngine;
}

- (void)setStatusEngine:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end