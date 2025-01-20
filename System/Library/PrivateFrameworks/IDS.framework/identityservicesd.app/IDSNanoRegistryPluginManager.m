@interface IDSNanoRegistryPluginManager
+ (id)sharedInstance;
- (BOOL)isAdvertising;
- (BOOL)pluginImplementsWatchDidStartAdvertising;
- (BOOL)pluginImplementsWatchDidStopAdvertising;
- (IDSNanoRegistryPluginManager)init;
- (IDSPluginNanoRegistryProtocol)plugin;
- (NSMutableArray)peripheralManagers;
- (OS_dispatch_queue)callbackQueue;
- (void)_initializePlugin;
- (void)_initializePluginWithClass:(Class)a3;
- (void)executeSynchronouslyOnCallbackQueue:(id)a3;
- (void)initializePluginWithClass:(Class)a3;
- (void)notifyWatchDidStartAdvertisingWithPeripheralManager:(id)a3;
- (void)notifyWatchDidStopAdvertisingWithPeripheralManager:(id)a3;
- (void)notifyWatchToStartAdvertising;
- (void)notifyWatchToStopAdvertising;
- (void)setCallbackQueue:(id)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setPeripheralManagers:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPluginImplementsWatchDidStartAdvertising:(BOOL)a3;
- (void)setPluginImplementsWatchDidStopAdvertising:(BOOL)a3;
@end

@implementation IDSNanoRegistryPluginManager

+ (id)sharedInstance
{
  if (qword_1009BE880 != -1) {
    dispatch_once(&qword_1009BE880, &stru_1008F7CC0);
  }
  return (id)qword_1009BE878;
}

- (IDSNanoRegistryPluginManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSNanoRegistryPluginManager;
  v2 = -[IDSNanoRegistryPluginManager init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.IDS.IDSNanoRegistryPluginManager.callbackQ", v4);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    v7 = (dispatch_queue_s *)v2->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004DA80;
    block[3] = &unk_1008F6010;
    v10 = v2;
    dispatch_async(v7, block);
  }

  return v2;
}

- (void)notifyWatchDidStartAdvertisingWithPeripheralManager:(id)a3
{
  id v4 = a3;
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004DB38;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

- (void)notifyWatchToStartAdvertising
{
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004DC08;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)notifyWatchDidStopAdvertisingWithPeripheralManager:(id)a3
{
  id v4 = a3;
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004DDFC;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

- (void)notifyWatchToStopAdvertising
{
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004DEE0;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)initializePluginWithClass:(Class)a3
{
  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004E0AC;
  v4[3] = &unk_1008F7CE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(callbackQueue, v4);
}

- (void)executeSynchronouslyOnCallbackQueue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    block[1] = 3221225472LL;
    block[2] = sub_10004E134;
    block[3] = &unk_1008F6330;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(callbackQueue, block);

    id v4 = v6;
  }
}

- (void)_initializePlugin
{
  dispatch_queue_attr_t v3 = -[NSBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSBundle),  "initWithPath:",  @"/System/Library/IdentityServices/Plugins/com.apple.NanoRegistry.bundle");
  id v4 = v3;
  if (v3)
  {
    dispatch_queue_t v5 = -[NSBundle principalClass](v3, "principalClass");
    if (v5)
    {
      -[IDSNanoRegistryPluginManager _initializePluginWithClass:](self, "_initializePluginWithClass:", v5);
      goto LABEL_15;
    }

    uint64_t v10 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Bundle has no principal class", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
    {
      v9 = @"Bundle has no principal class";
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to initialize bundle", v13, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
    {
      v9 = @"Failed to initialize bundle";
LABEL_14:
      _IDSLogV(0LL, @"IDSFoundation", @"IDSNanoRegistryPluginManager", v9);
    }
  }

- (void)_initializePluginWithClass:(Class)a3
{
  dispatch_queue_t v5 = &OBJC_PROTOCOL___IDSPluginNanoRegistryProtocol;
  uint64_t v6 = v5;
  if (a3)
  {
    if (v5)
    {
      if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", v5))
      {
        v7 = (IDSPluginNanoRegistryProtocol *)objc_alloc_init(a3);
        plugin = self->_plugin;
        self->_plugin = v7;

        if (self->_plugin)
        {
          uint64_t v9 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Plugin initialized successfully",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v11)
            && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNanoRegistryPluginManager",  @"Plugin initialized successfully");
          }

          if ((objc_opt_respondsToSelector(self->_plugin, "watchDidStartAdvertising") & 1) != 0) {
            self->_pluginImplementsWatchDidStartAdvertising = 1;
          }
          if ((objc_opt_respondsToSelector(self->_plugin, "watchDidStopAdvertising") & 1) != 0)
          {
            self->_pluginImplementsWatchDidStopAdvertising = 1;
          }

          else if (!self->_pluginImplementsWatchDidStopAdvertising && !self->_pluginImplementsWatchDidStartAdvertising)
          {
            uint64_t v24 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Plugin does not respond to any useful messages",  buf,  2u);
            }

            if (os_log_shim_legacy_logging_enabled(v26)
              && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
            {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNanoRegistryPluginManager",  @"Plugin does not respond to any useful messages");
            }
          }
        }

        else
        {
          uint64_t v21 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Plugin failed to initialize", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled(v23)
            && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNanoRegistryPluginManager",  @"Plugin failed to initialize");
          }
        }
      }

      else
      {
        uint64_t v18 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          Name = class_getName(a3);
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Plugin class %{public}s does not conform to protocol",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v20)
          && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
        {
          class_getName(a3);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNanoRegistryPluginManager",  @"Plugin class %{public}s does not conform to protocol");
        }
      }
    }

    else
    {
      uint64_t v15 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Protocol is nil", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v17)
        && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"IDSNanoRegistryPluginManager", @"Protocol is nil");
      }
    }
  }

  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory("IDSNanoRegistryPluginManager");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Plugin class is nil", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(0LL, @"IDSNanoRegistryPluginManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"IDSNanoRegistryPluginManager", @"Plugin class is nil");
    }
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (BOOL)pluginImplementsWatchDidStartAdvertising
{
  return self->_pluginImplementsWatchDidStartAdvertising;
}

- (void)setPluginImplementsWatchDidStartAdvertising:(BOOL)a3
{
  self->_pluginImplementsWatchDidStartAdvertising = a3;
}

- (BOOL)pluginImplementsWatchDidStopAdvertising
{
  return self->_pluginImplementsWatchDidStopAdvertising;
}

- (void)setPluginImplementsWatchDidStopAdvertising:(BOOL)a3
{
  self->_pluginImplementsWatchDidStopAdvertising = a3;
}

- (NSMutableArray)peripheralManagers
{
  return self->_peripheralManagers;
}

- (void)setPeripheralManagers:(id)a3
{
}

- (IDSPluginNanoRegistryProtocol)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (void).cxx_destruct
{
}

@end