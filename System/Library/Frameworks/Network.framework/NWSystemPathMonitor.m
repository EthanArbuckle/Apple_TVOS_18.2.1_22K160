@interface NWSystemPathMonitor
+ (id)sharedSystemPathMonitor;
- (BKSApplicationStateMonitor)applicationMonitor;
- (BOOL)getSymptomsFallback;
- (BOOL)interfaceInUse;
- (BOOL)isEthernetPrimary;
- (BOOL)isVPNActive;
- (BOOL)isWiFiPrimary;
- (NSMutableDictionary)perAppVPNEvaluators;
- (NWMonitor)vpnMonitor;
- (NWPathEvaluator)primaryEvaluator;
- (NWSystemPathMonitor)init;
- (OS_dispatch_source)mptcpWatcher;
- (OS_dispatch_source)smoothingTimer;
- (OS_nw_interface_use_observer)interfaceUseObserver;
- (int)symptomsNotifyToken;
- (int)vpnNotifyToken;
- (void)appStateChangedWithUserInfo:(id)a3;
- (void)dealloc;
- (void)eventFired;
- (void)fallbackWatcher;
- (void)registerForSymptomsFallbackNotification;
- (void)registerForVPNNotifications;
- (void)setApplicationMonitor:(id)a3;
- (void)setEthernetPrimary:(BOOL)a3;
- (void)setFallbackWatcher:(void *)a3;
- (void)setInterfaceInUse:(BOOL)a3;
- (void)setInterfaceUseObserver:(id)a3;
- (void)setMptcpWatcher:(id)a3;
- (void)setPerAppVPNEvaluators:(id)a3;
- (void)setPrimaryEvaluator:(id)a3;
- (void)setSmoothingTimer:(id)a3;
- (void)setSymptomsNotifyToken:(int)a3;
- (void)setVpnActive:(BOOL)a3;
- (void)setVpnMonitor:(id)a3;
- (void)setVpnNotifyToken:(int)a3;
- (void)setWifiPrimary:(BOOL)a3;
- (void)startWatchingApplicationStates;
- (void)stopWatchingApplicationStates;
- (void)updateFlags;
- (void)updateVPNMonitor;
@end

@implementation NWSystemPathMonitor

