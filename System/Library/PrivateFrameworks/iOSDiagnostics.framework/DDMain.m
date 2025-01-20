@interface DDMain
+ (id)sharedInstance;
- (DAIDSMessageReceiver)localReceiver;
- (DDIDSService)pairedService;
- (DDMain)init;
- (NSMutableArray)connections;
- (void)addConnection:(id)a3;
- (void)availableDestinationsWithCompletion:(id)a3;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)removeConnection:(id)a3;
- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (void)setConnections:(id)a3;
- (void)setLocalReceiver:(id)a3;
- (void)setPairedService:(id)a3;
@end

@implementation DDMain

- (DDMain)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DDMain;
  v2 = -[DDMain init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    connections = v2->_connections;
    v2->_connections = v3;

    v5 = -[DDIDSService initWithServiceType:](objc_alloc(&OBJC_CLASS___DDIDSService), "initWithServiceType:", 0LL);
    pairedService = v2->_pairedService;
    v2->_pairedService = v5;

    -[DDIDSService setReceiver:](v2->_pairedService, "setReceiver:", v2);
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_100022598 != -1) {
    dispatch_once(&qword_100022598, &stru_1000187A0);
  }
  return (id)qword_100022590;
}

- (void)addConnection:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeConnection:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
  [v5 removeObject:v9];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain localReceiver](self, "localReceiver"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___DDWatchMessageReceiver);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0) {
    -[DDMain setLocalReceiver:](self, "setLocalReceiver:", 0LL);
  }
  objc_sync_exit(v4);
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain pairedService](self, "pairedService"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007EA4;
  v9[3] = &unk_1000187C8;
  v10 = v5;
  id v11 = v4;
  id v7 = v4;
  objc_super v8 = v5;
  [v6 availableDestinationsWithCompletion:v9];
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain pairedService](self, "pairedService"));
  unsigned int v18 = [v17 hasDestination:v15];

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain pairedService](self, "pairedService"));
    [v19 sendMessage:v20 data:v14 toDestination:v15 forceLocalDelivery:v10 expectsResponse:v9 response:v16];
  }

  else
  {
    (*((void (**)(id, void, void, void, void))v16 + 2))(v16, 0LL, 0LL, 0LL, 0LL);
  }
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v32 = a4;
  id v33 = a5;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
  objc_sync_enter(v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
  objc_sync_exit(v14);

  v31 = v15;
  if ([v15 count])
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain connections](self, "connections"));
    id v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v34 + 1) + 8 * (void)i) remoteObjectProxyWithErrorHandler:&stru_1000187E8]);
          uint64_t v21 = DiagnosticLogHandleForCategory(7LL);
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v39 = v12;
            __int16 v40 = 2112;
            v41 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Routing message: %@ to remote object proxy: %@",  buf,  0x16u);
          }

          [v20 receiveMessage:v12 data:v32 fromDestination:v33 expectsResponse:v8 response:v13];
        }

        id v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }

      while (v17);
    }
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain localReceiver](self, "localReceiver"));

    if (!v23)
    {
      v24 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
      if ([v24 isEqualToString:@"Watch"])
      {
        uint64_t v25 = DiagnosticLogHandleForCategory(7LL);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Creating local receiver for Apple Watch",  buf,  2u);
        }

        v27 = -[DDWatchMessageReceiver initWithDestination:]( objc_alloc(&OBJC_CLASS___DDWatchMessageReceiver),  "initWithDestination:",  v33);
        -[DDMain setLocalReceiver:](self, "setLocalReceiver:", v27);
      }
    }

    uint64_t v28 = DiagnosticLogHandleForCategory(7LL);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain localReceiver](self, "localReceiver"));
      *(_DWORD *)buf = 138412546;
      id v39 = v12;
      __int16 v40 = 2112;
      v41 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Routing message: %@ to local reciever: %@",  buf,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DDMain localReceiver](self, "localReceiver"));
    [v16 receiveMessage:v12 data:v32 fromDestination:v33 expectsResponse:v8 response:v13];
  }
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (DDIDSService)pairedService
{
  return self->_pairedService;
}

- (void)setPairedService:(id)a3
{
}

- (DAIDSMessageReceiver)localReceiver
{
  return self->_localReceiver;
}

- (void)setLocalReceiver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end