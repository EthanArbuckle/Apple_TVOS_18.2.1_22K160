@interface NWInterface
+ (BOOL)supportsSecureCoding;
+ (NWInterface)interfaceWithProtocolBufferData:(id)a3;
+ (id)descriptionForSubtype:(int64_t)a3;
+ (id)descriptionForType:(int64_t)a3;
- (BOOL)hasDNS;
- (BOOL)hasNAT64;
- (BOOL)isConstrained;
- (BOOL)isDeepEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpensive;
- (BOOL)isIPv4Routable;
- (BOOL)isIPv6Routable;
- (BOOL)isShallowEqual:(id)a3;
- (BOOL)isUltraConstrained;
- (BOOL)supportsMulticast;
- (NSString)interfaceName;
- (NSString)privateDescription;
- (NSString)typeString;
- (NWInterface)delegateInterface;
- (NWInterface)initWithCoder:(id)a3;
- (NWInterface)initWithInterface:(id)a3;
- (NWInterface)initWithInterfaceIndex:(unint64_t)a3;
- (NWInterface)initWithInterfaceIndex:(unint64_t)a3 interfaceName:(id)a4;
- (NWInterface)initWithInterfaceName:(id)a3;
- (OS_nw_interface)internalInterface;
- (id)copyLocalAddressForDefaultIPv4;
- (id)copyLocalAddressForDefaultIPv6;
- (id)copyLocalAddressForRemoteAddress:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)ipv4Broadcast;
- (id)ipv4Netmask;
- (int64_t)mtu;
- (int64_t)subtype;
- (int64_t)type;
- (unint64_t)generation;
- (unint64_t)hash;
- (unint64_t)interfaceIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setInternalInterface:(id)a3;
@end

@implementation NWInterface

- (NWInterface)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___NWInterface;
  v5 = -[NWInterface init](&v53, sel_init);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    [v4 decodeObjectOfClasses:v12 forKey:@"dictionary"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      xpc_object_t XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        v17 = nw_interface_create_from_dictionary(XPCDictionaryFromNSDictionary);
        -[NWInterface setInternalInterface:](v5, "setInternalInterface:", v17);
        v18 = -[NWInterface internalInterface](v5, "internalInterface");
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
        v55 = "-[NWInterface initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

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

- (void)encodeWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NWInterface internalInterface](self, "internalInterface");
  id v6 = nw_interface_copy_dictionary(v5);

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x189603FC8];
    id v8 = v6;
    [v7 dictionary];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)applier = MEMORY[0x1895F87A8];
    *(void *)&applier[8] = 3221225472LL;
    *(void *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v34 = &unk_189BC5148;
    id v10 = v9;
    id v35 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      [v4 encodeObject:v10 forKey:@"dictionary"];
LABEL_39:

      goto LABEL_40;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    v17 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v31))
    {
LABEL_37:
      if (v17) {
        free(v17);
      }
      goto LABEL_39;
    }

    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (os_log_s *)(id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        id v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed";
LABEL_34:
        v29 = v18;
        os_log_type_t v30 = v19;
LABEL_35:
        _os_log_impl(&dword_181A5C000, v29, v30, v20, applier, 0xCu);
      }
    }

    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (os_log_s *)(id)gLogObj;
        os_log_type_t v25 = type;
        BOOL v26 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)applier = 136446466;
            *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(void *)&applier[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v18,  v25,  "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s",  applier,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_37;
        }

        if (!v26) {
          goto LABEL_36;
        }
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        id v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace";
        v29 = v18;
        os_log_type_t v30 = v25;
        goto LABEL_35;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (os_log_s *)(id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        id v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded";
        goto LABEL_34;
      }
    }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NWInterface allocWithZone:](&OBJC_CLASS___NWInterface, "allocWithZone:", a3);
  v5 = -[NWInterface internalInterface](self, "internalInterface");
  id v6 = -[NWInterface initWithInterface:](v4, "initWithInterface:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NWInterface *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NWInterface internalInterface](self, "internalInterface");
      -[NWInterface internalInterface](v4, "internalInterface");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = nw_interface_shallow_compare(v5, v6);
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t shallow_hash = nw_interface_get_shallow_hash(v2);

  return shallow_hash;
}

