@interface CBWHBDiscoveryDaemon
- (CBDaemonServer)daemonServer;
- (CBWHBRouter)whbRouter;
- (NSArray)discoveryArray;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)remoteClient;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)localDeviceForStableId:(id)a3;
- (id)optimalHostIdForStableId:(id)a3 result:(int *)a4;
- (void)_receivedWHBUpdateEvent:(id)a3 options:(id)a4;
- (void)_reportLostDevicesForController:(id)a3;
- (void)activate;
- (void)deviceFound:(id)a3 remoteController:(id)a4;
- (void)deviceLost:(id)a3 remoteController:(id)a4;
- (void)diagnosticControl:(id)a3;
- (void)invalidate;
- (void)remoteControllersChanged;
- (void)setDaemonServer:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryArray:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setRemoteClient:(id)a3;
@end

@implementation CBWHBDiscoveryDaemon

- (id)description
{
  return -[CBWHBDiscoveryDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v33 = 0LL;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100032F54;
  v37 = sub_100032F64;
  id v38 = 0LL;
  v5 = (char *)-[NSMutableDictionary count](self->_aggregateDeviceMap, "count");
  v6 = v34;
  id v32 = v34[5];
  id v7 = [(id)objc_opt_class(self) description];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF_safe( &v32,  "== %@: Controllers %d, Devices %d ==",  v8,  -[NSMutableDictionary count](self->_remoteControllerMap, "count"),  v5);
  objc_storeStrong(v6 + 5, v32);

  v9 = v34 + 5;
  if (v3 > 0x14u)
  {
    id v21 = v34[5];
    NSAppendPrintF_safe(&v21, "\n== %@ ==", self->_whbRouter);
    objc_storeStrong(v9, v21);
  }

  else
  {
    id v31 = v34[5];
    NSAppendPrintF_safe(&v31, "\n");
    objc_storeStrong(v9, v31);
    remoteControllerMap = self->_remoteControllerMap;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100032F6C;
    v30[3] = &unk_10087FCD0;
    v30[4] = &v33;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( remoteControllerMap,  "enumerateKeysAndObjectsUsingBlock:",  v30);
    uint64_t v26 = 0LL;
    v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    uint64_t v29 = 0LL;
    aggregateDeviceMap = self->_aggregateDeviceMap;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100032FB8;
    v24[3] = &unk_10087FCF8;
    v24[4] = &v33;
    v24[5] = &v26;
    int v25 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( aggregateDeviceMap,  "enumerateKeysAndObjectsUsingBlock:",  v24);
    unint64_t v12 = v27[3];
    BOOL v13 = (unint64_t)v5 >= v12;
    v14 = &v5[-v12];
    if (v14 != 0LL && v13)
    {
      v15 = v34;
      id obj = v34[5];
      NSAppendPrintF_safe(&obj, "... %d more, %d total\n", (_DWORD)v14, (_DWORD)v5);
      objc_storeStrong(v15 + 5, obj);
    }

    v16 = v34;
    id v22 = v34[5];
    uint64_t v17 = CUDescriptionWithLevel(self->_whbRouter, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    NSAppendPrintF_safe(&v22, "\n%@", v18);
    objc_storeStrong(v16 + 5, v22);

    _Block_object_dispose(&v26, 8);
  }

  id v19 = v34[5];
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (void)activate
{
  self->_aggregateDiscoveryFlags = 0LL;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v3 = self->_discoveryArray;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        unint64_t v9 = (unint64_t)[v8 discoveryFlags];
        self->_aggregateDiscoveryFlags |= (unint64_t)[v8 extraDiscoveryFlags] | v9;
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    }

    while (v5);
  }

  if (dword_1008D63E0 <= 30 && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL)))
  {
    uint64_t v10 = CUPrintFlags64(self->_aggregateDiscoveryFlags, &unk_1006BAA00);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe(&dword_1008D63E0, "-[CBWHBDiscoveryDaemon activate]", 30LL, "Activate: ADF %@", v11);
  }

  unint64_t v12 = self->_whbRouter;
  if (!v12)
  {
    unint64_t v12 = objc_alloc_init(&OBJC_CLASS___CBWHBRouter);
    objc_storeStrong((id *)&self->_whbRouter, v12);
    -[CBWHBRouter activate](self->_whbRouter, "activate");
  }

  if (!self->_whbEventRegistered)
  {
    BOOL v13 = self->_remoteClient;
    if (!v13
      && dword_1008D63E0 <= 90
      && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 90LL)))
    {
      LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon activate]",  90LL,  "### No remote client to register event");
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000333E4;
    v27[3] = &unk_10087FD20;
    v27[4] = v13;
    v27[5] = self;
    -[RPCompanionLinkClient registerEventID:options:handler:]( v13,  "registerEventID:options:handler:",  @"com.apple.bluetooth.whbU",  0LL,  v27);
    self->_whbEventRegistered = 1;
  }

  v14 = self->_localDiscovery;
  if (!v14)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    objc_storeStrong((id *)&self->_localDiscovery, v15);
    -[CBDiscovery setDispatchQueue:](v15, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setDiscoveryFlags:](v15, "setDiscoveryFlags:", self->_aggregateDiscoveryFlags & 0xFFFFBFFFFFFFFFFFLL);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100033404;
    v24[3] = &unk_10087EF10;
    v16 = v15;
    int v25 = v16;
    uint64_t v26 = self;
    -[CBDiscovery setDeviceFoundHandler:](v16, "setDeviceFoundHandler:", v24);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100033490;
    v21[3] = &unk_10087EF10;
    uint64_t v17 = v16;
    id v22 = v17;
    v23 = self;
    -[CBDiscovery setDeviceLostHandler:](v17, "setDeviceLostHandler:", v21);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000334B0;
    v18[3] = &unk_10087EF38;
    v14 = v17;
    id v19 = v14;
    v20 = self;
    -[CBDiscovery activateWithCompletion:](v14, "activateWithCompletion:", v18);
  }

  -[CBWHBDiscoveryDaemon remoteControllersChanged](self, "remoteControllersChanged");
}