- (NWSystemPathMonitor)init
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___NWSystemPathMonitor;
  v2 = -[NWSystemPathMonitor init](&v42, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446210;
    *(void *)&location[4] = "-[NWSystemPathMonitor init]";
    v26 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v40 = 0;
    if (__nwlog_fault(v26, &type, &v40))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v28 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_181A5C000, v27, v28, "%{public}s [super init] failed", location, 0xCu);
        }
      }

      else if (v40)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v30 = type;
        BOOL v31 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)location = 136446466;
            *(void *)&location[4] = "-[NWSystemPathMonitor init]";
            __int16 v44 = 2082;
            v45 = (const __CFString *)backtrace_string;
            _os_log_impl( &dword_181A5C000,  v27,  v30,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  location,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_50;
        }

        if (v31)
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_181A5C000, v27, v30, "%{public}s [super init] failed, no backtrace", location, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)location = 136446210;
          *(void *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl( &dword_181A5C000,  v27,  v32,  "%{public}s [super init] failed, backtrace limit exceeded",  location,  0xCu);
        }
      }
    }

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  if (-[NWSystemPathMonitor vpnNotifyToken](v2, "vpnNotifyToken") != -1)
  {
    notify_cancel(-[NWSystemPathMonitor vpnNotifyToken](v2, "vpnNotifyToken"));
    -[NWSystemPathMonitor setVpnNotifyToken:](v2, "setVpnNotifyToken:", 0xFFFFFFFFLL);
  }
  v3 = -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  if (v3)
  {
    v4 = -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
    [v4 removeObserver:v2 forKeyPath:@"status"];

    -[NWSystemPathMonitor setVpnMonitor:](v2, "setVpnMonitor:", 0LL);
  }

  if (-[NWSystemPathMonitor symptomsNotifyToken](v2, "symptomsNotifyToken") != -1)
  {
    notify_cancel(-[NWSystemPathMonitor symptomsNotifyToken](v2, "symptomsNotifyToken"));
    -[NWSystemPathMonitor setSymptomsNotifyToken:](v2, "setSymptomsNotifyToken:", 0xFFFFFFFFLL);
  }
  v5 = -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  if (v5)
  {
    v6 = -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
    [v6 removeObserver:v2 forKeyPath:@"path"];

    -[NWSystemPathMonitor setPrimaryEvaluator:](v2, "setPrimaryEvaluator:", 0LL);
  }

  -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    id v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[NWSystemPathMonitor setSmoothingTimer:](v2, "setSmoothingTimer:", 0LL);
  }

  if (-[NWSystemPathMonitor fallbackWatcher](v2, "fallbackWatcher"))
  {
    tcp_connection_fallback_watcher_destroy((uint64_t)-[NWSystemPathMonitor fallbackWatcher](v2, "fallbackWatcher"));
    -[NWSystemPathMonitor setFallbackWatcher:](v2, "setFallbackWatcher:", 0LL);
  }
  v9 = -[NWSystemPathMonitor mptcpWatcher](v2, "mptcpWatcher");
  if (v9)
  {
    -[NWSystemPathMonitor mptcpWatcher](v2, "mptcpWatcher");
    v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v10);

    -[NWSystemPathMonitor setMptcpWatcher:](v2, "setMptcpWatcher:", 0LL);
  }

  -[NWSystemPathMonitor interfaceUseObserver](v2, "interfaceUseObserver");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[NWSystemPathMonitor interfaceUseObserver](v2, "interfaceUseObserver");
    nw_interface_use_observer_cancel(v12);

    -[NWSystemPathMonitor setInterfaceUseObserver:](v2, "setInterfaceUseObserver:", 0LL);
  }

  -[NWSystemPathMonitor stopWatchingApplicationStates](v2, "stopWatchingApplicationStates");
  objc_sync_exit(v2);

  v13.receiver = v2;
  v13.super_class = (Class)&OBJC_CLASS___NWSystemPathMonitor;
  -[NWSystemPathMonitor dealloc](&v13, sel_dealloc);
}

- (void)updateFlags
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  uint64_t v4 = [v3 status];

  if (v4 == 1)
  {
    char v5 = 1;
  }

  else
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v6 = -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators", 0LL);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v54 count:16];
    if (v7)
    {
      int v8 = 0;
      char v5 = 0;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v12 = -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators");
          [v12 objectForKeyedSubscript:v11];
          objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 path];
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ([v14 status] == 1)
          {
            [v14 genericNetworkAgentsWithDomain:@"NetworkExtension" type:@"AppVPN"];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v5 |= v15 != 0LL;
            v8 |= [v14 usesInterfaceType:1];
          }
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v54 count:16];
      }

      while (v7);

      if ((v8 & 1) != 0)
      {
        uint64_t v16 = 1LL;
        goto LABEL_16;
      }
    }

    else
    {

      char v5 = 0;
    }
  }
  v17 = -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  [v17 path];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v18 usesInterfaceType:1];

LABEL_16:
  -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 path];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 usesInterfaceType:3];

  -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 path];
  os_log_type_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 genericNetworkAgentsWithDomain:@"AVConference" type:@"CellularFallback"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v16)
  {
    int v26 = 0;
    goto LABEL_20;
  }

  if (tcp_fallback_watcher_fallback_inuse((uint64_t)-[NWSystemPathMonitor fallbackWatcher](v2, "fallbackWatcher")))
  {
    uint64_t v16 = 0LL;
    v25 = " (due to cellular fallback)";
    int v26 = 1;
    goto LABEL_21;
  }

  uint64_t v16 = 0LL;
  if (-[NWSystemPathMonitor getSymptomsFallback](v2, "getSymptomsFallback"))
  {
    v25 = " (due to reverse cellular fallback)";
    int v26 = 1;
    goto LABEL_21;
  }

  if (sMptcpUsesCell) {
    v25 = " (due to MPTCP sending on Cell)";
  }
  else {
    v25 = " (due to cellular fallback from AVConference)";
  }
  int v26 = 1;
  if ((sMptcpUsesCell & 1) == 0 && !v24)
  {
    if (-[NWSystemPathMonitor interfaceInUse](v2, "interfaceInUse"))
    {
      uint64_t v16 = 0LL;
      v25 = " (due to AirDrop using cellular)";
      goto LABEL_21;
    }

    int v26 = 0;
    uint64_t v16 = 1LL;
LABEL_20:
    v25 = "";
  }

