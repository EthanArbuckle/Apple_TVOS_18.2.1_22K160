@interface MADActivityManager
+ (BOOL)notifyStatusChange:(unint64_t)a3 forClient:(id)a4 withReason:(id)a5;
+ (id)clientForConnection:(id)a3;
+ (id)newTrackingCommandForEvent:(id)a3 forClient:(id)a4;
+ (id)remoteProcessFullIdentifierForConnection:(id)a3;
+ (id)remoteProcessIdentifierForConnection:(id)a3;
+ (id)sharedActivityManager;
+ (void)connectionInterruptedForClient:(id)a3;
+ (void)connectionInvalidForClient:(id)a3;
+ (void)failureOfActivity:(id)a3 withResult:(int)a4 ofResultName:(id)a5 forReason:(id)a6;
+ (void)noticeForActivity:(id)a3 reason:(id)a4;
+ (void)progressForActivity:(id)a3 calledPrimitive:(id)a4 withBoolResult:(BOOL)a5;
+ (void)progressForActivity:(id)a3 calledPrimitive:(id)a4 withErrorResult:(id)a5;
+ (void)progressForActivity:(id)a3 calledPrimitive:(id)a4 withSuccessResult:(BOOL)a5;
+ (void)progressForActivity:(id)a3 callingPrimitive:(id)a4;
+ (void)sendReply:(id)a3 withCancelDownloadResult:(int64_t)a4;
+ (void)sendReply:(id)a3 withDownloadResult:(int64_t)a4;
+ (void)sendReply:(id)a3 withOperationResult:(int64_t)a4;
+ (void)sendReply:(id)a3 withResult:(int)a4 ofResultName:(id)a5;
+ (void)terminationIminentForClient:(id)a3;
+ (void)transferOwnership:(id)a3 toOwner:(unint64_t)a4 reason:(id)a5;
+ (void)unknownXPCError:(id)a3 forClient:(id)a4;
+ (void)unknownXPCType:(_xpc_type_s *)a3 forClient:(id)a4;
+ (void)warningForActivity:(id)a3 fromMethod:(id)a4 leaderNote:(id)a5 warning:(id)a6;
- (MADActivityManager)init;
- (MADActivityTracker)managerActivity;
- (MADActivityTracker)pidReusedClient;
- (MADActivityTracker)unknownClient;
- (MADActivityTracker)untrackedCommand;
- (MADActivityTracker)untrackedCommandType;
- (NSMutableDictionary)xpcConnectionByFullId;
- (NSMutableDictionary)xpcConnectionByProcessId;
- (OS_dispatch_queue)activityTrackingQueue;
- (id)_clientForConnection:(id)a3;
- (id)_clientMADActivityTrackerForClient:(id)a3 withProcessID:(id)a4 withFullID:(id)a5;
- (unint64_t)connectionMissingRequired;
- (unint64_t)connectionNoClientIdentifier;
- (unint64_t)connectionNoClientTracker;
- (unint64_t)connectionNonDictionaryEvent;
- (unint64_t)connectionReplyAllocationFailure;
- (unint64_t)statusChangeNoClientTracker;
- (unint64_t)statusChangeNoControlManager;
- (unint64_t)statusChangeNoDownloadManager;
- (unint64_t)statusChangeNoTrackerOwner;
- (unint64_t)statusChangeUnknownOwner;
- (unint64_t)statusChangeUnknownXPCError;
- (unint64_t)statusChangeUnknownXPCType;
- (void)_finishClientCommandActivity:(id)a3 withResult:(int)a4 ofResultName:(id)a5 ableToReply:(BOOL)a6;
- (void)_startClientCommandActivity:(id)a3;
- (void)setConnectionMissingRequired:(unint64_t)a3;
- (void)setConnectionNoClientIdentifier:(unint64_t)a3;
- (void)setConnectionNoClientTracker:(unint64_t)a3;
- (void)setConnectionNonDictionaryEvent:(unint64_t)a3;
- (void)setConnectionReplyAllocationFailure:(unint64_t)a3;
- (void)setStatusChangeNoClientTracker:(unint64_t)a3;
- (void)setStatusChangeNoControlManager:(unint64_t)a3;
- (void)setStatusChangeNoDownloadManager:(unint64_t)a3;
- (void)setStatusChangeNoTrackerOwner:(unint64_t)a3;
- (void)setStatusChangeUnknownOwner:(unint64_t)a3;
- (void)setStatusChangeUnknownXPCError:(unint64_t)a3;
- (void)setStatusChangeUnknownXPCType:(unint64_t)a3;
@end