- (void)invalidate
{
  localDiscovery = self->_localDiscovery;
  self->_localDiscovery = 0LL;

  -[RPCompanionLinkClient deregisterEventID:]( self->_remoteClient,  "deregisterEventID:",  @"com.apple.bluetooth.whbU");
  self->_whbEventRegistered = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_remoteControllerMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10087FD60);
  -[CBWHBRouter invalidate](self->_whbRouter, "invalidate");
  whbRouter = self->_whbRouter;
  self->_whbRouter = 0LL;

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0LL;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0LL;

  remoteControllerMap = self->_remoteControllerMap;
  self->_remoteControllerMap = 0LL;
}

- (void)diagnosticControl:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( self->_remoteClient,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.bluetooth.whbU",  v5,  RPDestinationIdentifierSameHome,  0LL,  0LL);
}

- (void)_reportLostDevicesForController:(id)a3
{
  id v4 = a3;

  id v5 = [v4 activatedDiscovery];
  uint64_t v6 = (void *)[v5 discoveredDevices];

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CBWHBDiscoveryDaemon deviceLost:remoteController:]( self,  "deviceLost:remoteController:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  v4,  (void)v12);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)remoteControllersChanged
{
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_remoteClient, "activeDevices"));
  id v4 = 0LL;
  id v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v9 = [v8 serviceTypes];
        unsigned int v10 = [v9 containsObject:@"com.apple.bluetooth.remote"];

        if (v10)
        {
          v11 = [v8 idsDeviceIdentifier];
          if (v11)
          {
            if (!v4) {
              id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, v11);
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v5);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  __int128 v12 = (void *)-[NSMutableDictionary allKeys](self->_remoteControllerMap, "allKeys");
  int v13 = 0;
  id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
        v18 = [v4 objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v19 = -[self->_remoteControllerMap objectForKeyedSubscript:v17];
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteControllerMap,  "setObject:forKeyedSubscript:",  0LL,  v17);
          -[CBWHBRouter hostConnectionInterruptedOn:](self->_whbRouter, "hostConnectionInterruptedOn:", v17);
          -[CBWHBDiscoveryDaemon _reportLostDevicesForController:](self, "_reportLostDevicesForController:", v19);
          [v19 invalidate];

          ++v13;
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v14);
  }

  remoteControllerMap = self->_remoteControllerMap;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100033BEC;
  v27[3] = &unk_10087FD88;
  v27[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( remoteControllerMap,  "enumerateKeysAndObjectsUsingBlock:",  v27);
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  int v26 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100033C00;
  v22[3] = &unk_10087FDB0;
  v22[4] = self;
  v22[5] = &v23;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v22);
  if (dword_1008D63E0 <= 30 && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL)))
  {
    unsigned int v21 = -[NSMutableDictionary count](self->_remoteControllerMap, "count");
    LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon remoteControllersChanged]",  30LL,  "Remote controllers updated: %d total, %d started, %d stopped",  v21,  *((_DWORD *)v24 + 6),  v13);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)deviceFound:(id)a3 remoteController:(id)a4
{
  id v20 = a3;
  uint64_t v6 = [a4 controllerID];
  id v7 = (void *)v6;
  id v8 = @"CBLocalHostID";
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  id v9 = v8;

  if (dword_1008D63E0 <= 30 && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL))) {
    LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon deviceFound:remoteController:]",  30LL,  "Device found: %@, CtID %@",  v20,  v9);
  }
  unsigned int v10 = [v20 stableIdentifier];
  if (v10)
  {
    [v20 setLastSeenTicks:mach_absolute_time()];
    [v20 setRemoteHostID:v9];
    v11 = -[self->_aggregateDeviceMap objectForKeyedSubscript:v10];
    if (!v11)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___CBWHBAggregateDevice);
      aggregateDeviceMap = self->_aggregateDeviceMap;
      if (!aggregateDeviceMap)
      {
        int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v14 = self->_aggregateDeviceMap;
        self->_aggregateDeviceMap = v13;

        aggregateDeviceMap = self->_aggregateDeviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](aggregateDeviceMap, "setObject:forKeyedSubscript:", v11, v10);
    }

    uint64_t v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[CBWHBAggregateDevice deviceControllerMap](v11, "deviceControllerMap"));
    if (!v15)
    {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[CBWHBAggregateDevice setDeviceControllerMap:](v11, "setDeviceControllerMap:", v15);
    }

    -[CBWHBRouter deviceFound:](self->_whbRouter, "deviceFound:", v20);
    if ((self->_aggregateDiscoveryFlags & 0x200100000LL) != 0
      && ((unint64_t)[v20 discoveryFlags] & 0x1400000) != 0
      && ((unint64_t)[v20 changeFlags] & 0x1000000000000) != 0
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v9)),
          unsigned __int8 v17 = [v16 isEquivalentToCBDevice:v20 compareFlags:1],
          v16,
          (v17 & 1) == 0))
    {
      -[CBWHBAggregateDevice setLatestDevice:](v11, "setLatestDevice:", v20);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, v9);
      id v18 = objc_retainBlock(self->_deviceFoundHandler);
      id v19 = v18;
      if (v18) {
        (*((void (**)(id, id))v18 + 2))(v18, v20);
      }
    }
  }
}

