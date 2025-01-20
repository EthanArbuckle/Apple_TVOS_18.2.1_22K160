@interface ADMobileBluetoothDeviceDataSource
- (ADMobileBluetoothDeviceDataSource)init;
- (id)_connectedDeviceProxies;
- (id)_deviceProxies;
- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_fetchConnectedDeviceAddresses;
- (id)_fetchPairedDeviceAddresses;
- (id)_pairedDeviceProxies;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithUID:(id)a3;
- (id)wirelessSplitterSession;
- (void)_attachToSession;
- (void)_cleanUpDeviceProxies;
- (void)_cleanUpWirelessSplitterProxy;
- (void)_detachFromSession;
- (void)_handleInEarStatusChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4;
- (void)_handleListeningModeChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4;
- (void)_reloadForDevice:(BTDeviceImpl *)a3;
- (void)_resetConnectedDeviceAddresses;
- (void)_resetPairedDeviceAddresses;
- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4;
- (void)_sessionDetached:(BTSessionImpl *)a3;
- (void)_sessionTerminated:(BTSessionImpl *)a3;
- (void)_setUpAccessoryManager;
- (void)_setUpLocalDevice;
- (void)_tearDownAccessoryManager;
- (void)_tearDownLocalDevice;
- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6;
- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7;
- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4;
- (void)getBTLocalDeviceWithCompletion:(id)a3;
- (void)getConnectedDevicesWithCompletion:(id)a3;
- (void)getPairedDevicesWithCompletion:(id)a3;
- (void)invalidate;
- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5;
@end

@implementation ADMobileBluetoothDeviceDataSource

- (ADMobileBluetoothDeviceDataSource)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceDataSource;
  id v2 = -[ADMobileBluetoothDeviceDataSource init](&v24, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ADMobileBluetoothDeviceDataSource", v6);
    v8 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v7;

    dispatch_group_t v9 = dispatch_group_create();
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    *((_DWORD *)v2 + 14) = 0;
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v14 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v13;

    *((_DWORD *)v2 + 20) = 0;
    dispatch_group_enter(*((dispatch_group_t *)v2 + 6));
    v15 = (dispatch_queue_s *)*((void *)v2 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E4B90;
    block[3] = &unk_1004FD940;
    id v23 = v2;
    dispatch_async(v15, block);
    id v16 = *((id *)v2 + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000E4BBC;
    v20[3] = &unk_1004FBBD0;
    id v21 = v16;
    id v18 = v16;
    [v17 addQueue:v18 heartBeatInterval:v20 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return (ADMobileBluetoothDeviceDataSource *)v2;
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4B60;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cleanUpDeviceProxies
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ADMobileBluetoothDeviceDataSource _cleanUpDeviceProxies]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_deviceProxiesLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceProxiesByAddress, "allValues"));
  -[NSMutableDictionary removeAllObjects](self->_deviceProxiesByAddress, "removeAllObjects");
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceProxiesByDeviceUID, "allValues"));
  -[NSMutableDictionary removeAllObjects](self->_deviceProxiesByDeviceUID, "removeAllObjects");
  os_unfair_lock_unlock(&self->_deviceProxiesLock);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) invalidate];
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v8);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v15), "invalidate", (void)v16);
        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v13);
  }
}

- (void)_cleanUpWirelessSplitterProxy
{
  if (AFSupportsWirelessSplitter(self, a2))
  {
    dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[ADMobileBluetoothDeviceDataSource _cleanUpWirelessSplitterProxy]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
    }

    p_wirelessSplitterSessionProxyLock = &self->_wirelessSplitterSessionProxyLock;
    os_unfair_lock_lock(&self->_wirelessSplitterSessionProxyLock);
    wirelessSplitterSessionProxy = self->_wirelessSplitterSessionProxy;
    self->_wirelessSplitterSessionProxy = 0LL;
    id v6 = wirelessSplitterSessionProxy;

    os_unfair_lock_unlock(p_wirelessSplitterSessionProxyLock);
    -[ADMobileBluetoothWirelessSplitterSessionProxy invalidate](v6, "invalidate");
  }

- (void)_detachFromSession
{
  session = self->_session;
  p_session = &self->_session;
  dispatch_queue_attr_t v3 = session;
  if (session)
  {
    BTServiceRemoveCallbacks(v3, sub_1000E4ABC);
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = *p_session;
      int v8 = 136315394;
      uint64_t v9 = "-[ADMobileBluetoothDeviceDataSource _detachFromSession]";
      __int16 v10 = 2048;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Detaching from session %p",  (uint8_t *)&v8,  0x16u);
    }

    BTSessionDetachWithQueue(p_session);
    *p_session = 0LL;
  }

