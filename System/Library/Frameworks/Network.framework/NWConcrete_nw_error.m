@interface NWConcrete_nw_error
- (NSString)description;
- (_DWORD)initWithDomain:(int)a3 code:;
@end

@implementation NWConcrete_nw_error

- (_DWORD)initWithDomain:(int)a3 code:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  v15.receiver = result;
  v15.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_error;
  result = objc_msgSendSuper2(&v15, sel_init);
  if (result)
  {
    result[2] = a2;
    result[3] = a3;
    return result;
  }

  __nwlog_obj();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
  v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v6, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v8 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_181A5C000, v7, v8, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v13)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v10 = type;
      BOOL v11 = os_log_type_enabled(v7, type);
      if (backtrace_string)
      {
        if (v11)
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
          __int16 v18 = 2082;
          v19 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_21;
      }

      if (v11)
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_181A5C000, v7, v10, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v7, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_error initWithDomain:code:]";
        _os_log_impl(&dword_181A5C000, v7, v12, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (NSString)description
{
  *(void *)&v43[61] = *MEMORY[0x1895F89C0];
  switch(self->domain)
  {
    case 0:
      return (NSString *)@"Invalid";
    case 1:
      if (strerror_r(self->code, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      v4 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], __strerrbuf, 0x8000100u);
      if (v4) {
        return (NSString *)v4;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v5 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v37 = "-[NWConcrete_nw_error description]";
      v6 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v34 = 0;
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl(&dword_181A5C000, v7, v8, "%{public}s CFStringCreateWithCString failed", buf, 0xCu);
        }

        goto LABEL_63;
      }

      if (!v34)
      {
        __nwlog_obj();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_error description]";
          _os_log_impl( &dword_181A5C000,  v7,  v32,  "%{public}s CFStringCreateWithCString failed, backtrace limit exceeded",  buf,  0xCu);
        }

@end