- (void)deviceLost:(id)a3 remoteController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 controllerID];
  id v9 = (void *)v8;
  unsigned int v10 = @"CBLocalHostID";
  if (v8) {
    unsigned int v10 = (__CFString *)v8;
  }
  v11 = v10;

  if (dword_1008D63E0 <= 30 && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL))) {
    LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon deviceLost:remoteController:]",  30LL,  "Device lost: %@, CtID %@",  v6,  v11);
  }
  __int128 v12 = (void *)[v6 stableIdentifier];
  if (v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_aggregateDeviceMap,  "objectForKeyedSubscript:",  v12));
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = (void *)[v13 deviceControllerMap];
      v16 = [v15 objectForKeyedSubscript:v11];
      [v15 setObject:0 forKeyedSubscript:v11];
      [v16 setRemoteHostID:v11];
      -[CBWHBRouter deviceLost:](self->_whbRouter, "deviceLost:", v16);
      id v17 = objc_retainBlock(self->_deviceLostHandler);
      id v18 = v17;
      if (v17) {
        (*((void (**)(id, void *))v17 + 2))(v17, v16);
      }
      if ([v15 count])
      {
        uint64_t v21 = 0LL;
        id v22 = &v21;
        uint64_t v23 = 0x3032000000LL;
        v24 = sub_100032F54;
        uint64_t v25 = sub_100032F64;
        id v26 = 0LL;
        v20[0] = 0LL;
        v20[1] = v20;
        v20[2] = 0x2020000000LL;
        v20[3] = 0LL;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100034240;
        v19[3] = &unk_10087FDD8;
        v19[4] = &v21;
        v19[5] = v20;
        [v15 enumerateKeysAndObjectsUsingBlock:v19];
        if (!v22[5]
          && dword_1008D63E0 <= 115
          && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 115LL)))
        {
          LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon deviceLost:remoteController:]",  115LL,  "### No latest device: %@, CtID %@",  v6,  v11);
        }

        [v14 setLatestDevice:v22[5]];
        _Block_object_dispose(v20, 8);
        _Block_object_dispose(&v21, 8);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_aggregateDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v12);
      }
    }
  }
}

