@interface NWConcrete_nw_endpoint_fallback
- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4;
- (NWConcrete_nw_endpoint_fallback)init;
- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)startWithHandler:(id)a3;
- (void)updatePathWithHandler:(id)a3;
@end

@implementation NWConcrete_nw_endpoint_fallback

- (NWConcrete_nw_endpoint_fallback)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_fallback;
  v2 = -[NWConcrete_nw_endpoint_fallback init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
          v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        v18 = "-[NWConcrete_nw_endpoint_fallback init]";
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
        v18 = "-[NWConcrete_nw_endpoint_fallback init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_fallback;
  -[NWConcrete_nw_endpoint_fallback dealloc](&v2, sel_dealloc);
}

- (void)startWithHandler:(id)a3
{
  uint64_t v279 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
    v194 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v257) = 0;
    if (__nwlog_fault(v194, type, &v257))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v195 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v196 = type[0];
        if (os_log_type_enabled(v195, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_181A5C000, v195, v196, "%{public}s called with null handler", buf, 0xCu);
        }
      }

      else if ((_BYTE)v257)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v195 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v198 = type[0];
        BOOL v199 = os_log_type_enabled(v195, type[0]);
        if (backtrace_string)
        {
          if (v199)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v195,  v198,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_258;
        }

        if (v199)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl(&dword_181A5C000, v195, v198, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v195 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v200 = type[0];
        if (os_log_type_enabled(v195, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "-[NWConcrete_nw_endpoint_fallback startWithHandler:]";
          _os_log_impl( &dword_181A5C000,  v195,  v200,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)cancelWithHandler:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    __nwlog_obj();
    BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
    uint64_t v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v22, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v34 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v23, v34, "%{public}s called with null handler", buf, 0xCu);
        }

        goto LABEL_45;
      }

      if (!v39)
      {
        __nwlog_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v38 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl( &dword_181A5C000,  v23,  v38,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
        }

        goto LABEL_45;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v36 = type;
      BOOL v37 = os_log_type_enabled(v23, type);
      if (!backtrace_string)
      {
        if (v37)
        {
          *(_DWORD *)buf = 136446210;
          v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
          _os_log_impl(&dword_181A5C000, v23, v36, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }

        goto LABEL_45;
      }

      if (v37)
      {
        *(_DWORD *)buf = 136446466;
        v42 = "-[NWConcrete_nw_endpoint_fallback cancelWithHandler:forced:]";
        __int16 v43 = 2082;
        v44 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v23,  v36,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

- (void)updatePathWithHandler:(id)a3
{
  uint64_t v135 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
    os_log_type_t v29 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v119 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v79 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_181A5C000, v30, v79, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v119)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      os_log_type_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v81 = type;
      BOOL v82 = os_log_type_enabled(v30, type);
      if (backtrace_string)
      {
        if (v82)
        {
          *(_DWORD *)buf = 136446466;
          v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
          __int16 v123 = 2082;
          v124 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v30,  v81,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_65;
      }

      if (v82)
      {
        *(_DWORD *)buf = 136446210;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl(&dword_181A5C000, v30, v81, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      os_log_type_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v83 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        v122 = "-[NWConcrete_nw_endpoint_fallback updatePathWithHandler:]";
        _os_log_impl( &dword_181A5C000,  v30,  v83,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (BOOL)applyWithHandler:(id)a3 toChildren:(id)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(void))a4;
  if (!v6)
  {
    __nwlog_obj();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
    os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v37 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v14, v26, "%{public}s called with null handler", buf, 0xCu);
      }
    }

    else if (v37)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v30 = type;
      BOOL v31 = os_log_type_enabled(v14, type);
      if (backtrace_string)
      {
        if (v31)
        {
          *(_DWORD *)buf = 136446466;
          v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
          __int16 v41 = 2082;
          v42 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v14,  v30,  "%{public}s called with null handler, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_41;
      }

      if (v31)
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl(&dword_181A5C000, v14, v30, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWConcrete_nw_endpoint_fallback applyWithHandler:toChildren:]";
        _os_log_impl( &dword_181A5C000,  v14,  v35,  "%{public}s called with null handler, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (void).cxx_destruct
{
}

@end