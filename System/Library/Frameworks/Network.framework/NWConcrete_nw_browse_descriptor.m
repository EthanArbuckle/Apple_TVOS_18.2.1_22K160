@interface NWConcrete_nw_browse_descriptor
- (NSString)description;
- (NWConcrete_nw_browse_descriptor)init;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_browse_descriptor

- (NWConcrete_nw_browse_descriptor)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_browse_descriptor;
  v2 = -[NWConcrete_nw_browse_descriptor init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 11) = -1LL;
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
          v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
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
        v18 = "-[NWConcrete_nw_browse_descriptor init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v3 = (void *)*((void *)self + 2);
  if (v3)
  {
    free(v3);
    *((void *)self + 2) = 0LL;
  }

  v4 = (void *)*((void *)self + 3);
  if (v4)
  {
    free(v4);
    *((void *)self + 3) = 0LL;
  }

  v5 = (void *)*((void *)self + 9);
  if (v5)
  {
    free(v5);
    *((void *)self + 9) = 0LL;
  }

  v6 = (void *)*((void *)self + 10);
  if (v6)
  {
    free(v6);
    *((void *)self + 10) = 0LL;
  }

  v7 = (void *)*((void *)self + 4);
  if (v7)
  {
    free(v7);
    *((void *)self + 4) = 0LL;
  }

  v8 = (void *)*((void *)self + 5);
  if (v8)
  {
    free(v8);
    *((void *)self + 5) = 0LL;
  }

  os_log_type_t v9 = (void *)*((void *)self + 13);
  *((void *)self + 13) = 0LL;

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_browse_descriptor;
  -[NWConcrete_nw_browse_descriptor dealloc](&v10, sel_dealloc);
}

- (NSString)description
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = nw_browse_descriptor_get_description(self, 0);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = nw_browse_descriptor_get_description(self, 1);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end