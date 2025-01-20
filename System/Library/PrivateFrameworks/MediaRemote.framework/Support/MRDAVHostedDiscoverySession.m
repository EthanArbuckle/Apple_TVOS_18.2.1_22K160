@interface MRDAVHostedDiscoverySession
+ (OS_dispatch_queue)calloutQueue;
- (BOOL)devicesDelayed;
- (BOOL)endpointsDelayed;
- (BOOL)processSuspended;
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRDAVHostedDiscoverySession)initWithConnection:(id)a3 hostedRoutingController:(id)a4;
- (MRDAVHostedDiscoverySessionDelegate)delegate;
- (MRDHostedRoutingController)hostedRoutingController;
- (MRDMediaRemoteClient)xpcClient;
- (MROSTransaction)transaction;
- (MRXPCConnectionMonitor)connectionMonitor;
- (NSArray)pendingEndpoints;
- (NSArray)pendingOutputDevices;
- (NSArray)updatedEndpoints;
- (NSArray)updatedOutputDevices;
- (NSDate)lastDesiredDiscoveryModeDisableDate;
- (NSDate)lastDesiredDiscoveryModeEnableDate;
- (NSDate)lastEffectiveDiscoveryModeDisableDate;
- (NSDate)lastEffectiveDiscoveryModeEnableDate;
- (NSString)bundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (RBSProcessMonitor)stateMonitor;
- (unsigned)_calculateEffectiveDiscoveryMode;
- (unsigned)desiredDiscoveryMode;
- (unsigned)discoveryMode;
- (unsigned)effectiveDiscoveryMode;
- (void)_invalidate;
- (void)_maybeWakeClient;
- (void)_notifyAvailableEndpointsDidChange:(id)a3;
- (void)_notifyAvailableOutputDevicesDidChange:(id)a3;
- (void)_reevaluateEffectiveDiscoveryMode;
- (void)_resumeConnection;
- (void)configurationWithCompletion:(id)a3;
- (void)connectionDidResume:(id)a3;
- (void)dealloc;
- (void)getAvailableEndpointsWithCompletion:(id)a3;
- (void)getAvailableOutputDevicesWithCompletion:(id)a3;
- (void)getDevicePresenceDetectedWithCompletion:(id)a3;
- (void)getDiscoveryModeWithCompletion:(id)a3;
- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4;
- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5;
- (void)setBundleIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredDiscoveryMode:(unsigned int)a3;
- (void)setDevicesDelayed:(BOOL)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setDiscoveryMode:(unsigned int)a3 withCompletion:(id)a4;
- (void)setEffectiveDiscoveryMode:(unsigned int)a3;
- (void)setEndpointsDelayed:(BOOL)a3;
- (void)setLastDesiredDiscoveryModeDisableDate:(id)a3;
- (void)setLastDesiredDiscoveryModeEnableDate:(id)a3;
- (void)setLastEffectiveDiscoveryModeDisableDate:(id)a3;
- (void)setLastEffectiveDiscoveryModeEnableDate:(id)a3;
- (void)setPendingEndpoints:(id)a3;
- (void)setPendingOutputDevices:(id)a3;
- (void)setProcessSuspended:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdatedEndpoints:(id)a3;
- (void)setUpdatedOutputDevices:(id)a3;
- (void)setXpcClient:(id)a3;
@end

@implementation MRDAVHostedDiscoverySession

