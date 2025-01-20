@interface USBListener
- (BOOL)active;
- (BOOL)addDisconnectHandler:(id)a3;
- (BOOL)startOnQueue:(id)a3;
- (NSMutableArray)disconnectHandlers;
- (OS_os_log)log;
- (OS_remote_device_browser)browser;
- (USBListener)init;
- (void)dealloc;
- (void)dispatchDisconnectListeners;
- (void)setActive:(BOOL)a3;
- (void)setBrowser:(id)a3;
- (void)setDisconnectHandlers:(id)a3;
@end

@implementation USBListener

- (USBListener)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___USBListener;
  v2 = -[USBListener init](&v11, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_6:

    return 0LL;
  }

  browser = v2->_browser;
  v2->_browser = 0LL;

  v3->_active = 0;
  os_log_t v5 = os_log_create("com.apple.dt.remotepairing", "usblistener");
  log = v3->_log;
  v3->_log = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  disconnectHandlers = v3->_disconnectHandlers;
  v3->_disconnectHandlers = v7;

  if (!v3->_disconnectHandlers)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[USBListener log](v3, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10005FB74();
    }

    goto LABEL_6;
  }

  return v3;
}

- (BOOL)startOnQueue:(id)a3
{
  id v4 = a3;
  os_log_t v5 = v4;
  if (!v4)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[USBListener log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10005FBA0();
    }
    goto LABEL_8;
  }

  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_10000DFF8;
  v14 = &unk_1000762E0;
  v15 = self;
  id v16 = v4;
  started = (void *)remote_device_start_browsing(9LL, v16, &v11);
  -[USBListener setBrowser:](self, "setBrowser:", started, v11, v12, v13, v14, v15);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener browser](self, "browser"));
  if (!v7)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[USBListener log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10005FBCC();
    }
LABEL_8:

    BOOL v8 = 0;
    goto LABEL_9;
  }

  BOOL v8 = 1;
  -[USBListener setActive:](self, "setActive:", 1LL);
LABEL_9:

  return v8;
}

- (BOOL)addDisconnectHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers"));
    id v7 = [v4 copy];
    id v8 = objc_retainBlock(v7);
    [v6 addObject:v8];

    objc_sync_exit(v5);
  }

  else
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener log](self, "log"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10005FBA0();
    }
  }

  return v4 != 0LL;
}

- (void)dispatchDisconnectListeners
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers"));
  objc_sync_enter(v3);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7) + 16LL))();
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)dealloc
{
  self->_active = 0;
  remote_device_browser_cancel(self->_browser, a2);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___USBListener;
  -[USBListener dealloc](&v3, "dealloc");
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (OS_remote_device_browser)browser
{
  return (OS_remote_device_browser *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBrowser:(id)a3
{
}

- (NSMutableArray)disconnectHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDisconnectHandlers:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end