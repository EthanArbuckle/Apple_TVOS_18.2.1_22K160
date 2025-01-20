@interface NWPath
+ (NWPath)pathWithProtocolBufferData:(id)a3;
+ (id)allClientIDs;
+ (id)createStringFromStatus:(int64_t)a3;
+ (id)pathForClientID:(id)a3;
+ (id)pathForClientID:(id)a3 parametersTLV:(id)a4 pathResultTLV:(id)a5;
- (BOOL)fallbackEligible;
- (BOOL)fallbackIsPreferred;
- (BOOL)fallbackIsWeak;
- (BOOL)hasAdvertiseDescriptor;
- (BOOL)hasApplicationLevelFirewall;
- (BOOL)hasBrowseDescriptor;
- (BOOL)hasCustomPFRules;
- (BOOL)hasKernelExtensionFilter;
- (BOOL)hasParentalControls;
- (BOOL)hasProxySettings;
- (BOOL)hasUnsatisfiedFallbackAgent;
- (BOOL)isConstrained;
- (BOOL)isDirect;
- (BOOL)isEligibleForCrazyIvan46;
- (BOOL)isEqualToPath:(NWPath *)path;
- (BOOL)isExpensive;
- (BOOL)isFiltered;
- (BOOL)isFlowDivert;
- (BOOL)isLinkQualityAbort;
- (BOOL)isListener;
- (BOOL)isListenerInterfaceSpecific;
- (BOOL)isLocal;
- (BOOL)isPerAppVPN;
- (BOOL)isRoaming;
- (BOOL)isUltraConstrained;
- (BOOL)isViable;
- (BOOL)shouldProbeConnectivity;
- (BOOL)supportsDNS;
- (BOOL)supportsIPv4;
- (BOOL)supportsIPv6;
- (BOOL)unsatisfiedVoluntaryAgentMatchesAddress:(id)a3 triggerImmediately:(BOOL *)a4;
- (BOOL)usesInterfaceType:(int64_t)a3;
- (BOOL)usesNetworkAgent:(id)a3;
- (BOOL)usesNetworkAgentType:(Class)a3;
- (NSArray)dnsSearchDomains;
- (NSArray)dnsServers;
- (NSArray)dnsServersAsStrings;
- (NSArray)flows;
- (NSArray)gateways;
- (NSArray)groupMembers;
- (NSArray)overrideDNSSearchDomains;
- (NSArray)overrideDNSServers;
- (NSArray)overrideDNSServersAsStrings;
- (NSArray)proxySettings;
- (NSString)privateDescription;
- (NSString)reasonDescription;
- (NSString)statusAsString;
- (NSUUID)clientID;
- (NWAdvertiseDescriptor)advertiseDescriptor;
- (NWBrowseDescriptor)browseDescriptor;
- (NWEndpoint)effectiveLocalEndpoint;
- (NWEndpoint)effectiveRemoteEndpoint;
- (NWEndpoint)endpoint;
- (NWInterface)connectedInterface;
- (NWInterface)fallbackInterface;
- (NWInterface)interface;
- (NWInterface)scopedInterface;
- (NWParameters)derivedParameters;
- (NWParameters)parameters;
- (NWPath)init;
- (NWPath)initWithPath:(id)a3;
- (NWPathStatus)status;
- (OS_nw_path)internalPath;
- (id)copyDNSSearchDomains:(BOOL)a3;
- (id)copyDNSServerEndpoints:(BOOL)a3;
- (id)copyDNSServersStrings:(id)a3;
- (id)copyDataFromNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (id)copyFlowDivertToken;
- (id)createProtocolBufferObject;
- (id)delegateInterface;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)genericNetworkAgentsWithDomain:(id)a3 type:(id)a4;
- (id)inactiveNetworkAgentUUIDsOnlyVoluntary:(BOOL)a3;
- (id)networkAgentsOfType:(Class)a3;
- (int)dnsServiceID;
- (int64_t)maximumDatagramSize;
- (int64_t)mtu;
- (int64_t)reason;
- (unint64_t)secondsSinceInterfaceChange;
- (unsigned)fallbackInterfaceIndex;
- (unsigned)filterControlUnit;
- (unsigned)flowDivertAggregateUnit;
- (unsigned)flowDivertControlUnit;
- (unsigned)policyID;
@end

@implementation NWPath

