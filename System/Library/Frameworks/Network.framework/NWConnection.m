@interface NWConnection
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)connectionWithConnectedSocket:(int)a3;
+ (id)connectionWithEndpoint:(id)a3 parameters:(id)a4;
+ (id)connectionWithInternalConnection:(id)a3;
- (BOOL)hasBetterPath;
- (BOOL)internalHasBetterPath;
- (BOOL)internalIsViable;
- (BOOL)isViable;
- (NSError)error;
- (NSError)internalError;
- (NWConcrete_nw_connection)internalConnection;
- (NWConnection)initWithConnectedSocket:(int)a3;
- (NWConnection)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWConnection)initWithInternalConnection:(id)a3;
- (NWEndpoint)connectedLocalEndpoint;
- (NWEndpoint)connectedRemoteEndpoint;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (NWPath)currentPath;
- (NWPath)internalPath;
- (id)copyCurrentPath;
- (id)copyError;
- (id)description;
- (int)getConnectedSocket;
- (int64_t)connectionState;
- (int64_t)internalConnectionState;
- (unsigned)tlsConnectionTime;
- (void)cancel;
- (void)cancelCurrentEndpoint;
- (void)forceCancel;
- (void)setInternalConnection:(id)a3;
- (void)setInternalConnectionState:(int64_t)a3;
- (void)setInternalError:(id)a3;
- (void)setInternalHasBetterPath:(BOOL)a3;
- (void)setInternalIsViable:(BOOL)a3;
- (void)setInternalPath:(id)a3;
- (void)start;
@end

@implementation NWConnection

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"connectionState"] & 1) != 0
    || ([v4 isEqualToString:@"viable"] & 1) != 0
    || ([v4 isEqualToString:@"hasBetterPath"] & 1) != 0
    || ([v4 isEqualToString:@"error"] & 1) != 0
    || ([v4 isEqualToString:@"currentPath"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWConnection;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)connectionWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if ([v6 dataMode] == 2)
  {
    objc_super v7 = &OBJC_CLASS___NWStreamConnection;
LABEL_7:
    v8 = (void *)[[v7 alloc] initWithEndpoint:v5 parameters:v6];
    goto LABEL_8;
  }

  if ([v6 dataMode] == 1)
  {
    objc_super v7 = &OBJC_CLASS___NWDatagramConnection;
    goto LABEL_7;
  }

  if ([v6 dataMode] == 3)
  {
    objc_super v7 = &OBJC_CLASS___NWMessageConnection;
    goto LABEL_7;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
  __int16 v26 = 1024;
  int v27 = [v6 dataMode];
  LODWORD(v21) = 18;
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v22 = 0;
  if (__nwlog_fault(v11, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (os_log_s *)(id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v14 = objc_msgSend(v6, "dataMode", buf, v21);
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
        __int16 v26 = 1024;
        int v27 = v14;
        v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u)";
LABEL_22:
        _os_log_impl(&dword_181A5C000, v12, v13, v15, buf, 0x12u);
      }
    }

    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v13 = type;
        BOOL v17 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v17)
          {
            int v18 = objc_msgSend(v6, "dataMode", buf, v21);
            *(_DWORD *)buf = 136446722;
            v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
            __int16 v26 = 1024;
            int v27 = v18;
            __int16 v28 = 2082;
            v29 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v13,  "%{public}s Parameters must specify a valid data mode for new connections (received %u), dumping backtrace:%{public}s",  buf,  0x1Cu);
          }

          free(backtrace_string);
          goto LABEL_24;
        }

        if (!v17) {
          goto LABEL_23;
        }
        int v20 = objc_msgSend(v6, "dataMode", buf, v21);
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
        __int16 v26 = 1024;
        int v27 = v20;
        v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), no backtrace";
        goto LABEL_22;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (os_log_s *)(id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v19 = objc_msgSend(v6, "dataMode", buf, v21);
        *(_DWORD *)buf = 136446466;
        v25 = "+[NWConnection connectionWithEndpoint:parameters:]";
        __int16 v26 = 1024;
        int v27 = v19;
        v15 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), backtrace limit exceeded";
        goto LABEL_22;
      }
    }

