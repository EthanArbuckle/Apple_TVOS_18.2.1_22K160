@interface NWPrivilegedHelper
- (BOOL)startXPCListener;
- (NSMutableArray)allKnownEntitlementGroup;
- (NSMutableDictionary)handlers;
- (NSMutableSet)allKnownEntitlementSet;
- (NWPrivilegedHelper)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (void)handleRequest:(id)a3 onConnection:(id)a4;
- (void)registerHandlerFunction:(void *)a3 type:(int)a4 allowedEntitlementGroup:(id)a5;
- (void)registerHelperFunctions;
- (void)setAllKnownEntitlementGroup:(id)a3;
- (void)setAllKnownEntitlementSet:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)startThrottlePolicyEventListener;
@end

@implementation NWPrivilegedHelper

- (void)registerHandlerFunction:(void *)a3 type:(int)a4 allowedEntitlementGroup:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v106 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (!a3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    v17 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v94 = 0;
    if (__nwlog_fault((const char *)v17, &type, &v94))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (os_log_s *)(id)gLogObj;
        os_log_type_t v19 = type;
        if (!os_log_type_enabled(v18, type)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 136446210;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v20 = "%{public}s called with null handlerFunction";
LABEL_50:
        v53 = v18;
        os_log_type_t v54 = v19;
        goto LABEL_51;
      }

      if (!v94)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (os_log_s *)(id)gLogObj;
        os_log_type_t v19 = type;
        if (!os_log_type_enabled(v18, type)) {
          goto LABEL_52;
        }
        *(_DWORD *)buf = 136446210;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v20 = "%{public}s called with null handlerFunction, backtrace limit exceeded";
        goto LABEL_50;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (os_log_s *)(id)gLogObj;
      os_log_type_t v22 = type;
      BOOL v23 = os_log_type_enabled(v18, type);
      if (!backtrace_string)
      {
        if (!v23)
        {
LABEL_52:

          if (!v17) {
            goto LABEL_143;
          }
LABEL_53:
          free(v17);
          goto LABEL_143;
        }

        *(_DWORD *)buf = 136446210;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v20 = "%{public}s called with null handlerFunction, no backtrace";
        v53 = v18;
        os_log_type_t v54 = v22;
LABEL_51:
        _os_log_impl(&dword_181A5C000, v53, v54, v20, buf, 0xCu);
        goto LABEL_52;
      }

      if (v23)
      {
        *(_DWORD *)buf = 136446466;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        __int16 v98 = 2082;
        *(void *)v99 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v18,  v22,  "%{public}s called with null handlerFunction, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v17) {
      goto LABEL_143;
    }
    goto LABEL_53;
  }

  v9 = -[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]( objc_alloc(&OBJC_CLASS___NWPHHandler),  "initWithHandlerFunction:allowedEntitlementGroup:",  a3,  v8);
  if (!v9) {
    goto LABEL_142;
  }
  uint64_t v10 = [MEMORY[0x189607968] numberWithUnsignedInt:v5];
  v11 = -[NWPrivilegedHelper handlers](self, "handlers");
  [v11 objectForKeyedSubscript:v10];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = (void *)v10;
  v85 = v9;
  if (v12)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    unsigned int v14 = v5 - 2;
    else {
      v15 = off_189BB5C28[v14];
    }
    *(_DWORD *)buf = 136446722;
    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    __int16 v98 = 1024;
    *(_DWORD *)v99 = v5;
    *(_WORD *)&v99[4] = 2082;
    *(void *)&v99[6] = v15;
    v40 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v94 = 0;
    if (__nwlog_fault(v40, &type, &v94))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v41 = (os_log_s *)(id)gLogObj;
        os_log_type_t v42 = type;
        if (os_log_type_enabled(v41, type))
        {
          if (v14 > 0x14) {
            v43 = "unknown";
          }
          else {
            v43 = off_189BB5C28[v14];
          }
          *(_DWORD *)buf = 136446722;
          v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
          __int16 v98 = 1024;
          *(_DWORD *)v99 = v5;
          *(_WORD *)&v99[4] = 2082;
          *(void *)&v99[6] = v43;
          v68 = "%{public}s Trying to reregister handler for type [%u] %{public}s";
          goto LABEL_136;
        }

        goto LABEL_137;
      }

      if (!v94)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v41 = (os_log_s *)(id)gLogObj;
        os_log_type_t v42 = type;
        if (os_log_type_enabled(v41, type))
        {
          if (v14 > 0x14) {
            v58 = "unknown";
          }
          else {
            v58 = off_189BB5C28[v14];
          }
          *(_DWORD *)buf = 136446722;
          v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
          __int16 v98 = 1024;
          *(_DWORD *)v99 = v5;
          *(_WORD *)&v99[4] = 2082;
          *(void *)&v99[6] = v58;
          v68 = "%{public}s Trying to reregister handler for type [%u] %{public}s, backtrace limit exceeded";
          goto LABEL_136;
        }

        goto LABEL_137;
      }

      id v44 = v8;
      v45 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v46 = (os_log_s *)(id)gLogObj;
      os_log_type_t v47 = type;
      BOOL v48 = os_log_type_enabled(v46, type);
      if (v45)
      {
        if (v48)
        {
          if (v14 > 0x14) {
            v49 = "unknown";
          }
          else {
            v49 = off_189BB5C28[v14];
          }
          *(_DWORD *)buf = 136446978;
          v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
          __int16 v98 = 1024;
          *(_DWORD *)v99 = v5;
          *(_WORD *)&v99[4] = 2082;
          *(void *)&v99[6] = v49;
          __int16 v100 = 2082;
          v101 = v45;
          v74 = "%{public}s Trying to reregister handler for type [%u] %{public}s, dumping backtrace:%{public}s";
          goto LABEL_94;
        }

        goto LABEL_95;
      }

      if (v48)
      {
        if (v14 > 0x14) {
          v69 = "unknown";
        }
        else {
          v69 = off_189BB5C28[v14];
        }
        *(_DWORD *)buf = 136446722;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        __int16 v98 = 1024;
        *(_DWORD *)v99 = v5;
        *(_WORD *)&v99[4] = 2082;
        *(void *)&v99[6] = v69;
        v78 = "%{public}s Trying to reregister handler for type [%u] %{public}s, no backtrace";
LABEL_109:
        _os_log_impl(&dword_181A5C000, v46, v47, v78, buf, 0x1Cu);
        goto LABEL_110;
      }

      goto LABEL_110;
    }

    goto LABEL_138;
  }

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id v24 = v8;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (!v25)
  {

    goto LABEL_55;
  }

  uint64_t v26 = v25;
  char v27 = 0;
  uint64_t v28 = *(void *)v91;
  id v82 = v8;
  v83 = v24;
  uint64_t v80 = *(void *)v91;
  do
  {
    uint64_t v29 = 0LL;
    uint64_t v81 = v26;
    do
    {
      if (*(void *)v91 != v28) {
        objc_enumerationMutation(v24);
      }
      v30 = *(void **)(*((void *)&v90 + 1) + 8 * v29);
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v86 objects:v104 count:16];
      if (!v32) {
        goto LABEL_31;
      }
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v87;
      while (2)
      {
        for (uint64_t i = 0LL; i != v33; ++i)
        {
          if (*(void *)v87 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(char **)(*((void *)&v86 + 1) + 8 * i);
          if (([v36 hasPrefix:@"com.apple."] & 1) == 0)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            id v50 = (id)gLogObj;
            unsigned int v51 = v5 - 2;
            else {
              v52 = off_189BB5C28[v51];
            }
            *(_DWORD *)buf = 136446978;
            v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
            __int16 v98 = 1024;
            *(_DWORD *)v99 = v5;
            *(_WORD *)&v99[4] = 2082;
            *(void *)&v99[6] = v52;
            __int16 v100 = 2114;
            v101 = v36;
            v59 = (void *)_os_log_send_and_compose_impl();

            os_log_type_t type = OS_LOG_TYPE_ERROR;
            char v94 = 0;
            if (__nwlog_fault((const char *)v59, &type, &v94))
            {
              if (type == OS_LOG_TYPE_FAULT)
              {
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v60 = (os_log_s *)(id)gLogObj;
                os_log_type_t v61 = type;
                if (os_log_type_enabled(v60, type))
                {
                  if (v51 > 0x14) {
                    v62 = "unknown";
                  }
                  else {
                    v62 = off_189BB5C28[v51];
                  }
                  *(_DWORD *)buf = 136446978;
                  v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                  __int16 v98 = 1024;
                  *(_DWORD *)v99 = v5;
                  *(_WORD *)&v99[4] = 2082;
                  *(void *)&v99[6] = v62;
                  __int16 v100 = 2114;
                  v101 = v36;
                  v75 = "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@";
                  goto LABEL_123;
                }

                goto LABEL_124;
              }

              if (v94)
              {
                v63 = (char *)__nw_create_backtrace_string();
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v64 = (os_log_s *)(id)gLogObj;
                os_log_type_t v65 = type;
                BOOL v66 = os_log_type_enabled(v64, type);
                if (v63)
                {
                  if (v66)
                  {
                    if (v51 > 0x14) {
                      v67 = "unknown";
                    }
                    else {
                      v67 = off_189BB5C28[v51];
                    }
                    *(_DWORD *)buf = 136447234;
                    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                    __int16 v98 = 1024;
                    *(_DWORD *)v99 = v5;
                    *(_WORD *)&v99[4] = 2082;
                    *(void *)&v99[6] = v67;
                    __int16 v100 = 2114;
                    v101 = v36;
                    __int16 v102 = 2082;
                    v103 = v63;
                    _os_log_impl( &dword_181A5C000,  v64,  v65,  "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public }@, dumping backtrace:%{public}s",  buf,  0x30u);
                  }

                  free(v63);
                  if (!v59) {
                    goto LABEL_127;
                  }
                }

                else
                {
                  if (v66)
                  {
                    if (v51 > 0x14) {
                      v76 = "unknown";
                    }
                    else {
                      v76 = off_189BB5C28[v51];
                    }
                    *(_DWORD *)buf = 136446978;
                    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                    __int16 v98 = 1024;
                    *(_DWORD *)v99 = v5;
                    *(_WORD *)&v99[4] = 2082;
                    *(void *)&v99[6] = v76;
                    __int16 v100 = 2114;
                    v101 = v36;
                    _os_log_impl( &dword_181A5C000,  v64,  v65,  "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public }@, no backtrace",  buf,  0x26u);
                  }

                  if (!v59) {
                    goto LABEL_127;
                  }
                }

- (void)registerHelperFunctions
{
  v90[2] = *MEMORY[0x1895F89C0];
  __int128 v89 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v89 count:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v3;
  __int128 v88 = @"com.apple.networkd.disable_opportunistic";
  [MEMORY[0x189603F18] arrayWithObjects:&v88 count:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v4;
  [MEMORY[0x189603F18] arrayWithObjects:v90 count:2];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleOpportunistic,  2LL,  v5);

  __int128 v86 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v86 count:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v6;
  v85 = @"com.apple.networkd.persistent_interface";
  [MEMORY[0x189603F18] arrayWithObjects:&v85 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v87 count:2];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleCreateNetworkAgentKernelSocket,  12LL,  v8);

  v83 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v83 count:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v9;
  id v82 = @"com.apple.networkd.advisory_socket";
  [MEMORY[0x189603F18] arrayWithObjects:&v82 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v84 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleCreateNetworkAdvisoryKernelSocket,  13LL,  v11);

  uint64_t v80 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v80 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v81 = v12;
  [MEMORY[0x189603F18] arrayWithObjects:&v81 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleSetNetworkAgentOnInterface,  8LL,  v13);

  v78 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v78 count:1];
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v14;
  v77 = @"com.apple.networkd.persistent_interface";
  [MEMORY[0x189603F18] arrayWithObjects:&v77 count:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v79 count:2];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleSetPersistentNetworkAgentOnInterface,  14LL,  v16);

  v75 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v75 count:1];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v17;
  [MEMORY[0x189603F18] arrayWithObjects:&v76 count:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleReloadManagedNetworkSettings,  9LL,  v18);

  v73 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v73 count:1];
  os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v19;
  v72 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v72 count:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v20;
  [MEMORY[0x189603F18] arrayWithObjects:v74 count:2];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleCheckMobileAsset,  11LL,  v21);

  v70 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v70 count:1];
  os_log_type_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v22;
  v69 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v69 count:1];
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v23;
  [MEMORY[0x189603F18] arrayWithObjects:v71 count:2];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleSetNetworkdSetting,  10LL,  v24);

  v67 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v67 count:1];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v25;
  BOOL v66 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v66 count:1];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v26;
  [MEMORY[0x189603F18] arrayWithObjects:v68 count:2];
  char v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleConstrained,  15LL,  v27);

  v64 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v64 count:1];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v28;
  v63 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v63 count:1];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v29;
  [MEMORY[0x189603F18] arrayWithObjects:v65 count:2];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleUltraConstrained,  22LL,  v30);

  os_log_type_t v61 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v61 count:1];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v31;
  v60 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v60 count:1];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v32;
  [MEMORY[0x189603F18] arrayWithObjects:v62 count:2];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleExpensive,  16LL,  v33);

  v58 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v58 count:1];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v34;
  [MEMORY[0x189603F18] arrayWithObjects:&v59 count:1];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleSetupFakeEthernetPair,  17LL,  v35);

  unsigned int v56 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v56 count:1];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v36;
  [MEMORY[0x189603F18] arrayWithObjects:&v57 count:1];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleTeardownFakeEthernetPair,  18LL,  v37);

  os_log_type_t v54 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v54 count:1];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v38;
  v53 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v53 count:1];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v39;
  [MEMORY[0x189603F18] arrayWithObjects:v55 count:2];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleThroughputEstimates,  19LL,  v40);

  unsigned int v51 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v51 count:1];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v41;
  id v50 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v50 count:1];
  os_log_type_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v42;
  [MEMORY[0x189603F18] arrayWithObjects:v52 count:2];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleRadioType,  20LL,  v43);

  BOOL v48 = @"com.apple.networkd_privileged";
  [MEMORY[0x189603F18] arrayWithObjects:&v48 count:1];
  id v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v44;
  os_log_type_t v47 = @"com.apple.networkd.modify_settings";
  [MEMORY[0x189603F18] arrayWithObjects:&v47 count:1];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v45;
  [MEMORY[0x189603F18] arrayWithObjects:v49 count:2];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]( self,  "registerHandlerFunction:type:allowedEntitlementGroup:",  handleRunProbes,  21LL,  v46);
}

