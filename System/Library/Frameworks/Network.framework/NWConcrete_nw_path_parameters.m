@interface NWConcrete_nw_path_parameters
- (NWConcrete_nw_path_parameters)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_path_parameters

- (NWConcrete_nw_path_parameters)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_path_parameters;
  v2 = -[NWConcrete_nw_path_parameters init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path_parameters init]";
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
        v18 = "-[NWConcrete_nw_path_parameters init]";
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
          v18 = "-[NWConcrete_nw_path_parameters init]";
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
        v18 = "-[NWConcrete_nw_path_parameters init]";
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
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v3 = *(void **)&self->joinable_path_value.fallback_mode;
  if (v3)
  {
    free(v3);
    *(void *)&self->joinable_path_value.fallback_mode = 0LL;
  }

  account_id = self->account_id;
  if (account_id)
  {
    free(account_id);
    self->account_id = 0LL;
  }

  attribution_context = self->attribution_context;
  if (attribution_context)
  {
    free(attribution_context);
    self->attribution_context = 0LL;
  }

  required_interface = self->required_interface;
  if (required_interface)
  {
    v7 = *(void **)required_interface;
    *(void *)required_interface = 0LL;

    v8 = self->required_interface;
    os_log_type_t v9 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = 0LL;

    v10 = self->required_interface;
    os_log_type_t v11 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = 0LL;

    BOOL v12 = self->required_interface;
    os_log_type_t v13 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = 0LL;

    char v14 = self->required_interface;
    v15 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = 0LL;

    objc_super v16 = self->required_interface;
    v17 = (void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = 0LL;

    v18 = self->required_interface;
    __int16 v19 = (void *)*((void *)v18 + 6);
    *((void *)v18 + 6) = 0LL;

    v20 = self->required_interface;
    uint64_t v21 = (void *)*((void *)v20 + 7);
    *((void *)v20 + 7) = 0LL;

    v22 = self->required_interface;
    v23 = (void *)*((void *)v22 + 8);
    *((void *)v22 + 8) = 0LL;

    v24 = self->required_interface;
    v25 = (void *)*((void *)v24 + 9);
    *((void *)v24 + 9) = 0LL;

    v26 = self->required_interface;
    v27 = (void *)*((void *)v26 + 10);
    *((void *)v26 + 10) = 0LL;

    v28 = self->required_interface;
    v29 = (void *)*((void *)v28 + 11);
    *((void *)v28 + 11) = 0LL;

    v30 = self->required_interface;
    v31 = (void *)*((void *)v30 + 12);
    *((void *)v30 + 12) = 0LL;

    v32 = self->required_interface;
    v33 = (void *)*((void *)v32 + 13);
    *((void *)v32 + 13) = 0LL;

    v34 = self->required_interface;
    v35 = (void *)*((void *)v34 + 14);
    *((void *)v34 + 14) = 0LL;

    v36 = self->required_interface;
    v37 = (void *)*((void *)v36 + 15);
    *((void *)v36 + 15) = 0LL;

    v38 = self->required_interface;
    v39 = (void *)*((void *)v38 + 16);
    *((void *)v38 + 16) = 0LL;

    v40 = self->required_interface;
    v41 = (void *)*((void *)v40 + 17);
    *((void *)v40 + 17) = 0LL;

    v42 = self->required_interface;
    if (v42)
    {
      free(v42);
      self->required_interface = 0LL;
    }
  }

  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_path_parameters;
  -[NWConcrete_nw_path_parameters dealloc](&v43, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end