- (void)eventFired
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
  if (!v3)
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
    }
    uint64_t v4 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v4);
    -[NWSystemPathMonitor setSmoothingTimer:](v2, "setSmoothingTimer:", v5);

    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __33__NWSystemPathMonitor_eventFired__block_invoke;
    handler[3] = &unk_189BC93A0;
    handler[4] = v2;
    dispatch_source_set_event_handler(v6, handler);

    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    uint64_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v8 = dispatch_time(0LL, 200000000LL);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);

    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    uint64_t v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);
  }

  objc_sync_exit(v2);
}

- (void)appStateChangedWithUserInfo:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v29 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
    BOOL v30 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v44 = 0;
    if (__nwlog_fault((const char *)v30, &type, &v44))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v31 = (os_log_s *)(id)gLogObj;
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_181A5C000, v31, v32, "%{public}s called with null userInfo", buf, 0xCu);
        }
      }

      else if (v44)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v31 = (os_log_s *)(id)gLogObj;
        os_log_type_t v39 = type;
        BOOL v40 = os_log_type_enabled(v31, type);
        if (backtrace_string)
        {
          if (v40)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
            __int16 v48 = 2082;
            int v49 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v31,  v39,  "%{public}s called with null userInfo, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          if (!v30) {
            goto LABEL_37;
          }
