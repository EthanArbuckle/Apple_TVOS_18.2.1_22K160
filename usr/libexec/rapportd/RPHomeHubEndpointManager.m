@interface RPHomeHubEndpointManager
- (HHSynchronizedEndpointList)hhEndpointList;
- (OS_dispatch_queue)hhEndpointListQueue;
- (OS_dispatch_queue)updateHandlerQueue;
- (RPHomeHubEndpointManager)initWithQueue:(id)a3;
- (id)_deviceForHHEndpoint:(id)a3;
- (id)deviceChangedHandler;
- (id)hhEnpointListUpdatedHandler;
- (id)homeHubDeviceList;
- (void)_invokeDeviceChangedHandlerForEndpoint:(id)a3;
- (void)_invokeUpdateHandler;
- (void)activateWithUpdateHandler:(id)a3;
- (void)invalidate;
- (void)setDeviceChangedHandler:(id)a3;
- (void)synchronizedEndpointList:(id)a3 didActivateEndpoint:(id)a4;
- (void)synchronizedEndpointList:(id)a3 didAddEndpoint:(id)a4;
- (void)synchronizedEndpointList:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)synchronizedEndpointList:(id)a3 didDeleteEndpoint:(id)a4;
@end

@implementation RPHomeHubEndpointManager

- (RPHomeHubEndpointManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPHomeHubEndpointManager;
  v6 = -[RPHomeHubEndpointManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_updateHandlerQueue, a3);
  }

  return v7;
}

- (void)activateWithUpdateHandler:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateHandlerQueue);
  if (dword_100131CE8 <= 40 && (dword_100131CE8 != -1 || _LogCategory_Initialize(&dword_100131CE8, 40LL))) {
    LogPrintF( &dword_100131CE8,  "-[RPHomeHubEndpointManager activateWithUpdateHandler:]",  40LL,  "RPHomeHubEndpointManager activated\n");
  }
  id v4 = objc_retainBlock(v11);
  id hhEnpointListUpdatedHandler = self->_hhEnpointListUpdatedHandler;
  self->_id hhEnpointListUpdatedHandler = v4;

  v6 = (OS_dispatch_queue *)dispatch_queue_create("HHEndpointListQueue", 0LL);
  hhEndpointListQueue = self->_hhEndpointListQueue;
  self->_hhEndpointListQueue = v6;

  id v8 = -[objc_class synchronizedEndpointListWithQueue:]( off_100131D58(),  "synchronizedEndpointListWithQueue:",  self->_hhEndpointListQueue);
  objc_super v9 = (HHSynchronizedEndpointList *)objc_claimAutoreleasedReturnValue(v8);
  hhEndpointList = self->_hhEndpointList;
  self->_hhEndpointList = v9;

  -[HHSynchronizedEndpointList setDelegate:](self->_hhEndpointList, "setDelegate:", self);
  -[HHSynchronizedEndpointList resume](self->_hhEndpointList, "resume");
}

- (void)invalidate
{
  id hhEnpointListUpdatedHandler = self->_hhEnpointListUpdatedHandler;
  self->_id hhEnpointListUpdatedHandler = 0LL;

  -[HHSynchronizedEndpointList setDelegate:](self->_hhEndpointList, "setDelegate:", 0LL);
  if (dword_100131CE8 <= 40 && (dword_100131CE8 != -1 || _LogCategory_Initialize(&dword_100131CE8, 40LL))) {
    LogPrintF( &dword_100131CE8,  "-[RPHomeHubEndpointManager invalidate]",  40LL,  "RPHomeHubEndpointManager invalidated\n");
  }
}

- (id)_deviceForHHEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoryId]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  -[RPCompanionLinkDevice setIdentifier:](v4, "setIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoryId]);
  -[RPCompanionLinkDevice setHomeKitIdentifier:](v4, "setHomeKitIdentifier:", v7);

  -[RPCompanionLinkDevice setFlags:]( v4,  "setFlags:",  -[RPCompanionLinkDevice flags](v4, "flags") | 0x2000);
  -[RPCompanionLinkDevice setStatusFlags:](v4, "setStatusFlags:", 805830656LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 launchInstanceId]);
  -[RPCompanionLinkDevice setLaunchInstanceID:](v4, "setLaunchInstanceID:", v8);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaRouteId]);
  -[RPCompanionLinkDevice setMediaRouteIdentifier:](v4, "setMediaRouteIdentifier:", v9);

  return v4;
}