+ (id)connectionWithConnectedSocket:(int)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v3 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  BOOL v17 = "+[NWConnection connectionWithConnectedSocket:]";
  id v4 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v4, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v6 = type;
      if (!os_log_type_enabled(v5, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v17 = "+[NWConnection connectionWithConnectedSocket:]";
      objc_super v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection";
LABEL_15:
      v12 = v5;
      os_log_type_t v13 = v6;
      goto LABEL_16;
    }

    if (!v14)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v6 = type;
      if (!os_log_type_enabled(v5, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v17 = "+[NWConnection connectionWithConnectedSocket:]";
      objc_super v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, backtrace limit exceeded";
      goto LABEL_15;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (os_log_s *)(id)gLogObj;
    os_log_type_t v9 = type;
    BOOL v10 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (!v10)
      {
LABEL_17:

        if (!v4) {
          return 0LL;
        }
        goto LABEL_11;
      }

      *(_DWORD *)buf = 136446210;
      BOOL v17 = "+[NWConnection connectionWithConnectedSocket:]";
      objc_super v7 = "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, no backtrace";
      v12 = v5;
      os_log_type_t v13 = v9;
LABEL_16:
      _os_log_impl(&dword_181A5C000, v12, v13, v7, buf, 0xCu);
      goto LABEL_17;
    }

    if (v10)
    {
      *(_DWORD *)buf = 136446466;
      BOOL v17 = "+[NWConnection connectionWithConnectedSocket:]";
      __int16 v18 = 2082;
      int v19 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v5,  v9,  "%{public}s Must all connectionWithConnectedSocket on a subclass of NWConnection, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    free(backtrace_string);
  }

  if (v4) {
LABEL_11:
  }
    free(v4);
  return 0LL;
}

+ (id)connectionWithInternalConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = (nw_connection *)a3;
  nw_parameters_t v4 = nw_connection_copy_parameters(v3);
  int data_mode = nw_parameters_get_data_mode(v4);
  if (data_mode == 1)
  {
    os_log_type_t v6 = &OBJC_CLASS___NWDatagramConnection;
    goto LABEL_5;
  }

  if (data_mode != 2)
  {
    int v8 = data_mode;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v23 = "+[NWConnection connectionWithInternalConnection:]";
    __int16 v24 = 1024;
    int v25 = v8;
    BOOL v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v20 = 0;
    if (__nwlog_fault(v10, &type, &v20))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        __int16 v24 = 1024;
        int v25 = v8;
        os_log_type_t v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u)";
LABEL_21:
        __int16 v18 = v11;
        os_log_type_t v19 = v12;
        goto LABEL_22;
      }

      if (!v20)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        __int16 v24 = 1024;
        int v25 = v8;
        os_log_type_t v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), backtrace limit exceeded";
        goto LABEL_21;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (os_log_s *)(id)gLogObj;
      os_log_type_t v15 = type;
      BOOL v16 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v16)
        {
LABEL_23:

          if (!v10) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }

        *(_DWORD *)buf = 136446466;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        __int16 v24 = 1024;
        int v25 = v8;
        os_log_type_t v13 = "%{public}s Parameters must specify a valid data mode for new connections (received %u), no backtrace";
        __int16 v18 = v11;
        os_log_type_t v19 = v15;
LABEL_22:
        _os_log_impl(&dword_181A5C000, v18, v19, v13, buf, 0x12u);
        goto LABEL_23;
      }

      if (v16)
      {
        *(_DWORD *)buf = 136446722;
        v23 = "+[NWConnection connectionWithInternalConnection:]";
        __int16 v24 = 1024;
        int v25 = v8;
        __int16 v26 = 2082;
        int v27 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v11,  v15,  "%{public}s Parameters must specify a valid data mode for new connections (received %u), dumping backtrace:%{public}s",  buf,  0x1Cu);
      }

      free(backtrace_string);
    }

    if (!v10)
    {
LABEL_17:
      objc_super v7 = 0LL;
      goto LABEL_18;
    }

