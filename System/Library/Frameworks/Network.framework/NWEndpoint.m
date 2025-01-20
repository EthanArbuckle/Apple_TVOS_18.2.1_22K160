@interface NWEndpoint
+ (BOOL)supportsResolverCallback;
+ (BOOL)supportsSecureCoding;
+ (Class)copyClassForEndpointType:(int)a3;
+ (NWEndpoint)endpointWithCEndpoint:(id)a3;
+ (NWEndpoint)endpointWithInternalEndpoint:(id)a3;
+ (NWEndpoint)endpointWithProtocolBufferData:(id)a3;
+ (unsigned)endpointType;
- (BOOL)isEqual:(id)a3;
- (NSData)txtRecord;
- (NSString)parentEndpointDomain;
- (NSString)privateDescription;
- (NWEndpoint)initWithCoder:(id)a3;
- (NWEndpoint)initWithEncodedData:(id)a3;
- (NWEndpoint)initWithEndpoint:(id)a3;
- (NWInterface)interface;
- (OS_nw_endpoint)internalEndpoint;
- (id)copyCEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)encodedData;
- (int64_t)remoteInterfaceType;
- (unint64_t)hash;
- (unsigned)alternatePort;
- (void)encodeWithCoder:(id)a3;
- (void)resolveEndpointWithCompletionHandler:(id)a3;
- (void)setAlternatePort:(unsigned __int16)a3;
- (void)setInterface:(id)a3;
- (void)setInternalEndpoint:(id)a3;
- (void)setRemoteInterfaceType:(int64_t)a3;
- (void)setTxtRecord:(id)a3;
@end

@implementation NWEndpoint

+ (NWEndpoint)endpointWithCEndpoint:(id)a3
{
  return +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", a3);
}

+ (NWEndpoint)endpointWithInternalEndpoint:(id)a3
{
  v3 = (nw_endpoint *)a3;
  v4 = +[NWEndpoint copyClassForEndpointType:]( &OBJC_CLASS___NWEndpoint,  "copyClassForEndpointType:",  nw_endpoint_get_type(v3));
  v5 = (void *)[[v4 alloc] initWithEndpoint:v3];

  return (NWEndpoint *)v5;
}

+ (Class)copyClassForEndpointType:(int)a3
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (NWEndpoint)initWithEndpoint:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NWEndpoint;
    v6 = -[NWEndpoint init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalEndpoint, a3);
      goto LABEL_4;
    }

    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWEndpoint initWithEndpoint:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWEndpoint initWithEndpoint:]";
          __int16 v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }

      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    v7 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWEndpoint initWithEndpoint:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v11, v12, v13, buf, 0xCu);
      }
    }

    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWEndpoint initWithEndpoint:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null internalEndpoint, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v19);
          goto LABEL_31;
        }

        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (void)encodeWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v5 copyDictionary];

  if (v6)
  {
    v7 = (void *)MEMORY[0x189603FC8];
    id v8 = v6;
    [v7 dictionary];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)applier = MEMORY[0x1895F87A8];
    *(void *)&applier[8] = 3221225472LL;
    *(void *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    uint64_t v30 = &unk_189BC5148;
    id v10 = v9;
    id v31 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      [v4 encodeObject:v10 forKey:@"dictionary"];
LABEL_18:

      goto LABEL_19;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (__nwlog_fault(v16, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v17 = (os_log_s *)(id)gLogObj;
        os_log_type_t v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)applier = 136446210;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl( &dword_181A5C000,  v17,  v18,  "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed",  applier,  0xCu);
        }
      }

      else if (v27)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v17 = (os_log_s *)(id)gLogObj;
        os_log_type_t v23 = type;
        BOOL v24 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)applier = 136446466;
            *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(void *)&applier[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v17,  v23,  "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s",  applier,  0x16u);
          }

          free(backtrace_string);
          if (!v16) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }

        if (v24)
        {
          *(_DWORD *)applier = 136446210;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl( &dword_181A5C000,  v17,  v23,  "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace",  applier,  0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v17 = (os_log_s *)(id)gLogObj;
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)applier = 136446210;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl( &dword_181A5C000,  v17,  v26,  "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded",  applier,  0xCu);
        }
      }
    }

    if (!v16) {
      goto LABEL_18;
    }
