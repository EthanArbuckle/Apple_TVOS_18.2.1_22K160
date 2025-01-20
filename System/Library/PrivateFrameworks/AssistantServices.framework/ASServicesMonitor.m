@interface ASServicesMonitor
- (ASServicesMonitor)init;
- (ASServicesMonitorDelegate)delegate;
- (id)_pendingServiceBundlesToReload;
- (id)keepAliveWithReplyHandler:(id)a3;
- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 completion:(id)a5;
- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 syncSnapshotCompletion:(id)a5;
- (void)__CRASH_DUE_TO_STUCK_PLUGIN__;
- (void)_reloadPendingServiceBundles;
- (void)_restartDueToStuckPluginAtPath:(id)a3;
- (void)_restartProcessIfNeeded;
- (void)decrementKeepAliveCount;
- (void)incrementKeepAliveCount;
- (void)reloadServiceBundleAtPath:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ASServicesMonitor

- (id)_pendingServiceBundlesToReload
{
  pendingServiceBundlesToReload = self->_pendingServiceBundlesToReload;
  if (!pendingServiceBundlesToReload)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v5 = self->_pendingServiceBundlesToReload;
    self->_pendingServiceBundlesToReload = v4;

    pendingServiceBundlesToReload = self->_pendingServiceBundlesToReload;
  }

  return pendingServiceBundlesToReload;
}

- (ASServicesMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ASServicesMonitor;
  v2 = -[ASServicesMonitor init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.service.watchdog", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)incrementKeepAliveCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000814C;
  block[3] = &unk_1000146A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)decrementKeepAliveCount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008068;
  block[3] = &unk_1000146A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_restartProcessIfNeeded
{
  if (self->_abortMethod)
  {
    if (!self->_keepAliveCount)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      stuckPluginPath = self->_stuckPluginPath;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100008034;
      v5[3] = &unk_1000146A8;
      v5[4] = self;
      [WeakRetained serviceMonitorWillCrashAssistantServiceDueToPluginAtPath:stuckPluginPath reply:v5];
    }
  }

- (void)__CRASH_DUE_TO_STUCK_PLUGIN__
{
  v2 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[ASServicesMonitor __CRASH_DUE_TO_STUCK_PLUGIN__]";
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v3, 0xCu);
  }

  exit(1);
}

- (void)_restartDueToStuckPluginAtPath:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Stuck sync plugin: %@",  v5));
  dispatch_queue_t v7 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v10 = "-[ASServicesMonitor _restartDueToStuckPluginAtPath:]";
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  stuckPluginPath = self->_stuckPluginPath;
  self->_stuckPluginPath = (NSString *)v4;

  self->_abortMethod = "__CRASH_DUE_TO_STUCK_PLUGIN__";
  -[ASServicesMonitor _restartProcessIfNeeded](self, "_restartProcessIfNeeded");
}

- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100007EA4;
  v24[3] = &unk_100014900;
  id v13 = v8;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  v27 = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100007F74;
  v21[3] = &unk_100014608;
  id v15 = [v11 initWithTimeoutInterval:queue onQueue:v24 timeoutHandler:567.0];
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  v17 = objc_retainBlock(v21);
  v18 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ASServicesMonitor startWatchdogForPluginAtPath:syncClassName:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Starting watchdog timer", buf, 0xCu);
  }

  [v15 start];
  v19 = objc_retainBlock(v17);

  return v19;
}

- (id)startWatchdogForPluginAtPath:(id)a3 syncClassName:(id)a4 syncSnapshotCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100007CFC;
  v24[3] = &unk_100014900;
  id v13 = v8;
  id v25 = v13;
  id v14 = v9;
  id v26 = v14;
  v27 = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100007DCC;
  v21[3] = &unk_1000144D8;
  id v15 = [v11 initWithTimeoutInterval:queue onQueue:v24 timeoutHandler:567.0];
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  v17 = objc_retainBlock(v21);
  v18 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ASServicesMonitor startWatchdogForPluginAtPath:syncClassName:syncSnapshotCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Starting watchdog timer", buf, 0xCu);
  }

  [v15 start];
  v19 = objc_retainBlock(v17);

  return v19;
}

- (id)keepAliveWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ASServicesMonitor keepAliveWithReplyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  -[ASServicesMonitor incrementKeepAliveCount](self, "incrementKeepAliveCount");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007C54;
  v9[3] = &unk_100014500;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_queue_t v7 = objc_retainBlock(v9);

  return v7;
}

- (void)reloadServiceBundleAtPath:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ASServicesMonitor reloadServiceBundleAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v4));
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASServicesMonitor _pendingServiceBundlesToReload](self, "_pendingServiceBundlesToReload"));
  [v7 addObject:v6];

  unint64_t keepAliveCount = self->_keepAliveCount;
  if (keepAliveCount)
  {
    id v9 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ASServicesMonitor reloadServiceBundleAtPath:]";
      __int16 v12 = 2048;
      unint64_t v13 = keepAliveCount;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s There are %ld alive counts, will defer reload until it hits zero",  (uint8_t *)&v10,  0x16u);
    }
  }

  else
  {
    -[ASServicesMonitor _reloadPendingServiceBundles](self, "_reloadPendingServiceBundles");
  }
}

- (void)_reloadPendingServiceBundles
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASServicesMonitor _pendingServiceBundlesToReload](self, "_pendingServiceBundlesToReload"));
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_queue_t v7 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned __int8 v8 = [v7 isLoaded];
        id v9 = (void *)AFSiriLogContextService;
        BOOL v10 = os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO);
        if ((v8 & 1) != 0)
        {
          if (v10)
          {
            id v14 = v9;
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 bundlePath]);
            *(_DWORD *)buf = 136315394;
            id v22 = "-[ASServicesMonitor _reloadPendingServiceBundles]";
            __int16 v23 = 2114;
            v24 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Reloading service at path: %{public}@ (Note: at this point, we're just killing assistant_service, not r eally reloading anything. See enhancement request <rdar://problem/48655714> for details)",  buf,  0x16u);
          }

          exit(0);
        }

        if (v10)
        {
          id v11 = v9;
          __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bundlePath]);
          *(_DWORD *)buf = 136315394;
          id v22 = "-[ASServicesMonitor _reloadPendingServiceBundles]";
          __int16 v23 = 2114;
          v24 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Service at path (%{public}@) hasn't been loaded before, no need to reload",  buf,  0x16u);
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v4);
  }

  pendingServiceBundlesToReload = self->_pendingServiceBundlesToReload;
  self->_pendingServiceBundlesToReload = 0LL;
}

- (ASServicesMonitorDelegate)delegate
{
  return (ASServicesMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end