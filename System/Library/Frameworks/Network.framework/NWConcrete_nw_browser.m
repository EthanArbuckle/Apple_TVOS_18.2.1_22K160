@interface NWConcrete_nw_browser
- (NSString)description;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_browser

- (void)dealloc
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!*((void *)self + 6) || nw_parameters_get_logging_disabled(*((void *)self + 5))) {
    goto LABEL_14;
  }
  if (__nwlog_browser_log::onceToken[0] != -1) {
    dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
  }
  id v3 = (id)gbrowserLogObj;
  int v4 = *((_DWORD *)self + 48);
  *(_DWORD *)buf = 136446466;
  v41 = "-[NWConcrete_nw_browser dealloc]";
  __int16 v42 = 1024;
  int v43 = v4;
  int v36 = 18;
  v35 = buf;
  v5 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v38 = 0;
  if (__nwlog_fault(v5, &type, &v38))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
      }
      v6 = (os_log_s *)(id)gbrowserLogObj;
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        int v8 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v8;
        _os_log_impl( &dword_181A5C000,  v6,  v7,  "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating",  buf,  0x12u);
      }
    }

    else if (v38)
    {
      backtrace_string = __nw_create_backtrace_string();
      if (backtrace_string)
      {
        v18 = (char *)backtrace_string;
        if (__nwlog_browser_log::onceToken[0] != -1) {
          dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
        }
        v19 = (os_log_s *)(id)gbrowserLogObj;
        os_log_type_t v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          int v21 = *((_DWORD *)self + 48);
          *(_DWORD *)buf = 136446722;
          v41 = "-[NWConcrete_nw_browser dealloc]";
          __int16 v42 = 1024;
          int v43 = v21;
          __int16 v44 = 2082;
          v45 = v18;
          _os_log_impl( &dword_181A5C000,  v19,  v20,  "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, du mping backtrace:%{public}s",  buf,  0x1Cu);
        }

        free(v18);
        if (v5) {
          goto LABEL_13;
        }
        goto LABEL_14;
      }

      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
      }
      v6 = (os_log_s *)(id)gbrowserLogObj;
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v6, type))
      {
        int v32 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v32;
        _os_log_impl( &dword_181A5C000,  v6,  v31,  "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, no backtrace",  buf,  0x12u);
      }
    }

    else
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
      }
      v6 = (os_log_s *)(id)gbrowserLogObj;
      os_log_type_t v27 = type;
      if (os_log_type_enabled(v6, type))
      {
        int v28 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v28;
        _os_log_impl( &dword_181A5C000,  v6,  v27,  "%{public}s [B%u] over-release of nw_browser_t! Object should not be internally retained and deallocating, back trace limit exceeded",  buf,  0x12u);
      }
    }
  }

  if (v5) {
LABEL_13:
  }
    free(v5);
LABEL_14:
  if (*((void *)self + 15) && !nw_parameters_get_logging_disabled(*((void *)self + 5)))
  {
    if (__nwlog_browser_log::onceToken[0] != -1) {
      dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
    }
    id v9 = (id)gbrowserLogObj;
    int v10 = *((_DWORD *)self + 48);
    *(_DWORD *)buf = 136446466;
    v41 = "-[NWConcrete_nw_browser dealloc]";
    __int16 v42 = 1024;
    int v43 = v10;
    int v36 = 18;
    v35 = buf;
    v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v38 = 0;
    if (!__nwlog_fault(v11, &type, &v38))
    {
LABEL_25:
      if (!v11) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }

    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_browser_log::onceToken[0] != -1) {
        dispatch_once(__nwlog_browser_log::onceToken, &__block_literal_global_18_44316);
      }
      v12 = (os_log_s *)(id)gbrowserLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        int v14 = *((_DWORD *)self + 48);
        *(_DWORD *)buf = 136446466;
        v41 = "-[NWConcrete_nw_browser dealloc]";
        __int16 v42 = 1024;
        int v43 = v14;
        _os_log_impl( &dword_181A5C000,  v12,  v13,  "%{public}s [B%u] over-release of nw_browser_t! Object should have deallocated the DNSServiceRef",  buf,  0x12u);
      }

- (NSString)description
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = (const char *)nw_browser_get_description(self);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = (const char *)nw_browser_get_description(self);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end