@implementation MADActivityManager

+ (id)sharedActivityManager
{
  if (sharedActivityManager_activityManagerOnce != -1) {
    dispatch_once(&sharedActivityManager_activityManagerOnce, &__block_literal_global_8);
  }
  return (id)sharedActivityManager_activityManager;
}

void __43__MADActivityManager_sharedActivityManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADActivityManager);
  v2 = (void *)sharedActivityManager_activityManager;
  sharedActivityManager_activityManager = (uint64_t)v1;
}

- (MADActivityManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADActivityManager;
  v2 = -[MADActivityManager init](&v20, "init");
  if (v2)
  {
    v3 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  2LL,  1LL,  @"activity",  1LL,  0LL,  0LL);
    managerActivity = v2->_managerActivity;
    v2->_managerActivity = v3;

    v5 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  2LL,  2LL,  @"unknown",  0LL,  0LL,  0LL);
    unknownClient = v2->_unknownClient;
    v2->_unknownClient = v5;

    -[MADActivityTracker invalidate](v2->_unknownClient, "invalidate");
    v7 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  2LL,  2LL,  @"pidReuse",  0LL,  0LL,  0LL);
    pidReusedClient = v2->_pidReusedClient;
    v2->_pidReusedClient = v7;

    -[MADActivityTracker invalidate](v2->_pidReusedClient, "invalidate");
    v9 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  2LL,  2LL,  @"untrackedCommandType",  0LL,  0LL,  0LL);
    untrackedCommandType = v2->_untrackedCommandType;
    v2->_untrackedCommandType = v9;

    -[MADActivityTracker invalidate](v2->_untrackedCommandType, "invalidate");
    v11 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  2LL,  2LL,  @"untrackedCommand",  0LL,  0LL,  0LL);
    untrackedCommand = v2->_untrackedCommand;
    v2->_untrackedCommand = v11;

    -[MADActivityTracker invalidate](v2->_untrackedCommand, "invalidate");
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MobileAsset.ActivityManager.tracking", 0LL);
    activityTrackingQueue = v2->_activityTrackingQueue;
    v2->_activityTrackingQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xpcConnectionByProcessId = v2->_xpcConnectionByProcessId;
    v2->_xpcConnectionByProcessId = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xpcConnectionByFullId = v2->_xpcConnectionByFullId;
    v2->_xpcConnectionByFullId = v17;

    v2->_statusChangeUnknownXPCType = 0LL;
    *(_OWORD *)&v2->_statusChangeNoControlManager = 0u;
    *(_OWORD *)&v2->_statusChangeUnknownOwner = 0u;
    *(_OWORD *)&v2->_statusChangeNoClientTracker = 0u;
  }

  return v2;
}

+ (id)remoteProcessIdentifierForConnection:(id)a3
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%llu",  xpc_connection_get_pid((xpc_connection_t)a3));
}

+ (id)remoteProcessFullIdentifierForConnection:(id)a3
{
  v3 = (_xpc_connection_s *)a3;
  uid_t euid = xpc_connection_get_euid(v3);
  gid_t egid = xpc_connection_get_egid(v3);
  pid_t pid = xpc_connection_get_pid(v3);
  au_asid_t asid = xpc_connection_get_asid(v3);

  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"EUID:%llu,EGID:%llu,PID:%llu,ASID:%llu",  euid,  egid,  pid,  asid);
}

+ (id)clientForConnection:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADActivityManager sharedActivityManager](&OBJC_CLASS___MADActivityManager, "sharedActivityManager"));
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  id v19 = (id)objc_claimAutoreleasedReturnValue([v4 unknownClient]);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 activityTrackingQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __42__MADActivityManager_clientForConnection___block_invoke;
  block[3] = &unk_34DE88;
  id v12 = v3;
  dispatch_queue_t v13 = &v14;
  id v11 = v4;
  id v6 = v3;
  id v7 = v4;
  dispatch_sync(v5, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __42__MADActivityManager_clientForConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _clientForConnection:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_clientForConnection:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADActivityManager activityTrackingQueue](self, "activityTrackingQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MADActivityManager sharedActivityManager](&OBJC_CLASS___MADActivityManager, "sharedActivityManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 unknownClient]);
  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MADActivityManager remoteProcessIdentifierForConnection:]( &OBJC_CLASS___MADActivityManager,  "remoteProcessIdentifierForConnection:",  v4));
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MADActivityManager remoteProcessFullIdentifierForConnection:]( &OBJC_CLASS___MADActivityManager,  "remoteProcessFullIdentifierForConnection:",  v4));
    v10 = (void *)v9;
    if (v8 && v9)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 _clientMADActivityTrackerForClient:v4 withProcessID:v8 withFullID:v9]);

      id v7 = (void *)v11;
    }
  }

  return v7;
}