- (void)_attachToSession
{
  if (self->_attachingToSession)
  {
    id v2 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v10 = 136315138;
    id v11 = "-[ADMobileBluetoothDeviceDataSource _attachToSession]";
    dispatch_queue_attr_t v3 = "%s Already attaching to session!";
    v4 = v2;
    uint32_t v5 = 12;
LABEL_7:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v10, v5);
    return;
  }

  -[ADMobileBluetoothDeviceDataSource _detachFromSession](self, "_detachFromSession");
  int v7 = BTSessionAttachWithQueue("ADMobileBluetoothDeviceDataSource", &off_1004F06B0, self, self->_queue);
  int v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (v7)
  {
    int v9 = v7;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v10 = 136315394;
    id v11 = "-[ADMobileBluetoothDeviceDataSource _attachToSession]";
    __int16 v12 = 1024;
    int v13 = v9;
    dispatch_queue_attr_t v3 = "%s Failed attaching to bt session %d";
    v4 = v8;
    uint32_t v5 = 18;
    goto LABEL_7;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADMobileBluetoothDeviceDataSource _attachToSession]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Attaching to session", (uint8_t *)&v10, 0xCu);
  }

  self->_attachingToSession = 1;
  dispatch_group_enter((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v21 = "-[ADMobileBluetoothDeviceDataSource _sessionAttached:result:]";
    __int16 v22 = 2048;
    __int128 v23 = a3;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s session = %p, result = %d", buf, 0x1Cu);
  }

  self->_attachingToSession = 0;
  if (!a4)
  {
    -[ADMobileBluetoothDeviceDataSource _detachFromSession](self, "_detachFromSession");
    self->_session = a3;
    if (a3) {
      BTServiceAddCallbacks(a3, sub_1000E4ABC, self);
    }
    -[ADMobileBluetoothDeviceDataSource _setUpLocalDevice](self, "_setUpLocalDevice");
    -[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager](self, "_setUpAccessoryManager");
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADMobileBluetoothDeviceDataSource _deviceProxies](self, "_deviceProxies", 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        __int16 v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) reload];
          __int16 v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }
  }

  dispatch_group_leave((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_sessionDetached:(BTSessionImpl *)a3
{
  uint32_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[ADMobileBluetoothDeviceDataSource _sessionDetached:]";
    __int16 v9 = 2048;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v7, 0x16u);
  }

  if (self->_session == a3)
  {
    -[ADMobileBluetoothDeviceDataSource _cleanUpWirelessSplitterProxy](self, "_cleanUpWirelessSplitterProxy");
    -[ADMobileBluetoothDeviceDataSource _cleanUpDeviceProxies](self, "_cleanUpDeviceProxies");
    -[ADMobileBluetoothDeviceDataSource _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
    -[ADMobileBluetoothDeviceDataSource _tearDownLocalDevice](self, "_tearDownLocalDevice");
    session = self->_session;
    if (session)
    {
      BTServiceRemoveCallbacks(session, sub_1000E4ABC);
      self->_session = 0LL;
    }
  }

- (void)_sessionTerminated:(BTSessionImpl *)a3
{
  uint32_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[ADMobileBluetoothDeviceDataSource _sessionTerminated:]";
    __int16 v9 = 2048;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v7, 0x16u);
  }

  if (self->_session == a3)
  {
    -[ADMobileBluetoothDeviceDataSource _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
    -[ADMobileBluetoothDeviceDataSource _tearDownLocalDevice](self, "_tearDownLocalDevice");
    session = self->_session;
    if (session)
    {
      BTServiceRemoveCallbacks(session, sub_1000E4ABC);
      self->_session = 0LL;
    }

    -[ADMobileBluetoothDeviceDataSource _attachToSession](self, "_attachToSession");
  }

- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E4AA4;
  v8[3] = &unk_1004F06C0;
  int v9 = a5;
  v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)_setUpLocalDevice
{
  session = self->_session;
  if (!session)
  {
    uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v17 = 136315138;
    __int128 v18 = "-[ADMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    int v8 = "%s Session is NULL.";
    int v9 = v11;
    uint32_t v10 = 12;
    goto LABEL_10;
  }

  int Default = BTLocalDeviceGetDefault(session, &self->_localDevice);
  if (Default)
  {
    int v5 = Default;
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v7 = self->_session;
    int v17 = 136315650;
    __int128 v18 = "-[ADMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    __int16 v19 = 2048;
    __int128 v20 = v7;
    __int16 v21 = 1024;
    LODWORD(v22) = v5;
    int v8 = "%s Failed getting default local device from session %p (result = %d).";
    int v9 = v6;
    uint32_t v10 = 28;
    goto LABEL_10;
  }

  int v12 = BTLocalDeviceAddCallbacks(self->_localDevice, &off_1004F06E0, self);
  if (v12)
  {
    int v13 = v12;
    uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      __int128 v16 = self->_session;
      localDevice = self->_localDevice;
      int v17 = 136315906;
      __int128 v18 = "-[ADMobileBluetoothDeviceDataSource _setUpLocalDevice]";
      __int16 v19 = 2048;
      __int128 v20 = localDevice;
      __int16 v21 = 2048;
      __int16 v22 = v16;
      __int16 v23 = 1024;
      int v24 = v13;
      int v8 = "%s Failed adding callbacks to local device %p from session %p (result = %d).";
      int v9 = v14;
      uint32_t v10 = 38;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v17, v10);
    }
  }