- (MRDAVHostedDiscoverySession)initWithConnection:(id)a3 hostedRoutingController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___MRDAVHostedDiscoverySession;
  v9 = -[MRDAVHostedDiscoverySession init](&v46, "init");
  if (v9)
  {
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote.hostedDiscoverySession/serialQueue", v11);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v12;

    p_connection = (id *)&v9->_connection;
    objc_storeStrong((id *)&v9->_connection, a3);
    connection = v9->_connection;
    if (connection) {
      -[NSXPCConnection auditToken](connection, "auditToken");
    }
    else {
      memset(v45, 0, sizeof(v45));
    }
    v16 = sub_10013D0D8(v45);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v9->_hostedRoutingController, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "clientForPID:",  -[NSXPCConnection processIdentifier](v9->_connection, "processIdentifier")));
    xpcClient = v9->_xpcClient;
    v9->_xpcClient = (MRDMediaRemoteClient *)v20;

    v22 = v9->_bundleIdentifier;
    if (v22) {
      v23 = v22;
    }
    else {
      v23 = (NSString *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient processName](v9->_xpcClient, "processName"));
    }
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = v23;

    v25 = objc_alloc(&OBJC_CLASS___MRXPCConnectionMonitor);
    v26 = v9->_connection;
    v27 = (objc_class *)objc_opt_class(v9);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = -[MRXPCConnectionMonitor initWithConnection:label:](v25, "initWithConnection:label:", v26, v29);
    connectionMonitor = v9->_connectionMonitor;
    v9->_connectionMonitor = v30;

    -[MRXPCConnectionMonitor setDelegate:](v9->_connectionMonitor, "setDelegate:", v9);
    objc_initWeak(&location, v9);
    v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472LL;
    v41 = sub_100053A38;
    v42 = &unk_10039A668;
    objc_copyWeak(&v43, &location);
    v32 = objc_retainBlock(&v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVDistantRoutingDiscoverySession clientInterface]( &OBJC_CLASS___MRAVDistantRoutingDiscoverySession,  "clientInterface",  v39,  v40,  v41,  v42));
    [*p_connection setRemoteObjectInterface:v33];

    v34 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVDistantRoutingDiscoverySession serviceInterface]( &OBJC_CLASS___MRAVDistantRoutingDiscoverySession,  "serviceInterface"));
    [*p_connection setExportedInterface:v34];

    v35 = (void *)objc_claimAutoreleasedReturnValue([*p_connection exportedInterface]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 protocol]);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[MRWeakProxy weakProxyWithObject:protocol:]( &OBJC_CLASS___MRWeakProxy,  "weakProxyWithObject:protocol:",  v9,  v36));
    [*p_connection setExportedObject:v37];

    [*p_connection setInterruptionHandler:v32];
    [*p_connection setInvalidationHandler:v32];
    [*p_connection resume];
    -[MRDHostedRoutingController addObserver:](v9->_hostedRoutingController, "addObserver:", v9);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDAVHostedDiscoverySession;
  -[MRDAVHostedDiscoverySession dealloc](&v3, "dealloc");
}

- (NSString)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%@:%p %@>",  objc_opt_class(self),  self,  self->_bundleIdentifier);
}

