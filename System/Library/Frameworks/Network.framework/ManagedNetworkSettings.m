@interface ManagedNetworkSettings
+ (id)sharedMNS;
- (ManagedNetworkSettings)init;
- (OS_dispatch_queue)queue;
- (void)handleEvent:(id)a3;
- (void)reloadMNS;
- (void)reloadNetworkdSettings;
- (void)setQueue:(id)a3;
@end

@implementation ManagedNetworkSettings

- (ManagedNetworkSettings)init
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ManagedNetworkSettings;
  v2 = -[ManagedNetworkSettings init](&v18, sel_init);
  v3 = v2;
  if (!v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v20 = "-[ManagedNetworkSettings init]";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        v9 = "%{public}s super init failed";
LABEL_17:
        v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_18;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        v9 = "%{public}s super init failed, backtrace limit exceeded";
        goto LABEL_17;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_19:

          if (!v6) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }

        *(_DWORD *)buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        v9 = "%{public}s super init failed, no backtrace";
        v14 = v7;
        os_log_type_t v15 = v11;
LABEL_18:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_19;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[ManagedNetworkSettings init]";
        __int16 v21 = 2082;
        v22 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s super init failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6) {
      goto LABEL_14;
    }
LABEL_13:
    free(v6);
    goto LABEL_14;
  }

  v4 = v2;
LABEL_14:

  return v3;
}

- (void)handleEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v22 = "-[ManagedNetworkSettings handleEvent:]";
    v9 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v19 = 0;
    if (__nwlog_fault((const char *)v9, &type, &v19))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (os_log_s *)(id)gLogObj;
        os_log_type_t v11 = type;
        if (!os_log_type_enabled(v10, type)) {
          goto LABEL_26;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        BOOL v12 = "%{public}s called with null event";
LABEL_24:
        char v16 = v10;
        os_log_type_t v17 = v11;
        goto LABEL_25;
      }

      if (!v19)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (os_log_s *)(id)gLogObj;
        os_log_type_t v11 = type;
        if (!os_log_type_enabled(v10, type)) {
          goto LABEL_26;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        BOOL v12 = "%{public}s called with null event, backtrace limit exceeded";
        goto LABEL_24;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v10, type);
      if (!backtrace_string)
      {
        if (!v15)
        {
LABEL_26:

          if (!v9) {
            goto LABEL_34;
          }
LABEL_27:
          free(v9);
          goto LABEL_34;
        }

        *(_DWORD *)buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        BOOL v12 = "%{public}s called with null event, no backtrace";
        char v16 = v10;
        os_log_type_t v17 = v14;
LABEL_25:
        _os_log_impl(&dword_181A5C000, v16, v17, v12, buf, 0xCu);
        goto LABEL_26;
      }

      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        __int16 v23 = 2082;
        v24 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v10,  v14,  "%{public}s called with null event, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v9) {
      goto LABEL_34;
    }
    goto LABEL_27;
  }

  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1895F91D0]);
  if (string)
  {
    [NSString stringWithUTF8String:string];
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (([v7 isEqualToString:@"NetworkdSettingsChanged"] & 1) != 0
      || [v7 isEqualToString:@"NetworkdManagedSettingsChanged"])
    {
      -[ManagedNetworkSettings reloadNetworkdSettings](self, "reloadNetworkdSettings");
    }

    else if (([v7 isEqualToString:@"NetworkdSysctlSettingsChanged"] & 1) != 0 {
           || [v7 isEqualToString:@"NetworkdManagedSysctlSettingsChanged"])
    }
    {
      -[ManagedNetworkSettings reloadMNS](self, "reloadMNS");
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      objc_super v18 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        __int16 v23 = 2114;
        v24 = v7;
        _os_log_impl( &dword_181A5C000,  v18,  OS_LOG_TYPE_DEBUG,  "%{public}s MNS received an event with unknown name %{public}@",  buf,  0x16u);
      }
    }
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (char *)(id)gLogObj;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v22 = "-[ManagedNetworkSettings handleEvent:]";
      _os_log_impl( &dword_181A5C000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "%{public}s MNS received an event with no name",  buf,  0xCu);
    }
  }

LABEL_34:
}

- (void)reloadNetworkdSettings
{
  v2 = (const char *)nw_setting_libnetcore_debug;
  networkd_settings_init();
  if (sCachedSettings)
  {
    pthread_mutex_lock(&sSettingsMutex);
    if (sCachedSettings) {

    }
      int64_t int64 = xpc_dictionary_get_int64((xpc_object_t)sCachedSettings, v2);
    else {
      int64_t int64 = 0LL;
    }
    pthread_mutex_unlock(&sSettingsMutex);
  }

  else
  {
    int64_t int64 = 0LL;
  }

  [NSString stringWithUTF8String:nw_file_path_settings];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [MEMORY[0x189603FC8] dictionaryWithContentsOfFile:v4];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x189603FC8] dictionary];
  }

  id v13 = (id)v5;

  v6 = (void *)[v13 copy];
  v7 = (void *)MEMORY[0x189603FC8];
  [NSString stringWithUTF8String:nw_file_path_settings_managed];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 dictionaryWithContentsOfFile:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v9 count])
  {

    v9 = 0LL;
  }

  [NSString stringWithUTF8String:nw_settings_managed_settings];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_log_type_t v11 = v13;
    if (!v13)
    {
      [MEMORY[0x189603FC8] dictionary];
      os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v13 = v11;
    [v11 setObject:v9 forKeyedSubscript:v10];
  }

  else
  {
    [v13 removeObjectForKey:v10];
  }

  if ([v13 count])
  {
    BOOL v12 = v13;
  }

  else
  {

    BOOL v12 = 0LL;
  }

  id v14 = v12;
  saveAndPostNetworkdSettings(v12, v6, int64);
}