- (NWPath)init
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NWPath;
  v2 = -[NWPath init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWPath init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWPath init]";
        v10 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v8, v9, v10, buf, 0xCu);
      }
    }

    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWPath init]";
            __int16 v18 = 2082;
            v19 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v8,  v9,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWPath init]";
        v10 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWPath init]";
        v10 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (NWPath)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NWPath;
    v6 = -[NWPath init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalPath, a3);
      goto LABEL_4;
    }

    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWPath initWithPath:]";
    objc_super v15 = (char *)_os_log_send_and_compose_impl();

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
        v27 = "-[NWPath initWithPath:]";
        __int16 v18 = "%{public}s [super init] failed";
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
          v27 = "-[NWPath initWithPath:]";
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
        v27 = "-[NWPath initWithPath:]";
        __int16 v18 = "%{public}s [super init] failed, no backtrace";
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
        v27 = "-[NWPath initWithPath:]";
        __int16 v18 = "%{public}s [super init] failed, backtrace limit exceeded";
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
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWPath initWithPath:]";
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
        v27 = "-[NWPath initWithPath:]";
        char v13 = "%{public}s called with null path";
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
            v27 = "-[NWPath initWithPath:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null path, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v19);
          goto LABEL_31;
        }

        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        char v13 = "%{public}s called with null path, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        char v13 = "%{public}s called with null path, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (NSString)statusAsString
{
  return (NSString *)+[NWPath createStringFromStatus:]( &OBJC_CLASS___NWPath,  "createStringFromStatus:",  -[NWPath status](self, "status"));
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  v8 = -[NWPath statusAsString](self, "statusAsString");
  [v7 appendPrettyObject:v8 withName:@"status" indent:v5 showFullContent:1];

  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath reason](self, "reason"), @"reasonCode", v5);
  -[NWPath reasonDescription](self, "reasonDescription");
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"reason" indent:v5 showFullContent:1];

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isViable](self, "isViable"), @"isViable", v5);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPath isExpensive](self, "isExpensive"),  @"isExpensive",  v5);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPath isConstrained](self, "isConstrained"),  @"isConstrained",  v5);
  if (-[NWPath isUltraConstrained](self, "isUltraConstrained")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWPath isUltraConstrained](self, "isUltraConstrained"),  @"isUltraConstrained",  v5);
  }
  v10 = -[NWPath clientID](self, "clientID");
  [v7 appendPrettyObject:v10 withName:@"clientID" indent:v5 showFullContent:1];

  if (!v4)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath mtu](self, "mtu"), @"mtu", v5);
    return v7;
  }

  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 1LL))
  {
    v11 = @"wifi";
LABEL_13:
    [v7 appendPrettyObject:v11 withName:@"interfaceType" indent:v5 showFullContent:1];
    goto LABEL_14;
  }

  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 2LL))
  {
    v11 = @"cellular";
    goto LABEL_13;
  }

  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 3LL))
  {
    v11 = @"wired ethernet";
    goto LABEL_13;
  }

  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 4LL))
  {
    v11 = @"loopback";
    goto LABEL_13;
  }

- (id)description
{
  return -[NWPath descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0LL, 0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWPath descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (BOOL)isEqualToPath:(NWPath *)path
{
  BOOL v4 = path;
  -[NWPath internalPath](self, "internalPath");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NWPath internalPath](v4, "internalPath");
  LOBYTE(v4) = nw_path_is_equal_inner(v5, v6, 0);
  return (char)v4;
}

- (NWPathStatus)status
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  NWPathStatus status = (unint64_t)nw_path_get_status(v2);

  return status;
}

- (NSUUID)clientID
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uuid_clear(uu);
  v3 = -[NWPath internalPath](self, "internalPath");
  if (nw_path_get_client_id(v3, uu))
  {
    int is_null = uuid_is_null(uu);

    if (is_null) {
      return (NSUUID *)0LL;
    }
    else {
      return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
    }
  }

  else
  {

    return (NSUUID *)0LL;
  }

- (BOOL)isExpensive
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  BOOL is_expensive = nw_path_is_expensive(v2);

  return is_expensive;
}

- (BOOL)isConstrained
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  BOOL is_constrained = nw_path_is_constrained(v2);

  return is_constrained;
}

- (BOOL)isUltraConstrained
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_ultra_constrained = nw_path_is_ultra_constrained(v2);

  return is_ultra_constrained;
}

- (BOOL)isListener
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_listener = nw_path_is_listener(v2);

  return is_listener;
}

- (BOOL)isViable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL is_viable = nw_path_is_viable(v2);

  return is_viable;
}

- (BOOL)isPerAppVPN
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL is_per_app_vpn = nw_path_is_per_app_vpn(v2);

  return is_per_app_vpn;
}

- (BOOL)hasKernelExtensionFilter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_kernel_extension_filter = nw_path_has_kernel_extension_filter(v2);

  return has_kernel_extension_filter;
}

- (BOOL)hasCustomPFRules
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_custom_pf_rules = nw_path_has_custom_pf_rules(v2);

  return has_custom_pf_rules;
}

- (BOOL)hasApplicationLevelFirewall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_application_level_firewall = nw_path_has_application_level_firewall(v2);

  return has_application_level_firewall;
}

- (BOOL)hasParentalControls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char has_parental_controls = nw_path_has_parental_controls(v2);

  return has_parental_controls;
}

- (BOOL)shouldProbeConnectivity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char should_probe_connectivity = nw_path_should_probe_connectivity(v2);

  return should_probe_connectivity;
}

- (BOOL)isLinkQualityAbort
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = nw_path_link_quality_abort(v2);

  return v3;
}

- (BOOL)isListenerInterfaceSpecific
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_interface_specific = nw_path_listener_is_interface_specific(v2);

  return is_interface_specific;
}

