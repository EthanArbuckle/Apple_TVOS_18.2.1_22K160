@interface NWConcrete_nw_connection
- (BOOL)initWithEndpoint:(void *)a3 parameters:(int)a4 identifier:;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_connection

- (BOOL)initWithEndpoint:(void *)a3 parameters:(int)a4 identifier:
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  if (!a1)
  {
LABEL_37:

    return (BOOL)a1;
  }

  v45.receiver = a1;
  v45.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_connection;
  id v10 = objc_msgSendSuper2(&v45, sel_init);
  if (!v10)
  {
    __nwlog_obj();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__str = 136446210;
    *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
    v35 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v44 = 0;
    if (__nwlog_fault(v35, buf, &v44))
    {
      if (buf[0] == 17)
      {
        __nwlog_obj();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v37 = buf[0];
        if (os_log_type_enabled(v36, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__str = 136446210;
          *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
          _os_log_impl(&dword_181A5C000, v36, v37, "%{public}s [super init] failed", (uint8_t *)__str, 0xCu);
        }
      }

      else if (v44)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v41 = buf[0];
        BOOL v42 = os_log_type_enabled(v36, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v42)
          {
            *(_DWORD *)__str = 136446466;
            *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
            *(_WORD *)&__str[12] = 2082;
            *(void *)&__str[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v36,  v41,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  (uint8_t *)__str,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_56;
        }

        if (v42)
        {
          *(_DWORD *)__str = 136446210;
          *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
          _os_log_impl( &dword_181A5C000,  v36,  v41,  "%{public}s [super init] failed, no backtrace",  (uint8_t *)__str,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v43 = buf[0];
        if (os_log_type_enabled(v36, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)__str = 136446210;
          *(void *)&__str[4] = "-[NWConcrete_nw_connection initWithEndpoint:parameters:identifier:]";
          _os_log_impl( &dword_181A5C000,  v36,  v43,  "%{public}s [super init] failed, backtrace limit exceeded",  (uint8_t *)__str,  0xCu);
        }
      }
    }

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (self->_internal_reference)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
    v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v18 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)dispatch_queue_t v21 = "-[NWConcrete_nw_connection dealloc]";
        _os_log_impl( &dword_181A5C000,  v5,  v6,  "%{public}s over-release of nw_connection_t! Object should not be internally retained and deallocating",  buf,  0xCu);
      }

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = nw_connection_copy_description((nw_connection_t)self);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  return (NSString *)v2;
}

- (id)redactedDescription
{
  v2 = nw_connection_copy_description_level(self, 2);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  return v2;
}

@end