- (void)_tearDownLocalDevice
{
  localDevice = self->_localDevice;
  if (localDevice)
  {
    BTLocalDeviceRemoveCallbacks(localDevice, &off_1004F06E0);
    self->_localDevice = 0LL;
  }

- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5
{
  int v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "-[ADMobileBluetoothDeviceDataSource localDevice:event:result:]";
    __int16 v15 = 2048;
    __int128 v16 = a3;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 1024;
    int v20 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s localDevice = %p, event = %d, result = %d",  buf,  0x22u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4A20;
  block[3] = &unk_1004FC480;
  void block[4] = self;
  void block[5] = a3;
  int v12 = a4;
  dispatch_async(queue, block);
}

- (void)_setUpAccessoryManager
{
  session = self->_session;
  if (!session)
  {
    uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v17 = 136315138;
    int v18 = "-[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    int v8 = "%s Session is NULL.";
    int v9 = v11;
    uint32_t v10 = 12;
    goto LABEL_10;
  }

  int Default = BTAccessoryManagerGetDefault(session, &self->_accessoryManager);
  if (Default)
  {
    int v5 = Default;
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v7 = self->_session;
    int v17 = 136315650;
    int v18 = "-[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    __int16 v19 = 2048;
    int v20 = v7;
    __int16 v21 = 1024;
    LODWORD(v22) = v5;
    int v8 = "%s Failed getting default accessory manager from session %p (result = %d).";
    int v9 = v6;
    uint32_t v10 = 28;
    goto LABEL_10;
  }

  int v12 = BTAccessoryManagerAddCallbacks(self->_accessoryManager, &off_1004F06F8, self);
  if (v12)
  {
    int v13 = v12;
    uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      accessoryManager = self->_accessoryManager;
      __int128 v16 = self->_session;
      int v17 = 136315906;
      int v18 = "-[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
      __int16 v19 = 2048;
      int v20 = accessoryManager;
      __int16 v21 = 2048;
      __int16 v22 = v16;
      __int16 v23 = 1024;
      int v24 = v13;
      int v8 = "%s Failed adding callbacks to accessory manager %p from session %p (result = %d).";
      int v9 = v14;
      uint32_t v10 = 38;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v17, v10);
    }
  }

- (void)_tearDownAccessoryManager
{
  accessoryManager = self->_accessoryManager;
  if (accessoryManager)
  {
    BTAccessoryManagerRemoveCallbacks(accessoryManager, &off_1004F06F8);
    self->_accessoryManager = 0LL;
  }

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    __int128 v16 = "-[ADMobileBluetoothDeviceDataSource accessoryManager:event:device:state:]";
    __int16 v17 = 2048;
    int v18 = a3;
    __int16 v19 = 1024;
    int v20 = a4;
    __int16 v21 = 2048;
    __int16 v22 = a5;
    __int16 v23 = 1024;
    int v24 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s accessoryManager = %p, accessoryEvent = %d, device = %p, state = %d",  buf,  0x2Cu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E4960;
  v13[3] = &unk_1004F0720;
  v13[4] = self;
  v13[5] = a3;
  int v14 = a4;
  v13[6] = a5;
  dispatch_async(queue, v13);
}

