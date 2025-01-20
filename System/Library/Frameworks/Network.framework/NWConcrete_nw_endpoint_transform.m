@interface NWConcrete_nw_endpoint_transform
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_transform)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_transform

- (NWConcrete_nw_endpoint_transform)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_transform;
  v2 = -[NWConcrete_nw_endpoint_transform init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
          v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
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
        v18 = "-[NWConcrete_nw_endpoint_transform init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)startWithHandler:(id)a3
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
    v24 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v24, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v45 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_181A5C000, v25, v45, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_55;
      }

      if (!v53)
      {
        __nwlog_obj();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v49 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl( &dword_181A5C000,  v25,  v49,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_55;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v47 = type;
      BOOL v48 = os_log_type_enabled(v25, type);
      if (!backtrace_string)
      {
        if (v48)
        {
          *(_DWORD *)buf = 136446210;
          v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
          _os_log_impl(&dword_181A5C000, v25, v47, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_55;
      }

      if (v48)
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[NWConcrete_nw_endpoint_transform startWithHandler:]";
        __int16 v57 = 2082;
        v58 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v25,  v47,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
    __int16 v19 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (__nwlog_fault(v19, &type, &v38))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v20, v31, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_36;
      }

      if (!v38)
      {
        __nwlog_obj();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v35 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl( &dword_181A5C000,  v20,  v35,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_36;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v33 = type;
      BOOL v34 = os_log_type_enabled(v20, type);
      if (!backtrace_string)
      {
        if (v34)
        {
          *(_DWORD *)buf = 136446210;
          v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v20, v33, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_36;
      }

      if (v34)
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_endpoint_transform cancelWithHandler:forced:]";
        __int16 v42 = 2082;
        v43 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v20,  v33,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_transform;
  -[NWConcrete_nw_endpoint_transform dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = (unsigned int *)v3;
    uint64_t v6 = v5[29];

    if ((_DWORD)v6 == 5) {
      goto LABEL_37;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    else {
      v8 = off_189BBBBC0[v6];
    }
    *(_DWORD *)buf = 136446722;
    os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
    __int16 v30 = 2082;
    os_log_type_t v31 = (void *)v8;
    __int16 v32 = 2082;
    os_log_type_t v33 = "transform";
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        else {
          BOOL v12 = off_189BBBBC0[v6];
        }
        *(_DWORD *)buf = 136446722;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = (void *)v12;
        __int16 v32 = 2082;
        os_log_type_t v33 = "transform";
        _os_log_impl( &dword_181A5C000,  v10,  v11,  "%{public}s Handler is in mode %{public}s, expected %{public}s",  buf,  0x20u);
      }
    }

    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v15)
        {
          else {
            objc_super v16 = off_189BBBBC0[v6];
          }
          *(_DWORD *)buf = 136446978;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
          __int16 v30 = 2082;
          os_log_type_t v31 = (void *)v16;
          __int16 v32 = 2082;
          os_log_type_t v33 = "transform";
          __int16 v34 = 2082;
          os_log_type_t v35 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v10,  v14,  "%{public}s Handler is in mode %{public}s, expected %{public}s, dumping backtrace:%{public}s",  buf,  0x2Au);
        }

        free(backtrace_string);
        if (v9) {
          goto LABEL_36;
        }
        goto LABEL_37;
      }

      if (v15)
      {
        else {
          __int16 v19 = off_189BBBBC0[v6];
        }
        *(_DWORD *)buf = 136446722;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = (void *)v19;
        __int16 v32 = 2082;
        os_log_type_t v33 = "transform";
        _os_log_impl( &dword_181A5C000,  v10,  v14,  "%{public}s Handler is in mode %{public}s, expected %{public}s, no backtrace",  buf,  0x20u);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v10, type))
      {
        else {
          v18 = off_189BBBBC0[v6];
        }
        *(_DWORD *)buf = 136446722;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        __int16 v30 = 2082;
        os_log_type_t v31 = (void *)v18;
        __int16 v32 = 2082;
        os_log_type_t v33 = "transform";
        _os_log_impl( &dword_181A5C000,  v10,  v17,  "%{public}s Handler is in mode %{public}s, expected %{public}s, backtrace limit exceeded",  buf,  0x20u);
      }
    }

    goto LABEL_34;
  }

  __nwlog_obj();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
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
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_181A5C000, v10, v21, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v26)
    {
      id v22 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v23 = type;
      BOOL v24 = os_log_type_enabled(v10, type);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
          __int16 v30 = 2082;
          os_log_type_t v31 = v22;
          _os_log_impl( &dword_181A5C000,  v10,  v23,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(v22);
        if (v9) {
          goto LABEL_36;
        }
        goto LABEL_37;
      }

      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl(&dword_181A5C000, v10, v23, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v29 = "-[NWConcrete_nw_endpoint_transform updatePathWithHandler:]";
        _os_log_impl( &dword_181A5C000,  v10,  v25,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
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
    char v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    __int16 v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        __int16 v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        __int16 v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
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
        __int16 v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v15, v31, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (v32)
    {
      *(_DWORD *)buf = 136446466;
      __int16 v42 = "-[NWConcrete_nw_endpoint_transform applyWithHandler:toChildren:]";
      __int16 v43 = 2082;
      __int16 v44 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v15,  v31,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
    }

@end