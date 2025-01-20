@interface NWConcrete_nw_establishment_report
- (NSString)description;
- (NWConcrete_nw_establishment_report)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_establishment_report

- (NWConcrete_nw_establishment_report)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_establishment_report;
  v2 = -[NWConcrete_nw_establishment_report init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_establishment_report init]";
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
        v18 = "-[NWConcrete_nw_establishment_report init]";
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
          v18 = "-[NWConcrete_nw_establishment_report init]";
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
        v18 = "-[NWConcrete_nw_establishment_report init]";
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
        v18 = "-[NWConcrete_nw_establishment_report init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_establishment_report;
  -[NWConcrete_nw_establishment_report dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  uint64_t duration_milliseconds = nw_establishment_report_get_duration_milliseconds((nw_establishment_report_t)self);
  uint64_t attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds((nw_establishment_report_t)self);
  uint64_t previous_attempt_count = nw_establishment_report_get_previous_attempt_count((nw_establishment_report_t)self);
  CFStringAppendFormat( Mutable,  0LL,  @"Establishment Report:\n\tDuration: %llums\n\tAttempt Started After: %llums\n\tPrevious Attempts: %u\n",  duration_milliseconds,  attempt_started_after_milliseconds,  previous_attempt_count);
  uint64_t v7 = MEMORY[0x1895F87A8];
  enumerate_block[0] = MEMORY[0x1895F87A8];
  enumerate_block[1] = 3221225472LL;
  enumerate_block[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke;
  enumerate_block[3] = &__block_descriptor_40_e51_B32__0__NSObject_OS_nw_protocol_definition__8Q16Q24l;
  enumerate_block[4] = Mutable;
  nw_establishment_report_enumerate_protocols((nw_establishment_report_t)self, enumerate_block);
  v18[0] = v7;
  v18[1] = 3221225472LL;
  v18[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke_2;
  v18[3] = &__block_descriptor_40_e41_B16__0__NWConcrete_nw_resolution_report_8l;
  v18[4] = Mutable;
  nw_establishment_report_enumerate_resolution_reports((nw_establishment_report_t)self, v18);
  if (nw_establishment_report_get_proxy_configured((nw_establishment_report_t)self)) {
    v8 = "";
  }
  else {
    v8 = "not ";
  }
  if (nw_establishment_report_get_used_proxy((nw_establishment_report_t)self)) {
    os_log_type_t v9 = "";
  }
  else {
    os_log_type_t v9 = "not ";
  }
  CFStringAppendFormat(Mutable, 0LL, @"\tProxy %sconfigured, %sused, to ", v8, v9);
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v13[0] = v7;
  v13[1] = 3221225472LL;
  v13[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke_3;
  v13[3] = &unk_189BB6F50;
  v13[4] = &v14;
  v13[5] = Mutable;
  nw_establishment_report_enumerate_proxy_endpoints(self, v13);
  if (!*((_BYTE *)v15 + 24)) {
    CFStringAppendFormat(Mutable, 0LL, @"unknown");
  }
  unsigned int v10 = self->privacy_stance - 1;
  if (v10 > 4) {
    os_log_type_t v11 = "Unknown";
  }
  else {
    os_log_type_t v11 = off_189BB70A8[v10];
  }
  CFStringAppendFormat(Mutable, 0LL, @"\n\tPrivacy stance: %s", v11);
  _Block_object_dispose(&v14, 8);
  return (NSString *)Mutable;
}

@end