+ (void)connectionInvalidForClient:(id)a3
{
  connection = (_xpc_connection_s *)a3;
  if (!+[MADActivityManager notifyStatusChange:forClient:withReason:]( &OBJC_CLASS___MADActivityManager,  "notifyStatusChange:forClient:withReason:",  2LL)) {
    xpc_connection_cancel(connection);
  }
}

+ (void)terminationIminentForClient:(id)a3
{
}

+ (void)connectionInterruptedForClient:(id)a3
{
}

+ (void)unknownXPCError:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MADActivityManager sharedActivityManager](&OBJC_CLASS___MADActivityManager, "sharedActivityManager"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 activityTrackingQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__MADActivityManager_unknownXPCError_forClient___block_invoke;
  block[3] = &unk_34DB98;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(v6, block);
}

void __48__MADActivityManager_unknownXPCError_forClient___block_invoke(uint64_t a1)
{
}

+ (void)unknownXPCType:(_xpc_type_s *)a3 forClient:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADActivityManager sharedActivityManager]( &OBJC_CLASS___MADActivityManager,  "sharedActivityManager",  a3,  a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 activityTrackingQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__MADActivityManager_unknownXPCType_forClient___block_invoke;
  block[3] = &unk_34E648;
  id v9 = v5;
  id v10 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);
}

void __47__MADActivityManager_unknownXPCType_forClient___block_invoke(uint64_t a1)
{
}

+ (id)newTrackingCommandForEvent:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MADActivityManager sharedActivityManager](&OBJC_CLASS___MADActivityManager, "sharedActivityManager"));
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  id v52 = (id)objc_claimAutoreleasedReturnValue([v7 untrackedCommand]);
  if (v5 && v6)
  {
    xpc_type_t type = xpc_get_type(v5);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      unsigned int uint64 = xpc_dictionary_get_uint64(v5, "messageAction");
      id v19 = stringForMAXpcCommand(uint64);
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[MADActivityManager remoteProcessIdentifierForConnection:]( &OBJC_CLASS___MADActivityManager,  "remoteProcessIdentifierForConnection:",  v6));
      uint64_t v22 = objc_claimAutoreleasedReturnValue( +[MADActivityManager remoteProcessFullIdentifierForConnection:]( &OBJC_CLASS___MADActivityManager,  "remoteProcessFullIdentifierForConnection:",  v6));
      v23 = (void *)v22;
      if (v21 && v22)
      {
        v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 activityTrackingQueue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __59__MADActivityManager_newTrackingCommandForEvent_forClient___block_invoke;
        block[3] = &unk_34E670;
        id v39 = v7;
        id v40 = v6;
        id v41 = v21;
        id v42 = v23;
        id v43 = v5;
        unsigned int v46 = uint64;
        id v44 = v20;
        v45 = &v47;
        dispatch_sync(v24, block);
      }

      else
      {
        objc_msgSend( v7,  "setConnectionNoClientIdentifier:",  (char *)objc_msgSend(v7, "connectionNoClientIdentifier") + 1);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]",  @"{newTrackingCommandForEvent} unable to determine client process identifier(s) for command:%@",  v25,  v26,  v27,  v28,  (uint64_t)v20);
      }

      v29 = (void *)v48[5];
      if (!v29 || ([v29 validTracker] & 1) == 0)
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        v31 = reply;
        if (reply)
        {
          xpc_dictionary_set_int64(reply, "Result", 2LL);
          xpc_connection_send_message((xpc_connection_t)v6, v31);
        }

        else
        {
          objc_msgSend( v7,  "setConnectionReplyAllocationFailure:",  (char *)objc_msgSend(v7, "connectionReplyAllocationFailure") + 1);
          _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]",  @"{newTrackingCommandForEvent} unable to create XPC reply for un-trackable event from client for command:%@",  v32,  v33,  v34,  v35,  (uint64_t)v20);
        }
      }
    }

    else
    {
      objc_msgSend(v7, "setConnectionNonDictionaryEvent:", (char *)objc_msgSend(v7, "connectionNonDictionaryEvent") + 1);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]",  @"{newTrackingCommandForEvent} caller provided non-dictionary event type: %llu",  v9,  v10,  v11,  v12,  (uint64_t)type);
    }
  }

  else
  {
    objc_msgSend(v7, "setConnectionMissingRequired:", (char *)objc_msgSend(v7, "connectionMissingRequired") + 1);
    if (v5) {
      v17 = @"PROVIDED";
    }
    else {
      v17 = @"MISSING";
    }
    _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]",  @"{newTrackingCommandForEvent} missing required parameters - event:%@, client:%@",  v13,  v14,  v15,  v16,  (uint64_t)v17);
  }

  id v36 = (id)v48[5];
  _Block_object_dispose(&v47, 8);

  return v36;
}

