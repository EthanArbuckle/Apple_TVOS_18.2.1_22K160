@interface NSPProxiedContentPath
+ (BOOL)supportsSecureCoding;
- (BOOL)allowFallback;
- (BOOL)fetchingSessionTickets;
- (BOOL)matchEgress:(id)a3;
- (BOOL)matchIngress:(id)a3;
- (BOOL)matchesMap:(id)a3;
- (BOOL)pathReady;
- (BOOL)proxiedContentAgentRegistered;
- (BOOL)unregisterResolverAgent;
- (NSArray)resolvedAddresses;
- (NSMutableArray)associatedMaps;
- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration;
- (NSPPrivacyProxyNetworkRegistration)quicRegistration;
- (NSPPrivacyProxyResolverInfo)resolver;
- (NSPProxiedContentPath)initWithCoder:(id)a3;
- (NSPProxiedContentPath)initWithDelegate:(id)a3 initialMap:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 resolver:(id)a7;
- (NSPProxiedContentPathDelegate)delegate;
- (NSPProxyTokenInfo)egressProxy;
- (NSPProxyTokenInfo)ingressProxy;
- (NSString)description;
- (NSUUID)fallbackAgentUUID;
- (NSUUID)quicAgentUUID;
- (NSUUID)resolverAgentUUID;
- (NWNetworkAgentRegistration)resolverRegistration;
- (id)bootstrapAddresses;
- (id)copyAddressesFromDoHAnswer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDoHMessageForQuery:(id)a3 name:(const char *)a4;
- (id)createDoHQueryForName:(const char *)a3 type:(unsigned __int16)a4;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)shortName;
- (void)addMap:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchResumableSessionTickets;
- (void)removeProxyAgents;
- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)resetFallbackProxyAgent;
- (void)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3;
- (void)resetResolverAgentForceUpdateDelegate:(BOOL)a3;
- (void)resetResumableSessionTickets;
- (void)setAssociatedMaps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEgressProxy:(id)a3;
- (void)setFallbackAgentUUID:(id)a3;
- (void)setFallbackRegistration:(id)a3;
- (void)setFetchingSessionTickets:(BOOL)a3;
- (void)setIngressProxy:(id)a3;
- (void)setProxiedContentAgentRegistered:(BOOL)a3;
- (void)setQuicAgentUUID:(id)a3;
- (void)setQuicRegistration:(id)a3;
- (void)setResolvedAddresses:(id)a3;
- (void)setResolver:(id)a3;
- (void)setResolverAgentUUID:(id)a3;
- (void)setResolverRegistration:(id)a3;
- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3;
- (void)startConnectionForSessionTicketsWithEndpoint:(id)a3 parameters:(id)a4 dohQueryType:(unsigned __int16)a5 completionHandler:(id)a6;
@end

@implementation NSPProxiedContentPath

