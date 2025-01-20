@interface ADCoreBluetoothV2DeviceSource
- (ADCoreBluetoothV2DeviceSource)init;
- (id)_createDeviceWithAddress:(id)a3;
- (id)_createDeviceWithUID:(id)a3;
- (id)_deviceWithAddress:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_deviceWithUID:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithUID:(id)a3;
- (id)devicesByAddress;
- (id)devicesByDeviceUID;
- (id)headGestureConfigurationForBTAddress:(id)a3;
- (id)queue;
- (void)_aadActivatingWithRetry:(BOOL)a3 andError:(id)a4;
- (void)_aadConnectionInterrupted;
- (void)_handleDeviceFound:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_invalidate;
- (void)_setupDiscoveryWithRetry:(BOOL)a3;
- (void)aadActivatingWithRetry:(BOOL)a3 andError:(id)a4;
- (void)fetchAddressForDeviceWithCBUUID:(id)a3 completion:(id)a4;
- (void)fetchAudioAccessoryDeviceForBTAddress:(id)a3 completion:(id)a4;
- (void)fetchAudioAccessoryDeviceForCBUUID:(id)a3 completion:(id)a4;
- (void)fetchCBUUIDForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)handleDeviceFound:(id)a3;
- (void)handleDeviceLost:(id)a3;
- (void)invalidate;
- (void)invalidateDeviceWithAddress:(id)a3 cbuuid:(id)a4;
- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5;
@end

@implementation ADCoreBluetoothV2DeviceSource

- (ADCoreBluetoothV2DeviceSource)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADCoreBluetoothV2DeviceSource;
  v2 = -[ADCoreBluetoothV2DeviceSource init](&v18, "init");
  if (v2)
  {
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADCoreBluetoothV2DeviceSource init]";
      __int16 v21 = 2112;
      v22 = v2;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s Creating %@", buf, 0x16u);
    }

    dispatch_group_t v4 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v4;

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2DeviceSource.setup", v7);

    setupQueue = v2->_setupQueue;
    v2->_setupQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2DeviceSource", v11);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;

    v14 = (dispatch_queue_s *)v2->_setupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B95E0;
    block[3] = &unk_1004FD940;
    v17 = v2;
    dispatch_async(v14, block);
  }

  return v2;
}

- (id)deviceWithAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000B90C4;
  v16 = sub_1000B90D4;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B93E8;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)deviceWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000B90C4;
  v16 = sub_1000B90D4;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B91F0;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)headGestureConfigurationForBTAddress:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_1000B90C4;
  id v17 = sub_1000B90D4;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B90DC;
  block[3] = &unk_1004FBE80;
  v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)_deviceWithAddress:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = AFNormalizeMacAddress(v6);
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_devicesByAddress, "objectForKey:", v8));
  if (v9)
  {
    id v10 = (id)v9;
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[ADCoreBluetoothV2DeviceSource _deviceWithAddress:createsIfAbsent:]";
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s  %@: %@", buf, 0x20u);
    }
  }

  else if (v4 && [v8 length])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCoreBluetoothV2DeviceSource _createDeviceWithAddress:](self, "_createDeviceWithAddress:", v6));
    uint64_t v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[ADCoreBluetoothV2DeviceSource _deviceWithAddress:createsIfAbsent:]";
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s  %@ not found, created %@",  buf,  0x20u);
    }

    -[NSMapTable setObject:forKey:](self->_devicesByAddress, "setObject:forKey:", v12, v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000B8FDC;
    v15[3] = &unk_1004F0090;
    id v10 = v12;
    id v16 = v10;
    id v17 = self;
    -[ADCoreBluetoothV2DeviceSource fetchCBUUIDForDeviceWithAddress:completion:]( self,  "fetchCBUUIDForDeviceWithAddress:completion:",  v8,  v15);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_deviceWithUID:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  devicesByDeviceUID = self->_devicesByDeviceUID;
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](devicesByDeviceUID, "objectForKey:", v8));

  if (v9)
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v21 = "-[ADCoreBluetoothV2DeviceSource _deviceWithUID:createsIfAbsent:]";
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s  %@: %@", buf, 0x20u);
    }
  }

  else if (v6 && v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCoreBluetoothV2DeviceSource _createDeviceWithUID:](self, "_createDeviceWithUID:", v6));
    uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v21 = "-[ADCoreBluetoothV2DeviceSource _deviceWithUID:createsIfAbsent:]";
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s  %@ not found, created %@",  buf,  0x20u);
    }

    uint64_t v13 = self->_devicesByDeviceUID;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    -[NSMapTable setObject:forKey:](v13, "setObject:forKey:", v11, v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000B8EF4;
    v17[3] = &unk_1004F0090;
    id v9 = v11;
    id v18 = v9;
    v19 = self;
    -[ADCoreBluetoothV2DeviceSource fetchAddressForDeviceWithCBUUID:completion:]( self,  "fetchAddressForDeviceWithCBUUID:completion:",  v15,  v17);
  }

  return v9;
}

