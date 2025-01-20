@interface RMMDMConduit
+ (id)_generateEnrollmentToken;
- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5;
- (BOOL)_processErrorResponse:(id)a3 error:(id *)a4;
- (BOOL)isSyncAllowed;
- (BOOL)madeChangesDuringSync;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMConduitDelegate)delegate;
- (RMMDMConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (id)_processResponse:(id)a3 payloadClass:(Class)a4 error:(id *)a5;
- (id)_requestDataForPayload:(id)a3 error:(id *)a4;
- (id)_statusItemsToSendOnceAfterEnrollment;
- (id)statusItemsToImplicitlySubscribeTo;
- (id)statusItemsToSendDuringEnrollment;
- (signed)errorState;
- (void)_didFinishFetchingDeclarationItems:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9;
- (void)_didFinishFetchingServerTokens:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didFinishSendingStatusWithError:(id)a3 completionHandler:(id)a4;
- (void)_executeRequestForEndpoint:(id)a3 requestData:(id)a4 expectedResponseClass:(Class)a5 completionHandler:(id)a6;
- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3;
- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6;
- (void)_startObservers;
- (void)_stopObservers;
- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4;
- (void)_writeQAStatusData:(id)a3 completionHandler:(id)a4;
- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMadeChangesDuringSync:(BOOL)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMMDMConduit

- (RMMDMConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RMMDMConduit;
  v9 = -[RMMDMConduit init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: starting",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100049000();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100043D0C;
  v8[3] = &unk_1000B90A0;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v9 = v7;
  v10 = self;
  [v7 performBlockAndWait:v8];
  v4[2](v4);

  os_activity_scope_leave(&state);
}

- (void)_startObservers
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionAuthor]);
  v4 = -[RMPersistentHistoryNotifier initWithContext:]( objc_alloc(&OBJC_CLASS___RMPersistentHistoryNotifier),  "initWithContext:",  v6);
  -[RMPersistentHistoryNotifier setDelegate:](v4, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));
  -[RMPersistentHistoryNotifier setIgnoredTransactionAuthors:](v4, "setIgnoredTransactionAuthors:", v5);

  -[RMMDMConduit setPersistentHistoryNotifier:](self, "setPersistentHistoryNotifier:", v4);
  -[RMPersistentHistoryNotifier start](v4, "start");
}

- (void)_stopObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit persistentHistoryNotifier](self, "persistentHistoryNotifier"));
  [v3 setDelegate:0];

  -[RMMDMConduit setPersistentHistoryNotifier:](self, "setPersistentHistoryNotifier:", 0LL);
}

- (signed)errorState
{
  v2 = self;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  __int16 v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100043FB8;
  v5[3] = &unk_1000B8DA8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOWORD(v2) = *((_WORD *)v10 + 12);

  _Block_object_dispose(&v9, 8);
  return (__int16)v2;
}

- (id)statusItemsToImplicitlySubscribeTo
{
  v5[0] = RMModelStatusItemManagementClientCapabilities;
  v5[1] = RMModelStatusItemManagementDeclarations;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)statusItemsToSendDuringEnrollment
{
  return objc_opt_new(&OBJC_CLASS___NSSet);
}

- (id)_statusItemsToSendOnceAfterEnrollment
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 6LL));
  uint64_t v11 = 0LL;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004429C;
  v7[3] = &unk_1000B8DA8;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v8 = v4;
  uint64_t v9 = self;
  v10 = &v11;
  [v4 performBlockAndWait:v7];
  if (*((_BYTE *)v12 + 24))
  {
    [v3 addObject:RMModelStatusItemDeviceSerialNumber];
    [v3 addObject:RMModelStatusItemDeviceUDID];
  }

  [v3 addObject:RMModelStatusItemDeviceOperatingSystemFamily];
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemVersion];
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion];
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemBuildVersion];
  [v3 addObject:RMModelStatusItemDeviceModelFamily];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: enrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10004902C();
  }

  +[RMMDMv1Liaison refreshState](&OBJC_CLASS___RMMDMv1Liaison, "refreshState");
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100044514;
  v21 = sub_100044524;
  id v22 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004452C;
  v13[3] = &unk_1000B8DA8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v14 = v10;
  v15 = self;
  v16 = &v17;
  [v10 performBlockAndWait:v13];
  if (v18[5])
  {
    v7[2](v7);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit delegate](self, "delegate"));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit _statusItemsToSendOnceAfterEnrollment](self, "_statusItemsToSendOnceAfterEnrollment"));
    [v11 conduitNeedsToSendStatusForKeyPaths:v12];

    ((void (*)(void (**)(void), void))v7[2])(v7, 0LL);
  }

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);
}