- (id)homeHubDeviceList
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100050438;
  v21 = sub_100050448;
  id v22 = 0LL;
  hhEndpointListQueue = (dispatch_queue_s *)self->_hhEndpointListQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050450;
  block[3] = &unk_100112D38;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(hhEndpointListQueue, block);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (id)v18[5];
  id v5 = 0LL;
  id v6 = [v4 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "state", (void)v12) == (id)2)
        {
          if (!v5) {
            id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPHomeHubEndpointManager _deviceForHHEndpoint:](self, "_deviceForHHEndpoint:", v9));
          [v5 addObject:v10];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }

    while (v6);
  }

  _Block_object_dispose(&v17, 8);
  return v5;
}

- (void)_invokeUpdateHandler
{
  updateHandlerQueue = (dispatch_queue_s *)self->_updateHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000504E4;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(updateHandlerQueue, block);
}

- (void)_invokeDeviceChangedHandlerForEndpoint:(id)a3
{
  id v4 = a3;
  updateHandlerQueue = (dispatch_queue_s *)self->_updateHandlerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100050598;
  v7[3] = &unk_100111968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(updateHandlerQueue, v7);
}

- (void)synchronizedEndpointList:(id)a3 didActivateEndpoint:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (dword_100131CE8 <= 30 && (dword_100131CE8 != -1 || _LogCategory_Initialize(&dword_100131CE8, 30LL))) {
    LogPrintF( &dword_100131CE8,  "-[RPHomeHubEndpointManager synchronizedEndpointList:didActivateEndpoint:]",  30LL,  "DidActivateEndpoint: %@\n",  v6,  v7);
  }
  -[RPHomeHubEndpointManager _invokeDeviceChangedHandlerForEndpoint:]( self,  "_invokeDeviceChangedHandlerForEndpoint:",  v6);
  -[RPHomeHubEndpointManager _invokeUpdateHandler](self, "_invokeUpdateHandler");
}

- (void)synchronizedEndpointList:(id)a3 didAddEndpoint:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (dword_100131CE8 <= 30 && (dword_100131CE8 != -1 || _LogCategory_Initialize(&dword_100131CE8, 30LL))) {
    LogPrintF( &dword_100131CE8,  "-[RPHomeHubEndpointManager synchronizedEndpointList:didAddEndpoint:]",  30LL,  "DidAddEndpoint: %@\n",  v6,  v7);
  }
  -[RPHomeHubEndpointManager _invokeUpdateHandler](self, "_invokeUpdateHandler");
}

- (void)synchronizedEndpointList:(id)a3 didDeactivateEndpoint:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (dword_100131CE8 <= 30 && (dword_100131CE8 != -1 || _LogCategory_Initialize(&dword_100131CE8, 30LL))) {
    LogPrintF( &dword_100131CE8,  "-[RPHomeHubEndpointManager synchronizedEndpointList:didDeactivateEndpoint:]",  30LL,  "DidDeactivateEndpoint: %@\n",  v6,  v7);
  }
  -[RPHomeHubEndpointManager _invokeDeviceChangedHandlerForEndpoint:]( self,  "_invokeDeviceChangedHandlerForEndpoint:",  v6);
  -[RPHomeHubEndpointManager _invokeUpdateHandler](self, "_invokeUpdateHandler");
}

- (void)synchronizedEndpointList:(id)a3 didDeleteEndpoint:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (dword_100131CE8 <= 30 && (dword_100131CE8 != -1 || _LogCategory_Initialize(&dword_100131CE8, 30LL))) {
    LogPrintF( &dword_100131CE8,  "-[RPHomeHubEndpointManager synchronizedEndpointList:didDeleteEndpoint:]",  30LL,  "DidDeleteEndpoint: %@\n",  v6,  v7);
  }
  -[RPHomeHubEndpointManager _invokeUpdateHandler](self, "_invokeUpdateHandler");
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)hhEnpointListUpdatedHandler
{
  return self->_hhEnpointListUpdatedHandler;
}

- (OS_dispatch_queue)updateHandlerQueue
{
  return self->_updateHandlerQueue;
}

- (HHSynchronizedEndpointList)hhEndpointList
{
  return self->_hhEndpointList;
}

- (OS_dispatch_queue)hhEndpointListQueue
{
  return self->_hhEndpointListQueue;
}

- (void).cxx_destruct
{
}

@end