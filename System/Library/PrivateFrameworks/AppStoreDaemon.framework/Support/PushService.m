@interface PushService
- (PushService)init;
- (void)_handleAccountDidChangeNotification:(id)a3;
- (void)_handleBagChangedNotification:(id)a3;
- (void)handleSandboxAccountDidChangeNotification:(id)a3;
- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4;
- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5;
- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4;
- (void)testFlightConsumer:(id)a3 didChangeStatus:(BOOL)a4;
@end

@implementation PushService

- (PushService)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PushService;
  v2 = -[PushService init](&v23, "init");
  if (v2)
  {
    dispatch_queue_t v3 = sub_10022ED60("com.apple.appstored.StorePushService", QOS_CLASS_UTILITY);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    consumers = v2->_consumers;
    v2->_consumers = (NSMapTable *)v6;

    v8 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    pendingActionTypeCount = v2->_pendingActionTypeCount;
    v2->_pendingActionTypeCount = v8;

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    CFPropertyListRef v10 = sub_1002FA72C((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_pendingActionTypeCount,  "setObject:forKeyedSubscript:",  &off_10040CDD8,  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15),  (void)v19);
          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v13);
    }

    if (os_variant_has_internal_content("com.apple.appstored"))
    {
      v16 = (PushDiagnostic *)sub_100231980(objc_alloc(&OBJC_CLASS___PushDiagnostic), v2);
      pushDiagnostic = v2->_pushDiagnostic;
      v2->_pushDiagnostic = v16;
    }
  }

  return v2;
}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 actionType]);
  unsigned int v8 = [v7 isEqualToString:AMSPushActionTypeBadging];

  if (v8)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10028F708;
    block[3] = &unk_1003E9880;
    id v11 = v6;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4
{
  id v6 = a3;
  v7 = a4;
  unsigned int v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v9 = v7[1];
  switch(v9)
  {
    case 1LL:
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      unsigned int v13 = [v12 applicationIsInstalled:@"com.apple.TVAppStore"];

      if (!v13) {
        goto LABEL_11;
      }
LABEL_10:
      sub_10028F8A8((uint64_t)self, v8, v6);
      goto LABEL_11;
    case 3LL:
      goto LABEL_10;
    case 2LL:
      if (self) {
        -[PushServiceTestFlightConsumer pushConnection:didReceiveRawMessage:]( self->_testFlightConsumer,  "pushConnection:didReceiveRawMessage:",  v6,  v7);
      }
      goto LABEL_11;
  }

- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5
{
  if (a5 == 2) {
    -[PushServiceTestFlightConsumer pushConnection:didReceiveToken:forTopic:]( self->_testFlightConsumer,  "pushConnection:didReceiveToken:forTopic:",  a3,  a4);
  }
}

- (void)testFlightConsumer:(id)a3 didChangeStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = ASDLogHandleForCategory(26LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = @"disabled";
    if (v4) {
      unsigned int v8 = @"enabled";
    }
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "TestFlight push service consumer changed status to: %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  sub_100190038((uint64_t)self->_connection, v4);
  connection = self->_connection;
  if (v4) {
    sub_100190610((uint64_t)connection, 2LL);
  }
  else {
    sub_100190828((uint64_t)connection, 2LL);
  }
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002900F0;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100290174;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)handleSandboxAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100290340;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
}

@end