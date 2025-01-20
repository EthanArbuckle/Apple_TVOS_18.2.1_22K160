@interface MCMVolumeChangeMonitor
- (BOOL)started;
- (MCMVolumeChangeMonitor)initWithWorkloop:(id)a3 mountPointURL:(id)a4;
- (NSHashTable)observers;
- (NSURL)mountPointURL;
- (OS_dispatch_queue)notificationQueue;
- (id)_volumesToMonitor;
- (unint64_t)_changeEventStart:(unint64_t)a3 end:(unint64_t)a4 targetActiveState:(unint64_t)a5 fromOldState:(unint64_t)a6 newState:(unint64_t)a7;
- (unint64_t)state;
- (void)_callbackWithVolume:(unsigned int)a3 notificationType:(unsigned int)a4 margs:(void *)a5;
- (void)_notifyObserver:(id)a3 events:(unint64_t)a4 newVolumeState:(unint64_t)a5;
- (void)_notifyObserversIfNeededWithOldState:(unint64_t)a3 newState:(unint64_t)a4;
- (void)_notifyObserversOfEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)start;
@end

@implementation MCMVolumeChangeMonitor

- (MCMVolumeChangeMonitor)initWithWorkloop:(id)a3 mountPointURL:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v6 = (dispatch_queue_s *)a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMVolumeChangeMonitor;
  v8 = -[MCMVolumeChangeMonitor init](&v16, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.volume_change_notification", v10, v6);
    notificationQueue = v8->_notificationQueue;
    v8->_notificationQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v13;

    objc_storeStrong((id *)&v8->_mountPointURL, a4);
    v8->_state = 0LL;
    v8->_notifier = 0;
  }

  return v8;
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  v4 = -[MCMVolumeChangeMonitor observers](self, "observers");
  objc_sync_enter(v4);
  v5 = -[MCMVolumeChangeMonitor observers](self, "observers");
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  v4 = -[MCMVolumeChangeMonitor observers](self, "observers");
  objc_sync_enter(v4);
  v5 = -[MCMVolumeChangeMonitor observers](self, "observers");
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)start
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (!-[MCMVolumeChangeMonitor started](self, "started"))
  {
    -[MCMVolumeChangeMonitor setStarted:](self, "setStarted:", 1LL);
    v3 = -[MCMVolumeChangeMonitor _volumesToMonitor](self, "_volumesToMonitor");
    mach_port_t v4 = *MEMORY[0x1896086A8];
    IONotificationPortRef v5 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
    if (!v5)
    {
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v36 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      int v33 = 134217984;
      uint64_t v34 = 0LL;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }

    id v6 = v5;
    v27 = self;
    -[MCMVolumeChangeMonitor notificationQueue](self, "notificationQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    IONotificationPortSetDispatchQueue(v6, v7);

    container_log_handle_for_category();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_188846000, v8, OS_LOG_TYPE_DEFAULT, "Monitoring [%@]", buf, 0xCu);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v29 + 1) + 8 * i);
          v15 = IOBSDNameMatching(v4, 0, (const char *)[v14 UTF8String]);
          io_service_t MatchingService = IOServiceGetMatchingService(v4, v15);
          if (MatchingService)
          {
            io_service_t v17 = MatchingService;
            if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
            {
              mach_error_t v18 = IOServiceAddInterestNotification( v26,  v17,  "IOGeneralInterest",  (IOServiceInterestCallback)_MCMVolumeChangeMonitorCallback,  v27,  &v27->_notifier);
              container_log_handle_for_category();
              v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (v18)
              {
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v21 = mach_error_string(v18);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v14;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = v21;
                  v22 = v20;
                  v23 = "failed to register volume interest notification for: %@ with error: %s";
                  uint32_t v24 = 22;
                  goto LABEL_20;
                }
              }

              else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v14;
                _os_log_impl( &dword_188846000,  v20,  OS_LOG_TYPE_DEFAULT,  "registered volume interest notification for: %@",  buf,  0xCu);
              }
            }

            else
            {
              container_log_handle_for_category();
              v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v14;
                v22 = v20;
                v23 = "unable to monitor: %@ for freeze notifications, not an APFS volume";
                uint32_t v24 = 12;
LABEL_20:
                _os_log_error_impl(&dword_188846000, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
              }
            }

            IOObjectRelease(v17);
            continue;
          }

          container_log_handle_for_category();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v14;
            _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "failed to find IOKit object for volume: %@",  buf,  0xCu);
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }

      while (v11);
    }
  }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  io_object_t notifier = self->_notifier;
  if (notifier) {
    IOObjectRelease(notifier);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCMVolumeChangeMonitor;
  -[MCMVolumeChangeMonitor dealloc](&v4, sel_dealloc);
}

