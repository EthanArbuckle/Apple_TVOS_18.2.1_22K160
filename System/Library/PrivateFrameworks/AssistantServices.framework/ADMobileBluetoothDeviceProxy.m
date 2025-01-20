@interface ADMobileBluetoothDeviceProxy
- (ADMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (ADMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (NSString)address;
- (NSString)description;
- (NSUUID)deviceUID;
- (id)deviceInfo;
- (id)identifier;
- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3;
- (void)_changeHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_fetchDeviceInfoWithCompletion:(id)a3;
- (void)_fetchHeadphoneInEarDetectionStateWithCompletion:(id)a3;
- (void)_fetchHeadphoneListeningModeWithCompletion:(id)a3;
- (void)_getConversationAwareness:(id)a3;
- (void)_getDeviceInfo:(id)a3;
- (void)_getHeadphoneInEarDetectionState:(id)a3;
- (void)_getHeadphoneListeningMode:(id)a3;
- (void)_getPersonalVolume:(id)a3;
- (void)_invalidate;
- (void)_reload:(BOOL)a3;
- (void)_setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)_setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)_setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)_updateDeviceInfo:(id)a3;
- (void)_updateHeadphoneInEarDetectionState:(id)a3;
- (void)_updateHeadphoneListeningMode:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)getConversationAwareness:(id)a3;
- (void)getDeviceInfo:(id)a3;
- (void)getHeadGestures:(id)a3;
- (void)getHeadphoneInEarDetectionState:(id)a3;
- (void)getHeadphoneListeningMode:(id)a3;
- (void)getPersonalVolume:(id)a3;
- (void)invalidate;
- (void)prewarm;
- (void)reload;
- (void)removeObserver:(id)a3;
- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)setHeadGestures:(BOOL)a3 completion:(id)a4;
- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)updateDeviceInfo:(id)a3;
- (void)updateHeadphoneInEarDetectionState:(id)a3;
- (void)updateHeadphoneListeningMode:(int64_t)a3;
@end

@implementation ADMobileBluetoothDeviceProxy

- (NSString)description
{
  if (self->_deviceUID)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSString);
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceProxy;
    v4 = -[ADMobileBluetoothDeviceProxy description](&v14, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ {deviceUID = %@}", v5, self->_deviceUID);
  }

  else
  {
    if (!self->_address)
    {
      v12.receiver = self;
      v12.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceProxy;
      v11 = -[ADMobileBluetoothDeviceProxy description](&v12, "description");
      return (NSString *)(id)objc_claimAutoreleasedReturnValue(v11);
    }

    v7 = objc_alloc(&OBJC_CLASS___NSString);
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceProxy;
    v8 = -[ADMobileBluetoothDeviceProxy description](&v13, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v6 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@ {address = %@}", v5, self->_address);
  }

  v9 = v6;

  return v9;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[ADMobileBluetoothDeviceProxy dealloc]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceProxy;
  -[ADMobileBluetoothDeviceProxy dealloc](&v4, "dealloc");
}

- (ADMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceProxy;
  v11 = -[ADMobileBluetoothDeviceProxy init](&v19, "init");
  if (v11)
  {
    objc_super v12 = (NSString *)[v8 copy];
    address = v11->_address;
    v11->_address = v12;

    objc_super v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[ADMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = (dispatch_queue_s *)v11->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E24C4;
    block[3] = &unk_1004FD940;
    v18 = v11;
    dispatch_async(queue, block);
  }

  return v11;
}

- (ADMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADMobileBluetoothDeviceProxy;
  v11 = -[ADMobileBluetoothDeviceProxy init](&v19, "init");
  if (v11)
  {
    objc_super v12 = (NSUUID *)[v8 copy];
    deviceUID = v11->_deviceUID;
    v11->_deviceUID = v12;

    objc_super v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[ADMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = (dispatch_queue_s *)v11->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E22E4;
    block[3] = &unk_1004FD940;
    v18 = v11;
    dispatch_async(queue, block);
  }

  return v11;
}

- (void)updateDeviceInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E22D8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E22CC;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateHeadphoneListeningMode:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E22C0;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)reload
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E22B4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)prewarm
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E22A8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)identifier
{
  address = (NSString *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_deviceUID, "UUIDString"));
  id v4 = address;
  if (!address) {
    address = self->_address;
  }
  v5 = address;

  return v5;
}

