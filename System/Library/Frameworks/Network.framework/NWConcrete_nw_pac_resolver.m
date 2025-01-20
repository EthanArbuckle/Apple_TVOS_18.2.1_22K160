@interface NWConcrete_nw_pac_resolver
- (NWConcrete_nw_pac_resolver)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_pac_resolver

- (NWConcrete_nw_pac_resolver)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_pac_resolver;
  v2 = -[NWConcrete_nw_pac_resolver init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_pac_resolver init]";
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
        v18 = "-[NWConcrete_nw_pac_resolver init]";
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
          v18 = "-[NWConcrete_nw_pac_resolver init]";
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
        v18 = "-[NWConcrete_nw_pac_resolver init]";
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
        v18 = "-[NWConcrete_nw_pac_resolver init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2 = self;
  v3 = (const void *)*((void *)v2 + 3);
  if (v3)
  {
    CFRelease(v3);
    *((void *)v2 + 3) = 0LL;
  }

  v4 = (const void *)*((void *)v2 + 4);
  if (v4)
  {
    CFRelease(v4);
    *((void *)v2 + 4) = 0LL;
  }

  v5 = (const void *)*((void *)v2 + 5);
  if (v5)
  {
    CFRelease(v5);
    *((void *)v2 + 5) = 0LL;
  }

  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_pac_resolver;
  -[NWConcrete_nw_pac_resolver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 20) = 0;
  return self;
}

@end