- (NWInterface)initWithInterface:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NWInterface;
    id v6 = -[NWInterface init](&v23, sel_init);
    if (v6)
    {
      BOOL v7 = v6;
      objc_storeStrong((id *)&v6->_internalInterface, a3);
      goto LABEL_4;
    }

    __nwlog_obj();
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWInterface initWithInterface:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    BOOL v7 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWInterface initWithInterface:]";
  id v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v13 = "%{public}s called with null interface";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v11, v12, v13, buf, 0xCu);
      }
    }

    else
    {
      if (v24)
      {
        os_log_type_t v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWInterface initWithInterface:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null interface, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v19);
          goto LABEL_31;
        }

        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v13 = "%{public}s called with null interface, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v13 = "%{public}s called with null interface, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (NWInterface)initWithInterfaceName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = (char *)a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = nw_interface_create_with_name((char *)[v4 UTF8String]);
    if (v6)
    {
      self = -[NWInterface initWithInterface:](self, "initWithInterface:", v6);
      BOOL v7 = self;
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v8 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v20 = "-[NWInterface initWithInterfaceName:]";
        __int16 v21 = 2114;
        BOOL v22 = v5;
        _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s nw_interface_create_with_name(%{public}@) failed",  buf,  0x16u);
      }

      BOOL v7 = 0LL;
    }

    goto LABEL_8;
  }

  __nwlog_obj();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  BOOL v20 = "-[NWInterface initWithInterfaceName:]";
  id v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v11, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v20 = "-[NWInterface initWithInterfaceName:]";
        os_log_type_t v14 = "%{public}s called with null interfaceName";
LABEL_22:
        _os_log_impl(&dword_181A5C000, v12, v13, v14, buf, 0xCu);
      }
    }

    else
    {
      if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v13 = type;
        BOOL v16 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            BOOL v20 = "-[NWInterface initWithInterfaceName:]";
            __int16 v21 = 2082;
            BOOL v22 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v13,  "%{public}s called with null interfaceName, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }

        if (!v16) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v20 = "-[NWInterface initWithInterfaceName:]";
        os_log_type_t v14 = "%{public}s called with null interfaceName, no backtrace";
        goto LABEL_22;
      }

      __nwlog_obj();
      os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        BOOL v20 = "-[NWInterface initWithInterfaceName:]";
        os_log_type_t v14 = "%{public}s called with null interfaceName, backtrace limit exceeded";
        goto LABEL_22;
      }
    }

- (NWInterface)initWithInterfaceIndex:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
    id v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v19 = 0;
    if (__nwlog_fault(v8, &type, &v19))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        id v11 = "%{public}s called with null interfaceIndex";
