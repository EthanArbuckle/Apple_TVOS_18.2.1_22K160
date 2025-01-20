@interface NWConcrete_nw_application_id
- (BOOL)initWithUUID:(__int128 *)a3 auditToken:(const char *)a4 pid:(char)a5 bundleID:isBundleIDExternal:systemService:;
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_application_id

- (void)dealloc
{
  v3 = (void *)*((void *)self + 9);
  if (v3)
  {
    free(v3);
    *((void *)self + 9) = 0LL;
  }

  v4 = (void *)*((void *)self + 10);
  if (v4)
  {
    free(v4);
    *((void *)self + 10) = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_application_id;
  -[NWConcrete_nw_application_id dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  v3 = (char *)self + 88;
  if (uuid_is_null((const unsigned __int8 *)self + 88))
  {
    v4 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_application_id %p>",  self);
  }

  else
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v3];
    v4 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_application_id %p p:%@>",  self,  v5);
  }

  return (NSString *)v4;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (BOOL)initWithUUID:(__int128 *)a3 auditToken:(const char *)a4 pid:(char)a5 bundleID:isBundleIDExternal:systemService:
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int is_null = uuid_is_null(uu);
  if (!a4 && !a3 && is_null)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
      _os_log_impl( &dword_181A5C000,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s cannot create application id without application information",  buf,  0xCu);
    }

    return 0LL;
  }

  v41.receiver = a1;
  v41.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_application_id;
  v12 = (char *)objc_msgSendSuper2(&v41, sel_init);
  if (!v12)
  {
    __nwlog_obj();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
    v28 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v44[0] = 0;
    if (__nwlog_fault(v28, type, v44))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v30 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_181A5C000, v29, v30, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v44[0])
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v36 = type[0];
        BOOL v37 = os_log_type_enabled(v29, type[0]);
        if (backtrace_string)
        {
          if (v37)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v29,  v36,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_62;
        }

        if (v37)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl(&dword_181A5C000, v29, v36, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v40 = type[0];
        if (os_log_type_enabled(v29, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWConcrete_nw_application_id initWithUUID:auditToken:pid:bundleID:isBundleIDExternal:systemService:]";
          _os_log_impl( &dword_181A5C000,  v29,  v40,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end