- (void)start
{
  id v3 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __21__NWConnection_start__block_invoke;
  handler[3] = &unk_189BC8C38;
  objc_copyWeak(&v18, &location);
  nw_connection_set_state_changed_handler(v3, handler);

  -[NWConnection internalConnection](self, "internalConnection");
  id v5 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472LL;
  v15[2] = __21__NWConnection_start__block_invoke_11;
  v15[3] = &unk_189BB7F78;
  objc_copyWeak(&v16, &location);
  nw_connection_set_viability_changed_handler(v5, v15);

  -[NWConnection internalConnection](self, "internalConnection");
  os_log_type_t v6 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472LL;
  v13[2] = __21__NWConnection_start__block_invoke_15;
  v13[3] = &unk_189BB7F78;
  objc_copyWeak(&v14, &location);
  nw_connection_set_better_path_available_handler(v6, v13);

  -[NWConnection internalConnection](self, "internalConnection");
  objc_super v7 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472LL;
  v11[2] = __21__NWConnection_start__block_invoke_16;
  v11[3] = &unk_189BC8C90;
  objc_copyWeak(&v12, &location);
  nw_connection_set_path_changed_handler(v7, v11);

  -[NWConnection internalConnection](self, "internalConnection");
  int v8 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
  }
  id v9 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
  nw_connection_set_queue(v8, v9);

  -[NWConnection internalConnection](self, "internalConnection");
  BOOL v10 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_connection_start(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (NWConnection)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NWConnection;
  int v8 = -[NWConnection init](&v25, sel_init);
  if (v8)
  {
    [v7 internalParameters];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    char indefinite_set = nw_parameters_get_indefinite_set(v9);

    if ((indefinite_set & 1) == 0) {
      [v7 setIndefinite:0];
    }
    [v6 internalEndpoint];
    v11 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
    [v7 internalParameters];
    id v12 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
    nw_connection_t v13 = nw_connection_create(v11, v12);
    -[NWConnection setInternalConnection:](v8, "setInternalConnection:", v13);

    -[NWConnection internalConnection](v8, "internalConnection");
    id v14 = (NWConnection *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NWConnection setInternalConnectionState:](v8, "setInternalConnectionState:", 2LL);
      -[NWConnection start](v8, "start");
      id v14 = v8;
    }

    goto LABEL_6;
  }

  __nwlog_obj();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  int v27 = "-[NWConnection initWithEndpoint:parameters:]";
  BOOL v17 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v23 = 0;
  if (__nwlog_fault(v17, &type, &v23))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        int v27 = "-[NWConnection initWithEndpoint:parameters:]";
        char v20 = "%{public}s [super init] failed";
LABEL_20:
        _os_log_impl(&dword_181A5C000, v18, v19, v20, buf, 0xCu);
      }
    }

    else
    {
      if (v23)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v19 = type;
        BOOL v22 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v22)
          {
            *(_DWORD *)buf = 136446466;
            int v27 = "-[NWConnection initWithEndpoint:parameters:]";
            __int16 v28 = 2082;
            v29 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v18,  v19,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }

        if (!v22) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        int v27 = "-[NWConnection initWithEndpoint:parameters:]";
        char v20 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_20;
      }

      __nwlog_obj();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        int v27 = "-[NWConnection initWithEndpoint:parameters:]";
        char v20 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }

- (NWConnection)initWithConnectedSocket:(int)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NWConnection;
  uint64_t v4 = -[NWConnection init](&v29, sel_init);
  if (!v4)
  {
    __nwlog_obj();
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v31 = "-[NWConnection initWithConnectedSocket:]";
    BOOL v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWConnection initWithConnectedSocket:]";
        __int16 v24 = "%{public}s [super init] failed";
LABEL_44:
        _os_log_impl(&dword_181A5C000, v22, v23, v24, buf, 0xCu);
      }
    }

    else
    {
      if (v27)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v23 = type;
        BOOL v26 = os_log_type_enabled(v22, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v31 = "-[NWConnection initWithConnectedSocket:]";
            __int16 v32 = 2082;
            v33 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v22,  v23,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          BOOL v17 = (char *)backtrace_string;
LABEL_18:
          free(v17);
          goto LABEL_19;
        }

        if (!v26) {
          goto LABEL_45;
        }
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWConnection initWithConnectedSocket:]";
        __int16 v24 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_44;
      }

      __nwlog_obj();
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWConnection initWithConnectedSocket:]";
        __int16 v24 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_44;
      }
    }