- (BOOL)usesInterfaceType:(int64_t)a3
{
  nw_interface_type_t v3 = a3;
  -[NWPath internalPath](self, "internalPath");
  BOOL v4 = (nw_path *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = nw_path_uses_interface_type(v4, v3);

  return v3;
}

- (BOOL)usesNetworkAgentType:(Class)a3
{
  Class v3 = a3;
  uint64_t v11 = 0LL;
  os_log_type_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  if (a3)
  {
    if (-[NWPath status](self, "status"))
    {
      -[NWPath internalPath](self, "internalPath");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && (uint64_t v7 = (void *)v5[28]) != 0LL)
      {
        id v8 = v7;

        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = __31__NWPath_usesNetworkAgentType___block_invoke;
        v10[3] = &unk_189BBF2A0;
        v10[4] = &v11;
        v10[5] = v3;
        xpc_dictionary_apply(v8, v10);
      }

      else
      {

        id v8 = 0LL;
      }

      LOBYTE(v3) = *((_BYTE *)v12 + 24) != 0;
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  _Block_object_dispose(&v11, 8);
  return (char)v3;
}

- (BOOL)usesNetworkAgent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4 && -[NWPath status](self, "status"))
  {
    [v4 agentUUID];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 getUUIDBytes:uu];

    uint64_t v6 = -[NWPath internalPath](self, "internalPath");
    uint64_t v7 = (void *)v6;
    if (v6 && (id v8 = *(void **)(v6 + 224)) != 0LL)
    {
      id v9 = v8;

      uuid_unparse(uu, out);
      xpc_dictionary_get_value(v9, out);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v10;
      size_t length = 0LL;
      if (v10
        && (data = (unsigned int *)xpc_dictionary_get_data(v10, "data", &length)) != 0LL
        && length >= 0xD8
        && (uint64_t v13 = data, length == data[53] + 216LL))
      {
        [(id)objc_opt_class() agentDomain];
        char v14 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v15 = nw_nsstring((uint64_t)(v13 + 4));
        if ([v14 isEqualToString:v15])
        {
          [(id)objc_opt_class() agentType];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v17 = nw_nsstring((uint64_t)(v13 + 12));
          char v18 = [v16 isEqualToString:v17];
        }

        else
        {
          char v18 = 0;
        }
      }

      else
      {
        char v18 = 0;
      }

      uint64_t v7 = v9;
    }

    else
    {
      char v18 = 0;
    }
  }

  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)copyDataFromNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__47388;
  id v22 = __Block_byref_object_dispose__47389;
  id v23 = 0LL;
  uint64_t v8 = -[NWPath internalPath](self, "internalPath");
  id v9 = (void *)v8;
  if (v8 && (v10 = *(void **)(v8 + 224)) != 0LL)
  {
    id v11 = v10;

    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __50__NWPath_copyDataFromNetworkAgentWithDomain_type___block_invoke;
    applier[3] = &unk_189BC1468;
    id v15 = v6;
    id v16 = v7;
    BOOL v17 = &v18;
    xpc_dictionary_apply(v11, applier);

    id v9 = v15;
  }

  else
  {
    id v11 = 0LL;
  }

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)networkAgentsOfType:(Class)a3
{
  Class v3 = a3;
  if (a3)
  {
    if (-[NWPath status](self, "status") == NWPathStatusInvalid) {
      return 0LL;
    }
    [MEMORY[0x189603FA8] array];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[NWPath internalPath](self, "internalPath");
    id v7 = (void *)v6;
    if (v6 && (uint64_t v8 = *(void **)(v6 + 224)) != 0LL)
    {
      id v9 = v8;

      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __30__NWPath_networkAgentsOfType___block_invoke;
      v11[3] = &unk_189BBF2C8;
      Class v13 = v3;
      id v12 = v5;
      xpc_dictionary_apply(v9, v11);
      id v7 = v12;
    }

    else
    {
      id v9 = 0LL;
    }

    if ([v5 count]) {
      Class v3 = v5;
    }
    else {
      Class v3 = 0LL;
    }
  }

  return v3;
}