- (void)_reloadForDevice:(BTDeviceImpl *)a3
{
  v4 = sub_1000DBE74((NSString *)a3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADMobileBluetoothDeviceDataSource _deviceProxies](self, "_deviceProxies"));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint32_t v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v10);
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472LL;
          v12[2] = sub_1000E4904;
          v12[3] = &unk_1004F0748;
          id v13 = v5;
          int v14 = v11;
          [v11 getDeviceInfo:v12];

          uint32_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }
  }
}

- (void)_handleInEarStatusChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4
{
  if (a3 && a4)
  {
    id v7 = sub_1000DBE74((NSString *)a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = sub_1000DEFC4((uint64_t)a3, (uint64_t)a4);
    uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[ADMobileBluetoothDeviceDataSource _handleInEarStatusChangedForBTDevice:fromAccessoryManager:]";
      __int16 v29 = 2112;
      v30 = v8;
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s address = %@, headphoneInEarDetectionState = %@",  buf,  0x20u);
    }

    if (v8)
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADMobileBluetoothDeviceDataSource _deviceProxies](self, "_deviceProxies"));
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          __int128 v16 = 0LL;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            __int128 v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v16);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472LL;
            v18[2] = sub_1000E48A8;
            v18[3] = &unk_1004FC968;
            id v19 = v8;
            int v20 = v17;
            id v21 = v10;
            [v17 getDeviceInfo:v18];

            __int128 v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }

        while (v14);
      }
    }
  }

- (void)_handleListeningModeChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4
{
  if (a3 && a4)
  {
    id v7 = sub_1000DBE74((NSString *)a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = sub_1000DECF4((uint64_t)a3, (uint64_t)a4);
    uint32_t v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[ADMobileBluetoothDeviceDataSource _handleListeningModeChangedForBTDevice:fromAccessoryManager:]";
      __int16 v28 = 2112;
      __int16 v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s address = %@, headphoneListeningMode = %ld",  buf,  0x20u);
    }

    if (v8)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADMobileBluetoothDeviceDataSource _deviceProxies](self, "_deviceProxies"));
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0LL;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            __int128 v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v15);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472LL;
            v17[2] = sub_1000E484C;
            v17[3] = &unk_1004F0770;
            id v18 = v8;
            id v19 = v16;
            uint64_t v20 = v9;
            [v16 getDeviceInfo:v17];

            uint64_t v15 = (char *)v15 + 1;
          }

          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v13);
      }
    }
  }

- (id)_deviceProxies
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceProxiesByAddress, "allValues"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceProxiesByDeviceUID, "allValues"));
  os_unfair_lock_unlock(p_deviceProxiesLock);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v4 count]) {
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v4);
  }
  if ([v5 count]) {
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v5);
  }

  return v6;
}

- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4604;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify((dispatch_group_t)sessionSetupGroup, queue, block);
}

- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4414;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify((dispatch_group_t)sessionSetupGroup, queue, block);
}

- (void)getBTLocalDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E432C;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)sessionSetupGroup, queue, v8);
}

- (id)deviceWithAddress:(id)a3
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADMobileBluetoothDeviceDataSource _deviceProxyWithAddress:createsIfAbsent:]( self,  "_deviceProxyWithAddress:createsIfAbsent:",  v5,  1LL));

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (id)deviceWithUID:(id)a3
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADMobileBluetoothDeviceDataSource _deviceProxyWithUID:createsIfAbsent:]( self,  "_deviceProxyWithUID:createsIfAbsent:",  v5,  1LL));

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (void)getConnectedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E4148;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getPairedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E3F64;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)wirelessSplitterSession
{
  if (AFSupportsWirelessSplitter(self, a2))
  {
    p_wirelessSplitterSessionProxyLock = &self->_wirelessSplitterSessionProxyLock;
    os_unfair_lock_lock(&self->_wirelessSplitterSessionProxyLock);
    wirelessSplitterSessionProxy = self->_wirelessSplitterSessionProxy;
    if (!wirelessSplitterSessionProxy)
    {
      id v5 = -[ADMobileBluetoothWirelessSplitterSessionProxy initWithDataSource:queue:]( objc_alloc(&OBJC_CLASS___ADMobileBluetoothWirelessSplitterSessionProxy),  "initWithDataSource:queue:",  self,  self->_queue);
      id v6 = self->_wirelessSplitterSessionProxy;
      self->_wirelessSplitterSessionProxy = v5;

      wirelessSplitterSessionProxy = self->_wirelessSplitterSessionProxy;
    }

    id v7 = wirelessSplitterSessionProxy;
    os_unfair_lock_unlock(p_wirelessSplitterSessionProxyLock);
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "-[ADMobileBluetoothDeviceDataSource wirelessSplitterSession]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Wireless Splitter is not supported on this platform.",  (uint8_t *)&v10,  0xCu);
    }

    id v7 = 0LL;
  }

  return v7;
}

- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (ADMobileBluetoothDeviceProxy *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceProxiesByAddress,  "objectForKey:",  v6));
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    if ([v6 length])
    {
      id v7 = -[ADMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]( objc_alloc(&OBJC_CLASS___ADMobileBluetoothDeviceProxy),  "initWithAddress:dataSource:queue:",  v6,  self,  self->_queue);
      -[NSMutableDictionary setObject:forKey:](self->_deviceProxiesByAddress, "setObject:forKey:", v7, v6);
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (ADMobileBluetoothDeviceProxy *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceProxiesByDeviceUID,  "objectForKey:",  v6));
  if (!v7 && v6 && v4)
  {
    id v7 = -[ADMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]( objc_alloc(&OBJC_CLASS___ADMobileBluetoothDeviceProxy),  "initWithDeviceUID:dataSource:queue:",  v6,  self,  self->_queue);
    -[NSMutableDictionary setObject:forKey:](self->_deviceProxiesByDeviceUID, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (void)_resetConnectedDeviceAddresses
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADMobileBluetoothDeviceDataSource _resetConnectedDeviceAddresses]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  connectedDeviceAddresses = self->_connectedDeviceAddresses;
  self->_connectedDeviceAddresses = 0LL;
}

- (id)_fetchConnectedDeviceAddresses
{
  localDevice = self->_localDevice;
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (!localDevice)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 136315138;
      *(void *)((char *)buf + 4) = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
      id v9 = "%s Local device is NULL.";
      int v10 = (uint8_t *)buf;
      id v11 = v3;
      uint32_t v12 = 12;
      goto LABEL_27;
    }

    return 0LL;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 136315394;
    *(void *)((char *)buf + 4) = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
    WORD2(buf[1]) = 2048;
    *(void *)((char *)&buf[1] + 6) = localDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Getting connected devices from local device %p...",  (uint8_t *)buf,  0x16u);
    localDevice = self->_localDevice;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(buf, 0, sizeof(buf));
  unint64_t v25 = 0LL;
  int ConnectedDevices = BTLocalDeviceGetConnectedDevices(localDevice, buf, &v25, 64LL);
  if (ConnectedDevices)
  {
    int v6 = ConnectedDevices;
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = self->_localDevice;
      *(_DWORD *)v26 = 136315650;
      v27 = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
      __int16 v28 = 2048;
      __int16 v29 = v8;
      __int16 v30 = 1024;
      LODWORD(v31) = v6;
      id v9 = "%s Failed getting connected devices from local device %p (result = %d).";
      int v10 = v26;
      id v11 = v7;
      uint32_t v12 = 28;
LABEL_27:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, v10, v12);
      return 0LL;
    }

    return 0LL;
  }

  if (v25)
  {
    id v14 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    uint64_t v15 = -[NSMutableArray initWithCapacity:](v14, "initWithCapacity:", v25);
    if (v25)
    {
      for (unint64_t i = 0LL; i < v25; ++i)
      {
        __int128 v17 = sub_1000DBE74((NSString *)buf[i]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v18) {
          -[NSMutableArray addObject:](v15, "addObject:", v18);
        }
      }
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  if (-[NSMutableArray count](v15, "count")) {
    id v19 = -[NSMutableArray copy](v15, "copy");
  }
  else {
    id v19 = &__NSArray0__struct;
  }
  uint64_t v20 = (void *)AFSiriLogContextDaemon;
  BOOL v21 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v21)
  {
    __int128 v22 = v20;
    __int128 v23 = (BTLocalDeviceImpl *)[v19 count];
    __int128 v24 = self->_localDevice;
    *(_DWORD *)v26 = 136315650;
    v27 = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
    __int16 v28 = 2048;
    __int16 v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Got %tu connected devices from local device %p.",  v26,  0x20u);
  }

  return v19;
}