- (NWConnection)initWithInternalConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NWConnection;
  unsigned int v5 = -[NWConnection init](&v18, sel_init);
  id v6 = v5;
  if (v5)
  {
    -[NWConnection setInternalConnection:](v5, "setInternalConnection:", v4);
    -[NWConnection setInternalConnectionState:](v6, "setInternalConnectionState:", 2LL);
    -[NWConnection start](v6, "start");
    id v7 = v6;
    goto LABEL_3;
  }

  __nwlog_obj();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v20 = "-[NWConnection initWithInternalConnection:]";
  BOOL v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v10, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v20 = "-[NWConnection initWithInternalConnection:]";
        nw_connection_t v13 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v11, v12, v13, buf, 0xCu);
      }
    }

    else
    {
      if (v16)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = type;
        BOOL v15 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v20 = "-[NWConnection initWithInternalConnection:]";
            __int16 v21 = 2082;
            BOOL v22 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v15) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v20 = "-[NWConnection initWithInternalConnection:]";
        nw_connection_t v13 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v20 = "-[NWConnection initWithInternalConnection:]";
        nw_connection_t v13 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)getConnectedSocket
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int connected_socket = nw_connection_get_connected_socket(v2);

  return connected_socket;
}

- (void)cancel
{
  v2 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_connection_cancel(v2);
}

- (void)forceCancel
{
  v2 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_connection_force_cancel(v2);
}

- (void)cancelCurrentEndpoint
{
  v2 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_connection_cancel_current_endpoint(v2);
}

- (unsigned)tlsConnectionTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = nw_connection_fillout_tcp_statistics(v2, (uint64_t)v5);

  if (v3) {
    return v6;
  }
  else {
    return 0;
  }
}

- (int64_t)connectionState
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = -[NWConnection internalConnectionState](v2, "internalConnectionState");
  objc_sync_exit(v2);

  return v3;
}

- (NWEndpoint)connectedLocalEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_connection_copy_connected_local_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)connectedRemoteEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_connection_copy_connected_remote_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (BOOL)isViable
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[NWConnection internalIsViable](v2, "internalIsViable");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasBetterPath
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[NWConnection internalHasBetterPath](v2, "internalHasBetterPath");
  objc_sync_exit(v2);

  return v3;
}

- (id)copyError
{
  v2 = self;
  objc_sync_enter(v2);
  -[NWConnection internalError](v2, "internalError");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NSError)error
{
  return (NSError *)-[NWConnection copyError](self, "copyError");
}

- (id)copyCurrentPath
{
  v2 = self;
  objc_sync_enter(v2);
  -[NWConnection internalPath](v2, "internalPath");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (NWPath)currentPath
{
  return (NWPath *)-[NWConnection copyCurrentPath](self, "copyCurrentPath");
}

- (NWEndpoint)endpoint
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_connection_copy_endpoint(v2);

  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v19 = "-[NWConnection endpoint]";
    unsigned int v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWConnection endpoint]";
        id v9 = "%{public}s nw_connection_copy_endpoint failed";
LABEL_18:
        id v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWConnection endpoint]";
        id v9 = "%{public}s nw_connection_copy_endpoint failed, backtrace limit exceeded";
        goto LABEL_18;
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
LABEL_20:

          if (!v6) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }

        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWConnection endpoint]";
        id v9 = "%{public}s nw_connection_copy_endpoint failed, no backtrace";
        id v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v19 = "-[NWConnection endpoint]";
        __int16 v20 = 2082;
        __int16 v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_connection_copy_endpoint failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      id v4 = 0LL;
      goto LABEL_15;
    }

- (NWParameters)parameters
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWConnection internalConnection](self, "internalConnection");
  v2 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  nw_parameters_t v3 = nw_connection_copy_parameters(v2);

  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v19 = "-[NWConnection parameters]";
    unsigned int v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWConnection parameters]";
        id v9 = "%{public}s nw_connection_copy_parameters failed";
LABEL_18:
        id v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWConnection parameters]";
        id v9 = "%{public}s nw_connection_copy_parameters failed, backtrace limit exceeded";
        goto LABEL_18;
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
LABEL_20:

          if (!v6) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }

        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWConnection parameters]";
        id v9 = "%{public}s nw_connection_copy_parameters failed, no backtrace";
        id v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v19 = "-[NWConnection parameters]";
        __int16 v20 = 2082;
        __int16 v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_connection_copy_parameters failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      id v4 = 0LL;
      goto LABEL_15;
    }

