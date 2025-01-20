@interface GTServiceDaemon
- (BOOL)deviceIsHandledLocally:(id)a3;
- (GTServiceDaemon)init;
- (id)connectionForDeviceUDID:(id)a3;
- (id)connectionForServicePort:(unint64_t)a3;
- (unint64_t)currentRemoteRelayPid;
- (void)broadcastDisconnection:(id)a3 connectionId:(unint64_t)a4;
- (void)enterRunLoop;
- (void)handleConnection:(id)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleMessage:(id)a3 fromConnection:(id)a4;
- (void)handleMessageBroadcast:(id)a3 fromConnection:(id)a4;
- (void)handleMessageDaemon:(id)a3 fromConnection:(id)a4;
- (void)patchMessage:(id)a3;
- (void)registerServices;
- (void)relayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5;
- (void)updateAndRelayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5;
- (void)updateMessage:(id)a3 sourceConnection:(id)a4;
- (void)updateMessagePath:(id)a3 sourceConnection:(id)a4;
@end

@implementation GTServiceDaemon

- (GTServiceDaemon)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___GTServiceDaemon;
  v2 = -[GTServiceDaemon init](&v23, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gputools.transport", "ServiceDaemon");
    log = v2->_log;
    v2->_log = v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Agent Launched", v22, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    daemonId = v2->_daemonId;
    v2->_daemonId = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](&OBJC_CLASS___GTDeviceProperties, "uniqueDeviceID"));
    deviceUDID = v2->_deviceUDID;
    v2->_deviceUDID = (NSString *)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    portToConnection = v2->_portToConnection;
    v2->_portToConnection = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    portToDispatcher = v2->_portToDispatcher;
    v2->_portToDispatcher = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___GTConnectionMap);
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.gputoolsserviced.main", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v17;

    v19 = -[GTServiceVendor initWithConnectionProvider:]( objc_alloc(&OBJC_CLASS___GTServiceVendor),  "initWithConnectionProvider:",  v2);
    serviceVendor = v2->_serviceVendor;
    v2->_serviceVendor = v19;

    -[GTServiceDaemon registerServices](v2, "registerServices");
  }

  return v2;
}

