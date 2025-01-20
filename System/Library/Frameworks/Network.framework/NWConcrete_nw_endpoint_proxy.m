@interface NWConcrete_nw_endpoint_proxy
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_proxy)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_proxy

- (NWConcrete_nw_endpoint_proxy)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_proxy;
  v2 = -[NWConcrete_nw_endpoint_proxy init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
          v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
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
        v18 = "-[NWConcrete_nw_endpoint_proxy init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_proxy;
  -[NWConcrete_nw_endpoint_proxy dealloc](&v2, sel_dealloc);
}

- (void)startWithHandler:(id)a3
{
  uint64_t v289 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
    v202 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v261) = 0;
    if (__nwlog_fault(v202, type, &v261))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v203 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v204 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_181A5C000, v203, v204, "%{public}s called with null handler", buf, 0xCu);
        }
      }

      else if ((_BYTE)v261)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v203 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v206 = type[0];
        BOOL v207 = os_log_type_enabled(v203, type[0]);
        if (backtrace_string)
        {
          if (v207)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v203,  v206,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_253;
        }

        if (v207)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl(&dword_181A5C000, v203, v206, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v203 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v212 = type[0];
        if (os_log_type_enabled(v203, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]";
          _os_log_impl( &dword_181A5C000,  v203,  v212,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
    v25 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v63 = 0;
    if (__nwlog_fault(v25, &type, &v63))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v53 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)buf = 136446210;
          v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v26, v53, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_57;
      }

      if (!v63)
      {
        __nwlog_obj();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v57 = type;
        if (os_log_type_enabled(v26, type))
        {
          *(_DWORD *)buf = 136446210;
          v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl( &dword_181A5C000,  v26,  v57,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_57;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v55 = type;
      BOOL v56 = os_log_type_enabled(v26, type);
      if (!backtrace_string)
      {
        if (v56)
        {
          *(_DWORD *)buf = 136446210;
          v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v26, v55, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_57;
      }

      if (v56)
      {
        *(_DWORD *)buf = 136446466;
        v66 = "-[NWConcrete_nw_endpoint_proxy cancelWithHandler:forced:]";
        __int16 v67 = 2082;
        v68 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v26,  v55,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v122 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    __int16 v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
    uint64_t v22 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v110 = 0;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v76 = type[0];
      if (os_log_type_enabled(v23, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_181A5C000, v23, v76, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v110)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v78 = type[0];
      BOOL v79 = os_log_type_enabled(v23, type[0]);
      if (backtrace_string)
      {
        if (v79)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v23,  v78,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_85;
      }

      if (v79)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl(&dword_181A5C000, v23, v78, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v87 = type[0];
      if (os_log_type_enabled(v23, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_proxy updatePathWithHandler:]";
        _os_log_impl( &dword_181A5C000,  v23,  v87,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    id v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
    id v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v27 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        id v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v15, v27, "%{public}s called with null handler", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (!v39)
    {
      __nwlog_obj();
      char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        id v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl( &dword_181A5C000,  v15,  v35,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v31 = type;
    BOOL v32 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        id v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      id v42 = "-[NWConcrete_nw_endpoint_proxy applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      v44 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v15,  v31,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
    }

- (void).cxx_destruct
{
}

@end