- (id)deviceInfo
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1000E204C;
  objc_super v19 = sub_1000E205C;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  objc_super v12 = sub_1000E204C;
  objc_super v13 = sub_1000E205C;
  id v14 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2064;
  block[3] = &unk_1004F19B8;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  v3 = (dispatch_semaphore_s *)v10[5];
  if (v3 && (dispatch_time_t v4 = dispatch_time(0LL, 4000000000LL), dispatch_semaphore_wait(v3, v4)))
  {
    v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v22 = "-[ADMobileBluetoothDeviceProxy deviceInfo]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Slow path timed out after 4 seconds.",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  else
  {
    id v6 = (id)v16[5];
  }

  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E2040;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E2034;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getHeadphoneListeningMode:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E2028;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2018;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2008;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1FF8;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setHeadGestures:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E1ED0;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)getConversationAwareness:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E1EC4;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getPersonalVolume:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E1EB8;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getHeadGestures:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E1D90;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E1D3C;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E1D30;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1D28;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reload:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_deviceInfo) {
    BOOL v5 = !a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[ADMobileBluetoothDeviceProxy _reload:]";
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Reloading device info for %@...", buf, 0x16u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000E1A8C;
    v13[3] = &unk_1004F07F8;
    v13[4] = self;
    -[ADMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:](self, "_fetchDeviceInfoWithCompletion:", v13);
  }

  if (self->_headphoneInEarDetectionState) {
    BOOL v7 = !v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[ADMobileBluetoothDeviceProxy _reload:]";
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Reloading headphone in-ear detection state for %@...",  buf,  0x16u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000E1B6C;
    v12[3] = &unk_1004F0888;
    v12[4] = self;
    -[ADMobileBluetoothDeviceProxy _fetchHeadphoneInEarDetectionStateWithCompletion:]( self,  "_fetchHeadphoneInEarDetectionStateWithCompletion:",  v12);
  }

  if (self->_headphoneListeningMode) {
    BOOL v9 = !v3;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[ADMobileBluetoothDeviceProxy _reload:]";
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Reloading headphone listening mode for %@...",  buf,  0x16u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000E1C4C;
    v11[3] = &unk_1004FB890;
    v11[4] = self;
    -[ADMobileBluetoothDeviceProxy _fetchHeadphoneListeningModeWithCompletion:]( self,  "_fetchHeadphoneListeningModeWithCompletion:",  v11);
  }

- (void)_getDeviceInfo:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = v4;
  if (v4)
  {
    if (self->_deviceInfo)
    {
      v4[2](v4);
    }

    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000E1A3C;
      v6[3] = &unk_1004F08B0;
      v6[4] = self;
      BOOL v7 = v4;
      -[ADMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:](self, "_fetchDeviceInfoWithCompletion:", v6);
    }
  }
}

- (void)_getHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E18BC;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_getHeadphoneListeningMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E1734;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E14DC;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E0F8C;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E0A3C;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_getConversationAwareness:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E0514;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_getPersonalVolume:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DFE08;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_updateDeviceInfo:(id)a3
{
  id v4 = (AFBluetoothDeviceInfo *)a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADMobileBluetoothDeviceProxy _updateDeviceInfo:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s deviceInfo = %@", buf, 0x16u);
  }

  deviceInfo = self->_deviceInfo;
  if (deviceInfo != v4 && (-[AFBluetoothDeviceInfo isEqual:](deviceInfo, "isEqual:", v4) & 1) == 0)
  {
    BOOL v7 = self->_deviceInfo;
    id v8 = (AFBluetoothDeviceInfo *)-[AFBluetoothDeviceInfo copy](v4, "copy");
    BOOL v9 = self->_deviceInfo;
    self->_deviceInfo = v8;

    id v10 = self->_deviceInfo;
    BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADMobileBluetoothDeviceProxy _updateDeviceInfo:]";
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s deviceInfo changed from %@ to %@",  buf,  0x20u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000DFDB8;
    v14[3] = &unk_1004F6FC8;
    v14[4] = self;
    uint64_t v15 = v7;
    __int16 v16 = v10;
    objc_super v12 = v10;
    objc_super v13 = v7;
    -[ADMobileBluetoothDeviceProxy _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v14);
  }
}

- (void)_updateHeadphoneInEarDetectionState:(id)a3
{
  id v4 = (AFBluetoothHeadphoneInEarDetectionState *)a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneInEarDetectionState:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s headphoneInEarDetectionState = %@", buf, 0x16u);
  }

  headphoneInEarDetectionState = self->_headphoneInEarDetectionState;
  if (headphoneInEarDetectionState != v4
    && (-[AFBluetoothHeadphoneInEarDetectionState isEqual:](headphoneInEarDetectionState, "isEqual:", v4) & 1) == 0)
  {
    BOOL v7 = self->_headphoneInEarDetectionState;
    id v8 = (AFBluetoothHeadphoneInEarDetectionState *)-[AFBluetoothHeadphoneInEarDetectionState copy](v4, "copy");
    BOOL v9 = self->_headphoneInEarDetectionState;
    self->_headphoneInEarDetectionState = v8;

    id v10 = self->_headphoneInEarDetectionState;
    BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneInEarDetectionState:]";
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s headphoneInEarDetectionState changed from %@ to %@",  buf,  0x20u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000DFD68;
    v14[3] = &unk_1004F6FC8;
    v14[4] = self;
    uint64_t v15 = v7;
    __int16 v16 = v10;
    objc_super v12 = v10;
    objc_super v13 = v7;
    -[ADMobileBluetoothDeviceProxy _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v14);
  }
}

