@interface NWConcrete_nw_interface_option_details
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NWConcrete_nw_interface_option_details)init;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_interface_option_details

- (NWConcrete_nw_interface_option_details)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_interface_option_details;
  v2 = -[NWConcrete_nw_interface_option_details init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
          v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_interface_option_details;
  -[NWConcrete_nw_interface_option_details dealloc](&v2, sel_dealloc);
}

- (NSString)description
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  memset(out, 0, 37);
  uuid_unparse(self->nexus_agent, out);
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"%@:%@ [%s, prio %d, fd %d, evaluator %@]",  self->interface,  self->remote,  out,  self->priority,  self->sockfd,  self->evaluator);
}

- (id)redactedDescription
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (nwlog_get_sensitive_redacted::onceToken != -1) {
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_59);
  }
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    memset(out, 0, 37);
    uuid_unparse(self->nexus_agent, out);
    interface = self->interface;
    v4 = -[OS_nw_endpoint redactedDescription](self->remote, "redactedDescription");
    uint64_t priority = self->priority;
    uint64_t sockfd = self->sockfd;
    v7 = -[OS_nw_path_evaluator redactedDescription](self->evaluator, "redactedDescription");
    v8 = (void *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"%@:%@ [%s, prio %d, fd %d, evaluator %@]",  interface,  v4,  out,  priority,  sockfd,  v7);
  }

  else
  {
    v8 = -[NWConcrete_nw_interface_option_details description](self, "description");
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NWConcrete_nw_interface_option_details *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v5 = v4;
      BOOL v6 = nw_interface_shallow_compare(self->interface, v5->interface)
        && nw_endpoint_is_equal(self->remote, v5->remote, 31LL)
        && !uuid_compare(self->nexus_agent, v5->nexus_agent)
        && nw_dispatch_data_is_equal((dispatch_data_t)self->local_cid, (dispatch_data_s *)v5->local_cid)
        && nw_dispatch_data_is_equal((dispatch_data_t)self->remote_cid, (dispatch_data_s *)v5->remote_cid)
        && self->sockfd == v5->sockfd;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end