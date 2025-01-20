@interface MRDUIServer
+ (MRDUIServer)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MRDServerMessageProxy)messageProxy;
- (MRDUIActivityServer)activityServer;
- (MRDUIServer)init;
- (NSArray)clients;
- (NSHashTable)clientObservers;
- (NSMutableArray)pendingRelayEndpointReplies;
- (NSMutableSet)internalClients;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)serviceEndpoint;
- (OS_dispatch_queue)messageQueue;
- (id)clientForConnection:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_addClient:(id)a3;
- (void)_handleGetDeviceSupportsUIActivitiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUIServerEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_removeClient:(id)a3;
- (void)addClientObserver:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleClientInvalidated:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)releaseTimeBasedNowPlayingActivityAssertions;
- (void)removeClientObserver:(id)a3;
- (void)setActivityServer:(id)a3;
- (void)setClientObservers:(id)a3;
- (void)setMessageProxy:(id)a3;
- (void)setPendingRelayEndpointReplies:(id)a3;
- (void)setServiceEndpoint:(id)a3;
- (void)start;
@end

@implementation MRDUIServer

+ (MRDUIServer)sharedServer
{
  if (qword_1003FDF50 != -1) {
    dispatch_once(&qword_1003FDF50, &stru_1003A07D0);
  }
  return (MRDUIServer *)(id)qword_1003FDF48;
}

- (MRDUIServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDUIServer;
  v2 = -[MRDUIServer init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    internalClients = v3->_internalClients;
    v3->_internalClients = (NSMutableSet *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    clientObservers = v3->_clientObservers;
    v3->_clientObservers = (NSHashTable *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(v9, (dispatch_qos_class_t)2u, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MRDUIServer.messageQueue", v11);
    messageQueue = v3->_messageQueue;
    v3->_messageQueue = (OS_dispatch_queue *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v3 selector:"handleClientInvalidated:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0];
  }

  return v3;
}

- (void)start
{
  v3 = objc_alloc_init(&OBJC_CLASS___MRDUIActivityServer);
  -[MRDUIServer setActivityServer:](self, "setActivityServer:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer activityServer](self, "activityServer"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRDServerMessageProxy proxyForObjects:protocol:]( &OBJC_CLASS___MRDServerMessageProxy,  "proxyForObjects:protocol:",  v5,  &OBJC_PROTOCOL___MRUIServerXPCProtocol));
  -[MRDUIServer setMessageProxy:](self, "setMessageProxy:", v6);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0xB00000000000001uLL:
      -[MRDUIServer _handleGetUIServerEndpointMessage:fromClient:]( self,  "_handleGetUIServerEndpointMessage:fromClient:",  xdict,  v6);
      break;
    case 0xB00000000000002uLL:
      -[MRDUIServer _handleGetUIServiceRelayEndpointMessage:fromClient:]( self,  "_handleGetUIServiceRelayEndpointMessage:fromClient:",  xdict,  v6);
      break;
    case 0xB00000000000003uLL:
      -[MRDUIServer _handleSetUIServiceRelayEndpointMessage:fromClient:]( self,  "_handleSetUIServiceRelayEndpointMessage:fromClient:",  xdict,  v6);
      break;
    case 0xB00000000000004uLL:
      -[MRDUIServer _handleGetDeviceSupportsUIActivitiesMessage:fromClient:]( self,  "_handleGetDeviceSupportsUIActivitiesMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)handleClientInvalidated:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  unsigned int v5 = [v4 isEqualToString:@"com.apple.MediaRemoteUIService"];

  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    -[MRDUIServer setServiceEndpoint:](self, "setServiceEndpoint:", 0LL);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_handleGetUIServerEndpointMessage:(id)a3 fromClient:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F5090;
  v4[3] = &unk_100399350;
  v4[4] = self;
  sub_10013ADE4(a3, v4);
}

- (void)_handleGetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F5290;
  v15[3] = &unk_1003A07F8;
  id v5 = a3;
  id v16 = v5;
  id v6 = objc_retainBlock(v15);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer serviceEndpoint](self, "serviceEndpoint"));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer pendingRelayEndpointReplies](self, "pendingRelayEndpointReplies"));

    if (!v9)
    {
      dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      -[MRDUIServer setPendingRelayEndpointReplies:](self, "setPendingRelayEndpointReplies:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer pendingRelayEndpointReplies](self, "pendingRelayEndpointReplies"));
      v14 = objc_retainBlock(v6);
      [v13 addObject:v14];

      os_unfair_lock_unlock(p_lock);
      sub_10013B180( @"com.apple.MediaRemoteUIService",  @"UI service endpoint requested",  0LL,  &stru_1003A0818);
      goto LABEL_5;
    }

    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer pendingRelayEndpointReplies](self, "pendingRelayEndpointReplies"));
    v11 = objc_retainBlock(v6);
    [v10 addObject:v11];
  }

  os_unfair_lock_unlock(p_lock);
LABEL_5:
}

- (void)_handleSetUIServiceRelayEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  xpc_object_t value = xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
  v7 = (void *)objc_claimAutoreleasedReturnValue(value);
  dispatch_queue_attr_t v8 = objc_alloc_init(&OBJC_CLASS___NSXPCListenerEndpoint);
  -[NSXPCListenerEndpoint _setEndpoint:](v8, "_setEndpoint:", v7);
  -[MRDUIServer setServiceEndpoint:](self, "setServiceEndpoint:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer pendingRelayEndpointReplies](self, "pendingRelayEndpointReplies"));
  -[MRDUIServer setPendingRelayEndpointReplies:](self, "setPendingRelayEndpointReplies:", 0LL);
  os_unfair_lock_unlock(&self->_lock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)v14) + 16LL))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)v14));
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)_handleGetDeviceSupportsUIActivitiesMessage:(id)a3 fromClient:(id)a4
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_attr_t v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v41, 0, 32);
  }
  uint64_t v9 = MSVBundleIDForAuditToken(v41);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (![v10 length])
  {
    uint64_t v34 = _MRLogForCategory(11LL, v11);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1002B8D40(v18);
    }
    goto LABEL_14;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.mediaremote.ui-control"]);

  if (!v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v15 = [v14 allowAllClientUIConnections];

    if ((v15 & 1) == 0)
    {
      uint64_t v35 = _MRLogForCategory(11LL, v13);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1002B8DE0();
      }
LABEL_14:
      BOOL v33 = 0;
      goto LABEL_15;
    }
  }

  uint64_t v16 = _MRLogForCategory(11LL, v13);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1002B8D80();
  }

  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MRUIServerXPCProtocol));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MRUIClientXPCProtocol));
  [v8 setExportedInterface:v18];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer messageProxy](self, "messageProxy"));
  [v8 setExportedObject:v20];

  [v8 setRemoteObjectInterface:v19];
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___MRDiscoveredGroupSession);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___MRGroupSessionHostInfo);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___MRUserIdentity);
  v24 = +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  v21,  v22,  v23,  objc_opt_class(&OBJC_CLASS___NSSet),  0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = MSVPropertyListDataClasses();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v25 unionSet:v27];

  -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v18,  "setClasses:forSelector:argumentIndex:ofReply:",  v25,  "acquireGroupSessionNearbyAssertionForSession:withReply:",  0LL,  0LL);
  [v19 setClasses:v25 forSelector:"nearbyGroupSessionDismissed:" argumentIndex:0 ofReply:0];
  v28 = -[MRDUIClient initWithConnection:bundleID:]( objc_alloc(&OBJC_CLASS___MRDUIClient),  "initWithConnection:bundleID:",  v8,  v10);
  v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDUIServer messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F58BC;
  block[3] = &unk_100398E60;
  block[4] = self;
  v30 = v28;
  v40 = v30;
  dispatch_sync(v29, block);

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000F58C8;
  v37[3] = &unk_100398E60;
  v37[4] = self;
  v38 = v30;
  v31 = v30;
  [v8 setInvalidationHandler:v37];
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer messageQueue](self, "messageQueue"));
  [v8 _setQueue:v32];

  [v8 resume];
  BOOL v33 = 1;
LABEL_15:

  return v33;
}

- (void)_addClient:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(11LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1002B8E4C();
  }

  os_unfair_lock_lock(&self->_lock);
  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer internalClients](self, "internalClients"));
  [v8 addObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer clientObservers](self, "clientObservers", 0LL));
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
        v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "clientConnected:") & 1) != 0) {
          [v14 clientConnected:v4];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

- (void)_removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(11LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1002B8EAC();
  }

  os_unfair_lock_lock(&self->_lock);
  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer internalClients](self, "internalClients"));
  [v8 removeObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer clientObservers](self, "clientObservers", 0LL));
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
        v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "clientDisconnected:") & 1) != 0) {
          [v14 clientDisconnected:v4];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

- (NSArray)clients
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer internalClients](self, "internalClients"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSXPCListener)listener
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  listener = self->_listener;
  if (!listener)
  {
    uint64_t v5 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    uint64_t v6 = self->_listener;
    self->_listener = v5;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
    listener = self->_listener;
  }

  id v7 = listener;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)addClientObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer clientObservers](self, "clientObservers"));
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeClientObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIServer clientObservers](self, "clientObservers"));
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIServer clients](self, "clients"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connection", (void)v13));
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)releaseTimeBasedNowPlayingActivityAssertions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIServer activityServer](self, "activityServer"));
  [v2 releaseTimeBasedNowPlayingActivityAssertions];
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDUIServer activityServer](self, "activityServer"));
  [v5 collectDiagnostic:v4];
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableSet)internalClients
{
  return self->_internalClients;
}

- (NSHashTable)clientObservers
{
  return self->_clientObservers;
}

- (void)setClientObservers:(id)a3
{
}

- (MRDUIActivityServer)activityServer
{
  return self->_activityServer;
}

- (void)setActivityServer:(id)a3
{
}

- (MRDServerMessageProxy)messageProxy
{
  return self->_messageProxy;
}

- (void)setMessageProxy:(id)a3
{
}

- (NSMutableArray)pendingRelayEndpointReplies
{
  return self->_pendingRelayEndpointReplies;
}

- (void)setPendingRelayEndpointReplies:(id)a3
{
}

- (NSXPCListenerEndpoint)serviceEndpoint
{
  return self->_serviceEndpoint;
}

- (void)setServiceEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end