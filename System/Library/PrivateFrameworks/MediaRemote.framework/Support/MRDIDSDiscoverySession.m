@interface MRDIDSDiscoverySession
- (BOOL)reloadScheduled;
- (IDSService)idsService;
- (MRDIDSDiscoverySession)init;
- (NSString)debugDescription;
- (OS_dispatch_queue)workerQueue;
- (id)availableOutputDevices;
- (unsigned)discoveryMode;
- (void)_onWorkerQueue_reload;
- (void)_onWorkerQueue_scheduleReload;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setIdsService:(id)a3;
- (void)setReloadScheduled:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation MRDIDSDiscoverySession

- (MRDIDSDiscoverySession)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySessionConfiguration,  "configurationWithEndpointFeatures:",  16LL));
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDIDSDiscoverySession;
  v4 = -[MRDIDSDiscoverySession initWithConfiguration:](&v12, "initWithConfiguration:", v3);
  if (v4)
  {
    v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.mediaremote.%@", objc_opt_class(v4));
    v6 = -[NSString UTF8String](v5, "UTF8String");
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create(v6, v8);
    workerQueue = v4->_workerQueue;
    v4->_workerQueue = (OS_dispatch_queue *)v9;
  }

  return v4;
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@ %p {\n",  objc_opt_class(v2),  v2);
  v5 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v2->_discoveryMode, v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  discoveryMode = %@\n", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v2->_idsService, "devices"));
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromArray(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  idsService = %@\n", v8);

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSDiscoverySession availableOutputDevices](v2, "availableOutputDevices"));
  uint64_t v10 = MRCreateIndentedDebugDescriptionFromArray(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  outputDevices = %@\n", v11);

  -[NSMutableString appendString:](v3, "appendString:", @"}>");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  idsService = v4->_idsService;
  if (a3)
  {
    if (!idsService)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[IDSService mr_sharedIDSService](&OBJC_CLASS___IDSService, "mr_sharedIDSService"));
      uint64_t v7 = v4->_idsService;
      v4->_idsService = (IDSService *)v6;

      -[IDSService addDelegate:queue:](v4->_idsService, "addDelegate:queue:", v4, v4->_workerQueue);
    }
  }

  else
  {
    -[IDSService removeDelegate:](idsService, "removeDelegate:", v4);
    v8 = v4->_idsService;
    v4->_idsService = 0LL;
  }

  v4->_discoveryMode = a3;
  workerQueue = (dispatch_queue_s *)v4->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045228;
  block[3] = &unk_100399250;
  block[4] = v4;
  dispatch_async(workerQueue, block);
  objc_sync_exit(v4);
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (id)availableOutputDevices
{
  return -[MRDIDSDiscoverySession outputDevicesSnapshot](self, "outputDevicesSnapshot");
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)_onWorkerQueue_reload
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_map:", &stru_10039B500));

  -[MRDIDSDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", v4);
}

- (void)_onWorkerQueue_scheduleReload
{
  if (!self->_reloadScheduled)
  {
    self->_reloadScheduled = 1;
    dispatch_time_t v3 = dispatch_time(0LL, 500000000LL);
    workerQueue = (dispatch_queue_s *)self->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100045390;
    block[3] = &unk_100399250;
    block[4] = self;
    dispatch_after(v3, workerQueue, block);
  }

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (BOOL)reloadScheduled
{
  return self->_reloadScheduled;
}

- (void)setReloadScheduled:(BOOL)a3
{
  self->_reloadScheduled = a3;
}

- (void).cxx_destruct
{
}

@end