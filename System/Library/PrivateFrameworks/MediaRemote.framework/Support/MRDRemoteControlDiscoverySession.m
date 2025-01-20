@interface MRDRemoteControlDiscoverySession
- (BOOL)_shouldCreateClusterOutputDevices;
- (BOOL)devicePresenceDetected;
- (BOOL)shouldUseDeviceInfoForLocalDevice;
- (MRAVConcreteRoutingDiscoverySession)avDiscoverySession;
- (MRAVOutputDevice)nativeOutputDevice;
- (MRAVRoutingDiscoverySession)companionDiscoverySession;
- (MRAVRoutingDiscoverySession)externalDiscoverySession;
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRAirPlayTransportConnection)localEndpointConnection;
- (MRCompanionConnectionController)companionController;
- (MRDIDSDiscoverySession)idsDiscoverySession;
- (MRDRemoteControlDiscoverySession)init;
- (MRDeviceInfo)deviceInfo;
- (MRExternalDeviceTransportConnectionHandle)undiscoverableGroupLeaderHandle;
- (NSArray)allowList;
- (NSArray)availableOutputDevices;
- (NSArray)denyList;
- (NSArray)unclusteredOutputDevices;
- (NSSet)lastReportedClientIdentifiers;
- (NSString)debugDescription;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)workerQueue;
- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)groupSessionDiscoverySession;
- (id)_addUndiscoverableGroupLeaderFromDeviceInfo:(id)a3;
- (id)_addUndiscoveredOutputContextOutputDevices:(id)a3;
- (id)_applyDeviceInfoValuesToOutputDevices:(id)a3 withDeviceInfo:(id)a4;
- (id)_applyLocalReservedOutputContextValuesToOutputDevices:(id)a3;
- (id)_applyLocallySourcedValuesToOutputDevices:(id)a3;
- (id)_applyOutputContextValuesToOutputDevices:(id)a3;
- (id)_calculateUndiscoverableGroupLeaderFromDeviceInfo:(id)a3;
- (id)_clusterOutputDevicesFromUnclusteredDevices:(id)a3;
- (id)_fetchAvailableOutputDevicesFromDiscoverySessions;
- (id)availableEndpoints;
- (id)routingContextUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (void)_initializeDiscoverySessions;
- (void)_loadDefaults;
- (void)_loadLocalEndpointConnection;
- (void)_logChangesInModifyingOutputDevice:(id)a3 toOutputDevice:(id)a4 reason:(id)a5;
- (void)_mergeDeviceInfo:(id)a3 intoProtobuf:(id)a4;
- (void)_mergeOutputDevice:(id)a3 intoProtobuf:(id)a4;
- (void)_reloadOutputDevices;
- (void)_scheduleAvailableOutputDevicesReload;
- (void)_setupProxiedDiscoveryWithDestinationEndpoint:(id)a3;
- (void)_setupStandaloneDiscovery;
- (void)controller:(id)a3 didDiscoverCompanion:(id)a4;
- (void)controllerDidUndiscoverCompanion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerConnectionFailureForWHAIdentifier:(id)a3;
- (void)setAvDiscoverySession:(id)a3;
- (void)setAvailableOutputDevices:(id)a3;
- (void)setCompanionController:(id)a3;
- (void)setCompanionDiscoverySession:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4;
- (void)setExternalDiscoverySession:(id)a3;
- (void)setGroupSessionDiscoverySession:(id)a3;
- (void)setIdsDiscoverySession:(id)a3;
- (void)setLocalEndpointConnection:(id)a3;
- (void)setNativeOutputDevice:(id)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setUnclusteredOutputDevices:(id)a3;
- (void)setUndiscoverableGroupLeaderHandle:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)transport:(id)a3 didReceiveData:(id)a4;
- (void)transportDidClose:(id)a3 error:(id)a4;
- (void)unregisterConnectionFailureForWHAIdentifier:(id)a3;
@end

@implementation MRDRemoteControlDiscoverySession

- (MRDRemoteControlDiscoverySession)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession configuration](self, "configuration"));
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___MRDRemoteControlDiscoverySession;
  v4 = -[MRDRemoteControlDiscoverySession initWithConfiguration:](&v37, "initWithConfiguration:", v3);
  v5 = v4;
  if (v4)
  {
    -[MRDRemoteControlDiscoverySession setAlwaysLogUpdates:](v4, "setAlwaysLogUpdates:", 1LL);
    v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.mediaremote.%@", objc_opt_class(v5));
    v7 = -[NSString UTF8String](v6, "UTF8String");
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);
    workerQueue = v5->_workerQueue;
    v5->_workerQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    LODWORD(v9) = [v12 shouldConnectToLocalEndpoint];

    if ((_DWORD)v9)
    {
      v13 = v5->_workerQueue;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10004E958;
      v35[3] = &unk_100399250;
      v36 = v5;
      sub_10013D6FC(v13, v35);
    }

    objc_initWeak(&location, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v15 = kMRDeviceInfoDidChangeNotification;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10004E960;
    v32[3] = &unk_10039B930;
    objc_copyWeak(&v33, &location);
    id v16 = [v14 addObserverForName:v15 object:0 queue:0 usingBlock:v32];
    v25 = v6;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v18 = kMRAVOutputContextDevicesDidChangeNotification;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10004E9C8;
    v30[3] = &unk_10039B930;
    objc_copyWeak(&v31, &location);
    id v19 = [v17 addObserverForName:v18 object:0 queue:0 usingBlock:v30];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10004E9F4;
    v28[3] = &unk_10039B930;
    objc_copyWeak(&v29, &location);
    id v21 =  [v20 addObserverForName:@"MRDNowPlayingAirplaySessionStarted" object:0 queue:0 usingBlock:v28];

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[MRDMRRelayConnectionManager sharedManager]( &OBJC_CLASS___MRDMRRelayConnectionManager,  "sharedManager"));
    [v22 addObserver:v5];

    v23 = (dispatch_queue_s *)v5->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004EA20;
    block[3] = &unk_100399250;
    v27 = v5;
    dispatch_async(v23, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (NSString)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@ %p {\n",  objc_opt_class(self),  self);
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  localEndpointConnection=%@\n",  v4->_localEndpointConnection);
  v6 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v4->_discoveryMode, v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  discoveryMode=%@\n", v6);

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  lastReportedClientIdentifiers=%@\n",  v4->_lastReportedClientIdentifiers);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  routingContextID=%@\n", v4->_routingContextID);
  objc_sync_exit(v4);

  workerQueue = (dispatch_queue_s *)v4->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004ED0C;
  block[3] = &unk_100398E60;
  void block[4] = v4;
  dispatch_queue_attr_t v8 = v3;
  v17 = v8;
  dispatch_sync(workerQueue, block);
  v9 = v4;
  objc_sync_enter(v9);
  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[4], "mr_formattedDebugDescription"));
  -[NSMutableString appendFormat:](v8, "appendFormat:", @"  nativeOutputDevice = %@\n", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[3], "mr_formattedDebugDescription"));
  -[NSMutableString appendFormat:](v8, "appendFormat:", @"  unclusteredOutputDevices = %@\n", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[2], "mr_formattedDebugDescription"));
  -[NSMutableString appendFormat:](v8, "appendFormat:", @"  availableOutputDevices = %@\n", v12);

  -[NSMutableString appendString:](v8, "appendString:", @"}>");
  objc_sync_exit(v9);

  v13 = v17;
  v14 = v8;

  return &v14->super;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySessionConfiguration,  "configurationWithEndpointFeatures:",  8LL));
  [v2 setAlwaysAllowUpdates:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 setRoutingContextUID:v4];

  [v2 setPopulatesExternalDevice:0];
  return (MRAVRoutingDiscoverySessionConfiguration *)v2;
}