void __59__MADActivityManager_newTrackingCommandForEvent_forClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _clientMADActivityTrackerForClient:*(void *)(a1 + 40) withProcessID:*(void *)(a1 + 48) withFullID:*(void *)(a1 + 56)]);
  id v47 = v2;
  if (v2 && [v2 validTracker])
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v47 activityName]);

    if (!v3)
    {
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 64), "clientName");
      if (string) {
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
      }
      else {
        id v5 = @"UNKNOWN";
      }
      uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@(%@)",  v5,  *(void *)(a1 + 48));
      [v47 associateActivityName:v10];
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v47 activityName]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v47 childDict]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:*(void *)(a1 + 72)]);

    if (!v13)
    {
      id v14 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  +[MADActivityTracker topLevelActivityForCommand:]( &OBJC_CLASS___MADActivityTracker,  "topLevelActivityForCommand:",  *(unsigned int *)(a1 + 88)),  2LL,  *(void *)(a1 + 72),  +[MADActivityTracker categoryForCommand:]( &OBJC_CLASS___MADActivityTracker,  "categoryForCommand:",  *(unsigned int *)(a1 + 88)),  0LL,  v47);
      if (!v14)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v47 stats]);
        objc_msgSend(v37, "setAllocationFailures:", (char *)objc_msgSend(v37, "allocationFailures") + 1);

        _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]_block_invoke",  @"{newTrackingCommandForEvent} unable to allocate command type tracker for remote client:%@ command:%@",  v38,  v39,  v40,  v41,  (uint64_t)v11);
        uint64_t v13 = 0LL;
LABEL_24:

        goto LABEL_25;
      }

      uint64_t v13 = v14;
      uint64_t v15 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v47 activityName]);
      v17 = -[NSString initWithFormat:](v15, "initWithFormat:", @"%@[%@]", v16, *(void *)(a1 + 72));
      [v13 associateActivityName:v17];

      [v13 usesChildDict];
      [v13 assignParentTracker:v47];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v47 childDict]);
      [v18 setObject:v13 forKey:*(void *)(a1 + 72)];
    }

    if ([v13 validTracker])
    {
      id v19 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  +[MADActivityTracker topLevelActivityForCommand:]( &OBJC_CLASS___MADActivityTracker,  "topLevelActivityForCommand:",  *(unsigned int *)(a1 + 88)),  2LL,  *(void *)(a1 + 72),  +[MADActivityTracker categoryForCommand:]( &OBJC_CLASS___MADActivityTracker,  "categoryForCommand:",  *(unsigned int *)(a1 + 88)),  0LL,  v13);
      objc_super v20 = v19;
      if (v19 && [v19 validTracker])
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activityUUID]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 activityUUID]);
        id v23 = [v22 length];

        if ((unint64_t)v23 >= 7)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v20 activityUUID]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v20 activityUUID]);
          uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringFromIndex:", (char *)objc_msgSend( v25,  "length") - 6));

          v21 = (void *)v26;
        }

        uint64_t v27 = objc_alloc(&OBJC_CLASS___NSString);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v47 activityName]);
        v29 = -[NSString initWithFormat:](v27, "initWithFormat:", @"%@-<%@>", v28, v21);
        [v20 associateActivityName:v29];

        if ([v20 associateEventualReply:*(void *)(a1 + 64) withCommand:*(unsigned int *)(a1 + 88)])
        {
          [v20 assignParentTracker:v13];
          v30 = (void *)objc_claimAutoreleasedReturnValue([v13 childDict]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v20 activityUUID]);
          [v30 setObject:v20 forKey:v31];

          [*(id *)(a1 + 32) _startClientCommandActivity:v20];
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL), v20);
        }

        else
        {
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v47 stats]);
          objc_msgSend(v42, "setAssociateReplyFailures:", (char *)objc_msgSend(v42, "associateReplyFailures") + 1);

          _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]_block_invoke",  @"{newTrackingCommandForEvent} unable to associate reply with request from client:%@ command:%@",  v43,  v44,  v45,  v46,  (uint64_t)v11);
        }
      }

      else
      {
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v47 stats]);
        objc_msgSend(v32, "setAllocationFailures:", (char *)objc_msgSend(v32, "allocationFailures") + 1);

        _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]_block_invoke",  @"{newTrackingCommandForEvent} unable to allocate command tracker for client:%@ command:%@",  v33,  v34,  v35,  v36,  (uint64_t)v11);
      }
    }

    goto LABEL_24;
  }

  objc_msgSend( *(id *)(a1 + 32),  "setConnectionNoClientTracker:",  (char *)objc_msgSend(*(id *)(a1 + 32), "connectionNoClientTracker") + 1);
  _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager newTrackingCommandForEvent:forClient:]_block_invoke",  @"{newTrackingCommandForEvent} unable to track remote client request for command:%@",  v6,  v7,  v8,  v9,  *(void *)(a1 + 72));
