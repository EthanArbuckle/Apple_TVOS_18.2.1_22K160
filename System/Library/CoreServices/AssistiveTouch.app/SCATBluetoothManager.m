@interface SCATBluetoothManager
+ (id)sharedInstance;
+ (id)superNew;
- (SCATBluetoothManager)init;
- (int)_desiredSessionState;
- (int)_sessionState;
- (void)_accessoryCustomMessageForAccessoryManager:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4 customMessageType:(int)a5 data:(char *)a6 dataSize:(unint64_t)a7;
- (void)_beginAttach;
- (void)_beginDetach;
- (void)_beginStateTransitionIfNecessary;
- (void)_didConnectWithSession:(BTSessionImpl *)a3;
- (void)_didDisconnect;
- (void)_probeAccessories;
- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)addActivationReason:(id)a3;
- (void)addDeviceListener:(id)a3;
- (void)checkIfActiveForReason:(id)a3 completion:(id)a4;
- (void)getExtantDevicesWithCompletion:(id)a3;
- (void)removeActivationReason:(id)a3;
- (void)removeDeviceListener:(id)a3;
- (void)sendConfigurationMessageToDevice:(id)a3 ofType:(unsigned __int8)a4 value:(unsigned int)a5;
- (void)sendCustomMessageToDevice:(id)a3 ofType:(int)a4 withData:(id)a5;
@end

@implementation SCATBluetoothManager

+ (id)superNew
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SCATBluetoothManager;
  return objc_msgSendSuper2(&v3, "new");
}

+ (id)sharedInstance
{
  if (qword_100157640 != -1) {
    dispatch_once(&qword_100157640, &stru_1001227F8);
  }
  return (id)qword_100157648;
}

