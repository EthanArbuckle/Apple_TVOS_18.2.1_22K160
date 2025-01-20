@interface NWConcrete_nw_proxy_config
- (NSString)description;
- (NWConcrete_nw_proxy_config)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_proxy_config

- (NWConcrete_nw_proxy_config)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_proxy_config;
  v2 = -[NWConcrete_nw_proxy_config init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_proxy_config init]";
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
        v18 = "-[NWConcrete_nw_proxy_config init]";
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
          v18 = "-[NWConcrete_nw_proxy_config init]";
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
        v18 = "-[NWConcrete_nw_proxy_config init]";
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
        v18 = "-[NWConcrete_nw_proxy_config init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_proxy_config;
  -[NWConcrete_nw_proxy_config dealloc](&v2, sel_dealloc);
}

- (NSString)description
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  v4 = Mutable;
  switch(self->mode)
  {
    case 0:
      CFStringAppendFormat(Mutable, 0LL, @"Invalid Proxy");
      break;
    case 1:
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x2020000000LL;
      char v14 = 0;
      uint64_t v9 = 0LL;
      v10 = &v9;
      uint64_t v11 = 0x2020000000LL;
      char v12 = 0;
      if (nw_dictionary_get_count((uint64_t)self->stacks))
      {
        stacks = self->stacks;
        v8[0] = MEMORY[0x1895F87A8];
        v8[1] = 3221225472LL;
        v8[2] = __41__NWConcrete_nw_proxy_config_description__block_invoke;
        v8[3] = &unk_189BBCFD8;
        v8[4] = self;
        v8[5] = v13;
        v8[6] = &v9;
        v8[7] = v4;
        nw_dictionary_apply((uint64_t)stacks, (uint64_t)v8);
      }

      if (!*((_BYTE *)v10 + 24)) {
        CFStringAppendFormat(v4, 0LL, @"%@", self->endpoint);
      }
      _Block_object_dispose(&v9, 8);
      _Block_object_dispose(v13, 8);
      break;
    case 2:
      endpoint = self->endpoint;
      goto LABEL_10;
    case 3:
      endpoint = self->pac_script;
LABEL_10:
      CFStringAppendFormat(Mutable, 0LL, @"PAC: %@", endpoint);
      break;
    case 4:
      CFStringAppendFormat(Mutable, 0LL, @"No Proxy");
      break;
    default:
      return (NSString *)v4;
  }

  return (NSString *)v4;
}

- (void).cxx_destruct
{
}

@end