- (BOOL)startXPCListener
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  v3 = (const char *)networkd_privileged_service;
  -[NWPrivilegedHelper queue](self, "queue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v3, v4, 1uLL);
  -[NWPrivilegedHelper setListener:](self, "setListener:", mach_service);
  v6 = -[NWPrivilegedHelper listener](self, "listener");
  if (!v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    id v31 = "-[NWPrivilegedHelper startXPCListener]";
    __int16 v32 = 2082;
    uint64_t v33 = networkd_privileged_service;
    v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v28 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (os_log_s *)(id)gLogObj;
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed",  buf,  0x16u);
      }

      goto LABEL_36;
    }

    if (!v28)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (os_log_s *)(id)gLogObj;
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl( &dword_181A5C000,  v12,  v25,  "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, backtrace limit exceeded",  buf,  0x16u);
      }

      goto LABEL_36;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (os_log_s *)(id)gLogObj;
    os_log_type_t v22 = type;
    BOOL v23 = os_log_type_enabled(v12, type);
    if (!backtrace_string)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl( &dword_181A5C000,  v12,  v22,  "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, no backtrace",  buf,  0x16u);
      }

      goto LABEL_36;
    }

    if (v23)
    {
      *(_DWORD *)buf = 136446722;
      id v31 = "-[NWPrivilegedHelper startXPCListener]";
      __int16 v32 = 2082;
      uint64_t v33 = networkd_privileged_service;
      __int16 v34 = 2082;
      v35 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v12,  v22,  "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, dumping backtrace:%{public}s",  buf,  0x20u);
    }

    goto LABEL_23;
  }
  v7 = -[NWPrivilegedHelper listener](self, "listener");
  Class Class = object_getClass(v7);
  v9 = (objc_class *)MEMORY[0x1895F9238];

  if (Class == v9)
  {
    objc_initWeak((id *)buf, self);
    -[NWPrivilegedHelper listener](self, "listener");
    id v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __38__NWPrivilegedHelper_startXPCListener__block_invoke;
    handler[3] = &unk_189BBE0F0;
    objc_copyWeak(&v27, (id *)buf);
    handler[4] = self;
    xpc_connection_set_event_handler(v16, handler);

    -[NWPrivilegedHelper listener](self, "listener");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_resume(v17);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    return 1;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  id v31 = "-[NWPrivilegedHelper startXPCListener]";
  __int16 v32 = 2082;
  uint64_t v33 = networkd_privileged_service;
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v28 = 0;
  if (__nwlog_fault(v11, &type, &v28))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (os_log_s *)(id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        id v31 = "-[NWPrivilegedHelper startXPCListener]";
        __int16 v32 = 2082;
        uint64_t v33 = networkd_privileged_service;
        _os_log_impl( &dword_181A5C000,  v12,  v13,  "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed",  buf,  0x16u);
      }

- (void)startThrottlePolicyEventListener
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v2, &__block_literal_global_42729);
}