- (SCATBluetoothManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATBluetoothManager;
  v2 = -[SCATBluetoothManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    deviceListeners = v2->_deviceListeners;
    v2->_deviceListeners = (NSPointerArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.scat.bluetoothmanager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    activationReasons = v2->_activationReasons;
    v2->_activationReasons = (NSMutableArray *)v7;

    v2->_sessionState = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    addressToDeviceMap = v2->_addressToDeviceMap;
    v2->_addressToDeviceMap = (NSMutableDictionary *)v9;
  }

  return v2;
}

- (int)_sessionState
{
  return self->_sessionState;
}

- (int)_desiredSessionState
{
  return 2 * (-[NSMutableArray count](self->_activationReasons, "count") != 0LL);
}

- (void)_beginAttach
{
  if (-[SCATBluetoothManager _sessionState](self, "_sessionState")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATBluetoothManager.m",  86LL,  "-[SCATBluetoothManager _beginAttach]",  @"trying to connect when not disconnected!?");
  }
  uint64_t v7 = sub_1000253C8;
  if (BTSessionAttachWithQueue("com.apple.scat.bluetoothmanager.btsession", &v7, self, self->_queue))
  {
    uint64_t v3 = SWCHLogHW();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000AEF9C();
    }

    dispatch_time_t v5 = dispatch_time(0LL, 30000000000LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000253DC;
    v6[3] = &unk_100121D18;
    v6[4] = self;
    dispatch_after(v5, &_dispatch_main_q, v6);
  }

  self->_sessionState = 1;
}

- (void)_beginDetach
{
  if (-[SCATBluetoothManager _sessionState](self, "_sessionState") != 2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATBluetoothManager.m",  102LL,  "-[SCATBluetoothManager _beginDetach]",  @"trying to connect when not disconnected!?");
  }
  self->_sessionState = 3;
  BTSessionDetachWithQueue(&self->_session);
  -[SCATBluetoothManager _didDisconnect](self, "_didDisconnect");
}

- (void)_beginStateTransitionIfNecessary
{
  uint64_t v4 = SWCHLogHW();
  dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000AEFC8(self, a2, v5);
  }

  if (-[SCATBluetoothManager _sessionState](self, "_sessionState") != 1
    && -[SCATBluetoothManager _sessionState](self, "_sessionState") != 3)
  {
    unsigned int v6 = -[SCATBluetoothManager _desiredSessionState](self, "_desiredSessionState");
    if (v6 != -[SCATBluetoothManager _sessionState](self, "_sessionState"))
    {
      if (-[SCATBluetoothManager _desiredSessionState](self, "_desiredSessionState") == 2)
      {
        -[SCATBluetoothManager _beginAttach](self, "_beginAttach");
      }

      else
      {
        if (-[SCATBluetoothManager _desiredSessionState](self, "_desiredSessionState"))
        {
          uint64_t v7 = -[SCATBluetoothManager _desiredSessionState](self, "_desiredSessionState");
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATBluetoothManager.m",  130LL,  "-[SCATBluetoothManager _beginStateTransitionIfNecessary]",  @"bogus desired session state %d?");
        }

        -[SCATBluetoothManager _beginDetach](self, "_beginDetach", v7);
      }
    }
  }

- (void)_probeAccessories
{
  uint64_t v3 = 0LL;
  unint64_t v4 = 0LL;
  unint64_t v66 = 0LL;
  do
  {
    if (2 * v4 <= 1) {
      unint64_t v4 = 1LL;
    }
    else {
      v4 *= 2LL;
    }
    dispatch_time_t v5 = realloc(v3, 8 * v4);
    if (!v5)
    {
      uint64_t v44 = SWCHLogHW();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_1000AF0B8();
      }

      v46 = v3;
      goto LABEL_58;
    }

    unsigned int v6 = v5;
    int ConnectedDevices = BTLocalDeviceGetConnectedDevices(self->_localDevice, v5, &v66, v4);
    if (ConnectedDevices)
    {
      int v47 = ConnectedDevices;
      uint64_t v48 = SWCHLogHW();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1000AF0E4(v47, v49);
      }

      v46 = v6;
LABEL_58:
      free(v46);
      -[SCATBluetoothManager _beginDetach](self, "_beginDetach");
      return;
    }

    if (v4 > 0x400) {
      break;
    }
    uint64_t v3 = v6;
  }

  while (v66 >= v4);
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v66)
  {
    for (unint64_t i = 0LL; i < v66; ++i)
    {
      uint64_t v10 = *((void *)v6 + i);
      BTDeviceGetAddressString(v10, buf, 256LL);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_addressToDeviceMap, "objectForKey:", v11));
      v13 = v12;
      if (v12)
      {
        uint64_t v65 = 0LL;
        unsigned int v14 = [v12 updateWithDevice:v10 error:&v65];
        id v15 = 0LL;
        if (v14) {
          id v15 = v13;
        }
      }

      else
      {
        id v15 = (id)objc_claimAutoreleasedReturnValue( +[SCATBluetoothDevice scatBluetoothDeviceWithDevice:accessoryManager:]( &OBJC_CLASS___SCATBluetoothDevice,  "scatBluetoothDeviceWithDevice:accessoryManager:",  v10,  self->_accessoryManager));
        if (v15) {
          [v51 addObject:v15];
        }
      }

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 addressString]);
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, v16);
      }
    }
  }

  free(v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](self->_addressToDeviceMap, "keyEnumerator"));
  id v19 = [v18 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v23));

        if (!v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_addressToDeviceMap, "objectForKey:", v23));
          [v17 addObject:v25];
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_addressToDeviceMap, "objectForKey:", v23));
        [v26 deviceDisappeared];
      }

      id v20 = [v18 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }

    while (v20);
  }

  if (-[NSPointerArray count](self->_deviceListeners, "count"))
  {
    uint64_t v27 = 0LL;
    v50 = v17;
    do
    {
      uint64_t v52 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPointerArray pointerAtIndex:](self->_deviceListeners, "pointerAtIndex:", v27));
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v29 = v17;
      id v30 = [v29 countByEnumeratingWithState:&v57 objects:v68 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v58;
        do
        {
          for (k = 0LL; k != v31; k = (char *)k + 1)
          {
            if (*(void *)v58 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)k);
            if ((objc_opt_respondsToSelector(v28, "bluetoothManager:forgotDevice:") & 1) != 0) {
              [v28 bluetoothManager:self forgotDevice:v34];
            }
          }

          id v31 = [v29 countByEnumeratingWithState:&v57 objects:v68 count:16];
        }

        while (v31);
      }

      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v35 = v51;
      id v36 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v54;
        do
        {
          for (m = 0LL; m != v37; m = (char *)m + 1)
          {
            if (*(void *)v54 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)m);
            if ((objc_opt_respondsToSelector(v28, "bluetoothManager:discoveredDevice:") & 1) != 0) {
              [v28 bluetoothManager:self discoveredDevice:v40];
            }
          }

          id v37 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
        }

        while (v37);
      }

      uint64_t v27 = v52 + 1;
      v17 = v50;
    }

    while (v52 + 1 < -[NSPointerArray count](self->_deviceListeners, "count"));
  }

  uint64_t v41 = SWCHLogHW();
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v71 = v51;
    __int16 v72 = 2112;
    v73 = v17;
    __int16 v74 = 2112;
    v75 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "Completed BT device scan. New devices: %@\nobsolete devices: %@\nnew map: %@",  buf,  0x20u);
  }

  addressToDeviceMap = self->_addressToDeviceMap;
  self->_addressToDeviceMap = v8;
}