LABEL_17:
    free(v16);
    goto LABEL_18;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
  os_log_type_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v12, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_181A5C000, v13, v14, "%{public}s nw_endpoint_copy_dictionary failed", applier, 0xCu);
      }
    }

    else if (v27)
    {
      v19 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v20 = type;
      BOOL v21 = os_log_type_enabled(v13, type);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)applier = 136446466;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          *(_WORD *)&applier[12] = 2082;
          *(void *)&applier[14] = v19;
          _os_log_impl( &dword_181A5C000,  v13,  v20,  "%{public}s nw_endpoint_copy_dictionary failed, dumping backtrace:%{public}s",  applier,  0x16u);
        }

        free(v19);
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_19;
      }

      if (v21)
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl( &dword_181A5C000,  v13,  v20,  "%{public}s nw_endpoint_copy_dictionary failed, no backtrace",  applier,  0xCu);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (os_log_s *)(id)gLogObj;
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl( &dword_181A5C000,  v13,  v25,  "%{public}s nw_endpoint_copy_dictionary failed, backtrace limit exceeded",  applier,  0xCu);
      }
    }
  }

  if (v12) {
LABEL_10:
  }
    free(v12);
LABEL_19:
}

- (OS_nw_endpoint)internalEndpoint
{
  return self->_internalEndpoint;
}

- (void).cxx_destruct
{
}

- (NWEndpoint)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___NWEndpoint;
  id v5 = -[NWEndpoint init](&v53, sel_init);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    os_log_type_t v12 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    [v4 decodeObjectOfClasses:v12 forKey:@"dictionary"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v14 = v13;
    if (v13)
    {
      xpc_object_t XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        os_log_type_t v17 = nw_endpoint_create_from_dictionary(XPCDictionaryFromNSDictionary);
        -[NWEndpoint setInternalEndpoint:](v5, "setInternalEndpoint:", v17);

        -[NWEndpoint internalEndpoint](v5, "internalEndpoint");
        os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = v5;
LABEL_39:

          goto LABEL_40;
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v33 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        os_log_type_t v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
        {
LABEL_36:
          if (!v26)
          {
LABEL_38:
            v19 = 0LL;
            goto LABEL_39;
          }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v4 initWithEndpoint:v5];

  return v6;
}

- (void)resolveEndpointWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  if (!v4)
  {
    *(_DWORD *)buf = 136446210;
    char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v10, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v13 = "%{public}s called with null completionHandler";
LABEL_36:
        BOOL v22 = v11;
        os_log_type_t v23 = v12;
        goto LABEL_37;
      }

      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v13 = "%{public}s called with null completionHandler, backtrace limit exceeded";
        goto LABEL_36;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v11 = (os_log_s *)(id)gLogObj;
      os_log_type_t v18 = type;
      BOOL v19 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v19)
        {
LABEL_38:

          if (!v10) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }

        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        v13 = "%{public}s called with null completionHandler, no backtrace";
        BOOL v22 = v11;
        os_log_type_t v23 = v18;
LABEL_37:
        _os_log_impl(&dword_181A5C000, v22, v23, v13, buf, 0xCu);
        goto LABEL_38;
      }

      if (v19)
      {
        *(_DWORD *)buf = 136446466;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        __int16 v28 = 2082;
        v29 = (NWEndpoint *)backtrace_string;
        _os_log_impl( &dword_181A5C000,  v11,  v18,  "%{public}s called with null completionHandler, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v10) {
      goto LABEL_25;
    }
LABEL_24:
    free(v10);
    goto LABEL_25;
  }

  *(_DWORD *)buf = 136446466;
  char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
  __int16 v28 = 2114;
  v29 = self;
  id v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v6, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446466;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      v29 = self;
      uint64_t v9 = "%{public}s Endpoint %{public}@ does not support custom resolution";