LABEL_25:
}

+ (void)sendReply:(id)a3 withOperationResult:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = stringForMAOperationResult(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  +[MADActivityManager sendReply:withResult:ofResultName:]( &OBJC_CLASS___MADActivityManager,  "sendReply:withResult:ofResultName:",  v5,  a4,  v7);
}

+ (void)sendReply:(id)a3 withDownloadResult:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = stringForMADownloadResult(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  +[MADActivityManager sendReply:withResult:ofResultName:]( &OBJC_CLASS___MADActivityManager,  "sendReply:withResult:ofResultName:",  v5,  a4,  v7);
}

+ (void)sendReply:(id)a3 withCancelDownloadResult:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = stringForMACancelDownloadResult(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  +[MADActivityManager sendReply:withResult:ofResultName:]( &OBJC_CLASS___MADActivityManager,  "sendReply:withResult:ofResultName:",  v5,  a4,  v7);
}

+ (void)sendReply:(id)a3 withResult:(int)a4 ofResultName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MADActivityManager sharedActivityManager](&OBJC_CLASS___MADActivityManager, "sharedActivityManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 reply]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 reply]);
    xpc_dictionary_set_int64(v11, "Result", a4);
    [v7 sendReply];
  }

  BOOL v12 = v10 != 0LL;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 activityTrackingQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __56__MADActivityManager_sendReply_withResult_ofResultName___block_invoke;
  block[3] = &unk_34E698;
  id v18 = v9;
  id v19 = v7;
  int v21 = a4;
  id v20 = v8;
  BOOL v22 = v12;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  dispatch_sync(v13, block);
}

id __56__MADActivityManager_sendReply_withResult_ofResultName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishClientCommandActivity:*(void *)(a1 + 40) withResult:*(unsigned int *)(a1 + 56) ofResultName:*(void *)(a1 + 48) ableToReply:*(unsigned __int8 *)(a1 + 60)];
}

+ (void)progressForActivity:(id)a3 callingPrimitive:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v6 activityName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logLeader]);

  _MobileAssetLog( 0LL,  5,  (uint64_t)"+[MADActivityManager progressForActivity:callingPrimitive:]",  @"%@ %@ %@...",  v8,  v9,  v10,  v11,  (uint64_t)v12);
}

+ (void)progressForActivity:(id)a3 calledPrimitive:(id)a4 withSuccessResult:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v8 activityName]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 logLeader]);

  if (v5) {
    int v14 = 5;
  }
  else {
    int v14 = 3;
  }
  _MobileAssetLog( 0LL,  v14,  (uint64_t)"+[MADActivityManager progressForActivity:calledPrimitive:withSuccessResult:]",  @"%@ %@ ...%@(%@)",  v10,  v11,  v12,  v13,  (uint64_t)v15);
}

+ (void)progressForActivity:(id)a3 calledPrimitive:(id)a4 withBoolResult:(BOOL)a5
{
  id v6 = a4;
  id v7 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v7 activityName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 logLeader]);

  _MobileAssetLog( 0LL,  5,  (uint64_t)"+[MADActivityManager progressForActivity:calledPrimitive:withBoolResult:]",  @"%@ %@ ...%@(%@)",  v9,  v10,  v11,  v12,  (uint64_t)v13);
}

+ (void)progressForActivity:(id)a3 calledPrimitive:(id)a4 withErrorResult:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  if (a5)
  {
    id v8 = a5;
    uint64_t v9 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"error:%@", v8);

    int v10 = 3;
  }

  else
  {
    uint64_t v9 = @"SUCCESS";
    int v10 = 5;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v17 activityName]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v17 logLeader]);
  _MobileAssetLog( 0LL,  v10,  (uint64_t)"+[MADActivityManager progressForActivity:calledPrimitive:withErrorResult:]",  @"%@ %@ ...%@(%@)",  v12,  v13,  v14,  v15,  (uint64_t)v11);
}