- (void)registerServices
{
  v29 = objc_opt_new(&OBJC_CLASS___GTProcessInfo);
  os_log_t v3 = objc_alloc_init(&OBJC_CLASS___GTServiceProvider);
  serviceProvider = self->_serviceProvider;
  self->_serviceProvider = v3;

  v5 = -[GTServiceProperties initWithProtocol:]( objc_alloc(&OBJC_CLASS___GTServiceProperties),  "initWithProtocol:",  &OBJC_PROTOCOL___GTServiceProvider);
  -[GTServiceProperties setVersion:](v5, "setVersion:", 2LL);
  -[GTServiceProvider registerDefaultServiceProvider:forProcess:]( self->_serviceProvider,  "registerDefaultServiceProvider:forProcess:",  v5,  v29);
  -[GTServiceVendor addLocalService:forPort:]( self->_serviceVendor,  "addLocalService:forPort:",  self->_serviceProvider,  -[GTServiceProperties servicePort](v5, "servicePort"));
  v6 = -[GTServiceProviderXPCDispatcher initWithService:properties:]( objc_alloc(&OBJC_CLASS___GTServiceProviderXPCDispatcher),  "initWithService:properties:",  self->_serviceProvider,  v5);
  -[GTServiceProviderXPCDispatcher setConnections:](v6, "setConnections:", self->_portToConnection);
  portToDispatcher = self->_portToDispatcher;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[GTServiceProperties servicePort](v5, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](portToDispatcher, "setObject:forKeyedSubscript:", v6, v8);

  uint64_t v9 = -[GTServiceProperties initWithProtocol:]( objc_alloc(&OBJC_CLASS___GTServiceProperties),  "initWithProtocol:",  &OBJC_PROTOCOL___GTLaunchService);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v9, v29);
  v10 = -[GTLaunchService initWithServiceProvider:]( objc_alloc(&OBJC_CLASS___GTLaunchService),  "initWithServiceProvider:",  self->_serviceProvider);
  -[GTServiceVendor addLocalService:forPort:]( self->_serviceVendor,  "addLocalService:forPort:",  v10,  -[GTServiceProperties servicePort](v9, "servicePort"));
  v11 = -[GTLaunchServiceXPCDispatcher initWithService:properties:]( objc_alloc(&OBJC_CLASS___GTLaunchServiceXPCDispatcher),  "initWithService:properties:",  v10,  v9);
  v12 = self->_portToDispatcher;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[GTServiceProperties servicePort](v9, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  v14 = -[GTServiceProperties initWithProtocol:]( objc_alloc(&OBJC_CLASS___GTServiceProperties),  "initWithProtocol:",  &OBJC_PROTOCOL___GTDeviceCapabilities);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v14, v29);
  v15 = objc_alloc_init(&OBJC_CLASS___GTDeviceCapabilities);
  -[GTServiceVendor addLocalService:forPort:]( self->_serviceVendor,  "addLocalService:forPort:",  v15,  -[GTServiceProperties servicePort](v14, "servicePort"));
  v16 = -[GTDeviceCapabilitiesXPCDispatcher initWithService:properties:]( objc_alloc(&OBJC_CLASS___GTDeviceCapabilitiesXPCDispatcher),  "initWithService:properties:",  v15,  v14);
  dispatch_queue_t v17 = self->_portToDispatcher;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[GTServiceProperties servicePort](v14, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

  v19 = -[GTServiceProperties initWithProtocol:]( objc_alloc(&OBJC_CLASS___GTServiceProperties),  "initWithProtocol:",  &OBJC_PROTOCOL___GTURLAccessProvider);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v19, v29);
  v20 = -[GTURLAccessProvider initWithServiceProvider:connectionProvider:serviceVendor:]( objc_alloc(&OBJC_CLASS___GTURLAccessProvider),  "initWithServiceProvider:connectionProvider:serviceVendor:",  self->_serviceProvider,  self,  self->_serviceVendor);
  -[GTServiceVendor addLocalService:forPort:]( self->_serviceVendor,  "addLocalService:forPort:",  v20,  -[GTServiceProperties servicePort](v19, "servicePort"));
  v21 = -[GTURLAccessProviderXPCDispatcher initWithService:properties:]( objc_alloc(&OBJC_CLASS___GTURLAccessProviderXPCDispatcher),  "initWithService:properties:",  v20,  v19);
  v22 = self->_portToDispatcher;
  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[GTServiceProperties servicePort](v19, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

  v24 = -[GTServiceProperties initWithProtocol:]( objc_alloc(&OBJC_CLASS___GTServiceProperties),  "initWithProtocol:",  &OBJC_PROTOCOL___GTLoopbackService);
  -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", v24, v29);
  v25 = objc_alloc_init(&OBJC_CLASS___GTLoopbackService);
  -[GTServiceVendor addLocalService:forPort:]( self->_serviceVendor,  "addLocalService:forPort:",  v25,  -[GTServiceProperties servicePort](v24, "servicePort"));
  v26 = -[GTLoopbackServiceXPCDispatcher initWithService:properties:]( objc_alloc(&OBJC_CLASS___GTLoopbackServiceXPCDispatcher),  "initWithService:properties:",  v25,  v24);
  v27 = self->_portToDispatcher;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[GTServiceProperties servicePort](v24, "servicePort")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v26, v28);
}

- (void)enterRunLoop
{
  mach_service = xpc_connection_create_mach_service( "com.apple.gputools.service",  (dispatch_queue_t)self->_serialQueue,  1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001A114;
  handler[3] = &unk_100030E50;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_activate(mach_service);
  dispatch_main();
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  v5 = xpc_copy_description(v4);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Connection: New:%s", buf, 0xCu);
  }

  free(v5);
  uint64_t v7 = dispatch_queue_create("com.apple.gputoolsserviced.connectionTarget", 0LL);
  xpc_connection_set_target_queue((xpc_connection_t)v4, v7);
  v8 = -[GTEntitlementCheckingConnection initWithTransactionScopedXPCConnection:messageQueue:]( objc_alloc(&OBJC_CLASS___GTEntitlementCheckingConnection),  "initWithTransactionScopedXPCConnection:messageQueue:",  v4,  self->_serialQueue);

  -[GTConnectionMap insert:](self->_connectionMap, "insert:", v8);
  objc_initWeak((id *)buf, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001A078;
  v11[3] = &unk_100030E78;
  objc_copyWeak(&v12, (id *)buf);
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001A0CC;
  v9[3] = &unk_100030E78;
  objc_copyWeak(&v10, (id *)buf);
  v9[4] = self;
  -[GTLocalXPCConnection activateWithMessageHandler:andErrorHandler:]( v8,  "activateWithMessageHandler:andErrorHandler:",  v11,  v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)handleDisconnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
  v6 = xpc_copy_description(v5);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Connection: Disconnect:%s", (uint8_t *)&v9, 0xCu);
  }

  free(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_portToConnection, "allKeysForObject:", v4));
  -[GTServiceProvider disconnectServicePorts:](self->_serviceProvider, "disconnectServicePorts:", v8);
  -[NSMutableDictionary removeObjectsForKeys:](self->_portToConnection, "removeObjectsForKeys:", v8);
  -[GTServiceDaemon broadcastDisconnection:connectionId:]( self,  "broadcastDisconnection:connectionId:",  v4,  -[GTConnectionMap remove:](self->_connectionMap, "remove:", v4));
}

