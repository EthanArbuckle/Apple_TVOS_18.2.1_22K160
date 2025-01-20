@interface NWUDPListener
- (NSError)error;
- (NWEndpoint)endpoint;
- (NWEndpoint)localEndpoint;
- (NWParameters)parameters;
- (NWUDPListener)initWithParameters:(id)a3 delegate:(id)a4;
- (NWUDPListenerDelegate)delegate;
- (OS_nw_listener)internalListener;
- (void)handleConnection:(id)a3;
- (void)handleError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setError:(id)a3;
- (void)setInternalListener:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation NWUDPListener

- (void)handleConnection:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NWUDPListener delegate](self, "delegate");
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[NWUDPSession initWithConnection:](objc_alloc(&OBJC_CLASS___NWUDPSession), "initWithConnection:", v4);
    [v5 handleSession:v6];
  }

  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (NWUDPSession *)(id)gLogObj;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446210;
      v8 = "-[NWUDPListener handleConnection:]";
      _os_log_impl( &dword_181A5C000,  (os_log_t)v6,  OS_LOG_TYPE_ERROR,  "%{public}s UDP listener received connection, but delegate is nil",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)handleError:(id)a3
{
  if (a3)
  {
    CFErrorRef v4 = nw_error_copy_cf_error((nw_error_t)a3);
    -[NWUDPListener setError:](self, "setError:", v4);
  }

  else
  {
    -[NWUDPListener setError:](self, "setError:");
  }

- (NWUDPListener)initWithParameters:(id)a3 delegate:(id)a4
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v68 = "-[NWUDPListener initWithParameters:delegate:]";
    v36 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v36, &location, &v66))
    {
      if (location == 17)
      {
        __nwlog_obj();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v38 = location;
        if (os_log_type_enabled(v37, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_181A5C000, v37, v38, "%{public}s called with null parameters", buf, 0xCu);
        }
      }

      else if (v66)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v48 = location;
        BOOL v49 = os_log_type_enabled(v37, (os_log_type_t)location);
        if (backtrace_string)
        {
          if (v49)
          {
            *(_DWORD *)buf = 136446466;
            v68 = "-[NWUDPListener initWithParameters:delegate:]";
            __int16 v69 = 2082;
            v70 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v37,  v48,  "%{public}s called with null parameters, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_72;
        }

        if (v49)
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_181A5C000, v37, v48, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v56 = location;
        if (os_log_type_enabled(v37, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v68 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl( &dword_181A5C000,  v37,  v56,  "%{public}s called with null parameters, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (NWEndpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (NSError)error
{
  return self->_error;
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

- (NWUDPListenerDelegate)delegate
{
  return (NWUDPListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __45__NWUDPListener_initWithParameters_delegate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      [WeakRetained internalListener];
      id v7 = (nw_listener *)objc_claimAutoreleasedReturnValue();
      unsigned int port = nw_listener_get_port(v7);

      if (port)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%u", port);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = +[NWAddressEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWAddressEndpoint,  "endpointWithHostname:port:",  @"0.0.0.0",  v9);
        [v6 setLocalEndpoint:v10];
      }
    }

    [v6 handleError:v11];
  }
}

void __45__NWUDPListener_initWithParameters_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFErrorRef v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleConnection:v5];
  }
}

@end