@interface NWConcrete_nw_srv_endpoint
- (BOOL)initWithName:(void *)a1;
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (const)domainForPolicy;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)type;
- (void)dealloc;
@end

@implementation NWConcrete_nw_srv_endpoint

- (void)dealloc
{
  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_srv_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v4, sel_dealloc);
}

- (unsigned)type
{
  return 5;
}

- (id)copyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_srv_endpoint;
  id v3 = -[NWConcrete_nw_endpoint copyDictionary](&v8, sel_copyDictionary);
  objc_super v4 = v3;
  if (v3)
  {
    name = self->name;
    if (name) {
      xpc_dictionary_set_string(v3, "srv_name", name);
    }
    id v6 = v4;
  }

  return v4;
}

- (const)domainForPolicy
{
  return self->name;
}

- (char)createDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  name = self->name;
  id v6 = (char *)nw_endpoint_copy_interface(self);
  if (v3)
  {
    v7 = __nwlog_salted_hostname_hash(self->name, (char *)&v12);
    name = __str;
    snprintf(__str, 0xDuLL, "%s%s", "SRV#", v7);
  }

  objc_super v8 = "@";
  v12 = 0LL;
  v9 = "";
  if (v6) {
    v9 = v6 + 104;
  }
  else {
    objc_super v8 = "";
  }
  asprintf(&v12, "%s%s%s", name, v8, v9);
  v10 = v12;

  return v10;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = (const char **)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_srv_endpoint;

  return v7;
}

- (id)copyEndpoint
{
  return (id)-[NWConcrete_nw_srv_endpoint initWithName:]( objc_alloc(&OBJC_CLASS___NWConcrete_nw_srv_endpoint),  self->name);
}

- (unint64_t)getHash
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  name = self->name;
  CC_LONG v4 = strlen(name);
  CC_SHA256_Update(&v7, name, v4);
  CC_SHA256_Final(md, &v7);
  int8x16_t v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (BOOL)initWithName:(void *)a1
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_srv_endpoint;
  id v3 = objc_msgSendSuper2(&v28, sel_init);
  if (!v3)
  {
    __nwlog_obj();
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
    int8x16_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (__nwlog_fault(v9, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v11 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_181A5C000, v10, v11, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v26)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
            __int16 v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v10,  v19,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_42;
        }

        if (v20)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_181A5C000, v10, v19, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl( &dword_181A5C000,  v10,  v24,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end