- (void)broadcastDisconnection:(id)a3 connectionId:(unint64_t)a4
{
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v31 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Broadcast Disconnection of Connection ID %lu",  buf,  0xCu);
  }

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_flag(empty, "_flags", 1);
  xpc_dictionary_set_flag(empty, "_flags", 2);
  xpc_dictionary_set_string(empty, "_cmd", "broadcastDisconnect");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  int v9 = self->_portToDispatcher;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_portToDispatcher,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)i)));
        [v14 dispatchMessage:empty replyConnection:v6];
      }

      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    }

    while (v11);
  }

  MessagePathPush(empty, a4);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionMap connections](self->_connectionMap, "connections", 0LL));
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) sendMessage:empty];
      }

      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v17);
  }
}

- (BOOL)deviceIsHandledLocally:(id)a3
{
  id v4 = a3;
  v5 = sub_10001A044(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6
    || -[NSString isEqualToString:](self->_deviceUDID, "isEqualToString:", v6)
    || (xpc_dictionary_get_flag(v4, "_flags", 4) & 1) != 0)
  {
    BOOL v7 = 1;
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
    id v10 = filteredArrayByService(v9, (Protocol *)&OBJC_PROTOCOL___GTSimulatorDeviceBrowser);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([v11 count])
    {
      BOOL v7 = 0;
    }

    else
    {
      uint64_t v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
      BOOL v7 = v12 != 0LL;
    }
  }

  return v7;
}

- (void)handleMessage:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v31 = 0LL;
  BOOL IsValid = MessageIsValid(v6, &v31);
  id v9 = v31;
  if (IsValid)
  {
    self->_currentRemoteRelayPort = xpc_dictionary_get_uint64(v6, "_remoteDeviceRelayPort");
    self->_currentRemoteRelayPid = xpc_dictionary_get_uint64(v6, "_remoteDeviceRelayPid");
    if (xpc_dictionary_get_flag(v6, "_flags", 3))
    {
      -[GTServiceDaemon handleMessageDaemon:fromConnection:](self, "handleMessageDaemon:fromConnection:", v6, v7);
      goto LABEL_26;
    }

    if (xpc_dictionary_get_flag(v6, "_flags", 1))
    {
      -[GTServiceDaemon handleMessageBroadcast:fromConnection:](self, "handleMessageBroadcast:fromConnection:", v6, v7);
      goto LABEL_26;
    }

    if (MessageIsStreamReply(v6))
    {
      uint64_t v11 = MessagePathPop(v6);
      connectionMap = self->_connectionMap;
      id v30 = 0LL;
      unsigned int v13 = -[GTConnectionMap retrieveConnection:forId:](connectionMap, "retrieveConnection:forId:", &v30, v11);
      id v14 = v30;
      if (!v13)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v35 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Missing connection for ID: %llu",  buf,  0xCu);
        }

        goto LABEL_25;
      }

      goto LABEL_17;
    }

    if (!-[GTServiceDaemon deviceIsHandledLocally:](self, "deviceIsHandledLocally:", v6))
    {
      id v16 = sub_10001A044(v6);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[GTServiceDaemon connectionForDeviceUDID:](self, "connectionForDeviceUDID:", v14));
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        -[GTServiceDaemon updateAndRelayMessage:fromConnection:toConnection:]( self,  "updateAndRelayMessage:fromConnection:toConnection:",  v6,  v7,  v17);
        goto LABEL_24;
      }
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "_port");
    portToConnection = self->_portToConnection;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  uint64));
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToConnection, "objectForKeyedSubscript:", v21));

    if (v14)
    {
LABEL_17:
      -[GTServiceDaemon updateAndRelayMessage:fromConnection:toConnection:]( self,  "updateAndRelayMessage:fromConnection:toConnection:",  v6,  v7,  v14);
LABEL_25:

      goto LABEL_26;
    }

    portToDispatcher = self->_portToDispatcher;
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  uint64));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToDispatcher, "objectForKeyedSubscript:", v23));

    if (v18)
    {
      [v18 dispatchMessage:v6 replyConnection:v7];
    }

    else
    {
      __int128 v24 = self->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v35 = uint64;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Message unhandled - servicePort:%llu",  buf,  0xCu);
      }

      if (MessageHasReply(v6))
      {
        xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(reply);
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Target destination for message doesn't exist"));
        v33 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  2LL,  v28));

        xpc_dictionary_set_nserror(v26, "_error", v29);
        [v7 sendMessage:v26];
      }
    }