LABEL_23:
        char v17 = v9;
        os_log_type_t v18 = v10;
        goto LABEL_24;
      }

      if (!v19)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v9 = (os_log_s *)(id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        id v11 = "%{public}s called with null interfaceIndex, backtrace limit exceeded";
        goto LABEL_23;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v9 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v9, type);
      if (!backtrace_string)
      {
        if (!v15)
        {
LABEL_25:

          if (!v8) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }

        *(_DWORD *)buf = 136446210;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        id v11 = "%{public}s called with null interfaceIndex, no backtrace";
        char v17 = v9;
        os_log_type_t v18 = v14;
LABEL_24:
        _os_log_impl(&dword_181A5C000, v17, v18, v11, buf, 0xCu);
        goto LABEL_25;
      }

      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        __int16 v23 = 2082;
        char v24 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v9,  v14,  "%{public}s called with null interfaceIndex, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v8)
    {
LABEL_19:
      id v6 = 0LL;
      goto LABEL_20;
    }

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  +[NWInterface descriptionForType:]( &OBJC_CLASS___NWInterface,  "descriptionForType:",  -[NWInterface type](self, "type"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"type" indent:v5 showFullContent:1];

  +[NWInterface descriptionForSubtype:]( &OBJC_CLASS___NWInterface,  "descriptionForSubtype:",  -[NWInterface subtype](self, "subtype"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"subtype" indent:v5 showFullContent:1];

  if (v4)
  {
    -[NWInterface interfaceName](self, "interfaceName");
    os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v10 withName:@"interfaceName" indent:v5 showFullContent:1];

    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWInterface interfaceIndex](self, "interfaceIndex"),  @"interfaceIndex",  v5);
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWInterface generation](self, "generation"),  @"generation",  v5);
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface mtu](self, "mtu"), @"mtu", v5);
    -[NWInterface ipv4Netmask](self, "ipv4Netmask");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v11 withName:@"ipv4Netmask" indent:v5 showFullContent:1];

    -[NWInterface ipv4Broadcast](self, "ipv4Broadcast");
    os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v12 withName:@"ipv4Broadcast" indent:v5 showFullContent:1];

    if (-[NWInterface supportsMulticast](self, "supportsMulticast")) {
      [v7 appendPrettyBOOL:1 withName:@"supportsMulticast" indent:v5];
    }
    if (-[NWInterface hasDNS](self, "hasDNS")) {
      [v7 appendPrettyBOOL:1 withName:@"hasDNS" indent:v5];
    }
    if (-[NWInterface hasNAT64](self, "hasNAT64")) {
      [v7 appendPrettyBOOL:1 withName:@"hasNAT64" indent:v5];
    }
    if (-[NWInterface isIPv4Routable](self, "isIPv4Routable")) {
      [v7 appendPrettyBOOL:1 withName:@"ipv4Routable" indent:v5];
    }
    if (-[NWInterface isIPv6Routable](self, "isIPv6Routable")) {
      [v7 appendPrettyBOOL:1 withName:@"ipv6Routable" indent:v5];
    }
  }

  if (-[NWInterface isExpensive](self, "isExpensive")) {
    [v7 appendPrettyBOOL:1 withName:@"expensive" indent:v5];
  }
  if (-[NWInterface isConstrained](self, "isConstrained")) {
    [v7 appendPrettyBOOL:1 withName:@"constrained" indent:v5];
  }
  if (-[NWInterface isUltraConstrained](self, "isUltraConstrained")) {
    [v7 appendPrettyBOOL:1 withName:@"ultraConstrained" indent:v5];
  }
  return v7;
}

- (id)description
{
  return  -[NWInterface descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWInterface descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (NSString)interfaceName
{
  v2 = (char *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [NSString stringWithUTF8String:v2 + 104];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = 0LL;
  }

  return (NSString *)v3;
}

- (unint64_t)interfaceIndex
{
  v2 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unint64_t v3 = v2[2];
  }
  else {
    unint64_t v3 = 0LL;
  }

  return v3;
}

- (int64_t)type
{
  v2 = (nw_interface *)objc_claimAutoreleasedReturnValue();
  int64_t type = nw_interface_get_type(v2);

  return type;
}

- (int64_t)subtype
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  subint64_t type = nw_interface_get_subtype(v2);

  return subtype;
}

- (BOOL)isExpensive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_expensive = nw_interface_is_expensive(v2);

  return is_expensive;
}

- (BOOL)isConstrained
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_constrained = nw_interface_is_constrained(v2);

  return is_constrained;
}

- (BOOL)isUltraConstrained
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_ultra_constrained = nw_interface_is_ultra_constrained(v2);

  return is_ultra_constrained;
}

- (BOOL)supportsMulticast
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = nw_interface_supports_multicast(v2);

  return v3;
}

- (BOOL)hasDNS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_dns = nw_interface_has_dns(v2);

  return has_dns;
}

- (BOOL)hasNAT64
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_nat64 = nw_interface_has_nat64(v2);

  return has_nat64;
}

- (BOOL)isIPv4Routable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_ipv4_routable = nw_interface_is_ipv4_routable(v2);

  return is_ipv4_routable;
}

- (BOOL)isIPv6Routable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_ipv6_routable = nw_interface_is_ipv6_routable(v2);

  return is_ipv6_routable;
}

- (int64_t)mtu
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t mtu = (int)nw_interface_get_mtu(v2);

  return mtu;
}

- (unint64_t)generation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t generation = nw_interface_get_generation(v2);

  return generation;
}

