@interface NWParameters
+ (BOOL)supportsSecureCoding;
+ (NWParameters)parametersWithCParameters:(id)a3;
+ (NWParameters)parametersWithProtocolBufferData:(id)a3;
- (BOOL)allowDuplicateStateUpdates;
- (BOOL)allowJoiningConnectedFd;
- (BOOL)allowSocketAccess;
- (BOOL)allowUnusableAddresses;
- (BOOL)attachProtocolListener;
- (BOOL)copyEffectiveAuditToken:(id *)a3;
- (BOOL)disableNagleAlgorithm;
- (BOOL)enableTFO;
- (BOOL)enableTFONoCookie;
- (BOOL)enableTLS;
- (BOOL)fastOpenForceEnable;
- (BOOL)hasDelegatedPIDForOriginatingPID:(int)a3;
- (BOOL)hasDelegatedProcessUUID;
- (BOOL)hasNonEmptyProxyConfiguration;
- (BOOL)hasPreferredNetworkAgents;
- (BOOL)hasProhibitedNetworkAgents;
- (BOOL)hasRequiredNetworkAgents;
- (BOOL)httpsProxyIsOpaque;
- (BOOL)httpsProxyOverTLS;
- (BOOL)ignoreResolverStats;
- (BOOL)indefinite;
- (BOOL)isDiscretionary;
- (BOOL)isDryRun;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)keepAlive;
- (BOOL)keepAliveOffload;
- (BOOL)multipath;
- (BOOL)multipathForceEnable;
- (BOOL)noProxy;
- (BOOL)preferNoProxy;
- (BOOL)prohibitCellular;
- (BOOL)prohibitConstrainedPaths;
- (BOOL)prohibitExpensivePaths;
- (BOOL)prohibitFallback;
- (BOOL)prohibitJoiningProtocols;
- (BOOL)prohibitRoaming;
- (BOOL)reduceBuffering;
- (BOOL)resolvePTR;
- (BOOL)reuseLocalAddress;
- (BOOL)trustInvalidCertificates;
- (BOOL)useAWDL;
- (BOOL)useLongOutstandingQueries;
- (BOOL)useP2P;
- (NSArray)parentIDs;
- (NSArray)protocolTransforms;
- (NSData)TLSSessionID;
- (NSData)metadata;
- (NSDictionary)proxyConfiguration;
- (NSSet)SSLCipherSuitesInternal;
- (NSString)account;
- (NSString)effectiveBundleID;
- (NSString)privateDescription;
- (NSURL)sanitizedURL;
- (NSURL)url;
- (NSUUID)effectiveProcessUUID;
- (NSUUID)parentID;
- (NSUUID)processUUID;
- (NWAddressEndpoint)localAddress;
- (NWInterface)requiredInterface;
- (NWParameters)init;
- (NWParameters)initWithCoder:(id)a3;
- (NWParameters)initWithParameters:(id)a3;
- (OS_nw_parameters)internalParameters;
- (id)copyCParameters;
- (id)copyRequiredAgentsDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int)multipathService;
- (int)pid;
- (int64_t)requiredCompanionProxyInterfaceType;
- (int64_t)requiredInterfaceSubtype;
- (int64_t)requiredInterfaceType;
- (unint64_t)dataMode;
- (unint64_t)hash;
- (unint64_t)keepAliveIdleTime;
- (unint64_t)keepAliveInterval;
- (unint64_t)maximumSSLProtocolVersionInternal;
- (unint64_t)minimumSSLProtocolVersionInternal;
- (unint64_t)trafficClass;
- (unsigned)ipProtocol;
- (unsigned)requiredAddressFamily;
- (unsigned)tlsVersionWithSSLProtocol:(int)a3;
- (unsigned)transportProtocol;
- (unsigned)uid;
- (void)avoidNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (void)avoidNetworkAgentWithUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)preferNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (void)preferNetworkAgentWithUUID:(id)a3;
- (void)prohibitInterface:(id)a3;
- (void)prohibitInterfaceSubtype:(int64_t)a3;
- (void)prohibitInterfaceType:(int64_t)a3;
- (void)prohibitNetworkAgentWithUUID:(id)a3;
- (void)prohibitNetworkAgentsWithDomain:(id)a3 type:(id)a4;
- (void)requireNetworkAgentWithDomain:(id)a3 type:(id)a4;
- (void)requireNetworkAgentWithUUID:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAllowDuplicateStateUpdates:(BOOL)a3;
- (void)setAllowJoiningConnectedFd:(BOOL)a3;
- (void)setAllowSocketAccess:(BOOL)a3;
- (void)setAllowUnusableAddresses:(BOOL)a3;
- (void)setAttachProtocolListener:(BOOL)a3;
- (void)setDataMode:(unint64_t)a3;
- (void)setDisableNagleAlgorithm:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setEffectiveBundleID:(id)a3;
- (void)setEffectiveProcessUUID:(id)a3;
- (void)setEnableTFO:(BOOL)a3;
- (void)setEnableTFONoCookie:(BOOL)a3;
- (void)setEnableTLS:(BOOL)a3;
- (void)setFastOpenForceEnable:(BOOL)a3;
- (void)setHttpsProxyIsOpaque:(BOOL)a3;
- (void)setHttpsProxyOverTLS:(BOOL)a3;
- (void)setIgnoreResolverStats:(BOOL)a3;
- (void)setIndefinite:(BOOL)a3;
- (void)setInitialDataPayload:(id)a3;
- (void)setInternalParameters:(id)a3;
- (void)setKeepAlive:(BOOL)a3;
- (void)setKeepAliveIdleTime:(unint64_t)a3;
- (void)setKeepAliveInterval:(unint64_t)a3;
- (void)setKeepAliveOffload:(BOOL)a3;
- (void)setLocalAddress:(id)a3;
- (void)setMaximumSSLProtocolVersion:(unint64_t)a3;
- (void)setMaximumSSLProtocolVersionInternal:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setMinimumSSLProtocolVersion:(unint64_t)a3;
- (void)setMinimumSSLProtocolVersionInternal:(unint64_t)a3;
- (void)setMultipath:(BOOL)a3;
- (void)setMultipathForceEnable:(BOOL)a3;
- (void)setMultipathService:(int)a3;
- (void)setNoProxy:(BOOL)a3;
- (void)setParentID:(id)a3;
- (void)setPid:(int)a3;
- (void)setPreferNoProxy:(BOOL)a3;
- (void)setProcessUUID:(id)a3;
- (void)setProhibitConstrainedPaths:(BOOL)a3;
- (void)setProhibitExpensivePaths:(BOOL)a3;
- (void)setProhibitFallback:(BOOL)a3;
- (void)setProhibitJoiningProtocols:(BOOL)a3;
- (void)setProhibitRoaming:(BOOL)a3;
- (void)setProtocolAtLevel:(unint64_t)a3 protocol:(nw_protocol_identifier *)a4;
- (void)setProtocolTransforms:(id)a3;
- (void)setProxyConfiguration:(id)a3;
- (void)setReduceBuffering:(BOOL)a3;
- (void)setRequiredAddressFamily:(unsigned __int8)a3;
- (void)setRequiredCompanionProxyInterfaceType:(int64_t)a3;
- (void)setRequiredInterface:(id)a3;
- (void)setRequiredInterfaceSubtype:(int64_t)a3;
- (void)setRequiredInterfaceType:(int64_t)a3;
- (void)setResolvePTR:(BOOL)a3;
- (void)setReuseLocalAddress:(BOOL)a3;
- (void)setSSLCipherSuites:(id)a3;
- (void)setSSLCipherSuitesInternal:(id)a3;
- (void)setSourceApplicationWithBundleID:(id)a3;
- (void)setSourceApplicationWithToken:(id *)a3;
- (void)setTLSSessionID:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)setTrustInvalidCertificates:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUrl:(id)a3;
- (void)setUseAWDL:(BOOL)a3;
- (void)setUseLongOutstandingQueries:(BOOL)a3;
- (void)setUseP2P:(BOOL)a3;
@end

@implementation NWParameters

- (NWParameters)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___NWParameters;
  v5 = -[NWParameters init](&v53, sel_init);
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
        BOOL v17 = nw_parameters_create_from_dictionary(XPCDictionaryFromNSDictionary);
        -[NWParameters setInternalParameters:](v5, "setInternalParameters:", v17);
        v18 = -[NWParameters internalParameters](v5, "internalParameters");
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
        v55 = "-[NWParameters initWithCoder:]";
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
  v5 = -[NWParameters internalParameters](self, "internalParameters");
  xpc_object_t v6 = nw_parameters_copy_dictionary(v5);

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
    *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    BOOL v17 = (void *)_os_log_send_and_compose_impl();

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
        *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
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
            *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
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
        *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
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
        *(void *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        id v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded";
        goto LABEL_34;
      }
    }

- (NWParameters)init
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NWParameters;
  v2 = -[NWParameters init](&v26, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    os_log_type_t v28 = "-[NWParameters init]";
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      os_log_type_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v28 = "-[NWParameters init]";
        v21 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_181A5C000, v19, v20, v21, buf, 0xCu);
      }
    }

    else
    {
      if (v24)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        os_log_type_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v20 = type;
        BOOL v23 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v28 = "-[NWParameters init]";
            __int16 v29 = 2082;
            os_log_type_t v30 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v19,  v20,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          os_log_type_t v14 = (char *)backtrace_string;
LABEL_13:
          free(v14);
          goto LABEL_14;
        }

        if (!v23) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v28 = "-[NWParameters init]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }

      __nwlog_obj();
      os_log_type_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v28 = "-[NWParameters init]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }

- (NWParameters)initWithParameters:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NWParameters;
    id v6 = -[NWParameters init](&v23, sel_init);
    if (v6)
    {
      uint64_t v7 = v6;
      objc_storeStrong((id *)&v6->_internalParameters, a3);
      goto LABEL_4;
    }

    __nwlog_obj();
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWParameters initWithParameters:]";
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
        v27 = "-[NWParameters initWithParameters:]";
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
          v27 = "-[NWParameters initWithParameters:]";
          __int16 v28 = 2082;
          __int16 v29 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }

      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
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
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    uint64_t v7 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWParameters initWithParameters:]";
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
        v27 = "-[NWParameters initWithParameters:]";
        BOOL v13 = "%{public}s called with null parameters";
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
            v27 = "-[NWParameters initWithParameters:]";
            __int16 v28 = 2082;
            __int16 v29 = v19;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null parameters, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v19);
          goto LABEL_31;
        }

        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        BOOL v13 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        BOOL v13 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (id)copyCParameters
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]( (id *)objc_alloc(&OBJC_CLASS___NWConcrete_nw_parameters),  v2,  0,  0);

  return (id)v3;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  -[NWParameters processUUID](self, "processUUID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"processUUID" indent:v5 showFullContent:v4];

  -[NWParameters effectiveProcessUUID](self, "effectiveProcessUUID");
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"effectiveProcessUUID" indent:v5 showFullContent:v4];

  -[NWParameters effectiveBundleID](self, "effectiveBundleID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"effectiveBundleID" indent:v5 showFullContent:v4];

  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters pid](self, "pid"), @"pid", v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters uid](self, "uid"), @"uid", v5);
  -[NWParameters account](self, "account");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"account" indent:v5 showFullContent:v4];

  -[NWParameters url](self, "url");
  os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"url" indent:v5 showFullContent:v4];

  -[NWParameters sanitizedURL](self, "sanitizedURL");
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v13 withName:@"sanitizedURL" indent:v5 showFullContent:v4];

  if (-[NWParameters dataMode](self, "dataMode") == 1)
  {
    os_log_type_t v14 = @"Datagram";
  }

  else
  {
    if (-[NWParameters dataMode](self, "dataMode") != 2) {
      goto LABEL_6;
    }
    os_log_type_t v14 = @"Stream";
  }

  [v7 appendPrettyObject:v14 withName:@"dataMode" indent:v5 showFullContent:v4];
LABEL_6:
  v15 = -[NWParameters internalParameters](self, "internalParameters");
  int is_known_tracker = nw_parameters_get_is_known_tracker(v15);

  if (is_known_tracker) {
    [v7 appendPrettyBOOL:1 withName:@"knownTracker" indent:v5];
  }
  -[NWParameters internalParameters](self, "internalParameters");
  os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  int is_third_party_web_content = nw_parameters_is_third_party_web_content(v17);

  if (is_third_party_web_content) {
    [v7 appendPrettyBOOL:1 withName:@"thirdPartyWebContent" indent:v5];
  }
  -[NWParameters internalParameters](self, "internalParameters");
  os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  int is_approved_app_domain = nw_parameters_is_approved_app_domain(v19);

  if (is_approved_app_domain) {
    [v7 appendPrettyBOOL:1 withName:@"approvedAppDomain" indent:v5];
  }
  v21 = -[NWParameters protocolTransforms](self, "protocolTransforms");
  [v7 appendPrettyObject:v21 withName:@"protocolTransforms" indent:v5 showFullContent:v4];

  if (-[NWParameters isDryRun](self, "isDryRun")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters isDryRun](self, "isDryRun"),  @"isDryRun",  v5);
  }
  if (-[NWParameters trafficClass](self, "trafficClass")) {
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWParameters trafficClass](self, "trafficClass"),  @"trafficClass",  v5);
  }
  if (-[NWParameters ipProtocol](self, "ipProtocol")) {
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWParameters ipProtocol](self, "ipProtocol"),  @"ipProtocol",  v5);
  }
  if (-[NWParameters transportProtocol](self, "transportProtocol")) {
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWParameters transportProtocol](self, "transportProtocol"),  @"transportProtocol",  v5);
  }
  if (-[NWParameters requiredAddressFamily](self, "requiredAddressFamily")) {
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWParameters requiredAddressFamily](self, "requiredAddressFamily"),  @"requiredAddressFamily",  v5);
  }
  -[NWParameters internalParameters](self, "internalParameters");
  BOOL v22 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v23 = nw_parameters_copy_local_endpoint(v22);

  if (v23)
  {
    -[NWParameters localAddress](self, "localAddress");
    char v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v24 withName:@"localAddress" indent:v5 showFullContent:v4];
  }

  if (-[NWParameters reuseLocalAddress](self, "reuseLocalAddress")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters reuseLocalAddress](self, "reuseLocalAddress"),  @"reuseLocalAddress",  v5);
  }
  -[NWParameters requiredInterface](self, "requiredInterface");
  os_log_type_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v25 withName:@"requiredInterface" indent:v5 showFullContent:v4];

  if (-[NWParameters requiredInterfaceType](self, "requiredInterfaceType"))
  {
    +[NWInterface descriptionForType:]( &OBJC_CLASS___NWInterface,  "descriptionForType:",  -[NWParameters requiredInterfaceType](self, "requiredInterfaceType"));
    objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v26 withName:@"requiredInterfaceType" indent:v5 showFullContent:1];
  }

  if (-[NWParameters requiredCompanionProxyInterfaceType](self, "requiredCompanionProxyInterfaceType"))
  {
    v27 = +[NWInterface descriptionForType:]( &OBJC_CLASS___NWInterface,  "descriptionForType:",  -[NWParameters requiredCompanionProxyInterfaceType](self, "requiredCompanionProxyInterfaceType"));
    [v7 appendPrettyObject:v27 withName:@"requiredCompanionInterfaceType" indent:v5 showFullContent:1];
  }

  -[NWParameters internalParameters](self, "internalParameters");
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_prohibited_interface_types = nw_parameters_has_prohibited_interface_types(v28);

  if (has_prohibited_interface_types)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = nw_parameters_copy_prohibited_interface_types(v30);

    if (v31)
    {
      BOOL v32 = (void *)MEMORY[0x186E12534](v31);
      [NSString stringWithUTF8String:v32];
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v33 withName:@"prohibitedInterfaceTypes" indent:v5 showFullContent:1];

      if (v32) {
        free(v32);
      }
    }
  }
  v34 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_prohibited_interface_subtypes = nw_parameters_has_prohibited_interface_subtypes(v34);

  if (has_prohibited_interface_subtypes)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    id v37 = nw_parameters_copy_prohibited_interface_subtypes(v36);

    if (v37)
    {
      BOOL v38 = (void *)MEMORY[0x186E12534](v37);
      [NSString stringWithUTF8String:v38];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v39 withName:@"prohibitedInterfaceSubtypes" indent:v5 showFullContent:1];

      if (v38) {
        free(v38);
      }
    }
  }
  v40 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_preferred_interface_subtypes = nw_parameters_has_preferred_interface_subtypes(v40);

  if (has_preferred_interface_subtypes)
  {
    v42 = -[NWParameters internalParameters](self, "internalParameters");
    id v43 = nw_parameters_copy_preferred_interface_subtypes(v42);

    if (v43)
    {
      v44 = (void *)MEMORY[0x186E12534](v43);
      [NSString stringWithUTF8String:v44];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v45 withName:@"preferredInterfaceSubtypes" indent:v5 showFullContent:1];

      if (v44) {
        free(v44);
      }
    }
  }
  v46 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_preferred_netagents = nw_parameters_has_preferred_netagents(v46);

  if (has_preferred_netagents)
  {
    v48 = -[NWParameters internalParameters](self, "internalParameters");
    xpc_object_t v49 = nw_parameters_copy_preferred_netagent_domains(v48);

    if (v49)
    {
      BOOL v50 = (void *)MEMORY[0x186E12534](v49);
      [NSString stringWithUTF8String:v50];
      char v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v51 withName:@"preferredNetworkAgentDomains" indent:v5 showFullContent:1];

      if (v50) {
        free(v50);
      }
    }
    v52 = -[NWParameters internalParameters](self, "internalParameters");
    xpc_object_t v53 = nw_parameters_copy_preferred_netagent_types(v52);

    if (v53)
    {
      v54 = (void *)MEMORY[0x186E12534](v53);
      [NSString stringWithUTF8String:v54];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v55 withName:@"preferredNetworkAgentTypes" indent:v5 showFullContent:1];

      if (v54) {
        free(v54);
      }
    }

    -[NWParameters internalParameters](self, "internalParameters");
    __int16 v56 = (void *)objc_claimAutoreleasedReturnValue();
    id v57 = nw_parameters_copy_preferred_netagent_uuids(v56);

    if (v57)
    {
      uint64_t v58 = (void *)MEMORY[0x186E12534](v57);
      [NSString stringWithUTF8String:v58];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v59 withName:@"preferredNetworkAgentUUIDs" indent:v5 showFullContent:1];

      if (v58) {
        free(v58);
      }
    }
  }
  v60 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_required_netagents = nw_parameters_has_required_netagents(v60);

  if (has_required_netagents)
  {
    v62 = -[NWParameters internalParameters](self, "internalParameters");
    id v63 = nw_parameters_copy_required_netagent_domains(v62);

    if (v63)
    {
      v64 = (void *)MEMORY[0x186E12534](v63);
      [NSString stringWithUTF8String:v64];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v65 withName:@"requiredNetworkAgentDomains" indent:v5 showFullContent:1];

      if (v64) {
        free(v64);
      }
    }
    v66 = -[NWParameters internalParameters](self, "internalParameters");
    id v67 = nw_parameters_copy_required_netagent_types(v66);

    if (v67)
    {
      v68 = (void *)MEMORY[0x186E12534](v67);
      [NSString stringWithUTF8String:v68];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v69 withName:@"requiredNetworkAgentTypes" indent:v5 showFullContent:1];

      if (v68) {
        free(v68);
      }
    }
    v70 = -[NWParameters internalParameters](self, "internalParameters");
    id v71 = nw_parameters_copy_required_netagent_uuids(v70);

    if (v71)
    {
      v72 = (void *)MEMORY[0x186E12534](v71);
      [NSString stringWithUTF8String:v72];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v73 withName:@"requiredNetworkAgentUUIDs" indent:v5 showFullContent:1];

      if (v72) {
        free(v72);
      }
    }
  }
  v74 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v74);

  if (has_prohibited_netagents)
  {
    v76 = -[NWParameters internalParameters](self, "internalParameters");
    id v77 = nw_parameters_copy_prohibited_netagent_domains(v76);

    if (v77)
    {
      v78 = (void *)MEMORY[0x186E12534](v77);
      [NSString stringWithUTF8String:v78];
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v79 withName:@"prohibitedNetworkAgentDomains" indent:v5 showFullContent:1];

      if (v78) {
        free(v78);
      }
    }
    v80 = -[NWParameters internalParameters](self, "internalParameters");
    id v81 = nw_parameters_copy_prohibited_netagent_types(v80);

    if (v81)
    {
      v82 = (void *)MEMORY[0x186E12534](v81);
      [NSString stringWithUTF8String:v82];
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v83 withName:@"prohibitedNetworkAgentTypes" indent:v5 showFullContent:1];

      if (v82) {
        free(v82);
      }
    }
    v84 = -[NWParameters internalParameters](self, "internalParameters");
    id v85 = nw_parameters_copy_prohibited_netagent_uuids(v84);

    if (v85)
    {
      v86 = (void *)MEMORY[0x186E12534](v85);
      [NSString stringWithUTF8String:v86];
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendPrettyObject:v87 withName:@"prohibitedNetworkAgentUUIDs" indent:v5 showFullContent:1];

      if (v86) {
        free(v86);
      }
    }
  }

  if (-[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths"),  @"prohibitExpensivePaths",  v5);
  }
  if (-[NWParameters prohibitConstrainedPaths](self, "prohibitConstrainedPaths")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters prohibitConstrainedPaths](self, "prohibitConstrainedPaths"),  @"prohibitConstrainedPaths",  v5);
  }
  if (-[NWParameters prohibitRoaming](self, "prohibitRoaming")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters prohibitRoaming](self, "prohibitRoaming"),  @"prohibitRoaming",  v5);
  }
  if (-[NWParameters enableTFO](self, "enableTFO")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters enableTFO](self, "enableTFO"),  @"enableTFO",  v5);
  }
  if (-[NWParameters disableNagleAlgorithm](self, "disableNagleAlgorithm")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters disableNagleAlgorithm](self, "disableNagleAlgorithm"),  @"disableNagleAlgorithm",  v5);
  }
  if (-[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries"),  @"useLongOutstandingQueries",  v5);
  }
  if (-[NWParameters resolvePTR](self, "resolvePTR")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters resolvePTR](self, "resolvePTR"),  @"resolvePTR",  v5);
  }
  if (-[NWParameters useAWDL](self, "useAWDL")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters useAWDL](self, "useAWDL"),  @"useAWDL",  v5);
  }
  if (-[NWParameters useP2P](self, "useP2P")) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useP2P](self, "useP2P"), @"useP2P", v5);
  }
  if (-[NWParameters multipathService](self, "multipathService")) {
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWParameters multipathService](self, "multipathService"),  @"multipathService",  v5);
  }
  if (-[NWParameters enableTLS](self, "enableTLS")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters enableTLS](self, "enableTLS"),  @"enableTLS",  v5);
  }
  v88 = -[NWParameters TLSSessionID](self, "TLSSessionID");
  [v7 appendPrettyObject:v88 withName:@"TLSSessionID" indent:v5 showFullContent:v4];
  v89 = -[NWParameters internalParameters](self, "internalParameters");
  LODWORD(v88) = nw_parameters_has_initial_data_payload(v89);

  if ((_DWORD)v88)
  {
    v90 = -[NWParameters internalParameters](self, "internalParameters");
    v91 = (dispatch_data_s *)nw_parameters_copy_initial_data_payload(v90);

    objc_msgSend(NSString, "stringWithFormat:", @"[%zu bytes]", dispatch_data_get_size(v91));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v92 withName:@"initialDataPayload" indent:v5 showFullContent:1];
  }

  if (-[NWParameters trustInvalidCertificates](self, "trustInvalidCertificates")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWParameters trustInvalidCertificates](self, "trustInvalidCertificates"),  @"trustInvalidCertificates",  v5);
  }
  v93 = -[NWParameters internalParameters](self, "internalParameters");
  uint64_t fallback_mode = nw_parameters_get_fallback_mode(v93);

  if ((_DWORD)fallback_mode) {
    [v7 appendPrettyInt:fallback_mode withName:@"fallbackMode" indent:v5];
  }
  v95 = -[NWParameters internalParameters](self, "internalParameters");
  int include_ble = nw_parameters_get_include_ble(v95);

  if (include_ble) {
    [v7 appendPrettyBOOL:1 withName:@"includeBle" indent:v5];
  }
  v97 = -[NWParameters internalParameters](self, "internalParameters");
  int include_screen_off_devices = nw_parameters_get_include_screen_off_devices(v97);

  if (include_screen_off_devices) {
    [v7 appendPrettyBOOL:1 withName:@"includeScreenOff" indent:v5];
  }
  [NSString stringWithString:v7];
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  return v99;
}

