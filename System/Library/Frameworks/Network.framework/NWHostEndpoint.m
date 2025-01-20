@interface NWHostEndpoint
+ (NWHostEndpoint)endpointWithHostname:(NSString *)hostname port:(NSString *)port;
+ (unsigned)endpointType;
- (NSString)hostname;
- (NSString)port;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
@end

@implementation NWHostEndpoint

+ (unsigned)endpointType
{
  return 2;
}

+ (NWHostEndpoint)endpointWithHostname:(NSString *)hostname port:(NSString *)port
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v5 = port;
  v6 = hostname;
  nw_endpoint_t host = nw_endpoint_create_host(-[NSString UTF8String](v6, "UTF8String"), -[NSString UTF8String](v5, "UTF8String"));
  if (!host)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v20 = 0;
    if (__nwlog_fault(v10, &type, &v20))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v13 = "%{public}s nw_endpoint_create_host failed";
LABEL_18:
        v18 = v11;
        os_log_type_t v19 = v12;
        goto LABEL_19;
      }

      if (!v20)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v13 = "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (os_log_s *)(id)gLogObj;
      os_log_type_t v15 = type;
      BOOL v16 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v16)
        {
LABEL_20:

          if (!v10) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }

        *(_DWORD *)buf = 136446210;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        v13 = "%{public}s nw_endpoint_create_host failed, no backtrace";
        v18 = v11;
        os_log_type_t v19 = v15;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v18, v19, v13, buf, 0xCu);
        goto LABEL_20;
      }

      if (v16)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
        __int16 v24 = 2082;
        v25 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v11,  v15,  "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v10)
    {
LABEL_14:
      v8 = 0LL;
      goto LABEL_15;
    }

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = -[NWEndpoint txtRecord](self, "txtRecord");
  if (v7)
  {
  }

  else
  {
    v8 = -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
    if (!v8)
    {
      BOOL v16 = (void *)NSString;
      v14 = -[NWEndpoint internalEndpoint](self, "internalEndpoint");
      [v16 stringWithUTF8String:nw_endpoint_get_description(v14)];
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }

  id v9 = objc_alloc_init(MEMORY[0x189607940]);
  v10 = -[NWHostEndpoint hostname](self, "hostname");
  [v9 appendPrettyObject:v10 withName:@"hostname" indent:v5 showFullContent:1];
  v11 = -[NWHostEndpoint port](self, "port");
  [v9 appendPrettyObject:v11 withName:@"port" indent:v5 showFullContent:1];

  -[NWEndpoint interface](self, "interface");
  os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v12 withName:@"interface" indent:v5 showFullContent:v4];
  v13 = -[NWEndpoint txtRecord](self, "txtRecord");
  [v9 appendPrettyObject:v13 withName:@"txtRecord" indent:v5 showFullContent:v4];
  v14 = -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
  [v9 appendPrettyObject:v14 withName:@"parentEndpointDomain" indent:v5 showFullContent:1];
LABEL_5:

  return v9;
}

- (NSString)hostname
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v3 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_type_t v4 = nw_endpoint_get_type(v3);

  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  uint64_t v5 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != nw_endpoint_type_address)
  {
    hostname = nw_endpoint_get_hostname(v5);

    if (hostname)
    {
      [NSString stringWithUTF8String:hostname];
      return (NSString *)(id)objc_claimAutoreleasedReturnValue();
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    __int16 v24 = "-[NWHostEndpoint hostname]";
    os_log_type_t v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v21 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v24 = "-[NWHostEndpoint hostname]";
        os_log_type_t v15 = "%{public}s nw_endpoint_get_hostname failed";
LABEL_20:
        os_log_type_t v19 = v13;
        os_log_type_t v20 = v14;
LABEL_21:
        _os_log_impl(&dword_181A5C000, v19, v20, v15, buf, 0xCu);
      }
    }

    else if (v21)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v17 = type;
      BOOL v18 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          __int16 v24 = "-[NWHostEndpoint hostname]";
          __int16 v25 = 2082;
          uint64_t v26 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v13,  v17,  "%{public}s nw_endpoint_get_hostname failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }

      if (v18)
      {
        *(_DWORD *)buf = 136446210;
        __int16 v24 = "-[NWHostEndpoint hostname]";
        os_log_type_t v15 = "%{public}s nw_endpoint_get_hostname failed, no backtrace";
        os_log_type_t v19 = v13;
        os_log_type_t v20 = v17;
        goto LABEL_21;
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v24 = "-[NWHostEndpoint hostname]";
        os_log_type_t v15 = "%{public}s nw_endpoint_get_hostname failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }

LABEL_23:
    if (v12) {
      free(v12);
    }
    v8 = 0LL;
    return (NSString *)v8;
  }

  address = nw_endpoint_get_address(v5);
  if (!address)
  {

    return (NSString *)0LL;
  }

  v8 = 0LL;
  if (!getnameinfo(address, address->sa_len, (char *)buf, 0x46u, 0LL, 0, 10))
  {
    [NSString stringWithUTF8String:buf];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)port
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  v3 = nw_endpoint_copy_port_string(v2);

  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v19 = "-[NWHostEndpoint port]";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWHostEndpoint port]";
        id v9 = "%{public}s nw_endpoint_copy_port_string failed";
LABEL_18:
        os_log_type_t v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWHostEndpoint port]";
        id v9 = "%{public}s nw_endpoint_copy_port_string failed, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_20:

          if (!v6) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }

        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWHostEndpoint port]";
        id v9 = "%{public}s nw_endpoint_copy_port_string failed, no backtrace";
        os_log_type_t v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v19 = "-[NWHostEndpoint port]";
        __int16 v20 = 2082;
        char v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_endpoint_copy_port_string failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      nw_endpoint_type_t v4 = 0LL;
      return (NSString *)v4;
    }

@end