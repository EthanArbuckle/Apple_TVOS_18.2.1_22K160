@interface MRDAVHostedExternalDevice
- (BOOL)_endpointIsSolo:(id)a3;
- (BOOL)_endpointShouldNotifyClientsOfTopologyChanges:(id)a3;
- (BOOL)_endpointShouldPostVolumeNotifications:(id)a3 outputDevice:(id)a4;
- (BOOL)_endpointSupportsVolumeControl:(id)a3;
- (BOOL)_onSerialQueue_isEndpointsDesignatedGroupLeader:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)tombstoned;
- (BOOL)useOutputDeviceCache;
- (MRAVDistantEndpoint)endpoint;
- (MRAVRoutingDiscoverySession)silentDiscoverySession;
- (MRDAVHostedExternalDevice)initWithExternalDevice:(id)a3;
- (MRDConnectionLifetimeController)lifetimeController;
- (MRExternalDevice)externalDevice;
- (MRExternalOutputContextDataSource)externalOutputContext;
- (MROrigin)origin;
- (NSArray)personalOutputDevices;
- (NSArray)subscribedPlayerPaths;
- (NSDate)canMigrateEvaluationTimestamp;
- (NSError)canMigrateToLocalEndpointError;
- (NSMutableSet)mutableExternalDeviceClients;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)outputDeviceUID;
- (NSXPCListener)xpcListener;
- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint;
- (OS_dispatch_queue)externalDeviceCallbackQueue;
- (OS_dispatch_queue)serialQueue;
- (id)_allExternalDeviceClients;
- (id)_connectedExternalDeviceClients;
- (id)_connectingExternalDeviceClients;
- (id)_externalDeviceClientForConnection:(id)a3;
- (id)_mutableExternalDeviceClientsWithRegisteredCallbacks:(unint64_t)a3;
- (id)_mutableExternalDeviceClientsWithRegisteredNotification:(unint64_t)a3;
- (id)externalDeviceClients;
- (id)groupSessionToken;
- (unint64_t)notifications;
- (unint64_t)registeredCallbacks;
- (void)_externalDeviceClientDidInvalidate:(id)a3 withError:(id)a4;
- (void)_handleExternalDeviceConnectionDidChange:(id)a3;
- (void)_handleMaybeCanMigrateToLocalEndpointDidChange:(id)a3;
- (void)_initializeExternalDevice:(id)a3;
- (void)_maybePostEndpointDidAddOutputDevice:(id)a3;
- (void)_maybePostEndpointDidChangeOutputDevice:(id)a3;
- (void)_maybePostEndpointDidRemoveOutputDevice:(id)a3;
- (void)_maybePostVolumeControlCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4;
- (void)_maybePostVolumeDidChange:(float)a3 outputDevice:(id)a4;
- (void)_maybePostVolumeIsMutedDidChange:(BOOL)a3 outputDevice:(id)a4;
- (void)_onSerialQueue_reevaluateVolumeControlCapabilitiesForEndpoint:(id)a3;
- (void)_processCanMigrateToLocalEndpointEvent:(id)a3 timestamp:(id)a4 error:(id)a5;
- (void)_reloadEndpoint;
- (void)_reloadHostedExternalDeviceCallbacks;
- (void)_reloadHostedExternalDeviceNotifications;
- (void)_reloadHostedExternalDeviceSubscribedPlayerPaths;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)disconnectOrigin:(id)a3;
- (void)expanseManagerTelevisionDidJoinSession:(id)a3;
- (void)expanseManagerTelevisionDidLeaveSession:(id)a3;
- (void)getCustomOriginDataWithCompletion:(id)a3;
- (void)getDeviceInfoWithCompletion:(id)a3;
- (void)getExternalOutputContextWithCompletion:(id)a3;
- (void)getPersonalOutputDevices:(id)a3;
- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4;
- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3;
- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4;
- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3;
- (void)hostedExternalDeviceEndpointDidChange:(id)a3;
- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4;
- (void)modifyTopologyWithRequest:(id)a3 completion:(id)a4;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6;
- (void)outputContextDataSourceDidAddOutputDevice:(id)a3;
- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3;
- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3;
- (void)outputDeviceVolume:(id)a3 withCompletion:(id)a4;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 withCompletion:(id)a4;
- (void)pingWithTimeout:(double)a3 callback:(id)a4;
- (void)registerForOutputContextNotifications:(id)a3;
- (void)requestGroupSessionWithDetails:(id)a3 completion:(id)a4;
- (void)sendButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5;
- (void)sendCustomData:(id)a3 withName:(id)a4;
- (void)setCanMigrateEvaluationTimestamp:(id)a3;
- (void)setCanMigrateToLocalEndpointError:(id)a3;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 completion:(id)a5;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setExternalDeviceCallbackQueue:(id)a3;
- (void)setLifetimeController:(id)a3;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 completion:(id)a5;
- (void)setMutableExternalDeviceClients:(id)a3;
- (void)setNotifications:(unint64_t)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6;
- (void)setRegisteredCallbacks:(unint64_t)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSilentDiscoverySession:(id)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setTombstoned:(BOOL)a3;
- (void)setUseOutputDeviceCache:(BOOL)a3;
- (void)setXpcListener:(id)a3;
- (void)tombstoneWithError:(id)a3;
@end

@implementation MRDAVHostedExternalDevice

- (MRDAVHostedExternalDevice)initWithExternalDevice:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MRDAVHostedExternalDevice;
  v6 = -[MRDAVHostedExternalDevice init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_externalDevice, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaremoted.hostedExternalDevice.serialQueue", v9);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mediaremoted.hostedExternalDevice.callbackQueue", v13);
    externalDeviceCallbackQueue = v7->_externalDeviceCallbackQueue;
    v7->_externalDeviceCallbackQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    mutableExternalDeviceClients = v7->_mutableExternalDeviceClients;
    v7->_mutableExternalDeviceClients = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    canMigrateEvaluationTimestamp = v7->_canMigrateEvaluationTimestamp;
    v7->_canMigrateEvaluationTimestamp = (NSDate *)v18;

    if (v5)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
      xpcListener = v7->_xpcListener;
      v7->_xpcListener = (NSXPCListener *)v20;

      -[NSXPCListener setDelegate:](v7->_xpcListener, "setDelegate:", v7);
      -[NSXPCListener resume](v7->_xpcListener, "resume");
      -[MRDAVHostedExternalDevice _initializeExternalDevice:](v7, "_initializeExternalDevice:", v5);
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRExpanseManager sharedManager](&OBJC_CLASS___MRExpanseManager, "sharedManager"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDAVHostedExternalDevice;
  -[MRDAVHostedExternalDevice dealloc](&v5, "dealloc");
}

- (NSString)description
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000ACBEC;
  dispatch_queue_t v10 = sub_1000ACBFC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000ACC04;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000ACBEC;
  dispatch_queue_t v10 = sub_1000ACBFC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000ACDC8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (MRExternalDevice)externalDevice
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000ACBEC;
  dispatch_queue_t v10 = sub_1000ACBFC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AD08C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRExternalDevice *)v3;
}

- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint
{
  return -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
}

- (id)externalDeviceClients
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000ACBEC;
  dispatch_queue_t v10 = sub_1000ACBFC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AD15C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)groupSessionToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 groupSessionToken]);

  return v3;
}

