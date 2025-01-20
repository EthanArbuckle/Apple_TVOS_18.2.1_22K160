@interface NWConcrete_nw_socks5_connection
- (NSString)description;
- (void)dealloc;
@end

@implementation NWConcrete_nw_socks5_connection

- (NSString)description
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  v2 = self;
  if (!v2)
  {
    __nwlog_obj();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_socks5_connection_copy_description";
    v22 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (__nwlog_fault(v22, type, &v31))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v24 = type[0];
        if (os_log_type_enabled(v23, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_socks5_connection_copy_description";
          _os_log_impl(&dword_181A5C000, v23, v24, "%{public}s called with null socksConnection", buf, 0xCu);
        }
      }

      else if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v26 = type[0];
        BOOL v27 = os_log_type_enabled(v23, type[0]);
        if (backtrace_string)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_socks5_connection_copy_description";
            __int16 v33 = 2082;
            v34 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v23,  v26,  "%{public}s called with null socksConnection, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_60;
        }

        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_socks5_connection_copy_description";
          _os_log_impl( &dword_181A5C000,  v23,  v26,  "%{public}s called with null socksConnection, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v28 = type[0];
        if (os_log_type_enabled(v23, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_socks5_connection_copy_description";
          _os_log_impl( &dword_181A5C000,  v23,  v28,  "%{public}s called with null socksConnection, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)dealloc
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v32 = "-[NWConcrete_nw_socks5_connection dealloc]";
    __int16 v33 = 2114;
    v34 = self;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %{public}@", buf, 0x16u);
  }

  byte_pointer = self->sc_out_address.byte_pointer;
  if (byte_pointer)
  {
    free(byte_pointer);
    self->sc_out_address.byte_pointer = 0LL;
  }

  if (self->sc_internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v32 = "-[NWConcrete_nw_socks5_connection dealloc]";
    int v27 = 12;
    os_log_type_t v26 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v8 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "-[NWConcrete_nw_socks5_connection dealloc]";
        _os_log_impl( &dword_181A5C000,  v7,  v8,  "%{public}s over-release of nw_socks5_connection. Object should not be internally retained while deallocating",  buf,  0xCu);
      }

- (void).cxx_destruct
{
}

@end