- (void)_didConnectWithSession:(BTSessionImpl *)a3
{
  self->_sessionState = 2;
  self->_session = a3;
  BTAccessoryManagerGetDefault(a3, &self->_accessoryManager);
  BTLocalDeviceGetDefault(self->_session, &self->_localDevice);
  v6[0] = sub_100025B84;
  memset(&v6[1], 0, 24);
  BTAccessoryManagerAddCallbacks(self->_accessoryManager, v6, self);
  dispatch_time_t v5 = sub_100025BA0;
  BTAccessoryManagerRegisterCustomMessageClient(self->_accessoryManager, &v5, 4096LL, self);
  BTServiceAddCallbacks(a3, sub_100025BC0, self);
  -[SCATBluetoothManager _probeAccessories](self, "_probeAccessories");
}

- (void)_didDisconnect
{
  uint64_t v3 = SWCHLogHW(self, a2);
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000AF154();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_sessionState = 0;
  self->_localDevice = 0LL;
  self->_accessoryManager = 0LL;
  self->_session = 0LL;
}

- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  switch(a4)
  {
    case 0:
      uint64_t v8 = SWCHLogHW(self, a2);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTSession attached.", buf, 2u);
      }

      self->_sessionState = 1;
      if (a5) {
        goto LABEL_20;
      }
      -[SCATBluetoothManager _didConnectWithSession:](self, "_didConnectWithSession:", a3);
      goto LABEL_21;
    case 1:
      uint64_t v10 = SWCHLogHW(self, a2);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BTSession detached.", v19, 2u);
      }

      self->_sessionState = 3;
      goto LABEL_20;
    case 2:
      uint64_t v12 = SWCHLogHW(self, a2);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BTSession terminated.", v18, 2u);
      }

      if (self->_session == a3) {
        goto LABEL_20;
      }
      unsigned int v14 = @"A random session disconnected and we were informed about it for some reason?";
      uint64_t v15 = 307LL;
      break;
    case 3:
      uint64_t v16 = SWCHLogHW(self, a2);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000AF18C();
      }

      if (!a3 || self->_session == a3) {
        goto LABEL_19;
      }
      unsigned int v14 = @"A random session failed and we were informed about it for some reason?";
      uint64_t v15 = 318LL;
      break;
    default:
      goto LABEL_21;
  }

  _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATBluetoothManager.m",  v15,  "-[SCATBluetoothManager _sessionEventForSession:event:result:]",  v14);
LABEL_19:
  if (self->_session == a3) {
LABEL_20:
  }
    -[SCATBluetoothManager _didDisconnect](self, "_didDisconnect");
LABEL_21:
  -[SCATBluetoothManager _beginStateTransitionIfNecessary](self, "_beginStateTransitionIfNecessary");
}

- (void)_accessoryCustomMessageForAccessoryManager:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4 customMessageType:(int)a5 data:(char *)a6 dataSize:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t AddressString = BTDeviceGetAddressString(a4, v29, 256LL);
  if ((_DWORD)AddressString)
  {
    uint64_t v14 = SWCHLogHW(AddressString, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000AF1B8(a2, v15);
    }
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v29));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_addressToDeviceMap, "objectForKey:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a6, a7));
    uint64_t v19 = SWCHLogHW(v17, v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 136315906;
      v22 = v29;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 1024;
      int v26 = v9;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Custom message received from %s (%@): %d, %@",  (uint8_t *)&v21,  0x26u);
    }

    [v16 customMessageReceived:v9 withData:v17];
  }
}

- (void)addActivationReason:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026040;
  v7[3] = &unk_100122168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeActivationReason:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000260E8;
  v7[3] = &unk_100122168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)checkIfActiveForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000261C0;
  block[3] = &unk_100122820;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)addDeviceListener:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026270;
  block[3] = &unk_100122168;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)removeDeviceListener:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000262F8;
  block[3] = &unk_100122168;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)getExtantDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000263F0;
  v7[3] = &unk_100122280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendCustomMessageToDevice:(id)a3 ofType:(int)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000264E8;
  v13[3] = &unk_100122848;
  int v17 = a4;
  id v14 = v8;
  id v15 = v9;
  uint64_t v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)sendConfigurationMessageToDevice:(id)a3 ofType:(unsigned __int8)a4 value:(unsigned int)a5
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000267C4;
  block[3] = &unk_100122870;
  unsigned __int8 v15 = a4;
  unsigned int v14 = a5;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end