- (NWPrivilegedHelper)initWithQueue:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((gIsHelper & 1) == 0)
  {
    gIsHelper = 1;
    nw_allow_use_of_dispatch_internal();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
  }

  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___NWPrivilegedHelper;
  uint64_t v5 = -[NWPrivilegedHelper init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[NWPrivilegedHelper setQueue:](v5, "setQueue:", v4);
    }

    else
    {
      getMainQueue();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWPrivilegedHelper setQueue:](v6, "setQueue:", v7);
    }

    -[NWPrivilegedHelper queue](v6, "queue");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = +[ManagedNetworkSettings sharedMNS](&OBJC_CLASS___ManagedNetworkSettings, "sharedMNS");
    [v9 setQueue:v8];

    [MEMORY[0x189603FC8] dictionary];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPrivilegedHelper setHandlers:](v6, "setHandlers:", v10);

    [MEMORY[0x189603FE0] set];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPrivilegedHelper setAllKnownEntitlementSet:](v6, "setAllKnownEntitlementSet:", v11);

    -[NWPrivilegedHelper registerHelperFunctions](v6, "registerHelperFunctions");
    [MEMORY[0x189603FA8] array];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPrivilegedHelper setAllKnownEntitlementGroup:](v6, "setAllKnownEntitlementGroup:", v12);

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    -[NWPrivilegedHelper allKnownEntitlementSet](v6, "allKnownEntitlementSet");
    os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          -[NWPrivilegedHelper allKnownEntitlementGroup](v6, "allKnownEntitlementGroup");
          os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v37 = v18;
          [MEMORY[0x189603F18] arrayWithObjects:&v37 count:1];
          os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 addObject:v20];
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }

      while (v15);
    }

    -[NWPrivilegedHelper setAllKnownEntitlementSet:](v6, "setAllKnownEntitlementSet:", 0LL);
    BOOL v21 = 0LL;
    if (-[NWPrivilegedHelper startXPCListener](v6, "startXPCListener"))
    {
      -[NWPrivilegedHelper startThrottlePolicyEventListener](v6, "startThrottlePolicyEventListener");
      BOOL v21 = v6;
    }

    goto LABEL_16;
  }

  __nwlog_obj();
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v40 = "-[NWPrivilegedHelper initWithQueue:]";
  os_log_type_t v24 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v34 = 0;
  if (__nwlog_fault(v24, &type, &v34))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        id v27 = "%{public}s [super init] failed";