- (int64_t)internalConnectionState
{
  return self->_internalConnectionState;
}

- (void)setInternalConnectionState:(int64_t)a3
{
  self->_internalConnectionState = a3;
}

- (BOOL)internalIsViable
{
  return self->_internalIsViable;
}

- (void)setInternalIsViable:(BOOL)a3
{
  self->_internalIsViable = a3;
}

- (BOOL)internalHasBetterPath
{
  return self->_internalHasBetterPath;
}

- (void)setInternalHasBetterPath:(BOOL)a3
{
  self->_internalHasBetterPath = a3;
}

- (NSError)internalError
{
  return (NSError *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInternalError:(id)a3
{
}

- (NWPath)internalPath
{
  return (NWPath *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInternalPath:(id)a3
{
}

- (NWConcrete_nw_connection)internalConnection
{
  return self->_internalConnection;
}

- (void)setInternalConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __21__NWConnection_start__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  unsigned int v6 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136446722;
    nw_connection_t v13 = "-[NWConnection start]_block_invoke";
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    __int16 v16 = 2114;
    BOOL v17 = v5;
    _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s Connection got event: state %d %{public}@",  (uint8_t *)&v12,  0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_type_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    uint64_t v10 = [v9 internalConnectionState];
    if (v10 != a2)
    {
      [v9 willChangeValueForKey:@"connectionState"];
      [v9 setInternalConnectionState:a2];
    }

    if (v5)
    {
      [v9 willChangeValueForKey:@"error"];
      CFErrorRef v11 = nw_error_copy_cf_error(v5);
      [v9 setInternalError:v11];
    }

    objc_sync_exit(v9);

    if (v10 != a2) {
      [v9 didChangeValueForKey:@"connectionState"];
    }
    if (v5) {
      [v9 didChangeValueForKey:@"error"];
    }
  }
}

void __21__NWConnection_start__block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = " not";
    if ((_DWORD)a2) {
      id v5 = "";
    }
    int v9 = 136446466;
    uint64_t v10 = "-[NWConnection start]_block_invoke";
    __int16 v11 = 2082;
    int v12 = v5;
    _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}s Connection got viability event: is%{public}s viable",  (uint8_t *)&v9,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    if ([v8 internalIsViable] == (_DWORD)a2)
    {
      objc_sync_exit(v8);
    }

    else
    {
      [v8 willChangeValueForKey:@"viable"];
      [v8 setInternalIsViable:a2];
      objc_sync_exit(v8);

      [v8 didChangeValueForKey:@"viable"];
    }
  }
}

void __21__NWConnection_start__block_invoke_15(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = " not";
    if ((_DWORD)a2) {
      id v5 = "";
    }
    int v9 = 136446466;
    uint64_t v10 = "-[NWConnection start]_block_invoke";
    __int16 v11 = 2082;
    int v12 = v5;
    _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}s Connection got better path event: better path%{public}s available",  (uint8_t *)&v9,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    if ([v8 internalHasBetterPath] == (_DWORD)a2)
    {
      objc_sync_exit(v8);
    }

    else
    {
      [v8 willChangeValueForKey:@"hasBetterPath"];
      [v8 setInternalHasBetterPath:a2];
      objc_sync_exit(v8);

      [v8 didChangeValueForKey:@"hasBetterPath"];
    }
  }
}

void __21__NWConnection_start__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136446210;
    __int16 v11 = "-[NWConnection start]_block_invoke";
    _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}s Connection got updated path event",  (uint8_t *)&v10,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned int v6 = -[NWPath initWithPath:](objc_alloc(&OBJC_CLASS___NWPath), "initWithPath:", v3);
    id v7 = WeakRetained;
    objc_sync_enter(v7);
    [v7 internalPath];
    id v8 = (NWPath *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8 == v6;

    if (v9)
    {
      objc_sync_exit(v7);
    }

    else
    {
      [v7 willChangeValueForKey:@"currentPath"];
      [v7 setInternalPath:v6];
      objc_sync_exit(v7);

      [v7 didChangeValueForKey:@"currentPath"];
    }
  }
}

@end