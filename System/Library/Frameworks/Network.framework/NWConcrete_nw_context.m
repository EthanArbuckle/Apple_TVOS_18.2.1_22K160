@interface NWConcrete_nw_context
- (BOOL)initWithIdentifier:(void *)a1;
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_context

- (BOOL)initWithIdentifier:(void *)a1
{
  id v2 = a1;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return (BOOL)v2;
  }
  if (!a2)
  {
    __nwlog_obj();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
    v7 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (__nwlog_fault(v7, &type, &v25))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v9 = type;
        if (os_log_type_enabled(v8, type))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s called with null _identifier", buf, 0xCu);
        }
      }

      else if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v17 = type;
        BOOL v18 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
            __int16 v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v8,  v17,  "%{public}s called with null _identifier, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_38;
        }

        if (v18)
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl(&dword_181A5C000, v8, v17, "%{public}s called with null _identifier, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v22 = type;
        if (os_log_type_enabled(v8, type))
        {
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWConcrete_nw_context initWithIdentifier:]";
          _os_log_impl( &dword_181A5C000,  v8,  v22,  "%{public}s called with null _identifier, backtrace limit exceeded",  buf,  0xCu);
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

  nw_context_dealloc(self, 0);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_context;
  -[NWConcrete_nw_context dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  unsigned int v2 = *((_DWORD *)self + 31) - 1;
  if (v2 > 3) {
    v3 = "unknown";
  }
  else {
    v3 = off_189BB6080[v2];
  }
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_context %s (%s)>",  *((void *)self + 2),  v3);
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