- (NWInterface)delegateInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = nw_interface_copy_delegate_interface(v2);

  if (v3) {
    BOOL v4 = -[NWInterface initWithInterfaceIndex:]( objc_alloc(&OBJC_CLASS___NWInterface),  "initWithInterfaceIndex:",  v3->index);
  }
  else {
    BOOL v4 = 0LL;
  }

  return v4;
}

- (id)ipv4Netmask
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_interface_copy_ipv4_netmask_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v3);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

- (id)ipv4Broadcast
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_interface_copy_ipv4_broadcast_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v3);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

- (BOOL)isShallowEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 internalInterface];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = nw_interface_shallow_compare(v5, v6);
  return (char)v4;
}

- (BOOL)isDeepEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 internalInterface];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = nw_interface_deep_compare(v5, v6);
  return (char)v4;
}

- (NSString)typeString
{
  v2 = (nw_interface *)objc_claimAutoreleasedReturnValue();
  +[NWInterface descriptionForType:](&OBJC_CLASS___NWInterface, "descriptionForType:", nw_interface_get_type(v2));
  nw_endpoint_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)createProtocolBufferObject
{
  nw_endpoint_t v3 = objc_alloc_init(&OBJC_CLASS___NWPBInterface);
  -[NWInterface interfaceName](self, "interfaceName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_name, v4);

    unsigned int v6 = -[NWInterface interfaceIndex](self, "interfaceIndex");
    *(_BYTE *)&v3->_has |= 4u;
    v3->_index = v6;
  }

  else
  {

    -[NWInterface interfaceIndex](self, "interfaceIndex");
  }

  -[NWInterface delegateInterface](self, "delegateInterface");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 interfaceIndex];
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 1u;
    v3->_delegateIndex = v8;

    unsigned int v9 = -[NWInterface mtu](self, "mtu");
    *(_BYTE *)&v3->_has |= 8u;
    v3->_int64_t mtu = v9;
    unsigned int v10 = -[NWInterface generation](self, "generation");
    *(_BYTE *)&v3->_has |= 2u;
    v3->_unint64_t generation = v10;
    int v11 = -[NWInterface type](self, "type");
    *(_BYTE *)&v3->_has |= 0x20u;
    v3->_int64_t type = v11;
    int v12 = -[NWInterface subtype](self, "subtype");
    *(_BYTE *)&v3->_has |= 0x10u;
    v3->_subint64_t type = v12;
    BOOL v13 = -[NWInterface isExpensive](self, "isExpensive");
    *(_BYTE *)&v3->_has |= 0x40u;
    v3->_expensive = v13;
  }

  else
  {

    -[NWInterface mtu](self, "mtu");
    -[NWInterface generation](self, "generation");
    -[NWInterface type](self, "type");
    -[NWInterface subtype](self, "subtype");
    -[NWInterface isExpensive](self, "isExpensive");
  }

  return v3;
}

- (OS_nw_interface)internalInterface
{
  return (OS_nw_interface *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInternalInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForType:(int64_t)a3
{
  else {
    nw_endpoint_t v3 = off_189BC9540[a3];
  }
  return (id)[NSString stringWithUTF8String:v3];
}

+ (id)descriptionForSubtype:(int64_t)a3
{
  if ((int)a3 <= 1001)
  {
    if (!(_DWORD)a3)
    {
      nw_endpoint_t v3 = "other";
      return (id)[NSString stringWithUTF8String:v3];
    }

    if ((_DWORD)a3 == 1001)
    {
      nw_endpoint_t v3 = "wifi_infrastructure";
      return (id)[NSString stringWithUTF8String:v3];
    }

+ (NWInterface)interfaceWithProtocolBufferData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___NWPBInterface), "initWithData:", v3);

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
    unsigned int v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v10, &type, &v22))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        BOOL v13 = "%{public}s [NWPBInterface initWithData:] failed";