- (id)description
{
  return  -[NWParameters descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWParameters descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[NWParameters allocWithZone:](&OBJC_CLASS___NWParameters, "allocWithZone:", a3);
  -[NWParameters internalParameters](self, "internalParameters");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]( (id *)objc_alloc(&OBJC_CLASS___NWConcrete_nw_parameters),  v5,  0,  0);

  id v7 = -[NWParameters initWithParameters:](v4, "initWithParameters:", v6);
  return v7;
}

- (BOOL)trustInvalidCertificates
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char should_trust_invalid_certificates = nw_parameters_get_should_trust_invalid_certificates(v2);

  return should_trust_invalid_certificates;
}

- (void)setTrustInvalidCertificates:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_should_trust_invalid_certificates(v4, v3);
}

- (void)setAllowSocketAccess:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_socket_access(v4, v3);
}

- (BOOL)allowSocketAccess
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char allow_socket_access = nw_parameters_get_allow_socket_access(v2);

  return allow_socket_access;
}

- (NSString)account
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t account_id = nw_parameters_get_account_id(v2);

  if (account_id)
  {
    [NSString stringWithUTF8String:account_id];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_account_id(v4, (const char *)[v5 UTF8String]);
}

- (unint64_t)dataMode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t data_mode = nw_parameters_get_data_mode(v2);

  return data_mode;
}

- (void)setDataMode:(unint64_t)a3
{
  unsigned int v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_data_mode(v4, v3);
}

- (unint64_t)trafficClass
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t traffic_class = nw_parameters_get_traffic_class(v2);

  return traffic_class;
}

- (void)setTrafficClass:(unint64_t)a3
{
  int v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_traffic_class(v4, v3);
}

- (unsigned)ipProtocol
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 ip_protocol = nw_parameters_get_ip_protocol(v2);

  return ip_protocol;
}

- (unsigned)transportProtocol
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 upper_transport_protocol = nw_parameters_get_upper_transport_protocol(v2);

  return upper_transport_protocol;
}

- (int)pid
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  int pid = nw_parameters_get_pid(v2);

  return pid;
}

- (void)setPid:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_pid(v4, a3);
}

- (BOOL)hasDelegatedPIDForOriginatingPID:(int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = nw_parameters_has_delegated_proc_pid(v4, a3);

  return a3;
}

- (unsigned)uid
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int uid = nw_parameters_get_uid(v2);

  return uid;
}

- (void)setUid:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_uid(v4, a3);
}

- (NSUUID)processUUID
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uuid_clear(uu);
  -[NWParameters internalParameters](self, "internalParameters");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_get_proc_uuid(v3, uu);

  if (uuid_is_null(uu)) {
    return (NSUUID *)0LL;
  }
  else {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
  }
}

- (void)setProcessUUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uuid_clear(uu);
  [v4 getUUIDBytes:uu];

  -[NWParameters internalParameters](self, "internalParameters");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_proc_uuid(v5, uu);
}

- (BOOL)hasDelegatedProcessUUID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_delegated_proc_uunsigned int uid = nw_parameters_has_delegated_proc_uuid(v2);

  return has_delegated_proc_uuid;
}

- (NSUUID)effectiveProcessUUID
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uuid_clear(uu);
  -[NWParameters internalParameters](self, "internalParameters");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_get_e_proc_uuid(v3, uu);

  if (uuid_is_null(uu)) {
    return (NSUUID *)0LL;
  }
  else {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
  }
}