- (id)localDeviceForStableId:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v6 = [self->_aggregateDeviceMap objectForKeyedSubscript:v5];

  id v7 = [v6 deviceControllerMap];
  uint64_t v8 = (void *)[v7 objectForKeyedSubscript:@"CBLocalHostID"];

  return v8;
}

- (id)optimalHostIdForStableId:(id)a3 result:(int *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  whbRouter = self->_whbRouter;
  if (!a4 || whbRouter)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CBWHBRouter optimalWHBHostForStableIdentifier:result:]( whbRouter,  "optimalWHBHostForStableIdentifier:result:",  v6,  a4));
  }

  else
  {
    uint64_t v8 = 0LL;
    *a4 = 1702;
  }

  return v8;
}

- (void)_receivedWHBUpdateEvent:(id)a3 options:(id)a4
{
  id v14 = a3;
  uint64_t v6 = RPOptionSenderIDSDeviceID;
  id v7 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, v6, TypeID, 0LL);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v10)
  {
    v11 = self->_whbRouter;
    if (v11)
    {
      if (dword_1008D63E0 <= 30
        && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL)))
      {
        uint64_t v12 = CUPrintNSObjectOneLine(v14);
        int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon _receivedWHBUpdateEvent:options:]",  30LL,  "WHB update received: Sender %@, %@",  v10,  v13);
      }

      -[CBWHBRouter receivedUpdateEvent:hostID:](v11, "receivedUpdateEvent:hostID:", v14, v10);
    }

    else if (dword_1008D63E0 <= 30 {
           && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL)))
    }
    {
      LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon _receivedWHBUpdateEvent:options:]",  30LL,  "Ingoring WHB update with no router");
    }
  }

  else if (dword_1008D63E0 <= 90 {
         && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBDiscoveryDaemon _receivedWHBUpdateEvent:options:]",  90LL,  "### WHB update with no senderID");
  }
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (NSArray)discoveryArray
{
  return self->_discoveryArray;
}

- (void)setDiscoveryArray:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPCompanionLinkClient)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
}

- (CBWHBRouter)whbRouter
{
  return self->_whbRouter;
}

- (void).cxx_destruct
{
}

@end