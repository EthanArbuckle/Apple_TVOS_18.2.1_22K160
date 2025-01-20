@interface FAPushHelperService
+ (id)sharedInstance;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (FAFamilyNotifier)familyNotifier;
- (FAPushHelperService)init;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)setFamilyNotifier:(id)a3;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
- (void)start;
- (void)startNewConnection;
- (void)stop;
@end

@implementation FAPushHelperService

+ (id)sharedInstance
{
  if (qword_1000526F8 != -1) {
    dispatch_once(&qword_1000526F8, &stru_100041748);
  }
  return (id)qword_1000526F0;
}

- (FAPushHelperService)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___FAPushHelperService;
  v2 = -[FAPushHelperService init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___FAEventPushHandler);
    eventPushHandler = v2->_eventPushHandler;
    v2->_eventPushHandler = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"com.icloud.family", 0LL));
    pushTpoics = v2->_pushTpoics;
    v2->_pushTpoics = (NSSet *)v5;

    v7 = v2->_eventPushHandler;
    v8 = objc_alloc_init(&OBJC_CLASS___FAFollowupPushHandler);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v7, v8, 0LL));
    pushHandlers = v2->_pushHandlers;
    v2->_pushHandlers = (NSArray *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.family.aps_queue", v12);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v13;

    v15 = -[FAFamilyNotifier initWithIdentifier:machServiceName:]( objc_alloc(&OBJC_CLASS___FAFamilyNotifier),  "initWithIdentifier:machServiceName:",  @"com.apple.familycircled",  @"com.apple.family.notifier");
    familyNotifier = v2->_familyNotifier;
    v2->_familyNotifier = v15;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = _FALogSystem(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down APS connection.", buf, 2u);
  }

  -[FAPushHelperService stop](self, "stop");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FAPushHelperService;
  -[FAPushHelperService dealloc](&v5, "dealloc");
}

- (void)start
{
  if (self->_connection)
  {
    uint64_t v2 = _FALogSystem();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "APS connection is already active.", v4, 2u);
    }
  }

  else
  {
    -[FAPushHelperService startNewConnection](self, "startNewConnection");
  }

- (void)stop
{
  connection = self->_connection;
  self->_connection = 0LL;
}

- (void)startNewConnection
{
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A82C;
  block[3] = &unk_100041798;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  uint64_t v6 = _FALogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "APS public token received: %@",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _FALogSystem(v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    *(_DWORD *)buf = 138412546;
    v31 = v9;
    __int16 v32 = 2112;
    v33 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received new incoming message from APS. %@ - %@",  buf,  0x16u);
  }

  dispatch_queue_attr_t v11 = -[FAPushMessage initWithMessage:](objc_alloc(&OBJC_CLASS___FAPushMessage), "initWithMessage:", v5);
  BOOL v12 = -[FAPushMessage isValid](v11, "isValid");
  if (v12)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v14 = self->_pushHandlers;
    id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v20 = objc_msgSend(v19, "shouldProcess:", v11, (void)v25);
          if ((_DWORD)v20)
          {
            uint64_t v22 = _FALogSystem(v20, v21);
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Found a handler, processing push.",  buf,  2u);
            }

            [v19 process:v11];
          }
        }

        id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      }

      while (v16);
    }
  }

  else
  {
    uint64_t v24 = _FALogSystem(v12, v13);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_10002A574((os_log_t)v14);
    }
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = _FALogSystem(self, a2, a3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v4) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "APS connection status changed! isConnected: %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v3 = _FALogSystem(self, a2, a3);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "APS connection reconnected.", v5, 2u);
  }
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return -[FAEventPushHandler familyRefreshActivityScheduler](self->_eventPushHandler, "familyRefreshActivityScheduler");
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (FAFamilyNotifier)familyNotifier
{
  return self->_familyNotifier;
}

- (void)setFamilyNotifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end