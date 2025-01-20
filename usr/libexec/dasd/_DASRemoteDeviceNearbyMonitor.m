@interface _DASRemoteDeviceNearbyMonitor
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)isRemoteDeviceNearby:(id)a3;
- (BOOL)resetNearbyDevicesWithCurrentDevices:(id)a3;
- (NSMutableSet)nearbyDevices;
- (NSMutableSet)pendingWidgets;
- (NSSet)lastRegisteredDevices;
- (OS_dispatch_queue)queue;
- (OS_nw_browser)browser;
- (OS_nw_parameters)parameters;
- (_DASDaemon)daemon;
- (_DASRemoteDeviceNearbyMonitor)initWithDaemon:(id)a3;
- (id)createParameters;
- (id)remoteDevices;
- (id)setUpNetworkBrowserWithDevices:(id)a3;
- (os_unfair_lock_s)lock;
- (os_unfair_lock_s)pendingWidgetsLock;
- (void)protectedRegisterForRemoteDevices;
- (void)registerForRemoteDeviceWithActivity:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setLastRegisteredDevices:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPendingWidgets:(id)a3;
- (void)setPendingWidgetsLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setUpBrowserResultsChanged:(id)a3;
- (void)setUpBrowserStateChange:(id)a3;
- (void)unregisterForRemoteDeviceWithActivity:(id)a3;
- (void)updateDeviceLost:(id)a3;
- (void)updateDeviceNearby:(id)a3;
@end

@implementation _DASRemoteDeviceNearbyMonitor

- (_DASRemoteDeviceNearbyMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____DASRemoteDeviceNearbyMonitor;
  v6 = -[_DASRemoteDeviceNearbyMonitor init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nearbyRemoteMonitor.queue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    pendingWidgets = v7->_pendingWidgets;
    v7->_pendingWidgets = (NSMutableSet *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    nearbyDevices = v7->_nearbyDevices;
    v7->_nearbyDevices = (NSMutableSet *)v14;

    *(void *)&v7->_lock._os_unfair_lock_opaque = 0LL;
  }

  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000123C4;
  block[3] = &unk_1001150D0;
  id v8 = a3;
  uint64_t v3 = qword_100157518;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_100157518, block);
  }
  id v5 = (id)qword_100157520;

  return v5;
}

- (id)remoteDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor pendingWidgets](self, "pendingWidgets", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteDevice]);

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteDevice]);
          [v3 addObject:v11];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)registerForRemoteDeviceWithActivity:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v8 remoteDevice]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v8 targetDevice];

    if (v6 == (id)3)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000125F8;
      block[3] = &unk_100115148;
      void block[4] = self;
      id v10 = v8;
      dispatch_sync(queue, block);
    }
  }
}

- (void)unregisterForRemoteDeviceWithActivity:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v8 remoteDevice]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v8 targetDevice];

    if (v6 == (id)3)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100012700;
      block[3] = &unk_100115148;
      void block[4] = self;
      id v10 = v8;
      dispatch_sync(queue, block);
    }
  }
}

- (void)updateDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1224();
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
  unsigned int v8 = [v7 containsObject:v4];

  if (v8)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Remote Device %@ is no longer nearby",  (uint8_t *)&v11,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
    [v10 removeObject:v4];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)updateDeviceNearby:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1284();
  }

  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
  [v6 addObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000129E0;
  v10[3] = &unk_100115148;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (BOOL)isRemoteDeviceNearby:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
  unsigned __int8 v7 = [v6 containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)resetNearbyDevicesWithCurrentDevices:(id)a3
{
  id v4 = a3;
  id v5 = -[NSSet mutableCopy](self->_lastRegisteredDevices, "mutableCopy");
  objc_super v17 = v4;
  [v5 minusSet:v4];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        os_unfair_lock_lock(&self->_lock);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
        unsigned int v13 = [v12 containsObject:v11];

        if (v13)
        {
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Setting %@ to not nearby", buf, 0xCu);
          }

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
          [v15 removeObject:v11];
        }

        os_unfair_lock_unlock(&self->_lock);
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  return 1;
}