- (void)reloadMNS
{
  *(void *)((char *)&v108[15] + 2) = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F68] dictionaryWithContentsOfFile:@"/Library/Preferences/com.apple.networkd.sysctl.plist"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F68] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.networkd.sysctl.plist"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v91 objects:&v105 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v92;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v92 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        [v4 objectForKeyedSubscript:v9];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v10 forKeyedSubscript:v9];
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v91 objects:&v105 count:16];
    }

    while (v6);
  }

  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v87 objects:type count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v88;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v88 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v87 + 1) + 8 * j);
        uint64_t v18 = [v2 objectForKeyedSubscript:v17];
        if (v18)
        {
          char v19 = (void *)v18;
          [v4 objectForKeyedSubscript:v17];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 objectForKeyedSubscript:v17];
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 != v21)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v22 = (os_log_s *)(id)gLogObj;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              [v4 objectForKeyedSubscript:v17];
              __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v11 objectForKeyedSubscript:v17];
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              int buf = 136446978;
              v97 = "copyNetworkdCombinedSysctlSettingsDict";
              __int16 v98 = 2114;
              uint64_t v99 = v17;
              __int16 v100 = 2114;
              v101 = v23;
              __int16 v102 = 2114;
              v103 = v24;
              _os_log_impl( &dword_181A5C000,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}s MNS sysctl %{public}@ : ignoring managed value %{public}@ since it is in settings with value %{public}@",  (uint8_t *)&buf,  0x2Au);
            }
          }
        }

        [v11 objectForKeyedSubscript:v17];
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v16 forKeyedSubscript:v17];
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v87 objects:type count:16];
    }

    while (v13);
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  id v25 = v2;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v84;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    id v81 = v25;
    do
    {
      for (uint64_t k = 0LL; k != v27; ++k)
      {
        if (*(void *)v84 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v83 + 1) + 8 * k);
        if (!v30)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          id v34 = (id)gLogObj;
          int v105 = 136446210;
          v106 = "isSysctlAllowlisted";
          v35 = (char *)_os_log_send_and_compose_impl();

          LOBYTE(type[0]) = 16;
          LOBYTE(v91) = 0;
          if (__nwlog_fault(v35, type, &v91))
          {
            if (LOBYTE(type[0]) != 17)
            {
              if ((_BYTE)v91)
              {
                backtrace_string = (char *)__nw_create_backtrace_string();
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v36 = (os_log_s *)(id)gLogObj;
                os_log_type_t v47 = type[0];
                BOOL v48 = os_log_type_enabled(v36, type[0]);
                if (backtrace_string)
                {
                  if (v48)
                  {
                    int v105 = 136446466;
                    v106 = "isSysctlAllowlisted";
                    __int16 v107 = 2082;
                    v108[0] = backtrace_string;
                    _os_log_impl( &dword_181A5C000,  v36,  v47,  "%{public}s called with null name, dumping backtrace:%{public}s",  (uint8_t *)&v105,  0x16u);
                  }

                  free(backtrace_string);
                  goto LABEL_54;
                }

                if (!v48) {
                  goto LABEL_53;
                }
                int v105 = 136446210;
                v106 = "isSysctlAllowlisted";
                v38 = v36;
                os_log_type_t v39 = v47;
                v40 = "%{public}s called with null name, no backtrace";
              }

              else
              {
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v36 = (os_log_s *)(id)gLogObj;
                os_log_type_t v49 = type[0];
                if (!os_log_type_enabled(v36, type[0])) {
                  goto LABEL_53;
                }
                int v105 = 136446210;
                v106 = "isSysctlAllowlisted";
                v38 = v36;
                os_log_type_t v39 = v49;
                v40 = "%{public}s called with null name, backtrace limit exceeded";
              }

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedMNS
{
  if (sharedMNS_onceToken != -1) {
    dispatch_once(&sharedMNS_onceToken, &__block_literal_global_23484);
  }
  return (id)sharedMNS_gManagedNetworkSettings;
}

void __35__ManagedNetworkSettings_sharedMNS__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___ManagedNetworkSettings);
  v1 = (void *)sharedMNS_gManagedNetworkSettings;
  sharedMNS_gManagedNetworkSettings = (uint64_t)v0;
}

@end