@interface NWBonjourServiceEndpoint
+ (NWBonjourServiceEndpoint)endpointWithName:(NSString *)name type:(NSString *)type domain:(NSString *)domain;
+ (unsigned)endpointType;
- (NSString)domain;
- (NSString)name;
- (NSString)type;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
@end

@implementation NWBonjourServiceEndpoint

+ (unsigned)endpointType
{
  return 3;
}

+ (NWBonjourServiceEndpoint)endpointWithName:(NSString *)name type:(NSString *)type domain:(NSString *)domain
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  v7 = domain;
  v8 = type;
  v9 = name;
  nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service( -[NSString UTF8String](v9, "UTF8String"),  -[NSString UTF8String](v8, "UTF8String"),  -[NSString UTF8String](v7, "UTF8String"));
  nw_endpoint_t v11 = bonjour_service;
  if (!bonjour_service)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t typea = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (typea == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (os_log_s *)(id)gLogObj;
      os_log_type_t v18 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_181A5C000, v17, v18, "%{public}s nw_endpoint_create_bonjour_service failed", buf, 0xCu);
      }

      goto LABEL_36;
    }

    if (!v29)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (os_log_s *)(id)gLogObj;
      os_log_type_t v26 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl( &dword_181A5C000,  v17,  v26,  "%{public}s nw_endpoint_create_bonjour_service failed, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (os_log_s *)(id)gLogObj;
    os_log_type_t v22 = typea;
    BOOL v23 = os_log_type_enabled(v17, typea);
    if (!backtrace_string)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl( &dword_181A5C000,  v17,  v22,  "%{public}s nw_endpoint_create_bonjour_service failed, no backtrace",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    if (v23)
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
      __int16 v33 = 2082;
      v34 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v17,  v22,  "%{public}s nw_endpoint_create_bonjour_service failed, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    goto LABEL_23;
  }

  v12 = bonjour_service;
  int v13 = -[nw_endpoint type](v12, "type");

  if (v13 != 3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t typea = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (typea == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (os_log_s *)(id)gLogObj;
      os_log_type_t v20 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl( &dword_181A5C000,  v17,  v20,  "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type",  buf,  0xCu);
      }

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain", *(void *)&a3, a4);
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x189607940]);
    v8 = -[NWBonjourServiceEndpoint name](self, "name");
    [v7 appendPrettyObject:v8 withName:@"name" indent:v4 showFullContent:1];
    v9 = -[NWBonjourServiceEndpoint type](self, "type");
    [v7 appendPrettyObject:v9 withName:@"type" indent:v4 showFullContent:1];
    v10 = -[NWBonjourServiceEndpoint domain](self, "domain");
    [v7 appendPrettyObject:v10 withName:@"domain" indent:v4 showFullContent:1];

    -[NWEndpoint interface](self, "interface");
    nw_endpoint_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v11 withName:@"interface" indent:v4 showFullContent:1];
    v12 = -[NWEndpoint parentEndpointDomain](self, "parentEndpointDomain");
    [v7 appendPrettyObject:v12 withName:@"parentEndpointDomain" indent:v4 showFullContent:1];
  }

  else
  {
    int v13 = (void *)NSString;
    v12 = -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    [v13 stringWithUTF8String:nw_endpoint_get_description(v12)];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)name
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  bonjour_service_name = nw_endpoint_get_bonjour_service_name(v2);

  if (!bonjour_service_name)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    id v19 = "-[NWBonjourServiceEndpoint name]";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        id v19 = "-[NWBonjourServiceEndpoint name]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed";
LABEL_18:
        v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        id v19 = "-[NWBonjourServiceEndpoint name]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
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
        id v19 = "-[NWBonjourServiceEndpoint name]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed, no backtrace";
        v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        id v19 = "-[NWBonjourServiceEndpoint name]";
        __int16 v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_endpoint_get_bonjour_service_name failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      BOOL v4 = 0LL;
      return (NSString *)(id)v4;
    }

- (NSString)type
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  bonjour_service_os_log_type_t type = nw_endpoint_get_bonjour_service_type(v2);

  if (!bonjour_service_type)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    id v19 = "-[NWBonjourServiceEndpoint type]";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        id v19 = "-[NWBonjourServiceEndpoint type]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed";
LABEL_18:
        v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        id v19 = "-[NWBonjourServiceEndpoint type]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
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
        id v19 = "-[NWBonjourServiceEndpoint type]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed, no backtrace";
        v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        id v19 = "-[NWBonjourServiceEndpoint type]";
        __int16 v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_endpoint_get_bonjour_service_type failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      BOOL v4 = 0LL;
      return (NSString *)(id)v4;
    }

- (NSString)domain
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  bonjour_service_domain = nw_endpoint_get_bonjour_service_domain(v2);

  if (!bonjour_service_domain)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    id v19 = "-[NWBonjourServiceEndpoint domain]";
    v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v16 = 0;
    if (__nwlog_fault(v6, &type, &v16))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        id v19 = "-[NWBonjourServiceEndpoint domain]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed";
LABEL_18:
        v14 = v7;
        os_log_type_t v15 = v8;
        goto LABEL_19;
      }

      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v7 = (os_log_s *)(id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        id v19 = "-[NWBonjourServiceEndpoint domain]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (os_log_s *)(id)gLogObj;
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
        id v19 = "-[NWBonjourServiceEndpoint domain]";
        v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed, no backtrace";
        v14 = v7;
        os_log_type_t v15 = v11;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v14, v15, v9, buf, 0xCu);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        id v19 = "-[NWBonjourServiceEndpoint domain]";
        __int16 v20 = 2082;
        v21 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v7,  v11,  "%{public}s nw_endpoint_get_bonjour_service_domain failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v6)
    {
LABEL_14:
      BOOL v4 = 0LL;
      return (NSString *)(id)v4;
    }

@end