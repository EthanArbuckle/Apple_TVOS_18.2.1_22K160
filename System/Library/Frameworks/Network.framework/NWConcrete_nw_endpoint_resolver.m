@interface NWConcrete_nw_endpoint_resolver
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_resolver)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_resolver

- (NWConcrete_nw_endpoint_resolver)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_resolver;
  v2 = -[NWConcrete_nw_endpoint_resolver init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
          v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
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
        v18 = "-[NWConcrete_nw_endpoint_resolver init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)startWithHandler:(id)a3
{
  uint64_t v112 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
    v25 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v100 = 0;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v68 = type[0];
      if (os_log_type_enabled(v26, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_181A5C000, v26, v68, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v100)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v70 = type[0];
      BOOL v71 = os_log_type_enabled(v26, type[0]);
      if (backtrace_string)
      {
        if (v71)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v26,  v70,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_70;
      }

      if (v71)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl(&dword_181A5C000, v26, v70, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v81 = type[0];
      if (os_log_type_enabled(v26, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_resolver startWithHandler:]";
        _os_log_impl( &dword_181A5C000,  v26,  v81,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
    uint64_t v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v40 = 0;
    if (__nwlog_fault(v21, &type, &v40))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v33 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v22, v33, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_42;
      }

      if (!v40)
      {
        __nwlog_obj();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v37 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl( &dword_181A5C000,  v22,  v37,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_42;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      BOOL v36 = os_log_type_enabled(v22, type);
      if (!backtrace_string)
      {
        if (v36)
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v22, v35, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_42;
      }

      if (v36)
      {
        *(_DWORD *)buf = 136446466;
        v43 = "-[NWConcrete_nw_endpoint_resolver cancelWithHandler:forced:]";
        __int16 v44 = 2082;
        v45 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v22,  v35,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_resolver;
  -[NWConcrete_nw_endpoint_resolver dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (__nwlog_fault(v9, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_181A5C000, v10, v21, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_35;
      }

      if (!v26)
      {
        __nwlog_obj();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl( &dword_181A5C000,  v10,  v25,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_35;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v10, type);
      if (!backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
          _os_log_impl(&dword_181A5C000, v10, v23, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_35;
      }

      if (v24)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_resolver updatePathWithHandler:]";
        __int16 v30 = 2082;
        BOOL v31 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v10,  v23,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    __nwlog_obj();
    char v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
    os_log_type_t v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v27 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v15, v27, "%{public}s called with null handler", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (!v39)
    {
      __nwlog_obj();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl( &dword_181A5C000,  v15,  v35,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v31 = type;
    BOOL v32 = os_log_type_enabled(v15, type);
    if (!backtrace_string)
    {
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      v42 = "-[NWConcrete_nw_endpoint_resolver applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      __int16 v44 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v15,  v31,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
    }

@end