+ (id)_generateEnrollmentToken
{
  v2 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v2, "UUIDString"));

  return v3;
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: unenrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  -[RMMDMConduit _stopObservers](self, "_stopObservers");
  uint64_t v11 = 0LL;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_100044514;
  v15 = sub_100044524;
  id v16 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100044928;
  v7[3] = &unk_1000B8DA8;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v8 = v6;
  uint64_t v9 = self;
  id v10 = &v11;
  [v6 performBlockAndWait:v7];
  +[RMMDMv1Liaison refreshState](&OBJC_CLASS___RMMDMv1Liaison, "refreshState");
  v4[2](v4, 0LL, v12[5]);

  _Block_object_dispose(&v11, 8);
  os_activity_scope_leave(&state);
}

- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: fetching server tokens",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000490EC();
  }

  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100044D1C;
  v15[3] = &unk_1000B9B80;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v16 = v9;
  uint64_t v17 = self;
  BOOL v19 = a3;
  v18 = &v20;
  [v9 performBlockAndWait:v15];
  if (*((_BYTE *)v21 + 24))
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___RMProtocolTokensResponse);
    uint64_t v11 = RMProtocolEndpointTokens;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100044EF0;
    v13[3] = &unk_1000BA160;
    void v13[4] = self;
    id v14 = v6;
    -[RMMDMConduit _executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:]( self,  "_executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:",  v11,  0LL,  v10,  v13);
  }

  else
  {
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000490C0();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingServerTokens:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100038738();
    }

    v10[2](v10, v9);
  }

  else
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    char v23 = sub_100044514;
    v24 = sub_100044524;
    id v25 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000450EC;
    v15[3] = &unk_1000B9D28;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
    id v16 = v12;
    uint64_t v17 = self;
    id v18 = v8;
    BOOL v19 = &v20;
    [v12 performBlockAndWait:v15];
    if (v21[5])
    {
      ((void (*)(void (**)(id, id)))v10[2])(v10);
    }

    else
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Successfully saved server tokens",  (uint8_t *)v14,  2u);
      }

      v10[2](v10, 0LL);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (BOOL)isSyncAllowed
{
  return 1;
}

- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: syncing only if needed",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10004919C(v4, v8, v9);
  }

  if (+[RMFeatureOverrides qaMode](&OBJC_CLASS___RMFeatureOverrides, "qaMode"))
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100049170();
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }

  else
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100045540;
    v27[3] = &unk_1000B9830;
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v28 = v11;
    id v12 = objc_retainBlock(v27);
    -[RMMDMConduit setMadeChangesDuringSync:](self, "setMadeChangesDuringSync:", 0LL);
    uint64_t v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000455B0;
    v22[3] = &unk_1000B9DA0;
    id v14 = v12;
    id v25 = v14;
    v15 = v13;
    char v23 = v15;
    v24 = self;
    BOOL v26 = v4;
    -[RMMDMConduit _fetchTokensOnlyIfNeeded:completionHandler:]( self,  "_fetchTokensOnlyIfNeeded:completionHandler:",  v4,  v22);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100045740;
    v19[3] = &unk_1000B9DC8;
    v19[4] = self;
    uint64_t v20 = v11;
    id v21 = v6;
    id v18 = v11;
    dispatch_group_notify(v15, v17, v19);
  }

  os_activity_scope_leave(&state);
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
  id v11 = 0LL;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolPushMessage loadData:serializationType:error:]( &OBJC_CLASS___RMProtocolPushMessage,  "loadData:serializationType:error:",  a3,  1LL,  &v11));
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 messageSyncTokens]);
    -[RMMDMConduit _updateWithSyncTokens:completionHandler:](self, "_updateWithSyncTokens:completionHandler:", v9, v6);

    id v6 = (id)v9;
  }

  else
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000387F8();
    }

    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    uint64_t v10 = 0LL;
    goto LABEL_5;
  }

  id v13 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[RMProtocolTokensResponse loadData:serializationType:error:]( &OBJC_CLASS___RMProtocolTokensResponse,  "loadData:serializationType:error:",  v6,  1LL,  &v13));
  id v9 = v13;
  uint64_t v10 = v9;
  if (v8)
  {

    uint64_t v10 = (void *)v8;
LABEL_5:
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 responseSyncTokens]);
    -[RMMDMConduit _updateWithSyncTokens:completionHandler:](self, "_updateWithSyncTokens:completionHandler:", v11, v7);

    goto LABEL_9;
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100038858();
  }

  v7[2](v7, v10);
