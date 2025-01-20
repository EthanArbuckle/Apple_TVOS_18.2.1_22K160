@interface PCSDeviceManager
+ (id)sharedManager;
- (NSArray)allDevices;
- (NSMutableDictionary)devices;
- (OS_dispatch_queue)internalQueue;
- (PCSDevice)activePairedDevice;
- (PCSDeviceManager)init;
- (PCSDeviceManagerDelegate)delegate;
- (id)currentActivePairedDevice;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForPairingID:(id)a3;
- (void)setActivePairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PCSDeviceManager

+ (id)sharedManager
{
  if (qword_10002BD70 != -1) {
    dispatch_once(&qword_10002BD70, &stru_100024A30);
  }
  return (id)qword_10002BD68;
}

- (PCSDeviceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PCSDeviceManager;
  v2 = -[PCSDeviceManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    devices = v2->_devices;
    v2->_devices = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appconduitd.PCSDeviceManager.internal", 0LL);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (id)currentActivePairedDevice
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_100006A80;
  v14 = sub_100006A90;
  id v15 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDeviceManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006A98;
  block[3] = &unk_100024A10;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v3, block);

  v4 = (void *)v11[5];
  if (!v4)
  {
    dispatch_queue_t v5 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No active paired device", v8, 2u);
    }

    v4 = (void *)v11[5];
  }

  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_100006A80;
  v18 = sub_100006A90;
  id v19 = 0LL;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDeviceManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006C6C;
  block[3] = &unk_100024A58;
  v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v15[5];
  if (!v7)
  {
    objc_super v8 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No IDS Device registered with identifier %@",  buf,  0xCu);
    }

    v7 = (void *)v15[5];
  }

  id v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)deviceForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_100006A80;
  v18 = sub_100006A90;
  id v19 = 0LL;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDeviceManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006E5C;
  block[3] = &unk_100024A80;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  dispatch_sync(v5, block);

  v7 = (void *)v15[5];
  if (!v7)
  {
    objc_super v8 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to find device with pairing ID %@",  buf,  0xCu);
    }

    v7 = (void *)v15[5];
  }

  id v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (NSArray)allDevices
{
  uint64_t v7 = 0LL;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_100006A80;
  v11 = sub_100006A90;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDeviceManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007080;
  v6[3] = &unk_100024A10;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (PCSDeviceManagerDelegate)delegate
{
  return (PCSDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (PCSDevice)activePairedDevice
{
  return (PCSDevice *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActivePairedDevice:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end