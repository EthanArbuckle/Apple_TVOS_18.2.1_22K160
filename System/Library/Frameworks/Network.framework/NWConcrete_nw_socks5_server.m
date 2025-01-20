@interface NWConcrete_nw_socks5_server
- (NSString)description;
- (id)initWithParameters:(void *)a3 clientQueue:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_socks5_server

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    __nwlog_obj();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cStr = 136446210;
    *(void *)&cStr[4] = "nw_socks5_server_copy_description";
    v5 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v12 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        *(_DWORD *)cStr = 136446210;
        *(void *)&cStr[4] = "nw_socks5_server_copy_description";
        v8 = "%{public}s called with null server";
LABEL_20:
        _os_log_impl(&dword_181A5C000, v6, v7, v8, cStr, 0xCu);
      }
    }

    else
    {
      if (v12)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v7 = type;
        BOOL v10 = os_log_type_enabled(v6, type);
        if (backtrace_string)
        {
          if (v10)
          {
            *(_DWORD *)cStr = 136446466;
            *(void *)&cStr[4] = "nw_socks5_server_copy_description";
            __int16 v15 = 2082;
            v16 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v6,  v7,  "%{public}s called with null server, dumping backtrace:%{public}s",  cStr,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }

        if (!v10) {
          goto LABEL_21;
        }
        *(_DWORD *)cStr = 136446210;
        *(void *)&cStr[4] = "nw_socks5_server_copy_description";
        v8 = "%{public}s called with null server, no backtrace";
        goto LABEL_20;
      }

      __nwlog_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        *(_DWORD *)cStr = 136446210;
        *(void *)&cStr[4] = "nw_socks5_server_copy_description";
        v8 = "%{public}s called with null server, backtrace limit exceeded";
        goto LABEL_20;
      }
    }

- (void)dealloc
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[NWConcrete_nw_socks5_server dealloc]";
    __int16 v28 = 2114;
    v29 = self;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_INFO, "%{public}s %{public}@", buf, 0x16u);
  }

  IOPMAssertionID ss_assertion = self->ss_assertion;
  if (ss_assertion)
  {
    IOPMAssertionRelease(ss_assertion);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = self->ss_assertion;
      unint64_t ss_assertion_toggle_mach_time = self->ss_assertion_toggle_mach_time;
      uint64_t v8 = mach_continuous_time();
      if (v8 <= 1) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = v8;
      }
      unint64_t v10 = nw_delta_nanos(ss_assertion_toggle_mach_time, v9);
      v27 = "-[NWConcrete_nw_socks5_server dealloc]";
      __int16 v28 = 2112;
      *(_DWORD *)buf = 136446978;
      v29 = self;
      __int16 v30 = 1024;
      unsigned int v31 = v6;
      __int16 v32 = 2048;
      unint64_t v33 = v10 / 0x3B9ACA00;
      _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s %@ released power assertion: %u after %llus",  buf,  0x26u);
    }

    self->IOPMAssertionID ss_assertion = 0;
  }

  if (self->ss_internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWConcrete_nw_socks5_server dealloc]";
    int v22 = 12;
    v21 = buf;
    char v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v12, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (os_log_s *)(id)gLogObj;
        os_log_type_t v14 = type;
        if (!os_log_type_enabled(v13, type)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        __int16 v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating";
LABEL_25:
        v19 = v13;
        os_log_type_t v20 = v14;
        goto LABEL_26;
      }

      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (os_log_s *)(id)gLogObj;
        os_log_type_t v14 = type;
        if (!os_log_type_enabled(v13, type)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        __int16 v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, "
              "backtrace limit exceeded";
        goto LABEL_25;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v17 = type;
      BOOL v18 = os_log_type_enabled(v13, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_27:

          if (!v12) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }

        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        __int16 v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, no backtrace";
        v19 = v13;
        os_log_type_t v20 = v17;
LABEL_26:
        _os_log_impl(&dword_181A5C000, v19, v20, v15, buf, 0xCu);
        goto LABEL_27;
      }

      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        __int16 v28 = 2082;
        v29 = (NWConcrete_nw_socks5_server *)backtrace_string;
        _os_log_impl( &dword_181A5C000,  v13,  v17,  "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, dump ing backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (v12) {
LABEL_21:
    }
      free(v12);
  }

- (void).cxx_destruct
{
}

- (id)initWithParameters:(void *)a3 clientQueue:
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
LABEL_116:
    id v37 = 0LL;
    goto LABEL_97;
  }

  v75.receiver = a1;
  v75.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_socks5_server;
  os_log_type_t v7 = objc_msgSendSuper2(&v75, sel_init);
  id v8 = v7;
  if (!v7)
  {
    __nwlog_obj();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)label = 136446210;
    *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
    v66 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v66, buf, &type))
    {
      if (buf[0] == 17)
      {
        __nwlog_obj();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v68 = buf[0];
        if (os_log_type_enabled(v67, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)label = 136446210;
          *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_181A5C000, v67, v68, "%{public}s [super init] failed", (uint8_t *)label, 0xCu);
        }
      }

      else if (type)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v70 = buf[0];
        BOOL v71 = os_log_type_enabled(v67, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v71)
          {
            *(_DWORD *)label = 136446466;
            *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            *(_WORD *)&label[12] = 2082;
            *(void *)&label[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v67,  v70,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  (uint8_t *)label,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_114;
        }

        if (v71)
        {
          *(_DWORD *)label = 136446210;
          *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl( &dword_181A5C000,  v67,  v70,  "%{public}s [super init] failed, no backtrace",  (uint8_t *)label,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v72 = buf[0];
        if (os_log_type_enabled(v67, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)label = 136446210;
          *(void *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl( &dword_181A5C000,  v67,  v72,  "%{public}s [super init] failed, backtrace limit exceeded",  (uint8_t *)label,  0xCu);
        }
      }
    }

@end