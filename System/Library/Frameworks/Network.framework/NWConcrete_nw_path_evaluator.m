@interface NWConcrete_nw_path_evaluator
- (NSString)description;
- (NWConcrete_nw_path_evaluator)init;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_path_evaluator

- (NWConcrete_nw_path_evaluator)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_path_evaluator;
  v2 = -[NWConcrete_nw_path_evaluator init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path_evaluator init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_evaluator init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_path_evaluator init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_evaluator init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_evaluator init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
    __int16 v23 = 1042;
    int v24 = 16;
    __int16 v25 = 2098;
    v26 = (char *)self + 80;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %{public,uuid}.16P", buf, 0x1Cu);
  }

  id v4 = nw_parameters_copy_context(*((void **)self + 1));
  int v5 = nw_path_shared_necp_fd(v4);

  if ((v5 & 0x80000000) == 0 && !uuid_is_null((const unsigned __int8 *)self + 80) && necp_client_action())
  {
    int v6 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (os_log_s *)(id)gLogObj;
    v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
        __int16 v23 = 1024;
        int v24 = 2;
        _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d",  buf,  0x12u);
      }

      goto LABEL_5;
    }

    *(_DWORD *)buf = 136446466;
    v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
    __int16 v23 = 1024;
    int v24 = v6;
    int v17 = 18;
    objc_super v16 = buf;
    os_log_type_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v19 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[NWConcrete_nw_path_evaluator dealloc]";
        __int16 v23 = 1024;
        int v24 = v6;
        _os_log_impl( &dword_181A5C000,  v10,  v11,  "%{public}s NECP_CLIENT_ACTION_REMOVE error %{darwin.errno}d",  buf,  0x12u);
      }

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = nw_path_evaluator_copy_description(self);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  return (NSString *)v2;
}

- (id)redactedDescription
{
  v2 = nw_path_evaluator_copy_description_level(self, 2);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  return v2;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 24) = 0;
  return self;
}

@end