- (void)handleMessageDaemon:(id)a3 fromConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v5 = a4;
  if (xpc_dictionary_get_uint64(xdict, "_daemon") == 1)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    id v7 = objc_opt_new(&OBJC_CLASS___GTProcessInfo);
    xpc_dictionary_set_nsobject(reply, "processInfo", (uint64_t)v7);

LABEL_5:
    [v5 sendMessage:reply];

    goto LABEL_6;
  }

  if (MessageHasReply(xdict))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    goto LABEL_5;
  }

- (void)handleMessageBroadcast:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MessageVisit(v6, -[NSString UTF8String](self->_daemonId, "UTF8String")))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Handle broadcast", buf, 2u);
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v9 = self->_portToDispatcher;
    id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_portToDispatcher,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i)));
          [v14 dispatchMessage:v6 replyConnection:v7];
        }

        id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      }

      while (v11);
    }

    if (-[GTConnectionMap retrieveId:forConnection:](self->_connectionMap, "retrieveId:forConnection:", buf, v7))
    {
      -[GTServiceDaemon updateMessage:sourceConnection:](self, "updateMessage:sourceConnection:", v6, v7);
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionMap connections](self->_connectionMap, "connections"));
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (j = 0LL; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            __int128 v20 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 connection]);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 connection]);

            if (v21 != v22) {
              -[GTServiceDaemon relayMessage:fromConnection:toConnection:]( self,  "relayMessage:fromConnection:toConnection:",  v6,  v7,  v20);
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }

        while (v17);
      }
    }

    else
    {
      __int128 v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 v24 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Missing ID for active connection",  v24,  2u);
      }
    }
  }
}

- (void)updateMessagePath:(id)a3 sourceConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MessageRecordsPathHistory(v6))
  {
    if (-[GTConnectionMap retrieveId:forConnection:](self->_connectionMap, "retrieveId:forConnection:", &v10, v7))
    {
      MessagePathPush(v6, v10);
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Missing ID for active connection",  v9,  2u);
      }
    }
  }
}

- (void)patchMessage:(id)a3
{
  id v4 = a3;
  if (xpc_dictionary_get_flag(v4, "_flags", 5))
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, "response");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v6)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___GTCaptureResponse);
      nsobject = xpc_dictionary_get_nsobject(v4, "response", v7);
      if (nsobject)
      {
        id v9 = objc_alloc(&OBJC_CLASS___NSSet);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSURL);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
        id v14 = -[NSSet initWithObjects:]( v9,  "initWithObjects:",  v10,  v11,  v12,  v13,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
        v15 = (void *)objc_claimAutoreleasedReturnValue([nsobject data]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v15,  0LL));
        id v17 = [v16 mutableCopy];

        if (v17)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"archiveURL"]);
          v19 = v18;
          if (v18)
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 host]);
            unsigned int v21 = [v20 isEqualToString:@"localhost"];

            if (v21)
            {
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v19,  1LL));
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](&OBJC_CLASS___GTDeviceProperties, "uniqueDeviceID"));
              [v22 setHost:v23];

              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 URL]);
              [v17 setObject:v24 forKeyedSubscript:@"archiveURL"];

              id v29 = 0LL;
              __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v29));
              id v26 = v29;
              [nsobject setData:v25];

              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([nsobject data]);
              if (!v27)
              {
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v31 = v26;
                  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to patch message, %@",  buf,  0xCu);
                }

                [nsobject setError:v26];
              }

              xpc_dictionary_set_nsobject(v4, "response", (uint64_t)nsobject);
            }
          }
        }
      }
    }
  }
}