LABEL_30:
        _os_log_impl(&dword_181A5C000, v25, v26, v27, buf, 0xCu);
      }
    }

    else
    {
      if (v34)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v26 = type;
        BOOL v29 = os_log_type_enabled(v25, type);
        if (backtrace_string)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWPrivilegedHelper initWithQueue:]";
            __int16 v41 = 2082;
            os_log_type_t v42 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v25,  v26,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_32;
        }

        if (!v29) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        id v27 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_30;
      }

      __nwlog_obj();
      os_log_type_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        id v27 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_30;
      }
    }

- (void)handleRequest:(id)a3 onConnection:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NWPHContext initWithRequest:onConnection:]( objc_alloc(&OBJC_CLASS___NWPHContext),  "initWithRequest:onConnection:",  v6,  v7);
  if (v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, (const char *)networkd_privileged_key_type);
    -[NWPrivilegedHelper handlers](self, "handlers");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInt:uint64];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v12 allowedEntitlementGroup];
      os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = connectionMatchesEntitlementGroup(v7, v13);

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v15 = (os_log_s *)(id)gLogObj;
      uint64_t v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          else {
            v17 = off_189BB5C28[(uint64 - 2)];
          }
          int v27 = 136446722;
          char v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
          __int16 v29 = 2082;
          *(void *)__int128 v30 = v17;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)__int128 v31 = -[NWPHContext pid](v8, "pid");
          _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s Handling %{public}s from pid %d",  (uint8_t *)&v27,  0x1Cu);
        }

        int64_t v22 = ((uint64_t (*)(NWPHContext *))[v12 handlerFunction])(v8);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v16 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          else {
            BOOL v23 = off_189BB5C28[(uint64 - 2)];
          }
          int v24 = -[NWPHContext pid](v8, "pid");
          int v27 = 136446978;
          char v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
          __int16 v29 = 2048;
          *(void *)__int128 v30 = v22;
          *(_WORD *)&v30[8] = 2082;
          *(void *)__int128 v31 = v23;
          *(_WORD *)&v31[8] = 1024;
          int v32 = v24;
          _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s Returning %lld for %{public}s to pid %d",  (uint8_t *)&v27,  0x26u);
        }
      }

      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = -[NWPHContext pid](v8, "pid");
        else {
          BOOL v21 = off_189BB5C28[(uint64 - 2)];
        }
        int v27 = 136446978;
        char v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
        __int16 v29 = 1024;
        *(_DWORD *)__int128 v30 = v20;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = uint64;
        *(_WORD *)__int128 v31 = 2082;
        *(void *)&v31[2] = v21;
        _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s Client pid %d missing entitlements for type [%u] %{public}s",  (uint8_t *)&v27,  0x22u);
        int64_t v22 = -1002LL;
      }

      else
      {
        int64_t v22 = -1002LL;
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v16 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v18 = -[NWPHContext pid](v8, "pid");
        else {
          os_log_type_t v19 = off_189BB5C28[(uint64 - 2)];
        }
        int v27 = 136446978;
        char v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
        __int16 v29 = 1024;
        *(_DWORD *)__int128 v30 = v18;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = uint64;
        *(_WORD *)__int128 v31 = 2082;
        *(void *)&v31[2] = v19;
        _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s Client pid %d sent invalid type [%u] %{public}s",  (uint8_t *)&v27,  0x22u);
      }

      int64_t v22 = -1003LL;
    }

    -[NWPHContext reply](v8, "reply");
    os_log_type_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v25, (const char *)networkd_privileged_key_result, v22);

    -[NWPHContext reply](v8, "reply");
    os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message((xpc_connection_t)v7, v26);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)listener
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableSet)allKnownEntitlementSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAllKnownEntitlementSet:(id)a3
{
}

