@interface NWConcrete_nw_connection_group
- (NSString)description;
- (char)initWithDescriptor:(void *)a3 connection:(void *)a4 parameters:;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_connection_group

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!*((void *)self + 3))
  {
    v3 = (void *)*((void *)self + 19);
    if (v3)
    {
      free(v3);
      *((void *)self + 19) = 0LL;
    }

    v4 = (void *)*((void *)self + 20);
    if (v4)
    {
      free(v4);
      *((void *)self + 20) = 0LL;
    }

    v5 = (void *)*((void *)self + 10);
    *((void *)self + 10) = 0LL;

    goto LABEL_7;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWConcrete_nw_connection_group dealloc]";
  int v15 = 12;
  v14 = buf;
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v7, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating",  buf,  0xCu);
      }
    }

    else if (v17)
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
          v20 = "-[NWConcrete_nw_connection_group dealloc]";
          __int16 v21 = 2082;
          v22 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_24;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, no backtrace",  buf,  0xCu);
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
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl( &dword_181A5C000,  v8,  v13,  "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, b acktrace limit exceeded",  buf,  0xCu);
      }
    }
  }

- (NSString)description
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = (const char *)nw_connection_group_get_description(self);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = (const char *)nw_connection_group_get_description(self);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 43) = 0;
  return self;
}

- (char)initWithDescriptor:(void *)a3 connection:(void *)a4 parameters:
{
  uint64_t v169 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_102;
  }
  if (v7)
  {
    v162.receiver = a1;
    v162.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_connection_group;
    a1 = (char *)objc_msgSendSuper2(&v162, sel_init);
    if (a1)
    {
      *((_DWORD *)a1 + 42) = nw_connection_group_get_next_log_id();
      os_unfair_lock_lock((os_unfair_lock_t)&nw_uuid_generate_insecure(unsigned char *)::uuid_lock);
      if ((void)nw_uuid_generate_insecure(unsigned char *)::last_used_uuid != -1LL)
      {
        *(void *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid = nw_uuid_generate_insecure(unsigned char *)::last_used_uuid
                                                                               + 1;
        goto LABEL_10;
      }

      if (*((void *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid + 1) == -1LL)
      {
LABEL_9:
        uuid_generate_random((unsigned __int8 *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid);
        BYTE9(nw_uuid_generate_insecure(unsigned char *)::last_used_uuid) = -1;
      }

      else
      {
        ++*((void *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid + 1);
      }

@end