LABEL_28:
      id v20 = v7;
      os_log_type_t v21 = v8;
      goto LABEL_29;
    }

    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (os_log_s *)(id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446466;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      v29 = self;
      uint64_t v9 = "%{public}s Endpoint %{public}@ does not support custom resolution, backtrace limit exceeded";
      goto LABEL_28;
    }

    os_log_type_t v14 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v7 = (os_log_s *)(id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v7, type);
    if (!v14)
    {
      if (!v16)
      {
LABEL_30:

        if (!v6) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }

      *(_DWORD *)buf = 136446466;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      v29 = self;
      uint64_t v9 = "%{public}s Endpoint %{public}@ does not support custom resolution, no backtrace";
      id v20 = v7;
      os_log_type_t v21 = v15;
LABEL_29:
      _os_log_impl(&dword_181A5C000, v20, v21, v9, buf, 0x16u);
      goto LABEL_30;
    }

    if (v16)
    {
      *(_DWORD *)buf = 136446722;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      v29 = self;
      __int16 v30 = 2082;
      os_log_type_t v31 = v14;
      _os_log_impl( &dword_181A5C000,  v7,  v15,  "%{public}s Endpoint %{public}@ does not support custom resolution, dumping backtrace:%{public}s",  buf,  0x20u);
    }

    free(v14);
  }

  if (v6) {
LABEL_16:
  }
    free(v6);
LABEL_17:
  (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
LABEL_25:
}

- (NWEndpoint)initWithEncodedData:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v44 = 0;
    if (__nwlog_fault(v13, &type, &v44))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v14 = (os_log_s *)(id)gLogObj;
        os_log_type_t v15 = type;
        if (!os_log_type_enabled(v14, type)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        BOOL v16 = "%{public}s called with null internalEndpoint";
LABEL_31:
        __int16 v30 = v14;
        os_log_type_t v31 = v15;
        goto LABEL_32;
      }

      if (!v44)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v14 = (os_log_s *)(id)gLogObj;
        os_log_type_t v15 = type;
        if (!os_log_type_enabled(v14, type)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        BOOL v16 = "%{public}s called with null internalEndpoint, backtrace limit exceeded";
        goto LABEL_31;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v14 = (os_log_s *)(id)gLogObj;
      os_log_type_t v25 = type;
      BOOL v26 = os_log_type_enabled(v14, type);
      if (!backtrace_string)
      {
        if (!v26)
        {
LABEL_33:

          if (!v13) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }

        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        BOOL v16 = "%{public}s called with null internalEndpoint, no backtrace";
        __int16 v30 = v14;
        os_log_type_t v31 = v25;
LABEL_32:
        _os_log_impl(&dword_181A5C000, v30, v31, v16, buf, 0xCu);
        goto LABEL_33;
      }

      if (v26)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        __int16 v48 = 2082;
        v49 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v14,  v25,  "%{public}s called with null internalEndpoint, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v13)
    {
LABEL_23:

      os_log_type_t v18 = 0LL;
      goto LABEL_46;
    }

- (id)encodedData
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v2 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  BOOL v16 = "-[NWEndpoint encodedData]";
  v3 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v3, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v4 = (os_log_s *)(id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v16 = "-[NWEndpoint encodedData]";
      id v6 = "%{public}s encodedData must be overridden";
LABEL_15:
      uint64_t v11 = v4;
      os_log_type_t v12 = v5;
      goto LABEL_16;
    }

    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v4 = (os_log_s *)(id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      BOOL v16 = "-[NWEndpoint encodedData]";
      id v6 = "%{public}s encodedData must be overridden, backtrace limit exceeded";
      goto LABEL_15;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v4 = (os_log_s *)(id)gLogObj;
    os_log_type_t v8 = type;
    BOOL v9 = os_log_type_enabled(v4, type);
    if (!backtrace_string)
    {
      if (!v9)
      {
LABEL_17:

        if (!v3) {
          return 0LL;
        }
        goto LABEL_11;
      }

      *(_DWORD *)buf = 136446210;
      BOOL v16 = "-[NWEndpoint encodedData]";
      id v6 = "%{public}s encodedData must be overridden, no backtrace";
      uint64_t v11 = v4;
      os_log_type_t v12 = v8;
LABEL_16:
      _os_log_impl(&dword_181A5C000, v11, v12, v6, buf, 0xCu);
      goto LABEL_17;
    }

    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      BOOL v16 = "-[NWEndpoint encodedData]";
      __int16 v17 = 2082;
      os_log_type_t v18 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v4,  v8,  "%{public}s encodedData must be overridden, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    free(backtrace_string);
  }

  if (v3) {
LABEL_11:
  }
    free(v3);
  return 0LL;
}

