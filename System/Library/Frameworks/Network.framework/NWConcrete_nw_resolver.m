@interface NWConcrete_nw_resolver
- (NSString)description;
- (id).cxx_construct;
- (nw_endpoint_t)initWithEndpoint:(void *)a3 parameters:(void *)a4 path:(uint64_t)a5 log_str:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_resolver

- (nw_endpoint_t)initWithEndpoint:(void *)a3 parameters:(void *)a4 path:(uint64_t)a5 log_str:
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (!a1) {
    goto LABEL_90;
  }
  nw_endpoint_type_t v13 = nw_endpoint_get_type(v10);
  nw_endpoint_type_t v14 = v13;
  BOOL v17 = v13 - 4 < 0xFFFFFFFE && v13 - 7 < 0xFFFFFFFE && v13 != nw_endpoint_type_address;
  if (v13 <= 6)
  {
    if (((1 << v13) & 0x6E) != 0) {
      goto LABEL_13;
    }
  }

  v32 = nw_endpoint_copy_custom_resolver_block(v10);

  if (!v32)
  {
LABEL_37:
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v37 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      _os_log_impl( &dword_181A5C000,  v37,  OS_LOG_TYPE_ERROR,  "%{public}s nw_resolver_create_with_endpoint failed due to unsupported endpoint type %d",  buf,  0x12u);
    }

    goto LABEL_90;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v33 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v14;
    _os_log_impl( &dword_181A5C000,  v33,  OS_LOG_TYPE_DEBUG,  "%{public}s Creating resolver with custom endpoint type %u",  buf,  0x12u);
  }

LABEL_13:
  v78.receiver = a1;
  v78.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_resolver;
  v18 = (nw_endpoint_t *)objc_msgSendSuper2(&v78, sel_init);
  v19 = v18;
  if (!v18)
  {
    __nwlog_obj();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
    v65 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v77 = 0;
    if (__nwlog_fault(v65, type, &v77))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v67 = type[0];
        if (os_log_type_enabled(v66, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_181A5C000, v66, v67, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v77)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v69 = type[0];
        BOOL v70 = os_log_type_enabled(v66, type[0]);
        if (backtrace_string)
        {
          if (v70)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v66,  v69,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_108;
        }

        if (v70)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl(&dword_181A5C000, v66, v69, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v71 = type[0];
        if (os_log_type_enabled(v66, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_resolver initWithEndpoint:parameters:path:log_str:]";
          _os_log_impl( &dword_181A5C000,  v66,  v71,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)dealloc
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (!*((void *)self + 27) || (*((_BYTE *)self + 346) & 0x20) != 0) {
    goto LABEL_50;
  }
  if (!*((_BYTE *)self + 256))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    int v8 = *((_DWORD *)self + 85);
    *(_DWORD *)buf = 136446466;
    v56 = "-[NWConcrete_nw_resolver dealloc]";
    __int16 v57 = 1024;
    *(_DWORD *)os_log_type_t v58 = v8;
    int v50 = 18;
    char v49 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v5, type))
      {
        int v10 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        __int16 v57 = 1024;
        *(_DWORD *)os_log_type_t v58 = v10;
        _os_log_impl( &dword_181A5C000,  v5,  v9,  "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating",  buf,  0x12u);
      }

      goto LABEL_47;
    }

    if (!v53)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v5, type))
      {
        int v22 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        __int16 v57 = 1024;
        *(_DWORD *)os_log_type_t v58 = v22;
        _os_log_impl( &dword_181A5C000,  v5,  v21,  "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating, bac ktrace limit exceeded",  buf,  0x12u);
      }

      goto LABEL_47;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (os_log_s *)(id)gLogObj;
    os_log_type_t v16 = type;
    BOOL v17 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v17)
      {
        int v23 = *((_DWORD *)self + 85);
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_resolver dealloc]";
        __int16 v57 = 1024;
        *(_DWORD *)os_log_type_t v58 = v23;
        _os_log_impl( &dword_181A5C000,  v5,  v16,  "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating, no backtrace",  buf,  0x12u);
      }

      goto LABEL_47;
    }

    if (v17)
    {
      int v18 = *((_DWORD *)self + 85);
      *(_DWORD *)buf = 136446722;
      v56 = "-[NWConcrete_nw_resolver dealloc]";
      __int16 v57 = 1024;
      *(_DWORD *)os_log_type_t v58 = v18;
      *(_WORD *)&v58[4] = 2082;
      *(void *)&v58[6] = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v5,  v16,  "%{public}s [R%u] over-release of nw_resolver_t! Object should not be internally retained and deallocating, dumpi ng backtrace:%{public}s",  buf,  0x1Cu);
    }

    free(backtrace_string);
    if (!v4) {
      goto LABEL_50;
    }
LABEL_49:
    free(v4);
    goto LABEL_50;
  }

  if (__nwlog_connection_log::onceToken != -1) {
    dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
  }
  id v3 = (id)gconnectionLogObj;
  *(_DWORD *)buf = 136446466;
  v56 = "-[NWConcrete_nw_resolver dealloc]";
  __int16 v57 = 2082;
  *(void *)os_log_type_t v58 = (char *)self + 256;
  int v50 = 22;
  char v49 = buf;
  v4 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v53 = 0;
  if (!__nwlog_fault(v4, &type, &v53))
  {
LABEL_48:
    if (!v4) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }

  if (type == OS_LOG_TYPE_FAULT)
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44325);
    }
    v5 = (os_log_s *)(id)gconnectionLogObj;
    os_log_type_t v6 = type;
    if (os_log_type_enabled(v5, type))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[NWConcrete_nw_resolver dealloc]";
      __int16 v57 = 2082;
      *(void *)os_log_type_t v58 = (char *)self + 256;
      _os_log_impl( &dword_181A5C000,  v5,  v6,  "%{public}s [C%{public}s] over-release of nw_resolver_t! Object should not be internally retained and deallocating",  buf,  0x16u);
    }

- (void).cxx_destruct
{
}

- (NSString)description
{
  int v3 = *((unsigned __int8 *)self + 256);
  v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v3) {
    v5 = (__CFString *)CFStringCreateWithFormat(v4, 0LL, @"[C%s]", (char *)self + 256);
  }
  else {
    v5 = (__CFString *)CFStringCreateWithFormat(v4, 0LL, @"[R%u]", *((unsigned int *)self + 85));
  }
  return (NSString *)v5;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  return self;
}

@end