@interface NWConcrete_nw_h3_0rtt_storage_canvas
- (NWConcrete_nw_h3_0rtt_storage_canvas)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_h3_0rtt_storage_canvas

- (NWConcrete_nw_h3_0rtt_storage_canvas)init
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_h3_0rtt_storage_canvas;
  v2 = -[NWConcrete_nw_h3_0rtt_storage_canvas init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
        v10 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v8, v9, v10, buf, 0xCu);
      }
    }

    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
            __int16 v18 = 2082;
            v19 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
        v10 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWConcrete_nw_h3_0rtt_storage_canvas init]";
        v10 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_h3_0rtt_storage_canvas;
  -[NWConcrete_nw_h3_0rtt_storage_canvas dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end