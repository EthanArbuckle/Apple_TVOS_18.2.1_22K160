@interface MRDRoutingDiscoverySession
- (BOOL)devicePresenceDetected;
- (BOOL)onlyDiscoversBluetoothDevices;
- (MRDRoutingDiscoverySession)initWithConfiguration:(id)a3;
- (NSString)clientIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (id)availableEndpoints;
- (id)availableOutputDevices;
- (id)routingContextUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (unsigned)targetAudioSessionID;
- (void)dealloc;
- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4;
- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRDRoutingDiscoverySession

- (MRDRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDRoutingDiscoverySession;
  v3 = -[MRDRoutingDiscoverySession initWithConfiguration:](&v8, "initWithConfiguration:", a3);
  if (v3)
  {
    if (qword_1003FDD40 != -1) {
      dispatch_once(&qword_1003FDD40, &stru_10039C640);
    }
    objc_storeStrong((id *)&v3->_workerQueue, (id)qword_1003FDD38);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000684AC;
    v6[3] = &unk_100399250;
    v7 = v3;
    [v4 addMediaRemoteSeverStartedHandler:v6];
  }

  return v3;
}

- (void)dealloc
{
  if (self->_discoveryMode)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v4, &stru_10039C660);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDRoutingDiscoverySession;
  -[MRDRoutingDiscoverySession dealloc](&v5, "dealloc");
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = -[MRDRoutingDiscoverySession discoveryMode](self, "discoveryMode");
  objc_super v8 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v6, v7);
  else {
    v9 = @"NO";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingDiscoverySession availableEndpoints](self, "availableEndpoints"));
  id v11 = [v10 count];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p %@ | %@ | %ldd:%ldd",  v5,  self,  v8,  v9,  v11,  [v12 count]));

  return (NSString *)v13;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = -[MRDRoutingDiscoverySession discoveryMode](self, "discoveryMode");
  objc_super v8 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v6, v7);
  else {
    v9 = @"NO";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingDiscoverySession availableEndpoints](self, "availableEndpoints"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> currentDiscoveryMode: %@\nalwaysAllowUpdates: %@\navailableOutputDevices: %@\navailableEndpoints: %@",  v5,  self,  v8,  v9,  v10,  v11));

  return (NSString *)v12;
}

- (NSString)clientIdentifier
{
  return (NSString *)@"mediaremotedirect";
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_discoveryMode == (_DWORD)v3)
  {
    objc_sync_exit(obj);
  }

  else
  {
    uint64_t v5 = _MRLogForCategory(0LL, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (id)MRMediaRemoteCopyRouteDiscoveryModeDescription(obj->_discoveryMode, v7);
      v10 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3, v9);
      *(_DWORD *)buf = 138412802;
      v15 = obj;
      __int16 v16 = 2114;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDDiscoverySession] %@ setting discoveryMode from %{public}@ to %{public}@",  buf,  0x20u);
    }

    obj->_discoveryMode = v3;
    objc_sync_exit(obj);

    workerQueue = (dispatch_queue_s *)obj->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100068980;
    block[3] = &unk_100399250;
    block[4] = obj;
    dispatch_async(workerQueue, block);
  }

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "msv_map:", &stru_10039C6A0));
  -[MRDRoutingDiscoverySession notifyEndpointsChanged:](self, "notifyEndpointsChanged:", v5);
}

- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5
{
}

- (unsigned)endpointFeatures
{
  return 8;
}

- (id)availableEndpoints
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingDiscoverySession endpointsSnapshot](self, "endpointsSnapshot"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_map:", &stru_10039C6C0));

  return v3;
}

- (id)availableOutputDevices
{
  return -[MRDRoutingDiscoverySession outputDevicesSnapshot](self, "outputDevicesSnapshot");
}

- (BOOL)devicePresenceDetected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unsigned)targetAudioSessionID
{
  return 0;
}

- (id)routingContextUID
{
  return 0LL;
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  return 0;
}

- (void).cxx_destruct
{
}

@end