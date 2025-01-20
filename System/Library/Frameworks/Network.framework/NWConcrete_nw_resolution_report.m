@interface NWConcrete_nw_resolution_report
- (NSString)description;
- (NWConcrete_nw_resolution_report)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_resolution_report

- (NWConcrete_nw_resolution_report)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_resolution_report;
  v2 = -[NWConcrete_nw_resolution_report init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_resolution_report init]";
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
        v18 = "-[NWConcrete_nw_resolution_report init]";
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
          v18 = "-[NWConcrete_nw_resolution_report init]";
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
        v18 = "-[NWConcrete_nw_resolution_report init]";
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
        v18 = "-[NWConcrete_nw_resolution_report init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  provider_name = self->provider_name;
  if (provider_name)
  {
    free(provider_name);
    self->provider_name = 0LL;
  }

  extended_dns_error_extra_text = self->extended_dns_error_extra_text;
  if (extended_dns_error_extra_text)
  {
    free(extended_dns_error_extra_text);
    self->extended_dns_error_extra_text = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_resolution_report;
  -[NWConcrete_nw_resolution_report dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  v4 = Mutable;
  uint64_t protocol = self->protocol;
  else {
    v6 = off_189BB6FC0[protocol];
  }
  unsigned int v7 = self->source - 1;
  if (v7 > 2) {
    v8 = "invalid";
  }
  else {
    v8 = off_189BB6FE8[v7];
  }
  CFStringAppendFormat( Mutable,  0LL,  @"Resolved %u endpoints in %llums using %s from %s",  self->endpoint_count,  self->milliseconds,  v6,  v8);
  if (self->provider_name) {
    CFStringAppendFormat(v4, 0LL, @", provider %s", self->provider_name);
  }
  if ((*((_BYTE *)self + 70) & 1) != 0) {
    CFStringAppendFormat(v4, 0LL, @", received SVCB");
  }
  if (self->extended_dns_error_code)
  {
    CFStringAppendFormat(v4, 0LL, @", Extended DNS Error %u", self->extended_dns_error_code);
    os_log_type_t v9 = "Blocked";
    switch(self->extended_dns_error_code)
    {
      case 4u:
      case 0xFu:
        goto LABEL_19;
      case 0x10u:
        os_log_type_t v9 = "Censored";
        goto LABEL_19;
      case 0x11u:
        os_log_type_t v9 = "Filtered";
LABEL_19:
        CFStringAppendFormat(v4, 0LL, @" (%s)", v9);
        break;
      default:
        return (NSString *)v4;
    }
  }

  return (NSString *)v4;
}

@end