LABEL_36:
          free(v30);
          goto LABEL_37;
        }

        if (v40)
        {
          *(_DWORD *)buf = 136446210;
          BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_181A5C000, v31, v39, "%{public}s called with null userInfo, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v31 = (os_log_s *)(id)gLogObj;
        os_log_type_t v41 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl( &dword_181A5C000,  v31,  v41,  "%{public}s called with null userInfo, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

    if (!v30) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  gotLoadHelper_x8__OBJC_CLASS___BKSApplicationStateMonitor(v5);
  if (objc_opt_class())
  {
    v6 = self;
    objc_sync_enter(v6);
    double Helper_x8__BKSApplicationStateDisplayIDKey = gotLoadHelper_x8__BKSApplicationStateDisplayIDKey(v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", **(void **)(v9 + 1248), Helper_x8__BKSApplicationStateDisplayIDKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    double Helper_x8__BKSApplicationStateProcessIDKey = gotLoadHelper_x8__BKSApplicationStateProcessIDKey(v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", **(void **)(v13 + 1264), Helper_x8__BKSApplicationStateProcessIDKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    double Helper_x8__BKSApplicationStateKey = gotLoadHelper_x8__BKSApplicationStateKey(v15);
    objc_msgSend(v4, "objectForKeyedSubscript:", **(void **)(v17 + 1256), Helper_x8__BKSApplicationStateKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v19 = v18;
    if (v18 && [v18 unsignedIntValue] == 8)
    {
      v20 = -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
      [v20 objectForKeyedSubscript:v10];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        BOOL v22 = objc_alloc_init(&OBJC_CLASS___NWParameters);
        -[NWParameters setPid:](v22, "setPid:", [v14 intValue]);
        -[NWParameters setSourceApplicationWithBundleID:](v22, "setSourceApplicationWithBundleID:", v10);
        [v10 UTF8String];
        os_log_type_t v23 = (void *)NEHelperCopyPerAppDomains();
        v24 = v23;
        if (v23
          && object_getClass(v23) == (Class)MEMORY[0x1895F9220]
          && xpc_array_get_count(v24)
          && (string = xpc_array_get_string(v24, 0LL)) != 0LL)
        {
          [NSString stringWithUTF8String:string];
          int v43 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = +[NWHostEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWHostEndpoint,  "endpointWithHostname:port:",  v43,  @"0");
        }

        else
        {
          v25 = 0LL;
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v26 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          __int16 v48 = 2114;
          int v49 = (char *)v10;
          _os_log_impl( &dword_181A5C000,  v26,  OS_LOG_TYPE_INFO,  "%{public}s Start watching path for foreground app %{public}@",  buf,  0x16u);
        }

        v27 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  v25,  v22);
        -[NWPathEvaluator addObserver:forKeyPath:options:context:]( v27,  "addObserver:forKeyPath:options:context:",  v6,  @"path",  5LL,  0LL);
        -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
        os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 setObject:v27 forKeyedSubscript:v10];

LABEL_21:
      }
    }

    else
    {
      -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 objectForKeyedSubscript:v10];
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        __int128 v35 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          __int16 v48 = 2114;
          int v49 = (char *)v10;
          _os_log_impl( &dword_181A5C000,  v35,  OS_LOG_TYPE_INFO,  "%{public}s Stop watching path for background app %{public}@",  buf,  0x16u);
        }
        v36 = -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
        [v36 objectForKeyedSubscript:v10];
        BOOL v22 = (NWParameters *)objc_claimAutoreleasedReturnValue();

        -[NWParameters removeObserver:forKeyPath:](v22, "removeObserver:forKeyPath:", v6, @"path");
        -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
        id v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 setObject:0 forKeyedSubscript:v10];

        -[NWSystemPathMonitor eventFired](v6, "eventFired");
        goto LABEL_21;
      }
    }

    objc_sync_exit(v6);
  }

- (void)startWatchingApplicationStates
{
  v3 = self;
  objc_sync_enter(v3);
  -[NWSystemPathMonitor applicationMonitor](v3, "applicationMonitor");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    gotLoadHelper_x21__OBJC_CLASS___BKSApplicationStateMonitor(v5);
    if (objc_opt_class())
    {
      objc_initWeak(&location, v3);
      [MEMORY[0x189603FC8] dictionary];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWSystemPathMonitor setPerAppVPNEvaluators:](v3, "setPerAppVPNEvaluators:", v6);

      id v7 = objc_alloc_init(*(Class *)(v2 + 1272));
      -[NWSystemPathMonitor setApplicationMonitor:](v3, "setApplicationMonitor:", v7);

      uint64_t v9 = MEMORY[0x1895F87A8];
      objc_copyWeak(&v10, &location);
      -[NWSystemPathMonitor applicationMonitor]( v3,  "applicationMonitor",  v9,  3221225472LL,  __53__NWSystemPathMonitor_startWatchingApplicationStates__block_invoke,  &unk_189BB54D8);
      dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setHandler:&v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

  objc_sync_exit(v3);
}

- (void)stopWatchingApplicationStates
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWSystemPathMonitor applicationMonitor](v2, "applicationMonitor");
  if (v3)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
          -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators");
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 objectForKeyedSubscript:v8];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();

          [v10 removeObserver:v2 forKeyPath:@"path"];
          ++v7;
        }

        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v5);
    }

    -[NWSystemPathMonitor applicationMonitor](v2, "applicationMonitor");
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 invalidate];

    -[NWSystemPathMonitor setApplicationMonitor:](v2, "setApplicationMonitor:", 0LL);
  }

  objc_sync_exit(v2);
}