LABEL_26:
        BOOL v20 = v11;
        os_log_type_t v21 = v12;
        goto LABEL_27;
      }

      if (!v22)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v11 = (os_log_s *)(id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        BOOL v13 = "%{public}s [NWPBInterface initWithData:] failed, backtrace limit exceeded";
        goto LABEL_26;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      int v11 = (os_log_s *)(id)gLogObj;
      os_log_type_t v17 = type;
      BOOL v18 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_28:

          if (!v10) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }

        *(_DWORD *)buf = 136446210;
        uint64_t v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        BOOL v13 = "%{public}s [NWPBInterface initWithData:] failed, no backtrace";
        BOOL v20 = v11;
        os_log_type_t v21 = v17;
LABEL_27:
        _os_log_impl(&dword_181A5C000, v20, v21, v13, buf, 0xCu);
        goto LABEL_28;
      }

      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
        __int16 v26 = 2082;
        v27 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v11,  v17,  "%{public}s [NWPBInterface initWithData:] failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v10)
    {
LABEL_22:
      BOOL v15 = 0LL;
      goto LABEL_23;
    }

- (NWInterface)initWithInterfaceIndex:(unint64_t)a3 interfaceName:(id)a4
{
  *(void *)&v37[13] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  int v7 = v6;
  if (a3)
  {
    if (v6)
    {
      unsigned int v8 = nw_interface_create_with_index_and_name(a3, (unsigned __int8 *)[v6 UTF8String]);
      if (v8)
      {
        self = -[NWInterface initWithInterface:](self, "initWithInterface:", v8);
        id v9 = self;
LABEL_19:

        goto LABEL_20;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      unsigned int v10 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
        __int16 v36 = 1024;
        *(_DWORD *)v37 = a3;
        v37[2] = 2114;
        *(void *)&v37[3] = v7;
        _os_log_impl( &dword_181A5C000,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s nw_interface_create_with_index_and_name failed for index, name (%u, %{public}@)",  buf,  0x1Cu);
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      id v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      os_log_type_t v12 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v32 = 0;
      if (__nwlog_fault(v12, &type, &v32))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v13 = (os_log_s *)(id)gLogObj;
          os_log_type_t v14 = type;
          if (!os_log_type_enabled(v13, type)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136446210;
          id v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          BOOL v15 = "%{public}s nw_interface_create_with_index_and_name failed";
LABEL_23:
          BOOL v20 = v13;
          os_log_type_t v21 = v14;
          goto LABEL_24;
        }

        if (!v32)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v13 = (os_log_s *)(id)gLogObj;
          os_log_type_t v14 = type;
          if (!os_log_type_enabled(v13, type)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136446210;
          id v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          BOOL v15 = "%{public}s nw_interface_create_with_index_and_name failed, backtrace limit exceeded";
          goto LABEL_23;
        }

        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v13 = (os_log_s *)(id)gLogObj;
        os_log_type_t v17 = type;
        BOOL v18 = os_log_type_enabled(v13, type);
        if (!backtrace_string)
        {
          if (!v18)
          {
LABEL_25:

            if (!v12) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }

          *(_DWORD *)buf = 136446210;
          id v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          BOOL v15 = "%{public}s nw_interface_create_with_index_and_name failed, no backtrace";
          BOOL v20 = v13;
          os_log_type_t v21 = v17;
LABEL_24:
          _os_log_impl(&dword_181A5C000, v20, v21, v15, buf, 0xCu);
          goto LABEL_25;
        }

        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          id v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v36 = 2082;
          *(void *)v37 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v13,  v17,  "%{public}s nw_interface_create_with_index_and_name failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
      }

      if (!v12)
      {
LABEL_18:
        id v9 = 0LL;
        goto LABEL_19;
      }

- (id)copyLocalAddressForRemoteAddress:(id)a3
{
  id v4 = a3;
  -[NWInterface internalInterface](self, "internalInterface");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 internalEndpoint];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  nw_endpoint_t v7 = nw_interface_copy_local_address_for_remote_address(v5, v6);
  if (v7)
  {
    +[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v7);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  return v8;
}

- (id)copyLocalAddressForDefaultIPv6
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[NWInterface copyLocalAddressForRemoteAddress:](self, "copyLocalAddressForRemoteAddress:", v3);

  return v4;
}

- (id)copyLocalAddressForDefaultIPv4
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[NWInterface copyLocalAddressForRemoteAddress:](self, "copyLocalAddressForRemoteAddress:", v3);

  return v4;
}

@end