- (NSPProxiedContentPath)initWithDelegate:(id)a3 initialMap:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 resolver:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NSPProxiedContentPath;
  v17 = -[NSPProxiedContentPath init](&v28, "init");
  v20 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    associatedMaps = v20->_associatedMaps;
    v20->_associatedMaps = v21;

    -[NSMutableArray addObject:](v20->_associatedMaps, "addObject:", v13);
    objc_storeStrong((id *)&v20->_ingressProxy, a5);
    objc_storeStrong((id *)&v20->_egressProxy, a6);
    objc_storeStrong((id *)&v20->_resolver, a7);
    v23 = v20;
  }

  else
  {
    uint64_t v25 = nplog_obj(0LL, v18, v19);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "[super init] failed", v27, 2u);
    }
  }

  return v20;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  v7 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  sub_100043E90(v7, v8, @"Ingress proxy", a3, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  sub_100043E90(v7, v9, @"Egress proxy", a3, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
  sub_100043E90(v7, v10, @"QUIC Agent UUID", a3, a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  sub_100043E90(v7, v11, @"Fallback Agent UUID", a3, a4);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  sub_100043E90(v7, v12, @"Resolver Agent UUID", a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NSPProxiedContentPath descriptionWithIndent:options:]( self,  "descriptionWithIndent:options:",  0LL,  14LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxiedContentPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___NSPProxiedContentPath;
  v5 = -[NSPProxiedContentPath init](&v36, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyTokenInfo) forKey:@"proxyPathIngressProxy"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyTokenInfo) forKey:@"proxyPathEgressProxy"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSPPrivacyProxyResolverInfo) forKey:@"proxyPathResolver"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    resolver = v5->_resolver;
    v5->_resolver = (NSPPrivacyProxyResolverInfo *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"proxyPathQUICAgentUUID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    quicAgentUUID = v5->_quicAgentUUID;
    v5->_quicAgentUUID = (NSUUID *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"proxyPathFallbackAgentUUID"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    fallbackAgentUUID = v5->_fallbackAgentUUID;
    v5->_fallbackAgentUUID = (NSUUID *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"proxyPathResolverAgentUUID"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    resolverAgentUUID = v5->_resolverAgentUUID;
    v5->_resolverAgentUUID = (NSUUID *)v22;

    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v25 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v24,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v26 forKey:@"proxyPathResolvedAddresses"]);
    resolvedAddresses = v5->_resolvedAddresses;
    v5->_resolvedAddresses = (NSArray *)v27;

    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSArray);
    v30 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v29,  objc_opt_class(&OBJC_CLASS___NSPPrivacyProxyProxiedContentMap),  0LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v31 forKey:@"proxyPathAssociatedMaps"]);

    if (v32)
    {
      v33 = (NSMutableArray *)[v32 mutableCopy];
      associatedMaps = v5->_associatedMaps;
      v5->_associatedMaps = v33;
    }

    if (v5->_resolver && v5->_resolverAgentUUID) {
      -[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:](v5, "resetResolverAgentForceUpdateDelegate:", 0LL);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  [v4 encodeObject:v5 forKey:@"proxyPathIngressProxy"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  [v4 encodeObject:v6 forKey:@"proxyPathEgressProxy"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
  [v4 encodeObject:v7 forKey:@"proxyPathResolver"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
  [v4 encodeObject:v8 forKey:@"proxyPathQUICAgentUUID"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  [v4 encodeObject:v9 forKey:@"proxyPathFallbackAgentUUID"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  [v4 encodeObject:v10 forKey:@"proxyPathResolverAgentUUID"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));
  [v4 encodeObject:v11 forKey:@"proxyPathResolvedAddresses"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
  [v4 encodeObject:v12 forKey:@"proxyPathAssociatedMaps"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPProxiedContentPath init]( +[NSPProxiedContentPath allocWithZone:](&OBJC_CLASS___NSPProxiedContentPath, "allocWithZone:", a3),  "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
  -[NSPProxiedContentPath setAssociatedMaps:](v4, "setAssociatedMaps:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  -[NSPProxiedContentPath setIngressProxy:](v4, "setIngressProxy:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  -[NSPProxiedContentPath setEgressProxy:](v4, "setEgressProxy:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
  -[NSPProxiedContentPath setResolver:](v4, "setResolver:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
  -[NSPProxiedContentPath setQuicAgentUUID:](v4, "setQuicAgentUUID:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  -[NSPProxiedContentPath setFallbackAgentUUID:](v4, "setFallbackAgentUUID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  -[NSPProxiedContentPath setResolverAgentUUID:](v4, "setResolverAgentUUID:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
  -[NSPProxiedContentPath setQuicRegistration:](v4, "setQuicRegistration:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
  -[NSPProxiedContentPath setFallbackRegistration:](v4, "setFallbackRegistration:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
  -[NSPProxiedContentPath setResolverRegistration:](v4, "setResolverRegistration:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));
  -[NSPProxiedContentPath setResolvedAddresses:](v4, "setResolvedAddresses:", v15);

  -[NSPProxiedContentPath setProxiedContentAgentRegistered:]( v4,  "setProxiedContentAgentRegistered:",  -[NSPProxiedContentPath proxiedContentAgentRegistered](self, "proxiedContentAgentRegistered"));
  return v4;
}

- (id)shortName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 dohURL]);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    id v4 = v6;
    if (v6) {
      id v6 = (void *)v6[3];
    }
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v6 vendor]);
  }

  uint64_t v7 = (void *)v5;

  return v7;
}

- (BOOL)matchesMap:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v10 = [v4 proxiesCount];
        if (v10 == [v9 proxiesCount])
        {
          unsigned int v11 = [v4 hasResolver];
          if (v11 == [v9 hasResolver])
          {
            unsigned int v12 = [v4 isPrivacyProxy];
            if (v12 == [v9 isPrivacyProxy])
            {
              unsigned int v13 = [v4 resolver];
              if (v13 == [v9 resolver])
              {
                if ([v4 proxiesCount])
                {
                  unint64_t v14 = 0LL;
                  do
                  {
                    LODWORD(v6) = *((_DWORD *)[v4 proxies] + v14);
                    LOBYTE(v6) = (_DWORD)v6 == *((_DWORD *)[v9 proxies] + v14);
                    if (!(_BYTE)v6) {
                      break;
                    }
                    ++v14;
                  }

                  while (v14 < (unint64_t)[v4 proxiesCount]);
                }

                else
                {
                  LOBYTE(v6) = 1;
                }

                goto LABEL_20;
              }
            }
          }
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)addMap:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
  [v5 addObject:v4];
}

- (BOOL)matchIngress:(id)a3
{
  id v6 = (id *)a3;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));

    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      id v9 = (void *)v8;
      if (v8) {
        id v10 = *(void **)(v8 + 24);
      }
      else {
        id v10 = 0LL;
      }
      id v11 = v10;
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 proxyURL]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
      LOBYTE(v7) = [v12 isEqualToString:v13];
    }
  }

  else
  {
    uint64_t v15 = nplog_obj(0LL, v4, v5);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      __int128 v18 = "-[NSPProxiedContentPath matchIngress:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  (uint8_t *)&v17,  0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (BOOL)matchEgress:(id)a3
{
  id v6 = (id *)a3;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));

    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
      id v9 = (void *)v8;
      if (v8) {
        id v10 = *(void **)(v8 + 24);
      }
      else {
        id v10 = 0LL;
      }
      id v11 = v10;
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 proxyURL]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
      LOBYTE(v7) = [v12 isEqualToString:v13];
    }
  }

  else
  {
    uint64_t v15 = nplog_obj(0LL, v4, v5);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      __int128 v18 = "-[NSPProxiedContentPath matchEgress:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  (uint8_t *)&v17,  0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (id *)a3;
  __int128 buffer = 0u;
  memset(v46, 0, sizeof(v46));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  unsigned int v12 = v9;
  if (!v9)
  {
    unsigned int v13 = 0LL;
    goto LABEL_7;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v9));
  unsigned int v13 = v9;
  if (!v9)
  {
LABEL_7:
    id v21 = 0LL;
    unint64_t v14 = 0LL;
    goto LABEL_13;
  }

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 interface]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 parameters]);
  int v16 = [v15 pid];
  if (!v16)
  {
LABEL_11:
    id v21 = 0LL;
    goto LABEL_12;
  }

  int v17 = v16;
  uint64_t v18 = proc_pidinfo(v16, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v18 != 64)
  {
    uint64_t v22 = nplog_obj(v18, v19, v20);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v37 = 67109120;
      int v38 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to process name",  (uint8_t *)&v37,  8u);
    }

    goto LABEL_11;
  }

  id v21 = (const char *)v46;
LABEL_12:

LABEL_13:
  uint64_t v24 = nplog_obj(v9, v10, v11);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v21) {
      v26 = v21;
    }
    else {
      v26 = "none";
    }
    uint64_t v27 = sub_100044D90(v8);
    objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v14 interfaceName]);
    int v37 = 67109890;
    int v38 = v6;
    __int16 v39 = 2080;
    v40 = v26;
    __int16 v41 = 2112;
    v42 = v28;
    __int16 v43 = 2112;
    v44 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Received error (%d) from %s for content-specific %@ agent on interface %@",  (uint8_t *)&v37,  0x26u);
  }

  if ((_DWORD)v6)
  {
    if ((_DWORD)v6 == 1303)
    {
      uint64_t v33 = nplog_obj(v30, v31, v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Flushing resolved addresses",  (uint8_t *)&v37,  2u);
      }

      -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", 0LL);
      -[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:]( self,  "resetQUICProxyAgentForceUpdateDelegate:",  0LL);
      -[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:]( self,  "resetResolverAgentForceUpdateDelegate:",  0LL);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
      [v35 updateUserEventAgentData];
    }

    else if ((_DWORD)v6 == 35)
    {
      -[NSPProxiedContentPath resetResumableSessionTickets](self, "resetResumableSessionTickets");
    }

    objc_super v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
    [v36 reportProxiedContentPathError:v6 interface:v14 proxiedContentPath:self registration:v8];
  }
}

- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id v7 = a3;
  __int128 buffer = 0u;
  memset(v38, 0, sizeof(v38));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  uint64_t v11 = v8;
  if (!v8)
  {
    unsigned int v12 = 0LL;
    goto LABEL_7;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v8));
  unsigned int v12 = v8;
  if (!v8)
  {
LABEL_7:
    uint64_t v20 = 0LL;
    unsigned int v13 = 0LL;
    goto LABEL_13;
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 interface]);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 parameters]);
  int v15 = [v14 pid];
  if (!v15)
  {
LABEL_11:
    uint64_t v20 = 0LL;
    goto LABEL_12;
  }

  int v16 = v15;
  uint64_t v17 = proc_pidinfo(v15, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v17 != 64)
  {
    uint64_t v21 = nplog_obj(v17, v18, v19);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v29 = 67109120;
      int v30 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to process name",  (uint8_t *)&v29,  8u);
    }

    goto LABEL_11;
  }

  uint64_t v20 = (const char *)v38;
LABEL_12:

