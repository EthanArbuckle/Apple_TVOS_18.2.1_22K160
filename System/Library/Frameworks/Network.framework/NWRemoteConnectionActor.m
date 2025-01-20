@interface NWRemoteConnectionActor
- (BOOL)receiveRemoteCommand:(id)a3;
- (NSMutableDictionary)browsers;
- (NSMutableDictionary)connections;
- (NWRemoteConnectionActor)initWithDelegate:(id)a3;
- (NWRemoteConnectionActorDelegate)delegate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scheduleReadsOnConnection:(id)a3;
- (void)sendData:(id)a3 forConnection:(id)a4;
- (void)setBrowsers:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateEndpointsForBrowser:(id)a3;
- (void)updatePathForConnection:(id)a3;
@end

@implementation NWRemoteConnectionActor

- (NWRemoteConnectionActor)initWithDelegate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___NWRemoteConnectionActor;
    v5 = -[NWRemoteConnectionActor init](&v26, sel_init);
    if (v5)
    {
      v6 = v5;
      objc_storeWeak((id *)&v5->_delegate, v4);
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      connections = v6->_connections;
      v6->_connections = v7;

      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      browsers = v6->_browsers;
      v6->_browsers = v9;

      goto LABEL_4;
    }

    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v21 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v19, v20, v21, buf, 0xCu);
      }
    }

    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      BOOL v25 = os_log_type_enabled(v19, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
          __int16 v31 = 2082;
          v32 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v19,  v20,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }

      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v18) {
      free(v18);
    }
    v6 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v13, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v16 = "%{public}s called with null delegate";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v14, v15, v16, buf, 0xCu);
      }
    }

    else
    {
      if (v27)
      {
        v22 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v15 = type;
        BOOL v23 = os_log_type_enabled(v14, type);
        if (v22)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
            __int16 v31 = 2082;
            v32 = v22;
            _os_log_impl( &dword_181A5C000,  v14,  v15,  "%{public}s called with null delegate, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v22);
          goto LABEL_31;
        }

        if (!v23) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v16 = "%{public}s called with null delegate, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWRemoteConnectionActor initWithDelegate:]";
        v16 = "%{public}s called with null delegate, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (void)updatePathForConnection:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 connection];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 connectionState];

    if (v7 == 2)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s Skipping update path for connection in preparing state",  buf,  0xCu);
      }
    }

    else
    {
      [v5 connection];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 currentPath];
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v10 = (id *)-[os_log_s createProtocolBufferObject](v8, "createProtocolBufferObject");
        [v5 clientID];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 UUIDString];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10) {
          objc_storeStrong(v10 + 2, v12);
        }

        [v5 connection];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 connectionState];

        if (v14 != 3 && v10)
        {
          *((_BYTE *)v10 + 64) |= 1u;
          *((_DWORD *)v10 + 14) = 2;
        }

        os_log_type_t v15 = objc_alloc_init(&OBJC_CLASS___NWPBUpdatePath);
        v16 = v15;
        if (v15) {
          objc_storeStrong((id *)&v15->_responsePath, v10);
        }
        v17 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
        p_isa = (id *)&v17->super.super.isa;
        if (v17)
        {
          *(_BYTE *)&v17->_has |= 1u;
          v17->_command = 2;
          v19 = -[PBCodable data](v16, "data");
          objc_storeStrong(p_isa + 2, v19);
        }

        else
        {
          v19 = -[PBCodable data](v16, "data");
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v20 = (os_log_s *)(id)gLogObj;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          if (v10)
          {
            if (((_BYTE)v10[8] & 1) != 0) {
              uint64_t v21 = *((int *)v10 + 14);
            }
            else {
              uint64_t v21 = 0LL;
            }
            +[NWPath createStringFromStatus:](&OBJC_CLASS___NWPath, "createStringFromStatus:", v21);
            BOOL v23 = (char *)objc_claimAutoreleasedReturnValue();
            id v24 = v10[2];
          }

          else
          {
            +[NWPath createStringFromStatus:](&OBJC_CLASS___NWPath, "createStringFromStatus:", 0LL);
            BOOL v23 = (char *)objc_claimAutoreleasedReturnValue();
            id v24 = 0LL;
          }

          id v25 = v24;
          *(_DWORD *)buf = 136446722;
          v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
          __int16 v41 = 2114;
          v42 = v23;
          __int16 v43 = 2114;
          id v44 = v25;
          _os_log_impl( &dword_181A5C000,  v20,  OS_LOG_TYPE_DEBUG,  "%{public}s Updating path (%{public}@) for %{public}@",  buf,  0x20u);
        }

        -[NWRemoteConnectionActor delegate](self, "delegate");
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
        [p_isa data];
        char v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v27;
        [MEMORY[0x189603F18] arrayWithObjects:&v38 count:1];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 sendRemoteReplies:v28];
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id *)(id)gLogObj;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
        {
          [v5 connection];
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
          __int16 v41 = 2114;
          v42 = v22;
          _os_log_impl( &dword_181A5C000,  (os_log_t)v10,  OS_LOG_TYPE_DEBUG,  "%{public}s No path for %{public}@",  buf,  0x16u);
        }
      }
    }

    goto LABEL_27;
  }

  __nwlog_obj();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
  v30 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v36 = 0;
  if (__nwlog_fault(v30, &type, &v36))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v32 = type;
      if (os_log_type_enabled(v31, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        uint64_t v33 = "%{public}s called with null wrapper";
LABEL_41:
        _os_log_impl(&dword_181A5C000, v31, v32, v33, buf, 0xCu);
      }
    }

    else
    {
      if (v36)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v32 = type;
        BOOL v35 = os_log_type_enabled(v31, type);
        if (backtrace_string)
        {
          if (v35)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
            __int16 v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v31,  v32,  "%{public}s called with null wrapper, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_43;
        }

        if (!v35) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        uint64_t v33 = "%{public}s called with null wrapper, no backtrace";
        goto LABEL_41;
      }

      __nwlog_obj();
      __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v32 = type;
      if (os_log_type_enabled(v31, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWRemoteConnectionActor updatePathForConnection:]";
        uint64_t v33 = "%{public}s called with null wrapper, backtrace limit exceeded";
        goto LABEL_41;
      }
    }