- (MRAirPlayTransportConnection)localEndpointConnection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_localEndpointConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLocalEndpointConnection:(id)a3
{
  id v5 = a3;
  if ([v5 isValid])
  {
    v6 = self;
    objc_sync_enter(v6);
    p_localEndpointConnection = (id *)&v6->_localEndpointConnection;
    if (v6->_localEndpointConnection)
    {
      uint64_t v9 = _MRLogForCategory(0LL, v7);
      dispatch_queue_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_opt_class(v6);
        id v12 = *p_localEndpointConnection;
        *(_DWORD *)buf = 138544130;
        uint64_t v21 = v11;
        __int16 v22 = 2114;
        v23 = @"localEndpointConnection";
        __int16 v24 = 2112;
        id v25 = v12;
        __int16 v26 = 2112;
        id v27 = v5;
        v13 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
        v14 = v10;
        uint32_t v15 = 42;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }

    else
    {
      uint64_t v18 = _MRLogForCategory(0LL, v7);
      dispatch_queue_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v21 = objc_opt_class(v6);
        __int16 v22 = 2114;
        v23 = @"localEndpointConnection";
        __int16 v24 = 2112;
        id v25 = v5;
        v13 = "Set: %{public}@ setting %{public}@ to <%@>";
        v14 = v10;
        uint32_t v15 = 32;
        goto LABEL_8;
      }
    }

    objc_storeStrong((id *)&v6->_localEndpointConnection, a3);
    [*p_localEndpointConnection addObserver:v6];
    objc_sync_exit(v6);

    -[MRDRemoteControlDiscoverySession _scheduleAvailableOutputDevicesReload]( v6,  "_scheduleAvailableOutputDevicesReload");
    goto LABEL_10;
  }

  dispatch_time_t v16 = dispatch_time(0LL, 5000000000LL);
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F204;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_after(v16, workerQueue, block);
LABEL_10:
}

- (void)setUndiscoverableGroupLeaderHandle:(id)a3
{
  v4 = (MRExternalDeviceTransportConnectionHandle *)a3;
  undiscoverableGroupLeaderHandle = self->_undiscoverableGroupLeaderHandle;
  uint64_t v7 = _MRLogForCategory(0LL, v6);
  dispatch_queue_attr_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (undiscoverableGroupLeaderHandle)
  {
    if (v9)
    {
      uint64_t v10 = objc_opt_class(self);
      uint64_t v11 = self->_undiscoverableGroupLeaderHandle;
      int v16 = 138544130;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = @"undiscoverableGroupLeader";
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      v23 = v4;
      id v12 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
      v13 = v8;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }

  else if (v9)
  {
    int v16 = 138543874;
    uint64_t v17 = objc_opt_class(self);
    __int16 v18 = 2114;
    id v19 = @"undiscoverableGroupLeader";
    __int16 v20 = 2112;
    uint64_t v21 = v4;
    id v12 = "Set: %{public}@ setting %{public}@ to <%@>";
    v13 = v8;
    uint32_t v14 = 32;
    goto LABEL_6;
  }

  uint32_t v15 = self->_undiscoverableGroupLeaderHandle;
  self->_undiscoverableGroupLeaderHandle = v4;
}

- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4
{
  id v7 = a4;
  if (a3 == 3)
  {
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
    unsigned int v9 = [v8 supportNanoStandalone];

    if (v9) {
      a3 = 3;
    }
    else {
      a3 = 2;
    }
  }

  uint64_t v10 = self;
  objc_sync_enter(v10);
  unsigned int discoveryMode = v10->_discoveryMode;
  unsigned int v12 = [v7 isEqualToSet:v10->_lastReportedClientIdentifiers];
  v10->_unsigned int discoveryMode = a3;
  objc_storeStrong((id *)&v10->_lastReportedClientIdentifiers, a4);
  objc_sync_exit(v10);

  if (discoveryMode != a3 || v12 != 1)
  {
    workerQueue = (dispatch_queue_s *)v10->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004F4E0;
    block[3] = &unk_10039B958;
    BOOL v18 = discoveryMode != a3;
    void block[4] = v10;
    unsigned int v17 = a3;
    id v16 = v7;
    dispatch_async(workerQueue, block);
  }
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  -[MRDRemoteControlDiscoverySession setDiscoveryMode:forClientIdentifiers:]( self,  "setDiscoveryMode:forClientIdentifiers:",  v3,  v5);
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (unsigned)endpointFeatures
{
  return 8;
}

- (BOOL)devicePresenceDetected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)availableEndpoints
{
  return &__NSArray0__struct;
}

- (void)setAvailableOutputDevices:(id)a3
{
  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  availableOutputDevices = obj->_availableOutputDevices;
  obj->_availableOutputDevices = v4;

  objc_sync_exit(obj);
}

- (NSArray)availableOutputDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSArray copy](v2->_availableOutputDevices, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setUnclusteredOutputDevices:(id)a3
{
  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  unclusteredOutputDevices = obj->_unclusteredOutputDevices;
  obj->_unclusteredOutputDevices = v4;

  objc_sync_exit(obj);
}

- (NSArray)unclusteredOutputDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSArray copy](v2->_unclusteredOutputDevices, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setNativeOutputDevice:(id)a3
{
  v4 = (MRAVOutputDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  nativeOutputDevice = obj->_nativeOutputDevice;
  obj->_nativeOutputDevice = v4;

  objc_sync_exit(obj);
}

- (MRAVOutputDevice)nativeOutputDevice
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_nativeOutputDevice;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRoutingContextUID:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  routingContextID = obj->_routingContextID;
  obj->_routingContextID = v4;

  objc_sync_exit(obj);
}

- (id)routingContextUID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_routingContextID;
  objc_sync_exit(v2);

  return v3;
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[MRDeviceInfo copy](v2->_deviceInfo, "copy");
  objc_sync_exit(v2);

  return (MRDeviceInfo *)v3;
}