LABEL_13:
  uint64_t v23 = nplog_obj(v8, v9, v10);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v20) {
      uint64_t v25 = v20;
    }
    else {
      uint64_t v25 = "none";
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue([v7 resolver]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dohURL]);
    objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v13 interfaceName]);
    int v29 = 67109890;
    int v30 = a4;
    __int16 v31 = 2080;
    uint64_t v32 = v25;
    __int16 v33 = 2112;
    v34 = v27;
    __int16 v35 = 2112;
    objc_super v36 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received error (%d) from %s for content-specific %@ resolver agent on interface %@",  (uint8_t *)&v29,  0x26u);
  }
}

- (BOOL)pathReady
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  if (sub_10000C67C((uint64_t)v3))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    unint64_t v5 = sub_10000E688((uint64_t)v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    unint64_t v7 = sub_10000F2E8((uint64_t)v6);

    if (v5 <= v7)
    {
      uint64_t v11 = nplog_obj(v8, v9, v10);
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
        uint64_t v14 = sub_10000E688((uint64_t)v13);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
        int v32 = 134218498;
        uint64_t v33 = v14;
        __int16 v34 = 2112;
        __int16 v35 = v15;
        __int16 v36 = 2048;
        uint64_t v37 = sub_10000F2E8((uint64_t)v16);
        uint64_t v17 = "proxied content path is not ready due to insufficient ingress proxy tokens (cache+agent: %lu) for [%@], (i"
              "ngress proxy low-water mark: %lu)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v32, 0x20u);

        goto LABEL_11;
      }

      goto LABEL_11;
    }
  }

  else
  {
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  if (sub_10000C67C((uint64_t)v18))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    unint64_t v20 = sub_10000E688((uint64_t)v19);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    unint64_t v22 = sub_10000F2E8((uint64_t)v21);

    if (v20 <= v22)
    {
      uint64_t v26 = nplog_obj(v23, v24, v25);
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
        uint64_t v27 = sub_10000E688((uint64_t)v13);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
        int v32 = 134218498;
        uint64_t v33 = v27;
        __int16 v34 = 2112;
        __int16 v35 = v15;
        __int16 v36 = 2048;
        uint64_t v37 = sub_10000F2E8((uint64_t)v16);
        uint64_t v17 = "proxied content path is not ready due to insufficient egress proxy tokens (cache+agent: %lu) for [%@], (eg"
              "ress proxy low-water mark: %lu)";
        goto LABEL_10;
      }

- (BOOL)allowFallback
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  uint64_t v4 = (void *)v3;
  if (v3) {
    unint64_t v5 = *(void **)(v3 + 24);
  }
  else {
    unint64_t v5 = 0LL;
  }
  id v6 = v5;
  if ([v6 supportsFallback])
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      uint64_t v9 = v8;
      if (v8) {
        uint64_t v8 = (void *)v8[3];
      }
      unsigned __int8 v10 = [v8 supportsFallback];
    }

    else
    {
      unsigned __int8 v10 = 1;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)resetResumableSessionTickets
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
  id v6 = (id *)v3;
  if (v3)
  {
    uint64_t v7 = nplog_obj(v3, v4, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Flushing session tickets for proxied content path [%@]",  (uint8_t *)&v10,  0xCu);
    }

    [v6[3] flushTokens];
    -[NSPProxiedContentPath fetchResumableSessionTickets](self, "fetchResumableSessionTickets");
  }
}

- (id)createDoHQueryForName:(const char *)a3 type:(unsigned __int16)a4
{
  if (!a3)
  {
    uint64_t v8 = nplog_obj(self, a2, 0LL, a4);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buffer[0]) = 136315138;
      *(void *)((char *)buffer + 4) = "-[NSPProxiedContentPath createDoHQueryForName:type:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null name",  (uint8_t *)buffer,  0xCu);
    }

    goto LABEL_9;
  }

  uint64_t v4 = a4;
  memset(v13, 0, 256);
  int v5 = DomainNameFromString(v13, a3, 0LL);
  dispatch_data_t v6 = 0LL;
  if (!v5)
  {
    memset(buffer, 0, sizeof(buffer));
    size_t size = 0LL;
    int v7 = DNSMessageWriteQuery(0LL, 256LL, v13, v4, 1LL, buffer, &size);
    dispatch_data_t v6 = 0LL;
    if (!v7)
    {
      if (size)
      {
        dispatch_data_t v6 = dispatch_data_create(buffer, size, 0LL, 0LL);
        return v6;
      }

- (id)createDoHMessageForQuery:(id)a3 name:(const char *)a4
{
  int v5 = (dispatch_data_s *)a3;
  dispatch_data_t v6 = nw_content_context_create("DoH Message");
  metadata = (nw_protocol_metadata *)nw_http_create_metadata();
  nw_http_metadata_set_method(metadata, 3LL);
  nw_http_metadata_set_path(metadata, "/dns-query");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%s/dns-query",  a4));
  nw_endpoint_t url = nw_endpoint_create_url((const char *)[v8 UTF8String]);
  nw_http_metadata_set_endpoint(metadata, url);

  nw_http_metadata_add_header(metadata, "accept", "application/dns-message");
  nw_http_metadata_add_header(metadata, "content-type", "application/dns-message");
  size_t size = dispatch_data_get_size(v5);

  *(void *)__str = 0LL;
  uint64_t v13 = 0LL;
  snprintf(__str, 0x10uLL, "%zu", size);
  nw_http_metadata_add_header(metadata, "content-length", __str);
  nw_content_context_set_metadata_for_protocol(v6, metadata);
  nw_content_context_set_is_final(v6, 1);

  return v6;
}

- (id)copyAddressesFromDoHAnswer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v3)
  {
    int AnswerSection = 0;
    unint64_t v20 = 0LL;
    uint64_t v5 = DNSMessageCollapse([v3 bytes], objc_msgSend(v3, "length"), &v20, &AnswerSection);
    dispatch_data_t v6 = (void *)v5;
    if (!AnswerSection && v5 && v20 > 0xB)
    {
      unsigned int v7 = __rev16(*(unsigned __int16 *)(v5 + 6));
      if (v7)
      {
        uint64_t v19 = 0LL;
        int AnswerSection = DNSMessageGetAnswerSection(v5);
        if (!AnswerSection)
        {
          int v8 = 0;
          uint64_t v18 = v19;
          while (1)
          {
            uint64_t v16 = 0LL;
            uint64_t v17 = 0LL;
            int v15 = 0;
            __int16 v14 = 0;
            int AnswerSection = DNSMessageExtractRecord(v6, v20, v18, 0LL, &v14, 0LL, &v15, &v17, &v16, &v18);
            if (AnswerSection) {
              goto LABEL_24;
            }
            if (v14 == 28)
            {
              address[0] = (sockaddr)xmmword_1000C3754;
              *(_OWORD *)&address[0].sa_data[10] = *(__int128 *)((char *)&xmmword_1000C3754 + 12);
              if (v17 && v16 == 16)
              {
                *(sockaddr *)&address[0].sa_data[6] = *v17;
LABEL_17:
                uint64_t v9 = nw_endpoint_create_address(address);
                int v10 = v9;
                if (v9)
                {
                  hostname = nw_endpoint_get_hostname(v9);
                  if (hostname)
                  {
                    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  hostname));
                    -[NSMutableArray addObject:](v4, "addObject:", v12);
                  }
                }
              }
            }

            else if (v14 == 1)
            {
              address[0] = (sockaddr)xmmword_1000C37D0;
              if (v17)
              {
                if (v16 == 4)
                {
                  *(_DWORD *)&address[0].sa_data[2] = *(_DWORD *)&v17->sa_len;
                  goto LABEL_17;
                }
              }
            }

            if (++v8 >= v7) {
              goto LABEL_24;
            }
          }
        }
      }

      goto LABEL_24;
    }

    if (v5) {
LABEL_24:
    }
      free(v6);
  }

  return v4;
}