- (void)setEffectiveProcessUUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uuid_clear(uu);
  [v4 getUUIDBytes:uu];

  -[NWParameters internalParameters](self, "internalParameters");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_e_proc_uuid(v5, uu);
}

- (NSString)effectiveBundleID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t effective_bundle_id = nw_parameters_get_effective_bundle_id(v2);

  if (effective_bundle_id)
  {
    [NSString stringWithUTF8String:effective_bundle_id];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (void)setEffectiveBundleID:(id)a3
{
  id v5 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_effective_bundle_id(v4, (const char *)[v5 UTF8String]);
}

- (BOOL)copyEffectiveAuditToken:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = nw_parameters_get_effective_audit_token(v4, a3);

  return (char)a3;
}

- (NSUUID)parentID
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uuid_clear(uu);
  -[NWParameters internalParameters](self, "internalParameters");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_get_parent_id(v3, uu);

  if (uuid_is_null(uu)) {
    return (NSUUID *)0LL;
  }
  else {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
  }
}

- (NSArray)parentIDs
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __25__NWParameters_parentIDs__block_invoke;
  v7[3] = &unk_189BC5E38;
  id v5 = v3;
  id v8 = v5;
  nw_parameters_iterate_parent_ids(v4, v7);

  return (NSArray *)v5;
}

- (void)setParentID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uuid_clear(uu);
  [v4 getUUIDBytes:uu];

  -[NWParameters internalParameters](self, "internalParameters");
  id v5 = (NWConcrete_nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_parent_id_inner(v5, uu, 1);
}

- (unsigned)requiredAddressFamily
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 required_address_family = nw_parameters_get_required_address_family(v2);

  return required_address_family;
}

- (void)setRequiredAddressFamily:(unsigned __int8)a3
{
  int v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_address_family(v4, v3);
}

- (NWAddressEndpoint)localAddress
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_endpoint_t v3 = nw_parameters_copy_local_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NWAddressEndpoint *)v4;
}

- (void)setLocalAddress:(id)a3
{
  id v4 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  parameters = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  [v4 internalEndpoint];
  id v5 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();

  nw_parameters_set_local_endpoint(parameters, v5);
}

- (BOOL)reuseLocalAddress
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  BOOL reuse_local_address = nw_parameters_get_reuse_local_address(v2);

  return reuse_local_address;
}

- (void)setReuseLocalAddress:(BOOL)a3
{
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_reuse_local_address(v4, a3);
}

- (NSURL)url
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  url = (void *)nw_parameters_get_url(v2);

  if (url)
  {
    id v4 = (void *)MEMORY[0x189604030];
    BOOL v5 = nw_nsstring((uint64_t)url);
    [v4 URLWithString:v5];
    url = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)url;
}

- (void)setUrl:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_url(v4, (const char *)[v5 UTF8String]);
}

- (NSURL)sanitizedURL
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  sanitized_url = (void *)nw_parameters_get_sanitized_url(v2);

  if (sanitized_url)
  {
    id v4 = objc_alloc(MEMORY[0x189604030]);
    BOOL v5 = nw_nsstring((uint64_t)sanitized_url);
    sanitized_url = (void *)[v4 initWithString:v5];
  }

  return (NSURL *)sanitized_url;
}

- (NSDictionary)proxyConfiguration
{
  return 0LL;
}

- (void)setProxyConfiguration:(id)a3
{
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = object_getClass(v4) == (Class)MEMORY[0x1895F9250];
    id v4 = v7;
    if (v5)
    {
      -[NWParameters internalParameters](self, "internalParameters");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      nw_parameters_set_proxy_configuration(v6, v7);

      id v4 = v7;
    }
  }
}

- (BOOL)prohibitExpensivePaths
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  BOOL prohibit_expensive = nw_parameters_get_prohibit_expensive(v2);

  return prohibit_expensive;
}

- (void)setProhibitExpensivePaths:(BOOL)a3
{
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_expensive(v4, a3);
}

- (BOOL)prohibitConstrainedPaths
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  BOOL prohibit_constrained = nw_parameters_get_prohibit_constrained(v2);

  return prohibit_constrained;
}

- (void)setProhibitConstrainedPaths:(BOOL)a3
{
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_constrained(v4, a3);
}

- (BOOL)prohibitRoaming
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char prohibit_roaming = nw_parameters_get_prohibit_roaming(v2);

  return prohibit_roaming;
}

- (void)setProhibitRoaming:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_roaming(v4, v3);
}

- (BOOL)prohibitCellular
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL prohibit_cellular = nw_parameters_get_prohibit_cellular(v2);

  return prohibit_cellular;
}

- (void)prohibitInterfaceType:(int64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  objects = (xpc_object_t *)nw_parameters_copy_prohibited_interface_types(v5);

  uint64_t v6 = objects;
  if (!objects) {
    uint64_t v6 = (xpc_object_t *)xpc_array_create(0LL, 0LL);
  }
  objectsa = v6;
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, a3);
  -[NWParameters internalParameters](self, "internalParameters");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibited_interface_types(v7, objectsa);
}

- (void)prohibitInterfaceSubtype:(int64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  objects = (xpc_object_t *)nw_parameters_copy_prohibited_interface_subtypes(v5);

  uint64_t v6 = objects;
  if (!objects) {
    uint64_t v6 = (xpc_object_t *)xpc_array_create(0LL, 0LL);
  }
  objectsa = v6;
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, a3);
  -[NWParameters internalParameters](self, "internalParameters");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibited_interface_subtypes(v7, objectsa);
}

- (void)prohibitInterface:(id)a3
{
  id v9 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = nw_parameters_copy_prohibited_interfaces(v4);

  if (!v5) {
    id v5 = xpc_array_create(0LL, 0LL);
  }
  [v9 internalInterface];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = nw_interface_copy_dictionary(v6);

  if (v7)
  {
    xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, v7);
    -[NWParameters internalParameters](self, "internalParameters");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_prohibited_interfaces(v8, v5);
  }
}

- (void)prohibitNetworkAgentWithUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = nw_parameters_copy_prohibited_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0LL, 0LL);
    }
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_prohibited_netagent_uuids(v7, v6);
  }
}

- (void)prohibitNetworkAgentsWithDomain:(id)a3 type:(id)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = nw_parameters_copy_prohibited_netagent_domains(v9);

    -[NWParameters internalParameters](self, "internalParameters");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = nw_parameters_copy_prohibited_netagent_types(v11);

    if (!v10 || !v12)
    {
      xpc_object_t v13 = xpc_array_create(0LL, 0LL);

      xpc_object_t v14 = xpc_array_create(0LL, 0LL);
      id v12 = v14;
      id v10 = v13;
    }

    v15 = (const char *)[v6 UTF8String];
    if (v15)
    {
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v15);
      goto LABEL_24;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
    __int16 v46 = 2114;
    id v47 = v6;
    LODWORD(v40) = 22;
    BOOL v38 = buf;
    os_log_type_t v17 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v42 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v42))
    {
LABEL_22:
      if (v17) {
        free(v17);
      }
LABEL_24:
      objc_super v26 = (const char *)objc_msgSend(v8, "UTF8String", v38, v40);
      if (v26)
      {
        xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v26);
LABEL_42:
        -[NWParameters internalParameters](self, "internalParameters", v39, v41);
        id v37 = (void *)objc_claimAutoreleasedReturnValue();
        nw_parameters_set_prohibited_netagent_classes(v37, v10, v12);

        goto LABEL_43;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v27 = (id)gLogObj;
      *(_DWORD *)buf = 136446466;
      v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
      __int16 v46 = 2114;
      id v47 = v8;
      LODWORD(v41) = 22;
      v39 = buf;
      __int16 v28 = (void *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v42 = 0;
      if (!__nwlog_fault((const char *)v28, &type, &v42))
      {
LABEL_40:
        if (v28) {
          free(v28);
        }
        goto LABEL_42;
      }

      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        __int16 v29 = (os_log_s *)(id)gLogObj;
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          __int16 v46 = 2114;
          id v47 = v8;
          id v31 = "%{public}s Failed to get UTF8String from type %{public}@";
LABEL_37:
          id v35 = v29;
          os_log_type_t v36 = v30;
LABEL_38:
          _os_log_impl(&dword_181A5C000, v35, v36, v31, buf, 0x16u);
        }
      }

      else
      {
        if (v42)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          __int16 v29 = (os_log_s *)(id)gLogObj;
          os_log_type_t v33 = type;
          BOOL v34 = os_log_type_enabled(v29, type);
          if (backtrace_string)
          {
            if (v34)
            {
              *(_DWORD *)buf = 136446722;
              v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
              __int16 v46 = 2114;
              id v47 = v8;
              __int16 v48 = 2082;
              xpc_object_t v49 = backtrace_string;
              _os_log_impl( &dword_181A5C000,  v29,  v33,  "%{public}s Failed to get UTF8String from type %{public}@, dumping backtrace:%{public}s",  buf,  0x20u);
            }

            free(backtrace_string);
            goto LABEL_40;
          }

          if (!v34) {
            goto LABEL_39;
          }
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          __int16 v46 = 2114;
          id v47 = v8;
          id v31 = "%{public}s Failed to get UTF8String from type %{public}@, no backtrace";
          id v35 = v29;
          os_log_type_t v36 = v33;
          goto LABEL_38;
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        __int16 v29 = (os_log_s *)(id)gLogObj;
        os_log_type_t v30 = type;
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          __int16 v46 = 2114;
          id v47 = v8;
          id v31 = "%{public}s Failed to get UTF8String from type %{public}@, backtrace limit exceeded";
          goto LABEL_37;
        }
      }

