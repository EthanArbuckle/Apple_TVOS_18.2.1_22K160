@interface CSMockRemotePlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSMockRemotePlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (NSMutableDictionary)deviceDictionary;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_os_log)logger;
- (void)createMockRemoteDeviceWithName:(id)a3 deviceID:(id)a4 completion:(id)a5;
- (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4;
- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)listMockRemoteDeviecesWithCompletion:(id)a3;
- (void)listen;
- (void)publishDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceDictionary:(id)a3;
- (void)setListener:(id)a3;
- (void)setLogger:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSMockRemotePlugin

- (CSMockRemotePlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSMockRemotePlugin;
  v5 = -[CSMockRemotePlugin init](&v13, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("CSMockRemotePlugin", 0LL);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    os_log_t v8 = os_log_create("com.apple.corespeech", "remote_mock_plugin");
    logger = v5->_logger;
    v5->_logger = v8;

    -[CSMockRemotePlugin setDelegate:](v5, "setDelegate:", v4);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceDictionary = v5->_deviceDictionary;
    v5->_deviceDictionary = v10;

    -[CSMockRemotePlugin listen](v5, "listen");
  }

  return v5;
}

- (NSArray)devices
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_3CFC;
  v10 = sub_3D0C;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3D14;
  v5[3] = &unk_82B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)listen
{
  id v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", kCSMockRemotePluginServiceName);
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, logger, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginXPCListener start listening", v7, 2u);
  }

- (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_0, logger, OS_LOG_TYPE_DEFAULT, "Request disconnect device with UUID %@", buf, 0xCu);
  }

  if (!v6)
  {
    v10 = self->_logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "input device uuid is nil", buf, 2u);
      if (!v7) {
        goto LABEL_8;
      }
    }

    else if (!v7)
    {
      goto LABEL_8;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1651LL,  0LL));
    v7[2](v7, 0LL, v11);

    goto LABEL_8;
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3B18;
  block[3] = &unk_82E0;
  block[4] = self;
  id v13 = v6;
  v14 = v7;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_8:
}

- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_0, logger, OS_LOG_TYPE_DEFAULT, "Request inject audio %@ into device with UUID %@", buf, 0x16u);
  }

  v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 URLForResource:v14 withExtension:0]);

  if (!v15
    || (id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 path]),
        unsigned __int8 v18 = [v16 fileExistsAtPath:v17],
        v17,
        v16,
        (v18 & 1) == 0))
  {
    v20 = self->_logger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v15;
      _os_log_error_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "Audio url %@ is nil, or url not existing in path",  buf,  0xCu);
      if (!v10) {
        goto LABEL_9;
      }
    }

    else if (!v10)
    {
      goto LABEL_9;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    (*((void (**)(id, void, void *, void, void))v10 + 2))(v10, 0LL, v21, 0LL, 0LL);

    goto LABEL_9;
  }

  queue = self->_queue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_37EC;
  v22[3] = &unk_8358;
  v22[4] = self;
  id v23 = v9;
  id v25 = v10;
  id v24 = v15;
  dispatch_async((dispatch_queue_t)queue, v22);

LABEL_9:
}

- (void)invalidate
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, logger, OS_LOG_TYPE_DEFAULT, "Invalidating Mock Remote Plugin", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_36EC;
  block[3] = &unk_8380;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)publishDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_3668;
  v7[3] = &unk_83A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)createMockRemoteDeviceWithName:(id)a3 deviceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void, void *))a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v45 = v8;
    __int16 v46 = 2112;
    id v47 = v9;
    _os_log_impl( &dword_0,  logger,  OS_LOG_TYPE_DEFAULT,  "Request to init device with deviceName : %@, deviceId : %@",  buf,  0x16u);
  }

  v34 = v9;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceDictionary, "allKeys"));
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      id v16 = 0LL;
      id v35 = v14;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceDictionary,  "objectForKey:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)v16)));
        unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceName]);
        unsigned int v19 = [v18 isEqualToString:v8];

        if (v19)
        {
          v20 = self->_logger;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceName]);
            uint64_t v23 = v15;
            id v24 = self;
            id v25 = v10;
            id v26 = v8;
            id v27 = v12;
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceUUID]);
            *(_DWORD *)buf = 138412546;
            id v45 = v22;
            __int16 v46 = 2112;
            id v47 = v28;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "DeviceName %@ with UUID already exits%@", buf, 0x16u);

            v12 = v27;
            id v8 = v26;
            id v10 = v25;
            self = v24;
            uint64_t v15 = v23;
            id v14 = v35;
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceUUID]);
          v10[2](v10, 1LL, 0LL, v29);
        }

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v14);
  }

  v30 = -[CSMockRemoteDevice initWithDeviceName:]( objc_alloc(&OBJC_CLASS___CSMockRemoteDevice),  "initWithDeviceName:",  v8);
  v31 = v30;
  if (v30)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_363C;
    block[3] = &unk_83A8;
    v37 = v30;
    v38 = self;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  if (v10)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSMockRemoteDevice deviceUUID](v31, "deviceUUID"));
    v10[2](v10, 1LL, 0LL, v33);
  }
}

- (void)listMockRemoteDeviecesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableDictionary count](self->_deviceDictionary, "count"))
  {
    v20 = v4;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v6 = self->_deviceDictionary;
    id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deviceDictionary,  "objectForKey:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i)));
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceName]);
          -[NSMutableArray addObject:](v5, "addObject:", v12);

          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUUID]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
          -[NSMutableArray addObject:](v5, "addObject:", v14);

          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = logger;
            v17 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceName]);
            unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUUID]);
            *(_DWORD *)buf = 138412546;
            id v26 = v17;
            __int16 v27 = 2112;
            __int16 v28 = v18;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "DeviceName %@ with UUID %@", buf, 0x16u);
          }
        }

        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
      }

      while (v8);
    }

    id v4 = v20;
  }

  else
  {
    unsigned int v19 = self->_logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "No devices to list", buf, 2u);
    }
  }

  if (v4) {
    v4[2](v4, v5);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_listener == v6)
  {
    id v10 = MockRemotePluginXPCGetInterface();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v7 setExportedInterface:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:kCSMockRemotePluginServiceName]);
    if (v12)
    {
      [v7 setExportedObject:self];
      [v7 resume];
      BOOL v9 = 1;
      goto LABEL_7;
    }

    [v7 invalidate];
  }

  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_0, logger, OS_LOG_TYPE_ERROR, "we got unknown types of XPC connection request", v14, 2u);
    }
  }

  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (AVAudioRemoteInputPluginDelegate)delegate
{
  return (AVAudioRemoteInputPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)deviceDictionary
{
  return self->_deviceDictionary;
}

- (void)setDeviceDictionary:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end