- (void)sendData:(id)a3 forConnection:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
    uint64_t v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v30 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        id v24 = "%{public}s called with null data";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v22, v23, v24, buf, 0xCu);
      }
    }

    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      BOOL v27 = os_log_type_enabled(v22, type);
      if (backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
          __int16 v35 = 2082;
          char v36 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v22,  v23,  "%{public}s called with null data, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
LABEL_38:
        if (!v21) {
          goto LABEL_8;
        }
LABEL_39:
        free(v21);
        goto LABEL_8;
      }

      if (v27)
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        id v24 = "%{public}s called with null data, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWRemoteConnectionActor sendData:forConnection:]";
        id v24 = "%{public}s called with null data, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

- (void)updateEndpointsForBrowser:(id)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 browser];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 discoveredEndpoints];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(&OBJC_CLASS___NWPBUpdateBrowse);
    [v5 clientID];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 UUIDString];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      objc_storeStrong((id *)&v8->_clientUUID, v10);
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (id)[*(id *)(*((void *)&v37 + 1) + 8 * i) createProtocolBufferObject];
          if (v8)
          {
            discoveredEndpoints = v8->_discoveredEndpoints;
            if (!discoveredEndpoints)
            {
              v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
              v19 = v8->_discoveredEndpoints;
              v8->_discoveredEndpoints = v18;

              discoveredEndpoints = v8->_discoveredEndpoints;
            }

            -[NSMutableArray addObject:](discoveredEndpoints, "addObject:", v16);
          }
        }

        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }

      while (v13);
    }

    os_log_type_t v20 = objc_alloc_init(&OBJC_CLASS___NWPBCommandMessage);
    p_isa = (id *)&v20->super.super.isa;
    if (v20)
    {
      *(_BYTE *)&v20->_has |= 1u;
      v20->_command = 6;
      v22 = -[PBCodable data](v8, "data");
      objc_storeStrong(p_isa + 2, v22);
    }

    else
    {
      v22 = -[PBCodable data](v8, "data");
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v23 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v24 = [v11 count];
      [v5 clientID];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 UUIDString];
      objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      uint64_t v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
      __int16 v46 = 1024;
      LODWORD(v47[0]) = v24;
      WORD2(v47[0]) = 2114;
      *(void *)((char *)v47 + 6) = v26;
      _os_log_impl( &dword_181A5C000,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s Updating browse results (%u) for %{public}@",  buf,  0x1Cu);
    }

    -[NWRemoteConnectionActor delegate](self, "delegate");
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
    [p_isa data];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v43 = v28;
    [MEMORY[0x189603F18] arrayWithObjects:&v43 count:1];
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 sendRemoteReplies:v29];

    goto LABEL_20;
  }

  __nwlog_obj();
  char v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  uint64_t v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
  __int16 v31 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v41 = 0;
  if (__nwlog_fault(v31, &type, &v41))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper";
