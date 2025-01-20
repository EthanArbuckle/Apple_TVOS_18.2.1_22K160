@interface NWConcrete_tcp_connection
- (char)initWithParameters:(char *)a1;
- (void)dealloc;
@end

@implementation NWConcrete_tcp_connection

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t tc_id = self->tc_id;
    *(_DWORD *)buf = 136446466;
    v21 = "-[NWConcrete_tcp_connection dealloc]";
    __int16 v22 = 2048;
    unint64_t v23 = tc_id;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %llu", buf, 0x16u);
  }

  if (self->tc_internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v21 = "-[NWConcrete_tcp_connection dealloc]";
    int v16 = 12;
    v15 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v18 = 0;
    if (__nwlog_fault(v6, &type, &v18))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v9 = "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating";
LABEL_18:
        v13 = v7;
        os_log_type_t v14 = v8;
        goto LABEL_19;
      }

      if (!v18)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v9 = "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating, b"
             "acktrace limit exceeded";
        goto LABEL_18;
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
LABEL_20:

          if (!v6) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }

        *(_DWORD *)buf = 136446210;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        v9 = "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating, no backtrace";
        v13 = v7;
        os_log_type_t v14 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v13, v14, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v21 = "-[NWConcrete_tcp_connection dealloc]";
        __int16 v22 = 2082;
        unint64_t v23 = (unint64_t)backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s over-release of tcp_connection_t. Object should not be internally retained while deallocating, dump ing backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (v6) {
LABEL_14:
    }
      free(v6);
  }

- (void).cxx_destruct
{
}

- (char)initWithParameters:(char *)a1
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (!a1) {
    goto LABEL_50;
  }
  v38.receiver = a1;
  v38.super_class = (Class)&OBJC_CLASS___NWConcrete_tcp_connection;
  v4 = (char *)objc_msgSendSuper2(&v38, sel_init);
  a1 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v36 = 0;
    if (__nwlog_fault(v29, &type, &v36))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v30, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_181A5C000, v30, v31, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v36)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v33 = type;
        BOOL v34 = os_log_type_enabled(v30, type);
        if (backtrace_string)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
            __int16 v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v30,  v33,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_67;
        }

        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl(&dword_181A5C000, v30, v33, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v35 = type;
        if (os_log_type_enabled(v30, type))
        {
          *(_DWORD *)buf = 136446210;
          v40 = "-[NWConcrete_tcp_connection initWithParameters:]";
          _os_log_impl( &dword_181A5C000,  v30,  v35,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end