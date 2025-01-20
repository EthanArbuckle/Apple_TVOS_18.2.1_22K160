@interface NWConcrete_nw_parameters
- (BOOL)initWithParameters:(char)a3 stripConnected:(int)a4 shallowCopy:;
- (NSString)description;
- (id)initWithStack:(id *)a1;
- (void)dealloc;
@end

@implementation NWConcrete_nw_parameters

- (id)initWithStack:(id *)a1
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1) {
    goto LABEL_18;
  }
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_parameters;
  a1 = (id *)objc_msgSendSuper2(&v31, sel_init);
  if (!a1)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buffer[0]) = 136446210;
    *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v30 = 0;
    if (__nwlog_fault(v15, buf, &v30))
    {
      if (buf[0] == 17)
      {
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v17 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_181A5C000, v16, v17, "%{public}s [super init] failed", (uint8_t *)buffer, 0xCu);
        }
      }

      else if (v30)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v23 = buf[0];
        BOOL v24 = os_log_type_enabled(v16, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v24)
          {
            LODWORD(buffer[0]) = 136446466;
            *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
            WORD6(buffer[0]) = 2082;
            *(void *)((char *)buffer + 14) = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v16,  v23,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  (uint8_t *)buffer,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_48;
        }

        if (v24)
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl( &dword_181A5C000,  v16,  v23,  "%{public}s [super init] failed, no backtrace",  (uint8_t *)buffer,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v28 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(void *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl( &dword_181A5C000,  v16,  v28,  "%{public}s [super init] failed, backtrace limit exceeded",  (uint8_t *)buffer,  0xCu);
        }
      }
    }

- (BOOL)initWithParameters:(char)a3 stripConnected:(int)a4 shallowCopy:
{
  uint64_t v160 = *MEMORY[0x1895F89C0];
  v7 = a2;
  if (!a1) {
    goto LABEL_103;
  }
  v151.receiver = a1;
  v151.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_parameters;
  __int128 v8 = (char *)objc_msgSendSuper2(&v151, sel_init);
  a1 = (id *)v8;
  if (!v8)
  {
    __nwlog_obj();
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v96 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v153 = OS_LOG_TYPE_ERROR;
    char v152 = 0;
    if (__nwlog_fault(v96, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v98 = v153;
        if (os_log_type_enabled(v97, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_181A5C000, v97, v98, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v152)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v112 = v153;
        BOOL v113 = os_log_type_enabled(v97, v153);
        if (backtrace_string)
        {
          if (v113)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            __int16 v156 = 2082;
            uint64_t v157 = (uint64_t)backtrace_string;
            _os_log_impl( &dword_181A5C000,  v97,  v112,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_178;
        }

        if (v113)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_181A5C000, v97, v112, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v142 = v153;
        if (os_log_type_enabled(v97, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl( &dword_181A5C000,  v97,  v142,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)dealloc
{
  e_bundle_id = self->e_bundle_id;
  if (e_bundle_id)
  {
    free(e_bundle_id);
    self->e_bundle_id = 0LL;
  }

  proxy_bundle_id = self->proxy_bundle_id;
  if (proxy_bundle_id)
  {
    free(proxy_bundle_id);
    self->proxy_bundle_id = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_parameters;
  -[NWConcrete_nw_parameters dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = nw_parameters_copy_description_internal(self, 0);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  return (NSString *)v2;
}

@end