- (void)startConnectionForSessionTicketsWithEndpoint:(id)a3 parameters:(id)a4 dohQueryType:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v7 = a5;
  int v10 = (nw_endpoint *)a3;
  uint64_t v11 = (nw_parameters *)a4;
  id v12 = a6;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  __int16 v31 = sub_10000CED4;
  int v32 = sub_10000CEE4;
  nw_connection_t v33 = nw_connection_create(v10, v11);
  uint64_t v13 = (nw_connection *)v29[5];
  uint64_t v14 = NPGetInternalQueue(v33);
  int v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  nw_connection_set_queue(v13, v15);

  uint64_t v16 = v29[5];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100015FA0;
  v27[3] = &unk_1000F98D8;
  v27[4] = &v28;
  nw_connection_set_event_handler(v16, v27);
  hostname = nw_endpoint_get_hostname(v10);
  uint64_t v18 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue( -[NSPProxiedContentPath createDoHQueryForName:type:]( self,  "createDoHQueryForName:type:",  hostname,  v7));
  uint64_t v19 = (nw_content_context *)objc_claimAutoreleasedReturnValue( -[NSPProxiedContentPath createDoHMessageForQuery:name:]( self,  "createDoHMessageForQuery:name:",  v18,  hostname));
  nw_connection_send((nw_connection_t)v29[5], v18, v19, 1, _nw_connection_send_idempotent_content);
  nw_connection_start((nw_connection_t)v29[5]);
  objc_initWeak(&location, self);
  unint64_t v20 = (nw_connection *)v29[5];
  completion[0] = _NSConcreteStackBlock;
  completion[1] = 3221225472LL;
  completion[2] = sub_1000160B4;
  completion[3] = &unk_1000F9900;
  objc_copyWeak(&v25, &location);
  id v21 = v12;
  id v23 = v21;
  uint64_t v24 = &v28;
  nw_connection_receive_message(v20, completion);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v28, 8);
}

- (id)bootstrapAddresses
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  }
  uint64_t v5 = (void *)v4;

  if (v5) {
    dispatch_data_t v6 = (void *)v5[3];
  }
  else {
    dispatch_data_t v6 = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bootstrapAddresses]);
  if ([v7 count]) {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingComparator:&stru_1000F9940]);
  }
  else {
    int v8 = 0LL;
  }

  return v8;
}

- (void)fetchResumableSessionTickets
{
  if (!-[NSPProxiedContentPath fetchingSessionTickets](self, "fetchingSessionTickets"))
  {
    -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
    selfa = v3;
    if (v3)
    {
      id v5 = objc_getProperty(v3, v4, 48LL, 1);
      if (v5)
      {
        int v66 = 4;
        nw_protocol_definition_t v6 = nw_protocol_copy_tcp_definition();
        id v44 = v5;
        __int16 v41 = (void *)nw_proxy_config_copy_protocol_stack(v5, v6, &v66);

        if (v41)
        {
          endpoint = (nw_endpoint *)nw_proxy_config_copy_endpoint(v5);
          if (endpoint)
          {
            id v12 = (nw_parameters *)nw_proxy_config_copy_parameters_to_proxy(v5);
            int v15 = v12;
            if (v12)
            {
              stack = nw_parameters_copy_default_protocol_stack(v12);
              if (stack)
              {
                os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath bootstrapAddresses](self, "bootstrapAddresses"));
                if (-[os_log_s count](oslog, "count")
                  && (nw_endpoint_get_type(endpoint) == nw_endpoint_type_host || nw_endpoint_get_type(endpoint) == 4))
                {
                  uint64_t port = nw_endpoint_get_port(endpoint);
                  direct = (void *)nw_proxy_config_create_direct();
                  nw_proxy_config_set_prohibit_direct(direct, 1LL);
                  __int128 v64 = 0u;
                  __int128 v65 = 0u;
                  __int128 v62 = 0u;
                  __int128 v63 = 0u;
                  unint64_t v20 = oslog;
                  id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v62,  v72,  16LL);
                  if (v21)
                  {
                    char v22 = 0;
                    uint64_t v23 = *(void *)v63;
                    do
                    {
                      for (i = 0LL; i != v21; i = (char *)i + 1)
                      {
                        if (*(void *)v63 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        host_with_numeric_uint64_t port = (nw_endpoint *)nw_endpoint_create_host_with_numeric_port( objc_msgSend( *(id *)(*((void *)&v62 + 1) + 8 * (void)i),  "UTF8String",  v41),  port);
                        uint64_t v26 = host_with_numeric_port;
                        if (host_with_numeric_port
                          && nw_endpoint_get_type(host_with_numeric_port) == nw_endpoint_type_address)
                        {
                          nw_proxy_config_add_resolved_endpoint(direct, v26);
                          char v22 = 1;
                        }
                      }

                      id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v62,  v72,  16LL);
                    }

                    while (v21);

                    if ((v22 & 1) != 0) {
                      nw_parameters_add_custom_proxy_config(v15, direct);
                    }
                  }

                  else
                  {
                  }
                }

                nw_parameters_set_fast_open_enabled(v15, 1);
                uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
                uint64_t v28 = (void *)v27;
                if (v27) {
                  uint64_t v29 = *(void **)(v27 + 24);
                }
                else {
                  uint64_t v29 = 0LL;
                }
                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "proxyURL", v41));

                nw_endpoint_t url = nw_endpoint_create_url((const char *)[v30 UTF8String]);
                nw_parameters_set_url_endpoint(v15, url);

                objc_initWeak(&location, self);
                iterate_block[0] = _NSConcreteStackBlock;
                iterate_block[1] = 3221225472LL;
                iterate_block[2] = sub_100016950;
                iterate_block[3] = &unk_1000F9990;
                objc_copyWeak(&v60, &location);
                nw_protocol_stack_iterate_application_protocols(stack, iterate_block);
                -[NSPProxiedContentPath setFetchingSessionTickets:](self, "setFetchingSessionTickets:", 1LL);
                *(void *)&__int128 buf = 0LL;
                *((void *)&buf + 1) = &buf;
                uint64_t v68 = 0x3032000000LL;
                v69 = sub_10000CED4;
                v70 = sub_10000CEE4;
                id v71 = (id)os_transaction_create("com.apple.networkserviceproxy.fetchResumableSessionTickets");
                int v32 = dispatch_group_create();
                dispatch_group_enter(v32);
                v57[0] = 0LL;
                v57[1] = v57;
                v57[2] = 0x3032000000LL;
                v57[3] = sub_10000CED4;
                v57[4] = sub_10000CEE4;
                id v58 = &__NSArray0__struct;
                v55[0] = 0LL;
                v55[1] = v55;
                v55[2] = 0x3032000000LL;
                v55[3] = sub_10000CED4;
                v55[4] = sub_10000CEE4;
                id v56 = &__NSArray0__struct;
                v52[0] = _NSConcreteStackBlock;
                v52[1] = 3221225472LL;
                v52[2] = sub_100016B70;
                v52[3] = &unk_1000F99B8;
                v54 = v57;
                nw_connection_t v33 = v32;
                v53 = v33;
                -[NSPProxiedContentPath startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:]( self,  "startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:",  endpoint,  v15,  1LL,  v52);
                dispatch_group_enter(v33);
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472LL;
                v49[2] = sub_100016BC8;
                v49[3] = &unk_1000F99B8;
                v51 = v55;
                __int16 v34 = v33;
                v50 = v34;
                uint64_t v35 = NPGetInternalQueue( -[NSPProxiedContentPath startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:]( self,  "startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:",  endpoint,  v15,  28LL,  v49));
                __int16 v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v35);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_100016C20;
                block[3] = &unk_1000F99E0;
                block[4] = &buf;
                objc_copyWeak(&v48, &location);
                block[5] = v55;
                block[6] = v57;
                dispatch_group_notify(v34, v36, block);

                objc_destroyWeak(&v48);
                _Block_object_dispose(v55, 8);

                _Block_object_dispose(v57, 8);
                _Block_object_dispose(&buf, 8);

                objc_destroyWeak(&v60);
                objc_destroyWeak(&location);
              }

              else
              {
                uint64_t v40 = nplog_obj(0LL, v16, v17);
                os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(buf) = 136315138;
                  *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
                  _os_log_fault_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_FAULT,  "%s called with null proxyStack",  (uint8_t *)&buf,  0xCu);
                }
              }
            }

            else
            {
              uint64_t v39 = nplog_obj(0LL, v13, v14);
              stack = (nw_protocol_stack *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(stack, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 136315138;
                *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
                _os_log_fault_impl( (void *)&_mh_execute_header,  stack,  OS_LOG_TYPE_FAULT,  "%s called with null proxyParameters",  (uint8_t *)&buf,  0xCu);
              }
            }
          }

          else
          {
            uint64_t v38 = nplog_obj(0LL, v10, v11);
            int v15 = (nw_parameters *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              LODWORD(buf) = 136315138;
              *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
              _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "%s called with null proxyEndpoint",  (uint8_t *)&buf,  0xCu);
            }
          }
        }

        else
        {
          uint64_t v37 = nplog_obj(v7, v8, v9);
          endpoint = (nw_endpoint *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(endpoint, OS_LOG_TYPE_FAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
            _os_log_fault_impl( (void *)&_mh_execute_header,  endpoint,  OS_LOG_TYPE_FAULT,  "%s called with null stack",  (uint8_t *)&buf,  0xCu);
          }
        }

        id v5 = v44;
      }

      id v3 = selfa;
    }
  }