- (void)_callbackWithVolume:(unsigned int)a3 notificationType:(unsigned int)a4 margs:(void *)a5
{
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = -[MCMVolumeChangeMonitor state](v6, "state");
  uint64_t v8 = v7;
  unsigned int v9 = a4 + 536330234;
  unint64_t v10 = v7;
  switch(v9)
  {
    case 0u:
      unint64_t v10 = v7 | 1;
      break;
    case 1u:
      unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
      break;
    case 4u:
      unint64_t v10 = v7 | 2;
      break;
    case 5u:
      unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFDLL;
      break;
    default:
      break;
  }

  -[MCMVolumeChangeMonitor setState:](v6, "setState:", v10);
  objc_sync_exit(v6);

  -[MCMVolumeChangeMonitor _notifyObserversIfNeededWithOldState:newState:]( v6,  "_notifyObserversIfNeededWithOldState:newState:",  v8,  v10);
}

- (void)_notifyObserversIfNeededWithOldState:(unint64_t)a3 newState:(unint64_t)a4
{
  if (a3 != a4) {
    -[MCMVolumeChangeMonitor _notifyObserversOfEvents:newVolumeState:]( self,  "_notifyObserversOfEvents:newVolumeState:",  -[MCMVolumeChangeMonitor _changeEventStart:end:targetActiveState:fromOldState:newState:]( self,  "_changeEventStart:end:targetActiveState:fromOldState:newState:",  4LL,  8LL,  2LL,  a3,  a4) | -[MCMVolumeChangeMonitor _changeEventStart:end:targetActiveState:fromOldState:newState:]( self,  "_changeEventStart:end:targetActiveState:fromOldState:newState:",  1LL,  2LL,  1LL,  a3,  a4),  a4);
  }
}

- (void)_notifyObserversOfEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  -[MCMVolumeChangeMonitor observers](self, "observers");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[MCMVolumeChangeMonitor observers](self, "observers");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = (void *)[v8 copy];

  objc_sync_exit(v7);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        -[MCMVolumeChangeMonitor _notifyObserver:events:newVolumeState:]( self,  "_notifyObserver:events:newVolumeState:",  *(void *)(*((void *)&v15 + 1) + 8 * v13++),  a3,  a4);
      }

      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v11);
  }
}

- (void)_notifyObserver:(id)a3 events:(unint64_t)a4 newVolumeState:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 volumeChangedDispatchQueue];
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __64__MCMVolumeChangeMonitor__notifyObserver_events_newVolumeState___block_invoke;
  v10[3] = &unk_18A29D858;
  id v11 = v7;
  unint64_t v12 = a4;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (unint64_t)_changeEventStart:(unint64_t)a3 end:(unint64_t)a4 targetActiveState:(unint64_t)a5 fromOldState:(unint64_t)a6 newState:(unint64_t)a7
{
  if ((a7 & a5) != 0) {
    a4 = a3;
  }
  if (((a7 ^ a6) & a5) != 0) {
    return a4;
  }
  else {
    return 0LL;
  }
}

- (id)_volumesToMonitor
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  mach_error_t BootDevice = APFSContainerGetBootDevice();
  if (BootDevice)
  {
    mach_error_t v4 = BootDevice;
    container_log_handle_for_category();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v24 = mach_error_string(v4);
      _os_log_error_impl( &dword_188846000,  v5,  OS_LOG_TYPE_ERROR,  "APFSContainerGetBootDevice failed; error = %s",
        buf,
        0xCu);
    }
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v5 = (os_log_s *)0LL;
    -[os_log_s UTF8String](v5, "UTF8String");
    mach_error_t v6 = APFSVolumeRoleFind();
    if (v6)
    {
      mach_error_t v7 = v6;
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint32_t v24 = mach_error_string(v7);
        _os_log_error_impl(&dword_188846000, v8, OS_LOG_TYPE_ERROR, "APFSVolumeRoleFind failed; error = %s", buf, 0xCu);
      }
    }

    else
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      uint64_t v8 = (os_log_s *)0LL;
      uint64_t v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "substringFromIndex:", 5, v17);
            unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v2 addObject:v13];
          }

          uint64_t v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
        }

        while (v10);
      }
    }
  }

  if (![v2 count])
  {
    container_log_handle_for_category();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "No volumes to monitor", buf, 2u);
    }
  }

  __int128 v15 = (void *)objc_msgSend(v2, "copy", v17);

  return v15;
}

- (NSURL)mountPointURL
{
  return self->_mountPointURL;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

uint64_t __64__MCMVolumeChangeMonitor__notifyObserver_events_newVolumeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) volumeChangedWithEvents:*(void *)(a1 + 40) newVolumeState:*(void *)(a1 + 48)];
}

@end