- (NSString)outputDeviceUID
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000ACBEC;
  dispatch_queue_t v10 = sub_1000ACBFC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AD29C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)tombstoneWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    dispatch_queue_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did tombstone with error %@",  buf,  0x16u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AD3D4;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (NSArray)personalOutputDevices
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000AD4B4;
  v9[3] = &unk_100398E60;
  v9[4] = self;
  uint64_t v5 = v3;
  dispatch_queue_t v10 = v5;
  dispatch_sync(serialQueue, v9);
  uint64_t v6 = v10;
  v7 = v5;

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  char v46 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ADAE8;
  block[3] = &unk_100399278;
  block[4] = self;
  void block[5] = &v43;
  dispatch_sync(serialQueue, block);
  int v8 = *((unsigned __int8 *)v44 + 24);
  if (*((_BYTE *)v44 + 24))
  {
    uint64_t v9 = MRLogCategoryConnections();
    dispatch_queue_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] %{public}@ is tombstoned, rejecting new XPC connection %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    __int16 v11 = -[MRDAVHostedExternalDeviceClient initWithConnection:]( objc_alloc(&OBJC_CLASS___MRDAVHostedExternalDeviceClient),  "initWithConnection:",  v6);
    uint64_t v12 = MRLogCategoryConnections();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] %{public}@ is accepting new XPC connection %{public}@",  buf,  0x16u);
    }

    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v48 = 0;
    dispatch_queue_t v14 = self->_serialQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000ADAFC;
    v35[3] = &unk_10039E758;
    v26 = v14;
    v36 = v26;
    v37 = buf;
    objc_copyWeak(&v38, &location);
    objc_copyWeak(&v39, &from);
    v15 = objc_retainBlock(v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[MRDistantExternalDevice serviceInterface]( &OBJC_CLASS___MRDistantExternalDevice,  "serviceInterface"));
    [v6 setExportedInterface:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 protocol]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[MRWeakProxy weakProxyWithObject:protocol:]( &OBJC_CLASS___MRWeakProxy,  "weakProxyWithObject:protocol:",  self,  v18));
    [v6 setExportedObject:v19];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRDistantExternalDevice clientInterface](&OBJC_CLASS___MRDistantExternalDevice, "clientInterface"));
    [v6 setRemoteObjectInterface:v20];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000ADBB8;
    v33[3] = &unk_100399EC0;
    v21 = v15;
    id v34 = v21;
    [v6 setInterruptionHandler:v33];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000ADC10;
    v31[3] = &unk_100399EC0;
    v22 = v21;
    id v32 = v22;
    [v6 setInvalidationHandler:v31];
    [v6 resume];
    objc_super v23 = (dispatch_queue_s *)self->_serialQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000ADC68;
    v28[3] = &unk_100399CB8;
    v29 = v11;
    v30 = buf;
    v28[4] = self;
    v24 = v11;
    dispatch_sync(v23, v28);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v38);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v43, 8);

  return v8 == 0;
}

- (void)getCustomOriginDataWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 customOrigin]);
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 data]);
    Error = 0LL;
  }

  else
  {
    Error = (void *)MRMediaRemoteCreateError(5LL);
    uint64_t v8 = 0LL;
  }

  id v10 = (id)v8;
  v4[2](v4);
}

- (unint64_t)registeredCallbacks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v3));
  id v5 = [v4 registeredCallbacks];

  return (unint64_t)v5;
}

- (void)setRegisteredCallbacks:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v5));
  uint64_t v7 = MRLogCategoryConnections([v6 setRegisteredCallbacks:a3]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = NSStringFromMRAVDistantExternalDeviceCallbackFlags(a3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    dispatch_queue_t v14 = self;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Client %{public}@ is setting the following registered callbacks on %{public}@: %{public}@",  (uint8_t *)&v11,  0x20u);
  }

  -[MRDAVHostedExternalDevice _reloadHostedExternalDeviceCallbacks](self, "_reloadHostedExternalDeviceCallbacks");
}

- (unint64_t)notifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v3));
  id v5 = [v4 notifications];

  return (unint64_t)v5;
}

- (void)setNotifications:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v5));
  uint64_t v7 = MRLogCategoryConnections([v6 setNotifications:a3]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = NSStringFromMRAVDistantExternalDeviceNotificationFlags(a3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    dispatch_queue_t v14 = self;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Client %{public}@ is setting the following notifications on %{public}@: %{public}@",  (uint8_t *)&v11,  0x20u);
  }

  -[MRDAVHostedExternalDevice _reloadHostedExternalDeviceNotifications]( self,  "_reloadHostedExternalDeviceNotifications");
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v5));
  uint64_t v7 = MRLogCategoryConnections([v6 setSubscribedPlayerPaths:v4]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Client %{public}@ is subscribing to the following player paths on %{public}@: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  -[MRDAVHostedExternalDevice _reloadHostedExternalDeviceSubscribedPlayerPaths]( self,  "_reloadHostedExternalDeviceSubscribedPlayerPaths");
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:"));
  id v12 = [v9 mutableCopy];

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  id v36 = v12;
  [v12 setObject:v14 forKeyedSubscript:MRExternalDeviceConnectionClientBundleIDUserInfoKey];

  __int16 v15 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v16 = objc_opt_class(self);
  v17 = (void *)MRExternalDeviceConnectOptionsCopyDescription(v6);
  uint64_t v18 = -[NSString initWithFormat:](v15, "initWithFormat:", @"%@:%p (%@)", v16, self, v17);

  v19 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"HostedExternalDevice.connectWithOptions",  v13);
  v21 = v19;
  if (v18) {
    -[NSMutableString appendFormat:](v19, "appendFormat:", @" for %@", v18);
  }
  if (v11) {
    -[NSMutableString appendFormat:](v21, "appendFormat:", @" because %@", v11);
  }
  uint64_t v22 = _MRLogForCategory(10LL, v20);
  objc_super v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000AE570;
  v44[3] = &unk_10039B658;
  v24 = v18;
  uint64_t v45 = v24;
  char v46 = @"HostedExternalDevice.connectWithOptions";
  id v25 = v13;
  id v47 = v25;
  id v35 = v10;
  id v48 = v35;
  id v26 = v8;
  id v49 = v26;
  id v27 = objc_retainBlock(v44);
  [v11 setHasAttemptedToConnect:1];
  id v28 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v29 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@<%@>",  @"HostedExternalDevice.connectWithOptions",  v25);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000AE7BC;
  v42[3] = &unk_100399530;
  v30 = v27;
  id v43 = v30;
  id v31 = [v28 initWithTimeout:v29 reason:v42 handler:30.0];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  if (v32)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000AE7C8;
    v38[3] = &unk_10039B718;
    id v39 = v11;
    id v40 = v31;
    v41 = v30;
    v33 = v36;
    [v32 connectWithOptions:v6 userInfo:v36 completion:v38];

    id v34 = v39;
LABEL_11:

    goto LABEL_12;
  }

  v33 = v36;
  if ([v31 disarm])
  {
    id v34 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  123LL,  @"No externalDevice available when attempting to %@",  @"HostedExternalDevice.connectWithOptions");
    ((void (*)(void *, NSError *))v30[2])(v30, v34);
    goto LABEL_11;
  }

- (void)disconnect:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.mediaremote.externaldevice.disconnect"]);
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v11 = MRLogCategoryConnections(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      __int16 v15 = v6;
      __int16 v16 = 2114;
      v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to disconnect from external device using hosted endpoint %{public}@",  (uint8_t *)&v14,  0x16u);
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
    [v13 disconnect:v4];
  }
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  unsigned int v9 = v8;
  if (self->_useOutputDeviceCache && [v8 wantsVolumeNotifications])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AEAC8;
    block[3] = &unk_100399768;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_sync(serialQueue, block);

    uint64_t v11 = v16;
LABEL_7:

    goto LABEL_8;
  }

  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  if (!v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000AEBB4;
    v13[3] = &unk_100399EC0;
    id v14 = v7;
    dispatch_async(externalDeviceCallbackQueue, v13);
    uint64_t v11 = v14;
    goto LABEL_7;
  }

  [v9 outputDeviceVolumeControlCapabilities:v6 queue:externalDeviceCallbackQueue completion:v7];