- (void)setDeviceInfo:(id)a3
{
  v4 = (MRDeviceInfo *)a3;
  obj = self;
  objc_sync_enter(obj);
  deviceInfo = obj->_deviceInfo;
  obj->_deviceInfo = v4;

  objc_sync_exit(obj);
}

- (NSSet)lastReportedClientIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_lastReportedClientIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)registerConnectionFailureForWHAIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workerQueue = (dispatch_queue_s *)self->_workerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004FD24;
    v7[3] = &unk_100398E60;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workerQueue, v7);
  }
}

- (void)unregisterConnectionFailureForWHAIdentifier:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004FE08;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

- (void)transport:(id)a3 didReceiveData:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);

  objc_sync_exit(v7);
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession localEndpointConnection](v7, "localEndpointConnection"));

  if (v8 == v14)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession localEndpointConnection](v7, "localEndpointConnection"));
    [v13 removeObserver:v7];

    -[MRDRemoteControlDiscoverySession setLocalEndpointConnection:](v7, "setLocalEndpointConnection:", 0LL);
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession undiscoverableGroupLeaderHandle]( v7,  "undiscoverableGroupLeaderHandle"));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 connection]);

    if (v10 == v14)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession undiscoverableGroupLeaderHandle]( v7,  "undiscoverableGroupLeaderHandle"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 connection]);
      [v12 removeObserver:v7];

      -[MRDRemoteControlDiscoverySession _scheduleAvailableOutputDevicesReload]( v7,  "_scheduleAvailableOutputDevicesReload");
    }
  }

  objc_sync_exit(v7);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1003F5EB8 == a6 || off_1003F5EC0 == a6)
  {
    workerQueue = (dispatch_queue_s *)self->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005007C;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(workerQueue, block);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MRDRemoteControlDiscoverySession;
    -[MRDRemoteControlDiscoverySession observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)controller:(id)a3 didDiscoverCompanion:(id)a4
{
  id v5 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100050128;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workerQueue, v8);
}

- (void)controllerDidUndiscoverCompanion:(id)a3
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050194;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)_scheduleAvailableOutputDevicesReload
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_scheduledAvailableOutputDevicesReload)
  {
    v2->_scheduledAvailableOutputDevicesReload = 1;
    workerQueue = (dispatch_queue_s *)v2->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100050230;
    block[3] = &unk_100399250;
    void block[4] = v2;
    dispatch_async(workerQueue, block);
  }

  objc_sync_exit(v2);
}

- (void)_reloadOutputDevices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v3 shouldConnectToLocalEndpoint])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession localEndpointConnection](self, "localEndpointConnection"));

    if (!v4) {
      return;
    }
  }

  else
  {
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingServer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localOriginClient]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInfoDataSource]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
  -[MRDRemoteControlDiscoverySession setDeviceInfo:](self, "setDeviceInfo:", v9);

  id v19 = (id)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _fetchAvailableOutputDevicesFromDiscoverySessions]( self,  "_fetchAvailableOutputDevicesFromDiscoverySessions"));
  if (-[NSArray count](self->_allowList, "count"))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100050510;
    v25[3] = &unk_10039AC00;
    v25[4] = self;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "msv_filter:", v25));

    id v19 = (id)v10;
  }

  if (-[NSArray count](self->_denyList, "count", v19))
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100050560;
    v24[3] = &unk_10039AC00;
    v24[4] = self;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "msv_filter:", v24));

    id v12 = (id)v11;
  }

  else
  {
    id v12 = v20;
  }

  -[MRDRemoteControlDiscoverySession setUnclusteredOutputDevices:](self, "setUnclusteredOutputDevices:", v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession deviceInfo](self, "deviceInfo"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceUID]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000505B0;
  v22[3] = &unk_10039AC00;
  id v23 = v14;
  id v15 = v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "msv_firstWhere:", v22));
  -[MRDRemoteControlDiscoverySession setNativeOutputDevice:](self, "setNativeOutputDevice:", v16);

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _clusterOutputDevicesFromUnclusteredDevices:]( self,  "_clusterOutputDevicesFromUnclusteredDevices:",  v21));
  -[MRDRemoteControlDiscoverySession setAvailableOutputDevices:](self, "setAvailableOutputDevices:", v17);

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  -[MRDRemoteControlDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", v18);
}

- (id)_clusterOutputDevicesFromUnclusteredDevices:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clusterID]);
        if (v13
          && -[MRDRemoteControlDiscoverySession _shouldCreateClusterOutputDevices]( self,  "_shouldCreateClusterOutputDevices"))
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));

          if (!v14)
          {
            id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v15, v13);
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));
          [v16 addObject:v12];
        }

        else
        {
          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000507F8;
  v19[3] = &unk_10039B980;
  unsigned int v17 = v5;
  id v20 = v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v19);

  return v17;
}

