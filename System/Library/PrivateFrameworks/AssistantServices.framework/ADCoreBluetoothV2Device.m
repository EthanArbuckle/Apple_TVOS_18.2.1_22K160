@interface ADCoreBluetoothV2Device
- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 cbuuid:(id)a4 dataSource:(id)a5;
- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 dataSource:(id)a4;
- (ADCoreBluetoothV2Device)initWithDeviceUID:(id)a3 dataSource:(id)a4;
- (id)_deviceInfo;
- (id)_inEarDetectionStateFromCBDevice:(id)a3;
- (id)address;
- (id)cbuuid;
- (id)deviceInfo;
- (id)identifier;
- (int64_t)_headphoneListeningModeFromDevice:(id)a3;
- (int64_t)_inEarStatusFromDevicePlacement:(int)a3;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_invalidate;
- (void)_updateDevice:(id)a3;
- (void)_updateDeviceInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)fetchCBUIIDWithCompletion:(id)a3;
- (void)getConversationAwareness:(id)a3;
- (void)getDeviceInfo:(id)a3;
- (void)getHeadGestures:(id)a3;
- (void)getHeadphoneInEarDetectionState:(id)a3;
- (void)getHeadphoneListeningMode:(id)a3;
- (void)getPersonalVolume:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)setHeadGestures:(BOOL)a3 completion:(id)a4;
- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)updateDevice:(id)a3;
@end

@implementation ADCoreBluetoothV2Device

- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 cbuuid:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___ADCoreBluetoothV2Device;
  id v11 = -[ADCoreBluetoothV2Device init](&v34, "init");
  if (v11)
  {
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2Device.AAD", v13);

    v15 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2Device", v17);

    v19 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v18;

    dispatch_group_t v20 = dispatch_group_create();
    v21 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v20;

    v22 = (dispatch_queue_s *)*((void *)v11 + 4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10022F32C;
    block[3] = &unk_1004FD4C0;
    v23 = (id *)v11;
    v31 = v23;
    id v32 = v8;
    id v33 = v9;
    dispatch_async(v22, block);
    objc_storeWeak(v23 + 1, v10);
    dispatch_group_enter(*((dispatch_group_t *)v11 + 5));
    objc_initWeak(&location, v23);
    v24 = (dispatch_queue_s *)*((void *)v11 + 3);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10022F360;
    v26[3] = &unk_1004FBF48;
    objc_copyWeak(&v28, &location);
    v27 = v23;
    dispatch_async(v24, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return (ADCoreBluetoothV2Device *)v11;
}

- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 dataSource:(id)a4
{
  return -[ADCoreBluetoothV2Device initWithAddress:cbuuid:dataSource:]( self,  "initWithAddress:cbuuid:dataSource:",  a3,  0LL,  a4);
}

- (ADCoreBluetoothV2Device)initWithDeviceUID:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  id v8 = -[ADCoreBluetoothV2Device initWithAddress:cbuuid:dataSource:]( self,  "initWithAddress:cbuuid:dataSource:",  0LL,  v7,  v6);

  return v8;
}

- (void)invalidate
{
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022F324;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_sync(aadQueue, block);
}

- (void)_invalidate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10022F2D8;
  v4[3] = &unk_1004F6F78;
  v4[4] = self;
  -[ADCoreBluetoothV2Device _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v4);
  device = self->_device;
  self->_device = 0LL;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    aadQueue = (dispatch_queue_s *)self->_aadQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10022F284;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(aadQueue, v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    aadQueue = (dispatch_queue_s *)self->_aadQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10022F1C0;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(aadQueue, v7);
  }
}

- (id)deviceInfo
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10022F0C8;
  id v10 = sub_10022F0D8;
  id v11 = 0LL;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10022F188;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(aadQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022F144;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (id)identifier
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10022F0C8;
  id v10 = sub_10022F0D8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10022F108;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)address
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10022F0C8;
  id v10 = sub_10022F0D8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10022F0F4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)cbuuid
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10022F0C8;
  id v10 = sub_10022F0D8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10022F0E0;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)fetchCBUIIDWithCompletion:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022F084;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022EFB4;
  block[3] = &unk_1004FB930;
  id v11 = v6;
  int64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, block);
}

- (void)getConversationAwareness:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022ED54;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022EB74;
  block[3] = &unk_1004FCB38;
  BOOL v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, block);
}

- (void)getPersonalVolume:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022E914;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022E734;
  block[3] = &unk_1004FCB38;
  BOOL v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, block);
}

- (void)getHeadGestures:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022E524;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (void)setHeadGestures:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022E214;
  block[3] = &unk_1004FCB38;
  BOOL v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, block);
}

- (void)getHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022E1CC;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (void)getHeadphoneListeningMode:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10022E19C;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify((dispatch_group_t)group, aadQueue, v8);
}

- (void)updateDevice:(id)a3
{
  id v4 = a3;
  aadQueue = (dispatch_queue_s *)self->_aadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10022E190;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(aadQueue, v7);
}