- (NSMutableArray)allKnownEntitlementGroup
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAllKnownEntitlementGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

void __54__NWPrivilegedHelper_startThrottlePolicyEventListener__block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v40[13] = *MEMORY[0x1895F89C0];
  id v2 = a2;
  int v32 = 0;
  size_t v31 = 4LL;
  if (sysctlbyname("kern.ipc.io_policy.throttled", &v32, &v31, 0LL, 0LL))
  {
    int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v4 = (os_log_s *)(id)gLogObj;
    uint64_t v5 = v4;
    if (v3 == 2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = 2;
        _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d",  buf,  0x1Cu);
      }

      goto LABEL_17;
    }

    *(_DWORD *)buf = 136446722;
    char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    __int16 v35 = 2082;
    objc_super v36 = "kern.ipc.io_policy.throttled";
    __int16 v37 = 1024;
    int v38 = v3;
    id v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (__nwlog_fault(v6, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        id v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d";
LABEL_38:
        os_log_type_t v25 = v7;
        os_log_type_t v26 = v8;
        goto LABEL_39;
      }

      if (!v29)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        id v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, backtrace limit exceeded";
        goto LABEL_38;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_40:

          if (!v6) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }

        *(_DWORD *)buf = 136446722;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        id v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, no backtrace";
        os_log_type_t v25 = v7;
        os_log_type_t v26 = v11;