- (id)genericNetworkAgentsWithDomain:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NWPath status](self, "status"))
  {
    [MEMORY[0x189603FA8] array];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[NWPath internalPath](self, "internalPath");
    v10 = (void *)v9;
    if (v9 && (id v11 = *(void **)(v9 + 224)) != 0LL)
    {
      id v12 = v11;

      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 3221225472LL;
      applier[2] = __46__NWPath_genericNetworkAgentsWithDomain_type___block_invoke;
      applier[3] = &unk_189BBF2F0;
      id v16 = v6;
      id v17 = v7;
      id v18 = v8;
      xpc_dictionary_apply(v12, applier);

      v10 = v16;
    }

    else
    {
      id v12 = 0LL;
    }

    if ([v8 count]) {
      id v13 = v8;
    }
    else {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (id)inactiveNetworkAgentUUIDsOnlyVoluntary:(BOOL)a3
{
  if (-[NWPath status](self, "status") == NWPathStatusInvalid) {
    return 0LL;
  }
  [MEMORY[0x189603FE0] set];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[NWPath internalPath](self, "internalPath");
  id v7 = (void *)v6;
  if (v6 && (uint64_t v8 = *(void **)(v6 + 224)) != 0LL)
  {
    id v9 = v8;

    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __49__NWPath_inactiveNetworkAgentUUIDsOnlyVoluntary___block_invoke;
    v12[3] = &unk_189BBF318;
    BOOL v14 = a3;
    id v13 = v5;
    xpc_dictionary_apply(v9, v12);
    id v7 = v13;
  }

  else
  {
    id v9 = 0LL;
  }

  if ([v5 count]) {
    id v11 = v5;
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (NWInterface)scopedInterface
{
  v2 = (id)objc_claimAutoreleasedReturnValue();
  Class v3 = v2;
  if (!v2 || ((v4 = v2[66], v4 != 6) ? (BOOL v5 = v4 == 12) : (BOOL v5 = 1), !v5))
  {

    goto LABEL_10;
  }

  uint64_t v6 = v2[67];

  if (!(_DWORD)v6)
  {
LABEL_10:
    id v7 = 0LL;
    return v7;
  }

  id v7 = -[NWInterface initWithInterfaceIndex:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterfaceIndex:", v6);
  return v7;
}

- (NWInterface)interface
{
  uint64_t v3 = -[NWPath internalPath](self, "internalPath");
  if (v3 && (v4 = (void *)v3, id v5 = *(id *)(v3 + 96), v4, v5))
  {
    uint64_t v6 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v5);
  }

  else
  {
    -[NWPath internalPath](self, "internalPath");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int interface_index = nw_path_get_interface_index(v7);

    if (interface_index)
    {
      uint64_t v6 = -[NWInterface initWithInterfaceIndex:]( objc_alloc(&OBJC_CLASS___NWInterface),  "initWithInterfaceIndex:",  interface_index);
      id v5 = 0LL;
    }

    else
    {
      id v5 = 0LL;
      uint64_t v6 = 0LL;
    }
  }

  return v6;
}

- (id)delegateInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_copy_delegate_interface(v2);

  if (v3) {
    int v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);
  }
  else {
    int v4 = 0LL;
  }

  return v4;
}

- (NWInterface)fallbackInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fallback_unsigned int interface_index = nw_path_get_fallback_interface_index((uint64_t)v2);

  if (fallback_interface_index) {
    int v4 = -[NWInterface initWithInterfaceIndex:]( objc_alloc(&OBJC_CLASS___NWInterface),  "initWithInterfaceIndex:",  fallback_interface_index);
  }
  else {
    int v4 = 0LL;
  }
  return v4;
}

- (NSArray)flows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (unsigned __int8 *)nw_path_copy_flows(v2);

  if (!v3 || *((void *)v3 + 3) == *((void *)v3 + 2))
  {
    id v5 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __15__NWPath_flows__block_invoke;
    v7[3] = &unk_189BC85B0;
    id v5 = v4;
    id v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);
  }

  return (NSArray *)v5;
}

- (id)copyDNSServerEndpoints:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWPath internalPath](self, "internalPath");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v3) {
    uint64_t v6 = (unsigned __int8 *)nw_path_copy_override_resolver_configs(v4);
  }
  else {
    uint64_t v6 = (unsigned __int8 *)nw_path_copy_resolver_configs(v4);
  }
  id v7 = v6;

  if (!v7 || *((void *)v7 + 3) == *((void *)v7 + 2))
  {
    id v9 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __33__NWPath_copyDNSServerEndpoints___block_invoke;
    v11[3] = &unk_189BC85B0;
    id v9 = v8;
    id v12 = v9;
    nw_array_apply(v7, (uint64_t)v11);
  }

  return v9;
}

- (id)copyDNSServersStrings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "addressStringNoPort", (void)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v10];
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (NSArray)dnsServers
{
  return (NSArray *)-[NWPath copyDNSServerEndpoints:](self, "copyDNSServerEndpoints:", 0LL);
}

- (NSArray)dnsServersAsStrings
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[NWPath copyDNSServersStrings:](self, "copyDNSServersStrings:", v3);

  return (NSArray *)v4;
}

- (NSArray)overrideDNSServers
{
  return (NSArray *)-[NWPath copyDNSServerEndpoints:](self, "copyDNSServerEndpoints:", 1LL);
}

- (NSArray)overrideDNSServersAsStrings
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[NWPath copyDNSServersStrings:](self, "copyDNSServersStrings:", v3);

  return (NSArray *)v4;
}

- (id)copyDNSSearchDomains:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWPath internalPath](self, "internalPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v3) {
    uint64_t v6 = (unsigned __int8 *)nw_path_copy_override_resolver_configs(v4);
  }
  else {
    uint64_t v6 = (unsigned __int8 *)nw_path_copy_resolver_configs(v4);
  }
  uint64_t v7 = v6;

  if (!v7 || *((void *)v7 + 3) == *((void *)v7 + 2))
  {
    id v9 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __31__NWPath_copyDNSSearchDomains___block_invoke;
    v11[3] = &unk_189BC85B0;
    id v9 = v8;
    id v12 = v9;
    nw_array_apply(v7, (uint64_t)v11);
  }

  return v9;
}

- (NSArray)dnsSearchDomains
{
  return (NSArray *)-[NWPath copyDNSSearchDomains:](self, "copyDNSSearchDomains:", 0LL);
}

- (NSArray)overrideDNSSearchDomains
{
  return (NSArray *)-[NWPath copyDNSSearchDomains:](self, "copyDNSSearchDomains:", 1LL);
}