LABEL_34:
        _os_log_impl(&dword_181A5C000, v32, v33, v34, buf, 0xCu);
      }
    }

    else
    {
      if (v41)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v33 = type;
        BOOL v36 = os_log_type_enabled(v32, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
            __int16 v46 = 2082;
            v47[0] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v32,  v33,  "%{public}s called with null wrapper, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_36;
        }

        if (!v36) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper, no backtrace";
        goto LABEL_34;
      }

      __nwlog_obj();
      os_log_type_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v45 = "-[NWRemoteConnectionActor updateEndpointsForBrowser:]";
        v34 = "%{public}s called with null wrapper, backtrace limit exceeded";
        goto LABEL_34;
      }
    }

- (void)scheduleReadsOnConnection:(id)a3
{
  id v4 = a3;
  [v4 connection];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  [v4 connection];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke;
    v12[3] = &unk_189BBF360;
    v12[4] = self;
    v8 = &v13;
    id v13 = v4;
    [v7 readDataWithMinimumLength:1 maximumLength:0x100000 completionHandler:v12];
LABEL_5:

    goto LABEL_6;
  }

  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    [v4 connection];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke_32;
    v10[3] = &unk_189BBF388;
    v10[4] = self;
    v8 = &v11;
    id v11 = v4;
    [v7 readDatagramsWithMinimumCount:1 maximumCount:1 completionHandler:v10];
    goto LABEL_5;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  if ([v9 isEqualToString:@"connectionState"])
  {
    id v11 = v10;
    uint64_t v12 = a6;
    [v12 connection];
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v14 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        [v12 connection];
        os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v21 = 136446722;
        v22 = "-[NWRemoteConnectionActor observeValueForKeyPath:ofObject:change:context:]";
        __int16 v23 = 2048;
        int v24 = v15;
        __int16 v25 = 2048;
        id v26 = v11;
        id v16 = "%{public}s Connection wrapper invalid: %p != %p";
LABEL_13:
        _os_log_impl(&dword_181A5C000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, 0x20u);
      }

- (BOOL)receiveRemoteCommand:(id)a3
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  id v4 = (char *)a3;
  if (v4)
  {
    v5 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___NWPBCommandMessage), "initWithData:", v4);
    id v6 = v5;
    if (!v5)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id *)(id)gLogObj;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        __int16 v84 = 2114;
        v85 = v4;
        v8 = "%{public}s Could not parse command: %{public}@";
        id v9 = (os_log_s *)v7;
        uint32_t v10 = 22;
LABEL_15:
        _os_log_impl(&dword_181A5C000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_16;
      }

      goto LABEL_16;
    }

    if ((*(_BYTE *)&v5->_has & 1) == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id *)(id)gLogObj;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Command missing command value";
LABEL_14:
        id v9 = (os_log_s *)v7;
        uint32_t v10 = 12;
        goto LABEL_15;
      }

      goto LABEL_16;
    }

    if (!v5->_messageData)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id *)(id)gLogObj;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v83 = "-[NWRemoteConnectionActor receiveRemoteCommand:]";
        v8 = "%{public}s Command missing message data";
        goto LABEL_14;
      }

- (NWRemoteConnectionActorDelegate)delegate
{
  return (NWRemoteConnectionActorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setConnections:(id)a3
{
}

- (NSMutableDictionary)browsers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBrowsers:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s Write had error %{public}@",  (uint8_t *)&v4,  0x16u);
    }
  }
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s Write had error %{public}@",  (uint8_t *)&v4,  0x16u);
    }
  }
}

void __48__NWRemoteConnectionActor_receiveRemoteCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  if (v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446466;
      v5 = "-[NWRemoteConnectionActor receiveRemoteCommand:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s Write close had error %{public}@",  (uint8_t *)&v4,  0x16u);
    }
  }
}

void __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [*(id *)(a1 + 32) sendData:v5 forConnection:*(void *)(a1 + 40)];
  }
  if (v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136446466;
      uint32_t v10 = "-[NWRemoteConnectionActor scheduleReadsOnConnection:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s Read length had error %{public}@",  (uint8_t *)&v9,  0x16u);
    }

    [*(id *)(a1 + 40) connection];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 cancel];
  }

  else
  {
    [*(id *)(a1 + 32) scheduleReadsOnConnection:*(void *)(a1 + 40)];
  }
}

void __53__NWRemoteConnectionActor_scheduleReadsOnConnection___block_invoke_32( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) sendData:*(void *)(*((void *)&v13 + 1) + 8 * v10++) forConnection:*(void *)(a1 + 40)];
      }

      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v8);
  }

  if (v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v11 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v18 = "-[NWRemoteConnectionActor scheduleReadsOnConnection:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_181A5C000, v11, OS_LOG_TYPE_DEBUG, "%{public}s Read had error %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) connection];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 cancel];
  }

  else
  {
    [*(id *)(a1 + 32) scheduleReadsOnConnection:*(void *)(a1 + 40)];
  }
}

@end