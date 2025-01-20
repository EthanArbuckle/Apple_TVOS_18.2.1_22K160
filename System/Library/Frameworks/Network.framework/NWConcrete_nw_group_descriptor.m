@interface NWConcrete_nw_group_descriptor
- (NSString)description;
- (uint64_t)initWithType:(void *)a3 member:(_OWORD *)a4 groupID:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_group_descriptor

- (void)dealloc
{
  members = self->members;
  self->members = 0LL;

  specific_source = self->specific_source;
  self->specific_source = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_group_descriptor;
  -[NWConcrete_nw_group_descriptor dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  uint64_t type = self->type;
  else {
    v3 = off_189BB74C8[type];
  }
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<%s %@>",  v3,  self->members);
}

- (void).cxx_destruct
{
}

- (uint64_t)initWithType:(void *)a3 member:(_OWORD *)a4 groupID:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!a1) {
    goto LABEL_19;
  }
  v35.receiver = a1;
  v35.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_group_descriptor;
  v8 = (unsigned __int8 *)objc_msgSendSuper2(&v35, sel_init);
  a1 = (uint64_t *)v8;
  if (!v8)
  {
    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v33 = 0;
    if (__nwlog_fault(v18, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v20 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_181A5C000, v19, v20, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v26 = type;
        BOOL v27 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
            __int16 v38 = 2082;
            v39 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v19,  v26,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_49;
        }

        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl(&dword_181A5C000, v19, v26, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v31 = type;
        if (os_log_type_enabled(v19, type))
        {
          *(_DWORD *)buf = 136446210;
          v37 = "-[NWConcrete_nw_group_descriptor initWithType:member:groupID:]";
          _os_log_impl( &dword_181A5C000,  v19,  v31,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end