- (id)copyCEndpoint
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  id v4 = (void *)NSString;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint", *(void *)&a3, a4);
  os_log_type_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithUTF8String:nw_endpoint_get_description(v5)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  return  -[NWEndpoint descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWEndpoint descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (NWInterface)interface
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_endpoint_copy_interface(v2);

  if (v3) {
    id v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (void)setInterface:(id)a3
{
  id v4 = a3;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 internalInterface];
  os_log_type_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  nw_endpoint_set_interface(v6, v5);
}

- (int64_t)remoteInterfaceType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  remote_interface_os_log_type_t type = nw_endpoint_get_remote_interface_type(v2);

  return remote_interface_type;
}

- (void)setRemoteInterfaceType:(int64_t)a3
{
  int v3 = a3;
  -[NWEndpoint internalEndpoint](self, "internalEndpoint");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_endpoint_set_remote_interface_type(v4, v3);
}

- (NSData)txtRecord
{
  id v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
  nw_txt_record_t v3 = nw_endpoint_copy_txt_record(v2);

  if (!v3 || ((v4 = *((void *)v3 + 1), uint64_t v5 = *((void *)v3 + 2), v4) ? (v6 = v5 == 0) : (v6 = 1), v6)) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v4 length:v5];
  }

  return (NSData *)v7;
}

- (void)setTxtRecord:(id)a3
{
  id v6 = a3;
  if ([v6 bytes] && objc_msgSend(v6, "length"))
  {
    uint64_t v4 = nw_txt_record_create_with_bytes((const uint8_t *)[v6 bytes], objc_msgSend(v6, "length"));
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    nw_endpoint_set_txt_record(v5, v4);
  }

  else
  {
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    nw_endpoint_set_txt_record(v4, 0LL);
  }
}

- (NSString)parentEndpointDomain
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL parent_endpoint_domain = nw_endpoint_get_parent_endpoint_domain((uint64_t)v2);

  if (parent_endpoint_domain)
  {
    [NSString stringWithUTF8String:parent_endpoint_domain];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSString *)v4;
}

- (unsigned)alternatePort
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 alternate_port = nw_endpoint_get_alternate_port(v2);

  return alternate_port;
}

- (void)setAlternatePort:(unsigned __int16)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_endpoint_set_alternate_port(v4, a3);
}

- (id)createProtocolBufferObject
{
  nw_txt_record_t v3 = objc_alloc_init(&OBJC_CLASS___NWPBEndpoint);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NWPBServiceEndpoint);
    if (v3) {
      objc_storeStrong((id *)&v3->_service, v4);
    }

    -[NWEndpoint name](self, "name");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      id v6 = v3->_service;
      uint64_t v7 = v6;
      if (v6) {
        objc_storeStrong((id *)&v6->_name, v5);
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    -[NWEndpoint type](self, "type");
    os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      BOOL v9 = v3->_service;
      uint64_t v10 = v9;
      if (v9) {
        objc_storeStrong((id *)&v9->_type, v8);
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    -[NWEndpoint domain](self, "domain");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      os_log_type_t v12 = v3->_service;
      if (v12)
      {
        uint64_t v13 = 1LL;
LABEL_28:
        objc_storeStrong((id *)&(&v12->super.super.isa)[v13], v11);
        goto LABEL_29;
      }

      goto LABEL_29;
    }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    -[NWEndpoint internalEndpoint](self, "internalEndpoint");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 internalEndpoint];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    char is_equal = nw_endpoint_is_equal(v6, v7, 1LL);
  }

  else
  {
    char is_equal = 0;
  }

  return is_equal;
}

- (unint64_t)hash
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 getHash];

  return v3;
}