- (id)_fetchAvailableOutputDevicesFromDiscoverySessions
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (-[MRDRemoteControlDiscoverySession shouldUseDeviceInfoForLocalDevice](self, "shouldUseDeviceInfoForLocalDevice"))
  {
    id v4 = objc_alloc(&OBJC_CLASS___MRDeviceInfoOutputDevice);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession deviceInfo](self, "deviceInfo"));
    id v6 = [v4 initWithDeviceInfo:v5];

    -[NSMutableSet addObject:](v3, "addObject:", v6);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRAVConcreteRoutingDiscoverySession availableOutputDevices]( self->_avDiscoverySession,  "availableOutputDevices"));
  id v9 = [v8 copy];

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clusterID]);
        id v16 = v15;
        if (v15) {
          id v17 = v15;
        }
        else {
          id v17 = (id)objc_claimAutoreleasedReturnValue([v14 uid]);
        }
        BOOL v18 = v17;

        if ((-[NSMutableSet containsObject:]( self->_connectionFailedWHAIdentifiers,  "containsObject:",  v18) & 1) == 0)
        {
          -[NSMutableSet addObject:](v3, "addObject:", v14);
          if (v18) {
            -[NSMutableSet addObject:](v7, "addObject:", v18);
          }
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v11);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionDiscoverySession availableOutputDevices]( self->_groupSessionDiscoverySession,  "availableOutputDevices"));
  id v20 = [v19 copy];

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        __int16 v26 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 uid]);
        unsigned __int8 v28 = -[NSMutableSet containsObject:](v7, "containsObject:", v27);

        if ((v28 & 1) == 0) {
          -[NSMutableSet addObject:](v3, "addObject:", v26);
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }

    while (v23);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSDiscoverySession availableOutputDevices](self->_idsDiscoverySession, "availableOutputDevices"));
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue( -[MRAVRoutingDiscoverySession availableOutputDevices]( self->_companionDiscoverySession,  "availableOutputDevices"));
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v30);

  id v31 = (void *)objc_claimAutoreleasedReturnValue( -[MRAVRoutingDiscoverySession availableOutputDevices]( self->_externalDiscoverySession,  "availableOutputDevices"));
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v3, "allObjects"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _applyLocallySourcedValuesToOutputDevices:]( self,  "_applyLocallySourcedValuesToOutputDevices:",  v32));

  return v33;
}

- (id)_applyLocallySourcedValuesToOutputDevices:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _applyOutputContextValuesToOutputDevices:]( self,  "_applyOutputContextValuesToOutputDevices:",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession deviceInfo](self, "deviceInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _applyDeviceInfoValuesToOutputDevices:withDeviceInfo:]( self,  "_applyDeviceInfoValuesToOutputDevices:withDeviceInfo:",  v4,  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  LODWORD(v5) = [v7 supportMultiplayerHost];

  if ((_DWORD)v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession deviceInfo](self, "deviceInfo"));
    unsigned __int8 v9 = [v8 parentGroupContainsDiscoverableGroupLeader];

    if ((v9 & 1) != 0)
    {
      -[MRDRemoteControlDiscoverySession setRoutingContextUID:](self, "setRoutingContextUID:", 0LL);
    }

    else
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _applyLocalReservedOutputContextValuesToOutputDevices:]( self,  "_applyLocalReservedOutputContextValuesToOutputDevices:",  v6));

      id v6 = (void *)v10;
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _addUndiscoveredOutputContextOutputDevices:]( self,  "_addUndiscoveredOutputContextOutputDevices:",  v6));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v13 = [v12 supportMRRelay];

  if (v13)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _addUndiscoverableGroupLeaderFromDeviceInfo:]( self,  "_addUndiscoverableGroupLeaderFromDeviceInfo:",  v11));

    id v11 = (void *)v14;
  }

  return v11;
}

- (id)_applyOutputContextValuesToOutputDevices:(id)a3
{
  id v4 = a3;
  id v40 = [v4 mutableCopy];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v5 outputContexts]);

  id v6 = self;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v58;
    __int128 v39 = v6;
    uint64_t v30 = *(void *)v58;
    do
    {
      uint64_t v10 = 0LL;
      id v32 = v8;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v10);
        if (([v11 isLocalDevice] & 1) == 0)
        {
          v34 = v10;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          id v35 = v31;
          id v37 = [v35 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (!v37) {
            goto LABEL_37;
          }
          uint64_t v36 = *(void *)v54;
          while (1)
          {
            uint64_t v12 = 0LL;
            do
            {
              if (*(void *)v54 != v36) {
                objc_enumerationMutation(v35);
              }
              uint64_t v38 = v12;
              unsigned int v13 = *(void **)(*((void *)&v53 + 1) + 8 * v12);
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              id v41 = (id)objc_claimAutoreleasedReturnValue([v13 outputDevices]);
              id v44 = [v41 countByEnumeratingWithState:&v49 objects:v62 count:16];
              if (v44)
              {
                uint64_t v43 = *(void *)v50;
                do
                {
                  for (i = 0LL; i != v44; i = (char *)i + 1)
                  {
                    if (*(void *)v50 != v43) {
                      objc_enumerationMutation(v41);
                    }
                    id v15 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
                    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clusterCompositionMembers]);
                    id v17 = v16;
                    if (v16)
                    {
                      __int128 v47 = 0u;
                      __int128 v48 = 0u;
                      __int128 v45 = 0u;
                      __int128 v46 = 0u;
                      id v18 = v16;
                      id v19 = [v18 countByEnumeratingWithState:&v45 objects:v61 count:16];
                      if (v19)
                      {
                        __int128 v42 = v17;
                        uint64_t v20 = *(void *)v46;
                        while (2)
                        {
                          for (j = 0LL; j != v19; j = (char *)j + 1)
                          {
                            if (*(void *)v46 != v20) {
                              objc_enumerationMutation(v18);
                            }
                            id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 uid]);
                            unsigned int v24 = [v22 isEqualToString:v23];

                            if (v24)
                            {
                              id v19 = (id)objc_claimAutoreleasedReturnValue([v11 descriptor]);
                              id v6 = v39;
                              -[MRDRemoteControlDiscoverySession _mergeOutputDevice:intoProtobuf:]( v39,  "_mergeOutputDevice:intoProtobuf:",  v15,  v19);
                              goto LABEL_28;
                            }
                          }

                          id v19 = [v18 countByEnumeratingWithState:&v45 objects:v61 count:16];
                          if (v19) {
                            continue;
                          }
                          break;
                        }

                        id v6 = v39;
LABEL_28:
                        id v17 = v42;
                      }
                    }

                    else
                    {
                      id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 uid]);
                      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v11 uid]);
                      unsigned int v27 = [v25 isEqualToString:v26];

                      if (!v27) {
                        goto LABEL_33;
                      }
                      id v19 = (id)objc_claimAutoreleasedReturnValue([v11 descriptor]);
                      id v18 = (id)objc_claimAutoreleasedReturnValue([v15 descriptor]);
                      [v19 mergeFrom:v18];
                    }

                    if (v19)
                    {
                      [v19 setIsRemoteControllable:1];
                      [v40 removeObject:v11];
                      unsigned __int8 v28 = -[MRAVDistantOutputDevice initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithDescriptor:",  v19);
                      [v40 addObject:v28];

                      -[MRDRemoteControlDiscoverySession _logChangesInModifyingOutputDevice:toOutputDevice:reason:]( v6,  "_logChangesInModifyingOutputDevice:toOutputDevice:reason:",  v11,  v19,  @"updateFromOutputContext");
                    }

- (id)_applyDeviceInfoValuesToOutputDevices:(id)a3 withDeviceInfo:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100051218;
  v8[3] = &unk_10039B9A8;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "msv_map:", v8));

  return v6;
}