- (NSArray)gateways
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = (unsigned __int8 *)nw_path_copy_gateways(v2);

  if (!v3 || *((void *)v3 + 3) == *((void *)v3 + 2))
  {
    id v5 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __18__NWPath_gateways__block_invoke;
    v7[3] = &unk_189BC85B0;
    id v5 = v4;
    id v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);
  }

  return (NSArray *)v5;
}

- (NSArray)groupMembers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = (unsigned __int8 *)nw_path_copy_group_members(v2);

  if (!v3 || *((void *)v3 + 3) == *((void *)v3 + 2))
  {
    id v5 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __22__NWPath_groupMembers__block_invoke;
    v7[3] = &unk_189BC85B0;
    id v5 = v4;
    id v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);
  }

  return (NSArray *)v5;
}

- (int64_t)mtu
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t mtu = (int)nw_path_get_mtu(v2);

  return mtu;
}

- (int64_t)maximumDatagramSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t maximum_datagram_size = nw_path_get_maximum_datagram_size(v2);

  return maximum_datagram_size;
}

- (unint64_t)secondsSinceInterfaceChange
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t interface_time_delta = nw_path_get_interface_time_delta(v2);

  return interface_time_delta;
}

- (int64_t)reason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t reason = nw_path_get_reason(v2);

  return reason;
}

- (NSString)reasonDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t reason_description = nw_path_get_reason_description(v2);

  if (reason_description)
  {
    [NSString stringWithUTF8String:reason_description];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = &stru_189BCAF98;
  }

  return (NSString *)v4;
}

- (BOOL)isFlowDivert
{
  v2 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2;
  if (v2)
  {
    if (v2[88]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v2[66] == 4;
    }
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (unsigned)flowDivertControlUnit
{
  v2 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2;
  if (v2 && v2[66] == 4) {
    unsigned int v4 = v2[67];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)flowDivertAggregateUnit
{
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unsigned int v3 = v2[88];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (id)copyFlowDivertToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v3 = (void *)nw_path_copy_flow_divert_token(v2);

  return v3;
}

- (BOOL)unsatisfiedVoluntaryAgentMatchesAddress:(id)a3 triggerImmediately:(BOOL *)a4
{
  id v5 = a3;
  -[NWPath internalPath](self, "internalPath");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 address];

  char v8 = nw_path_voluntary_agent_matches_address(v6, v7);
  return v8;
}

- (BOOL)hasUnsatisfiedFallbackAgent
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  -[NWPath internalPath](self, "internalPath");
  v2 = (NWConcrete_nw_path *)objc_claimAutoreleasedReturnValue();
  int v5 = 0;
  BOOL vpn_config_uuid = nw_path_get_vpn_config_uuid(v2, (unsigned __int8 (*)[16])v6, &v5, 1, 1);

  return vpn_config_uuid;
}

- (int)dnsServiceID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int dns_service_id = nw_path_get_dns_service_id(v2, 1);

  return dns_service_id;
}

- (BOOL)isFiltered
{
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = v2[68] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (unsigned)filterControlUnit
{
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unsigned int v3 = v2[68];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (BOOL)isLocal
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_local = nw_path_is_local(v2);

  return is_local;
}

- (BOOL)isDirect
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_direct = nw_path_is_direct(v2);

  return is_direct;
}

- (unsigned)policyID
{
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unsigned int v3 = v2[85];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (BOOL)isRoaming
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL is_roaming = nw_path_is_roaming(v2);

  return is_roaming;
}

- (NWParameters)parameters
{
  unsigned int v3 = objc_alloc(&OBJC_CLASS___NWParameters);
  -[NWPath internalPath](self, "internalPath");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = nw_path_copy_parameters(v4);
  uint64_t v6 = -[NWParameters initWithParameters:](v3, "initWithParameters:", v5);

  return v6;
}

- (NWEndpoint)endpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_copy_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)effectiveLocalEndpoint
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_path_copy_effective_local_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)effectiveRemoteEndpoint
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_path_copy_effective_remote_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (NWInterface)connectedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_path_copy_connected_interface(v2);

  if (v3) {
    unsigned int v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);
  }
  else {
    unsigned int v4 = 0LL;
  }

  return v4;
}

- (BOOL)hasBrowseDescriptor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_browse_descriptor = nw_path_has_browse_descriptor(v2);

  return has_browse_descriptor;
}

- (NWBrowseDescriptor)browseDescriptor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_copy_browse_descriptor(v2);

  if (v3)
  {
    +[NWBrowseDescriptor descriptorWithInternalDescriptor:]( &OBJC_CLASS___NWBrowseDescriptor,  "descriptorWithInternalDescriptor:",  v3);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return (NWBrowseDescriptor *)v4;
}

- (BOOL)hasAdvertiseDescriptor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_advertise_descriptor = nw_path_has_advertise_descriptor(v2);

  return has_advertise_descriptor;
}

- (NWAdvertiseDescriptor)advertiseDescriptor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_copy_advertise_descriptor(v2);

  if (v3) {
    unsigned int v4 = -[NWAdvertiseDescriptor initWithDescriptor:]( objc_alloc(&OBJC_CLASS___NWAdvertiseDescriptor),  "initWithDescriptor:",  v3);
  }
  else {
    unsigned int v4 = 0LL;
  }

  return v4;
}

