@interface MRAPInputPlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (MRAPInputPlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (id)_inputDeviceWithIdentifier:(unsigned int)a3;
- (void)_reloadInputDevices;
- (void)dealloc;
- (void)invalidate;
- (void)recordingEndpoint:(id)a3 inputDeviceConnectedWithID:(unsigned int)a4;
- (void)recordingEndpoint:(id)a3 inputDeviceDisconnectedWithID:(unsigned int)a4;
- (void)recordingEndpoint:(id)a3 inputDeviceWithID:(unsigned int)a4 receivedAudioBuffer:(void *)a5 withTime:(id)a6 gain:(float)a7;
@end

@implementation MRAPInputPlugin

- (MRAPInputPlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MRAPInputPlugin;
  v6 = -[MRAPInputPlugin init](&v18, "init");
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(5LL, v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Plugin loaded", v17, 2u);
    }

    objc_storeWeak((id *)&v6->_delegate, v4);
    v9 = (objc_class *)objc_opt_class(v6);
    Name = class_getName(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create(Name, v12);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRAPRecordingEndpoint sharedEndpoint](&OBJC_CLASS___MRAPRecordingEndpoint, "sharedEndpoint"));
    [v15 addDelegate:v6];
    -[MRAPInputPlugin _reloadInputDevices](v6, "_reloadInputDevices");
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRAPRecordingEndpoint sharedEndpoint](&OBJC_CLASS___MRAPRecordingEndpoint, "sharedEndpoint"));
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRAPInputPlugin;
  -[MRAPInputPlugin dealloc](&v4, "dealloc");
}

- (NSArray)devices
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_552C;
  v10 = sub_553C;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5544;
  v5[3] = &unk_8320;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)invalidate
{
  uint64_t v3 = _MRLogForCategory(5LL, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Plugin invalidated", buf, 2u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_5644;
  block[3] = &unk_82D0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRAPRecordingEndpoint sharedEndpoint](&OBJC_CLASS___MRAPRecordingEndpoint, "sharedEndpoint"));
  [v6 removeDelegate:self];
}

- (void)recordingEndpoint:(id)a3 inputDeviceConnectedWithID:(unsigned int)a4
{
  uint64_t v6 = _MRLogForCategory(5LL, a2);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Device with ID %u connected", (uint8_t *)v8, 8u);
  }

  -[MRAPInputPlugin _reloadInputDevices](self, "_reloadInputDevices");
}

- (void)recordingEndpoint:(id)a3 inputDeviceDisconnectedWithID:(unsigned int)a4
{
  uint64_t v6 = _MRLogForCategory(5LL, a2);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Device with ID %u disconnected", (uint8_t *)v8, 8u);
  }

  -[MRAPInputPlugin _reloadInputDevices](self, "_reloadInputDevices");
}

- (void)recordingEndpoint:(id)a3 inputDeviceWithID:(unsigned int)a4 receivedAudioBuffer:(void *)a5 withTime:(id)a6 gain:(float)a7
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRAPInputPlugin _inputDeviceWithIdentifier:](self, "_inputDeviceWithIdentifier:", *(void *)&a4));
  v15 = v12;
  if (v12)
  {
    *(float *)&double v14 = a7;
    objc_msgSend(v12, "processVoiceDataWithBuffer:time:gain:", a5, var0, var1, v14);
  }

  else
  {
    uint64_t v16 = _MRLogForCategory(5LL, v13);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_6340(a4, v17);
    }
  }
}

- (void)_reloadInputDevices
{
  uint64_t v3 = _MRLogForCategory(5LL, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Reloading input devices...", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_5914;
  v6[3] = &unk_8390;
  v6[4] = self;
  MRVirtualVoiceInputGetDevices(serialQueue, v6);
}

- (id)_inputDeviceWithIdentifier:(unsigned int)a3
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_552C;
  v12 = sub_553C;
  id v13 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_5EB8;
  block[3] = &unk_83B8;
  unsigned int v7 = a3;
  block[4] = self;
  void block[5] = &v8;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (AVAudioRemoteInputPluginDelegate)delegate
{
  return (AVAudioRemoteInputPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end