- (NWInterface)requiredInterface
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_interface_t v3 = nw_parameters_copy_required_interface(v2);

  if (v3) {
    id v4 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (void)setRequiredInterface:(id)a3
{
  id v4 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  parameters = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  [v4 internalInterface];
  id v5 = (nw_interface *)objc_claimAutoreleasedReturnValue();

  nw_parameters_require_interface(parameters, v5);
}

- (int64_t)requiredInterfaceType
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  required_interface_os_log_type_t type = nw_parameters_get_required_interface_type(v2);

  return required_interface_type;
}

- (void)setRequiredInterfaceType:(int64_t)a3
{
  nw_interface_type_t v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_interface_type(v4, v3);
}

- (int64_t)requiredInterfaceSubtype
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  required_interface_subos_log_type_t type = nw_parameters_get_required_interface_subtype(v2);

  return required_interface_subtype;
}

- (void)setRequiredInterfaceSubtype:(int64_t)a3
{
  int v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_interface_subtype(v4, v3);
}

- (int64_t)requiredCompanionProxyInterfaceType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  next_hop_required_interface_os_log_type_t type = nw_parameters_get_next_hop_required_interface_type(v2);

  return next_hop_required_interface_type;
}

- (void)setRequiredCompanionProxyInterfaceType:(int64_t)a3
{
  int v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_next_hop_required_interface_type(v4, v3);
}

- (void)requireNetworkAgentWithUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = nw_parameters_copy_required_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0LL, 0LL);
    }
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_required_netagent_uuids(v7, v6);
  }
}

- (void)requireNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  -[NWParameters internalParameters](self, "internalParameters");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = nw_parameters_copy_required_netagent_domains(v7);

  -[NWParameters internalParameters](self, "internalParameters");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = nw_parameters_copy_required_netagent_types(v9);

  if (!v8 || !v10)
  {
    xpc_object_t v11 = xpc_array_create(0LL, 0LL);

    xpc_object_t v12 = xpc_array_create(0LL, 0LL);
    id v10 = v12;
    id v8 = v11;
  }

  uint64_t v13 = [v18 UTF8String];
  if (v13) {
    xpc_object_t v14 = (const char *)v13;
  }
  else {
    xpc_object_t v14 = "";
  }
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  uint64_t v15 = [v6 UTF8String];
  if (v15) {
    id v16 = (const char *)v15;
  }
  else {
    id v16 = "";
  }
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  -[NWParameters internalParameters](self, "internalParameters");
  os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_netagent_classes(v17, v8, v10);
}

- (void)preferNetworkAgentWithUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = nw_parameters_copy_preferred_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0LL, 0LL);
    }
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_preferred_netagent_uuids(v7, v6);
  }
}

- (void)preferNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  -[NWParameters internalParameters](self, "internalParameters");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v8 = nw_parameters_copy_preferred_netagent_domains(v7);

  -[NWParameters internalParameters](self, "internalParameters");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v10 = nw_parameters_copy_preferred_netagent_types(v9);

  if (!v8 || !v10)
  {
    xpc_object_t v11 = xpc_array_create(0LL, 0LL);

    xpc_object_t v12 = xpc_array_create(0LL, 0LL);
    xpc_object_t v10 = v12;
    xpc_object_t v8 = v11;
  }

  uint64_t v13 = [v18 UTF8String];
  if (v13) {
    xpc_object_t v14 = (const char *)v13;
  }
  else {
    xpc_object_t v14 = "";
  }
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  uint64_t v15 = [v6 UTF8String];
  if (v15) {
    id v16 = (const char *)v15;
  }
  else {
    id v16 = "";
  }
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  -[NWParameters internalParameters](self, "internalParameters");
  os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_preferred_netagent_classes(v17, v8, v10);
}

- (void)avoidNetworkAgentWithUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = nw_parameters_copy_avoided_netagent_uuids(v5);

    if (!v6) {
      id v6 = xpc_array_create(0LL, 0LL);
    }
    [v4 getUUIDBytes:uuid];
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_avoided_netagent_uuids(v7, v6);
  }
}

- (void)avoidNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  -[NWParameters internalParameters](self, "internalParameters");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v8 = nw_parameters_copy_avoided_netagent_domains(v7);

  -[NWParameters internalParameters](self, "internalParameters");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v10 = nw_parameters_copy_avoided_netagent_types(v9);

  if (!v8 || !v10)
  {
    xpc_object_t v11 = xpc_array_create(0LL, 0LL);

    xpc_object_t v12 = xpc_array_create(0LL, 0LL);
    xpc_object_t v10 = v12;
    xpc_object_t v8 = v11;
  }

  uint64_t v13 = [v18 UTF8String];
  if (v13) {
    xpc_object_t v14 = (const char *)v13;
  }
  else {
    xpc_object_t v14 = "";
  }
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  uint64_t v15 = [v6 UTF8String];
  if (v15) {
    id v16 = (const char *)v15;
  }
  else {
    id v16 = "";
  }
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  -[NWParameters internalParameters](self, "internalParameters");
  os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_avoided_netagent_classes(v17, v8, v10);
}

- (BOOL)enableTFO
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL tfo = nw_parameters_get_tfo(v2);

  return tfo;
}

- (void)setEnableTFO:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_tfo(v4, v3);
}

- (BOOL)enableTFONoCookie
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL tfo_no_cookie = nw_parameters_get_tfo_no_cookie(v2);

  return tfo_no_cookie;
}

- (void)setEnableTFONoCookie:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_tfo_no_cookie(v4, a3);
}

- (BOOL)fastOpenForceEnable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL fast_open_force_enable = nw_parameters_get_fast_open_force_enable(v2);

  return fast_open_force_enable;
}

- (void)setFastOpenForceEnable:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_fast_open_force_enable(v4, a3);
}

- (BOOL)reduceBuffering
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL reduce_buffering = nw_parameters_get_reduce_buffering(v2);

  return reduce_buffering;
}

- (void)setReduceBuffering:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_reduce_buffering(v4, a3);
}

- (BOOL)disableNagleAlgorithm
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL no_delay = nw_parameters_get_no_delay(v2);

  return no_delay;
}

- (void)setDisableNagleAlgorithm:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_no_delay(v4, a3);
}

- (BOOL)useLongOutstandingQueries
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char use_long_outstanding_queries = nw_parameters_get_use_long_outstanding_queries(v2);

  return use_long_outstanding_queries;
}

- (void)setUseLongOutstandingQueries:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_use_long_outstanding_queries(v4, v3);
}

- (BOOL)ignoreResolverStats
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char ignore_resolver_stats = nw_parameters_get_ignore_resolver_stats(v2);

  return ignore_resolver_stats;
}

- (void)setIgnoreResolverStats:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_ignore_resolver_stats(v4, v3);
}

- (BOOL)useAWDL
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char use_awdl = nw_parameters_get_use_awdl(v2);

  return use_awdl;
}

- (void)setUseAWDL:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_use_awdl(v4, v3);
}

- (BOOL)useP2P
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char use_p2p = nw_parameters_get_use_p2p(v2);

  return use_p2p;
}

- (void)setUseP2P:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_use_p2p(v4, v3);
}

- (BOOL)resolvePTR
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char resolve_ptr = nw_parameters_get_resolve_ptr(v2);

  return resolve_ptr;
}

- (void)setResolvePTR:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_resolve_ptr(v4, v3);
}

- (BOOL)multipath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL multipath = nw_parameters_get_multipath(v2);

  return multipath;
}

- (void)setMultipath:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  if (v3) {
    nw_multipath_service_t v5 = nw_multipath_service_interactive;
  }
  else {
    nw_multipath_service_t v5 = nw_multipath_service_disabled;
  }
  nw_parameters_set_multipath_service(v4, v5);
}

- (int)multipathService
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_multipath_service_t multipath_service = nw_parameters_get_multipath_service(v2);

  return multipath_service;
}

- (void)setMultipathService:(int)a3
{
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_multipath_service(v4, (nw_multipath_service_t)a3);
}

- (BOOL)multipathForceEnable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char multipath_force_enable = nw_parameters_get_multipath_force_enable(v2);

  return multipath_force_enable;
}

- (void)setMultipathForceEnable:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_multipath_force_enable(v4, v3);
}

- (BOOL)indefinite
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char indefinite = nw_parameters_get_indefinite(v2);

  return indefinite;
}

- (void)setIndefinite:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_indefinite(v4, v3);
}

- (BOOL)noProxy
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char no_proxy = nw_parameters_get_no_proxy(v2);

  return no_proxy;
}

- (void)setNoProxy:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_no_proxy(v4, v3);
}

- (BOOL)enableTLS
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char tls = nw_parameters_get_tls(v2);

  return tls;
}

- (void)setEnableTLS:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_tls(v4, v3);
}

- (NSData)TLSSessionID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_parameters_copy_tls_session_id(v2);

  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1895F9240]) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0LL;
  }

  return (NSData *)v4;
}

- (void)setTLSSessionID:(id)a3
{
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = object_getClass(v4) == (Class)MEMORY[0x1895F9240];
    id v4 = v7;
    if (v5)
    {
      -[NWParameters internalParameters](self, "internalParameters");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      nw_parameters_set_tls_session_id(v6, v7);

      id v4 = v7;
    }
  }
}

