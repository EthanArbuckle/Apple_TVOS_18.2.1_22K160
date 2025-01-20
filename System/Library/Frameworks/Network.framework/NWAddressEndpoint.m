@interface NWAddressEndpoint
+ (id)endpointWithAddress:(const sockaddr *)a3;
+ (id)endpointWithHostname:(id)a3 port:(id)a4;
+ (unsigned)endpointType;
- (NSData)addressData;
- (NSString)addressString;
- (NSString)addressStringNoPort;
- (const)address;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)ethernetAddress;
- (unint64_t)addressFamily;
@end

@implementation NWAddressEndpoint

+ (unsigned)endpointType
{
  return 1;
}

+ (id)endpointWithHostname:(id)a3 port:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  nw_endpoint_t host = nw_endpoint_create_host( (const char *)[v5 UTF8String],  (const char *)objc_msgSend(v6, "UTF8String"));
  nw_endpoint_t v8 = host;
  if (!host)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (os_log_s *)(id)gLogObj;
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_181A5C000, v14, v15, "%{public}s nw_endpoint_create_host failed", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (!v26)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (os_log_s *)(id)gLogObj;
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl( &dword_181A5C000,  v14,  v23,  "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (os_log_s *)(id)gLogObj;
    os_log_type_t v19 = type;
    BOOL v20 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_181A5C000, v14, v19, "%{public}s nw_endpoint_create_host failed, no backtrace", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (v20)
    {
      *(_DWORD *)buf = 136446466;
      v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
      __int16 v30 = 2082;
      v31 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v14,  v19,  "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    goto LABEL_23;
  }

  v9 = host;
  int v10 = -[nw_endpoint type](v9, "type");

  if (v10 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
    __int16 v30 = 2114;
    v31 = (char *)v5;
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (os_log_s *)(id)gLogObj;
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        __int16 v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl( &dword_181A5C000,  v14,  v17,  "%{public}s NWAddressEndpoint created with non-address hostname %{public}@",  buf,  0x16u);
      }

+ (id)endpointWithAddress:(const sockaddr *)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  nw_endpoint_t address = nw_endpoint_create_address(a3);
  nw_endpoint_t v4 = address;
  if (!address)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v25 = "+[NWAddressEndpoint endpointWithAddress:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_181A5C000, v10, v11, "%{public}s nw_endpoint_create_address failed", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (!v22)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl( &dword_181A5C000,  v10,  v19,  "%{public}s nw_endpoint_create_address failed, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v10 = (os_log_s *)(id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v10, type);
    if (!backtrace_string)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl( &dword_181A5C000,  v10,  v15,  "%{public}s nw_endpoint_create_address failed, no backtrace",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v25 = "+[NWAddressEndpoint endpointWithAddress:]";
      __int16 v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v10,  v15,  "%{public}s nw_endpoint_create_address failed, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    goto LABEL_23;
  }

  id v5 = address;
  int v6 = -[nw_endpoint type](v5, "type");

  if (v6 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v25 = "+[NWAddressEndpoint endpointWithAddress:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v10 = (os_log_s *)(id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl( &dword_181A5C000,  v10,  v13,  "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint",  buf,  0xCu);
      }

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = -[NWAddressEndpoint ethernetAddress](self, "ethernetAddress", *(void *)&a3, a4);
  uint64_t v7 = -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
  uint64_t v8 = v7 | v6;

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x189607940]);
    -[NWAddressEndpoint addressString](self, "addressString");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appendPrettyObject:v10 withName:@"address" indent:v4 showFullContent:1];

    [v9 appendPrettyObject:v6 withName:@"ethernetAddress" indent:v4 showFullContent:1];
    -[NWEndpoint interface](self, "interface");
    os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appendPrettyObject:v11 withName:@"interface" indent:v4 showFullContent:1];

    -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appendPrettyObject:v12 withName:@"parentEndpointDomain" indent:v4 showFullContent:1];
  }

  else
  {
    -[NWAddressEndpoint addressString](self, "addressString");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)ethernetAddress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ethernet_nw_endpoint_t address = nw_endpoint_get_ethernet_address(v2);

  if (ethernet_address)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%x:%x:%x:%x:%x:%x",  *ethernet_address,  ethernet_address[1],  ethernet_address[2],  ethernet_address[3],  ethernet_address[4],  ethernet_address[5]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (NSData)addressData
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t address = nw_endpoint_get_address(v2);

  if (!address)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
        id v9 = "%{public}s nw_endpoint_get_address failed";
LABEL_18:
        v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
        id v9 = "%{public}s nw_endpoint_get_address failed, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (os_log_s *)(id)gLogObj;
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
        os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
        id v9 = "%{public}s nw_endpoint_get_address failed, no backtrace";
        v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
        __int16 v20 = 2082;
        os_log_type_t v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_endpoint_get_address failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      uint64_t v4 = 0LL;
      return (NSData *)v4;
    }

- (NSString)addressString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:nw_endpoint_get_description(v2)];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    goto LABEL_4;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v4 = (os_log_s *)(id)gLogObj;
  os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  id v5 = (void *)_os_log_send_and_compose_impl();

  result = (NSString *)__nwlog_abort((uint64_t)v5);
  if (!(_DWORD)result)
  {
    free(v5);
LABEL_4:

    return (NSString *)v3;
  }

  __break(1u);
  return result;
}

- (NSString)addressStringNoPort
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t address = nw_endpoint_get_address(v2);
  if (address)
  {
    uint64_t v4 = 0LL;
    if (!getnameinfo(address, address->sa_len, v6, 0x46u, 0LL, 0, 10))
    {
      [NSString stringWithUTF8String:v6];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSString *)v4;
}

- (const)address
{
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t address = nw_endpoint_get_address(v2);

  return address;
}

- (unint64_t)addressFamily
{
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t address = nw_endpoint_get_address(v2);

  if (address) {
    return address->sa_family;
  }
  else {
    return 0LL;
  }
}

@end