- (void)_updateHeadphoneListeningMode:(int64_t)a3
{
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneListeningMode:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s int64_t headphoneListeningMode = %ld", buf, 0x16u);
  }

  int64_t headphoneListeningMode = self->_headphoneListeningMode;
  if (headphoneListeningMode != a3)
  {
    self->_int64_t headphoneListeningMode = a3;
    BOOL v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v10 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneListeningMode:]";
      __int16 v11 = 2048;
      int64_t v12 = headphoneListeningMode;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s headphoneListeningMode changed from %ld to %ld",  buf,  0x20u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000DFD18;
    v8[3] = &unk_1004F6FF0;
    v8[4] = self;
    void v8[5] = headphoneListeningMode;
    v8[6] = a3;
    -[ADMobileBluetoothDeviceProxy _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v8);
  }

- (void)_fetchDeviceInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v9 = "-[ADMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:]";
      __int16 v10 = 2112;
      __int16 v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Fetching device info for %@...", buf, 0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000DF2A4;
    v6[3] = &unk_1004F09B8;
    v6[4] = self;
    id v7 = v4;
    -[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]( self,  "_accessBTDeviceAndAccessoryManagerUsingBlock:",  v6);
  }
}

- (void)_fetchHeadphoneInEarDetectionStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v9 = "-[ADMobileBluetoothDeviceProxy _fetchHeadphoneInEarDetectionStateWithCompletion:]";
      __int16 v10 = 2112;
      __int16 v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Fetching headphone in-ear detection state for %@...",  buf,  0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000DEED4;
    v6[3] = &unk_1004F09B8;
    v6[4] = self;
    id v7 = v4;
    -[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]( self,  "_accessBTDeviceAndAccessoryManagerUsingBlock:",  v6);
  }
}

- (void)_fetchHeadphoneListeningModeWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v9 = "-[ADMobileBluetoothDeviceProxy _fetchHeadphoneListeningModeWithCompletion:]";
      __int16 v10 = 2112;
      __int16 v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Fetching headphone listening mode for %@...",  buf,  0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000DEC08;
    v6[3] = &unk_1004F09B8;
    v6[4] = self;
    id v7 = v4;
    -[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]( self,  "_accessBTDeviceAndAccessoryManagerUsingBlock:",  v6);
  }
}

- (void)_changeHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "-[ADMobileBluetoothDeviceProxy _changeHeadphoneListeningMode:completion:]";
    __int16 v14 = 2048;
    int64_t v15 = a3;
    __int16 v16 = 2112;
    uint64_t v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Changing headphone listening mode to %ld for %@",  buf,  0x20u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000DE8D8;
  v9[3] = &unk_1004F0A48;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  -[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]( self,  "_accessBTDeviceAndAccessoryManagerUsingBlock:",  v9);
}

- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Getting BTDevice and BTAccessoryManager for %@...",  buf,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      deviceUID = self->_deviceUID;
      if (deviceUID)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000DE650;
        v15[3] = &unk_1004F09B8;
        v15[4] = self;
        id v16 = v4;
        [WeakRetained getBTDeviceWithDeviceUID:deviceUID completion:v15];
        id v8 = v16;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }

      address = self->_address;
      if (address)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000DE780;
        v13[3] = &unk_1004F09B8;
        v13[4] = self;
        id v14 = v4;
        [WeakRetained getBTDeviceWithAddress:address completion:v13];
        id v8 = v14;
        goto LABEL_13;
      }

      BOOL v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        __int16 v19 = 2112;
        id v20 = self;
        int64_t v12 = "%s Device UID and address of %@ are nil.";
LABEL_19:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }

    else
    {
      BOOL v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        __int16 v19 = 2112;
        id v20 = self;
        int64_t v12 = "%s Data source of %@ is nil.";
        goto LABEL_19;
      }
    }

    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed getting BTDevice and BTAccessoryManager for %@.",  buf,  0x16u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    goto LABEL_14;
  }

- (void)_invalidate
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v9 = "-[ADMobileBluetoothDeviceProxy _invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  objc_storeWeak((id *)&self->_dataSource, 0LL);
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0LL;

  headphoneInEarDetectionState = self->_headphoneInEarDetectionState;
  self->_headphoneInEarDetectionState = 0LL;

  self->_int64_t headphoneListeningMode = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DE604;
  v7[3] = &unk_1004F6F78;
  v7[4] = self;
  -[ADMobileBluetoothDeviceProxy _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v7);
  observers = self->_observers;
  self->_observers = 0LL;
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      id v7 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable setRepresentation](observers, "setRepresentation"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1000DE5F8;
      v8[3] = &unk_1004F7018;
      id v9 = v7;
      [v6 enumerateObjectsUsingBlock:v8];

      id v4 = v7;
    }
  }
}

- (NSString)address
{
  return self->_address;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (void).cxx_destruct
{
}

@end