- (NWParameters)derivedParameters
{
  id v3 = objc_alloc(&OBJC_CLASS___NWParameters);
  -[NWPath internalPath](self, "internalPath");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = nw_path_copy_derived_parameters(v4);
  uint64_t v6 = -[NWParameters initWithParameters:](v3, "initWithParameters:", v5);

  return v6;
}

- (unsigned)fallbackInterfaceIndex
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fallback_unsigned int interface_index = nw_path_get_fallback_interface_index((uint64_t)v2);

  return fallback_interface_index;
}

- (BOOL)fallbackIsWeak
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_weak = nw_path_fallback_is_weak(v2);

  return is_weak;
}

- (BOOL)fallbackEligible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL should_fallback = nw_path_should_fallback(v2, 0);

  return should_fallback;
}

- (BOOL)fallbackIsPreferred
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_preferred = nw_path_fallback_is_preferred(v2);

  return is_preferred;
}

- (NSArray)proxySettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_path_copy_legacy_proxy_settings(v2);

  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1895F9220]) {
    unsigned int v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    unsigned int v4 = 0LL;
  }

  return (NSArray *)v4;
}

- (BOOL)hasProxySettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_proxy_settings = nw_path_has_proxy_settings(v2);

  return has_proxy_settings;
}

- (BOOL)supportsIPv4
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  has_ipunsigned int v4 = nw_path_has_ipv4(v2);

  return has_ipv4;
}

- (BOOL)supportsIPv6
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  has_ipuint64_t v6 = nw_path_has_ipv6(v2);

  return has_ipv6;
}

- (BOOL)supportsDNS
{
  v2 = (nw_path *)objc_claimAutoreleasedReturnValue();
  BOOL has_dns = nw_path_has_dns(v2);

  return has_dns;
}

- (BOOL)isEligibleForCrazyIvan46
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_eligible_for_CrazyIvan46 = nw_path_is_eligible_for_CrazyIvan46(v2);

  return is_eligible_for_CrazyIvan46;
}

- (id)createProtocolBufferObject
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NWPBPath);
  -[NWPath endpoint](self, "endpoint");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (void *)[v4 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_endpoint, v5);
  }

  -[NWPath parameters](self, "parameters");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v6 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_parameters, v7);
  }

  int v8 = -[NWPath status](self, "status");
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 1u;
    v3->_NWPathStatus status = v8;
  }

  -[NWPath clientID](self, "clientID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 UUIDString];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_clientUUID, v10);
  }

  -[NWPath interface](self, "interface");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = (void *)[v11 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_directInterface, v12);
  }

  -[NWPath delegateInterface](self, "delegateInterface");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = (void *)[v13 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_delegateInterface, v14);
  }

  BOOL v15 = -[NWPath isDirect](self, "isDirect");
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 2u;
    v3->_direct = v15;
    BOOL v16 = -[NWPath isLocal](self, "isLocal");
    *(_BYTE *)&v3->_has |= 0x10u;
    v3->_local = v16;
    BOOL v17 = -[NWPath supportsIPv4](self, "supportsIPv4");
    *(_BYTE *)&v3->_has |= 4u;
    v3->_ipunsigned int v4 = v17;
    BOOL v18 = -[NWPath supportsIPv6](self, "supportsIPv6");
    *(_BYTE *)&v3->_has |= 8u;
    v3->_ipuint64_t v6 = v18;
  }

  else
  {
    -[NWPath isLocal](self, "isLocal");
    -[NWPath supportsIPv4](self, "supportsIPv4");
    -[NWPath supportsIPv6](self, "supportsIPv6");
  }

  return v3;
}

- (OS_nw_path)internalPath
{
  return (OS_nw_path *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

uint64_t __22__NWPath_groupMembers__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1LL;
}

uint64_t __18__NWPath_gateways__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1LL;
}

uint64_t __31__NWPath_copyDNSSearchDomains___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31__NWPath_copyDNSSearchDomains___block_invoke_2;
  v5[3] = &unk_189BC5E38;
  id v6 = *(id *)(a1 + 32);
  nw_resolver_config_enumerate_search_domains(a3, v5);

  return 1LL;
}

uint64_t __31__NWPath_copyDNSSearchDomains___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", a2);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1LL;
}

uint64_t __33__NWPath_copyDNSServerEndpoints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __33__NWPath_copyDNSServerEndpoints___block_invoke_2;
  v5[3] = &unk_189BC5E38;
  id v6 = *(id *)(a1 + 32);
  nw_resolver_config_enumerate_name_servers(a3, v5);

  return 1LL;
}

uint64_t __33__NWPath_copyDNSServerEndpoints___block_invoke_2(uint64_t a1, char *hostname)
{
  nw_endpoint_t host = nw_endpoint_create_host(hostname, "0");
  +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", host);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return 1LL;
}

uint64_t __15__NWPath_flows__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = -[NWPathFlow initWithPathFlow:](objc_alloc(&OBJC_CLASS___NWPathFlow), "initWithPathFlow:", v4);

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return 1LL;
}

