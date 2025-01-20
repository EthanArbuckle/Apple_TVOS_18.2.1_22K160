@interface NWMessage
- (NWMessage)initWithContent:(id)a3 context:(id)a4;
- (OS_dispatch_data)internalContent;
- (OS_nw_content_context)internalContext;
- (void)setInternalContent:(id)a3;
- (void)setInternalContext:(id)a3;
@end

@implementation NWMessage

- (NWMessage)initWithContent:(id)a3 context:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___NWMessage;
    v9 = -[NWMessage init](&v26, sel_init);
    if (v9)
    {
      v10 = v9;
      objc_storeStrong((id *)&v9->_internalContent, a3);
      objc_storeStrong((id *)&v10->_internalContext, a4);
      goto LABEL_4;
    }

    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWMessage initWithContent:context:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWMessage initWithContent:context:]";
        v21 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v19, v20, v21, buf, 0xCu);
      }
    }

    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      BOOL v25 = os_log_type_enabled(v19, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          v30 = "-[NWMessage initWithContent:context:]";
          __int16 v31 = 2082;
          v32 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v19,  v20,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }

      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWMessage initWithContent:context:]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWMessage initWithContent:context:]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v18) {
      free(v18);
    }
    v10 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v30 = "-[NWMessage initWithContent:context:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v13, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWMessage initWithContent:context:]";
        v16 = "%{public}s called with null context";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v14, v15, v16, buf, 0xCu);
      }
    }

    else
    {
      if (v27)
      {
        v22 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v15 = type;
        BOOL v23 = os_log_type_enabled(v14, type);
        if (v22)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWMessage initWithContent:context:]";
            __int16 v31 = 2082;
            v32 = v22;
            _os_log_impl( &dword_181A5C000,  v14,  v15,  "%{public}s called with null context, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v22);
          goto LABEL_31;
        }

        if (!v23) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWMessage initWithContent:context:]";
        v16 = "%{public}s called with null context, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NWMessage initWithContent:context:]";
        v16 = "%{public}s called with null context, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (OS_dispatch_data)internalContent
{
  return self->_internalContent;
}

- (void)setInternalContent:(id)a3
{
}

- (OS_nw_content_context)internalContext
{
  return self->_internalContext;
}

- (void)setInternalContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end