- (void)setSSLCipherSuites:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NWParameters setSSLCipherSuitesInternal:](self, "setSSLCipherSuitesInternal:", v4);
  if (![v4 count])
  {
    -[NWParameters internalParameters](self, "internalParameters");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_ssl_cipher_suites(v5, 0LL, 0);
LABEL_11:

    return;
  }

  [v4 allObjects];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = [v5 count];
  if (!v6)
  {
    __nwlog_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    char v24 = "strict_calloc";
    LODWORD(v22) = 12;
    v21 = buf;
    os_log_type_t v17 = (void *)_os_log_send_and_compose_impl();

    free(v17);
  }

  id v7 = (tls_ciphersuite_t *)calloc(2uLL, v6);
  if (v7)
  {
    xpc_object_t v8 = v7;
    if (v6)
    {
      for (uint64_t i = 0LL; i != v6; v8[i++] = v11)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", i, v21, v22);
        xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        tls_ciphersuite_t v11 = (unsigned __int16)[v10 unsignedIntValue];
      }

      -[NWParameters internalParameters](self, "internalParameters");
      xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      xpc_object_t v14 = v8;
      int v15 = v6;
    }

    else
    {
      -[NWParameters internalParameters](self, "internalParameters");
      xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      xpc_object_t v14 = v8;
      int v15 = 0;
    }

    nw_parameters_set_ssl_cipher_suites(v12, v14, v15);

    free(v8);
    goto LABEL_11;
  }

  __nwlog_obj();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446722;
  char v24 = "strict_calloc";
  __int16 v25 = 2048;
  uint64_t v26 = 2LL;
  __int16 v27 = 2048;
  uint64_t v28 = v6;
  os_log_type_t v19 = (void *)_os_log_send_and_compose_impl();

  if (!__nwlog_abort((uint64_t)v19))
  {
    free(v19);
    __nwlog_obj();
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      char v24 = "-[NWParameters setSSLCipherSuites:]";
      __int16 v25 = 1024;
      LODWORD(v26) = v6;
      _os_log_impl( &dword_181A5C000,  v20,  OS_LOG_TYPE_ERROR,  "%{public}s Could not allocate array for %d SSL cipher suites",  buf,  0x12u);
    }

    goto LABEL_11;
  }

- (BOOL)keepAlive
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL keepalive_enabled = nw_parameters_get_keepalive_enabled(v2);

  return keepalive_enabled;
}

- (void)setKeepAlive:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_enabled(v4, a3);
}

- (unint64_t)keepAliveIdleTime
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t keepalive_idle_time = nw_parameters_get_keepalive_idle_time(v2);

  return keepalive_idle_time;
}

- (void)setKeepAliveIdleTime:(unint64_t)a3
{
  uint32_t v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_idle_time(v4, v3);
}

- (unint64_t)keepAliveInterval
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t keepalive_interval = nw_parameters_get_keepalive_interval(v2);

  return keepalive_interval;
}

- (void)setKeepAliveInterval:(unint64_t)a3
{
  uint32_t v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_interval(v4, v3);
}

- (BOOL)keepAliveOffload
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL keepalive_offload = nw_parameters_get_keepalive_offload(v2);

  return keepalive_offload;
}

- (void)setKeepAliveOffload:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_offload(v4, a3);
}

- (unsigned)tlsVersionWithSSLProtocol:(int)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unsigned __int16 result = 768;
  switch(a3)
  {
    case 0:
      return 0;
    case 1:
    case 3:
    case 5:
    case 6:
      BOOL v5 = "deprecated";
      goto LABEL_3;
    case 2:
      return result;
    case 4:
      return 769;
    case 7:
      return 770;
    case 8:
      return 771;
    case 9:
      return -257;
    case 10:
      return 772;
    default:
      BOOL v5 = "unknown";
LABEL_3:
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      unsigned int v6 = (os_log_s *)(id)gLogObj;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        xpc_object_t v8 = "-[NWParameters tlsVersionWithSSLProtocol:]";
        __int16 v9 = 2082;
        xpc_object_t v10 = v5;
        __int16 v11 = 1024;
        int v12 = a3;
        _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s Parameters have %{public}s SSLProtocol %d, ignoring",  (uint8_t *)&v7,  0x1Cu);
      }

      return 0;
  }

- (void)setMinimumSSLProtocolVersion:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_minimum_tls_protocol_version(v5);
}

- (void)setMaximumSSLProtocolVersion:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_maximum_tls_protocol_version(v5);
}

- (void)setSourceApplicationWithToken:(id *)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  __int128 v4 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  nw_parameters_set_source_application(v5, v6);
}

- (void)setSourceApplicationWithBundleID:(id)a3
{
  id v5 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_source_application_by_bundle_id_internal(v4, (const char *)[v5 UTF8String]);
}

- (void)setInitialDataPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    unsigned int v6 = 0LL;
    goto LABEL_8;
  }

  unsigned int v6 = (void *)[v4 _createDispatchData];
  if (v6)
  {
LABEL_8:
    -[NWParameters internalParameters](self, "internalParameters");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_initial_data_payload(v12, v6);

    goto LABEL_9;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v21 = "-[NWParameters setInitialDataPayload:]";
  xpc_object_t v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v9 = (os_log_s *)(id)gLogObj;
    os_log_type_t v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[NWParameters setInitialDataPayload:]";
      __int16 v11 = "%{public}s NWCreateDispatchDataFromNSData failed";
LABEL_17:
      id v16 = v9;
      os_log_type_t v17 = v10;
LABEL_18:
      _os_log_impl(&dword_181A5C000, v16, v17, v11, buf, 0xCu);
    }
  }

  else
  {
    if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      __int16 v9 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136446466;
          v21 = "-[NWParameters setInitialDataPayload:]";
          __int16 v22 = 2082;
          BOOL v23 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v9,  v14,  "%{public}s NWCreateDispatchDataFromNSData failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (!v15) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136446210;
      v21 = "-[NWParameters setInitialDataPayload:]";
      __int16 v11 = "%{public}s NWCreateDispatchDataFromNSData failed, no backtrace";
      id v16 = v9;
      os_log_type_t v17 = v14;
      goto LABEL_18;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    __int16 v9 = (os_log_s *)(id)gLogObj;
    os_log_type_t v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[NWParameters setInitialDataPayload:]";
      __int16 v11 = "%{public}s NWCreateDispatchDataFromNSData failed, backtrace limit exceeded";
      goto LABEL_17;
    }
  }

- (void)setProtocolTransforms:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  BOOL v5 = nw_array_create();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "internalTransform", (void)v13);
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
        nw_array_append(v5, v11);

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  -[NWParameters internalParameters](self, "internalParameters");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_transform_array(v12, (void *)v5);
}

- (NSArray)protocolTransforms
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint32_t v3 = (unsigned __int8 *)nw_parameters_copy_transform_array(v2);

  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __34__NWParameters_protocolTransforms__block_invoke;
  v7[3] = &unk_189BC85B0;
  id v5 = v4;
  id v8 = v5;
  nw_array_apply(v3, (uint64_t)v7);

  return (NSArray *)v5;
}

- (BOOL)isValid
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = nw_parameters_are_valid(v2);

  return v3;
}

- (BOOL)prohibitFallback
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char no_fallback = nw_parameters_get_no_fallback(v2);

  return no_fallback;
}

- (void)setProhibitFallback:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_no_fallback(v4, v3);
}

- (BOOL)isDiscretionary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char discretionary = nw_parameters_get_discretionary(v2);

  return discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  __int16 v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_discretionary(v4, v3);
}

- (BOOL)hasRequiredNetworkAgents
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_required_netagents = nw_parameters_has_required_netagents(v2);

  return has_required_netagents;
}

- (BOOL)hasPreferredNetworkAgents
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_preferred_netagents = nw_parameters_has_preferred_netagents(v2);

  return has_preferred_netagents;
}

- (BOOL)hasProhibitedNetworkAgents
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v2);

  return has_prohibited_netagents;
}

- (BOOL)hasNonEmptyProxyConfiguration
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_custom_proxy_configs = nw_parameters_has_custom_proxy_configs(v2);

  return has_custom_proxy_configs;
}

- (BOOL)isDryRun
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char dry_run = nw_parameters_get_dry_run(v2);

  return dry_run;
}

- (id)copyRequiredAgentsDescription
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = nw_parameters_copy_required_netagent_domains(v3);

  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = nw_parameters_copy_required_netagent_types(v5);

    if (v6)
    {
      v15[0] = 0LL;
      v15[1] = v15;
      v15[2] = 0x2020000000LL;
      char v16 = 0;
      id v7 = objc_alloc_init(MEMORY[0x189607940]);
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 3221225472LL;
      applier[2] = __45__NWParameters_copyRequiredAgentsDescription__block_invoke;
      applier[3] = &unk_189BBF1E8;
      id v12 = v6;
      id v8 = v7;
      id v13 = v8;
      __int128 v14 = v15;
      xpc_array_apply(v4, applier);
      if ([v8 length]) {
        uint64_t v9 = (void *)[objc_alloc(NSString) initWithString:v8];
      }
      else {
        uint64_t v9 = 0LL;
      }

      _Block_object_dispose(v15, 8);
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (void)setProtocolAtLevel:(unint64_t)a3 protocol:(nw_protocol_identifier *)a4
{
  if (a3 - 1 < 4) {
    int v5 = a3;
  }
  else {
    int v5 = 0;
  }
  -[NWParameters internalParameters](self, "internalParameters");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_add_to_protocol_stack(v6, v5, 0xFFFFFFFF, (__int128 *)a4->name);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    -[NWParameters internalParameters](self, "internalParameters");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 internalParameters];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    char is_equal = nw_parameters_is_equal(v6, v7);
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
  size_t hash = nw_parameters_get_hash(v2);

  return hash;
}

