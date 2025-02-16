@interface NWConcrete_nw_masque_connection
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_masque_connection

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v2 = self;
  if (v2)
  {
    v3 = v2;
    *(void *)buf = 0LL;
    uint64_t v4 = *((void *)v2 + 1);
    int v5 = *((unsigned __int8 *)v2 + 112);
    v6 = "invalid";
    switch(*((_BYTE *)v2 + 112))
    {
      case 0:
        goto LABEL_23;
      case 1:
        v6 = "initial";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      case 2:
        v6 = "connected";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      case 3:
        v6 = "got_vers";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      case 4:
        v6 = "got_methods";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      case 5:
        v6 = "got_address_type";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      case 6:
        v6 = "got_address";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      case 7:
        v6 = "got_request";
LABEL_23:
        v7 = (void *)*((void *)v2 + 6);
        if (v7) {
          goto LABEL_24;
        }
        goto LABEL_11;
      case 8:
        v6 = "out_connected";
        v7 = (void *)*((void *)v2 + 6);
        if (!v7) {
          goto LABEL_11;
        }
        goto LABEL_24;
      default:
        v8 = "cancelled";
        if (v5 != 255) {
          v8 = "unknown";
        }
        if (v5 == 200) {
          v6 = "ready";
        }
        else {
          v6 = v8;
        }
        v7 = (void *)*((void *)v2 + 6);
        if (v7)
        {
LABEL_24:
          v10 = v7;
          uint64_t v9 = v10[112];
        }

        else
        {
LABEL_11:
          uint64_t v9 = 0LL;
        }

        asprintf((char **)buf, "[MPC%llu %s in[C%llu]]", v4, v6, v9);
        v11 = *(const char **)buf;

        if (!v11) {
          goto LABEL_47;
        }
        v12 = (__CFString *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v11,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
        break;
    }

    return (NSString *)v12;
  }

  __nwlog_obj();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "nw_masque_connection_copy_description";
  v14 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v22 = 0;
  if (__nwlog_fault(v14, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v16 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_masque_connection_copy_description";
        _os_log_impl(&dword_181A5C000, v15, v16, "%{public}s called with null masqueConnection", buf, 0xCu);
      }
    }

    else if (v22)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v18 = type;
      BOOL v19 = os_log_type_enabled(v15, type);
      if (backtrace_string)
      {
        if (v19)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_masque_connection_copy_description";
          __int16 v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v15,  v18,  "%{public}s called with null masqueConnection, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_45;
      }

      if (v19)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_masque_connection_copy_description";
        _os_log_impl( &dword_181A5C000,  v15,  v18,  "%{public}s called with null masqueConnection, no backtrace",  buf,  0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v15, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_masque_connection_copy_description";
        _os_log_impl( &dword_181A5C000,  v15,  v20,  "%{public}s called with null masqueConnection, backtrace limit exceeded",  buf,  0xCu);
      }
    }
  }

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (gLogDatapath)
  {
    __nwlog_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v6 = "-[NWConcrete_nw_masque_connection dealloc]";
      __int16 v7 = 2114;
      v8 = self;
      _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %{public}@", buf, 0x16u);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_masque_connection;
  -[NWConcrete_nw_masque_connection dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end