- (id)_applyLocalReservedOutputContextValuesToOutputDevices:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005130C;
  v4[3] = &unk_10039B9D0;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "msv_map:", v4));
}

- (id)_addUndiscoveredOutputContextOutputDevices:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 populatedOutputContexts]);

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100051890;
  v49[3] = &unk_10039AC00;
  id v26 = v4;
  id v50 = v26;
  id v8 = objc_retainBlock(v49);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100051980;
  v46[3] = &unk_10039B9F8;
  id v25 = v5;
  id v47 = v25;
  __int128 v48 = self;
  id v9 = objc_retainBlock(v46);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v7;
  id v29 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v43;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v10;
        id v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v31 = (id)objc_claimAutoreleasedReturnValue([v11 outputDevices]);
        id v33 = [v31 countByEnumeratingWithState:&v38 objects:v52 count:16];
        if (v33)
        {
          uint64_t v32 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v33; i = (char *)i + 1)
            {
              if (*(void *)v39 != v32) {
                objc_enumerationMutation(v31);
              }
              unsigned int v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clusterCompositionMembers]);
              id v15 = v14;
              if (v14)
              {
                __int128 v36 = 0u;
                __int128 v37 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                id v16 = [v14 countByEnumeratingWithState:&v34 objects:v51 count:16];
                if (v16)
                {
                  id v17 = v16;
                  uint64_t v18 = *(void *)v35;
                  do
                  {
                    for (j = 0LL; j != v17; j = (char *)j + 1)
                    {
                      if (*(void *)v35 != v18) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
                      if ((((uint64_t (*)(void *, void *))v8[2])(v8, v20) & 1) == 0)
                      {
                        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 descriptor]);
                        -[MRDRemoteControlDiscoverySession _mergeOutputDevice:intoProtobuf:]( self,  "_mergeOutputDevice:intoProtobuf:",  v13,  v21);
                        ((void (*)(void *, void *))v9[2])(v9, v21);
                      }
                    }

                    id v17 = [v15 countByEnumeratingWithState:&v34 objects:v51 count:16];
                  }

                  while (v17);
                }
              }

              else if ((((uint64_t (*)(void *, void *))v8[2])(v8, v13) & 1) == 0)
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 descriptor]);
                ((void (*)(void *, void *))v9[2])(v9, v22);
              }
            }

            id v33 = [v31 countByEnumeratingWithState:&v38 objects:v52 count:16];
          }

          while (v33);
        }

        uint64_t v10 = v30 + 1;
      }

      while ((id)(v30 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    }

    while (v29);
  }

  id v23 = v25;
  return v23;
}

- (id)_addUndiscoverableGroupLeaderFromDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession deviceInfo](self, "deviceInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession _calculateUndiscoverableGroupLeaderFromDeviceInfo:]( self,  "_calculateUndiscoverableGroupLeaderFromDeviceInfo:",  v5));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlDiscoverySession undiscoverableGroupLeaderHandle]( self,  "undiscoverableGroupLeaderHandle"));

    if (!v7)
    {
      -[MRDRemoteControlDiscoverySession setUndiscoverableGroupLeaderHandle:]( self,  "setUndiscoverableGroupLeaderHandle:",  v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      [v8 addObserver:self];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 leaderDeviceInfo]);
    id v10 = [[MRDeviceInfoOutputDevice alloc] initWithDeviceInfo:v9];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 descriptor]);
    -[MRDRemoteControlDiscoverySession _mergeDeviceInfo:intoProtobuf:](self, "_mergeDeviceInfo:intoProtobuf:", v9, v11);
    [v11 setIsRemoteControllable:1];
    [v11 setParentGroupContainsDiscoverableLeader:1];
    [v11 setGroupContainsGroupLeader:1];
    [v11 setIsProxyGroupPlayer:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 WHAIdentifier]);
    [v11 setUniqueIdentifier:v12];

    [v11 setIsGroupLeader:1];
    [v11 setTransportType:7];
    -[MRDRemoteControlDiscoverySession _logChangesInModifyingOutputDevice:toOutputDevice:reason:]( self,  "_logChangesInModifyingOutputDevice:toOutputDevice:reason:",  0LL,  v11,  @"addUndiscoveredGroupLeader");
    unsigned int v13 = -[MRAVDistantOutputDevice initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithDescriptor:",  v11);
    id v14 = (id)objc_claimAutoreleasedReturnValue([v4 arrayByAddingObject:v13]);
  }

  else
  {
    -[MRDRemoteControlDiscoverySession setUndiscoverableGroupLeaderHandle:]( self,  "setUndiscoverableGroupLeaderHandle:",  0LL);
    id v14 = v4;
  }

  return v14;
}

- (id)_calculateUndiscoverableGroupLeaderFromDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 routingServer]);
  unsigned __int8 v6 = [v5 isStartingNowPlayingSession];

  if (v6 & 1) != 0 || ([v3 parentGroupContainsDiscoverableGroupLeader])
  {
    id v7 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 leaderDeviceInfo]);
    id v9 = v8;
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 WHAIdentifier]);
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MRDMRRelayConnectionManager sharedManager]( &OBJC_CLASS___MRDMRRelayConnectionManager,  "sharedManager"));
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 connectionForOutputDeviceUID:v10]);
      }

      else
      {
        id v7 = 0LL;
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (void)_mergeOutputDevice:(id)a3 intoProtobuf:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  objc_msgSend(v11, "setIsAirPlayReceiverSessionActive:", objc_msgSend(v5, "isAirPlayReceiverSessionActive"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 groupID]);
  [v11 setGroupID:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 airPlayGroupID]);
  [v11 setAirPlayGroupID:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 parentGroupIdentifier]);
  [v11 setParentGroupIdentifier:v8];

  objc_msgSend(v11, "setGroupContainsGroupLeader:", objc_msgSend(v5, "groupContainsGroupLeader"));
  objc_msgSend( v11,  "setParentGroupContainsDiscoverableLeader:",  objc_msgSend(v5, "parentGroupContainsDiscoverableLeader"));
  objc_msgSend(v11, "setIsGroupLeader:", objc_msgSend(v5, "isGroupLeader"));
  objc_msgSend(v11, "setIsProxyGroupPlayer:", objc_msgSend(v5, "isProxyGroupPlayer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uid]);
  [v11 setClusterID:v9];

  [v11 setIsRemoteControllable:1];
  objc_msgSend(v11, "setConfiguredClusterSize:", objc_msgSend(v5, "configuredClusterSize"));
  id v10 = [v5 clusterType];

  [v11 setClusterType:v10];
}

- (void)_mergeDeviceInfo:(id)a3 intoProtobuf:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v5, "setIsAirPlayReceiverSessionActive:", objc_msgSend(v6, "isAirPlayActive"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUID]);
  [v5 setGroupID:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 airPlayGroupUID]);
  [v5 setAirPlayGroupID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 parentGroupID]);
  [v5 setParentGroupIdentifier:v9];

  objc_msgSend(v5, "setGroupContainsGroupLeader:", objc_msgSend(v6, "groupContainsDiscoverableGroupLeader"));
  objc_msgSend( v5,  "setParentGroupContainsDiscoverableLeader:",  objc_msgSend(v6, "parentGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setIsGroupLeader:", objc_msgSend(v6, "isGroupLeader"));
  objc_msgSend(v5, "setIsProxyGroupPlayer:", objc_msgSend(v6, "isProxyGroupPlayer"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 clusterID]);

  [v5 setClusterID:v10];
}