LABEL_8:
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6
{
  id v38 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v37));
  id v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:%p %@ -> %lf",  objc_opt_class(self),  self,  v38,  a3);
  __int16 v15 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 requestID]);
  id v17 = -[NSMutableString initWithFormat:]( v15,  "initWithFormat:",  @"%@<%@>",  @"HostedExternalDevice.setOutputDeviceVolume",  v16);

  if (v14) {
    -[NSMutableString appendFormat:](v17, "appendFormat:", @" for %@", v14);
  }
  if (v13) {
    -[NSMutableString appendFormat:](v17, "appendFormat:", @" because %@", v13);
  }
  uint64_t v19 = _MRLogForCategory(10LL, v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000AF0B8;
  v49[3] = &unk_10039E780;
  v21 = v14;
  v50 = v21;
  v51 = @"HostedExternalDevice.setOutputDeviceVolume";
  id v22 = v10;
  id v52 = v22;
  id v23 = v12;
  id v53 = v23;
  id v24 = v11;
  v54 = self;
  id v55 = v24;
  id v25 = objc_retainBlock(v49);
  uint64_t v45 = 0LL;
  char v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000LL;
  v58 = sub_1000ACBEC;
  v59 = sub_1000ACBFC;
  id v60 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AF390;
  block[3] = &unk_10039BB30;
  block[4] = self;
  void block[5] = &v45;
  void block[6] = &buf;
  dispatch_sync(serialQueue, block);
  id v27 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000AF3D8;
  v42[3] = &unk_100399530;
  v29 = v25;
  id v43 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:v42 handler:7.0];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000AF3E4;
  v39[3] = &unk_10039BAB8;
  id v31 = v30;
  id v40 = v31;
  id v32 = v29;
  id v41 = v32;
  v33 = objc_retainBlock(v39);
  if (!*((_BYTE *)v46 + 24))
  {
    id v36 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 36LL);
    ((void (*)(void *, NSError *))v33[2])(v33, v36);
LABEL_12:

    goto LABEL_13;
  }

  id v35 = *(void **)(*((void *)&buf + 1) + 40LL);
  if (!v35)
  {
    id v36 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 123LL);
    ((void (*)(void *, NSError *))v33[2])(v33, v36);
    goto LABEL_12;
  }

  *(float *)&double v34 = a3;
  [v35 setOutputDeviceVolume:v38 outputDeviceUID:v22 details:self->_externalDeviceCallbackQueue queue:v33 completion:v34];
LABEL_13:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v45, 8);
}

- (void)outputDeviceVolume:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  unsigned int v9 = v8;
  if (self->_useOutputDeviceCache && [v8 wantsVolumeNotifications])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AF570;
    block[3] = &unk_100399768;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_sync(serialQueue, block);

    id v11 = v16;
LABEL_7:

    goto LABEL_8;
  }

  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  if (!v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000AF66C;
    v13[3] = &unk_100399EC0;
    id v14 = v7;
    dispatch_async(externalDeviceCallbackQueue, v13);
    id v11 = v14;
    goto LABEL_7;
  }

  [v9 outputDeviceVolume:v6 queue:externalDeviceCallbackQueue completion:v7];
LABEL_8:
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6
{
  id v41 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v40));
  __int16 v13 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v14 = objc_opt_class(self);
  uint64_t v15 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = -[NSString initWithFormat:](v13, "initWithFormat:", @"%@:%p %@ -> %@", v14, self, v41, v16);

  uint64_t v18 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  uint64_t v20 = -[NSMutableString initWithFormat:]( v18,  "initWithFormat:",  @"%@<%@>",  @"HostedExternalDevice.adjustOutputDeviceVolume",  v19);

  if (v17) {
    -[NSMutableString appendFormat:](v20, "appendFormat:", @" for %@", v17);
  }
  if (v12) {
    -[NSMutableString appendFormat:](v20, "appendFormat:", @" because %@", v12);
  }
  uint64_t v22 = _MRLogForCategory(10LL, v21);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000AFB80;
  v52[3] = &unk_10039E780;
  id v24 = v17;
  id v53 = v24;
  v54 = @"HostedExternalDevice.adjustOutputDeviceVolume";
  id v25 = v9;
  id v55 = v25;
  id v26 = v11;
  id v56 = v26;
  id v27 = v10;
  uint64_t v57 = self;
  id v58 = v27;
  id v28 = objc_retainBlock(v52);
  uint64_t v48 = 0LL;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_1000ACBEC;
  v62 = sub_1000ACBFC;
  id v63 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AFE58;
  block[3] = &unk_10039BB30;
  block[4] = self;
  void block[5] = &v48;
  void block[6] = &buf;
  dispatch_sync(serialQueue, block);
  id v30 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v25 name]);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000AFEA0;
  v45[3] = &unk_100399530;
  id v32 = v28;
  id v46 = v32;
  id v33 = [v30 initWithTimeout:v31 reason:v45 handler:7.0];

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000AFEAC;
  v42[3] = &unk_10039BAB8;
  id v34 = v33;
  id v43 = v34;
  id v35 = v32;
  id v44 = v35;
  id v36 = objc_retainBlock(v42);
  if (!*((_BYTE *)v49 + 24))
  {
    id v38 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 36LL);
    ((void (*)(void *, NSError *))v36[2])(v36, v38);
LABEL_12:

    goto LABEL_13;
  }

  v37 = *(void **)(*((void *)&buf + 1) + 40LL);
  if (!v37)
  {
    id v38 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 123LL);
    ((void (*)(void *, NSError *))v36[2])(v36, v38);
    goto LABEL_12;
  }

  [v37 adjustOutputDeviceVolume:a3 outputDeviceUID:v41 details:v25 queue:self->_externalDeviceCallbackQueue completion:v36];
LABEL_13:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v48, 8);
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6
{
  BOOL v35 = a3;
  id v37 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v36));
  __int16 v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:%p %@ -> %u",  objc_opt_class(self),  self,  v37,  v35);
  uint64_t v14 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  id v16 = -[NSMutableString initWithFormat:]( v14,  "initWithFormat:",  @"%@<%@>",  @"HostedExternalDevice.adjustOutputDeviceVolume",  v15);

  if (v13) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" for %@", v13);
  }
  if (v12) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" because %@", v12);
  }
  uint64_t v18 = _MRLogForCategory(10LL, v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000B03A8;
  v48[3] = &unk_10039E780;
  uint64_t v20 = v13;
  id v49 = v20;
  uint64_t v50 = @"HostedExternalDevice.adjustOutputDeviceVolume";
  id v21 = v9;
  id v51 = v21;
  id v22 = v11;
  id v52 = v22;
  id v23 = v10;
  id v53 = self;
  id v54 = v23;
  id v24 = objc_retainBlock(v48);
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000LL;
  uint64_t v57 = sub_1000ACBEC;
  id v58 = sub_1000ACBFC;
  id v59 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B0680;
  block[3] = &unk_10039BB30;
  block[4] = self;
  void block[5] = &v44;
  void block[6] = &buf;
  dispatch_sync(serialQueue, block);
  id v26 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000B06C8;
  v41[3] = &unk_100399530;
  id v28 = v24;
  id v42 = v28;
  id v29 = [v26 initWithTimeout:v27 reason:v41 handler:7.0];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000B06D4;
  v38[3] = &unk_10039BAB8;
  id v30 = v29;
  id v39 = v30;
  id v31 = v28;
  id v40 = v31;
  id v32 = objc_retainBlock(v38);
  if (!*((_BYTE *)v45 + 24))
  {
    id v34 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 36LL);
    ((void (*)(void *, NSError *))v32[2])(v32, v34);
LABEL_12:

    goto LABEL_13;
  }

  id v33 = *(void **)(*((void *)&buf + 1) + 40LL);
  if (!v33)
  {
    id v34 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 123LL);
    ((void (*)(void *, NSError *))v32[2])(v32, v34);
    goto LABEL_12;
  }

  [v33 muteOutputDeviceVolume:v35 outputDeviceUID:v37 details:v21 queue:self->_externalDeviceCallbackQueue completion:v32];