- (NSData)metadata
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_parameters_copy_metadata(v2);

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x189603F48]);
    bytes_ptr = xpc_data_get_bytes_ptr(v3);
    id v6 = (void *)[v4 initWithBytes:bytes_ptr length:xpc_data_get_length(v3)];
  }

  else
  {
    id v6 = 0LL;
  }

  return (NSData *)v6;
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    xpc_object_t v5 = xpc_data_create((const void *)[v4 bytes], objc_msgSend(v4, "length"));
  }
  else {
    xpc_object_t v5 = 0LL;
  }
  -[NWParameters internalParameters](self, "internalParameters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_metadata(v6, v5);
}

- (id)createProtocolBufferObject
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NWPBParameters);
  -[NWParameters effectiveProcessUUID](self, "effectiveProcessUUID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 UUIDString];
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_effectiveProcessUUID, v5);
  }

  -[NWParameters processUUID](self, "processUUID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_realProcessUUID, v7);
  }

  -[NWParameters localAddress](self, "localAddress");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v8 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_localEndpoint, v9);
  }

  -[NWParameters account](self, "account");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_account, v10);
  }

  if (-[NWParameters requiredAddressFamily](self, "requiredAddressFamily"))
  {
    unsigned int v11 = -[NWParameters requiredAddressFamily](self, "requiredAddressFamily");
    if (v3)
    {
      *(_WORD *)&v3->_has |= 1u;
      v3->_addressFamily = v11;
      int v12 = -[NWParameters dataMode](self, "dataMode");
LABEL_13:
      *(_WORD *)&v3->_has |= 2u;
      v3->_dataMode = v12;
      -[NWParameters effectiveBundleID](self, "effectiveBundleID");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v3->_effectiveBundleID, v13);
      goto LABEL_14;
    }

    -[NWParameters dataMode](self, "dataMode");
  }

  else
  {
    int v12 = -[NWParameters dataMode](self, "dataMode");
    if (v3) {
      goto LABEL_13;
    }
  }

  -[NWParameters effectiveBundleID](self, "effectiveBundleID");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  -[NWParameters metadata](self, "metadata");
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_metadata, v14);
  }

  -[NWParameters requiredInterface](self, "requiredInterface");
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  char v16 = (void *)[v15 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_requiredInterface, v16);
  }

  int v17 = -[NWParameters requiredInterfaceType](self, "requiredInterfaceType");
  if (v3)
  {
    *(_WORD *)&v3->_has |= 0x10u;
    v3->_requiredInterfaceType = v17;
    unsigned int v18 = -[NWParameters trafficClass](self, "trafficClass");
    *(_WORD *)&v3->_has |= 0x20u;
    v3->_trafficClass = v18;
  }

  else
  {
    -[NWParameters trafficClass](self, "trafficClass");
  }

  -[NWParameters url](self, "url");
  os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 absoluteString];
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_storeStrong((id *)&v3->_url, v20);
  }

  if (-[NWParameters enableTFO](self, "enableTFO"))
  {
    BOOL v21 = -[NWParameters enableTFO](self, "enableTFO");
    if (v3)
    {
      *(_WORD *)&v3->_has |= 0x40u;
      v3->_fastOpesize_t n = v21;
    }
  }

  if (-[NWParameters keepAlive](self, "keepAlive"))
  {
    BOOL v22 = -[NWParameters keepAlive](self, "keepAlive");
    if (v3)
    {
      *(_WORD *)&v3->_has |= 0x80u;
      v3->_keepalive = v22;
      BOOL v23 = -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries");
LABEL_29:
      *(_WORD *)&v3->_has |= 0x100u;
      v3->_longOutstandingQueries = v23;
      int v24 = -[NWParameters multipathService](self, "multipathService");
      *(_WORD *)&v3->_has |= 8u;
      v3->_multipathService = v24;
      BOOL v25 = -[NWParameters prohibitFallback](self, "prohibitFallback");
      *(_WORD *)&v3->_has |= 0x200u;
      v3->_noFallbacsize_t k = v25;
      BOOL v26 = -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths");
      *(_WORD *)&v3->_has |= 0x400u;
      v3->_prohibitExpensive = v26;
      BOOL v27 = -[NWParameters reuseLocalAddress](self, "reuseLocalAddress");
      *(_WORD *)&v3->_has |= 0x1000u;
      v3->_reuseLocalAddress = v27;
      BOOL v28 = -[NWParameters useAWDL](self, "useAWDL");
      *(_WORD *)&v3->_has |= 0x2000u;
      v3->_useAWDL = v28;
      BOOL v29 = -[NWParameters useP2P](self, "useP2P");
      *(_WORD *)&v3->_has |= 0x4000u;
      v3->_useP2P = v29;
      goto LABEL_30;
    }

    -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries");
  }

  else
  {
    BOOL v23 = -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries");
    if (v3) {
      goto LABEL_29;
    }
  }

  -[NWParameters multipathService](self, "multipathService");
  -[NWParameters prohibitFallback](self, "prohibitFallback");
  -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths");
  -[NWParameters reuseLocalAddress](self, "reuseLocalAddress");
  -[NWParameters useAWDL](self, "useAWDL");
  -[NWParameters useP2P](self, "useP2P");
LABEL_30:
  -[NWParameters internalParameters](self, "internalParameters");
  os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_required_netagents = nw_parameters_has_required_netagents(v30);

  if (has_required_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = nw_parameters_copy_required_netagent_domains(v32);

    -[NWParameters internalParameters](self, "internalParameters");
    BOOL v34 = (void *)objc_claimAutoreleasedReturnValue();
    id v35 = nw_parameters_copy_required_netagent_types(v34);

    if (v33)
    {
      if (v35)
      {
        size_t count = xpc_array_get_count(v33);
        if (count)
        {
          size_t v37 = count;
          for (size_t i = 0LL; i != v37; ++i)
          {
            string = xpc_array_get_string(v33, i);
            uint64_t v40 = xpc_array_get_string(v35, i);
            if (string)
            {
              uint64_t v41 = v40;
              if (v40)
              {
                char v42 = objc_alloc_init(&OBJC_CLASS___NWPBAgentClass);
                [NSString stringWithUTF8String:string];
                id v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (v42) {
                  objc_storeStrong((id *)&v42->_domain, v43);
                }

                [NSString stringWithUTF8String:v41];
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (v42) {
                  objc_storeStrong((id *)&v42->_type, v44);
                }

                v45 = v42;
                if (v3)
                {
                  requiredAgents = v3->_requiredAgents;
                  if (!requiredAgents)
                  {
                    id v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
                    __int16 v48 = v3->_requiredAgents;
                    v3->_requiredAgents = v47;

                    requiredAgents = v3->_requiredAgents;
                  }

                  -[NSMutableArray addObject:](requiredAgents, "addObject:", v45);
                }
              }
            }
          }
        }
      }
    }
  }

  -[NWParameters internalParameters](self, "internalParameters");
  xpc_object_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v49);

  if (has_prohibited_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    char v51 = (void *)objc_claimAutoreleasedReturnValue();
    id v52 = nw_parameters_copy_prohibited_netagent_domains(v51);

    -[NWParameters internalParameters](self, "internalParameters");
    xpc_object_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    id v54 = nw_parameters_copy_prohibited_netagent_types(v53);

    if (v52)
    {
      if (v54)
      {
        size_t v55 = xpc_array_get_count(v52);
        if (v55)
        {
          size_t v56 = v55;
          for (size_t j = 0LL; j != v56; ++j)
          {
            uint64_t v58 = xpc_array_get_string(v52, j);
            v59 = xpc_array_get_string(v54, j);
            if (v58)
            {
              v60 = v59;
              if (v59)
              {
                v61 = objc_alloc_init(&OBJC_CLASS___NWPBAgentClass);
                [NSString stringWithUTF8String:v58];
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                if (v61) {
                  objc_storeStrong((id *)&v61->_domain, v62);
                }

                [NSString stringWithUTF8String:v60];
                id v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v61) {
                  objc_storeStrong((id *)&v61->_type, v63);
                }

                v64 = v61;
                if (v3)
                {
                  prohibitedAgents = v3->_prohibitedAgents;
                  if (!prohibitedAgents)
                  {
                    v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
                    id v67 = v3->_prohibitedAgents;
                    v3->_prohibitedAgents = v66;

                    prohibitedAgents = v3->_prohibitedAgents;
                  }

                  -[NSMutableArray addObject:](prohibitedAgents, "addObject:", v64);
                }
              }
            }
          }
        }
      }
    }
  }
  v68 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_preferred_netagents = nw_parameters_has_preferred_netagents(v68);

  if (has_preferred_netagents)
  {
    v70 = -[NWParameters internalParameters](self, "internalParameters");
    xpc_object_t v71 = nw_parameters_copy_preferred_netagent_domains(v70);
    v72 = -[NWParameters internalParameters](self, "internalParameters");
    xpc_object_t v73 = nw_parameters_copy_preferred_netagent_types(v72);

    if (v71)
    {
      if (v73)
      {
        size_t v74 = xpc_array_get_count(v71);
        if (v74)
        {
          size_t v75 = v74;
          for (size_t k = 0LL; k != v75; ++k)
          {
            id v77 = xpc_array_get_string(v71, k);
            v78 = xpc_array_get_string(v73, k);
            if (v77)
            {
              v79 = v78;
              if (v78)
              {
                v80 = objc_alloc_init(&OBJC_CLASS___NWPBAgentClass);
                [NSString stringWithUTF8String:v77];
                id v81 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80) {
                  objc_storeStrong((id *)&v80->_domain, v81);
                }

                [NSString stringWithUTF8String:v79];
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80) {
                  objc_storeStrong((id *)&v80->_type, v82);
                }

                v83 = v80;
                if (v3)
                {
                  preferredAgents = v3->_preferredAgents;
                  if (!preferredAgents)
                  {
                    id v85 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
                    v86 = v3->_preferredAgents;
                    v3->_preferredAgents = v85;

                    preferredAgents = v3->_preferredAgents;
                  }

                  -[NSMutableArray addObject:](preferredAgents, "addObject:", v83);
                }
              }
            }
          }
        }
      }
    }
  }
  v87 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_prohibited_interfaces = nw_parameters_has_prohibited_interfaces(v87);

  if (has_prohibited_interfaces)
  {
    v89 = -[NWParameters internalParameters](self, "internalParameters");
    id v90 = nw_parameters_copy_prohibited_interfaces(v89);

    if (v90)
    {
      size_t v91 = xpc_array_get_count(v90);
      if (v91)
      {
        size_t v92 = v91;
        for (size_t m = 0LL; m != v92; ++m)
        {
          xpc_array_get_value(v90, m);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = nw_interface_create_from_dictionary(v94);

          if (v95)
          {
            v96 = -[NWInterface initWithInterface:](objc_alloc(&OBJC_CLASS___NWInterface), "initWithInterface:", v95);
            id v97 = -[NWInterface createProtocolBufferObject](v96, "createProtocolBufferObject");
            if (v3)
            {
              prohibitedInterfaces = v3->_prohibitedInterfaces;
              if (!prohibitedInterfaces)
              {
                v99 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
                v100 = v3->_prohibitedInterfaces;
                v3->_prohibitedInterfaces = v99;

                prohibitedInterfaces = v3->_prohibitedInterfaces;
              }

              -[NSMutableArray addObject:](prohibitedInterfaces, "addObject:", v97);
            }
          }
        }
      }
    }
  }
  v101 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_prohibited_interface_types = nw_parameters_has_prohibited_interface_types(v101);

  if (has_prohibited_interface_types)
  {
    v103 = -[NWParameters internalParameters](self, "internalParameters");
    id v104 = nw_parameters_copy_prohibited_interface_types(v103);

    if (v104)
    {
      size_t v105 = xpc_array_get_count(v104);
      if (v105)
      {
        size_t v106 = v105;
        for (size_t n = 0LL; n != v106; ++n)
        {
          xpc_array_get_uint64(v104, n);
          if (v3) {
            PBRepeatedInt32Add();
          }
        }
      }
    }
  }
  v108 = -[NWParameters internalParameters](self, "internalParameters");
  BOOL has_prohibited_interface_subtypes = nw_parameters_has_prohibited_interface_subtypes(v108);

  if (has_prohibited_interface_subtypes)
  {
    v110 = -[NWParameters internalParameters](self, "internalParameters");
    id v111 = nw_parameters_copy_prohibited_interface_subtypes(v110);

    if (v111)
    {
      size_t v112 = xpc_array_get_count(v111);
      if (v112)
      {
        size_t v113 = v112;
        for (isize_t i = 0LL; ii != v113; ++ii)
        {
          xpc_array_get_uint64(v111, ii);
          if (v3) {
            PBRepeatedInt32Add();
          }
        }
      }
    }
  }

  return v3;
}