- (void)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));

    if (!v5)
    {
      nw_protocol_definition_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      -[NSPProxiedContentPath setQuicAgentUUID:](self, "setQuicAgentUUID:", v6);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));

    if (!v7)
    {
      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyProxiedContentNetworkRegistration);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
      uint64_t v11 = sub_100048EB4((id *)&v8->super.super.isa, v9, (uint64_t)v10, self);
      -[NSPProxiedContentPath setQuicRegistration:](self, "setQuicRegistration:", v11);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
      if (!v12)
      {
        uint64_t v80 = nplog_obj(v13, v14, v15);
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          v108 = "-[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_FAULT,  "%s called with null self.quicRegistration",  buf,  0xCu);
        }

        goto LABEL_85;
      }
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      uint64_t v18 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
      if (!v18)
      {
        v99 = 0LL;
        v106 = 0LL;
        goto LABEL_10;
      }

      uint64_t v19 = (void *)v18;
      unsigned int v20 = [*(id *)(v18 + 24) isRegistered];

      if (v20)
      {
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
        id v21 = sub_100045BD0((uint64_t)v17);
        v99 = (void *)objc_claimAutoreleasedReturnValue(v21);
LABEL_10:

        goto LABEL_12;
      }
    }

    v99 = 0LL;
    v106 = 0LL;