LABEL_39:
        _os_log_impl(&dword_181A5C000, v25, v26, v9, buf, 0x1Cu);
        goto LABEL_40;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446978;
        char v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        __int16 v35 = 2082;
        objc_super v36 = "kern.ipc.io_policy.throttled";
        __int16 v37 = 1024;
        int v38 = v3;
        __int16 v39 = 2082;
        *(void *)v40 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, dumping backtrace:%{public}s",  buf,  0x26u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_17:
      int v32 = -1;
      goto LABEL_18;
    }

void __38__NWPrivilegedHelper_startXPCListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (!WeakRetained) {
      goto LABEL_50;
    }
    Class Class = object_getClass(v3);
    if (Class == (Class)MEMORY[0x1895F9238])
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      int v38 = __Block_byref_object_copy__42760;
      __int16 v39 = __Block_byref_object_dispose__42761;
      id v18 = v3;
      id v40 = v18;
      [WeakRetained allKnownEntitlementGroup];
      os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = connectionMatchesEntitlementGroup(v18, v19);

      if ((v18 & 1) != 0)
      {
        os_log_type_t v20 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40LL);
        [*(id *)(a1 + 32) queue];
        BOOL v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_queue(v20, v21);

        objc_initWeak((id *)type, WeakRetained);
        int64_t v22 = *(_xpc_connection_s **)(*(void *)&buf[8] + 40LL);
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __38__NWPrivilegedHelper_startXPCListener__block_invoke_62;
        handler[3] = &unk_189BBE0C8;
        handler[4] = buf;
        objc_copyWeak(&v31, (id *)type);
        xpc_connection_set_event_handler(v22, handler);
        xpc_connection_resume(*(xpc_connection_t *)(*(void *)&buf[8] + 40LL));
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)type);
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v23 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)&buf[8] + 40LL));
          *(_DWORD *)os_log_type_t type = 136446466;
          char v34 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          __int16 v35 = 1024;
          pid_t v36 = pid;
          _os_log_impl( &dword_181A5C000,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s client pid %d does not have any known entitlement",  (uint8_t *)type,  0x12u);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(*(void *)&buf[8] + 40LL));
      }

      _Block_object_dispose(buf, 8);

      goto LABEL_50;
    }

    if (Class != (Class)MEMORY[0x1895F9268])
    {
LABEL_50:

      goto LABEL_51;
    }

    id v6 = (void *)MEMORY[0x186E12534](v3);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v6;
    os_log_type_t v8 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (__nwlog_fault(v8, type, &v32))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v6;
          _os_log_impl( &dword_181A5C000,  v9,  v10,  "%{public}s FATAL: XPC listener received error %{public}s",  buf,  0x16u);
        }
      }

      else if (v32)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v27 = type[0];
        BOOL v28 = os_log_type_enabled(v9, type[0]);
        if (backtrace_string)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v6;
            *(_WORD *)&buf[22] = 2082;
            int v38 = (uint64_t (*)(uint64_t, uint64_t))backtrace_string;
            _os_log_impl( &dword_181A5C000,  v9,  v27,  "%{public}s FATAL: XPC listener received error %{public}s, dumping backtrace:%{public}s",  buf,  0x20u);
          }

          free(backtrace_string);
          if (!v8) {
            goto LABEL_49;
          }
          goto LABEL_48;
        }

        if (v28)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v6;
          _os_log_impl( &dword_181A5C000,  v9,  v27,  "%{public}s FATAL: XPC listener received error %{public}s, no backtrace",  buf,  0x16u);
        }
      }

      else
      {
        __nwlog_obj();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v29 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v6;
          _os_log_impl( &dword_181A5C000,  v9,  v29,  "%{public}s FATAL: XPC listener received error %{public}s, backtrace limit exceeded",  buf,  0x16u);
        }
      }
    }

    if (!v8)
    {
LABEL_49:
      free(v6);
      goto LABEL_50;
    }

