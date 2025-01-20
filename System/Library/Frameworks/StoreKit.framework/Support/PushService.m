@interface PushService
+ (id)_pushHandlerWithBagContract:(id)a3;
+ (id)sharedInstance;
- (PushService)init;
- (PushService)initWithConnection:(id)a3;
- (void)_flushPendingMessagesWithActionType:(id)a3;
- (void)_handleBagChangedNotification:(id)a3;
- (void)_initializeConnectionsAndSkipEnvironmentCheck:(BOOL)a3;
- (void)_processReceivedMessage:(id)a3 withConnection:(id)a4;
- (void)_queuePendingMessage:(id)a3 withActionType:(id)a4;
- (void)_unitTest_waitForSetup;
- (void)pushConnection:(id)a3 didRecieveMessage:(id)a4;
- (void)registerConsumer:(id)a3 forActionType:(unint64_t)a4;
- (void)unregisterConsumerForActionType:(unint64_t)a3;
@end

@implementation PushService

+ (id)sharedInstance
{
  if (qword_10032EBD8 != -1) {
    dispatch_once(&qword_10032EBD8, &stru_1002E9B08);
  }
  return (id)qword_10032EBD0;
}

- (PushService)init
{
  return -[PushService initWithConnection:](self, "initWithConnection:", 0LL);
}

- (PushService)initWithConnection:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PushService;
  v6 = -[PushService init](&v26, "init");
  if (v6)
  {
    dispatch_queue_t v7 = sub_100077DD8("com.apple.storekit.StorePushService", QOS_CLASS_UTILITY);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    consumers = v6->_consumers;
    v6->_consumers = (NSMapTable *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingMessages = v6->_pendingMessages;
    v6->_pendingMessages = v12;

    if (v5)
    {
      objc_storeStrong((id *)&v6->_connection, a3);
      [v5 setDelegate:v6];
    }

    v14 = (dispatch_queue_s *)v6->_dispatchQueue;
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_100063C84;
    v23 = &unk_1002E78B8;
    v15 = v6;
    v24 = v15;
    id v25 = v5;
    dispatch_async(v14, &v20);
    if (os_variant_has_internal_content("com.apple.storekitd"))
    {
      v16 = objc_alloc(&OBJC_CLASS___PushDiagnostic);
      v17 = -[PushDiagnostic initWithService:](v16, "initWithService:", v15, v20, v21, v22, v23, v24);
      pushDiagnostic = v15->_pushDiagnostic;
      v15->_pushDiagnostic = v17;
    }
  }

  return v6;
}

- (void)registerConsumer:(id)a3 forActionType:(unint64_t)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063DBC;
  block[3] = &unk_1002E86E8;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)unregisterConsumerForActionType:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100063EF0;
  v4[3] = &unk_1002E6A28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (void)pushConnection:(id)a3 didRecieveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064060;
  block[3] = &unk_1002E9128;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

+ (id)_pushHandlerWithBagContract:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___AMSPushConfiguration);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"4", @"22", 0LL));
  [v4 setEnabledActionTypes:v5];

  id v6 = -[AMSPushHandler initWithConfiguration:bag:]( objc_alloc(&OBJC_CLASS___AMSPushHandler),  "initWithConfiguration:bag:",  v4,  v3);
  return v6;
}