LABEL_13:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v44, 8);
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  [v11 setListeningMode:v10 outputDeviceUID:v9 queue:self->_externalDeviceCallbackQueue completion:v8];
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  [v10 setConversationDetectionEnabled:v6 outputDeviceUID:v9 queue:self->_externalDeviceCallbackQueue completion:v8];
}

- (void)modifyTopologyWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v9));
  uint64_t v11 = MRLogCategoryConnections(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = (MRDAVHostedExternalDevice *)objc_claimAutoreleasedReturnValue([v6 outputDeviceUIDs]);
    *(_DWORD *)__int128 buf = 138543874;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to modify hosted endpoint %{public}@ - %@",  buf,  0x20u);
  }

  uint64_t v15 = MRLogCategoryConnections(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = MRGroupTopologyModificationRequestTypeDescription([v6 type]);
    uint64_t v18 = (MRDAVHostedExternalDevice *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDeviceUIDs]);
    *(_DWORD *)__int128 buf = 138544130;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = v18;
    __int16 v27 = 2114;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to %{public}@ hosted endpoint %{public}@ - %@",  buf,  0x2Au);
  }

  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  if (v8)
  {
    [v8 modifyTopologyWithRequest:v6 withReplyQueue:externalDeviceCallbackQueue completion:v7];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B0A64;
    block[3] = &unk_100399EC0;
    id v22 = v7;
    dispatch_async(externalDeviceCallbackQueue, block);
  }
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v9));
  uint64_t v11 = MRLogCategoryConnections(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to create hosted endpoint %{public}@ with output devices: %{public}@",  buf,  0x20u);
  }

  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  if (v8)
  {
    [v8 createHostedEndpointWithOutputDeviceUIDs:v6 queue:externalDeviceCallbackQueue completion:v7];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B0C48;
    block[3] = &unk_100399EC0;
    id v15 = v7;
    dispatch_async(externalDeviceCallbackQueue, block);
  }
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_externalDevice;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v9));
  uint64_t v11 = MRLogCategoryConnections(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138544130;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    id v16 = [v6 length];
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    __int16 v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to send %llu bytes of custom data with name %{public}@ using hosted endpoint %{public}@",  (uint8_t *)&v13,  0x2Au);
  }

  -[MRExternalDevice sendCustomData:withName:](v8, "sendCustomData:withName:", v6, v7);
}

- (void)pingWithTimeout:(double)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v8));
  uint64_t v10 = MRLogCategoryConnections(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543874;
    id v22 = v9;
    __int16 v23 = 2048;
    double v24 = a3;
    __int16 v25 = 2114;
    id v26 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] [Client %{public}@ is requesting to ping external device with timeout %f using hosted endpoint %{public}@",  buf,  0x20u);
  }

  if (v7)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000B0FBC;
    v19[3] = &unk_10039E7A8;
    id v12 = &v20;
    id v20 = v6;
    externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
    id v14 = v6;
    [v7 ping:v19 callback:externalDeviceCallbackQueue withQueue:a3];
  }

  else
  {
    __int16 v15 = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000B0FD0;
    v17[3] = &unk_100399EC0;
    id v12 = &v18;
    id v18 = v6;
    id v16 = v6;
    dispatch_async(v15, v17);
  }
}

- (void)sendButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a3 | (*(void *)&a4 << 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  objc_msgSend(v7, "sendButtonEvent:", v6, v5);
}

- (void)getPersonalOutputDevices:(id)a3
{
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice personalOutputDevices](self, "personalOutputDevices"));
  id v6 = [v7 copy];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:]( self,  "_externalDeviceClientForConnection:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 discoveryTokenForConfiguration:v6]);
  if (!v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 registerDiscoveryTokenForConfiguration:v6]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
    __int16 v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    __int16 v17 = sub_1000B123C;
    id v18 = &unk_10039E7D0;
    id v12 = v8;
    id v19 = v12;
    id v13 = v6;
    id v20 = v13;
    [v11 setDiscoveryOutputDevicesChangedCallback:&v15 forToken:v9];

    objc_msgSend(v12, "setDiscoveryToken:forConfiguration:", v9, v13, v15, v16, v17, v18);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  [v14 setDiscoveryMode:v4 forToken:v9];
}

- (void)getExternalOutputContextWithCompletion:(id)a3
{
}

- (void)getDeviceInfoWithCompletion:(id)a3
{
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInfo]);
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)requestGroupSessionWithDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  [v8 requestGroupSessionWithDetails:v7 queue:self->_externalDeviceCallbackQueue completion:v6];
}

- (void)expanseManagerTelevisionDidJoinSession:(id)a3
{
  uint64_t v4 = MRLogCategoryConnections(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] %{public}@ check for local route because TV join.",  (uint8_t *)&v6,  0xCu);
  }

  -[MRDAVHostedExternalDevice _handleMaybeCanMigrateToLocalEndpointDidChange:]( self,  "_handleMaybeCanMigrateToLocalEndpointDidChange:",  0LL);
}

- (void)expanseManagerTelevisionDidLeaveSession:(id)a3
{
  uint64_t v4 = MRLogCategoryConnections(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] %{public}@ check for local route because TV leave.",  (uint8_t *)&v6,  0xCu);
  }

  -[MRDAVHostedExternalDevice _handleMaybeCanMigrateToLocalEndpointDidChange:]( self,  "_handleMaybeCanMigrateToLocalEndpointDidChange:",  0LL);
}

- (MROrigin)origin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 customOrigin]);

  return (MROrigin *)v3;
}

- (void)disconnectOrigin:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice", a3));
  id v3 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 124LL);
  [v4 disconnect:v3];
}

- (void)_handleExternalDeviceConnectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v5 connectionState] != 2)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B1758;
    v12[3] = &unk_100399250;
    v12[4] = self;
    dispatch_sync(serialQueue, v12);
    goto LABEL_9;
  }

  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1000ACBEC;
  id v19 = sub_1000ACBFC;
  id v20 = 0LL;
  int v6 = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B1710;
  block[3] = &unk_100399278;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(v6, block);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v8 = [v5 supportsIdleDisconnection];

  if (v8)
  {
    id v9 = -[MRDConnectionLifetimeController initWithDataSource:delegate:]( objc_alloc(&OBJC_CLASS___MRDConnectionLifetimeController),  "initWithDataSource:delegate:",  self,  self);
    uint64_t v10 = (void *)v16[5];
    v16[5] = (uint64_t)v9;

    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice serialQueue](self, "serialQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000B1748;
    v13[3] = &unk_100398EC8;
    void v13[4] = self;
    v13[5] = &v15;
    dispatch_sync(v7, v13);
LABEL_6:
  }

  -[MRDAVHostedExternalDevice _handleMaybeCanMigrateToLocalEndpointDidChange:]( self,  "_handleMaybeCanMigrateToLocalEndpointDidChange:",  v4);
  _Block_object_dispose(&v15, 8);

LABEL_9:
}