uint64_t __49__NWPath_inactiveNetworkAgentUUIDsOnlyVoluntary___block_invoke( uint64_t a1,  int a2,  xpc_object_t xdict)
{
  size_t length = 0LL;
  if (xdict)
  {
    data = xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8 && length == data[53] + 216LL)
      {
        int v5 = data[52];
        if ((v5 & 2) == 0 && ((v5 & 0x10) != 0 || !*(_BYTE *)(a1 + 40)))
        {
          id v6 = *(void **)(a1 + 32);
          uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:data];
          [v6 addObject:v7];
        }
      }
    }
  }

  return 1LL;
}

uint64_t __46__NWPath_genericNetworkAgentsWithDomain_type___block_invoke( uint64_t a1,  int a2,  xpc_object_t xdict)
{
  size_t length = 0LL;
  if (xdict)
  {
    data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8)
      {
        id v6 = data;
        if (length == data[53] + 216LL)
        {
          uint64_t v7 = *(void **)(a1 + 32);
          if (v7)
          {
            id v3 = (NWGenericNetworkAgent *)nw_nsstring((uint64_t)(data + 4));
            if (([v7 isEqualToString:v3] & 1) == 0)
            {
LABEL_16:

              return 1LL;
            }

            int v8 = *(void **)(a1 + 40);
            if (!v8)
            {

              goto LABEL_14;
            }
          }

          else
          {
            int v8 = *(void **)(a1 + 40);
            if (!v8) {
              goto LABEL_14;
            }
          }

          BOOL v9 = nw_nsstring((uint64_t)(v6 + 12));
          int v10 = [v8 isEqualToString:v9];

          if (v7)
          {

            if ((v10 & 1) == 0) {
              return 1LL;
            }
            goto LABEL_14;
          }

          if (v10)
          {
LABEL_14:
            id v3 = -[NWGenericNetworkAgent initWithKernelAgent:]( objc_alloc(&OBJC_CLASS___NWGenericNetworkAgent),  "initWithKernelAgent:",  v6);
            if (v3) {
              [*(id *)(a1 + 48) addObject:v3];
            }
            goto LABEL_16;
          }
        }
      }
    }
  }

  return 1LL;
}

