@interface NSPProxyPath
+ (BOOL)supportsSecureCoding;
- (BOOL)allowFailOpen;
- (BOOL)allowFallback;
- (BOOL)fallbackToQUIC;
- (BOOL)forceFallback;
- (BOOL)geohashSharingEnabled;
- (BOOL)isMultiHopRegistered;
- (BOOL)isSingleHopRegistered;
- (BOOL)matchEgress:(id)a3;
- (BOOL)matchIngress:(id)a3;
- (BOOL)multiHopRegistered;
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
- (BOOL)singleHopRegistered;
- (NSNumber)configEpoch;
- (NSPPrivacyProxyNetworkRegistration)multiHopRegistration;
- (NSPPrivacyProxyNetworkRegistration)singleHopRegistration;
- (NSPProxyAgentNetworkStatistics)networkMultiHopAgentStatistics;
- (NSPProxyAgentNetworkStatistics)networkSingleHopAgentStatistics;
- (NSPProxyPath)initWithCoder:(id)a3;
- (NSPProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13;
- (NSPProxyPathDelegate)delegate;
- (NSPProxyTokenInfo)egressProxy;
- (NSPProxyTokenInfo)ingressProxy;
- (NSString)description;
- (NSUUID)nonDefaultAgentUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)multiHopConfigurationHash;
- (id)singleHopConfigurationHash;
- (unint64_t)proxyPathWeight;
- (void)dealloc;
- (void)enableFailOpen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleNetworkCharacteristicsChange:(id)a3;
- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)resetError;
- (void)resetMultiHopProxyAgent;
- (void)resetSingleHopProxyAgent;
- (void)resetStats;
- (void)setAllowFailOpen:(BOOL)a3;
- (void)setAllowFallback:(BOOL)a3;
- (void)setConfigEpoch:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEgressProxy:(id)a3;
- (void)setFallbackToQUIC:(BOOL)a3;
- (void)setForceFallback:(BOOL)a3;
- (void)setGeohashSharingEnabled:(BOOL)a3;
- (void)setIngressProxy:(id)a3;
- (void)setMultiHopRegistered:(BOOL)a3;
- (void)setMultiHopRegistration:(id)a3;
- (void)setNetworkMultiHopAgentStatistics:(id)a3;
- (void)setNetworkSingleHopAgentStatistics:(id)a3;
- (void)setNonDefaultAgentUUID:(id)a3;
- (void)setProxyPathWeight:(unint64_t)a3;
- (void)setSingleHopRegistered:(BOOL)a3;
- (void)setSingleHopRegistration:(id)a3;
- (void)setupMultiHopProxyRegistrations;
- (void)setupSingleHopProxyRegistrations;
- (void)updateConfigEpoch:(id)a3;
- (void)updateGeohashSharing:(BOOL)a3;
- (void)updateIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5;
@end

@implementation NSPProxyPath

