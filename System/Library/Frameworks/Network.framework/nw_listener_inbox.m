@interface nw_listener_inbox
- (BOOL)cancel;
- (BOOL)isSuspended;
- (BOOL)multicast;
- (BOOL)resume;
- (BOOL)suspend;
- (OS_nw_endpoint)local_endpoint;
- (OS_nw_interface)interface;
- (id)start;
- (nw_listener_inbox)initWithDelegate:(id)a3;
- (void)setMulticast:(BOOL)a3;
@end

@implementation nw_listener_inbox

- (id)start
{
  return 0LL;
}

- (nw_listener_inbox)initWithDelegate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___nw_listener_inbox;
  v6 = -[nw_listener_inbox init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = v7;
    goto LABEL_3;
  }

  __nwlog_obj();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[nw_listener_inbox initWithDelegate:]";
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v11, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[nw_listener_inbox initWithDelegate:]";
        _os_log_impl(&dword_181A5C000, v12, v13, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      BOOL v16 = os_log_type_enabled(v12, type);
      if (backtrace_string)
      {
        if (v16)
        {
          *(_DWORD *)buf = 136446466;
          v22 = "-[nw_listener_inbox initWithDelegate:]";
          __int16 v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[nw_listener_inbox initWithDelegate:]";
        _os_log_impl(&dword_181A5C000, v12, v15, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[nw_listener_inbox initWithDelegate:]";
        _os_log_impl(&dword_181A5C000, v12, v17, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (BOOL)suspend
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  char v2 = *((_BYTE *)self + 60);
  if ((v2 & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136446466;
      v7 = "-[nw_listener_inbox suspend]";
      __int16 v8 = 2114;
      v9 = self;
      _os_log_impl(&dword_181A5C000, v4, OS_LOG_TYPE_INFO, "%{public}s Suspending %{public}@", (uint8_t *)&v6, 0x16u);
    }

    *((_BYTE *)self + 60) |= 1u;
  }

  return (v2 & 1) == 0;
}

- (BOOL)isSuspended
{
  return *((_BYTE *)self + 60) & 1;
}

- (BOOL)resume
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  char v2 = *((_BYTE *)self + 60);
  if ((v2 & 1) != 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136446466;
      v7 = "-[nw_listener_inbox resume]";
      __int16 v8 = 2114;
      v9 = self;
      _os_log_impl(&dword_181A5C000, v4, OS_LOG_TYPE_INFO, "%{public}s Resuming %{public}@", (uint8_t *)&v6, 0x16u);
    }

    *((_BYTE *)self + 60) &= ~1u;
  }

  return v2 & 1;
}

- (BOOL)cancel
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v3 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  os_log_type_t v17 = "-[nw_listener_inbox cancel]";
  __int16 v18 = 2114;
  v19 = self;
  v4 = (char *)_os_log_send_and_compose_impl();

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
      *(_DWORD *)buf = 136446466;
      os_log_type_t v17 = "-[nw_listener_inbox cancel]";
      __int16 v18 = 2114;
      v19 = self;
      v7 = "%{public}s %{public}@ empty cancel";
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
      *(_DWORD *)buf = 136446466;
      os_log_type_t v17 = "-[nw_listener_inbox cancel]";
      __int16 v18 = 2114;
      v19 = self;
      v7 = "%{public}s %{public}@ empty cancel, backtrace limit exceeded";
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
          return 0;
        }
        goto LABEL_11;
      }

      *(_DWORD *)buf = 136446466;
      os_log_type_t v17 = "-[nw_listener_inbox cancel]";
      __int16 v18 = 2114;
      v19 = self;
      v7 = "%{public}s %{public}@ empty cancel, no backtrace";
      v12 = v5;
      os_log_type_t v13 = v9;
LABEL_16:
      _os_log_impl(&dword_181A5C000, v12, v13, v7, buf, 0x16u);
      goto LABEL_17;
    }

    if (v10)
    {
      *(_DWORD *)buf = 136446722;
      os_log_type_t v17 = "-[nw_listener_inbox cancel]";
      __int16 v18 = 2114;
      v19 = self;
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v5,  v9,  "%{public}s %{public}@ empty cancel, dumping backtrace:%{public}s",  buf,  0x20u);
    }

    free(backtrace_string);
  }

  if (v4) {
LABEL_11:
  }
    free(v4);
  return 0;
}

- (OS_nw_endpoint)local_endpoint
{
  return self->_local_endpoint;
}

- (OS_nw_interface)interface
{
  return self->_interface;
}

- (BOOL)multicast
{
  return self->_multicast;
}

- (void)setMulticast:(BOOL)a3
{
  self->_multicast = a3;
}

- (void).cxx_destruct
{
}

@end