@interface NWTCPListener
- (NSError)error;
- (NSString)launchdKey;
- (NWEndpoint)endpoint;
- (NWEndpoint)localEndpoint;
- (NWParameters)parameters;
- (NWTCPListener)initWithBonjourServiceEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5;
- (NWTCPListener)initWithLaunchdKey:(id)a3 parameters:(id)a4 delegate:(id)a5;
- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4;
- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4 launchdKey:(id)a5 bonjourEndpoint:(id)a6;
- (NWTCPListenerDelegate)delegate;
- (OS_nw_listener)internalListener;
- (void)cancel;
- (void)handleError:(id)a3;
- (void)handleNewConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setError:(id)a3;
- (void)setInternalListener:(id)a3;
- (void)setLaunchdKey:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setParameters:(id)a3;
- (void)startInternal;
@end

@implementation NWTCPListener

- (void)handleNewConnection:(id)a3
{
  id v4 = a3;
  v6 = -[NWTCPConnection initWithAcceptedInternalConnection:]( objc_alloc(&OBJC_CLASS___NWTCPConnection),  "initWithAcceptedInternalConnection:",  v4);
  v5 = -[NWTCPListener delegate](self, "delegate");
  [v5 handleConnection:v6];
}

- (void)handleError:(id)a3
{
  CFErrorRef v4 = nw_error_copy_cf_error((nw_error_t)a3);
  -[NWTCPListener setError:](self, "setError:", v4);
}

- (void)startInternal
{
  v3 = (nw_listener *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __30__NWTCPListener_startInternal__block_invoke;
  handler[3] = &unk_189BC8C10;
  objc_copyWeak(&v12, &location);
  nw_listener_set_new_connection_handler(v3, handler);

  -[NWTCPListener internalListener](self, "internalListener");
  v5 = (nw_listener *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __30__NWTCPListener_startInternal__block_invoke_2;
  v9[3] = &unk_189BC8C38;
  objc_copyWeak(&v10, &location);
  nw_listener_set_state_changed_handler(v5, v9);

  -[NWTCPListener internalListener](self, "internalListener");
  v6 = (nw_listener *)objc_claimAutoreleasedReturnValue();
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
  }
  v7 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
  nw_listener_set_queue(v6, v7);

  -[NWTCPListener internalListener](self, "internalListener");
  v8 = (nw_listener *)objc_claimAutoreleasedReturnValue();
  nw_listener_start(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4 launchdKey:(id)a5 bonjourEndpoint:(id)a6
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v69 = a3;
  id v10 = a4;
  id v70 = a5;
  id v11 = a6;
  if (!v10)
  {
    __nwlog_obj();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
    v52 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v72 = 0;
    if (__nwlog_fault(v52, &type, &v72))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v54 = type;
        if (os_log_type_enabled(v53, type))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_181A5C000, v53, v54, "%{public}s called with null delegate", buf, 0xCu);
        }
      }

      else
      {
        if (v72)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_t v61 = type;
          BOOL v62 = os_log_type_enabled(v60, type);
          if (backtrace_string)
          {
            if (v62)
            {
              *(_DWORD *)buf = 136446466;
              v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
              __int16 v76 = 2082;
              v77 = backtrace_string;
              _os_log_impl( &dword_181A5C000,  v60,  v61,  "%{public}s called with null delegate, dumping backtrace:%{public}s",  buf,  0x16u);
            }

            free(backtrace_string);
          }

          else
          {
            if (v62)
            {
              *(_DWORD *)buf = 136446210;
              v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
              _os_log_impl(&dword_181A5C000, v60, v61, "%{public}s called with null delegate, no backtrace", buf, 0xCu);
            }
          }

          goto LABEL_86;
        }

        __nwlog_obj();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v67 = type;
        if (os_log_type_enabled(v53, type))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl( &dword_181A5C000,  v53,  v67,  "%{public}s called with null delegate, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (NWTCPListener)initWithLaunchdKey:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  if (a3)
  {
    self =  -[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]( self,  "initWithParameters:delegate:launchdKey:bonjourEndpoint:",  a4,  a5,  v9,  0LL);
    id v10 = self;
    goto LABEL_3;
  }

  __nwlog_obj();
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v19 = 0;
  if (__nwlog_fault(v13, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        BOOL v16 = "%{public}s called with null launchdKey";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v14, v15, v16, buf, 0xCu);
      }
    }

    else
    {
      if (v19)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v15 = type;
        BOOL v18 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
            __int16 v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v14,  v15,  "%{public}s called with null launchdKey, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v18) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        BOOL v16 = "%{public}s called with null launchdKey, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        BOOL v16 = "%{public}s called with null launchdKey, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4
{
  return -[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]( self,  "initWithParameters:delegate:launchdKey:bonjourEndpoint:",  a3,  a4,  0LL,  0LL);
}

- (NWTCPListener)initWithBonjourServiceEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  v5 = self;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v5 =  -[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]( self,  "initWithParameters:delegate:launchdKey:bonjourEndpoint:",  a4,  a5,  0LL,  a3);
    v6 = v5;
    goto LABEL_3;
  }

  __nwlog_obj();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  BOOL v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
  id v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v15 = 0;
  if (__nwlog_fault(v9, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        id v12 = "%{public}s called with null bonjourServiceEndpoint";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v10, v11, v12, buf, 0xCu);
      }
    }

    else
    {
      if (v15)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v11 = type;
        BOOL v14 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
            __int16 v19 = 2082;
            id v20 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v10,  v11,  "%{public}s called with null bonjourServiceEndpoint, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v14) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        id v12 = "%{public}s called with null bonjourServiceEndpoint, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        id v12 = "%{public}s called with null bonjourServiceEndpoint, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWTCPListener internalListener](self, "internalListener");
    uint64_t v4 = (nw_listener *)objc_claimAutoreleasedReturnValue();
    nw_listener_cancel(v4);

    -[NWTCPListener setInternalListener:](self, "setInternalListener:", 0LL);
  }

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLocalEndpoint:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setError:(id)a3
{
}

- (OS_nw_listener)internalListener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInternalListener:(id)a3
{
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setParameters:(id)a3
{
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NSString)launchdKey
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLaunchdKey:(id)a3
{
}

- (NWTCPListenerDelegate)delegate
{
  return (NWTCPListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __30__NWTCPListener_startInternal__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNewConnection:v5];
  }
}

void __30__NWTCPListener_startInternal__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      [WeakRetained internalListener];
      v7 = (nw_listener *)objc_claimAutoreleasedReturnValue();
      unsigned int port = nw_listener_get_port(v7);

      if (port)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%u", port);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[NWAddressEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWAddressEndpoint,  "endpointWithHostname:port:",  @"0.0.0.0",  v9);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setLocalEndpoint:v10];
      }
    }

    if (v11) {
      [v6 handleError:v11];
    }
  }
}

@end