@interface NWConcrete_nw_unique_connection_request
- (NSString)description;
- (NWConcrete_nw_unique_connection_request)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_unique_connection_request

- (NWConcrete_nw_unique_connection_request)init
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_unique_connection_request;
  v2 = -[NWConcrete_nw_unique_connection_request init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      unint64_t v4 = __ldaxr(&-[NWConcrete_nw_unique_connection_request init]::sNWSCUCRUniqueID);
    while (__stlxr(v4 + 1, &-[NWConcrete_nw_unique_connection_request init]::sNWSCUCRUniqueID));
    v2->uniqueID = v4;
    v5 = v2;
    goto LABEL_4;
  }

  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
          v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v19 = "-[NWConcrete_nw_unique_connection_request init]";
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
        v19 = "-[NWConcrete_nw_unique_connection_request init]";
        _os_log_impl(&dword_181A5C000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  rejectTimer = self->rejectTimer;
  if (rejectTimer)
  {
    nw_queue_cancel_source((uint64_t)rejectTimer, (uint64_t)a2);
    self->rejectTimer = 0LL;
  }

  preexistingConnectionTimer = self->preexistingConnectionTimer;
  if (preexistingConnectionTimer)
  {
    nw_queue_cancel_source((uint64_t)preexistingConnectionTimer, (uint64_t)a2);
    self->preexistingConnectionTimer = 0LL;
  }

  incomingReqBytesToVerify = self->incomingReqBytesToVerify;
  if (incomingReqBytesToVerify)
  {
    free(incomingReqBytesToVerify);
    self->incomingReqBytesToVerify = 0LL;
  }

  self->incomingReqBytesToVerifyLen = 0;
  if (!self->requestCompletionBlock) {
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v6 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  __int16 v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
  __int16 v21 = 2114;
  uint64_t v22 = self;
  int v15 = 22;
  os_log_type_t v14 = buf;
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v7, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (os_log_s *)(id)gLogObj;
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        __int16 v21 = 2114;
        uint64_t v22 = self;
        _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s Dealloc of %{public}@ with requestCompletionBlock present",  buf,  0x16u);
      }
    }

    else if (v17)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446722;
          __int16 v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
          __int16 v21 = 2114;
          uint64_t v22 = self;
          __int16 v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, dumping backtrace:%{public}s",  buf,  0x20u);
        }

        free(backtrace_string);
        if (v7) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        __int16 v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        __int16 v21 = 2114;
        uint64_t v22 = self;
        _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, no backtrace",  buf,  0x16u);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (os_log_s *)(id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v20 = "-[NWConcrete_nw_unique_connection_request dealloc]";
        __int16 v21 = 2114;
        uint64_t v22 = self;
        _os_log_impl( &dword_181A5C000,  v8,  v13,  "%{public}s Dealloc of %{public}@ with requestCompletionBlock present, backtrace limit exceeded",  buf,  0x16u);
      }
    }
  }

  if (v7) {
LABEL_14:
  }
    free(v7);
LABEL_15:
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_unique_connection_request;
  -[NWConcrete_nw_unique_connection_request dealloc](&v16, sel_dealloc, v14, v15);
}

- (NSString)description
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v2 = self;
  if (!v2)
  {
    __nwlog_obj();
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = "nw_unique_connection_request_copy_description";
    __int16 v21 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(v29) = 16;
    char v30 = 0;
    if (__nwlog_fault(v21, &v29, &v30))
    {
      if (v29 == 17)
      {
        __nwlog_obj();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v23 = v29;
        if (os_log_type_enabled(v22, (os_log_type_t)v29))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl(&dword_181A5C000, v22, v23, "%{public}s called with null request", (uint8_t *)out, 0xCu);
        }
      }

      else if (v30)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v25 = v29;
        BOOL v26 = os_log_type_enabled(v22, (os_log_type_t)v29);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)uuid_string_t out = 136446466;
            *(void *)&out[4] = "nw_unique_connection_request_copy_description";
            *(_WORD *)&out[12] = 2082;
            *(void *)&out[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v22,  v25,  "%{public}s called with null request, dumping backtrace:%{public}s",  (uint8_t *)out,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_43;
        }

        if (v26)
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl( &dword_181A5C000,  v22,  v25,  "%{public}s called with null request, no backtrace",  (uint8_t *)out,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v27 = v29;
        if (os_log_type_enabled(v22, (os_log_type_t)v29))
        {
          *(_DWORD *)uuid_string_t out = 136446210;
          *(void *)&out[4] = "nw_unique_connection_request_copy_description";
          _os_log_impl( &dword_181A5C000,  v22,  v27,  "%{public}s called with null request, backtrace limit exceeded",  (uint8_t *)out,  0xCu);
        }
      }
    }

- (void).cxx_destruct
{
}

@end