- (void)_handleMaybeCanMigrateToLocalEndpointDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v55 = 0LL;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  id v58 = sub_1000ACBEC;
  id v59 = sub_1000ACBFC;
  id v60 = 0LL;
  uint64_t v49 = 0LL;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  id v52 = sub_1000ACBEC;
  id v53 = sub_1000ACBFC;
  id v54 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  uint64_t v46 = sub_1000ACBEC;
  char v47 = sub_1000ACBFC;
  id v48 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B1CD0;
  block[3] = &unk_10039E7F8;
  void block[4] = self;
  void block[5] = &v49;
  void block[6] = &v55;
  void block[7] = &v43;
  dispatch_sync(serialQueue, block);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);

  if (!v8
    || (id v9 = [v8 isLocal], (v9 & 1) != 0)
    || (id v9 = [v8 isEqual:v50[5]], (v9 & 1) != 0)
    || !v44[5])
  {
    uint64_t v11 = (void *)MRMediaRemoteCopyDeviceUID(v9, v10);
    BOOL v12 = v11 == 0LL;

    if (v12)
    {
      if ([(id)v44[5] connectionState] == 2)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
        unsigned int v16 = [v15 supportExpanseMigration];

        if (v16)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRExpanseManager sharedManager](&OBJC_CLASS___MRExpanseManager, "sharedManager"));
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 activeTelevisionRouteID]);

          if (v33)
          {
            uint64_t v19 = MRLogCategoryConnections(v18);
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = v56[5];
              *(_DWORD *)__int128 buf = 138543874;
              id v63 = self;
              __int16 v64 = 2114;
              uint64_t v65 = v21;
              __int16 v66 = 2114;
              v67 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] %{public}@ Checking for match of endpoint: %{public}@ and active TV: %{public}@",  buf,  0x20u);
            }

            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            id v22 = (void *)objc_claimAutoreleasedReturnValue([(id)v56[5] outputDevices]);
            id v23 = [v22 countByEnumeratingWithState:&v38 objects:v61 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v39;
              while (2)
              {
                __int16 v25 = 0LL;
                do
                {
                  if (*(void *)v39 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)v25);
                  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[MRExpanseManager sharedManager]( &OBJC_CLASS___MRExpanseManager,  "sharedManager",  v33));
                  LODWORD(v26) = [v27 deviceIsActiveTelevision:v26];

                  if ((_DWORD)v26)
                  {
                    -[MRDAVHostedExternalDevice _processCanMigrateToLocalEndpointEvent:timestamp:error:]( self,  "_processCanMigrateToLocalEndpointEvent:timestamp:error:",  @"TV joined Expanse session.",  v6,  0LL);

                    goto LABEL_24;
                  }

                  __int16 v25 = (char *)v25 + 1;
                }

                while (v23 != v25);
                id v23 = [v22 countByEnumeratingWithState:&v38 objects:v61 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }
          }
        }

        objc_initWeak((id *)buf, self);
        id v28 = (void *)v56[5];
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:]( &OBJC_CLASS___MRAVLocalEndpoint,  "sharedLocalEndpointForRoutingContextWithUID:",  0LL));
        id v30 = &_dispatch_main_q;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_1000B1D3C;
        v34[3] = &unk_10039E820;
        objc_copyWeak(&v37, (id *)buf);
        id v35 = v4;
        id v36 = v6;
        [v28 canMigrateToEndpoint:v29 queue:&_dispatch_main_q completion:v34];

        objc_destroyWeak(&v37);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        id v32 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  3LL,  @"Not already connected to endpoint");
        -[MRDAVHostedExternalDevice _processCanMigrateToLocalEndpointEvent:timestamp:error:]( self,  "_processCanMigrateToLocalEndpointEvent:timestamp:error:",  v31,  v6,  v32);
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      id v14 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  6LL,  @"Local device is groupable");
      -[MRDAVHostedExternalDevice _processCanMigrateToLocalEndpointEvent:timestamp:error:]( self,  "_processCanMigrateToLocalEndpointEvent:timestamp:error:",  v13,  v6,  v14);
    }
  }

- (void)_processCanMigrateToLocalEndpointEvent:(id)a3 timestamp:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B1EE0;
  block[3] = &unk_10039E848;
  id v12 = v9;
  id v16 = v12;
  uint64_t v17 = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v8;
  id v19 = v14;
  id v20 = &v21;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v22 + 24)) {
    -[MRDAVHostedExternalDevice _reloadEndpoint](self, "_reloadEndpoint");
  }

  _Block_object_dispose(&v21, 8);
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3
{
  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(externalDeviceCallbackQueue);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceVolumeCapabilitiesUserInfoKey]);
  id v8 = [v7 intValue];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  -[MRDAVHostedExternalDevice _maybePostVolumeControlCapabilitiesDidChange:outputDevice:]( self,  "_maybePostVolumeControlCapabilitiesDidChange:outputDevice:",  v8,  v10);
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3
{
  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(externalDeviceCallbackQueue);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceVolumeUserInfoKey]);
  [v7 floatValue];
  int v9 = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  LODWORD(v11) = v9;
  -[MRDAVHostedExternalDevice _maybePostVolumeDidChange:outputDevice:]( self,  "_maybePostVolumeDidChange:outputDevice:",  v12,  v11);
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3
{
  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(externalDeviceCallbackQueue);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceVolumeMutedUserInfoKey]);
  id v8 = [v7 BOOLValue];

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  -[MRDAVHostedExternalDevice _maybePostVolumeIsMutedDidChange:outputDevice:]( self,  "_maybePostVolumeIsMutedDidChange:outputDevice:",  v8,  v10);
}

- (void)outputContextDataSourceDidAddOutputDevice:(id)a3
{
  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(externalDeviceCallbackQueue);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);
  -[MRDAVHostedExternalDevice _maybePostEndpointDidAddOutputDevice:](self, "_maybePostEndpointDidAddOutputDevice:", v7);
}

- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3
{
  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(externalDeviceCallbackQueue);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);
  -[MRDAVHostedExternalDevice _maybePostEndpointDidChangeOutputDevice:]( self,  "_maybePostEndpointDidChangeOutputDevice:",  v7);
}

- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3
{
  externalDeviceCallbackQueue = (dispatch_queue_s *)self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(externalDeviceCallbackQueue);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);
  -[MRDAVHostedExternalDevice _maybePostEndpointDidRemoveOutputDevice:]( self,  "_maybePostEndpointDidRemoveOutputDevice:",  v7);
}

- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = MRLogCategoryConnections(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = (void *)MRExternalDeviceConnectionStateCopyDescription(v4);
    *(_DWORD *)__int128 buf = 138543874;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    __int16 v25 = v9;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ connection state did change to %{public}@ with error %{public}@",  buf,  0x20u);
  }

  if ((_DWORD)v4 != 2)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B26C0;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _connectingExternalDeviceClients]( self,  "_connectingExternalDeviceClients"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) hostedExternalDeviceConnectionStateDidChange:v4 withError:v6];
        uint64_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v13);
  }

  -[MRDAVHostedExternalDevice _reloadEndpoint](self, "_reloadEndpoint");
}

- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138543618;
    __int128 v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ device deviceInfo did change to %{public}@",  buf,  0x16u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  32LL));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) hostedExternalDeviceDeviceInfoDidChange:v4];
        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRLogCategoryConnections(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138543874;
    uint64_t v21 = self;
    __int16 v22 = 2048;
    id v23 = [v6 length];
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did receive %llu bytes of custom data with name %{public}@",  buf,  0x20u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredCallbacks:]( self,  "_mutableExternalDeviceClientsWithRegisteredCallbacks:",  1LL));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) hostedExternalDeviceDidReceiveCustomData:v6 withName:v7];
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)hostedExternalDeviceEndpointDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 connectionType] == (id)1)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000B2C18;
    v17[3] = &unk_100398E60;
    void v17[4] = self;
    id v18 = v4;
    id v6 = v4;
    dispatch_sync(serialQueue, v17);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice personalOutputDevices](self, "personalOutputDevices"));
    [v4 setDistantPersonalOutputDevices:v7];

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice _allExternalDeviceClients](self, "_allExternalDeviceClients"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        }

        id v9 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
    if ([v13 supportsDesignatedGroupLeaderUpdates])
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedProxyGroupLeader]);
      [v13 updateDesignatedGroupLeader:v14];
    }

    __int128 v15 = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B2BE8;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v20 = v4;
    id v16 = v4;
    dispatch_sync(v15, block);
  }
}

- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v4);
  uint64_t v8 = MRLogCategoryConnections(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138543874;
    __int128 v21 = self;
    __int16 v22 = 2114;
    __int128 v23 = v7;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ volumeCapabilities did change to %{public}@ for outputDevice %{public}@",  buf,  0x20u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  2LL));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) hostedExternalDeviceVolumeCapabilitiesDidChange:v4 forOutputDevice:v6];
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MRLogCategoryConnections(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138543874;
    __int128 v21 = self;
    __int16 v22 = 2048;
    double v23 = a3;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ volume did change to %f for outputDevice %{public}@",  buf,  0x20u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  2LL));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v9);
        }
        *(float *)&double v11 = a3;
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) hostedExternalDeviceVolumeDidChange:v6 forOutputDevice:v11];
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = MRLogCategoryConnections(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138543874;
    id v20 = self;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ volume did change to %{BOOL}u for outputDevice %{public}@",  buf,  0x1Cu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  2LL));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) hostedExternalDeviceIsMutedDidChange:v4 forOutputDevice:v6];
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uid]);
    *(_DWORD *)__int128 buf = 138543618;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did add output device %{public}@",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  4LL));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) hostedExternalDeviceDidAddOutputDevice:v4];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uid]);
    *(_DWORD *)__int128 buf = 138543618;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did change output device %{public}@",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  4LL));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) hostedExternalDeviceDidChangeOutputDevice:v4];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uid]);
    *(_DWORD *)__int128 buf = 138543618;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did remove output device %{public}@",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevice _mutableExternalDeviceClientsWithRegisteredNotification:]( self,  "_mutableExternalDeviceClientsWithRegisteredNotification:",  4LL));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) hostedExternalDeviceDidRemoveOutputDevice:v4];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)_externalDeviceClientDidInvalidate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRLogCategoryConnections(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543874;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ client did invalidate: %{public}@ with error %@",  buf,  0x20u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3738;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v11 = v6;
  id v24 = v11;
  dispatch_sync(serialQueue, block);
  -[MRDAVHostedExternalDevice _reloadHostedExternalDeviceCallbacks](self, "_reloadHostedExternalDeviceCallbacks");
  -[MRDAVHostedExternalDevice _reloadHostedExternalDeviceNotifications]( self,  "_reloadHostedExternalDeviceNotifications");
  -[MRDAVHostedExternalDevice _reloadHostedExternalDeviceSubscribedPlayerPaths]( self,  "_reloadHostedExternalDeviceSubscribedPlayerPaths");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveryTokens", 0));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice externalDevice](self, "externalDevice"));
        [v18 unregisterDiscoveryToken:v17];

        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v14);
  }

  [v11 invalidateWithError:v7];
}

- (id)_externalDeviceClientForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1000ACBEC;
  __int128 v16 = sub_1000ACBFC;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3818;
  block[3] = &unk_100399DF8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_allExternalDeviceClients
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000ACBEC;
  id v10 = sub_1000ACBFC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B3A04;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_mutableExternalDeviceClientsWithRegisteredCallbacks:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice _connectedExternalDeviceClients](self, "_connectedExternalDeviceClients"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B3AD0;
  v7[3] = &unk_10039E868;
  v7[4] = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_filter:", v7));

  return v5;
}

- (id)_mutableExternalDeviceClientsWithRegisteredNotification:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice _connectedExternalDeviceClients](self, "_connectedExternalDeviceClients"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B3B78;
  v7[3] = &unk_10039E868;
  v7[4] = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_filter:", v7));

  return v5;
}

- (id)_connectedExternalDeviceClients
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice _allExternalDeviceClients](self, "_allExternalDeviceClients"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_filter:", &stru_10039E8A8));

  return v3;
}

- (id)_connectingExternalDeviceClients
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedExternalDevice _allExternalDeviceClients](self, "_allExternalDeviceClients"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_filter:", &stru_10039E8C8));

  return v3;
}

- (void)_initializeExternalDevice:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  [v4 setConnectionRecoveryBehavior:1];
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MRExternalOutputContextDataSource);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uid]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v9 = -[NSString initWithFormat:](v6, "initWithFormat:", @"%@-%@", v7, v8);
  id v10 = -[MRExternalOutputContextDataSource initWithUniqueIdentifier:](v5, "initWithUniqueIdentifier:", v9);
  externalOutputContext = self->_externalOutputContext;
  self->_externalOutputContext = v10;

  -[MRExternalOutputContextDataSource setNotificationQueue:]( self->_externalOutputContext,  "setNotificationQueue:",  self->_externalDeviceCallbackQueue);
  -[MRExternalOutputContextDataSource setShouldLog:](self->_externalOutputContext, "setShouldLog:", 1LL);
  -[MRDAVHostedExternalDevice registerForOutputContextNotifications:]( self,  "registerForOutputContextNotifications:",  self->_externalOutputContext);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000B41DC;
  v37[3] = &unk_10039E8F0;
  objc_copyWeak(&v38, location);
  v37[4] = self;
  [v4 setConnectionStateCallback:v37 withQueue:self->_externalDeviceCallbackQueue];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000B42B4;
  v35[3] = &unk_10039BA20;
  objc_copyWeak(&v36, location);
  [v4 setOutputDevicesUpdatedCallback:v35 withQueue:self->_externalDeviceCallbackQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000B4320;
  v33[3] = &unk_10039BA20;
  objc_copyWeak(&v34, location);
  [v4 setOutputDevicesRemovedCallback:v33 withQueue:self->_externalDeviceCallbackQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000B4378;
  v31[3] = &unk_10039E918;
  objc_copyWeak(&v32, location);
  [v4 setVolumeChangedCallback:v31 withQueue:self->_externalDeviceCallbackQueue];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000B445C;
  v29[3] = &unk_10039E940;
  objc_copyWeak(&v30, location);
  [v4 setVolumeControlCapabilitiesCallback:v29 withQueue:self->_externalDeviceCallbackQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000B4538;
  v27[3] = &unk_10039E968;
  objc_copyWeak(&v28, location);
  [v4 setVolumeMutedChangedCallback:v27 withQueue:self->_externalDeviceCallbackQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000B45C0;
  v25[3] = &unk_10039E990;
  objc_copyWeak(&v26, location);
  [v4 setDeviceInfoChangedCallback:v25 withQueue:self->_externalDeviceCallbackQueue];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(6LL, @"Endpoint is not initialized");
  -[MRDAVHostedExternalDevice _processCanMigrateToLocalEndpointEvent:timestamp:error:]( self,  "_processCanMigrateToLocalEndpointEvent:timestamp:error:",  @"init",  v12,  ErrorWithDescription);

  if (!self->_silentDiscoverySession)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySessionConfiguration,  "configurationWithEndpointFeatures:",  1LL));
    [v14 setPopulatesExternalDevice:0];
    [v14 setAlwaysAllowUpdates:1];
    uint64_t v15 = (MRAVRoutingDiscoverySession *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:]( &OBJC_CLASS___MRAVRoutingDiscoverySession,  "discoverySessionWithConfiguration:",  v14));
    silentDiscoverySession = self->_silentDiscoverySession;
    self->_silentDiscoverySession = v15;

    id v17 = self->_silentDiscoverySession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000B4608;
    v23[3] = &unk_10039BA20;
    objc_copyWeak(&v24, location);
    id v18 =  -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:]( v17,  "addOutputDevicesChangedCallback:",  v23);
    objc_destroyWeak(&v24);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRExpanseManager sharedManager](&OBJC_CLASS___MRExpanseManager, "sharedManager"));
  [v19 addObserver:self];

  [v4 setWantsVolumeNotifications:1];
  [v4 setWantsNowPlayingNotifications:1];
  [v4 setWantsOutputDeviceNotifications:1];
  [v4 setWantsEndpointChangeNotifications:1];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v20 addObserver:self selector:"_handleMaybeCanMigrateToLocalEndpointDidChange:" name:kMRMediaRemoteOriginSupportedCommandsDidChangeNotification object:0];

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v21 addObserver:self selector:"_handleExternalDeviceConnectionDidChange:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:v4];

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v22 addObserver:self selector:"_handleMaybeCanMigrateToLocalEndpointDidChange:" name:kMRDeviceInfoDidChangeNotification object:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(location);
}