- (void)_updateDevice:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022E038;
  block[3] = &unk_1004FD968;
  id v6 = v4;
  id v32 = v6;
  id v33 = self;
  dispatch_async(queue, block);
  id v7 = self->_device;
  id v8 = v6;
  id v9 = sub_10022D958(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCoreBluetoothV2Device cbuuid](self, "cbuuid"));
    *(_DWORD *)buf = 136315650;
    v35 = "-[ADCoreBluetoothV2Device _updateDevice:]";
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s found device: %@, cbuuid: %@", buf, 0x20u);
  }

  if (v7)
  {
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADCoreBluetoothV2Device _inEarDetectionStateFromCBDevice:]( self,  "_inEarDetectionStateFromCBDevice:",  v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADCoreBluetoothV2Device _inEarDetectionStateFromCBDevice:]( self,  "_inEarDetectionStateFromCBDevice:",  v8));
    if (v14 != v15 && ([v14 isEqual:v15] & 1) == 0)
    {
      dispatch_queue_attr_t v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[ADCoreBluetoothV2Device _updateDevice:]";
        __int16 v36 = 2112;
        id v37 = v14;
        __int16 v38 = 2112;
        v39 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s IED state changed from %@ to %@",  buf,  0x20u);
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10022E0F0;
      v28[3] = &unk_1004F6FC8;
      v28[4] = self;
      id v29 = v14;
      id v30 = v15;
      -[ADCoreBluetoothV2Device _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v28);
    }

    int64_t v17 = -[ADCoreBluetoothV2Device _headphoneListeningModeFromDevice:](self, "_headphoneListeningModeFromDevice:", v7);
    int64_t v18 = -[ADCoreBluetoothV2Device _headphoneListeningModeFromDevice:](self, "_headphoneListeningModeFromDevice:", v8);
    if (v17 != v18)
    {
      int64_t v19 = v18;
      dispatch_group_t v20 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        log = v20;
        uint64_t Name = AFBluetoothHeadphoneListeningModeGetName(v17);
        v25 = (void *)objc_claimAutoreleasedReturnValue(Name);
        uint64_t v22 = AFBluetoothHeadphoneListeningModeGetName(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 136315650;
        v35 = "-[ADCoreBluetoothV2Device _updateDevice:]";
        __int16 v36 = 2112;
        id v37 = v25;
        __int16 v38 = 2112;
        v39 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s Listening mode changed from %@ to %@",  buf,  0x20u);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10022E140;
      v27[3] = &unk_1004F6FF0;
      v27[4] = self;
      v27[5] = v17;
      v27[6] = v19;
      -[ADCoreBluetoothV2Device _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v27, v25);
    }
  }

  -[ADCoreBluetoothV2Device _updateDeviceInfo:](self, "_updateDeviceInfo:", v10);
  device = self->_device;
  self->_device = (AudioAccessoryDevice *)v8;
}

- (id)_deviceInfo
{
  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    id v4 = sub_10022D958(self->_device);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[ADCoreBluetoothV2Device _updateDeviceInfo:](self, "_updateDeviceInfo:", v5);

    deviceInfo = self->_deviceInfo;
  }

  return deviceInfo;
}

- (void)_updateDeviceInfo:(id)a3
{
  id v4 = (AFBluetoothDeviceInfo *)a3;
  deviceInfo = self->_deviceInfo;
  if (deviceInfo != v4 && (-[AFBluetoothDeviceInfo isEqual:](deviceInfo, "isEqual:", v4) & 1) == 0)
  {
    id v6 = self->_deviceInfo;
    id v7 = (AFBluetoothDeviceInfo *)-[AFBluetoothDeviceInfo copy](v4, "copy");
    id v8 = self->_deviceInfo;
    self->_deviceInfo = v7;

    id v9 = self->_deviceInfo;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10022D908;
    v12[3] = &unk_1004F6FC8;
    v12[4] = self;
    v13 = v6;
    dispatch_queue_t v14 = v9;
    id v10 = v9;
    id v11 = v6;
    -[ADCoreBluetoothV2Device _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v12);
  }
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v6 = a3;
  observers = self->_observers;
  if (observers)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable setRepresentation](observers, "setRepresentation"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10022D8FC;
    v7[3] = &unk_1004F7018;
    id v8 = v6;
    [v5 enumerateObjectsUsingBlock:v7];
  }
}

- (int64_t)_inEarStatusFromDevicePlacement:(int)a3
{
  else {
    return qword_1003C9F80[a3 - 1];
  }
}

- (int64_t)_headphoneListeningModeFromDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 coreBluetoothDevice]);
  uint64_t v4 = [v3 listeningMode] - 1;
  else {
    int64_t v5 = v4 + 2;
  }

  return v5;
}

- (id)_inEarDetectionStateFromCBDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 coreBluetoothDevice]);
  id v5 = [v4 primaryPlacement];
  id v6 = [v4 secondaryPlacement];
  unsigned int v7 = [v4 primaryBudSide];
  int64_t v8 = -[ADCoreBluetoothV2Device _inEarStatusFromDevicePlacement:](self, "_inEarStatusFromDevicePlacement:", v5);
  int64_t v9 = -[ADCoreBluetoothV2Device _inEarStatusFromDevicePlacement:](self, "_inEarStatusFromDevicePlacement:", v6);
  if (v7 == 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = 2LL * (v7 == 2);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10022D894;
  v13[3] = &unk_1004F7038;
  int v14 = (int)v5;
  v13[4] = v8;
  v13[5] = v9;
  v13[6] = v10;
  id v11 = -[AFBluetoothHeadphoneInEarDetectionState initWithBuilder:]( objc_alloc(&OBJC_CLASS___AFBluetoothHeadphoneInEarDetectionState),  "initWithBuilder:",  v13);

  return v11;
}

- (void).cxx_destruct
{
}

@end