+ (void)transferOwnership:(id)a3 toOwner:(unint64_t)a4 reason:(id)a5
{
  id v7 = a5;
  id v16 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 activityName]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v16 logLeader]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADActivityTracker nameOfLayer:]( MADActivityTracker,  "nameOfLayer:",  [v16 owner]));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADActivityTracker nameOfLayer:]( MADActivityTracker,  "nameOfLayer:",  [v16 owner]));
  _MobileAssetLog( 0LL,  5,  (uint64_t)"+[MADActivityManager transferOwnership:toOwner:reason:]",  @"%@ %@ OWNER %@=>%@ | %@",  v11,  v12,  v13,  v14,  (uint64_t)v8);

  [v16 assignOwner:a4];
}

+ (void)warningForActivity:(id)a3 fromMethod:(id)a4 leaderNote:(id)a5 warning:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  [v11 warningNote:a5 fromMethod:v10 warning:v9];
  id v17 = (id)objc_claimAutoreleasedReturnValue([v11 activityName]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 logLeader]);

  _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager warningForActivity:fromMethod:leaderNote:warning:]",  @"%@ %@ {%@} %@",  v13,  v14,  v15,  v16,  (uint64_t)v17);
}

+ (void)failureOfActivity:(id)a3 withResult:(int)a4 ofResultName:(id)a5 forReason:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  [v11 failureResult:v7 ofResultName:v10 forReason:v9];
  id v17 = (id)objc_claimAutoreleasedReturnValue([v11 activityName]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 logLeader]);

  _MobileAssetLog( 0LL,  3,  (uint64_t)"+[MADActivityManager failureOfActivity:withResult:ofResultName:forReason:]",  @"%@ %@ [%@] %d(%@) | %@",  v13,  v14,  v15,  v16,  (uint64_t)v17);
}

+ (void)noticeForActivity:(id)a3 reason:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v6 activityName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logLeader]);

  _MobileAssetLog( 0LL,  5,  (uint64_t)"+[MADActivityManager noticeForActivity:reason:]",  @"%@ %@ %@",  v8,  v9,  v10,  v11,  (uint64_t)v12);
}

- (id)_clientMADActivityTrackerForClient:(id)a3 withProcessID:(id)a4 withFullID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADActivityManager activityTrackingQueue](self, "activityTrackingQueue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityManager unknownClient](self, "unknownClient"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityManager xpcConnectionByProcessId](self, "xpcConnectionByProcessId"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityManager xpcConnectionByFullId](self, "xpcConnectionByFullId"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v10]);

    if (v16) {
      id v17 = v14;
    }
    else {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[MADActivityManager pidReusedClient](self, "pidReusedClient"));
    }
    goto LABEL_7;
  }

  id v18 = -[MADActivityTracker init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:]( objc_alloc(&OBJC_CLASS___MADActivityTracker),  "init:fromInitiator:ofName:withCategory:forAssetType:associatedWith:",  2LL,  2LL,  v9,  2LL,  0LL,  0LL);
  uint64_t v16 = v18;
  if (v18)
  {
    [v18 associateXPCConnection:v8];
    [v16 setInstanceCount:0];
    [v16 usesChildDict];
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityManager xpcConnectionByProcessId](self, "xpcConnectionByProcessId"));
    [v19 setObject:v16 forKey:v9];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityManager xpcConnectionByFullId](self, "xpcConnectionByFullId"));
    [v20 setObject:v16 forKey:v10];

    id v17 = v16;
    uint64_t v16 = v17;
LABEL_7:
    id v21 = v17;

    id v12 = v21;
  }

  return v12;
}

- (void)_startClientCommandActivity:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADActivityManager activityTrackingQueue](self, "activityTrackingQueue"));
  dispatch_assert_queue_V2(v5);

  [v4 perpareOSActivityScope];
  [v4 enterOSActivityScope];
  +[MADActivityTracker persistedCommand:]( MADActivityTracker,  "persistedCommand:",  [v4 command]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 activityName]);

  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[MADActivityManager _startClientCommandActivity:]",  @"%@ | START",  v6,  v7,  v8,  v9,  (uint64_t)v10);
}