- (void)setInternalEndpoint:(id)a3
{
}

void __34__NWEndpoint_initWithEncodedData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = *(objc_class **)(a1 + 32);
  id v10 = a2;
  id v11 = objc_alloc(v9);
  id v12 = nw_endpoint_copy_custom_data(v10);

  id v13 = v12;
  os_log_type_t v14 = v13;
  if (v13) {
    id v15 = v13;
  }

  BOOL v16 = (void *)[v11 initWithEncodedData:v14];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __34__NWEndpoint_initWithEncodedData___block_invoke_2;
  v19[3] = &unk_189BBBE78;
  id v20 = v7;
  id v21 = v8;
  id v17 = v8;
  id v18 = v7;
  [v16 resolveEndpointWithCompletionHandler:v19];
}

void __34__NWEndpoint_initWithEncodedData___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if ([v5 count])
  {
    BOOL v6 = nw_array_create();
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v11) internalEndpoint];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          nw_array_append(v6, v12);

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v9);
    }
  }

  else
  {
    BOOL v6 = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__NWEndpoint_initWithEncodedData___block_invoke_3;
  block[3] = &unk_189BBBE50;
  id v13 = *(dispatch_queue_s **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v17 = (id)v6;
  id v18 = v14;
  char v19 = a3;
  id v15 = (id)v6;
  dispatch_async(v13, block);
}

uint64_t __34__NWEndpoint_initWithEncodedData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48));
}

+ (unsigned)endpointType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsResolverCallback
{
  return 0;
}

+ (NWEndpoint)endpointWithProtocolBufferData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___NWPBEndpoint), "initWithData:", v3);

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
    id v18 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault((const char *)v18, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v19 = (os_log_s *)(id)gLogObj;
        os_log_type_t v20 = type;
        if (!os_log_type_enabled(v19, type)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        __int128 v21 = "%{public}s [NWPBEndpoint initWithData:] failed";
LABEL_32:
        BOOL v36 = v19;
        os_log_type_t v37 = v20;
        goto LABEL_33;
      }

      if (!v39)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v19 = (os_log_s *)(id)gLogObj;
        os_log_type_t v20 = type;
        if (!os_log_type_enabled(v19, type)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        __int128 v21 = "%{public}s [NWPBEndpoint initWithData:] failed, backtrace limit exceeded";
        goto LABEL_32;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      char v19 = (os_log_s *)(id)gLogObj;
      os_log_type_t v32 = type;
      BOOL v33 = os_log_type_enabled(v19, type);
      if (!backtrace_string)
      {
        if (!v33)
        {
LABEL_34:

          if (!v18) {
            goto LABEL_36;
          }
LABEL_35:
          free(v18);
          goto LABEL_36;
        }

        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        __int128 v21 = "%{public}s [NWPBEndpoint initWithData:] failed, no backtrace";
        BOOL v36 = v19;
        os_log_type_t v37 = v32;
LABEL_33:
        _os_log_impl(&dword_181A5C000, v36, v37, v21, buf, 0xCu);
        goto LABEL_34;
      }

      if (v33)
      {
        *(_DWORD *)buf = 136446466;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        __int16 v43 = 2082;
        char v44 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v19,  v32,  "%{public}s [NWPBEndpoint initWithData:] failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v18) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }

  service = v4->_service;
  if (!service)
  {
    host = v4->_host;
    if (host)
    {
      BOOL v6 = host;
      id v7 = v6[1];
      __int128 v23 = v4->_host;
      uint64_t v9 = v23;
      if (v23) {
        port = v23->_port;
      }
      else {
        port = 0LL;
      }
      uint64_t v11 = port;
      +[NWHostEndpoint endpointWithHostname:port:](&OBJC_CLASS___NWHostEndpoint, "endpointWithHostname:port:", v7, v11);
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }

    address = v4->_address;
    if (address)
    {
      os_log_type_t v35 = address;
      BOOL v6 = (id *)v35[1];

      +[NWAddressEndpoint endpointWithAddress:]( NWAddressEndpoint,  "endpointWithAddress:",  [v6 bytes]);
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }

@end