- (void)_logChangesInModifyingOutputDevice:(id)a3 toOutputDevice:(id)a4 reason:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v11 = [v10 verboseRemoteControlDiscoveryLogging];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 descriptor]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dictionaryRepresentation]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryRepresentation]);
    id v31 = 0LL;
    id v32 = 0LL;
    id v30 = 0LL;
    MRDictionaryCalculateDeltas(v13, v14, &v32, &v31, &v30);
    id v15 = v32;
    id v16 = v31;
    id v17 = v30;

    uint64_t v18 = (char *)[v15 count];
    id v19 = &v18[(void)[v16 count]];
    if ((char *)[v17 count] + (void)v19)
    {
      uint64_t v20 = MRLogCategoryDiscoveryOversize();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        *(_DWORD *)buf = 138412802;
        id v34 = v9;
        __int16 v35 = 2112;
        __int128 v36 = v22;
        __int16 v37 = 2112;
        __int128 v38 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[RemoteControlDiscoverySession] Applied %@ sourced values from outputDevice %@:%@",  buf,  0x20u);
      }

      if (v7)
      {
        if ([v15 count])
        {
          uint64_t v24 = MRLogCategoryDiscoveryOversize();
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v34 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[RemoteControlDiscoverySession] Added Fields: %{public}@",  buf,  0xCu);
          }
        }

        if ([v16 count])
        {
          uint64_t v26 = MRLogCategoryDiscoveryOversize();
          unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v34 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[RemoteControlDiscoverySession] Removed Fields: %{public}@",  buf,  0xCu);
          }
        }

        if ([v17 count])
        {
          uint64_t v28 = MRLogCategoryDiscoveryOversize();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v34 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[RemoteControlDiscoverySession] Updated Values: %{public}@",  buf,  0xCu);
          }
        }
      }
    }
  }
}

- (void)_loadLocalEndpointConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  id v6 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"loadLocalEndpointConnection",  v5);
  if (objc_opt_class(self)) {
    -[NSMutableString appendFormat:](v6, "appendFormat:", @" for %@", objc_opt_class(self));
  }
  uint64_t v8 = _MRLogForCategory(10LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v52 = (const __CFString *)v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v11 = (objc_class *)objc_opt_class(self);
  uint64_t v12 = NSStringFromClass(v11);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v13,  MRExternalDeviceConnectionReasonUserInfoKey);

  id v14 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v5,  MRExternalDeviceConnectionCorrelationIDUserInfoKey);
  id v16 = (void *)MRMediaRemoteCopyDeviceUID(v14, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputDeviceTransport _createConnectionWith:groupID:connectionType:shouldUseSystemAuthenticationPrompt:userInfo:]( &OBJC_CLASS___MRAVOutputDeviceTransport,  "_createConnectionWith:groupID:connectionType:shouldUseSystemAuthenticationPrompt:userInfo:",  v16,  0LL,  2LL,  0LL,  v10));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 first]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 second]);

  if (!v19 && v18)
  {
    uint64_t v20 = objc_opt_class(self);
    uint64_t v22 = _MRLogForCategory(10LL, v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v24)
      {
        uint64_t v25 = objc_opt_class(self);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v26 timeIntervalSinceDate:v3];
        *(_DWORD *)buf = 138544386;
        __int128 v52 = @"loadLocalEndpointConnection";
        __int16 v53 = 2114;
        __int128 v54 = v5;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v18;
        __int16 v57 = 2114;
        uint64_t v58 = v25;
        __int16 v59 = 2048;
        uint64_t v60 = v27;
        uint64_t v28 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v29 = v23;
        uint32_t v30 = 52;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
        goto LABEL_18;
      }

      goto LABEL_27;
    }

    if (!v24) {
      goto LABEL_27;
    }
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v42 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    __int128 v52 = @"loadLocalEndpointConnection";
    __int16 v53 = 2114;
    __int128 v54 = v5;
    __int16 v55 = 2112;
    uint64_t v56 = (uint64_t)v18;
    __int16 v57 = 2048;
    uint64_t v58 = v43;
    __int128 v44 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    __int128 v45 = v23;
    uint32_t v46 = 42;
    goto LABEL_25;
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v17 second]);

  uint64_t v32 = objc_opt_class(self);
  uint64_t v34 = _MRLogForCategory(10LL, v33);
  __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  id v23 = v35;
  if (v31)
  {
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v36)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v17 second]);
        uint64_t v50 = objc_opt_class(self);
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v37 timeIntervalSinceDate:v3];
        *(_DWORD *)buf = 138544386;
        __int128 v52 = @"loadLocalEndpointConnection";
        __int16 v53 = 2114;
        __int128 v54 = v5;
        __int16 v55 = 2114;
        uint64_t v56 = (uint64_t)v26;
        __int16 v57 = 2114;
        uint64_t v58 = v50;
        __int16 v59 = 2048;
        uint64_t v60 = v38;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds",  buf,  0x34u);

LABEL_18:
        goto LABEL_27;
      }

      goto LABEL_27;
    }

    if (!v36) {
      goto LABEL_27;
    }
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v17 second]);
    id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v47 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    __int128 v52 = @"loadLocalEndpointConnection";
    __int16 v53 = 2114;
    __int128 v54 = v5;
    __int16 v55 = 2114;
    uint64_t v56 = (uint64_t)v42;
    __int16 v57 = 2048;
    uint64_t v58 = v48;
    _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds",  buf,  0x2Au);