- (void)registerForOutputContextNotifications:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeVolume:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeVolumeMuted:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceDidAddOutputDevice:" name:MROutputContextDataSourceDidAddOutputDeviceNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceDidChangeOutputDevice:" name:MROutputContextDataSourceDidChangeOutputDeviceNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceDidRemoveOutputDevice:" name:MROutputContextDataSourceDidRemoveOutputDeviceNotification object:v4];
}

- (void)_reloadEndpoint
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_1000ACBEC;
  id v9 = sub_1000ACBFC;
  id v10 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B4974;
  v4[3] = &unk_100399278;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  if (v6[5]) {
    -[MRDAVHostedExternalDevice hostedExternalDeviceEndpointDidChange:](self, "hostedExternalDeviceEndpointDidChange:");
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_reloadHostedExternalDeviceCallbacks
{
  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_1000ACBEC;
  id v13 = sub_1000ACBFC;
  id v14 = 0LL;
  objc_initWeak(&location, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4B28;
  block[3] = &unk_10039BB30;
  void block[4] = self;
  void block[5] = &v9;
  void block[6] = &v15;
  dispatch_sync(serialQueue, block);
  id v4 = (void *)v10[5];
  if ((v16[3] & 1) != 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000B4C40;
    v5[3] = &unk_10039E9B8;
    objc_copyWeak(&v6, &location);
    [v4 setCustomDataCallback:v5 withQueue:self->_externalDeviceCallbackQueue];
    objc_destroyWeak(&v6);
  }

  else
  {
    [(id)v10[5] setCustomDataCallback:0 withQueue:0];
  }

  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)_reloadHostedExternalDeviceNotifications
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000LL;
  uint64_t v7 = sub_1000ACBEC;
  uint64_t v8 = sub_1000ACBFC;
  id v9 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4D88;
  block[3] = &unk_10039BB30;
  void block[4] = self;
  void block[5] = &v4;
  void block[6] = &v10;
  dispatch_sync(serialQueue, block);
  [(id)v5[5] setWantsSystemEndpointNotifications:((unint64_t)v11[3] >> 4) & 1];
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
}

- (void)_reloadHostedExternalDeviceSubscribedPlayerPaths
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_1000ACBEC;
  uint64_t v15 = sub_1000ACBFC;
  id v16 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B4FB4;
  block[3] = &unk_100399CB8;
  uint64_t v10 = &v11;
  void block[4] = self;
  uint64_t v5 = v3;
  id v9 = v5;
  dispatch_sync(serialQueue, block);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));
  subscribedPlayerPaths = self->_subscribedPlayerPaths;
  self->_subscribedPlayerPaths = v6;

  [(id)v12[5] setSubscribedPlayerPaths:self->_subscribedPlayerPaths];
  _Block_object_dispose(&v11, 8);
}

- (void)_maybePostVolumeControlCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_1000ACBEC;
  uint64_t v13 = sub_1000ACBFC;
  id v14 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B51D8;
  v8[3] = &unk_100399278;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(serialQueue, v8);
  if (-[MRDAVHostedExternalDevice _endpointShouldPostVolumeNotifications:outputDevice:]( self,  "_endpointShouldPostVolumeNotifications:outputDevice:",  v10[5],  v6))
  {
    -[MRDAVHostedExternalDevice hostedExternalDeviceVolumeCapabilitiesDidChange:forOutputDevice:]( self,  "hostedExternalDeviceVolumeCapabilitiesDidChange:forOutputDevice:",  v4,  v6);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_maybePostVolumeDidChange:(float)a3 outputDevice:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_1000ACBEC;
  id v14 = sub_1000ACBFC;
  id v15 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B52E4;
  v9[3] = &unk_100399278;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(serialQueue, v9);
  if (-[MRDAVHostedExternalDevice _endpointShouldPostVolumeNotifications:outputDevice:]( self,  "_endpointShouldPostVolumeNotifications:outputDevice:",  v11[5],  v6))
  {
    *(float *)&double v8 = a3;
    -[MRDAVHostedExternalDevice hostedExternalDeviceVolumeDidChange:forOutputDevice:]( self,  "hostedExternalDeviceVolumeDidChange:forOutputDevice:",  v6,  v8);
  }

  _Block_object_dispose(&v10, 8);
}

- (void)_maybePostVolumeIsMutedDidChange:(BOOL)a3 outputDevice:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_1000ACBEC;
  uint64_t v13 = sub_1000ACBFC;
  id v14 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B53F0;
  v8[3] = &unk_100399278;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(serialQueue, v8);
  if (-[MRDAVHostedExternalDevice _endpointShouldPostVolumeNotifications:outputDevice:]( self,  "_endpointShouldPostVolumeNotifications:outputDevice:",  v10[5],  v6))
  {
    -[MRDAVHostedExternalDevice hostedExternalDeviceIsMutedDidChange:forOutputDevice:]( self,  "hostedExternalDeviceIsMutedDidChange:forOutputDevice:",  v4,  v6);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_maybePostEndpointDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000ACBEC;
  uint64_t v11 = sub_1000ACBFC;
  id v12 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B54E8;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  if (-[MRDAVHostedExternalDevice _endpointShouldNotifyClientsOfTopologyChanges:]( self,  "_endpointShouldNotifyClientsOfTopologyChanges:",  v8[5]))
  {
    -[MRDAVHostedExternalDevice hostedExternalDeviceDidAddOutputDevice:]( self,  "hostedExternalDeviceDidAddOutputDevice:",  v4);
  }

  _Block_object_dispose(&v7, 8);
}

- (void)_maybePostEndpointDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000ACBEC;
  uint64_t v11 = sub_1000ACBFC;
  id v12 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B55E0;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  if (-[MRDAVHostedExternalDevice _endpointShouldNotifyClientsOfTopologyChanges:]( self,  "_endpointShouldNotifyClientsOfTopologyChanges:",  v8[5]))
  {
    -[MRDAVHostedExternalDevice hostedExternalDeviceDidChangeOutputDevice:]( self,  "hostedExternalDeviceDidChangeOutputDevice:",  v4);
  }

  _Block_object_dispose(&v7, 8);
}