- (NSString)debugDescription
{
  if (self->_lastDesiredDiscoveryModeEnableDate)
  {
    -[NSDate timeIntervalSinceDate:](self->_lastDesiredDiscoveryModeDisableDate, "timeIntervalSinceDate:");
    double v4 = v3;
    lastDesiredDiscoveryModeEnableDate = self->_lastDesiredDiscoveryModeEnableDate;
    -[NSDate timeIntervalSinceNow](lastDesiredDiscoveryModeEnableDate, "timeIntervalSinceNow");
    double v7 = -v6;
    if (v4 > 0.0)
    {
      lastDesiredDiscoveryModeDisableDate = self->_lastDesiredDiscoveryModeDisableDate;
      id v8 = lastDesiredDiscoveryModeDisableDate;
    }

    else
    {
      id v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      lastDesiredDiscoveryModeDisableDate = (NSDate *)@"NOW";
    }

    -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", self->_lastDesiredDiscoveryModeEnableDate);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"desired discovery enabled at: %@ (%.0f s ago) until: %@ (duration %.0f s)",  lastDesiredDiscoveryModeEnableDate,  *(void *)&v7,  lastDesiredDiscoveryModeDisableDate,  v10));
    if (v4 <= 0.0) {
  }
    }

  else
  {
    v36 = @"desired discovery never enabled";
  }

  if (self->_lastEffectiveDiscoveryModeEnableDate)
  {
    -[NSDate timeIntervalSinceDate:](self->_lastEffectiveDiscoveryModeDisableDate, "timeIntervalSinceDate:");
    double v12 = v11;
    lastEffectiveDiscoveryModeEnableDate = self->_lastEffectiveDiscoveryModeEnableDate;
    -[NSDate timeIntervalSinceNow](lastEffectiveDiscoveryModeEnableDate, "timeIntervalSinceNow");
    double v15 = -v14;
    if (v12 > 0.0)
    {
      lastEffectiveDiscoveryModeDisableDate = self->_lastEffectiveDiscoveryModeDisableDate;
      v16 = lastEffectiveDiscoveryModeDisableDate;
    }

    else
    {
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      lastEffectiveDiscoveryModeDisableDate = (NSDate *)@"NOW";
    }

    -[NSDate timeIntervalSinceDate:](v16, "timeIntervalSinceDate:", self->_lastEffectiveDiscoveryModeEnableDate);
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"effective discovery enabled at: %@ (%.0f s ago) until: %@ (duration %.0f s)",  lastEffectiveDiscoveryModeEnableDate,  *(void *)&v15,  lastEffectiveDiscoveryModeDisableDate,  v19));
    if (v12 <= 0.0) {

    }
    v18 = (__CFString *)v20;
  }

  else
  {
    v18 = @"effective discovery never enabled";
  }

  v21 = (objc_class *)objc_opt_class(self);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v25 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(self->_effectiveDiscoveryMode, v24);
  v27 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(self->_desiredDiscoveryMode, v26);
  connection = self->_connection;
  id v29 = (id)-[NSXPCConnection processIdentifier](connection, "processIdentifier");
  BOOL processSuspended = self->_processSuspended;
  bundleIdentifier = self->_bundleIdentifier;
  uint64_t v32 = MRCreateIndentedDebugDescriptionFromObject(self->_connectionMonitor);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %p {\n    effective discovery mode = %@, %@\n    desired discovery mode = %@, %@\n    xpc connection = %@\n    pid = %d\n    bundle id = %@\n    isProcessSuspended = %u\n    connection monitor = %@\n}",  v23,  self,  v25,  v18,  v27,  v36,  connection,  v29,  bundleIdentifier,  processSuspended,  v33));

  return (NSString *)v34;
}

+ (OS_dispatch_queue)calloutQueue
{
  if (qword_1003FDCE0 != -1) {
    dispatch_once(&qword_1003FDCE0, &stru_10039BA40);
  }
  return (OS_dispatch_queue *)(id)qword_1003FDCD8;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_desiredDiscoveryMode != (_DWORD)v3)
  {
    uint64_t v7 = MRLogCategoryDiscovery(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(self->_desiredDiscoveryMode, v9);
      double v12 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3, v11);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = self;
      __int16 v20 = 2114;
      v21 = v10;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[HostedDiscoverySession] %@ setting desired discoveryMode from %{public}@ to %{public}@",  buf,  0x20u);
    }

    self->_desiredDiscoveryMode = v3;
    v13 = (objc_class *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v14 = 17LL;
    if (!(_DWORD)v3) {
      uint64_t v14 = 18LL;
    }
    Class v15 = (&self->super.isa)[v14];
    (&self->super.isa)[v14] = v13;

    -[MRDAVHostedDiscoverySession _reevaluateEffectiveDiscoveryMode](self, "_reevaluateEffectiveDiscoveryMode");
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100053F28;
    block[3] = &unk_100399250;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }

- (unsigned)discoveryMode
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100054350;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)configurationWithCompletion:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedDiscoverySession configuration](self, "configuration"));
  if (v5)
  {
    v4[2](v4, v5);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedDiscoverySession connection](self, "connection"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005448C;
    v11[3] = &unk_10039BAB8;
    v11[4] = self;
    uint64_t v7 = v4;
    double v12 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:v11]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100054560;
    v9[3] = &unk_10039BAE0;
    v9[4] = self;
    uint64_t v10 = v7;
    [v8 configurationWithCompletion:v9];
  }
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100054664;
  uint64_t v10 = sub_100054674;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005467C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005470C;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)setEffectiveDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_effectiveDiscoveryMode != (_DWORD)v3)
  {
    uint64_t v7 = MRLogCategoryDiscovery(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(self->_effectiveDiscoveryMode, v9);
      double v12 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3, v11);
      *(_DWORD *)buf = 138412802;
      __int16 v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[HostedDiscoverySession] %@ setting effective discoveryMode from %{public}@ to %{public}@",  buf,  0x20u);
    }

    v13 = (objc_class *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v14 = 19LL;
    if (!(_DWORD)v3) {
      uint64_t v14 = 20LL;
    }
    Class v15 = (&self->super.isa)[v14];
    (&self->super.isa)[v14] = v13;

    self->_effectiveDiscoveryMode = v3;
    id v16 = [(id)objc_opt_class(self) calloutQueue];
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100054894;
    block[3] = &unk_100399250;
    block[4] = self;
    dispatch_async(v17, block);
  }

- (void)setProcessSuspended:(BOOL)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100054940;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4
{
}

- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5
{
}

- (void)getDevicePresenceDetectedWithCompletion:(id)a3
{
  hostedRoutingController = self->_hostedRoutingController;
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))( v5,  -[MRDHostedRoutingController devicePresenceDetected](hostedRoutingController, "devicePresenceDetected"),  0LL);
}

- (void)getDiscoveryModeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054B30;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned int *)v8 + 6), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)setDiscoveryMode:(unsigned int)a3 withCompletion:(id)a4
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054BC4;
  v6[3] = &unk_10039A990;
  v6[4] = self;
  unsigned int v7 = a3;
  id v5 = (void (**)(id, void))a4;
  dispatch_async(serialQueue, v6);
  v5[2](v5, 0LL);
}

- (void)getAvailableEndpointsWithCompletion:(id)a3
{
  hostedRoutingController = self->_hostedRoutingController;
  id v4 = (void (**)(id, id, void))a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController availableDistantEndpoints]( hostedRoutingController,  "availableDistantEndpoints"));
  v4[2](v4, v5, 0LL);
}

- (void)getAvailableOutputDevicesWithCompletion:(id)a3
{
  hostedRoutingController = self->_hostedRoutingController;
  id v4 = (void (**)(id, id, void))a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController availableDistantOutputDevices]( hostedRoutingController,  "availableDistantOutputDevices"));
  v4[2](v4, v5, 0LL);
}

- (void)connectionDidResume:(id)a3
{
}

- (void)_invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained hostedDiscoverySessionDidInvalidate:self];

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100054D10;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_notifyAvailableOutputDevicesDidChange:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedDiscoverySession _maybeWakeClient](self, "_maybeWakeClient");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054DD0;
  v6[3] = &unk_10039BB08;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[MRDAVHostedDiscoverySession configurationWithCompletion:](self, "configurationWithCompletion:", v6);
}

- (void)_notifyAvailableEndpointsDidChange:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedDiscoverySession _maybeWakeClient](self, "_maybeWakeClient");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005505C;
  v6[3] = &unk_10039BB08;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[MRDAVHostedDiscoverySession configurationWithCompletion:](self, "configurationWithCompletion:", v6);
}