LABEL_26:
    goto LABEL_27;
  }

  BOOL v39 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (!v32)
  {
    if (!v39) {
      goto LABEL_27;
    }
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v42 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138543874;
    __int128 v52 = @"loadLocalEndpointConnection";
    __int16 v53 = 2114;
    __int128 v54 = v5;
    __int16 v55 = 2048;
    uint64_t v56 = v49;
    __int128 v44 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    __int128 v45 = v23;
    uint32_t v46 = 32;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);
    goto LABEL_26;
  }

  if (v39)
  {
    uint64_t v40 = objc_opt_class(self);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v26 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    __int128 v52 = @"loadLocalEndpointConnection";
    __int16 v53 = 2114;
    __int128 v54 = v5;
    __int16 v55 = 2114;
    uint64_t v56 = v40;
    __int16 v57 = 2048;
    uint64_t v58 = v41;
    uint64_t v28 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    id v29 = v23;
    uint32_t v30 = 42;
    goto LABEL_17;
  }

- (void)_loadDefaults
{
  id v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](self->_userDefaults, "valueForKey:", @"remotecontrol-denylist"));
  denyList = self->_denyList;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (denyList)
  {
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = self->_denyList;
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = @"RemoteControlDiscoverySession";
    __int16 v35 = 2114;
    BOOL v36 = @"denyList";
    __int16 v37 = 2112;
    uint64_t v38 = v9;
    __int16 v39 = 2112;
    uint64_t v40 = v3;
    id v10 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    unsigned int v11 = v7;
    uint32_t v12 = 42;
  }

  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = @"RemoteControlDiscoverySession";
    __int16 v35 = 2114;
    BOOL v36 = @"denyList";
    __int16 v37 = 2112;
    uint64_t v38 = v3;
    id v10 = "Set: %{public}@ setting %{public}@ to <%@>";
    unsigned int v11 = v7;
    uint32_t v12 = 32;
  }

  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v13);
  uint64_t v15 = v3;
  if ((isKindOfClass & 1) == 0)
  {
    if (v3)
    {
      uint64_t v32 = v3;
      id v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      goto LABEL_12;
    }

    uint64_t v15 = 0LL;
  }

  id v16 = v15;
LABEL_12:
  id v17 = self->_denyList;
  self->_denyList = v16;

  uint64_t v18 = (NSArray *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults valueForKey:]( self->_userDefaults,  "valueForKey:",  @"remotecontrol-allowlist"));
  id v19 = self->_denyList;
  uint64_t v21 = _MRLogForCategory(0LL, v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (!v23) {
      goto LABEL_18;
    }
    BOOL v24 = self->_denyList;
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = @"RemoteControlDiscoverySession";
    __int16 v35 = 2114;
    BOOL v36 = @"allowList";
    __int16 v37 = 2112;
    uint64_t v38 = v24;
    __int16 v39 = 2112;
    uint64_t v40 = v18;
    uint64_t v25 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    uint64_t v26 = v22;
    uint32_t v27 = 42;
  }

  else
  {
    if (!v23) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = @"RemoteControlDiscoverySession";
    __int16 v35 = 2114;
    BOOL v36 = @"allowList";
    __int16 v37 = 2112;
    uint64_t v38 = v18;
    uint64_t v25 = "Set: %{public}@ setting %{public}@ to <%@>";
    uint64_t v26 = v22;
    uint32_t v27 = 32;
  }

  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
LABEL_18:

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v18, v28) & 1) != 0)
  {
    int v29 = 0;
    uint32_t v30 = v18;
  }

  else if (v18)
  {
    id v31 = v18;
    int v29 = 1;
    uint32_t v30 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  }

  else
  {
    int v29 = 0;
    uint32_t v30 = 0LL;
  }

  objc_storeStrong((id *)&self->_allowList, v30);
  if (v29) {
}
  }

- (BOOL)shouldUseDeviceInfoForLocalDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v2 forceDeviceInfoDiscovery])
  {
    unsigned __int8 v3 = 1;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v3 = [v4 homepodDemoMode];
  }

  return v3;
}

- (BOOL)_shouldCreateClusterOutputDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v3 = [v2 useClusterDevices];

  return v3;
}

- (void)_initializeDiscoverySessions
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v4 = [v3 supportIDSDiscovery];

  if (v4)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___MRDIDSDiscoverySession);
    idsDiscoverySession = self->_idsDiscoverySession;
    self->_idsDiscoverySession = v5;

    -[MRDIDSDiscoverySession setAlwaysLogUpdates:](self->_idsDiscoverySession, "setAlwaysLogUpdates:", 1LL);
    -[MRDIDSDiscoverySession setAlwaysAllowUpdates:](self->_idsDiscoverySession, "setAlwaysAllowUpdates:", 1LL);
    uint64_t v7 = self->_idsDiscoverySession;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100052EF8;
    v30[3] = &unk_10039BA20;
    objc_copyWeak(&v31, &location);
    id v8 = -[MRDIDSDiscoverySession addOutputDevicesChangedCallback:](v7, "addOutputDevicesChangedCallback:", v30);
    objc_destroyWeak(&v31);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned int v10 = [v9 supportGroupSession];

  if (v10)
  {
    unsigned int v11 = objc_alloc_init(&OBJC_CLASS____TtC12mediaremoted31MRDGroupSessionDiscoverySession);
    groupSessionDiscoverySession = self->_groupSessionDiscoverySession;
    self->_groupSessionDiscoverySession = v11;

    uint64_t v13 = self->_groupSessionDiscoverySession;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100052F24;
    v28[3] = &unk_10039BA20;
    objc_copyWeak(&v29, &location);
    id v14 =  -[MRDGroupSessionDiscoverySession addOutputDevicesChangedCallback:]( v13,  "addOutputDevicesChangedCallback:",  v28);
    objc_destroyWeak(&v29);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v16 = [v15 discoverCompanionDevices];

  if (v16)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___MRIDSCompanionDiscoverySession);
    companionDiscoverySession = self->_companionDiscoverySession;
    self->_companionDiscoverySession = (MRAVRoutingDiscoverySession *)v17;

    -[MRAVRoutingDiscoverySession setAlwaysLogUpdates:](self->_companionDiscoverySession, "setAlwaysLogUpdates:", 1LL);
    -[MRAVRoutingDiscoverySession setAlwaysAllowUpdates:]( self->_companionDiscoverySession,  "setAlwaysAllowUpdates:",  1LL);
    id v19 = self->_companionDiscoverySession;
    BOOL v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    uint64_t v25 = sub_100052F50;
    uint64_t v26 = &unk_10039BA20;
    objc_copyWeak(&v27, &location);
    id v20 =  -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:]( v19,  "addOutputDevicesChangedCallback:",  &v23);
    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___MRCompanionConnectionController);
    companionController = self->_companionController;
    self->_companionController = v21;

    -[MRCompanionConnectionController setDelegate:]( self->_companionController,  "setDelegate:",  self,  v23,  v24,  v25,  v26);
    -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_companionDiscoverySession, "setDiscoveryMode:", 3LL);
    objc_destroyWeak(&v27);
  }

  -[MRDRemoteControlDiscoverySession _setupStandaloneDiscovery](self, "_setupStandaloneDiscovery");
  objc_destroyWeak(&location);
}

