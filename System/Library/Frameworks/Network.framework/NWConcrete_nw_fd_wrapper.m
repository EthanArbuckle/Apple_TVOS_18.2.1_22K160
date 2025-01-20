@interface NWConcrete_nw_fd_wrapper
- (NSString)description;
- (_DWORD)initWithFileDescriptor:(void *)a1;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_fd_wrapper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_fd_wrapper;
  -[NWConcrete_nw_fd_wrapper dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  v2 = "true";
  if ((*((_BYTE *)self + 24) & 1) == 0) {
    v2 = "false";
  }
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<fd_wrapper %d, guarded: %s>",  *((unsigned int *)self + 2),  v2);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  return self;
}

- (_DWORD)initWithFileDescriptor:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_fd_wrapper;
  objc_super v3 = objc_msgSendSuper2(&v16, sel_init);
  v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
            v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
            __int16 v19 = 2082;
            v20 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }

        if (v12)
        {
          *(_DWORD *)buf = 136446210;
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
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
          v18 = "-[NWConcrete_nw_fd_wrapper initWithFileDescriptor:]";
          _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }

@end