- (void)protectedRegisterForRemoteDevices
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor remoteDevices](self, "remoteDevices"));
  if ([v4 isEqualToSet:self->_lastRegisteredDevices])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000B12E4();
    }
    goto LABEL_13;
  }

  -[_DASRemoteDeviceNearbyMonitor resetNearbyDevicesWithCurrentDevices:]( self,  "resetNearbyDevicesWithCurrentDevices:",  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));

  if (v6)
  {
    id v7 = (nw_browser *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));
    nw_browser_set_browse_results_changed_handler(v7, 0LL);

    id v8 = (nw_browser *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));
    nw_browser_set_state_changed_handler(v8, 0LL);

    uint64_t v9 = (nw_browser *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));
    nw_browser_cancel(v9);

    -[_DASRemoteDeviceNearbyMonitor setBrowser:](self, "setBrowser:", 0LL);
    -[_DASRemoteDeviceNearbyMonitor setLastRegisteredDevices:](self, "setLastRegisteredDevices:", 0LL);
  }

  if (![v4 count]) {
    goto LABEL_9;
  }
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor setUpNetworkBrowserWithDevices:](self, "setUpNetworkBrowserWithDevices:", v4));
  if (v10)
  {
    uint64_t v11 = (nw_browser *)v10;
    -[_DASRemoteDeviceNearbyMonitor setUpBrowserStateChange:](self, "setUpBrowserStateChange:", v10);
    -[_DASRemoteDeviceNearbyMonitor setUpBrowserResultsChanged:](self, "setUpBrowserResultsChanged:", v11);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor queue](self, "queue"));
    nw_browser_set_queue(v11, v12);

    nw_browser_start(v11);
    -[_DASRemoteDeviceNearbyMonitor setBrowser:](self, "setBrowser:", v11);

LABEL_9:
    -[_DASRemoteDeviceNearbyMonitor setLastRegisteredDevices:](self, "setLastRegisteredDevices:", v4);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int128 v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Create browser to monitor %@",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_13;
  }

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000B131C();
  }
LABEL_13:
}

- (id)createParameters
{
  nw_parameters_t application_service = nw_parameters_create_application_service();
  nw_parameters_set_include_screen_off_devices(application_service, 1LL);
  nw_parameters_set_include_ble(application_service, 1LL);
  xpc_object_t v3 = xpc_array_create(0LL, 0LL);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, off_1001567A8);
  xpc_object_t v4 = xpc_array_create(0LL, 0LL);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, off_1001567B0);
  nw_parameters_set_required_netagent_classes(application_service, v3, v4);
  xpc_object_t v5 = xpc_array_create(0LL, 0LL);
  xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, 0x3E9uLL);
  nw_parameters_set_preferred_interface_subtypes(application_service, v5);
  if (application_service)
  {
    id v6 = application_service;
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B137C();
    }
  }

  return application_service;
}

- (id)setUpNetworkBrowserWithDevices:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor parameters](self, "parameters"));

  if (v5
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor createParameters](self, "createParameters")),
        -[_DASRemoteDeviceNearbyMonitor setParameters:](self, "setParameters:", v6),
        v6,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor parameters](self, "parameters")),
        v7,
        v7))
  {
    nw_parameters_t application_service = nw_browse_descriptor_create_application_service(off_1001567A0);
    nw_browse_descriptor_set_browse_scope(application_service, 1LL);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        int v13 = 0LL;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v19 + 1) + 8LL * (void)v13);
          id v15 = objc_msgSend(v14, "UTF8String", (void)v19);
          if (v15) {
            nw_browse_descriptor_add_device_filter(application_service, v15);
          }
          int v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v11);
    }

    __int128 v16 = (nw_parameters *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor parameters](self, "parameters"));
    nw_browser_t v17 = nw_browser_create(application_service, v16);
  }

  else
  {
    nw_browser_t v17 = 0LL;
  }

  return v17;
}

- (void)setUpBrowserResultsChanged:(id)a3
{
  id v4 = (nw_browser *)a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100013424;
  v5[3] = &unk_1001151D8;
  objc_copyWeak(&v6, &location);
  nw_browser_set_browse_results_changed_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setUpBrowserStateChange:(id)a3
{
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableSet)pendingWidgets
{
  return self->_pendingWidgets;
}

- (void)setPendingWidgets:(id)a3
{
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSSet)lastRegisteredDevices
{
  return self->_lastRegisteredDevices;
}

- (void)setLastRegisteredDevices:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)pendingWidgetsLock
{
  return self->_pendingWidgetsLock;
}

- (void)setPendingWidgetsLock:(os_unfair_lock_s)a3
{
  self->_pendingWidgetsLock = a3;
}

- (void).cxx_destruct
{
}

@end