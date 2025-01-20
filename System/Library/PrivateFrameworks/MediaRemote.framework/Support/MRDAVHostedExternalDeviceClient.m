@interface MRDAVHostedExternalDeviceClient
- (BOOL)hasAttemptedToConnect;
- (BOOL)hasConnectionAttemptCompleted;
- (MRDAVHostedExternalDeviceClient)initWithConnection:(id)a3;
- (MRDAVHostedExternalDevicePendingClientState)pendingClientState;
- (MRDMediaRemoteClient)xpcClient;
- (MRXPCConnectionMonitor)connectionMonitor;
- (NSArray)discoveryTokens;
- (NSArray)subscribedPlayerPaths;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)discoveryTokenForConfiguration:(id)a3;
- (unint64_t)notifications;
- (unint64_t)registeredCallbacks;
- (unsigned)connectionState;
- (void)_maybeWakeClient;
- (void)_resumeConnectionWithState:(id)a3;
- (void)connectionDidInvalidate:(id)a3;
- (void)connectionDidResume:(id)a3;
- (void)dealloc;
- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4;
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
- (void)invalidateWithError:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setConnectionState:(unsigned int)a3;
- (void)setDiscoveryToken:(id)a3 forConfiguration:(id)a4;
- (void)setHasAttemptedToConnect:(BOOL)a3;
- (void)setHasConnectionAttemptCompleted:(BOOL)a3;
- (void)setNotifications:(unint64_t)a3;
- (void)setPendingClientState:(id)a3;
- (void)setRegisteredCallbacks:(unint64_t)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setXpcClient:(id)a3;
@end

@implementation MRDAVHostedExternalDeviceClient

- (MRDAVHostedExternalDeviceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRDAVHostedExternalDeviceClient;
  v6 = -[MRDAVHostedExternalDeviceClient init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_registeredCallbacks = 0LL;
    v7->_notifications = 0LL;
    connection = v7->_connection;
    if (connection) {
      -[NSXPCConnection auditToken](connection, "auditToken");
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    v9 = sub_10013D0D8(v19);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v10;

    v12 = objc_alloc(&OBJC_CLASS___MRXPCConnectionMonitor);
    v13 = (objc_class *)objc_opt_class(v7);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = -[MRXPCConnectionMonitor initWithConnection:label:](v12, "initWithConnection:label:", v5, v15);
    connectionMonitor = v7->_connectionMonitor;
    v7->_connectionMonitor = v16;

    -[MRXPCConnectionMonitor setDelegate:](v7->_connectionMonitor, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  v3 = objc_alloc(&OBJC_CLASS___NSError);
  v4 = -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  kMRMediaRemoteFrameworkErrorDomain,  123LL,  0LL);
  -[MRDAVHostedExternalDeviceClient invalidateWithError:](self, "invalidateWithError:", v4);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDAVHostedExternalDeviceClient;
  -[MRDAVHostedExternalDeviceClient dealloc](&v5, "dealloc");
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  if (self->_connection)
  {
    uint64_t v5 = MRLogCategoryConnections();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[HostedExternalDeviceClient] %@ Invalidating with error %@",  buf,  0x16u);
    }

    v7 = self->_connection;
    connection = self->_connection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100033D58;
    v11[3] = &unk_100399250;
    v12 = v7;
    v9 = v7;
    -[NSXPCConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v11);
    uint64_t v10 = self->_connection;
    self->_connection = 0LL;
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p %@-%d>",  objc_opt_class(self),  self,  self->_bundleIdentifier,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@ %p {\n",  objc_opt_class(v2),  v2);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  %@-%d\n",  v2->_bundleIdentifier,  -[NSXPCConnection processIdentifier](v2->_connection, "processIdentifier"));
  BOOL hasAttemptedToConnect = v2->_hasAttemptedToConnect;
  hasAttemptedToConnectDate = v2->_hasAttemptedToConnectDate;
  -[NSDate timeIntervalSinceNow](hasAttemptedToConnectDate, "timeIntervalSinceNow");
  if (hasAttemptedToConnect) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  hasConnected = %@ (%@ %lf seconds ago)\n",  v7,  hasAttemptedToConnectDate,  -v6);
  BOOL hasConnectionAttemptCompleted = v2->_hasConnectionAttemptCompleted;
  hasConnectionAttemptCompletedDate = v2->_hasConnectionAttemptCompletedDate;
  -[NSDate timeIntervalSinceNow](hasConnectionAttemptCompletedDate, "timeIntervalSinceNow");
  if (hasConnectionAttemptCompleted) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  hasConnectedCompleted = %@ (%@ %lf seconds ago)\n",  v11,  hasConnectionAttemptCompletedDate,  -v10);
  v12 = (void *)MRExternalDeviceConnectionStateCopyDescription(v2->_connectionState);
  connectionStateDate = v2->_connectionStateDate;
  -[NSDate timeIntervalSinceNow](connectionStateDate, "timeIntervalSinceNow");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  connectionState = %@ (%@ %lf seconds ago)\n",  v12,  connectionStateDate,  -v14);

  if (v2->_registeredCallbacks)
  {
    uint64_t v15 = NSStringFromMRAVDistantExternalDeviceCallbackFlags();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  registeredCallbacks = %@\n", v16);
  }

  if (v2->_notifications)
  {
    uint64_t v17 = NSStringFromMRAVDistantExternalDeviceNotificationFlags();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  registeredNotifications = %@\n", v18);
  }

  if (-[NSArray count](v2->_subscribedPlayerPaths, "count"))
  {
    uint64_t v19 = MRCreateIndentedDebugDescriptionFromArray(v2->_subscribedPlayerPaths);
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  subscribedPlayerPaths = %@", v20);
  }

  pendingClientState = v2->_pendingClientState;
  if (pendingClientState)
  {
    uint64_t v22 = MRCreateIndentedDebugDescriptionFromObject(pendingClientState);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  pendingClientState = %@", v23);
  }

  uint64_t v24 = MRCreateIndentedDebugDescriptionFromObject(v2->_connectionMonitor);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  connectionMonitor = %@", v25);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>\n");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  -[MRDAVHostedExternalDeviceClient setConnectionState:](self, "setConnectionState:", v4);
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000340AC;
  v9[3] = &unk_10039AB60;
  int v11 = v4;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v9);
}

- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000342DC;
  v7[3] = &unk_10039AB88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v7);
}

- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100034500;
  v11[3] = &unk_100399008;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v11);
}

- (void)hostedExternalDeviceEndpointDidChange:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000346C8;
  v7[3] = &unk_10039AB88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v7);
}

- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000348D0;
  v9[3] = &unk_10039AB60;
  unsigned int v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v9);
}

- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100034BC4;
  v9[3] = &unk_10039AB60;
  float v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v9);
}

- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100034EA4;
  v9[3] = &unk_10039ABB0;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v9);
}

- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100035178;
  v7[3] = &unk_10039AB88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v7);
}

- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000353D0;
  v7[3] = &unk_10039AB88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v7);
}

- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100035628;
  v7[3] = &unk_10039AB88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v7);
}

- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MRDAVHostedExternalDeviceClient _maybeWakeClient](self, "_maybeWakeClient");
  connectionMonitor = self->_connectionMonitor;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000358A4;
  v11[3] = &unk_100399008;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v11);
}

- (void)setHasAttemptedToConnect:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL hasAttemptedToConnect = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  hasAttemptedToConnectDate = obj->_hasAttemptedToConnectDate;
  obj->_hasAttemptedToConnectDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (BOOL)hasAttemptedToConnect
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL hasAttemptedToConnect = v2->_hasAttemptedToConnect;
  objc_sync_exit(v2);

  return hasAttemptedToConnect;
}

- (void)setConnectionState:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_connectionState = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  connectionStateDate = obj->_connectionStateDate;
  obj->_connectionStateDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (unsigned)connectionState
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int connectionState = v2->_connectionState;
  objc_sync_exit(v2);

  return connectionState;
}

- (void)setHasConnectionAttemptCompleted:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL hasConnectionAttemptCompleted = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  hasConnectionAttemptCompletedDate = obj->_hasConnectionAttemptCompletedDate;
  obj->_hasConnectionAttemptCompletedDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (BOOL)hasConnectionAttemptCompleted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL hasConnectionAttemptCompleted = v2->_hasConnectionAttemptCompleted;
  objc_sync_exit(v2);

  return hasConnectionAttemptCompleted;
}

- (id)discoveryTokenForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_discoveryTokens, "objectForKeyedSubscript:", v4));
  objc_sync_exit(v5);

  return v6;
}

- (void)setDiscoveryToken:(id)a3 forConfiguration:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = v13;
  discoveryTokens = v7->_discoveryTokens;
  if (!discoveryTokens)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    BOOL v11 = v7->_discoveryTokens;
    v7->_discoveryTokens = v10;

    discoveryTokens = v7->_discoveryTokens;
    id v8 = v13;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveryTokens, "setObject:forKeyedSubscript:", v8, v6);
  if (!v13)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedExternalDevicePendingClientState discoverySessionConfigurationsResults]( v7->_pendingClientState,  "discoverySessionConfigurationsResults"));
    [v12 setObject:0 forKeyedSubscript:v6];
  }

  objc_sync_exit(v7);
}

- (NSArray)discoveryTokens
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_discoveryTokens, "allValues"));
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)connectionDidResume:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = v4;
  objc_sync_enter(v5);
  id v6 = v5[13];
  id v7 = v5[13];
  v5[13] = 0LL;

  objc_sync_exit(v5);
  [v5 _resumeConnectionWithState:v6];

  objc_sync_exit(v5);
}

- (void)connectionDidInvalidate:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___MRDAVHostedExternalDevicePendingClientState);
  pendingClientState = v4->_pendingClientState;
  v4->_pendingClientState = v5;

  objc_sync_exit(v4);
}