- (void)_maybePostEndpointDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000ACBEC;
  uint64_t v11 = sub_1000ACBFC;
  id v12 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B56D8;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  if (-[MRDAVHostedExternalDevice _endpointShouldNotifyClientsOfTopologyChanges:]( self,  "_endpointShouldNotifyClientsOfTopologyChanges:",  v8[5]))
  {
    -[MRDAVHostedExternalDevice hostedExternalDeviceDidRemoveOutputDevice:]( self,  "hostedExternalDeviceDidRemoveOutputDevice:",  v4);
  }

  _Block_object_dispose(&v7, 8);
}

- (void)_onSerialQueue_reevaluateVolumeControlCapabilitiesForEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 connectionType] == (id)1
    || !-[MRDAVHostedExternalDevice _onSerialQueue_isEndpointsDesignatedGroupLeader:]( self,  "_onSerialQueue_isEndpointsDesignatedGroupLeader:",  v4))
  {
    goto LABEL_22;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVDistantEndpoint designatedGroupLeader](self->_endpoint, "designatedGroupLeader"));
  unsigned int v6 = [v5 groupContainsGroupLeader];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
  unsigned int v8 = [v7 groupContainsGroupLeader];

  if (v6 == v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVDistantEndpoint designatedGroupLeader](self->_endpoint, "designatedGroupLeader"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uid]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uid]);
    unsigned __int8 v20 = [v17 isEqualToString:v19];

    if ((v20 & 1) != 0)
    {
      __int128 v22 = objc_alloc(&OBJC_CLASS___NSOrderedSet);
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVDistantEndpoint outputDeviceUIDs](self->_endpoint, "outputDeviceUIDs"));
      id v24 = -[NSOrderedSet initWithArray:](v22, "initWithArray:", v23);
      id v25 = objc_alloc(&OBJC_CLASS___NSOrderedSet);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceUIDs]);
      id v27 = -[NSOrderedSet initWithArray:](v25, "initWithArray:", v26);
      unsigned __int8 v28 = -[NSOrderedSet isEqualToOrderedSet:](v24, "isEqualToOrderedSet:", v27);

      if ((v28 & 1) != 0) {
        goto LABEL_22;
      }
      uint64_t v30 = MRLogCategoryConnections(v29);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MRAVDistantEndpoint outputDeviceUIDs](self->_endpoint, "outputDeviceUIDs"));
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 outputDeviceUIDs]);
      *(_DWORD *)__int128 buf = 138544130;
      __int128 v40 = self;
      __int16 v41 = 2114;
      id v42 = @"topology";
      __int16 v43 = 2114;
      uint64_t v44 = v12;
      __int16 v45 = 2114;
      uint64_t v46 = v14;
      goto LABEL_18;
    }

    uint64_t v31 = MRLogCategoryConnections(v21);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MRAVDistantEndpoint designatedGroupLeader](self->_endpoint, "designatedGroupLeader"));
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
      *(_DWORD *)__int128 buf = 138544130;
      __int128 v40 = self;
      __int16 v41 = 2114;
      id v42 = @"groupLeader";
      __int16 v43 = 2114;
      uint64_t v44 = v12;
      __int16 v45 = 2114;
      uint64_t v46 = v14;
LABEL_18:
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[MRDAVHostedExternalDevice] Hosted endpoint <%{public}@> reevaluating volume control because %{public}@ changed from <%{public}@> to <%{public}@>",  buf,  0x2Au);
    }
  }

  else
  {
    uint64_t v10 = MRLogCategoryConnections(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MRAVDistantEndpoint designatedGroupLeader](self->_endpoint, "designatedGroupLeader"));
      else {
        uint64_t v13 = @"NO";
      }
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
      *(_DWORD *)__int128 buf = 138544130;
      else {
        id v15 = @"NO";
      }
      __int128 v40 = self;
      __int16 v41 = 2114;
      id v42 = @"groupContainsGroupLeader";
      __int16 v43 = 2114;
      uint64_t v44 = v13;
      __int16 v45 = 2114;
      uint64_t v46 = v15;
      goto LABEL_18;
    }
  }

- (BOOL)_endpointShouldPostVolumeNotifications:(id)a3 outputDevice:(id)a4
{
  id v5 = a3;
  if ([v5 connectionType] == (id)1) {
    goto LABEL_2;
  }
  if ([v5 connectionType] == (id)6 || objc_msgSend(v5, "connectionType") == (id)5)
  {
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_6;
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 designatedGroupLeader]);
  if ([v8 groupContainsGroupLeader])
  {
    unsigned __int8 v9 = -[MRDAVHostedExternalDevice _onSerialQueue_isEndpointsDesignatedGroupLeader:]( self,  "_onSerialQueue_isEndpointsDesignatedGroupLeader:",  v5);

    if ((v9 & 1) != 0) {
      goto LABEL_5;
    }
  }

  else
  {
  }

  if (-[MRDAVHostedExternalDevice _endpointIsSolo:](self, "_endpointIsSolo:", v5)
    && -[MRDAVHostedExternalDevice _onSerialQueue_isEndpointsDesignatedGroupLeader:]( self,  "_onSerialQueue_isEndpointsDesignatedGroupLeader:",  v5))
  {
    goto LABEL_5;
  }

- (BOOL)_endpointShouldNotifyClientsOfTopologyChanges:(id)a3
{
  return [a3 connectionType] != (id)1;
}

- (BOOL)_endpointSupportsVolumeControl:(id)a3
{
  id v4 = a3;
  if ([v4 connectionType] == (id)3)
  {
    BOOL v5 = 1;
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 designatedGroupLeader]);
    if ([v6 groupContainsGroupLeader])
    {
      BOOL v5 = 1;
    }

    else if (-[MRDAVHostedExternalDevice _endpointIsSolo:](self, "_endpointIsSolo:", v4))
    {
      BOOL v5 = -[MRDAVHostedExternalDevice _onSerialQueue_isEndpointsDesignatedGroupLeader:]( self,  "_onSerialQueue_isEndpointsDesignatedGroupLeader:",  v4);
    }

    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_endpointIsSolo:(id)a3
{
  return [a3 logicalOutputDeviceCount] == (id)1;
}

- (BOOL)_onSerialQueue_isEndpointsDesignatedGroupLeader:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 designatedGroupLeader]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDevice uid](self->_externalDevice, "uid"));
  unsigned __int8 v6 = [v4 containsUID:v5];

  return v6;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (MRAVDistantEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)externalDeviceCallbackQueue
{
  return self->_externalDeviceCallbackQueue;
}

- (void)setExternalDeviceCallbackQueue:(id)a3
{
}

- (NSMutableSet)mutableExternalDeviceClients
{
  return self->_mutableExternalDeviceClients;
}

- (void)setMutableExternalDeviceClients:(id)a3
{
}

- (MRExternalOutputContextDataSource)externalOutputContext
{
  return self->_externalOutputContext;
}

- (BOOL)useOutputDeviceCache
{
  return self->_useOutputDeviceCache;
}

- (void)setUseOutputDeviceCache:(BOOL)a3
{
  self->_useOutputDeviceCache = a3;
}

- (BOOL)tombstoned
{
  return self->_tombstoned;
}

- (void)setTombstoned:(BOOL)a3
{
  self->_tombstoned = a3;
}

- (MRAVRoutingDiscoverySession)silentDiscoverySession
{
  return self->_silentDiscoverySession;
}

- (void)setSilentDiscoverySession:(id)a3
{
}

- (NSError)canMigrateToLocalEndpointError
{
  return self->_canMigrateToLocalEndpointError;
}

- (void)setCanMigrateToLocalEndpointError:(id)a3
{
}

- (MRDConnectionLifetimeController)lifetimeController
{
  return self->_lifetimeController;
}

- (void)setLifetimeController:(id)a3
{
}

- (NSDate)canMigrateEvaluationTimestamp
{
  return self->_canMigrateEvaluationTimestamp;
}

- (void)setCanMigrateEvaluationTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end