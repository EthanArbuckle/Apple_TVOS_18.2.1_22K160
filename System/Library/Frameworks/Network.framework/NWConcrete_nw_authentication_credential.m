@interface NWConcrete_nw_authentication_credential
- (_DWORD)initWithType:(_DWORD *)result;
- (void)dealloc;
@end

@implementation NWConcrete_nw_authentication_credential

- (void)dealloc
{
  username = self->username;
  if (username)
  {
    free(username);
    self->username = 0LL;
  }

  v4 = self;
  v5 = v4;
  password = v4->password;
  if (password)
  {
    size_t v7 = strlen(v4->password);
    bzero(password, v7);
    v8 = v5->password;
    if (v8)
    {
      free(v8);
      v5->password = 0LL;
    }
  }

  v9.receiver = v5;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_authentication_credential;
  -[NWConcrete_nw_authentication_credential dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (_DWORD)initWithType:(_DWORD *)result
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  v13.receiver = result;
  v13.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_authentication_credential;
  result = objc_msgSendSuper2(&v13, sel_init);
  if (result)
  {
    result[2] = a2;
    return result;
  }

  __nwlog_obj();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v15 = "-[NWConcrete_nw_authentication_credential initWithType:]";
  v4 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v11 = 0;
  if (__nwlog_fault(v4, &type, &v11))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v15 = "-[NWConcrete_nw_authentication_credential initWithType:]";
        _os_log_impl(&dword_181A5C000, v5, v6, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v11)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v8 = type;
      BOOL v9 = os_log_type_enabled(v5, type);
      if (backtrace_string)
      {
        if (v9)
        {
          *(_DWORD *)buf = 136446466;
          v15 = "-[NWConcrete_nw_authentication_credential initWithType:]";
          __int16 v16 = 2082;
          v17 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v5,  v8,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_21;
      }

      if (v9)
      {
        *(_DWORD *)buf = 136446210;
        v15 = "-[NWConcrete_nw_authentication_credential initWithType:]";
        _os_log_impl(&dword_181A5C000, v5, v8, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v15 = "-[NWConcrete_nw_authentication_credential initWithType:]";
        _os_log_impl(&dword_181A5C000, v5, v10, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

@end