@interface IDSDaemonXPCInterface
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IDSDGroupContextNotifyingObserver)observer;
- (IDSDaemonXPCInterface)init;
- (NSMutableArray)observerProxies;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (id)groupContextController;
- (void)didCacheGroup:(id)a3;
- (void)didCreateGroup:(id)a3;
- (void)didReceiveDecryptionFailureForGroup:(id)a3;
- (void)didReceiveRegistrationIdentityUpdate;
- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4;
- (void)setConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setObserver:(id)a3;
- (void)setObserverProxies:(id)a3;
@end

@implementation IDSDaemonXPCInterface

+ (id)sharedInstance
{
  if (qword_1009BEE08 != -1) {
    dispatch_once(&qword_1009BEE08, &stru_1008FD6A8);
  }
  return (id)qword_1009BEE10;
}

- (IDSDaemonXPCInterface)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSDaemonXPCInterface;
  v2 = -[IDSDaemonXPCInterface init](&v17, "init");
  if (v2)
  {
    uint64_t v3 = OSLogHandleForIDSCategory("NSXPC");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon XPC Interface Up", buf, 2u);
    }

    v6 = -[IDSDGroupContextNotifyingObserver initWithDelegate:]( objc_alloc(&OBJC_CLASS___IDSDGroupContextNotifyingObserver),  "initWithDelegate:",  v2);
    observer = v2->_observer;
    v2->_observer = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDaemonXPCInterface groupContextController](v2, "groupContextController"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001CF800;
    v14[3] = &unk_1008FD6D0;
    v9 = v2;
    v15 = v9;
    [v8 groupContextForProtectionSpace:0 withCompletion:v14];

    observerProxies = v9->_observerProxies;
    v9->_observerProxies = 0LL;

    v11 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.identityservicesd.nsxpc.auth");
    listener = v9->_listener;
    v9->_listener = v11;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    -[NSXPCListener resume](v9->_listener, "resume");
  }

  return v2;
}

- (id)groupContextController
{
  return +[IDSDGroupContextController sharedInstance](&OBJC_CLASS___IDSDGroupContextController, "sharedInstance");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("NSXPC");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Incoming Daemon XPC Interface with new connection %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"NSXPC"))
  {
    id v28 = v7;
    _IDSLogV(0LL, @"IDSFoundation", @"NSXPC", @"Incoming Daemon XPC Interface with new connection %@");
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___IDSGroupContextDaemonProtocol,  v28));
  [v7 setExportedInterface:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDGroupContextController sharedInstance]( &OBJC_CLASS___IDSDGroupContextController,  "sharedInstance"));
  [v7 setExportedObject:v12];
  [v7 resume];
  objc_storeStrong((id *)&self->_connection, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___IDSGroupContextObserverDaemonProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
  observerProxies = self->_observerProxies;
  if (!observerProxies)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_super v17 = self->_observerProxies;
    self->_observerProxies = v16;

    observerProxies = self->_observerProxies;
  }

  -[NSMutableArray addObject:](observerProxies, "addObject:", v14);
  uint64_t v18 = OSLogHandleForIDSCategory("DaemonProxy");
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = -[NSMutableArray count](self->_observerProxies, "count");
    *(_DWORD *)buf = 138412546;
    id v38 = v14;
    __int16 v39 = 2048;
    id v40 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We got remote object proxy %@ new observerProxies count: %lu",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v21) && _IDSShouldLog(0LL, @"DaemonProxy"))
  {
    v29 = v14;
    id v30 = -[NSMutableArray count](self->_observerProxies, "count");
    _IDSLogV( 0LL,  @"IDSFoundation",  @"DaemonProxy",  @"We got remote object proxy %@ new observerProxies count: %lu");
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1001CFC1C;
  v34[3] = &unk_1008F5F80;
  id v22 = (id)objc_claimAutoreleasedReturnValue( +[CUTWeakReference weakRefWithObject:]( &OBJC_CLASS___CUTWeakReference,  "weakRefWithObject:",  self,  v29,  v30));
  id v35 = v22;
  id v23 = v14;
  id v36 = v23;
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v34);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001CFD60;
  v31[3] = &unk_1008F5F80;
  id v32 = v22;
  id v33 = v23;
  connection = self->_connection;
  id v25 = v23;
  id v26 = v22;
  -[NSXPCConnection setInterruptionHandler:](connection, "setInterruptionHandler:", v31);

  return 1;
}

- (void)didCreateGroup:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = self->_observerProxies;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1001CFFFC;
        v11[3] = &unk_1008FA978;
        id v12 = v4;
        v13 = v10;
        [v10 didCreateGroup:v12 completion:v11];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }
}

- (void)didCacheGroup:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = self->_observerProxies;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1001D028C;
        v11[3] = &unk_1008FA978;
        id v12 = v4;
        v13 = v10;
        [v10 didCacheGroup:v12 completion:v11];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }
}

- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obj = self->_observerProxies;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v11);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1001D0548;
        v15[3] = &unk_1008FC148;
        id v13 = v6;
        id v16 = v13;
        id v17 = v7;
        uint64_t v18 = v12;
        [v12 didUpdateGroup:v13 withNewGroup:v17 completion:v15];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v9);
  }
}

- (void)didReceiveDecryptionFailureForGroup:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = self->_observerProxies;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1001D07EC;
        v11[3] = &unk_1008FA978;
        id v12 = v4;
        id v13 = v10;
        [v10 didReceiveDecryptionFailureForGroup:v12 completion:v11];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }
}

- (void)didReceiveRegistrationIdentityUpdate
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = self->_observerProxies;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)v6);
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472LL;
        v8[2] = sub_1001D0A50;
        v8[3] = &unk_1008F8C80;
        v8[4] = v7;
        [v7 didReceiveRegistrationIdentityUpdateWithCompletion:v8];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v4);
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSDGroupContextNotifyingObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (NSMutableArray)observerProxies
{
  return self->_observerProxies;
}

- (void)setObserverProxies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end