LABEL_12:
    char v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
    unsigned int v23 = [v22 disableDoHBootstrapResults];

    if (v23)
    {
      -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", 0LL);
    }

    else
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));

      if (!v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath bootstrapAddresses](self, "bootstrapAddresses"));
        -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", v25);
      }
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    if (v26) {
      uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    }
    else {
      uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    }
    uint64_t v28 = v27;

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    if (v29) {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    }
    else {
      uint64_t v30 = 0LL;
    }

    __int16 v31 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
    id v32 = sub_100045BD0((uint64_t)v31);
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    sub_100044E8C(v31, 4LL);
    if (v28) {
      __int16 v34 = *(void **)(v28 + 24);
    }
    else {
      __int16 v34 = 0LL;
    }
    id v35 = v34;
    v105 = (void *)objc_claimAutoreleasedReturnValue([v35 proxyURL]);
    if (v30) {
      __int16 v36 = (void *)v30[3];
    }
    else {
      __int16 v36 = 0LL;
    }
    id v37 = v36;
    v104 = (void *)objc_claimAutoreleasedReturnValue([v37 proxyURL]);
    if (v28) {
      uint64_t v38 = *(void **)(v28 + 24);
    }
    else {
      uint64_t v38 = 0LL;
    }
    id v39 = v38;
    v103 = (void *)objc_claimAutoreleasedReturnValue([v39 proxyKeyInfos]);
    if (v30) {
      uint64_t v40 = (void *)v30[3];
    }
    else {
      uint64_t v40 = 0LL;
    }
    id v41 = v40;
    v102 = (void *)objc_claimAutoreleasedReturnValue([v41 proxyKeyInfos]);
    if (v28) {
      v42 = *(void **)(v28 + 24);
    }
    else {
      v42 = 0LL;
    }
    id v43 = v42;
    v101 = (void *)objc_claimAutoreleasedReturnValue([v43 proxyVersion]);
    if (v30) {
      id v44 = (void *)v30[3];
    }
    else {
      id v44 = 0LL;
    }
    id v89 = v44;
    v100 = (void *)objc_claimAutoreleasedReturnValue([v89 proxyVersion]);
    if (v28) {
      v45 = *(void **)(v28 + 24);
    }
    else {
      v45 = 0LL;
    }
    id v88 = v45;
    int v85 = [v88 supportsResumption];
    if (v30) {
      v46 = (void *)v30[3];
    }
    else {
      v46 = 0LL;
    }
    id v87 = v46;
    char v84 = [v87 supportsResumption];
    BOOL v86 = sub_10000C67C(v28);
    if (v86)
    {
      if (v28) {
        v47 = *(void **)(v28 + 48);
      }
      else {
        v47 = 0LL;
      }
      id v98 = v47;
    }

    else
    {
      id v98 = 0LL;
    }

    BOOL v83 = sub_10000C67C((uint64_t)v30);
    if (v83)
    {
      if (v30) {
        id v48 = (void *)v30[6];
      }
      else {
        id v48 = 0LL;
      }
      id v82 = v48;
    }

    else
    {
      id v82 = 0LL;
    }

    v94 = v35;
    v92 = v39;
    if (v28) {
      v49 = *(void **)(v28 + 24);
    }
    else {
      v49 = 0LL;
    }
    id v50 = v49;
    uint64_t v51 = objc_claimAutoreleasedReturnValue([v50 tokenChallenge]);
    v52 = (void *)v51;
    v97 = (void *)v28;
    v95 = (void *)v33;
    v93 = v37;
    v90 = v43;
    v91 = v41;
    v53 = v31;
    if (v30) {
      v54 = (void *)v30[3];
    }
    else {
      v54 = 0LL;
    }
    char v55 = v51 != 0;
    id v56 = v54;
    v57 = (void *)objc_claimAutoreleasedReturnValue([v56 tokenChallenge]);
    id v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));
    v96 = self;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
    id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 firstObject]);
    sub_100048F60( v53,  v105,  v104,  v103,  v102,  v101,  v100,  v85,  v84,  v98,  v82,  v55,  v57 != 0,  v58,  v106,  v99,  (char)[v60 isPrivacyProxy]);

    if (v83) {
    if (v86)
    }

    id v61 = sub_100045BD0((uint64_t)v53);
    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    uint64_t v63 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](v96, "resolver"));
    if (v63)
    {
      __int128 v64 = (void *)v63;
      unsigned __int8 v65 = [v62 isEqualToData:v95];

      if ((v65 & 1) == 0) {
        -[NSPProxiedContentPath unregisterResolverAgent](v96, "unregisterResolverAgent");
      }
    }

    if (v97) {
      int v66 = (void *)v97[3];
    }
    else {
      int v66 = 0LL;
    }
    id v67 = [v66 supportsResumption];
    if ((_DWORD)v67)
    {
      if (v53)
      {
        id v67 = [v53[3] tokenCount];
        unint64_t v70 = v67;
      }

      else
      {
        unint64_t v70 = 0LL;
      }

      uint64_t v71 = nplog_obj(v67, v68, v69);
      v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      v73 = v72;
      if (v70 > 3)
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          v79 = (char *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](v96, "shortName"));
          *(_DWORD *)__int128 buf = 138412546;
          v108 = v79;
          __int16 v109 = 1024;
          int v110 = v70;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEBUG,  "proxied content path [%@] has %u tickets, not fetching more",  buf,  0x12u);
        }
      }

      else
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v74 = (char *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](v96, "shortName"));
          *(_DWORD *)__int128 buf = 138412546;
          v108 = v74;
          __int16 v109 = 1024;
          int v110 = v70;
          _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "proxied content path [%@] has %u tickets, fetching more",  buf,  0x12u);
        }

        -[NSPProxiedContentPath fetchResumableSessionTickets](v96, "fetchResumableSessionTickets");
      }
    }

    uint64_t v75 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](v96, "resolver"));
    if (v75)
    {
      v76 = (void *)v75;
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](v96, "resolverRegistration"));
      if (([v77 isRegistered] & 1) == 0)
      {

LABEL_83:
        goto LABEL_84;
      }

      if ((v81 & 1) != 0)
      {
      }

      else
      {
        unsigned __int8 v78 = -[NSPProxiedContentPath proxiedContentAgentRegistered](v96, "proxiedContentAgentRegistered");

        if ((v78 & 1) != 0)
        {
LABEL_84:

LABEL_85:
          return;
        }
      }
    }

    else if ((v81 & 1) == 0 {
           && -[NSPProxiedContentPath proxiedContentAgentRegistered](v96, "proxiedContentAgentRegistered"))
    }
    {
      goto LABEL_84;
    }

    -[NSPProxiedContentPath setProxiedContentAgentRegistered:](v96, "setProxiedContentAgentRegistered:", 1LL);
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](v96, "delegate"));
    [v76 proxiedContentAgentRegistered:v96];
    goto LABEL_83;
  }

- (void)resetFallbackProxyAgent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));

  if (v3 && -[NSPProxiedContentPath allowFallback](self, "allowFallback"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));

    if (!v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      -[NSPProxiedContentPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", v5);
    }

    nw_protocol_definition_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));

    if (v6) {
      goto LABEL_7;
    }
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyProxiedContentFallbackNetworkRegistration);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
    uint64_t v10 = sub_100049A04((id *)&v7->super.super.isa, v8, (uint64_t)v9, self);
    -[NSPProxiedContentPath setFallbackRegistration:](self, "setFallbackRegistration:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
    if (v11)
    {
LABEL_7:
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      if (v15) {
        uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      }
      else {
        uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
      }
      unint64_t v70 = (void *)v16;

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      if (v17) {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
      }
      else {
        uint64_t v18 = 0LL;
      }

      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
      if (v70) {
        unsigned int v20 = (void *)v70[3];
      }
      else {
        unsigned int v20 = 0LL;
      }
      id v21 = v20;
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 tcpProxyFqdn]);
      if (v18) {
        unsigned int v23 = (void *)v18[3];
      }
      else {
        unsigned int v23 = 0LL;
      }
      id v24 = v23;
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 tcpProxyFqdn]);
      if (v70) {
        uint64_t v26 = (void *)v70[3];
      }
      else {
        uint64_t v26 = 0LL;
      }
      id v27 = v26;
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 proxyKeyInfos]);
      if (v18) {
        uint64_t v29 = (void *)v18[3];
      }
      else {
        uint64_t v29 = 0LL;
      }
      id v30 = v29;
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v30 proxyKeyInfos]);
      if (v70) {
        __int16 v31 = (void *)v70[3];
      }
      else {
        __int16 v31 = 0LL;
      }
      id v60 = v31;
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v60 proxyVersion]);
      if (v18) {
        id v32 = (void *)v18[3];
      }
      else {
        id v32 = 0LL;
      }
      id v59 = v32;
      id v67 = (void *)objc_claimAutoreleasedReturnValue([v59 proxyVersion]);
      if (v70) {
        uint64_t v33 = (void *)v70[3];
      }
      else {
        uint64_t v33 = 0LL;
      }
      id v58 = v33;
      int v55 = [v58 supportsResumption];
      if (v18) {
        __int16 v34 = (void *)v18[3];
      }
      else {
        __int16 v34 = 0LL;
      }
      id v57 = v34;
      char v54 = [v57 supportsResumption];
      BOOL v56 = sub_10000C67C((uint64_t)v70);
      if (v56)
      {
        if (v70) {
          id v35 = (void *)v70[6];
        }
        else {
          id v35 = 0LL;
        }
        id v66 = v35;
      }

      else
      {
        id v66 = 0LL;
      }

      BOOL v53 = sub_10000C67C((uint64_t)v18);
      if (v53)
      {
        if (v18) {
          __int16 v36 = (void *)v18[6];
        }
        else {
          __int16 v36 = 0LL;
        }
        id v37 = v36;
      }

      else
      {
        id v37 = 0LL;
      }

      uint64_t v63 = v27;
      v52 = v37;
      if (v70) {
        uint64_t v38 = (void *)v70[3];
      }
      else {
        uint64_t v38 = 0LL;
      }
      id v51 = v38;
      uint64_t v39 = objc_claimAutoreleasedReturnValue([v51 tokenChallenge]);
      uint64_t v40 = (void *)v39;
      unsigned __int8 v65 = v21;
      __int128 v64 = (void *)v25;
      id v61 = v30;
      __int128 v62 = (void *)v28;
      id v41 = (void *)v22;
      v42 = (void *)v19;
      if (v18) {
        id v43 = (void *)v18[3];
      }
      else {
        id v43 = 0LL;
      }
      char v44 = v39 != 0;
      id v45 = v43;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 tokenChallenge]);
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
      id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);
      sub_100049AB0( (uint64_t)v42,  v41,  v64,  v62,  v69,  v68,  v67,  v55,  v54,  v66,  v52,  v44,  v46 != 0,  (char)[v48 isPrivacyProxy]);

      if (v53) {
      if (v56)
      }
    }

    else
    {
      uint64_t v49 = nplog_obj(v12, v13, v14);
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        v72 = "-[NSPProxiedContentPath resetFallbackProxyAgent]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_FAULT,  "%s called with null self.fallbackRegistration",  buf,  0xCu);
      }
    }
  }