void __38__NWPrivilegedHelper_startXPCListener__block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id WeakRetained = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
      _os_log_impl( &dword_181A5C000,  WeakRetained,  OS_LOG_TYPE_DEBUG,  "%{public}s received request on removed connection, ignoring.",  buf,  0xCu);
    }

    goto LABEL_45;
  }

  if (v3)
  {
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      Class Class = object_getClass(v4);
      if (Class != (Class)MEMORY[0x1895F9250])
      {
        if (Class != (Class)MEMORY[0x1895F9268])
        {
          id v7 = (char *)MEMORY[0x186E12534](v4);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          os_log_type_t v8 = (os_log_s *)(id)gLogObj;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            __int16 v29 = 2082;
            __int128 v30 = v7;
            _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s received unknown type for request: %{public}s",  buf,  0x16u);
          }

          free(v7);
          goto LABEL_45;
        }

        if (v4 == (void *)MEMORY[0x1895F9198])
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v21 = (os_log_s *)(id)gLogObj;
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_43;
          }
          *(_DWORD *)buf = 136446210;
          BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          int64_t v22 = "%{public}s received XPC_ERROR_CONNECTION_INTERRUPTED, removing connection";
        }

        else
        {
          if (v4 != (void *)MEMORY[0x1895F91A0])
          {
            if (v4 != (void *)MEMORY[0x1895F91C8])
            {
              BOOL v17 = (char *)MEMORY[0x186E12534](v4);
              __nwlog_obj();
              id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136446466;
                BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
                __int16 v29 = 2082;
                __int128 v30 = v17;
                _os_log_impl( &dword_181A5C000,  v18,  OS_LOG_TYPE_DEBUG,  "%{public}s received unknown XPC error %{public}s, removing connection",  buf,  0x16u);
              }

              free(v17);
              goto LABEL_44;
            }

            __nwlog_obj();
            BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136446210;
              BOOL v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
              int64_t v22 = "%{public}s received XPC_ERROR_TERMINATION_IMMINENT, removing connection";
              goto LABEL_42;
            }

@end