- (void)setAllowUnusableAddresses:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_unusable_addresses(v4, v3);
}

- (BOOL)allowUnusableAddresses
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char allow_unusable_addresses = nw_parameters_get_allow_unusable_addresses(v2);

  return allow_unusable_addresses;
}

- (void)setPreferNoProxy:(BOOL)a3
{
  id v4 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prefer_no_proxy(v4, a3);
}

- (BOOL)preferNoProxy
{
  id v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  prefer_char no_proxy = nw_parameters_get_prefer_no_proxy(v2);

  return prefer_no_proxy;
}

- (void)setHttpsProxyIsOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_https_proxy_is_opaque(v4, v3);
}

- (BOOL)httpsProxyIsOpaque
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char is_opaque = nw_parameters_get_https_proxy_is_opaque(v2);

  return is_opaque;
}

- (void)setHttpsProxyOverTLS:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_https_proxy_over_tls(v4, v3);
}

- (BOOL)httpsProxyOverTLS
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  https_proxy_over_char tls = nw_parameters_get_https_proxy_over_tls(v2);

  return https_proxy_over_tls;
}

- (void)setAttachProtocolListener:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_attach_protocol_listener(v4, v3);
}

- (BOOL)attachProtocolListener
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char attach_protocol_listener = nw_parameters_get_attach_protocol_listener(v2);

  return attach_protocol_listener;
}

- (void)setProhibitJoiningProtocols:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_joining_protocols(v4, v3);
}

- (BOOL)prohibitJoiningProtocols
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char prohibit_joining_protocols = nw_parameters_get_prohibit_joining_protocols(v2);

  return prohibit_joining_protocols;
}

- (void)setAllowJoiningConnectedFd:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_joining_connected_fd(v4, v3);
}

- (BOOL)allowJoiningConnectedFd
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char allow_joining_connected_fd = nw_parameters_get_allow_joining_connected_fd(v2);

  return allow_joining_connected_fd;
}

- (void)setAllowDuplicateStateUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_duplicate_state_updates(v4, v3);
}

- (BOOL)allowDuplicateStateUpdates
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char allow_duplicate_state_updates = nw_parameters_get_allow_duplicate_state_updates(v2);

  return allow_duplicate_state_updates;
}

- (OS_nw_parameters)internalParameters
{
  return (OS_nw_parameters *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInternalParameters:(id)a3
{
}

- (NSSet)SSLCipherSuitesInternal
{
  return self->_SSLCipherSuitesInternal;
}

- (void)setSSLCipherSuitesInternal:(id)a3
{
}

- (unint64_t)minimumSSLProtocolVersionInternal
{
  return self->_minimumSSLProtocolVersionInternal;
}

- (void)setMinimumSSLProtocolVersionInternal:(unint64_t)a3
{
  self->_minimumSSLProtocolVersionInternal = a3;
}

- (unint64_t)maximumSSLProtocolVersionInternal
{
  return self->_maximumSSLProtocolVersionInternal;
}

- (void)setMaximumSSLProtocolVersionInternal:(unint64_t)a3
{
  self->_maximumSSLProtocolVersionInternal = a3;
}

- (void).cxx_destruct
{
}

uint64_t __45__NWParameters_copyRequiredAgentsDescription__block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5 = a3;
  Class Class = object_getClass(v5);
  id v7 = (objc_class *)MEMORY[0x1895F92E8];
  if (Class == (Class)MEMORY[0x1895F92E8])
  {
    xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (object_getClass(v8) == v7)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      uint64_t v10 = xpc_string_get_string_ptr(v8);
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
        unsigned int v11 = ", ";
      }
      else {
        unsigned int v11 = "";
      }
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"%s%s:%s", v11, string_ptr, v10);
    }
  }

  return 1LL;
}

uint64_t __34__NWParameters_protocolTransforms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = -[NWProtocolTransform initWithCTransform:]( objc_alloc(&OBJC_CLASS___NWProtocolTransform),  "initWithCTransform:",  v4);

  [v3 addObject:v5];
  return 1LL;
}

uint64_t __25__NWParameters_parentIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2];
  [v2 addObject:v3];

  return 1LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NWParameters)parametersWithCParameters:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___NWParameters);
  id v5 = v3;
  BOOL v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]( (id *)objc_alloc(&OBJC_CLASS___NWConcrete_nw_parameters),  v5,  0,  0);

  id v7 = -[NWParameters initWithParameters:](v4, "initWithParameters:", v6);
  return v7;
}

+ (NWParameters)parametersWithProtocolBufferData:(id)a3
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  id v80 = a3;
  id v3 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___NWPBParameters), "initWithData:", v80);
  id v81 = v3;
  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v23 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
    int v24 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v98 = 0;
    if (__nwlog_fault(v24, &type, &v98))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v25 = (os_log_s *)(id)gLogObj;
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_181A5C000, v25, v26, "%{public}s [NWPBParameters initWithData:] failed", buf, 0xCu);
        }
      }

      else if (v98)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v25 = (os_log_s *)(id)gLogObj;
        os_log_type_t v77 = type;
        BOOL v78 = os_log_type_enabled(v25, type);
        if (backtrace_string)
        {
          if (v78)
          {
            *(_DWORD *)buf = 136446466;
            size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
            __int16 v106 = 2082;
            v107 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v25,  v77,  "%{public}s [NWPBParameters initWithData:] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          BOOL v27 = 0LL;
          if (!v24) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }

        if (v78)
        {
          *(_DWORD *)buf = 136446210;
          size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl( &dword_181A5C000,  v25,  v77,  "%{public}s [NWPBParameters initWithData:] failed, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v25 = (os_log_s *)(id)gLogObj;
        os_log_type_t v79 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          size_t v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl( &dword_181A5C000,  v25,  v79,  "%{public}s [NWPBParameters initWithData:] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

    BOOL v27 = 0LL;
    if (!v24)
    {
LABEL_21:
      uint64_t v9 = 0LL;
      goto LABEL_22;
    }

@end