- (void)invalidateDeviceWithAddress:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B8DB4;
  block[3] = &unk_1004FD4C0;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B8DAC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ADCoreBluetoothV2DeviceSource _invalidate]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  BOOL v4 = self->_devicesByAddress;
  id v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      dispatch_queue_t v8 = 0LL;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_devicesByAddress,  "objectForKey:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v8)));
        [v9 invalidate];

        dispatch_queue_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v6);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = self->_devicesByDeviceUID;
  id v11 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_devicesByDeviceUID,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v14),  (void)v16));
        [v15 invalidate];

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v12);
  }

  -[NSMapTable removeAllObjects](self->_devicesByAddress, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_devicesByDeviceUID, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_cbuuidByAddress, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_addressByCBUUID, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_headGestureConfigurationByAddress, "removeAllObjects");
}

- (id)_createDeviceWithAddress:(id)a3
{
  id v4 = a3;
  id v5 = -[ADCoreBluetoothV2Device initWithAddress:dataSource:]( objc_alloc(&OBJC_CLASS___ADCoreBluetoothV2Device),  "initWithAddress:dataSource:",  v4,  self);

  return v5;
}

- (id)_createDeviceWithUID:(id)a3
{
  id v4 = a3;
  id v5 = -[ADCoreBluetoothV2Device initWithDeviceUID:dataSource:]( objc_alloc(&OBJC_CLASS___ADCoreBluetoothV2Device),  "initWithDeviceUID:dataSource:",  v4,  self);

  return v5;
}

- (id)devicesByAddress
{
  return self->_devicesByAddress;
}

- (id)devicesByDeviceUID
{
  return self->_devicesByDeviceUID;
}

- (id)queue
{
  return self->_queue;
}

- (void)_setupDiscoveryWithRetry:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _setupDiscoveryWithRetry:]";
    __int16 v22 = 1024;
    BOOL v23 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s  %d:", location, 0x12u);
  }

  id v6 = (AADeviceManager *)objc_alloc_init(off_100572B28());
  aaDeviceManager = self->_aaDeviceManager;
  self->_aaDeviceManager = v6;

  -[AADeviceManager setDispatchQueue:](self->_aaDeviceManager, "setDispatchQueue:", self->_queue);
  objc_initWeak((id *)location, self);
  dispatch_queue_t v8 = self->_aaDeviceManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000B8C88;
  v19[3] = &unk_1004F00B8;
  objc_copyWeak(&v20, (id *)location);
  -[AADeviceManager setDeviceFoundHandler:](v8, "setDeviceFoundHandler:", v19);
  id v9 = self->_aaDeviceManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000B8CD8;
  v17[3] = &unk_1004F00B8;
  objc_copyWeak(&v18, (id *)location);
  -[AADeviceManager setDeviceLostHandler:](v9, "setDeviceLostHandler:", v17);
  id v10 = self->_aaDeviceManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000B8D28;
  v14[3] = &unk_1004F00E0;
  objc_copyWeak(&v15, (id *)location);
  BOOL v16 = v3;
  -[AADeviceManager activateWithCompletion:](v10, "activateWithCompletion:", v14);
  id v11 = self->_aaDeviceManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B8D7C;
  v12[3] = &unk_1004FAF58;
  objc_copyWeak(&v13, (id *)location);
  -[AADeviceManager setInterruptionHandler:](v11, "setInterruptionHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)location);
}

