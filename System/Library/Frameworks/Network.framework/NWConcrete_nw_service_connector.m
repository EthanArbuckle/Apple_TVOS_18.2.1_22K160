@interface NWConcrete_nw_service_connector
- (NSString)description;
- (NWConcrete_nw_service_connector)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_service_connector

- (NWConcrete_nw_service_connector)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_service_connector;
  v2 = -[NWConcrete_nw_service_connector init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_service_connector init]";
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
        v18 = "-[NWConcrete_nw_service_connector init]";
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
          v18 = "-[NWConcrete_nw_service_connector init]";
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
        v18 = "-[NWConcrete_nw_service_connector init]";
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
        v18 = "-[NWConcrete_nw_service_connector init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  localPrivKey = self->localPrivKey;
  if (localPrivKey)
  {
    CFRelease(localPrivKey);
    self->localPrivKey = 0LL;
  }

  retryAddrInUseTimer = self->retryAddrInUseTimer;
  if (retryAddrInUseTimer)
  {
    nw_queue_cancel_source((uint64_t)retryAddrInUseTimer, (uint64_t)a2);
    self->retryAddrInUseTimer = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_service_connector;
  -[NWConcrete_nw_service_connector dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    __nwlog_obj();
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cStr = 136446210;
    *(void *)&cStr[4] = "nw_service_connector_copy_description";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v14 = 0;
    if (__nwlog_fault(v6, &type, &v14))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl(&dword_181A5C000, v7, v8, "%{public}s called with null serviceConnector", cStr, 0xCu);
        }
      }

      else if (v14)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v10 = type;
        BOOL v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)cStr = 136446466;
            *(void *)&cStr[4] = "nw_service_connector_copy_description";
            __int16 v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s called with null serviceConnector, dumping backtrace:%{public}s",  cStr,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }

        if (v11)
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl( &dword_181A5C000,  v7,  v10,  "%{public}s called with null serviceConnector, no backtrace",  cStr,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_service_connector_copy_description";
          _os_log_impl( &dword_181A5C000,  v7,  v12,  "%{public}s called with null serviceConnector, backtrace limit exceeded",  cStr,  0xCu);
        }
      }
    }

- (void).cxx_destruct
{
}

@end