- (void)_finishClientCommandActivity:(id)a3 withResult:(int)a4 ofResultName:(id)a5 ableToReply:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  id v33 = a3;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADActivityManager activityTrackingQueue](self, "activityTrackingQueue"));
  dispatch_assert_queue_V2(v11);

  if ((_DWORD)v8
    || !v6
    || (id v12 = (void *)objc_claimAutoreleasedReturnValue([v33 failureReason]), v12, v12))
  {
    int v13 = 3;
    char v14 = 1;
  }

  else
  {
    char v14 = 0;
    int v13 = 5;
  }

  +[MADActivityTracker persistedCommand:]( MADActivityTracker,  "persistedCommand:",  [v33 command]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v33 failureReason]);
  if (v15) {
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v33 failureReason]);
  }
  else {
    uint64_t v16 = &stru_355768;
  }

  if (v6)
  {
    if ((_DWORD)v8)
    {
      [v33 failureResult:v8 ofResultName:v10 forReason:v16];
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }

    if ((v14 & 1) != 0)
    {
      [v33 successWithIssue:v16];
      if (!v10) {
        goto LABEL_18;
      }
LABEL_14:
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v33 activityName]);
      _MobileAssetLog( 0LL,  v13,  (uint64_t)"-[MADActivityManager _finishClientCommandActivity:withResult:ofResultName:ableToReply:]",  @"%@ | FINISH | %@ | %d(%@)",  v20,  v21,  v22,  v23,  (uint64_t)v19);
      goto LABEL_20;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v33 stats]);
    objc_msgSend(v18, "setSuccessfulOperations:", (char *)objc_msgSend(v18, "successfulOperations") + 1);
  }

  else
  {
    id v17 = stringForMAXpcError(8uLL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v33 failureResult:8 ofResultName:v18 forReason:@"finishing command processing when unable to reply"];
  }

  if (v10) {
    goto LABEL_14;
  }
LABEL_18:
  if ((_DWORD)v8)
  {
LABEL_19:
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v33 activityName]);
    _MobileAssetLog( 0LL,  v13,  (uint64_t)"-[MADActivityManager _finishClientCommandActivity:withResult:ofResultName:ableToReply:]",  @"%@ | FINISH | %@ | %d",  v24,  v25,  v26,  v27,  (uint64_t)v19);
    goto LABEL_20;
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue([v33 activityName]);
  id v19 = (void *)v28;
  if (v6) {
    _MobileAssetLog( 0LL,  v13,  (uint64_t)"-[MADActivityManager _finishClientCommandActivity:withResult:ofResultName:ableToReply:]",  @"%@ | FINISH | %@ | SUCCESS",  v29,  v30,  v31,  v32,  v28);
  }
  else {
    _MobileAssetLog( 0LL,  v13,  (uint64_t)"-[MADActivityManager _finishClientCommandActivity:withResult:ofResultName:ableToReply:]",  @"%@ | FINISH | %@ | UNABLE TO REPLY",  v29,  v30,  v31,  v32,  v28);
  }
LABEL_20:

  [v33 leaveOSActivityScope];
}

+ (BOOL)notifyStatusChange:(unint64_t)a3 forClient:(id)a4 withReason:(id)a5
{
  id v5 = a4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MADActivityManager sharedActivityManager](&OBJC_CLASS___MADActivityManager, "sharedActivityManager"));
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 activityTrackingQueue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __62__MADActivityManager_notifyStatusChange_forClient_withReason___block_invoke;
  v11[3] = &unk_34DB98;
  id v12 = v6;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(v7, v11);

  return 0;
}

void __62__MADActivityManager_notifyStatusChange_forClient_withReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _clientForConnection:*(void *)(a1 + 40)]);
  id v7 = v2;
  if (!v2)
  {
    objc_msgSend( *(id *)(a1 + 32),  "setStatusChangeNoClientTracker:",  (char *)objc_msgSend(*(id *)(a1 + 32), "statusChangeNoClientTracker") + 1);
    goto LABEL_13;
  }

  uint64_t v3 = (char *)[v2 owner];
  if (v3 == (_BYTE *)&dword_0 + 2)
  {
    id DownloadManager = getDownloadManager();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    if (!v5) {
      objc_msgSend( *(id *)(a1 + 32),  "setStatusChangeNoDownloadManager:",  (char *)objc_msgSend(*(id *)(a1 + 32), "statusChangeNoDownloadManager") + 1);
    }
    goto LABEL_11;
  }

  if (v3 == (_BYTE *)&dword_0 + 1)
  {
    id ControlManager = getControlManager();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
    if (!v5) {
      objc_msgSend( *(id *)(a1 + 32),  "setStatusChangeNoControlManager:",  (char *)objc_msgSend(*(id *)(a1 + 32), "statusChangeNoControlManager") + 1);
    }
LABEL_11:

    goto LABEL_13;
  }

  if (v3) {
    objc_msgSend( *(id *)(a1 + 32),  "setStatusChangeUnknownOwner:",  (char *)objc_msgSend(*(id *)(a1 + 32), "statusChangeUnknownOwner") + 1);
  }
  else {
    objc_msgSend( *(id *)(a1 + 32),  "setStatusChangeNoTrackerOwner:",  (char *)objc_msgSend(*(id *)(a1 + 32), "statusChangeNoTrackerOwner") + 1);
  }