uint64_t __30__NWPath_networkAgentsOfType___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0LL;
  if (xdict)
  {
    data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8)
      {
        int v5 = data;
        if (length == data[53] + 216LL)
        {
          [*(id *)(a1 + 40) agentDomain];
          id v6 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v7 = nw_nsstring((uint64_t)(v5 + 4));
          [*(id *)(a1 + 40) agentType];
          int v8 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v9 = nw_nsstring((uint64_t)(v5 + 12));
          int v10 = [v8 isEqualToString:v9];

          if (v10)
          {
            [MEMORY[0x189603F48] dataWithBytes:v5 + 54 length:v5[53]];
            id v6 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v7 = [*(id *)(a1 + 40) agentFromData:v6];
            if (v7)
            {
              [NSString stringWithUTF8String:v5 + 20];
              id v11 = (void *)objc_claimAutoreleasedReturnValue();
              [(id)v7 setAgentDescription:v11];

              id v12 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v5];
              [(id)v7 setAgentUUID:v12];

              unsigned int v13 = v5[52];
              if ((v13 & 2) != 0)
              {
                [(id)v7 setActive:1];
                unsigned int v13 = v5[52];
                if ((v13 & 4) == 0)
                {
LABEL_10:
                  if ((v13 & 8) == 0) {
                    goto LABEL_11;
                  }
                  goto LABEL_16;
                }
              }

              else if ((v13 & 4) == 0)
              {
                goto LABEL_10;
              }

              [(id)v7 setKernelActivated:1];
              unsigned int v13 = v5[52];
              if ((v13 & 8) == 0)
              {
LABEL_11:
                if ((v13 & 0x10) == 0) {
                  goto LABEL_12;
                }
                goto LABEL_17;
              }

uint64_t __50__NWPath_copyDataFromNetworkAgentWithDomain_type___block_invoke( void *a1,  int a2,  xpc_object_t xdict)
{
  size_t length = 0LL;
  if (!xdict) {
    return 1LL;
  }
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
  if (!data) {
    return 1LL;
  }
  if (length < 0xD8) {
    return 1LL;
  }
  int v5 = data;
  if (length != data[53] + 216LL) {
    return 1LL;
  }
  id v6 = (void *)a1[4];
  uint64_t v7 = (void *)nw_nsstring((uint64_t)(data + 4));
  int v8 = [v6 isEqualToString:v7];
  if (v8)
  {
    BOOL v9 = (void *)a1[5];
    BOOL v10 = nw_nsstring((uint64_t)(v5 + 12));
    LODWORD(v9) = [v9 isEqualToString:v10];

    if ((_DWORD)v9)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:v5 + 54 length:v5[53]];
      uint64_t v12 = *(void *)(a1[6] + 8LL);
      uint64_t v7 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
      goto LABEL_8;
    }

    return 1LL;
  }

BOOL __31__NWPath_usesNetworkAgentType___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0LL;
  if (!xdict) {
    return 1LL;
  }
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
  if (!data) {
    return 1LL;
  }
  if (length < 0xD8) {
    return 1LL;
  }
  int v5 = data;
  if (length != data[53] + 216LL) {
    return 1LL;
  }
  [*(id *)(a1 + 40) agentDomain];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = nw_nsstring((uint64_t)(v5 + 4));
  if ([v6 isEqualToString:v7])
  {
    [*(id *)(a1 + 40) agentType];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = nw_nsstring((uint64_t)(v5 + 12));
    int v10 = [v8 isEqualToString:v9];

    if (v10) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
  }

  else
  {
  }

  return !*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

void __48__NWPath_descriptionWithIndent_showFullContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = (objc_class *)MEMORY[0x189607AB8];
  id v6 = a2;
  id v8 = (id)[[v5 alloc] initWithUUIDBytes:a3];
  BOOL v7 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ : %@", v6, v8];

  [*(id *)(a1 + 32) appendPrettyObject:v7 withName:@"interfaceOption" indent:*(unsigned int *)(a1 + 40) showFullContent:*(unsigned __int8 *)(a1 + 44)];
}

+ (id)allClientIDs
{
  xpc_object_t v2 = nw_path_copy_all_client_ids();
  if (v2)
  {
    [MEMORY[0x189603FA8] array];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    size_t count = xpc_array_get_count(v2);
    if (count)
    {
      size_t v5 = count;
      for (size_t i = 0LL; i != v5; ++i)
      {
        BOOL v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607AB8]), "initWithUUIDBytes:", xpc_array_get_uuid(v2, i));
        if (v7) {
          [v3 addObject:v7];
        }
      }
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

+ (id)pathForClientID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uuid_clear(uu);
  [v3 getUUIDBytes:uu];

  if (nw_context_copy_implicit_context::onceToken != -1) {
    dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
  }
  id v4 = (id)nw_context_copy_implicit_context::implicit_context;
  BOOL v5 = nw_path_copy_path_for_client_with_context((uint64_t)uu);

  if (v5) {
    id v6 = -[NWPath initWithPath:](objc_alloc(&OBJC_CLASS___NWPath), "initWithPath:", v5);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)pathForClientID:(id)a3 parametersTLV:(id)a4 pathResultTLV:(id)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uuid_clear(uu);
  [v9 getUUIDBytes:uu];

  if (nw_context_copy_implicit_context::onceToken != -1) {
    dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
  }
  id v10 = (id)nw_context_copy_implicit_context::implicit_context;
  uint64_t v11 = nw_path_copy_path_for_tlv( uu,  v10,  [v8 bytes],  objc_msgSend(v8, "length"),  objc_msgSend(v7, "bytes"),  objc_msgSend(v7, "length"));

  if (v11) {
    uint64_t v12 = -[NWPath initWithPath:](objc_alloc(&OBJC_CLASS___NWPath), "initWithPath:", v11);
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (id)createStringFromStatus:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NWPath)pathWithProtocolBufferData:(id)a3
{
  uint64_t v170 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___NWPBPath), "initWithData:", v3);
  BOOL v5 = v4;
  if (!v4)
  {
    uint64_t v11 = v3;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v165 = "+[NWPath pathWithProtocolBufferData:]";
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();

    uu[0] = 16;
    char v161 = 0;
    if (__nwlog_fault(v13, uu, &v161))
    {
      if (uu[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        __int128 v14 = (os_log_s *)(id)gLogObj;
        unsigned __int8 v15 = uu[0];
        if (!os_log_type_enabled(v14, (os_log_type_t)uu[0])) {
          goto LABEL_168;
        }
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        BOOL v16 = "%{public}s [NWPBPath initWithData:] failed";
LABEL_166:
        v136 = v14;
        os_log_type_t v137 = v15;
        goto LABEL_167;
      }

      if (!v161)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        __int128 v14 = (os_log_s *)(id)gLogObj;
        unsigned __int8 v15 = uu[0];
        if (!os_log_type_enabled(v14, (os_log_type_t)uu[0])) {
          goto LABEL_168;
        }
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        BOOL v16 = "%{public}s [NWPBPath initWithData:] failed, backtrace limit exceeded";
        goto LABEL_166;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      __int128 v14 = (os_log_s *)(id)gLogObj;
      os_log_type_t v134 = uu[0];
      BOOL v135 = os_log_type_enabled(v14, (os_log_type_t)uu[0]);
      if (!backtrace_string)
      {
        if (!v135)
        {
LABEL_168:

          if (!v13) {
            goto LABEL_162;
          }
          goto LABEL_161;
        }

        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        BOOL v16 = "%{public}s [NWPBPath initWithData:] failed, no backtrace";
        v136 = v14;
        os_log_type_t v137 = v134;
LABEL_167:
        _os_log_impl(&dword_181A5C000, v136, v137, v16, buf, 0xCu);
        goto LABEL_168;
      }

      if (v135)
      {
        *(_DWORD *)buf = 136446466;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        __int16 v166 = 2082;
        uint64_t v167 = (uint64_t)backtrace_string;
        _os_log_impl( &dword_181A5C000,  v14,  v134,  "%{public}s [NWPBPath initWithData:] failed, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v13)
    {
LABEL_162:
      v132 = 0LL;
LABEL_163:

      return v132;
    }

@end