- (void)updateMessage:(id)a3 sourceConnection:(id)a4
{
  id v6 = a3;
  -[GTServiceDaemon updateMessagePath:sourceConnection:](self, "updateMessagePath:sourceConnection:", v6, a4);
  -[GTServiceDaemon patchMessage:](self, "patchMessage:", v6);
}

- (void)relayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (MessageHasReply(v8))
  {
    xpc_object_t reply = gt_xpc_dictionary_create_reply(v8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100019F94;
    v13[3] = &unk_100030EC8;
    id v14 = (id)objc_claimAutoreleasedReturnValue(reply);
    v15 = self;
    id v16 = v10;
    id v17 = v9;
    id v12 = v14;
    [v16 sendMessage:v8 replyHandler:v13];
  }

  else
  {
    [v10 sendMessage:v8];
  }
}

- (void)updateAndRelayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[GTServiceDaemon updateMessage:sourceConnection:](self, "updateMessage:sourceConnection:", v10, v9);
  -[GTServiceDaemon relayMessage:fromConnection:toConnection:]( self,  "relayMessage:fromConnection:toConnection:",  v10,  v9,  v8);
}

- (id)connectionForDeviceUDID:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
    id v5 = filteredArrayByService(v4, (Protocol *)&OBJC_PROTOCOL___GTRemoteDeviceRelay);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (![v6 count])
    {
      id v12 = 0LL;
LABEL_18:

      return v12;
    }

    if ([v6 count] == (id)1)
    {
      portToConnection = self->_portToConnection;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceProperties]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 servicePort]));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToConnection, "objectForKeyedSubscript:", v10));

      id v12 = -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:]( objc_alloc(&OBJC_CLASS___GTRelayedXPCConnection),  "initWithConnection:relayPort:relayPid:",  v11,  self->_currentRemoteRelayPort,  LODWORD(self->_currentRemoteRelayPid));
LABEL_17:

      goto LABEL_18;
    }

    id v13 = filteredArrayByPort(v6, (id)self->_currentRemoteRelayPort);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ([v11 count])
    {
      if ([v11 count] != (id)1)
      {
        id v20 = filteredArrayByPID(v11, self->_currentRemoteRelayPid);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if ([v19 count])
        {
          [v19 count];
          unsigned int v21 = self->_portToConnection;
          __int128 v22 = v19;
        }

        else
        {
          unsigned int v21 = self->_portToConnection;
          __int128 v22 = v11;
        }

        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceProperties]);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v24 servicePort]));
        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v25));

        id v12 = -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:]( objc_alloc(&OBJC_CLASS___GTRelayedXPCConnection),  "initWithConnection:relayPort:relayPid:",  v26,  self->_currentRemoteRelayPort,  LODWORD(self->_currentRemoteRelayPid));
        goto LABEL_16;
      }

      id v14 = self->_portToConnection;
      v15 = v11;
    }

    else
    {
      id v14 = self->_portToConnection;
      v15 = v6;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceProperties]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v17 servicePort]));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v18));

    id v12 = -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:]( objc_alloc(&OBJC_CLASS___GTRelayedXPCConnection),  "initWithConnection:relayPort:relayPid:",  v19,  self->_currentRemoteRelayPort,  LODWORD(self->_currentRemoteRelayPid));
LABEL_16:

    goto LABEL_17;
  }

  id v12 = 0LL;
  return v12;
}

- (id)connectionForServicePort:(unint64_t)a3
{
  portToConnection = self->_portToConnection;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](portToConnection, "objectForKeyedSubscript:", v4));

  return v5;
}

- (unint64_t)currentRemoteRelayPid
{
  return self->_currentRemoteRelayPid;
}

- (void).cxx_destruct
{
}

@end