LABEL_13:
}

- (MADActivityTracker)managerActivity
{
  return self->_managerActivity;
}

- (MADActivityTracker)unknownClient
{
  return self->_unknownClient;
}

- (MADActivityTracker)pidReusedClient
{
  return self->_pidReusedClient;
}

- (MADActivityTracker)untrackedCommandType
{
  return self->_untrackedCommandType;
}

- (MADActivityTracker)untrackedCommand
{
  return self->_untrackedCommand;
}

- (OS_dispatch_queue)activityTrackingQueue
{
  return self->_activityTrackingQueue;
}

- (NSMutableDictionary)xpcConnectionByProcessId
{
  return self->_xpcConnectionByProcessId;
}

- (NSMutableDictionary)xpcConnectionByFullId
{
  return self->_xpcConnectionByFullId;
}

- (unint64_t)connectionNoClientTracker
{
  return self->_connectionNoClientTracker;
}

- (void)setConnectionNoClientTracker:(unint64_t)a3
{
  self->_connectionNoClientTracker = a3;
}

- (unint64_t)connectionNoClientIdentifier
{
  return self->_connectionNoClientIdentifier;
}

- (void)setConnectionNoClientIdentifier:(unint64_t)a3
{
  self->_connectionNoClientIdentifier = a3;
}

- (unint64_t)connectionReplyAllocationFailure
{
  return self->_connectionReplyAllocationFailure;
}

- (void)setConnectionReplyAllocationFailure:(unint64_t)a3
{
  self->_connectionReplyAllocationFailure = a3;
}

- (unint64_t)connectionNonDictionaryEvent
{
  return self->_connectionNonDictionaryEvent;
}

- (void)setConnectionNonDictionaryEvent:(unint64_t)a3
{
  self->_connectionNonDictionaryEvent = a3;
}

- (unint64_t)connectionMissingRequired
{
  return self->_connectionMissingRequired;
}

- (void)setConnectionMissingRequired:(unint64_t)a3
{
  self->_connectionMissingRequired = a3;
}

- (unint64_t)statusChangeNoClientTracker
{
  return self->_statusChangeNoClientTracker;
}

- (void)setStatusChangeNoClientTracker:(unint64_t)a3
{
  self->_statusChangeNoClientTracker = a3;
}

- (unint64_t)statusChangeNoTrackerOwner
{
  return self->_statusChangeNoTrackerOwner;
}

- (void)setStatusChangeNoTrackerOwner:(unint64_t)a3
{
  self->_statusChangeNoTrackerOwner = a3;
}

- (unint64_t)statusChangeNoControlManager
{
  return self->_statusChangeNoControlManager;
}

- (void)setStatusChangeNoControlManager:(unint64_t)a3
{
  self->_statusChangeNoid ControlManager = a3;
}

- (unint64_t)statusChangeNoDownloadManager
{
  return self->_statusChangeNoDownloadManager;
}

- (void)setStatusChangeNoDownloadManager:(unint64_t)a3
{
  self->_statusChangeNoid DownloadManager = a3;
}

- (unint64_t)statusChangeUnknownOwner
{
  return self->_statusChangeUnknownOwner;
}

- (void)setStatusChangeUnknownOwner:(unint64_t)a3
{
  self->_statusChangeUnknownOwner = a3;
}

- (unint64_t)statusChangeUnknownXPCError
{
  return self->_statusChangeUnknownXPCError;
}

- (void)setStatusChangeUnknownXPCError:(unint64_t)a3
{
  self->_statusChangeUnknownXPCError = a3;
}

- (unint64_t)statusChangeUnknownXPCType
{
  return self->_statusChangeUnknownXPCType;
}

- (void)setStatusChangeUnknownXPCType:(unint64_t)a3
{
  self->_statusChangeUnknownXPCType = a3;
}

- (void).cxx_destruct
{
}

@end