- (void)resetResolverAgentForceUpdateDelegate:(BOOL)a3
{
  nw_protocol_definition_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));

    if (!v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      -[NSPProxiedContentPath setResolverAgentUUID:](self, "setResolverAgentUUID:", v8);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));

    if (!v9)
    {
      uint64_t v10 = -[NWNetworkAgentRegistration initWithNetworkAgentClass:]( objc_alloc(&OBJC_CLASS___NWNetworkAgentRegistration),  "initWithNetworkAgentClass:",  objc_opt_class(&OBJC_CLASS___NSPPrivacyProxyDNSAgent));
      -[NSPProxiedContentPath setResolverRegistration:](self, "setResolverRegistration:", v10);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      if (!v11)
      {
        uint64_t v111 = nplog_obj(v12, v13, v14);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "%s called with null self.resolverRegistration",  buf,  0xCu);
        }

        goto LABEL_59;
      }
    }

    uint64_t v15 = -[NSPPrivacyProxyDNSAgent initWithDelegate:]( objc_alloc(&OBJC_CLASS___NSPPrivacyProxyDNSAgent),  "initWithDelegate:",  self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
    -[os_log_s setResolver:](v15, "setResolver:", v16);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
    -[os_log_s setAgentUUID:](v15, "setAgentUUID:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dohURL]);
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v19));

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 host]);
    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 host]);
      -[os_log_s setAgentDescription:](v15, "setAgentDescription:", v22);
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v22 dohURL]);
      -[os_log_s setAgentDescription:](v15, "setAgentDescription:", v3);
    }

    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
    -[os_log_s setProxyAgentUUID:](v15, "setProxyAgentUUID:", v23);

    uint64_t v27 = nplog_obj(v24, v25, v26);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s resolver](v15, "resolver"));
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v29 dohURL]);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%@ setting up resolver agent to %{public}@",  buf,  0x16u);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
    unsigned int v31 = [v30 isRegistered];

    if (v31)
    {
      uint64_t v35 = nplog_obj(v32, v33, v34);
      __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "%@ updating resolver agent with UUID %@",  buf,  0x16u);
      }

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      unsigned __int8 v39 = [v38 updateNetworkAgent:v15];

      if ((v39 & 1) == 0)
      {
        uint64_t v43 = nplog_obj(v40, v41, v42);
        char v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          __int16 v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v109;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%@: failed to update the registered resolver agent [%@]",  buf,  0x16u);
        }
      }

      goto LABEL_58;
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v121 = sub_10000CED4;
    v122 = sub_10000CEE4;
    id v123 = 0LL;
    uint64_t v45 = nplog_obj(v32, v33, v34);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
      *(_DWORD *)v114 = 138412546;
      v115 = self;
      __int16 v116 = 2112;
      v117 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "%@ looking for resolver agent registration file handle with agent UUID %@",  v114,  0x16u);
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472LL;
    v113[2] = sub_1000187FC;
    v113[3] = &unk_1000F92F8;
    v113[4] = self;
    v113[5] = buf;
    [v48 iterateFileHandlesWithBlock:v113];

    id v51 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 handle]);
      uint64_t v53 = dup((int)[v52 fileDescriptor]);

      if ((v53 & 0x80000000) != 0)
      {
        uint64_t v100 = nplog_obj(v54, v55, v56);
        unsigned __int8 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v101 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) agentUUID]);
          v102 = __error();
          v103 = strerror(*v102);
          *(_DWORD *)v114 = 138412802;
          v115 = self;
          __int16 v116 = 2112;
          v117 = v101;
          __int16 v118 = 2080;
          v119 = v103;
          _os_log_error_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "%@: failed to dup the resolver agent registration file handle [%@], error: %s",  v114,  0x20u);
        }

        goto LABEL_56;
      }

      uint64_t v57 = nplog_obj(v54, v55, v56);
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        id v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) agentUUID]);
        *(_DWORD *)v114 = 138412546;
        v115 = self;
        __int16 v116 = 2112;
        v117 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "%@: re-using existing resolver agent registration file handle [%@]",  v114,  0x16u);
      }

      id v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      uint64_t v3 = (uint64_t)[v60 setRegisteredNetworkAgent:v15 fileDescriptor:v53];

      if ((v3 & 1) == 0)
      {
        uint64_t v104 = nplog_obj(v61, v62, v63);
        v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          int v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)v114 = 138412546;
          v115 = self;
          __int16 v116 = 2112;
          v117 = v110;
          _os_log_error_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_ERROR,  "%@: failed to set the registered resolver agent [%@]",  v114,  0x16u);
        }

        close(v53);
        goto LABEL_57;
      }

      __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      unsigned int v65 = [v64 isRegistered];

      if (v65)
      {
        uint64_t v69 = nplog_obj(v66, v67, v68);
        unint64_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)v114 = 138412546;
          v115 = self;
          __int16 v116 = 2112;
          v117 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "%@ updating registered DNS network agent [%@]",  v114,  0x16u);
        }

        v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
        unsigned __int8 v73 = [v72 updateNetworkAgent:v15];

        if ((v73 & 1) == 0)
        {
          uint64_t v77 = nplog_obj(v74, v75, v76);
          unsigned __int8 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
            *(_DWORD *)v114 = 138412546;
            v115 = self;
            __int16 v116 = 2112;
            v117 = v79;
            _os_log_error_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "%@: failed to update the registered DNS network agent [%@]",  v114,  0x16u);
          }

          goto LABEL_56;
        }
      }
    }

    else
    {
      uint64_t v80 = nplog_obj(0LL, v49, v50);
      char v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        id v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        *(_DWORD *)v114 = 138412546;
        v115 = self;
        __int16 v116 = 2112;
        v117 = v82;
        _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_INFO,  "%@ registering DNS network agent [%@]",  v114,  0x16u);
      }

      BOOL v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      unsigned __int8 v84 = [v83 registerNetworkAgent:v15];

      if ((v84 & 1) == 0)
      {
        uint64_t v106 = nplog_obj(v85, v86, v87);
        unsigned __int8 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)v114 = 138412546;
          v115 = self;
          __int16 v116 = 2112;
          v117 = v107;
          _os_log_error_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "%@: failed to register DNS network agent [%@]",  v114,  0x16u);
        }

        goto LABEL_56;
      }

      id v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      unsigned int v89 = [v88 isRegistered];

      if (v89)
      {
        uint64_t v3 = (uint64_t)objc_alloc(&OBJC_CLASS___NENetworkAgentRegistrationFileHandle);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        id v93 = [(id)v3 initWithNetworkAgentRegistration:v90 sessionType:&off_100103338 configurationIdentifier:v91 agentUUID:v92];
        v94 = *(void **)(*(void *)&buf[8] + 40LL);
        *(void *)(*(void *)&buf[8] + 40LL) = v93;

        v95 = (void *)objc_claimAutoreleasedReturnValue( +[NEFileHandleMaintainer sharedMaintainer]( &OBJC_CLASS___NEFileHandleMaintainer,  "sharedMaintainer"));
        uint64_t v96 = *(void *)(*(void *)&buf[8] + 40LL);
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472LL;
        v112[2] = sub_1000188EC;
        v112[3] = &unk_1000F9370;
        v112[4] = self;
        [v95 setFileHandle:v96 matchingPredicate:v112];

        v97 = (void *)objc_claimAutoreleasedReturnValue( +[NEFileHandleMaintainer sharedMaintainer]( &OBJC_CLASS___NEFileHandleMaintainer,  "sharedMaintainer"));
        [v97 commit];
      }
    }

    unsigned __int8 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
    if (-[os_log_s isRegistered](v78, "isRegistered"))
    {
      id v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
      if (!v98)
      {
        if (a3) {
          goto LABEL_50;
        }
        goto LABEL_51;
      }

      uint64_t v99 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
      uint64_t v3 = v99;
      if (v99 && ([*(id *)(v99 + 24) isRegistered] & 1) != 0)
      {
        if (a3)
        {

LABEL_50:
LABEL_55:
          -[NSPProxiedContentPath setProxiedContentAgentRegistered:](self, "setProxiedContentAgentRegistered:", 1LL);
          unsigned __int8 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
          -[os_log_s proxiedContentAgentRegistered:](v78, "proxiedContentAgentRegistered:", self);
          goto LABEL_56;
        }

- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPProxiedContentPath pathReady](self, "pathReady"))
  {
    -[NSPProxiedContentPath resetFallbackProxyAgent](self, "resetFallbackProxyAgent");
    -[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:]( self,  "resetQUICProxyAgentForceUpdateDelegate:",  v3);
    -[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:](self, "resetResolverAgentForceUpdateDelegate:", v3);
  }