- (void)_setupStandaloneDiscovery
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[RemoteControlDiscoverySession] %@ setupStandaloneDiscovery",  buf,  0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MRAVConcreteRoutingDiscoverySession);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession configuration](self, "configuration"));
  uint64_t v7 = -[MRAVConcreteRoutingDiscoverySession initWithConfiguration:](v5, "initWithConfiguration:", v6);
  avDiscoverySession = self->_avDiscoverySession;
  self->_avDiscoverySession = v7;

  -[MRAVConcreteRoutingDiscoverySession setAlwaysLogUpdates:](self->_avDiscoverySession, "setAlwaysLogUpdates:", 1LL);
  -[MRAVConcreteRoutingDiscoverySession setAlwaysAllowUpdates:]( self->_avDiscoverySession,  "setAlwaysAllowUpdates:",  1LL);
  objc_initWeak((id *)buf, self);
  id v9 = self->_avDiscoverySession;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100053190;
  v13[3] = &unk_10039BA20;
  objc_copyWeak(&v14, (id *)buf);
  id v10 =  -[MRAVConcreteRoutingDiscoverySession addOutputDevicesChangedCallback:]( v9,  "addOutputDevicesChangedCallback:",  v13);
  -[MRAVConcreteRoutingDiscoverySession setDiscoveryMode:]( self->_avDiscoverySession,  "setDiscoveryMode:",  self->_discoveryMode);
  -[MRAVRoutingDiscoverySession removeOutputDevicesChangedCallback:]( self->_externalDiscoverySession,  "removeOutputDevicesChangedCallback:",  self->_externalDiscoverySessionToken);
  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_externalDiscoverySession, "setDiscoveryMode:", 0LL);
  externalDiscoverySession = self->_externalDiscoverySession;
  self->_externalDiscoverySession = 0LL;

  id externalDiscoverySessionToken = self->_externalDiscoverySessionToken;
  self->_id externalDiscoverySessionToken = 0LL;

  -[MRDRemoteControlDiscoverySession _scheduleAvailableOutputDevicesReload]( self,  "_scheduleAvailableOutputDevicesReload");
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_setupProxiedDiscoveryWithDestinationEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[RemoteControlDiscoverySession] %@ setupCompanionDiscovery",  buf,  0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v8 = -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]( objc_alloc(&OBJC_CLASS___MRAVRoutingDiscoverySessionConfiguration),  "initWithEndpointFeatures:",  -[MRDRemoteControlDiscoverySession endpointFeatures](self, "endpointFeatures"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlDiscoverySession routingContextUID](self, "routingContextUID"));
  -[MRAVRoutingDiscoverySessionConfiguration setRoutingContextUID:](v8, "setRoutingContextUID:", v9);

  id v10 = (MRAVRoutingDiscoverySession *)objc_claimAutoreleasedReturnValue([v4 discoverySessionWithConfiguration:v8]);
  externalDiscoverySession = self->_externalDiscoverySession;
  self->_externalDiscoverySession = v10;

  -[MRAVRoutingDiscoverySession setAlwaysLogUpdates:](self->_externalDiscoverySession, "setAlwaysLogUpdates:", 1LL);
  -[MRAVRoutingDiscoverySession setAlwaysAllowUpdates:](self->_externalDiscoverySession, "setAlwaysAllowUpdates:", 1LL);
  objc_initWeak((id *)buf, self);
  uint32_t v12 = self->_externalDiscoverySession;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100053400;
  v16[3] = &unk_10039BA20;
  objc_copyWeak(&v17, (id *)buf);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:]( v12,  "addOutputDevicesChangedCallback:",  v16));
  id externalDiscoverySessionToken = self->_externalDiscoverySessionToken;
  self->_id externalDiscoverySessionToken = v13;

  -[MRAVRoutingDiscoverySession setDiscoveryMode:]( self->_externalDiscoverySession,  "setDiscoveryMode:",  -[MRDRemoteControlDiscoverySession discoveryMode](self, "discoveryMode"));
  -[MRAVConcreteRoutingDiscoverySession setDiscoveryMode:](self->_avDiscoverySession, "setDiscoveryMode:", 0LL);
  avDiscoverySession = self->_avDiscoverySession;
  self->_avDiscoverySession = 0LL;

  -[MRDRemoteControlDiscoverySession _scheduleAvailableOutputDevicesReload]( self,  "_scheduleAvailableOutputDevicesReload");
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (MRAVConcreteRoutingDiscoverySession)avDiscoverySession
{
  return self->_avDiscoverySession;
}

- (void)setAvDiscoverySession:(id)a3
{
}

- (MRDIDSDiscoverySession)idsDiscoverySession
{
  return self->_idsDiscoverySession;
}

- (void)setIdsDiscoverySession:(id)a3
{
}

- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)groupSessionDiscoverySession
{
  return self->_groupSessionDiscoverySession;
}

- (void)setGroupSessionDiscoverySession:(id)a3
{
}

- (MRAVRoutingDiscoverySession)companionDiscoverySession
{
  return self->_companionDiscoverySession;
}

- (void)setCompanionDiscoverySession:(id)a3
{
}

- (MRAVRoutingDiscoverySession)externalDiscoverySession
{
  return self->_externalDiscoverySession;
}

- (void)setExternalDiscoverySession:(id)a3
{
}

- (MRCompanionConnectionController)companionController
{
  return self->_companionController;
}

- (void)setCompanionController:(id)a3
{
}

- (MRExternalDeviceTransportConnectionHandle)undiscoverableGroupLeaderHandle
{
  return self->_undiscoverableGroupLeaderHandle;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSArray)allowList
{
  return self->_allowList;
}

- (NSArray)denyList
{
  return self->_denyList;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end