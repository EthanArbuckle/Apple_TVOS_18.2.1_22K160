@interface W5BluetoothController
- (BOOL)isAvailable;
- (BOOL)isConnectable;
- (BOOL)isDiscoverable;
- (BOOL)isScanning;
- (BOOL)powerOn;
- (W5BluetoothController)init;
- (id)__ios__deviceList;
- (id)address;
- (id)devices;
- (id)updatedBluetoothCallback;
- (void)__ios__handleBTAdvertisingNotification:(id)a3;
- (void)__ios__handleBTAvailabilityNotification:(id)a3;
- (void)__ios__handleBTConnectabiliyNotification:(id)a3;
- (void)__ios__handleBTDiscoveryNotification:(id)a3;
- (void)__ios__handleBTPowerNotification:(id)a3;
- (void)dealloc;
- (void)setUpdatedBluetoothCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5BluetoothController

- (W5BluetoothController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___W5BluetoothController;
  v2 = -[W5BluetoothController init](&v7, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.bt", 0LL), (v2->_queue = (OS_dispatch_queue *)v3) != 0LL)
    && (dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0LL),
        v4 = objc_alloc_init(&OBJC_CLASS___CBCentralManager),
        (v2->_centralManager = v4) != 0LL))
  {
    +[BluetoothManager setSharedInstanceQueue:](&OBJC_CLASS___BluetoothManager, "setSharedInstanceQueue:", v2->_queue);
    -[BluetoothManager maskLocalDeviceEvents:]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "maskLocalDeviceEvents:",  0xFFFFFFFFLL);
    int v5 = 10;
    do
    {
      if ((-[BluetoothManager available]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "available") & 1) != 0) {
        break;
      }
      usleep(0x30D40u);
      --v5;
    }

    while (v5);
  }

  else
  {

    return 0LL;
  }

  return v2;
}

- (void)setUpdatedBluetoothCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004ED50;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)dealloc
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___W5BluetoothController;
  -[W5BluetoothController dealloc](&v4, "dealloc");
}

- (void)startEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004EE48;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004EFC0;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)powerOn
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F0B4;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)address
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_10004F1C0;
  v10 = sub_10004F1D0;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F1DC;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDiscoverable
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F2B0;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConnectable
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F380;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAvailable
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F450;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isScanning
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F520;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)__ios__handleBTAvailabilityNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F5BC;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTPowerNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F68C;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTConnectabiliyNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F75C;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTDiscoveryNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F82C;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTAdvertisingNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F8FC;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)__ios__deviceList
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v5 = objc_msgSend( -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent"),  "retrievePairedPeers");
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        if ([v10 name])
        {
          uint64_t v11 = objc_alloc_init(&OBJC_CLASS___W5BluetoothDeviceInternal);
          -[W5BluetoothDeviceInternal setPeripheral:centralManager:]( v11,  "setPeripheral:centralManager:",  v10,  self->_centralManager);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, objc_msgSend(v10, "name"));
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }

    while (v7);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v12 = -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:]( self->_centralManager,  "retrieveConnectedPeripheralsWithServices:allowAll:",  0LL,  1LL);
  id v13 = [v12 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
        if ([v17 name])
        {
          v18 = objc_alloc_init(&OBJC_CLASS___W5BluetoothDeviceInternal);
          -[W5BluetoothDeviceInternal setPeripheral:centralManager:]( v18,  "setPeripheral:centralManager:",  v17,  self->_centralManager);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, objc_msgSend(v17, "name"));
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }

    while (v14);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v19 = -[BluetoothManager pairedDevices]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "pairedDevices");
  id v20 = [v19 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (k = 0LL; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)k);
        if ([v24 name])
        {
          v25 = (W5BluetoothDeviceInternal *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(v24, "name"));
          if (!v25) {
            v25 = objc_alloc_init(&OBJC_CLASS___W5BluetoothDeviceInternal);
          }
          -[W5BluetoothDeviceInternal setBluetoothDevice:](v25, "setBluetoothDevice:", v24);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, objc_msgSend(v24, "name"));
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }

    while (v21);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v26 = -[BluetoothManager connectedDevices]( +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"),  "connectedDevices");
  id v27 = [v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (m = 0LL; m != v28; m = (char *)m + 1)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)m);
        if ([v31 name])
        {
          v32 = (W5BluetoothDeviceInternal *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(v31, "name"));
          if (!v32) {
            v32 = objc_alloc_init(&OBJC_CLASS___W5BluetoothDeviceInternal);
          }
          -[W5BluetoothDeviceInternal setBluetoothDevice:](v32, "setBluetoothDevice:", v31);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, objc_msgSend(v31, "name"));
        }
      }

      id v28 = [v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }

    while (v28);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v33 = objc_msgSend(v4, "allValues", 0);
  id v34 = [v33 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v40;
    do
    {
      for (n = 0LL; n != v35; n = (char *)n + 1)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v33);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)n), "device"));
      }

      id v35 = [v33 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }

    while (v35);
  }

  return [v3 copy];
}

- (id)devices
{
  return objc_msgSend(-[W5BluetoothController __ios__deviceList](self, "__ios__deviceList"), "copy");
}

- (id)updatedBluetoothCallback
{
  return self->_updatedBluetoothCallback;
}

@end