- (NSPProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v38 = a12;
  id v21 = a13;
  v24 = v21;
  if (!v19)
  {
    uint64_t v33 = nplog_obj(v21, v22, v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v31 = 0LL;
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    v41 = "-[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFal"
          "lback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v35 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_FAULT, v35, buf, 0xCu);
    goto LABEL_10;
  }

  if (!v20)
  {
    uint64_t v36 = nplog_obj(v21, v22, v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v41 = "-[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFal"
          "lback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v35 = "%s called with null egressProxy";
    goto LABEL_12;
  }

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NSPProxyPath;
  v25 = -[NSPProxyPath init](&v39, "init");
  v26 = v25;
  if (v25)
  {
    objc_storeWeak((id *)&v25->_delegate, v18);
    objc_storeStrong((id *)&v26->_ingressProxy, a4);
    objc_storeStrong((id *)&v26->_egressProxy, a5);
    v26->_proxyPathWeight = a6;
    v26->_allowFallback = a7;
    v26->_fallbackToQUIC = a8;
    v26->_forceFallback = a9;
    v26->_allowFailOpen = a10;
    v26->_geohashSharingEnabled = a11;
    objc_storeStrong((id *)&v26->_configEpoch, a12);
    v27 = objc_alloc_init(&OBJC_CLASS___NSPProxyAgentNetworkStatistics);
    networkSingleHopAgentStatistics = v26->_networkSingleHopAgentStatistics;
    v26->_networkSingleHopAgentStatistics = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___NSPProxyAgentNetworkStatistics);
    networkMultiHopAgentStatistics = v26->_networkMultiHopAgentStatistics;
    v26->_networkMultiHopAgentStatistics = v29;

    sub_100011668((uint64_t)v26->_networkMultiHopAgentStatistics, v24);
    sub_100011668((uint64_t)v26->_networkSingleHopAgentStatistics, v24);
  }

  self = v26;
  v31 = self;
LABEL_6:

  return v31;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  v7 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  sub_100043E90(v7, v8, @"Ingress proxy", a3, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  sub_100043E90(v7, v9, @"Egress proxy", a3, a4);

  sub_1000446CC(v7, -[NSPProxyPath allowFallback](self, "allowFallback"), (uint64_t)@"Allow fallback", a3, a4);
  sub_1000446CC(v7, -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"), (uint64_t)@"Fallback to QUIC", a3, a4);
  sub_1000446CC(v7, -[NSPProxyPath allowFailOpen](self, "allowFailOpen"), (uint64_t)@"Allow fail open", a3, a4);
  sub_1000446CC( v7,  -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled"),  (uint64_t)@"Geohash Sharing Enabled",  a3,  a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  sub_100043E90(v7, v10, @"Config Epoch", a3, a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
  sub_100043E90(v7, v11, @"Agent UUID", a3, a4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  sub_100043E90(v7, v12, @"Single hop statistics", a3, a4);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  sub_100043E90(v7, v13, @"Multi hop statistics", a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NSPProxyPath descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxyPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NSPProxyPath;
  v5 = -[NSPProxyPath init](&v25, "init");
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

    v5->_proxyPathWeight = (unint64_t)[v4 decodeIntegerForKey:@"proxyPathWeight"];
    v5->_allowFallback = [v4 decodeBoolForKey:@"proxyPathAllowFallback"];
    v5->_fallbackToQUIC = [v4 decodeBoolForKey:@"proxyPathFallbackToQUIC"];
    v5->_forceFallback = [v4 decodeBoolForKey:@"proxyPathForceFallback"];
    v5->_allowFailOpen = [v4 decodeBoolForKey:@"proxyPathAllowFailOpen"];
    v5->_geohashSharingEnabled = [v4 decodeBoolForKey:@"proxyPathGeohashSharingEnabled"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"proxyPathConfigEpoch"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    configEpoch = v5->_configEpoch;
    v5->_configEpoch = (NSNumber *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"proxyPathAgentUUID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    nonDefaultAgentUUID = v5->_nonDefaultAgentUUID;
    v5->_nonDefaultAgentUUID = (NSUUID *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyAgentNetworkStatistics) forKey:@"proxyPathSingleHopAgentStatistics"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    networkSingleHopAgentStatistics = v5->_networkSingleHopAgentStatistics;
    v5->_networkSingleHopAgentStatistics = (NSPProxyAgentNetworkStatistics *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyAgentNetworkStatistics) forKey:@"proxyPathMultipleHopAgentStatistics"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    networkMultiHopAgentStatistics = v5->_networkMultiHopAgentStatistics;
    v5->_networkMultiHopAgentStatistics = (NSPProxyAgentNetworkStatistics *)v22;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  [v4 encodeObject:v5 forKey:@"proxyPathIngressProxy"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  [v4 encodeObject:v6 forKey:@"proxyPathEgressProxy"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"),  @"proxyPathWeight");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NSPProxyPath allowFallback](self, "allowFallback"),  @"proxyPathAllowFallback");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"),  @"proxyPathFallbackToQUIC");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NSPProxyPath forceFallback](self, "forceFallback"),  @"proxyPathForceFallback");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NSPProxyPath allowFailOpen](self, "allowFailOpen"),  @"proxyPathAllowFailOpen");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled"),  @"proxyPathGeohashSharingEnabled");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  [v4 encodeObject:v7 forKey:@"proxyPathConfigEpoch"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
  [v4 encodeObject:v8 forKey:@"proxyPathAgentUUID"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  [v4 encodeObject:v9 forKey:@"proxyPathSingleHopAgentStatistics"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  [v4 encodeObject:v10 forKey:@"proxyPathMultipleHopAgentStatistics"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPProxyPath init](+[NSPProxyPath allocWithZone:](&OBJC_CLASS___NSPProxyPath, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  -[NSPProxyPath setDelegate:](v4, "setDelegate:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  -[NSPProxyPath setIngressProxy:](v4, "setIngressProxy:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  -[NSPProxyPath setEgressProxy:](v4, "setEgressProxy:", v7);

  -[NSPProxyPath setProxyPathWeight:]( v4,  "setProxyPathWeight:",  -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"));
  -[NSPProxyPath setAllowFallback:](v4, "setAllowFallback:", -[NSPProxyPath allowFallback](self, "allowFallback"));
  -[NSPProxyPath setFallbackToQUIC:](v4, "setFallbackToQUIC:", -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"));
  -[NSPProxyPath setForceFallback:](v4, "setForceFallback:", -[NSPProxyPath forceFallback](self, "forceFallback"));
  -[NSPProxyPath setAllowFailOpen:](v4, "setAllowFailOpen:", -[NSPProxyPath allowFailOpen](self, "allowFailOpen"));
  -[NSPProxyPath setGeohashSharingEnabled:]( v4,  "setGeohashSharingEnabled:",  -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  -[NSPProxyPath setConfigEpoch:](v4, "setConfigEpoch:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
  -[NSPProxyPath setNonDefaultAgentUUID:](v4, "setNonDefaultAgentUUID:", v9);

  -[NSPProxyPath setSingleHopRegistered:]( v4,  "setSingleHopRegistered:",  -[NSPProxyPath singleHopRegistered](self, "singleHopRegistered"));
  -[NSPProxyPath setMultiHopRegistered:]( v4,  "setMultiHopRegistered:",  -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  -[NSPProxyPath setSingleHopRegistration:](v4, "setSingleHopRegistration:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  -[NSPProxyPath setMultiHopRegistration:](v4, "setMultiHopRegistration:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  -[NSPProxyPath setNetworkSingleHopAgentStatistics:](v4, "setNetworkSingleHopAgentStatistics:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  -[NSPProxyPath setNetworkMultiHopAgentStatistics:](v4, "setNetworkMultiHopAgentStatistics:", v13);

  return v4;
}

- (void)setupSingleHopProxyRegistrations
{
}

- (void)setupMultiHopProxyRegistrations
{
}

- (void)resetSingleHopProxyAgent
{
}

- (void)resetMultiHopProxyAgent
{
}

- (BOOL)isMultiHopRegistered
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v3 = (void *)v2;
  if (v2) {
    unsigned __int8 v4 = [*(id *)(v2 + 24) isRegistered];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isSingleHopRegistered
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  v3 = (void *)v2;
  if (v2) {
    unsigned __int8 v4 = [*(id *)(v2 + 24) isRegistered];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)updateIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5
{
  id v8 = a4;
  -[NSPProxyPath setIngressProxy:](self, "setIngressProxy:", a3);
  -[NSPProxyPath setEgressProxy:](self, "setEgressProxy:", v8);

  -[NSPProxyPath setProxyPathWeight:](self, "setProxyPathWeight:", a5);
  -[NSPProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
  -[NSPProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
}

- (void)enableFailOpen:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPProxyPath allowFailOpen](self, "allowFailOpen") != a3)
  {
    -[NSPProxyPath setAllowFailOpen:](self, "setAllowFailOpen:", v3);
    -[NSPProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
    -[NSPProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
  }

- (void)updateGeohashSharing:(BOOL)a3
{
}

- (void)updateConfigEpoch:(id)a3
{
}

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[NSPProxyPath proxyPathIsValid:proxyPathList:]", "NSPPrivacyProxyAgentManager.m", 2902, "0");
}

- (BOOL)matchIngress:(id)a3
{
  id v6 = (id *)a3;
  if (!v6)
  {
    uint64_t v19 = nplog_obj(0LL, v4, v5);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v17 = 0;
      goto LABEL_6;
    }

    int v23 = 136315138;
    v24 = "-[NSPProxyPath matchIngress:]";
    id v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v7)
  {
    uint64_t v22 = nplog_obj(v8, v9, v10);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v23 = 136315138;
    v24 = "-[NSPProxyPath matchIngress:]";
    id v21 = "%s called with null self.ingressProxy";
    goto LABEL_12;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = *(void **)(v11 + 24);
  }
  else {
    uint64_t v13 = 0LL;
  }
  id v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyURL]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
  unsigned __int8 v17 = [v15 isEqualToString:v16];

LABEL_6:
  return v17;
}

- (BOOL)matchEgress:(id)a3
{
  id v6 = (id *)a3;
  if (!v6)
  {
    uint64_t v19 = nplog_obj(0LL, v4, v5);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v17 = 0;
      goto LABEL_6;
    }

    int v23 = 136315138;
    v24 = "-[NSPProxyPath matchEgress:]";
    id v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (!v7)
  {
    uint64_t v22 = nplog_obj(v8, v9, v10);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v23 = 136315138;
    v24 = "-[NSPProxyPath matchEgress:]";
    id v21 = "%s called with null self.egressProxy";
    goto LABEL_12;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = *(void **)(v11 + 24);
  }
  else {
    uint64_t v13 = 0LL;
  }
  id v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyURL]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
  unsigned __int8 v17 = [v15 isEqualToString:v16];

LABEL_6:
  return v17;
}

- (void)handleNetworkCharacteristicsChange:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "proxy path: network signature changed", v13, 2u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  sub_100011668((uint64_t)v9, v4);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  sub_100011668((uint64_t)v10, v4);

  uint64_t v11 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  if (v11)
  {
    v11[6] = 0u;
    v11[7] = 0u;
    v11[4] = 0u;
    v11[5] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    v11[1] = 0u;
  }

  id v12 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  if (v12)
  {
    v12[6] = 0u;
    v12[7] = 0u;
    v12[4] = 0u;
    v12[5] = 0u;
    v12[2] = 0u;
    v12[3] = 0u;
    v12[1] = 0u;
  }
}

- (void)resetStats
{
  BOOL v3 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  if (v3)
  {
    v3[6] = 0u;
    v3[7] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[1] = 0u;
  }

  id v4 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[1] = 0u;
  }
}

- (void)resetError
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  id v4 = (void *)v3;
  if (v3) {
    [*(id *)(v3 + 24) resetError];
  }

  uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  if (v5)
  {
    uint64_t v6 = v5;
    [v5[3] resetError];
    uint64_t v5 = v6;
  }
}

- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (id *)a3;
  __int128 buffer = 0u;
  memset(v70, 0, sizeof(v70));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v12 = v9;
  if (!v9)
  {
    v60 = 0LL;
    id v21 = 0LL;
    uint64_t v13 = 0LL;
LABEL_8:
    uint64_t v22 = 0LL;
    goto LABEL_22;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v9));
  uint64_t v13 = v9;
  if (!v9)
  {
    v60 = 0LL;
    id v21 = 0LL;
    goto LABEL_8;
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue([v9 interface]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 parameters]);
  id v15 = [v14 pid];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 effectiveProcessUUID]);
  v59 = v12;
  if ((_DWORD)v15)
  {
    uint64_t v17 = proc_pidinfo((int)v15, 13, 1uLL, &buffer, 64);
    if ((_DWORD)v17 == 64)
    {
      id v20 = v8;
      id v21 = (const char *)v70;
    }

    else
    {
      uint64_t v24 = nplog_obj(v17, v18, v19);
      objc_super v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = (_DWORD)v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to process name",  buf,  8u);
      }

      id v20 = v8;

      id v21 = 0LL;
    }

    int v23 = (void *)ne_copy_signing_identifier_for_pid(v15);
    if (v23) {
      goto LABEL_16;
    }
  }

  else
  {
    id v20 = v8;
    id v21 = 0LL;
    int v23 = 0LL;
  }

  if (v16)
  {
    *(void *)buf = 0LL;
    *(void *)v62 = 0LL;
    [v16 getUUIDBytes:buf];
    int v23 = (void *)NEHelperCacheCopySigningIdentifierMapping(buf);
  }

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  sub_100045950((uint64_t)v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  [v4 singleHopAgentUnregistered:self];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  sub_100045950((uint64_t)v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  [v6 multiHopAgentUnregistered:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSPProxyPath;
  -[NSPProxyPath dealloc](&v7, "dealloc");
}

- (id)singleHopConfigurationHash
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  id v3 = sub_100045BD0((uint64_t)v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)multiHopConfigurationHash
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  id v3 = sub_100045BD0((uint64_t)v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (NSPProxyPathDelegate)delegate
{
  return (NSPProxyPathDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
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

- (unint64_t)proxyPathWeight
{
  return self->_proxyPathWeight;
}

- (void)setProxyPathWeight:(unint64_t)a3
{
  self->_proxyPathWeight = a3;
}

- (BOOL)allowFallback
{
  return self->_allowFallback;
}

- (void)setAllowFallback:(BOOL)a3
{
  self->_allowFallback = a3;
}

- (BOOL)fallbackToQUIC
{
  return self->_fallbackToQUIC;
}

- (void)setFallbackToQUIC:(BOOL)a3
{
  self->_fallbackToQUIC = a3;
}

- (BOOL)forceFallback
{
  return self->_forceFallback;
}

- (void)setForceFallback:(BOOL)a3
{
  self->_forceFallback = a3;
}

- (BOOL)allowFailOpen
{
  return self->_allowFailOpen;
}

- (void)setAllowFailOpen:(BOOL)a3
{
  self->_allowFailOpen = a3;
}

- (BOOL)singleHopRegistered
{
  return self->_singleHopRegistered;
}

- (void)setSingleHopRegistered:(BOOL)a3
{
  self->_singleHopRegistered = a3;
}

- (BOOL)multiHopRegistered
{
  return self->_multiHopRegistered;
}

- (void)setMultiHopRegistered:(BOOL)a3
{
  self->_multiHopRegistered = a3;
}

- (BOOL)geohashSharingEnabled
{
  return self->_geohashSharingEnabled;
}

- (void)setGeohashSharingEnabled:(BOOL)a3
{
  self->_geohashSharingEnabled = a3;
}

- (NSNumber)configEpoch
{
  return self->_configEpoch;
}

- (void)setConfigEpoch:(id)a3
{
}

- (NSUUID)nonDefaultAgentUUID
{
  return self->_nonDefaultAgentUUID;
}

- (void)setNonDefaultAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)singleHopRegistration
{
  return self->_singleHopRegistration;
}

- (void)setSingleHopRegistration:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)multiHopRegistration
{
  return self->_multiHopRegistration;
}

- (void)setMultiHopRegistration:(id)a3
{
}

- (NSPProxyAgentNetworkStatistics)networkSingleHopAgentStatistics
{
  return self->_networkSingleHopAgentStatistics;
}

- (void)setNetworkSingleHopAgentStatistics:(id)a3
{
}

- (NSPProxyAgentNetworkStatistics)networkMultiHopAgentStatistics
{
  return self->_networkMultiHopAgentStatistics;
}

- (void)setNetworkMultiHopAgentStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end