- (void)handleDeviceFound:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B8B4C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
    uint64_t v7 = AFNormalizeMacAddress(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    -[NSMapTable setObject:forKey:](self->_addressByCBUUID, "setObject:forKey:", v8, v9);
    -[NSMapTable setObject:forKey:](self->_cbuuidByAddress, "setObject:forKey:", v9, v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_devicesByDeviceUID, "objectForKey:", v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_devicesByAddress, "objectForKey:", v8));
    if (v10)
    {
      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315394;
        BOOL v23 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Device found with UID: %@",  (uint8_t *)&v22,  0x16u);
      }

      [v10 updateDevice:v5];
      if (v11) {
        goto LABEL_14;
      }
      devicesByAddress = self->_devicesByAddress;
      uint64_t v14 = v10;
      id v15 = v8;
    }

    else
    {
      __int128 v17 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v18 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (!v11)
      {
        if (v18)
        {
          int v22 = 136315650;
          BOOL v23 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
          __int16 v24 = 2112;
          id v25 = v8;
          __int16 v26 = 2112;
          v27 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Device not found, no need to update device: %@ (%@)",  (uint8_t *)&v22,  0x20u);
        }

        goto LABEL_14;
      }

      if (v18)
      {
        int v22 = 136315394;
        BOOL v23 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Device found with address: %@",  (uint8_t *)&v22,  0x16u);
      }

      -[NSMapTable setObject:forKey:](self->_devicesByDeviceUID, "setObject:forKey:", v11, v9);
      [v11 updateDevice:v5];
      devicesByAddress = self->_devicesByDeviceUID;
      uint64_t v14 = v11;
      id v15 = v9;
    }

    -[NSMapTable setObject:forKey:](devicesByAddress, "setObject:forKey:", v14, v15);
LABEL_14:
    id v19 = sub_10022DC28(v5);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (AFDeviceSupportsBobble() && [v20 isSupported])
    {
      __int128 v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315650;
        BOOL v23 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        v27 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Updating headGestureConfiguration for supported device: %@ (%@)",  (uint8_t *)&v22,  0x20u);
      }

      -[NSMapTable setObject:forKey:](self->_headGestureConfigurationByAddress, "setObject:forKey:", v20, v8);
    }

    goto LABEL_20;
  }

  BOOL v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136315138;
    BOOL v23 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Device found in nil",  (uint8_t *)&v22,  0xCu);
  }

- (void)handleDeviceLost:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B8B40;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
  uint64_t v6 = AFNormalizeMacAddress(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    id v15 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceLost:]";
    __int16 v16 = 2112;
    __int128 v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Device lost: %@ (%@)",  (uint8_t *)&v14,  0x20u);
  }

  -[NSMapTable removeObjectForKey:](self->_cbuuidByAddress, "removeObjectForKey:", v7);
  -[NSMapTable removeObjectForKey:](self->_addressByCBUUID, "removeObjectForKey:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_devicesByDeviceUID, "objectForKey:", v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_devicesByAddress, "objectForKey:", v8));
  if (v10)
  {
    id v12 = v10;
LABEL_7:
    [v12 invalidate];
    goto LABEL_8;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_devicesByAddress, "objectForKey:", v7));

  if (v13)
  {
    id v12 = v11;
    goto LABEL_7;
  }

- (void)aadActivatingWithRetry:(BOOL)a3 andError:(id)a4
{
  id v6 = a4;
  setupQueue = (dispatch_queue_s *)self->_setupQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B8B30;
  block[3] = &unk_1004FC188;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(setupQueue, block);
}

- (void)_aadActivatingWithRetry:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315650;
      *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _aadActivatingWithRetry:andError:]";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Failed to activate discovery, error: %@, will retry: %d",  location,  0x1Cu);
      if (v4) {
        goto LABEL_4;
      }
    }

    else if (v4)
    {
LABEL_4:
      objc_initWeak((id *)location, self);
      setupQueue = (dispatch_queue_s *)self->_setupQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000B8A4C;
      handler[3] = &unk_1004F8E08;
      objc_copyWeak(&v11, (id *)location);
      notify_register_dispatch("com.apple.AudioAccessory.daemonStarted", (int *)&unk_100572B20, setupQueue, handler);
      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)location);
      goto LABEL_10;
    }

    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _aadActivatingWithRetry:andError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Discovery activation failed after a retry",  location,  0xCu);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315138;
    *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _aadActivatingWithRetry:andError:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Discovery activation was successful",  location,  0xCu);
  }

- (void)_aadConnectionInterrupted
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B8988;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)fetchCBUUIDForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B871C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify((dispatch_group_t)group, queue, block);
}

- (void)fetchAddressForDeviceWithCBUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B8620;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify((dispatch_group_t)group, queue, block);
}

- (void)fetchAudioAccessoryDeviceForCBUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B83EC;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify((dispatch_group_t)group, queue, block);
}

- (void)fetchAudioAccessoryDeviceForBTAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFNormalizeMacAddress(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B81A4;
  v15[3] = &unk_1004FDA30;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v9;
  dispatch_group_notify((dispatch_group_t)group, queue, v15);
}

- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B8114;
  v16[3] = &unk_1004FDA30;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_group_notify((dispatch_group_t)group, queue, v16);
}

- (void).cxx_destruct
{
}

@end