- (void)registerForVPNNotifications
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (-[NWSystemPathMonitor vpnNotifyToken](self, "vpnNotifyToken") == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, self);
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
    }
    v3 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __50__NWSystemPathMonitor_registerForVPNNotifications__block_invoke;
    handler[3] = &unk_189BB5500;
    objc_copyWeak(&v16, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.neconfigurationchanged", &out_token, v3, handler);

    if (!v4)
    {
      -[NWSystemPathMonitor setVpnNotifyToken:](self, "setVpnNotifyToken:", out_token);
      goto LABEL_13;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
    __int16 v21 = 2082;
    BOOL v22 = "com.apple.neconfigurationchanged";
    __int16 v23 = 1024;
    uint32_t v24 = v4;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v13 = 0;
    if (__nwlog_fault(v6, &type, &v13))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.neconfigurationchanged";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl( &dword_181A5C000,  v7,  v8,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed",  buf,  0x1Cu);
        }
      }

      else if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        BOOL v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136446978;
            v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
            __int16 v21 = 2082;
            BOOL v22 = "com.apple.neconfigurationchanged";
            __int16 v23 = 1024;
            uint32_t v24 = v4;
            __int16 v25 = 2082;
            int v26 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, dumping backtrace:%{public}s",  buf,  0x26u);
          }

          free(backtrace_string);
          if (!v6) {
            goto LABEL_13;
          }
          goto LABEL_11;
        }

        if (v11)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.neconfigurationchanged";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, no backtrace",  buf,  0x1Cu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.neconfigurationchanged";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl( &dword_181A5C000,  v7,  v12,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, backtrace limit exceeded",  buf,  0x1Cu);
        }
      }
    }

    if (!v6)
    {
LABEL_13:
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      return;
    }

- (void)updateVPNMonitor
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
    _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_INFO,  "%{public}s Update VPN monitor due to configuration change",  buf,  0xCu);
  }

  -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  uint32_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 removeObserver:v2 forKeyPath:@"status"];

    -[NWSystemPathMonitor setVpnMonitor:](v2, "setVpnMonitor:", 0LL);
  }

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NWParameters);
  int v7 = ne_session_always_on_vpn_configs_present();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  os_log_type_t v8 = (os_log_s *)(id)gLogObj;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_INFO, "%{public}s Monitoring Always-On VPN", buf, 0xCu);
    }

    os_log_type_t v10 = @"AOVPN";
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_181A5C000, v8, OS_LOG_TYPE_INFO, "%{public}s Monitoring system VPN", buf, 0xCu);
    }

    os_log_type_t v10 = @"VPN";
  }

  -[NWParameters requireNetworkAgentWithDomain:type:]( v6,  "requireNetworkAgentWithDomain:type:",  @"NetworkExtension",  v10);
  BOOL v11 = objc_alloc_init(&OBJC_CLASS___NWNetworkDescription);
  +[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]( &OBJC_CLASS___NWMonitor,  "monitorWithNetworkDescription:endpoint:parameters:",  v11,  0LL,  v6);
  os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWSystemPathMonitor setVpnMonitor:](v2, "setVpnMonitor:", v12);

  -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = v13 == 0LL;

  if (!(_DWORD)v11)
  {
    -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 addObserver:v2 forKeyPath:@"status" options:5 context:0];

    if (ne_session_app_vpn_configs_present())
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      __int128 v15 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
        _os_log_impl(&dword_181A5C000, v15, OS_LOG_TYPE_INFO, "%{public}s Monitoring Per-App VPN", buf, 0xCu);
      }

      -[NWSystemPathMonitor startWatchingApplicationStates](v2, "startWatchingApplicationStates");
    }

    else
    {
      -[NWSystemPathMonitor stopWatchingApplicationStates](v2, "stopWatchingApplicationStates");
    }

    goto LABEL_37;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v16 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
  uint64_t v17 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (os_log_s *)(id)gLogObj;
    os_log_type_t v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl( &dword_181A5C000,  v18,  v19,  "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed",  buf,  0xCu);
    }

