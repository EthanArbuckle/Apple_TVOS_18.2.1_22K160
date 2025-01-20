@interface NWConcrete_nw_candidate_manager
- (NSString)description;
- (id)init:(id)a3;
@end

@implementation NWConcrete_nw_candidate_manager

- (id)init:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    __nwlog_obj();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_candidate_manager init:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (__nwlog_fault(v11, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v13 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_181A5C000, v12, v13, "%{public}s called with null _parameters", buf, 0xCu);
        }
      }

      else if (v27)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_candidate_manager init:]";
            __int16 v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v19,  "%{public}s called with null _parameters, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_34;
        }

        if (v20)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_181A5C000, v12, v19, "%{public}s called with null _parameters, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl( &dword_181A5C000,  v12,  v24,  "%{public}s called with null _parameters, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (NSString)description
{
  parameters = self->parameters;
  if (parameters)
  {
    v4 = parameters;
    if ((*((void *)v4 + 12) & 0x8000LL) != 0) {
      id v5 = "server ";
    }
    else {
      id v5 = "client ";
    }
  }

  else
  {
    id v5 = "";
  }

  service = self->service;
  BOOL v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  unint64_t log_id = self->log_id;
  if (service)
  {
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(service);
    bonjour_service_os_log_type_t type = nw_endpoint_get_bonjour_service_type(self->service);
    v10 = (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"[CM%zu %s%s.%s]",  log_id,  v5,  bonjour_service_name,  bonjour_service_type);
  }

  else
  {
    v10 = (__CFString *)CFStringCreateWithFormat(v7, 0LL, @"[CM%zu %s]", self->log_id, v5);
  }

  return (NSString *)v10;
}

- (void).cxx_destruct
{
}

@end