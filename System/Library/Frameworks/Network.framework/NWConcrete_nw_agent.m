@interface NWConcrete_nw_agent
- (NWConcrete_nw_agent)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_agent

- (NWConcrete_nw_agent)init
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_agent;
  id v2 = -[NWConcrete_nw_agent init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    uuid_generate_random((unsigned __int8 *)v2 + 720);
    v4 = nw_dictionary_create();
    v5 = (void *)v3[92];
    v3[92] = v4;

    *((_DWORD *)v3 + 3) = nw_agent_get_next_id();
    v6 = v3;
    goto LABEL_3;
  }

  __nwlog_obj();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWConcrete_nw_agent init]";
  v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v9, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_agent init]";
        _os_log_impl(&dword_181A5C000, v10, v11, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v16)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      BOOL v14 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136446466;
          v20 = "-[NWConcrete_nw_agent init]";
          __int16 v21 = 2082;
          v22 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v10,  v13,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v14)
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_agent init]";
        _os_log_impl(&dword_181A5C000, v10, v13, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_agent init]";
        _os_log_impl(&dword_181A5C000, v10, v15, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  if (*((_BYTE *)self + 712))
  {
    unint64_t v3 = 0LL;
    v4 = (void **)((char *)self + 368);
    do
    {
      v5 = *(v4 - 1);
      *(v4 - 1) = 0LL;

      v6 = *v4;
      void *v4 = 0LL;
      v4 += 3;

      ++v3;
    }

    while (v3 < *((unsigned __int8 *)self + 712));
  }

  v7 = (dispatch_source_s *)*((void *)self + 106);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = (void *)*((void *)self + 106);
    *((void *)self + 106) = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_agent;
  -[NWConcrete_nw_agent dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 31, 0LL);
  objc_storeStrong((id *)self + 30, 0LL);
  objc_storeStrong((id *)self + 28, 0LL);
  objc_storeStrong((id *)self + 27, 0LL);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *(_OWORD *)((char *)self + 360) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *(_OWORD *)((char *)self + 504) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *(_OWORD *)((char *)self + 648) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  return self;
}

@end