- (BOOL)unregisterResolverAgent
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  if (!v3) {
    return 1;
  }
  uint64_t v4 = (void *)v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));

  if (!v5) {
    return 1;
  }
  nw_protocol_definition_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
  unsigned int v7 = [v6 isRegistered];

  if (!v7) {
    return 1;
  }
  uint64_t v11 = nplog_obj(v8, v9, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
    *(_DWORD *)__int128 buf = 138412546;
    id v21 = self;
    __int16 v22 = 2112;
    unsigned int v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ un-registering resolver agent with UUID %@",  buf,  0x16u);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
  unsigned __int8 v15 = [v14 unregisterNetworkAgent];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100018BAC;
  v19[3] = &unk_1000F9370;
  v19[4] = self;
  [v16 removeFileHandleMatchingPredicate:v19];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
  [v17 commit];

  return v15;
}

- (void)removeProxyAgents
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
  sub_100045950((uint64_t)v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
  sub_100045950((uint64_t)v4);

  -[NSPProxiedContentPath unregisterResolverAgent](self, "unregisterResolverAgent");
  if (-[NSPProxiedContentPath proxiedContentAgentRegistered](self, "proxiedContentAgentRegistered"))
  {
    -[NSPProxiedContentPath setProxiedContentAgentRegistered:](self, "setProxiedContentAgentRegistered:", 0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
    [v5 proxiedContentAgentUnregistered:self];
  }

  -[NSPProxiedContentPath setQuicAgentUUID:](self, "setQuicAgentUUID:", 0LL);
  -[NSPProxiedContentPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", 0LL);
  -[NSPProxiedContentPath setResolverAgentUUID:](self, "setResolverAgentUUID:", 0LL);
  -[NSPProxiedContentPath setQuicRegistration:](self, "setQuicRegistration:", 0LL);
  -[NSPProxiedContentPath setFallbackRegistration:](self, "setFallbackRegistration:", 0LL);
  -[NSPProxiedContentPath setResolverRegistration:](self, "setResolverRegistration:", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPProxiedContentPath;
  -[NSPProxiedContentPath dealloc](&v3, "dealloc");
}

- (NSPProxiedContentPathDelegate)delegate
{
  return (NSPProxiedContentPathDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)associatedMaps
{
  return self->_associatedMaps;
}

- (void)setAssociatedMaps:(id)a3
{
}

- (NSPProxyTokenInfo)ingressProxy
{
  return self->_ingressProxy;
}

- (void)setIngressProxy:(id)a3
{
}

- (NSPProxyTokenInfo)egressProxy
{
  return self->_egressProxy;
}

- (void)setEgressProxy:(id)a3
{
}

- (NSPPrivacyProxyResolverInfo)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (NSUUID)quicAgentUUID
{
  return self->_quicAgentUUID;
}

- (void)setQuicAgentUUID:(id)a3
{
}

- (NSUUID)fallbackAgentUUID
{
  return self->_fallbackAgentUUID;
}

- (void)setFallbackAgentUUID:(id)a3
{
}

- (NSUUID)resolverAgentUUID
{
  return self->_resolverAgentUUID;
}

- (void)setResolverAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)quicRegistration
{
  return self->_quicRegistration;
}

- (void)setQuicRegistration:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration
{
  return self->_fallbackRegistration;
}

- (void)setFallbackRegistration:(id)a3
{
}

- (NWNetworkAgentRegistration)resolverRegistration
{
  return self->_resolverRegistration;
}

- (void)setResolverRegistration:(id)a3
{
}

- (BOOL)fetchingSessionTickets
{
  return self->_fetchingSessionTickets;
}

- (void)setFetchingSessionTickets:(BOOL)a3
{
  self->_fetchingSessionTickets = a3;
}

- (BOOL)proxiedContentAgentRegistered
{
  return self->_proxiedContentAgentRegistered;
}

- (void)setProxiedContentAgentRegistered:(BOOL)a3
{
  self->_proxiedContentAgentRegistered = a3;
}

- (NSArray)resolvedAddresses
{
  return self->_resolvedAddresses;
}

- (void)setResolvedAddresses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end