- (void)_resumeConnectionWithState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v89 = v4;
    __int16 v90 = 2112;
    v91 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[HostedExternalDeviceClient] Restoring state %@ for %@",  buf,  0x16u);
  }

  if ([v4 connectionState])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    id v8 = [v4 connectionState];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionStateError]);
    [v7 hostedExternalDeviceConnectionStateDidChange:v8 withError:v9];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  if (v10)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);
    [v11 hostedExternalDeviceDeviceInfoDidChange:v12];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);

  if (v13)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
    [v14 hostedExternalDeviceEndpointDidChange:v15];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceModifications]);

  if (v16)
  {
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceModifications]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 addedOutputDevices]);

    id v19 = [v18 countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v82;
      do
      {
        uint64_t v22 = 0LL;
        do
        {
          if (*(void *)v82 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v81 + 1) + 8LL * (void)v22);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
          [v24 hostedExternalDeviceDidAddOutputDevice:v23];

          uint64_t v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v81 objects:v87 count:16];
      }

      while (v20);
    }

    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceModifications]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 changedOutputDevices]);

    id v27 = [v26 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v78;
      do
      {
        v30 = 0LL;
        do
        {
          if (*(void *)v78 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v77 + 1) + 8LL * (void)v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
          [v32 hostedExternalDeviceDidChangeOutputDevice:v31];

          v30 = (char *)v30 + 1;
        }

        while (v28 != v30);
        id v28 = [v26 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }

      while (v28);
    }

    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    v33 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceModifications]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 removedOutputDevices]);

    id v35 = [v34 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v74;
      do
      {
        v38 = 0LL;
        do
        {
          if (*(void *)v74 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
          [v40 hostedExternalDeviceDidRemoveOutputDevice:v39];

          v38 = (char *)v38 + 1;
        }

        while (v36 != v38);
        id v36 = [v34 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }

      while (v36);
    }
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue([v4 discoverySessionConfigurationsResults]);

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v4 discoverySessionConfigurationsResults]);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_1000365DC;
    v72[3] = &unk_10039ABD8;
    v72[4] = self;
    [v42 enumerateKeysAndObjectsUsingBlock:v72];
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceVolumeCapabilities]);

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceVolumeCapabilities]);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_100036648;
    v69[3] = &unk_10039AC28;
    id v70 = v4;
    v71 = self;
    [v44 enumerateKeysAndObjectsUsingBlock:v69];
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeCapabilities]);

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeCapabilities]);
    id v47 = [v46 unsignedIntValue];

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v48 hostedExternalDeviceVolumeCapabilitiesDidChange:v47 forOutputDevice:0];
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceVolume]);

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceVolume]);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_100036778;
    v66[3] = &unk_10039AC28;
    id v67 = v4;
    v68 = self;
    [v50 enumerateKeysAndObjectsUsingBlock:v66];
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue([v4 volume]);

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v4 volume]);
    [v52 floatValue];
    int v54 = v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    LODWORD(v56) = v54;
    [v55 hostedExternalDeviceVolumeDidChange:0 forOutputDevice:v56];
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceMute]);

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDeviceMute]);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_1000368A8;
    v63[3] = &unk_10039AC28;
    id v64 = v4;
    v65 = self;
    [v58 enumerateKeysAndObjectsUsingBlock:v63];
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue([v4 isMuted]);

  if (v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue([v4 volume]);
    id v61 = [v60 BOOLValue];

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v62 hostedExternalDeviceIsMutedDidChange:v61 forOutputDevice:0];
  }
}

- (void)_maybeWakeClient
{
  xpcClient = self->_xpcClient;
  if (!xpcClient)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v5 = (MRDMediaRemoteClient *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "clientForPID:",  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")));
    id v6 = self->_xpcClient;
    self->_xpcClient = v5;

    xpcClient = self->_xpcClient;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayerPath anyPlayerPath](&OBJC_CLASS___MRPlayerPath, "anyPlayerPath"));
  unsigned int v8 = -[MRDMediaRemoteClient notificationRequiresTaskAssertionForPlayerPath:]( xpcClient,  "notificationRequiresTaskAssertionForPlayerPath:",  v7);

  if (v8)
  {
    id v9 = self->_xpcClient;
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v10 wakingPlayerPathAssertionDuration];
    -[MRDMediaRemoteClient takeAssertion:forReason:duration:]( v9,  "takeAssertion:forReason:duration:",  4LL,  @"WakingPlayerPathNotification");
  }

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)registeredCallbacks
{
  return self->_registeredCallbacks;
}

- (void)setRegisteredCallbacks:(unint64_t)a3
{
  self->_registeredCallbacks = a3;
}

- (unint64_t)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(unint64_t)a3
{
  self->_notifications = a3;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
}

- (MRDAVHostedExternalDevicePendingClientState)pendingClientState
{
  return self->_pendingClientState;
}

- (void)setPendingClientState:(id)a3
{
}

- (MRXPCConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (MRDMediaRemoteClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end