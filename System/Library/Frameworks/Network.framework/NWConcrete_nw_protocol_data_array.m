@interface NWConcrete_nw_protocol_data_array
- (NWConcrete_nw_protocol_data_array)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_data_array

- (NWConcrete_nw_protocol_data_array)init
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_data_array;
  v2 = -[NWConcrete_nw_protocol_data_array init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v4->frame_array.tqh_first = 0LL;
    v4->frame_array.tqh_last = &v4->frame_array.tqh_first;
    v4->frame_count = 0;

    v5 = v4;
    goto LABEL_3;
  }

  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWConcrete_nw_protocol_data_array init]";
  v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v15 = 0;
  if (__nwlog_fault(v8, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_protocol_data_array init]";
        _os_log_impl(&dword_181A5C000, v9, v10, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v15)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      BOOL v13 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136446466;
          v19 = "-[NWConcrete_nw_protocol_data_array init]";
          __int16 v20 = 2082;
          v21 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v9,  v12,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v13)
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_protocol_data_array init]";
        _os_log_impl(&dword_181A5C000, v9, v12, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_protocol_data_array init]";
        _os_log_impl(&dword_181A5C000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v8 = __44__NWConcrete_nw_protocol_data_array_dealloc__block_invoke;
  v9 = &unk_189BC7910;
  os_log_type_t v10 = self;
  tqh_first = self->frame_array.tqh_first;
  do
  {
    if (!tqh_first) {
      break;
    }
    v4 = (nw_frame *)*((void *)tqh_first + 4);
    char v5 = ((uint64_t (*)(void *))v8)(v7);
    tqh_first = v4;
  }

  while ((v5 & 1) != 0);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_data_array;
  -[NWConcrete_nw_protocol_data_array dealloc](&v6, sel_dealloc);
}

@end