- (void)registerForSymptomsFallbackNotification
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (-[NWSystemPathMonitor symptomsNotifyToken](self, "symptomsNotifyToken") == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, self);
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
    }
    v3 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __62__NWSystemPathMonitor_registerForSymptomsFallbackNotification__block_invoke;
    handler[3] = &unk_189BB5500;
    objc_copyWeak(&v16, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.symptoms.celloutrankeffective", &out_token, v3, handler);

    if (!v4)
    {
      -[NWSystemPathMonitor setSymptomsNotifyToken:](self, "setSymptomsNotifyToken:", out_token);
      goto LABEL_13;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
    __int16 v21 = 2082;
    BOOL v22 = "com.apple.symptoms.celloutrankeffective";
    __int16 v23 = 1024;
    uint32_t v24 = v4;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v13 = 0;
    if (__nwlog_fault(v6, &type, &v13))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.symptoms.celloutrankeffective";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl( &dword_181A5C000,  v7,  v8,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed",  buf,  0x1Cu);
        }
      }

      else if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        BOOL v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136446978;
            v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
            __int16 v21 = 2082;
            BOOL v22 = "com.apple.symptoms.celloutrankeffective";
            __int16 v23 = 1024;
            uint32_t v24 = v4;
            __int16 v25 = 2082;
            int v26 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, dumping backtrace:%{public}s",  buf,  0x26u);
          }

          free(backtrace_string);
          if (!v6) {
            goto LABEL_13;
          }
          goto LABEL_11;
        }

        if (v11)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.symptoms.celloutrankeffective";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, no backtrace",  buf,  0x1Cu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          __int16 v21 = 2082;
          BOOL v22 = "com.apple.symptoms.celloutrankeffective";
          __int16 v23 = 1024;
          uint32_t v24 = v4;
          _os_log_impl( &dword_181A5C000,  v7,  v12,  "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, backtrace limit exceeded",  buf,  0x1Cu);
        }
      }
    }

    if (!v6)
    {
LABEL_13:
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      return;
    }

- (BOOL)getSymptomsFallback
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (-[NWSystemPathMonitor symptomsNotifyToken](self, "symptomsNotifyToken") == -1) {
    return 0;
  }
  uint64_t state64 = 0LL;
  uint32_t state = notify_get_state(-[NWSystemPathMonitor symptomsNotifyToken](self, "symptomsNotifyToken"), &state64);
  if (!state) {
    return state64 != 0;
  }
  uint32_t v4 = state;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
  __int16 v21 = 1024;
  uint32_t v22 = v4;
  uint64_t v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      BOOL v9 = "%{public}s notify_get_state [%u] failed";
LABEL_18:
      __int128 v14 = v7;
      os_log_type_t v15 = v8;
      goto LABEL_19;
    }

    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      BOOL v9 = "%{public}s notify_get_state [%u] failed, backtrace limit exceeded";
      goto LABEL_18;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v7 = (os_log_s *)(id)gLogObj;
    os_log_type_t v12 = type;
    BOOL v13 = os_log_type_enabled(v7, type);
    if (!backtrace_string)
    {
      if (!v13)
      {
LABEL_20:

        if (!v6) {
          return 0;
        }
        goto LABEL_14;
      }

      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      BOOL v9 = "%{public}s notify_get_state [%u] failed, no backtrace";
      __int128 v14 = v7;
      os_log_type_t v15 = v12;
LABEL_19:
      _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0x12u);
      goto LABEL_20;
    }

    if (v13)
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      __int16 v21 = 1024;
      uint32_t v22 = v4;
      __int16 v23 = 2082;
      uint32_t v24 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v7,  v12,  "%{public}s notify_get_state [%u] failed, dumping backtrace:%{public}s",  buf,  0x1Cu);
    }

    free(backtrace_string);
  }

  if (v6) {
LABEL_14:
  }
    free(v6);
  return 0;
}

- (BOOL)isWiFiPrimary
{
  return self->_wifiPrimary;
}

- (void)setWifiPrimary:(BOOL)a3
{
  self->_wifiPrimary = a3;
}

- (BOOL)isEthernetPrimary
{
  return self->_ethernetPrimary;
}

