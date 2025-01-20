@interface NWConcrete_nw_unique_connection
- (NSString)description;
- (NWConcrete_nw_unique_connection)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_unique_connection

- (NWConcrete_nw_unique_connection)init
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_unique_connection;
  v2 = -[NWConcrete_nw_unique_connection init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      unint64_t v4 = __ldaxr(&-[NWConcrete_nw_unique_connection init]::sNWSCUCUniqueID);
    while (__stlxr(v4 + 1, &-[NWConcrete_nw_unique_connection init]::sNWSCUCUniqueID));
    v2->uniqueID = v4;
    v2->dupedSocketFD = -1;
    v5 = v2;
    goto LABEL_4;
  }

  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWConcrete_nw_unique_connection init]";
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
        v19 = "-[NWConcrete_nw_unique_connection init]";
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
          v19 = "-[NWConcrete_nw_unique_connection init]";
          __int16 v20 = 2082;
          v21 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v9,  v12,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_21;
      }

      if (v13)
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_unique_connection init]";
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
        v19 = "-[NWConcrete_nw_unique_connection init]";
        _os_log_impl(&dword_181A5C000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if ((self->dupedSocketFD & 0x80000000) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    objc_super v17 = "-[NWConcrete_nw_unique_connection dealloc]";
    __int16 v18 = 2114;
    v19 = self;
    int v12 = 22;
    v11 = buf;
    unint64_t v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v14 = 0;
    if (__nwlog_fault(v4, &type, &v14))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (os_log_s *)(id)gLogObj;
        os_log_type_t v6 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)buf = 136446466;
          objc_super v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          __int16 v18 = 2114;
          v19 = self;
          _os_log_impl( &dword_181A5C000,  v5,  v6,  "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD",  buf,  0x16u);
        }
      }

      else if (v14)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        BOOL v9 = os_log_type_enabled(v5, type);
        if (backtrace_string)
        {
          if (v9)
          {
            *(_DWORD *)buf = 136446722;
            objc_super v17 = "-[NWConcrete_nw_unique_connection dealloc]";
            __int16 v18 = 2114;
            v19 = self;
            __int16 v20 = 2082;
            v21 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v5,  v8,  "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, dumping backtrace:%{public}s",  buf,  0x20u);
          }

          free(backtrace_string);
          if (!v4) {
            goto LABEL_9;
          }
          goto LABEL_8;
        }

        if (v9)
        {
          *(_DWORD *)buf = 136446466;
          objc_super v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          __int16 v18 = 2114;
          v19 = self;
          _os_log_impl( &dword_181A5C000,  v5,  v8,  "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, no backtrace",  buf,  0x16u);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v5 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)buf = 136446466;
          objc_super v17 = "-[NWConcrete_nw_unique_connection dealloc]";
          __int16 v18 = 2114;
          v19 = self;
          _os_log_impl( &dword_181A5C000,  v5,  v10,  "%{public}s nw_unique_connection %{public}@ dealloc with dupedSocketFD, backtrace limit exceeded",  buf,  0x16u);
        }
      }
    }

    if (!v4)
    {
LABEL_9:
      close(self->dupedSocketFD);
      self->dupedSocketFD = -1;
      goto LABEL_10;
    }

- (NSString)description
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v2 = self;
  if (!v2)
  {
    __nwlog_obj();
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = "nw_unique_connection_copy_description";
    char v15 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v15, type, &v24))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl(&dword_181A5C000, v16, v17, "%{public}s called with null uniqueConnection", (uint8_t *)out, 0xCu);
        }
      }

      else if (v24)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v19 = type[0];
        BOOL v20 = os_log_type_enabled(v16, type[0]);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)uuid_string_t out = 136446466;
            *(void *)&out[4] = "nw_unique_connection_copy_description";
            *(_WORD *)&out[12] = 2082;
            *(void *)&out[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v16,  v19,  "%{public}s called with null uniqueConnection, dumping backtrace:%{public}s",  (uint8_t *)out,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }

        if (v20)
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl( &dword_181A5C000,  v16,  v19,  "%{public}s called with null uniqueConnection, no backtrace",  (uint8_t *)out,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type[0];
        if (os_log_type_enabled(v16, type[0]))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_copy_description";
          _os_log_impl( &dword_181A5C000,  v16,  v21,  "%{public}s called with null uniqueConnection, backtrace limit exceeded",  (uint8_t *)out,  0xCu);
        }
      }
    }

- (void).cxx_destruct
{
}

@end