- (id)_connectedDeviceProxies
{
  if (!self->_connectedDeviceAddresses)
  {
    dispatch_queue_attr_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue( -[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]( self,  "_fetchConnectedDeviceAddresses"));
    connectedDeviceAddresses = self->_connectedDeviceAddresses;
    self->_connectedDeviceAddresses = v3;

    if (!self->_connectedDeviceAddresses) {
      return 0LL;
    }
  }

  int v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_connectedDeviceAddresses, "count"));
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v6 = self->_connectedDeviceAddresses;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      int v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADMobileBluetoothDeviceDataSource _deviceProxyWithAddress:createsIfAbsent:]( self,  "_deviceProxyWithAddress:createsIfAbsent:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  1LL,  (void)v13));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  os_unfair_lock_unlock(&self->_deviceProxiesLock);
  return v5;
}

- (void)_resetPairedDeviceAddresses
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADMobileBluetoothDeviceDataSource _resetPairedDeviceAddresses]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  pairedDeviceAddresses = self->_pairedDeviceAddresses;
  self->_pairedDeviceAddresses = 0LL;

  notify_post(AFBluetoothPairedDeviceInfoUpdated);
}

- (id)_fetchPairedDeviceAddresses
{
  localDevice = self->_localDevice;
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (!localDevice)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 136315138;
      *(void *)((char *)buf + 4) = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
      uint64_t v9 = "%s Local device is NULL.";
      int v10 = (uint8_t *)buf;
      id v11 = v3;
      uint32_t v12 = 12;
      goto LABEL_27;
    }

    return 0LL;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 136315394;
    *(void *)((char *)buf + 4) = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
    WORD2(buf[1]) = 2048;
    *(void *)((char *)&buf[1] + 6) = localDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Getting paired devices from local device %p...",  (uint8_t *)buf,  0x16u);
    localDevice = self->_localDevice;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(buf, 0, sizeof(buf));
  unint64_t v25 = 0LL;
  int PairedDevices = BTLocalDeviceGetPairedDevices(localDevice, buf, &v25, 64LL);
  if (PairedDevices)
  {
    int v6 = PairedDevices;
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v8 = self->_localDevice;
      *(_DWORD *)v26 = 136315650;
      v27 = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
      __int16 v28 = 2048;
      __int16 v29 = v8;
      __int16 v30 = 1024;
      LODWORD(v31) = v6;
      uint64_t v9 = "%s Failed getting paired devices from local device %p (result = %d).";
      int v10 = v26;
      id v11 = v7;
      uint32_t v12 = 28;
LABEL_27:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, v10, v12);
      return 0LL;
    }

    return 0LL;
  }

  if (v25)
  {
    __int128 v14 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = -[NSMutableArray initWithCapacity:](v14, "initWithCapacity:", v25);
    if (v25)
    {
      for (unint64_t i = 0LL; i < v25; ++i)
      {
        __int128 v17 = sub_1000DBE74((NSString *)buf[i]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v18) {
          -[NSMutableArray addObject:](v15, "addObject:", v18);
        }
      }
    }
  }

  else
  {
    __int128 v15 = 0LL;
  }

  if (-[NSMutableArray count](v15, "count")) {
    id v19 = -[NSMutableArray copy](v15, "copy");
  }
  else {
    id v19 = &__NSArray0__struct;
  }
  uint64_t v20 = (void *)AFSiriLogContextDaemon;
  BOOL v21 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v21)
  {
    __int128 v22 = v20;
    __int128 v23 = (BTLocalDeviceImpl *)[v19 count];
    __int128 v24 = self->_localDevice;
    *(_DWORD *)v26 = 136315650;
    v27 = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
    __int16 v28 = 2048;
    __int16 v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Got %tu paired devices from local device %p.",  v26,  0x20u);
  }

  return v19;
}

- (id)_pairedDeviceProxies
{
  if (!self->_pairedDeviceAddresses)
  {
    dispatch_queue_attr_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue( -[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]( self,  "_fetchPairedDeviceAddresses"));
    pairedDeviceAddresses = self->_pairedDeviceAddresses;
    self->_pairedDeviceAddresses = v3;

    if (!self->_pairedDeviceAddresses) {
      return 0LL;
    }
  }

  int v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_pairedDeviceAddresses, "count"));
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v6 = self->_pairedDeviceAddresses;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      int v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADMobileBluetoothDeviceDataSource _deviceProxyWithAddress:createsIfAbsent:]( self,  "_deviceProxyWithAddress:createsIfAbsent:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  1LL,  (void)v13));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  os_unfair_lock_unlock(&self->_deviceProxiesLock);
  return v5;
}

- (void).cxx_destruct
{
}

@end