- (void)_resumeConnection
{
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_100054664;
  v31 = sub_100054674;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100054664;
  v25 = sub_100054674;
  id v26 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000554F0;
  block[3] = &unk_10039BB30;
  block[4] = self;
  void block[5] = &v27;
  block[6] = &v21;
  dispatch_sync(serialQueue, block);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v5 = [v4 verboseHostedDiscoverySessionLogging];

  if (v5)
  {
    uint64_t v8 = MRLogCategoryDiscovery(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v28[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v10;
      __int16 v35 = 2112;
      v36 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[HostedDiscoverySession] Restoring outputDevices %@ for %@",  buf,  0x16u);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v12 = [v11 verboseHostedDiscoverySessionLogging];

  if (v12)
  {
    uint64_t v15 = MRLogCategoryDiscovery(v13, v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v22[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      v36 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[HostedDiscoverySession] Restoring endpoints %@ for %@",  buf,  0x16u);
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
  [v18 availableOutputDevicesDidChange:v28[5]];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
  [v19 availableEndpointsDidChange:v22[5]];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

- (void)_maybeWakeClient
{
  xpcClient = self->_xpcClient;
  if (!xpcClient)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    unsigned int v5 = (MRDMediaRemoteClient *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "clientForPID:",  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")));
    uint64_t v6 = self->_xpcClient;
    self->_xpcClient = v5;

    xpcClient = self->_xpcClient;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayerPath anyPlayerPath](&OBJC_CLASS___MRPlayerPath, "anyPlayerPath"));
  unsigned int v8 = -[MRDMediaRemoteClient notificationRequiresTaskAssertionForPlayerPath:]( xpcClient,  "notificationRequiresTaskAssertionForPlayerPath:",  v7);

  if (v8)
  {
    uint64_t v9 = self->_xpcClient;
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v10 wakingPlayerPathAssertionDuration];
    -[MRDMediaRemoteClient takeAssertion:forReason:duration:]( v9,  "takeAssertion:forReason:duration:",  4LL,  @"WakingPlayerPathNotification");
  }

- (unsigned)_calculateEffectiveDiscoveryMode
{
  if (self->_processSuspended) {
    return 0;
  }
  else {
    return self->_desiredDiscoveryMode;
  }
}

- (void)_reevaluateEffectiveDiscoveryMode
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (MRDHostedRoutingController)hostedRoutingController
{
  return self->_hostedRoutingController;
}

- (MRDAVHostedDiscoverySessionDelegate)delegate
{
  return (MRDAVHostedDiscoverySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSArray)updatedEndpoints
{
  return self->_updatedEndpoints;
}

- (void)setUpdatedEndpoints:(id)a3
{
}

- (NSArray)updatedOutputDevices
{
  return self->_updatedOutputDevices;
}

- (void)setUpdatedOutputDevices:(id)a3
{
}

- (NSArray)pendingEndpoints
{
  return self->_pendingEndpoints;
}

- (void)setPendingEndpoints:(id)a3
{
}

- (NSArray)pendingOutputDevices
{
  return self->_pendingOutputDevices;
}

- (void)setPendingOutputDevices:(id)a3
{
}

- (BOOL)endpointsDelayed
{
  return self->_endpointsDelayed;
}

- (void)setEndpointsDelayed:(BOOL)a3
{
  self->_endpointsDelayed = a3;
}

- (BOOL)devicesDelayed
{
  return self->_devicesDelayed;
}

- (void)setDevicesDelayed:(BOOL)a3
{
  self->_devicesDelayed = a3;
}

- (MRXPCConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (MRDMediaRemoteClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (unsigned)desiredDiscoveryMode
{
  return self->_desiredDiscoveryMode;
}

- (void)setDesiredDiscoveryMode:(unsigned int)a3
{
  self->_desiredDiscoveryMode = a3;
}

- (NSDate)lastDesiredDiscoveryModeEnableDate
{
  return self->_lastDesiredDiscoveryModeEnableDate;
}

- (void)setLastDesiredDiscoveryModeEnableDate:(id)a3
{
}

- (NSDate)lastDesiredDiscoveryModeDisableDate
{
  return self->_lastDesiredDiscoveryModeDisableDate;
}

- (void)setLastDesiredDiscoveryModeDisableDate:(id)a3
{
}

- (unsigned)effectiveDiscoveryMode
{
  return self->_effectiveDiscoveryMode;
}

- (NSDate)lastEffectiveDiscoveryModeEnableDate
{
  return self->_lastEffectiveDiscoveryModeEnableDate;
}

- (void)setLastEffectiveDiscoveryModeEnableDate:(id)a3
{
}

- (NSDate)lastEffectiveDiscoveryModeDisableDate
{
  return self->_lastEffectiveDiscoveryModeDisableDate;
}

- (void)setLastEffectiveDiscoveryModeDisableDate:(id)a3
{
}

- (BOOL)processSuspended
{
  return self->_processSuspended;
}

- (RBSProcessMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end