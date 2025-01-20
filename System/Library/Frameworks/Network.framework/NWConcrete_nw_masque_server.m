@interface NWConcrete_nw_masque_server
- (NSString)description;
- (id).cxx_construct;
@end

@implementation NWConcrete_nw_masque_server

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    __nwlog_obj();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cStr = 136446210;
    *(void *)&cStr[4] = "nw_masque_server_copy_description";
    v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v12 = 0;
    if (__nwlog_fault(v4, &type, &v12))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v6 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_masque_server_copy_description";
          _os_log_impl(&dword_181A5C000, v5, v6, "%{public}s called with null server", cStr, 0xCu);
        }
      }

      else if (v12)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v8 = type;
        BOOL v9 = os_log_type_enabled(v5, type);
        if (backtrace_string)
        {
          if (v9)
          {
            *(_DWORD *)cStr = 136446466;
            *(void *)&cStr[4] = "nw_masque_server_copy_description";
            __int16 v15 = 2082;
            v16 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v5,  v8,  "%{public}s called with null server, dumping backtrace:%{public}s",  cStr,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_20;
        }

        if (v9)
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_masque_server_copy_description";
          _os_log_impl(&dword_181A5C000, v5, v8, "%{public}s called with null server, no backtrace", cStr, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v10 = type;
        if (os_log_type_enabled(v5, type))
        {
          *(_DWORD *)cStr = 136446210;
          *(void *)&cStr[4] = "nw_masque_server_copy_description";
          _os_log_impl( &dword_181A5C000,  v5,  v10,  "%{public}s called with null server, backtrace limit exceeded",  cStr,  0xCu);
        }
      }
    }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  return self;
}

@end