LABEL_9:
}

- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100044514;
  BOOL v19 = sub_100044524;
  id v20 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100045B34;
  v10[3] = &unk_1000B9D28;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v11 = v8;
  id v12 = self;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v15;
  [v8 performBlockAndWait:v10];
  v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: fetching declaration items",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100049248();
  }

  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100045ED8;
  v15[3] = &unk_1000B9B80;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v16 = v9;
  uint64_t v17 = self;
  BOOL v19 = a3;
  id v18 = &v20;
  [v9 performBlockAndWait:v15];
  if (*((_BYTE *)v21 + 24))
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___RMProtocolDeclarationItemsResponse);
    uint64_t v11 = RMProtocolEndpointDeclarationItems;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100046078;
    v13[3] = &unk_1000BA160;
    void v13[4] = self;
    id v14 = v6;
    -[RMMDMConduit _executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:]( self,  "_executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:",  v11,  0LL,  v10,  v13);
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10004921C();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingDeclarationItems:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003893C();
    }

    v10[2](v10, v9);
  }

  else
  {
    uint64_t v20 = 0LL;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    char v23 = sub_100044514;
    v24 = sub_100044524;
    id v25 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100046274;
    v15[3] = &unk_1000B9D28;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
    id v16 = v12;
    uint64_t v17 = self;
    id v18 = v8;
    BOOL v19 = &v20;
    [v12 performBlockAndWait:v15];
    if (v21[5])
    {
      ((void (*)(void (**)(id, id)))v10[2])(v10);
    }

    else
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Successfully saved partial object",  (uint8_t *)v14,  2u);
      }

      v10[2](v10, 0LL);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6
{
  id v9 = a3;
  id v40 = a4;
  id v10 = a6;
  context = objc_autoreleasePoolPush();
  v39 = self;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit managementSourceObjectID](self, "managementSourceObjectID"));
  v38 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectWithID:v11]);

  v37 = v12;
  v35 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:v10]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v13 count]));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v19 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 serverToken]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v20,  v21));
        [v14 setObject:v19 forKeyedSubscript:v22];
      }

      id v16 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }

    while (v16);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v41 = v40;
  id v23 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v41);
        }
        v27 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 responseIdentifier]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v27 responseServerToken]);
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v28,  v29));
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v30]);
        if (v31)
        {
          id v32 = (id)v31;
          [v14 removeObjectForKey:v30];
        }

        else
        {
          id v32 = [[a5 alloc] initWithContext:v38];
          [v32 setIdentifier:v28];
          [v32 setServerToken:v29];
          [v32 setManagementSource:v37];
          -[RMMDMConduit setMadeChangesDuringSync:](v39, "setMadeChangesDuringSync:", 1LL);
        }
      }

      id v24 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }

    while (v24);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000468D8;
  v43[3] = &unk_1000B9E40;
  v43[4] = v39;
  id v33 = v38;
  id v44 = v33;
  [v14 enumerateKeysAndObjectsUsingBlock:v43];

  objc_autoreleasePoolPop(context);
}

- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___RMActivationPayload);
  uint64_t v6 = RMProtocolEndpointDeclarationActivation;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100046A5C;
  v8[3] = &unk_1000B9D50;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[RMMDMConduit _fetchNextObjectOfClass:endpoint:completionHandler:]( self,  "_fetchNextObjectOfClass:endpoint:completionHandler:",  v5,  v6,  v8);
}

- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: fetching next object from server",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromClass(a3);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    sub_1000493D8(v13, (uint64_t)v48, v11);
  }

  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_100044514;
  id v44 = sub_100044524;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_100044514;
  v38 = sub_100044524;
  id v39 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100046F70;
  v27[3] = &unk_1000BA188;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v28 = v14;
  v29 = self;
  id v32 = &v34;
  Class v33 = a3;
  uint64_t v31 = &v40;
  id v15 = v8;
  id v30 = v15;
  [v14 performBlockAndWait:v27];
  if (v41[5])
  {
    uint64_t v16 = v35[5];
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___RMModelDeclarationBase);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10004713C;
    v22[3] = &unk_1000BA1B0;
    void v22[4] = self;
    uint64_t v25 = &v40;
    Class v26 = a3;
    id v23 = v15;
    id v24 = v9;
    -[RMMDMConduit _executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:]( self,  "_executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:",  v16,  0LL,  v17,  v22);
  }

  else
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      BOOL v19 = NSStringFromClass(a3);
      id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit managementSourceObjectID](self, "managementSourceObjectID"));
      sub_100049368(v20, v21, buf, v18);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  BOOL v19 = (void (**)(void))a9;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:HTTPResponseKeyStatusCode]);
  id v21 = [v20 integerValue];

  BOOL v22 = v21 == (id)200 || v18 == 0LL;
  if (v22 || v21 == (id)404)
  {
    *(void *)v37 = 0LL;
    *(void *)&v37[8] = v37;
    *(void *)&v37[16] = 0x3032000000LL;
    v38 = sub_100044514;
    id v39 = sub_100044524;
    id v40 = 0LL;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100047490;
    v29[3] = &unk_1000BA1D8;
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
    id v30 = v23;
    uint64_t v31 = self;
    id v32 = v15;
    id v33 = v18;
    id v24 = v16;
    id v34 = v24;
    id v35 = v14;
    uint64_t v36 = v37;
    [v23 performBlockAndWait:v29];
    if (*(void *)(*(void *)&v37[8] + 40LL))
    {
      v19[2](v19);
    }

    else
    {
      Class v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Successfully saved object, fetching next one",  buf,  2u);
      }

      -[RMMDMConduit _fetchNextObjectOfClass:endpoint:completionHandler:]( self,  "_fetchNextObjectOfClass:endpoint:completionHandler:",  a5,  v24,  v19);
    }

    _Block_object_dispose(v37, 8);
  }

  else
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v37 = 138543874;
      *(void *)&v37[4] = v15;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v16;
      *(_WORD *)&v37[22] = 2114;
      v38 = (uint64_t (*)(uint64_t, uint64_t))v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Error while fetching object %{public}@ (%{public}@): %{public}@",  v37,  0x20u);
    }

    ((void (*)(void (**)(void), id))v19[2])(v19, v18);
  }
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "MDMConduit: sending status",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000495D4();
  }

  if (+[RMFeatureOverrides qaMode](&OBJC_CLASS___RMFeatureOverrides, "qaMode"))
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000495A8();
    }

    -[RMMDMConduit _writeQAStatusData:completionHandler:](self, "_writeQAStatusData:completionHandler:", v6, v7);
  }

  else
  {
    uint64_t v11 = RMProtocolEndpointStatus;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100047934;
    v12[3] = &unk_1000BA160;
    v12[4] = self;
    id v13 = v7;
    -[RMMDMConduit _executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:]( self,  "_executeRequestForEndpoint:requestData:expectedResponseClass:completionHandler:",  v11,  v6,  0LL,  v12);
  }

  os_activity_scope_leave(&state);
}

- (void)_didFinishSendingStatusWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (v6)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100038D48();
    }

    v7[2](v7, v6);
  }

  else
  {
    uint64_t v16 = 0LL;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    BOOL v19 = sub_100044514;
    id v20 = sub_100044524;
    id v21 = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100047B10;
    v12[3] = &unk_1000B8DA8;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
    id v13 = v9;
    id v14 = self;
    id v15 = &v16;
    [v9 performBlockAndWait:v12];
    if (v17[5])
    {
      ((void (*)(void (**)(id, id)))v7[2])(v7);
    }

    else
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Successfully sent status",  (uint8_t *)&v11,  2u);
      }

      v7[2](v7, 0LL);
    }

    _Block_object_dispose(&v16, 8);
  }
}

- (void)_writeQAStatusData:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"file:///tmp/rmd_test/Status"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9 isDirectory:0];

  if ((v10 & 1) == 0)
  {
    id v21 = 0LL;
    unsigned __int8 v11 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v12 = v21;
    id v13 = v12;
    if ((v11 & 1) == 0)
    {
      v6[2](v6, v12);
      goto LABEL_8;
    }
  }

  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  &v20));
  id v13 = v20;
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMDateFormat stringLocalTimeZoneFractionalSecondsWithDate:]( &OBJC_CLASS___RMDateFormat,  "stringLocalTimeZoneFractionalSecondsWithDate:",  0LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathExtension:@"json"]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v16 isDirectory:0]);
    id v19 = v13;
    +[RMJSONUtilities serializeJSONDictionary:fileURL:error:]( &OBJC_CLASS___RMJSONUtilities,  "serializeJSONDictionary:fileURL:error:",  v14,  v17,  &v19);
    id v18 = v19;

    id v13 = v18;
  }

  v6[2](v6, 0LL);