- (void)_flushPendingMessagesWithActionType:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMessages, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_consumers, "objectForKey:", v4));
    if (v6)
    {
      if (qword_10032EC28 != -1) {
        dispatch_once(&qword_10032EC28, &stru_1002E9B48);
      }
      id v7 = (void *)qword_10032EC00;
      if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_INFO))
      {
        id v8 = v7;
        *(_DWORD *)buf = 134218242;
        id v21 = [v5 count];
        __int16 v22 = 2114;
        id v23 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Flushing %lu message(s) for action type: %{public}@",  buf,  0x16u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingMessages,  "setObject:forKeyedSubscript:",  0LL,  v4);
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend( v6,  "pushService:didReceiveMessage:",  self,  *(void *)(*((void *)&v15 + 1) + 8 * (void)i),  (void)v15);
          }

          id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v11);
      }
    }

    else
    {
      if (qword_10032EC28 != -1) {
        dispatch_once(&qword_10032EC28, &stru_1002E9B48);
      }
      v14 = (void *)qword_10032EC00;
      if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_ERROR)) {
        sub_100262980(v14, v5, (uint64_t)v4);
      }
    }
  }
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000643AC;
  block[3] = &unk_1002E7958;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_initializeConnectionsAndSkipEnvironmentCheck:(BOOL)a3
{
  id v5 = APSEnvironmentProduction;
  if (a3)
  {
    if (qword_10032EC28 != -1) {
      dispatch_once(&qword_10032EC28, &stru_1002E9B48);
    }
    id v6 = (os_log_s *)qword_10032EC00;
    if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Skipping environment check and defaulting to: %{public}@",  buf,  0xCu);
    }

    id v7 = 0LL;
    if (!v5) {
      goto LABEL_18;
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[Bag defaultBag](&OBJC_CLASS____TtC9storekitd3Bag, "defaultBag"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey pushEnvironment](&OBJC_CLASS____TtC9storekitd6BagKey, "pushEnvironment"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForKey:v9]);
    id v18 = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 valueWithError:&v18]);
    id v7 = v18;

    id v5 = (id)v11;
    if (!v11)
    {
LABEL_18:
      if (self->_connection)
      {
        if (qword_10032EC28 != -1) {
          dispatch_once(&qword_10032EC28, &stru_1002E9B48);
        }
        if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_ERROR)) {
          sub_100262A80();
        }
      }

      else
      {
        if (qword_10032EC28 != -1) {
          dispatch_once(&qword_10032EC28, &stru_1002E9B48);
        }
        if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_ERROR)) {
          sub_100262A20();
        }
      }

      goto LABEL_27;
    }
  }

  if (-[NSString isEqualToString:](self->_environment, "isEqualToString:", v5)) {
    goto LABEL_27;
  }
  objc_storeStrong((id *)&self->_environment, v5);
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  pendingMessages = self->_pendingMessages;
  self->_pendingMessages = v12;

  if (self->_connection)
  {
    if (qword_10032EC28 != -1) {
      dispatch_once(&qword_10032EC28, &stru_1002E9B48);
    }
    v14 = (os_log_s *)qword_10032EC00;
    if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Shutting down existing connection before starting up in new environment: %{public}@",  buf,  0xCu);
    }

    -[PushConnection shutdown](self->_connection, "shutdown");
    connection = self->_connection;
    self->_connection = 0LL;
  }

  __int128 v16 = -[PushConnection initWithEnvironment:queue:]( objc_alloc(&OBJC_CLASS___PushConnection),  "initWithEnvironment:queue:",  v5,  self->_dispatchQueue);
  __int128 v17 = self->_connection;
  self->_connection = v16;

  -[PushConnection setDelegate:](self->_connection, "setDelegate:", self);
LABEL_27:
}

- (void)_processReceivedMessage:(id)a3 withConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 actionType] == (id)-1)
  {
    if (qword_10032EC28 != -1) {
      dispatch_once(&qword_10032EC28, &stru_1002E9B48);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_ERROR)) {
      sub_100262AE0();
    }
  }

  else
  {
    if (qword_10032EC28 != -1) {
      dispatch_once(&qword_10032EC28, &stru_1002E9B48);
    }
    id v8 = (os_log_s *)qword_10032EC00;
    if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_INFO))
    {
      int v20 = 138543618;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Connection: %{public}@ received incoming message: %{public}@",  (uint8_t *)&v20,  0x16u);
    }

    pushHandler = self->_pushHandler;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    LODWORD(pushHandler) = -[AMSPushHandler shouldHandleNotification:]( pushHandler,  "shouldHandleNotification:",  v10);

    if ((_DWORD)pushHandler)
    {
      uint64_t v11 = self->_pushHandler;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      -[AMSPushHandler handleNotification:](v11, "handleNotification:", v12);
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_activeiTunesAccount"));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_DSID"));

      if (v12)
      {
        if (([v15 isEqualToNumber:v12] & 1) == 0)
        {
          if (qword_10032EC28 != -1) {
            dispatch_once(&qword_10032EC28, &stru_1002E9B48);
          }
          __int128 v16 = (os_log_s *)qword_10032EC00;
          if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_DEBUG))
          {
            int v20 = 138543875;
            id v21 = v7;
            __int16 v22 = 2113;
            id v23 = v12;
            __int16 v24 = 2113;
            id v25 = v15;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Connection: %{public}@ received push for %{private}@ but active is: %{private}@",  (uint8_t *)&v20,  0x20u);
          }
        }
      }

      else
      {
        if (qword_10032EC28 != -1) {
          dispatch_once(&qword_10032EC28, &stru_1002E9B48);
        }
        if (os_log_type_enabled((os_log_t)qword_10032EC00, OS_LOG_TYPE_DEBUG)) {
          sub_100262B40();
        }
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 actionType]));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_consumers, "objectForKey:", v17));
      v19 = v18;
      if (v18) {
        [v18 pushService:self didReceiveMessage:v6];
      }
      else {
        -[PushService _queuePendingMessage:withActionType:](self, "_queuePendingMessage:withActionType:", v6, v17);
      }
    }
  }
}

- (void)_queuePendingMessage:(id)a3 withActionType:(id)a4
{
  id v11 = a4;
  dispatchQueue = self->_dispatchQueue;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingMessages,  "objectForKeyedSubscript:",  v11));
  id v9 = v8;
  if (v8)
  {
    [v8 addObject:v7];
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v7));

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingMessages,  "setObject:forKeyedSubscript:",  v10,  v11);
    id v7 = (id)v10;
  }
}

- (void)_unitTest_waitForSetup
{
}

- (void).cxx_destruct
{
}

@end