- (void)setEthernetPrimary:(BOOL)a3
{
  self->_ethernetPrimary = a3;
}

- (BOOL)isVPNActive
{
  return self->_vpnActive;
}

- (void)setVpnActive:(BOOL)a3
{
  self->_vpnActive = a3;
}

- (NWMonitor)vpnMonitor
{
  return (NWMonitor *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setVpnMonitor:(id)a3
{
}

- (NWPathEvaluator)primaryEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPrimaryEvaluator:(id)a3
{
}

- (int)vpnNotifyToken
{
  return self->_vpnNotifyToken;
}

- (void)setVpnNotifyToken:(int)a3
{
  self->_vpnNotifyToken = a3;
}

- (int)symptomsNotifyToken
{
  return self->_symptomsNotifyToken;
}

- (void)setSymptomsNotifyToken:(int)a3
{
  self->_symptomsNotifyToken = a3;
}

- (BKSApplicationStateMonitor)applicationMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setApplicationMonitor:(id)a3
{
}

- (NSMutableDictionary)perAppVPNEvaluators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPerAppVPNEvaluators:(id)a3
{
}

- (OS_dispatch_source)smoothingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSmoothingTimer:(id)a3
{
}

- (void)fallbackWatcher
{
  return self->_fallbackWatcher;
}

- (void)setFallbackWatcher:(void *)a3
{
  self->_fallbackWatcher = a3;
}

- (OS_dispatch_source)mptcpWatcher
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setMptcpWatcher:(id)a3
{
}

- (OS_nw_interface_use_observer)interfaceUseObserver
{
  return (OS_nw_interface_use_observer *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setInterfaceUseObserver:(id)a3
{
}

- (BOOL)interfaceInUse
{
  return self->_interfaceInUse;
}

- (void)setInterfaceInUse:(BOOL)a3
{
  self->_interfaceInUse = a3;
}

- (void).cxx_destruct
{
}

void __62__NWSystemPathMonitor_registerForSymptomsFallbackNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained eventFired];
}

void __50__NWSystemPathMonitor_registerForVPNNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVPNMonitor];
}

void __53__NWSystemPathMonitor_startWatchingApplicationStates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained appStateChangedWithUserInfo:v3];
}

uint64_t __33__NWSystemPathMonitor_eventFired__block_invoke(uint64_t a1)
{
  uint64_t v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) setSmoothingTimer:0];
  return [*(id *)(a1 + 32) updateFlags];
}

void __27__NWSystemPathMonitor_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained eventFired];
}

void __27__NWSystemPathMonitor_init__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint32_t v4 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v8 = "-[NWSystemPathMonitor init]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_ERROR,  "%{public}s Error: %d, destroying the MPTCP-watcher",  buf,  0x12u);
    }

    [*(id *)(a1 + 32) mptcpWatcher];
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    [*(id *)(a1 + 32) setMptcpWatcher:0];
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained eventFired];
  }

void __27__NWSystemPathMonitor_init__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setInterfaceInUse:a2];
    [v4 eventFired];
    id WeakRetained = v4;
  }
}

BOOL __27__NWSystemPathMonitor_init__block_invoke()
{
  BOOL result = NWUtilsCurrentProcessHasEntitlement(@"com.apple.private.network.socket-delegate");
  init_hasDelegateEntitlement = result;
  return result;
}

+ (id)sharedSystemPathMonitor
{
  if (sharedSystemPathMonitor_initEvaluator != -1) {
    dispatch_once(&sharedSystemPathMonitor_initEvaluator, &__block_literal_global_9);
  }
  return (id)sharedSystemPathMonitor_sharedEvaluator;
}

void __46__NWSystemPathMonitor_sharedSystemPathMonitor__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NWSystemPathMonitor);
  v1 = (void *)sharedSystemPathMonitor_sharedEvaluator;
  sharedSystemPathMonitor_sharedEvaluator = (uint64_t)v0;
}

@end