LABEL_8:
}

- (id)_processResponse:(id)a3 payloadClass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:HTTPResponseKeyStatusCode]);
  unsigned __int8 v10 = (char *)[v9 integerValue];

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:HTTPResponseKeyBody]);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    Class v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got back from MDM: %ld", buf, 0xCu);
  }

  if ((unint64_t)(v10 - 400) <= 0xC7)
  {
    id v24 = 0LL;
    unsigned __int8 v13 = -[RMMDMConduit _processErrorResponse:error:](self, "_processErrorResponse:error:", v8, &v24);
    id v14 = v24;
    id v15 = v14;
    if ((v13 & 1) != 0)
    {
      if (v11)
      {
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
        if (!a5) {
          goto LABEL_30;
        }
      }

      else
      {
        uint64_t v16 = @"Empty Response Body";
        if (!a5)
        {
LABEL_30:

          goto LABEL_31;
        }
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMDMRequestInvalid:]( &OBJC_CLASS___RMErrorUtilities,  "createMDMRequestInvalid:",  v16));
      BOOL v22 = v21;
      if (v21) {
        *a5 = v21;
      }

      goto LABEL_30;
    }

    if (!a5 || !v14) {
      goto LABEL_31;
    }
LABEL_21:
    *a5 = v15;
LABEL_31:

    id v19 = 0LL;
    goto LABEL_32;
  }

  if (v10 != (char *)204 && v11 != 0LL)
  {
    if (a4)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[objc_class loadData:serializationType:error:](a4, "loadData:serializationType:error:", v11, 1LL, a5));
LABEL_25:
      id v19 = (void *)v20;
      goto LABEL_32;
    }

- (BOOL)_processErrorResponse:(id)a3 error:(id *)a4
{
  uint64_t v6 = HTTPResponseKeyStatusCode;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  uint64_t v9 = (uint64_t)[v8 integerValue];

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:HTTPResponseKeyHeaders]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:HTTPResponseKeyBody]);

  id v12 = v11;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Content-Type"]);
  id v14 = (void *)v13;
  id v15 = @"text/html";
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  uint64_t v16 = v15;
  id v17 = (char *)-[__CFString rangeOfString:](v16, "rangeOfString:", @";");
  if (v18)
  {
    id v19 = v17;
    uint64_t v20 = v18;
    id v21 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v16, "substringToIndex:", v17));
    id v22 = (id)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v16, "substringFromIndex:", &v19[v20]));
  }

  else
  {
    id v21 = v16;
    id v22 = 0LL;
  }

  id v23 = v21;
  id v24 = v22;

  if (v12 && !-[__CFString isEqualToString:](v23, "isEqualToString:", @"application/json"))
  {
    v27 = 0LL;
    goto LABEL_23;
  }

  if ([v24 length])
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Unused Content-Type parameter: %{public}@",  buf,  0xCu);
    }
  }

  Class v26 = v12;
  if (!v12) {
    Class v26 = objc_opt_new(&OBJC_CLASS___NSData);
  }
  *(void *)buf = 0LL;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolErrorResponse loadData:serializationType:error:]( &OBJC_CLASS___RMProtocolErrorResponse,  "loadData:serializationType:error:",  v26,  1LL,  buf));
  id v28 = *(id *)buf;
  if (v12)
  {
    if (!v27) {
      goto LABEL_19;
    }
  }

  else
  {

    if (!v27)
    {
LABEL_19:
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmConduit](&OBJC_CLASS___RMLog, "mdmConduit"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10003918C();
      }
    }
  }

LABEL_23:
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v27 responseCode]);
  uint64_t v31 = v30;
  id v32 = 0LL;
  uint64_t v33 = 2LL;
  if (v9 > 409)
  {
    if (v9 == 410)
    {
      id v32 = 0LL;
      else {
        uint64_t v33 = 2LL;
      }
    }

    else if (v9 == 503)
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Retry-After"]);
      if (v34)
      {
        id v35 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
        uint64_t v36 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
        -[NSDateFormatter setLocale:](v35, "setLocale:", v36);

        -[NSDateFormatter setDateFormat:](v35, "setDateFormat:", @"EEE, dd MMM yyyy HH:mm:ss Z");
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v35, "dateFromString:", v34));
        if (!v32)
        {
          uint64_t v37 = (uint64_t)[v34 integerValue];
          if (v37 < 1) {
            id v32 = 0LL;
          }
          else {
            id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v37));
          }
        }
      }

      else
      {
        id v32 = 0LL;
      }

      uint64_t v33 = 3LL;
    }
  }

  else
  {
    if (v9 == 403)
    {
      if (([v30 isEqualToString:RMProtocolErrorResponse_Code_clientVersionInvalid] & 1) != 0
        || ([v31 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthInvalid] & 1) != 0
        || [v31 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthMissing])
      {
        id v32 = 0LL;
        uint64_t v33 = 1LL;
        goto LABEL_45;
      }

      goto LABEL_27;
    }

    if (v9 == 404)
    {
      [v30 isEqualToString:RMProtocolErrorResponse_Code_enrollmentTokenInvalid];
LABEL_27:
      id v32 = 0LL;
      uint64_t v33 = 2LL;
    }
  }

- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100044514;
  id v23 = sub_100044524;
  id v24 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100048664;
  v13[3] = &unk_1000B9F08;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
  id v14 = v9;
  id v15 = self;
  signed __int16 v18 = a3;
  id v10 = v8;
  id v16 = v10;
  id v17 = &v19;
  [v9 performBlockAndWait:v13];
  unsigned __int8 v11 = (void *)v20[5];
  if (a5 && v11) {
    *a5 = v11;
  }

  _Block_object_dispose(&v19, 8);
  return v11 == 0LL;
}

- (id)_requestDataForPayload:(id)a3 error:(id *)a4
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue([a3 serializeAsDataWithType:1 error:a4]);
  }
  else {
    return 0LL;
  }
}

- (void)_executeRequestForEndpoint:(id)a3 requestData:(id)a4 expectedResponseClass:(Class)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a3 substringFromIndex:29]);
  uint64_t v20 = @"Endpoint";
  uint64_t v21 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  id v14 = [v13 mutableCopy];

  [v14 setObject:v11 forKeyedSubscript:@"Data"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  BOOL v15 = +[RMBundle managementScope](&OBJC_CLASS___RMBundle, "managementScope") == 0LL;
  v17[2] = sub_100048990;
  v17[3] = &unk_1000BA228;
  v17[4] = self;
  id v18 = v10;
  Class v19 = a5;
  id v16 = v10;
  +[MDMDeclarativeManagement executeRequestForEndpoint:channelType:requestData:completionHandler:]( &OBJC_CLASS___MDMDeclarativeManagement,  "executeRequestForEndpoint:channelType:requestData:completionHandler:",  v12,  v15,  v11,  v17);
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 changeType] == (id)2)
  {
    LOBYTE(v10) = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 changedObjectID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 entity]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMConduitConfig entity](&OBJC_CLASS___RMConduitConfig, "entity"));
    unsigned int v10 = [v12 isKindOfEntity:v13];
    if (v10)
    {
      uint64_t v22 = 0LL;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000LL;
      char v25 = 0;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit context](self, "context"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100048C8C;
      v16[3] = &unk_1000B9F58;
      v16[4] = self;
      id v17 = v11;
      id v18 = v9;
      id v19 = v12;
      id v20 = v13;
      uint64_t v21 = &v22;
      [v14 performBlockAndWait:v16];
      *a5 = *((_BYTE *)v23 + 24);

      _Block_object_dispose(&v22, 8);
    }
  }

  return v10;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertedObjectIDs]);
  if (![v7 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 updatedObjectIDs]);
    if (![v8 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deletedObjectIDs]);
      if (![v9 count])
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 persistentHistoryToken]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentHistoryToken]);
        unsigned __int8 v13 = +[RMPersistentHistoryNotifierChanges isExistingPersistentHistoryToken:fromSameStoreAsUpdatedToken:]( &OBJC_CLASS___RMPersistentHistoryNotifierChanges,  "isExistingPersistentHistoryToken:fromSameStoreAsUpdatedToken:",  v11,  v12);

        if ((v13 & 1) != 0) {
          goto LABEL_10;
        }
        goto LABEL_7;
      }
    }
  }

LABEL_7:
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMMDMConduit delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "conduitNeedsToSync:") & 1) != 0) {
    [v10 conduitNeedsToSync:self];
  }

LABEL_10:
}

- (RMConduitDelegate)delegate
{
  return (RMConduitDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (BOOL)madeChangesDuringSync
{
  return self->_madeChangesDuringSync;
}

- (void)setMadeChangesDuringSync:(BOOL)a3
{
  self->_madeChangesDuringSync = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void).cxx_destruct
{
}

  ;
}

@end