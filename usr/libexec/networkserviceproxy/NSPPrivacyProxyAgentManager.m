@interface NSPPrivacyProxyAgentManager
+ (BOOL)proxiesMatch:(id)a3 proxyPathList:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 pathWeight:(unint64_t)a7 supportsFallback:(BOOL)a8;
+ (BOOL)supportsSecureCoding;
+ (id)multiHopFallbackProxyAgentUUID;
+ (id)multiHopProxyAgentUUID;
+ (id)singleHopFallbackProxyAgentUUID;
+ (id)singleHopProxyAgentUUID;
+ (void)removeProxyInfoFromKeychain;
- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4;
- (BOOL)deferCommit;
- (BOOL)disableDoHBootstrapResults;
- (BOOL)dnsFilteringHintEnabled;
- (BOOL)forceFallback;
- (BOOL)isMultiHopFallbackProxyAgentRegistered;
- (BOOL)isMultiHopProxyAgentRegistered;
- (BOOL)isSingleHopFallbackProxyAgentRegistered;
- (BOOL)isSingleHopProxyAgentRegistered;
- (BOOL)networkDiscoveredProxyPresentInAgentManager;
- (BOOL)proxiedContentMapIsOverrideEnabled:(id)a3;
- (BOOL)proxyInfo:(id)a3 matchesProxyIndex:(unint64_t)a4;
- (NSData)overrideIngressProxyKey;
- (NSDate)tokenIssuanceRestrictedUntilDate;
- (NSPPrivacyProxyAgentManager)initWithCoder:(id)a3;
- (NSPPrivacyProxyAgentManager)initWithDelegate:(id)a3 toggleStats:(id)a4;
- (NSString)description;
- (NSString)geohashOverride;
- (NSString)overrideFallbackIngressProxy;
- (NSString)overrideIngressProxy;
- (NSString)overridePreferredObliviousProxy;
- (NSString)overridePreferredProxy;
- (id)alternatePreferredPathAgentUUIDs:(id)a3;
- (id)copyDomainFiltersDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ingressFallbackProxyURL;
- (id)ingressProxyURL;
- (id)lastProxyOutageReason;
- (id)lastTokenOutageReason;
- (id)multiHopFallbackProxyConfigHash:(id)a3;
- (id)multiHopQUICProxyConfigHash:(id)a3;
- (id)singleHopFallbackProxyConfigHash:(id)a3;
- (id)singleHopQUICProxyConfigHash:(id)a3;
- (id)tierString;
- (void)copyProxyInfo:(id)a3;
- (void)dealloc;
- (void)didReceiveUpdatedPvDOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)forceFallback:(BOOL)a3;
- (void)handleConfigChange;
- (void)handleLinkQualityChange:(int)a3;
- (void)handlePathChange:(id)a3;
- (void)handleTierChange:(BOOL)a3;
- (void)handleUnlimitedChange:(BOOL)a3;
- (void)mergeTokenStats:(id)a3;
- (void)multiHopAgentRegistered:(id)a3;
- (void)multiHopAgentUnregistered:(id)a3;
- (void)obliviousHopAgentRegistered:(id)a3 hostname:(id)a4 processes:(id)a5 agentUUID:(id)a6;
- (void)obliviousHopAgentUnregistered:(id)a3 hostname:(id)a4 agentUUID:(id)a5;
- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5;
- (void)overridePreferredObliviousProxy:(id)a3;
- (void)overridePreferredProxy:(id)a3;
- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4;
- (void)probeFailed:(id)a3;
- (void)probeRedirected:(id)a3;
- (void)probeServerError:(id)a3 httpStatusCode:(int64_t)a4;
- (void)probeSuccess:(id)a3;
- (void)proxiedContentAgentRegistered:(id)a3;
- (void)proxiedContentAgentUnregistered:(id)a3;
- (void)removeExpiredTokens;
- (void)reportActivityForApp:(id)a3 path:(id)a4;
- (void)reportEpoch:(unsigned __int16)a3;
- (void)reportObliviousPathError:(int)a3 interface:(id)a4 obliviousPath:(id)a5;
- (void)reportProxiedContentPathError:(int)a3 interface:(id)a4 proxiedContentPath:(id)a5 registration:(id)a6;
- (void)reportProxyError:(int)a3 interface:(id)a4 proxyPath:(id)a5;
- (void)reportProxySuccessOnInterface:(id)a3 proxyPath:(id)a4;
- (void)reportTokenFetchFailure:(id)a3 statusCode:(int64_t)a4;
- (void)requestAccessTokenWithCompletionHandler:(id)a3;
- (void)resetProxyErrors;
- (void)sendRTCReportForPrivacyProxyToggleState:(BOOL)a3;
- (void)sendRTCReportForServiceOutage:(id)a3;
- (void)sendRTCReportWithFailureType:(int64_t)a3 errorCode:(int)a4 url:(id)a5 ingressProxy:(id)a6 egressProxy:(id)a7 tokenServer:(id)a8;
- (void)setDnsFilteringHintEnabled:(BOOL)a3;
- (void)setGeohashOverride:(id)a3;
- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3;
- (void)setUserEventAgentProberParameters;
- (void)setUserEventAgentTokenFetchParameters;
- (void)setupMasqueProxyWith:(id)a3;
- (void)setupWithPath:(id)a3 subscriber:(BOOL)a4 unlimited:(BOOL)a5 geohashSharingEnabled:(BOOL)a6 geohashOverride:(id)a7 configEpoch:(id)a8 linkQuality:(int)a9;
- (void)singleHopAgentRegistered:(id)a3;
- (void)singleHopAgentUnregistered:(id)a3;
- (void)switchProxy:(id)a3;
- (void)tearDownNetworkDiscoveredProxy;
- (void)tokenAdded;
- (void)tokenFetched;
- (void)tokenInfoInvalid:(id)a3;
- (void)tokenLowWaterMarkReached:(id)a3;
- (void)tokenRateLimited:(id)a3 untilDate:(double)a4;
- (void)tokensEmpty;
- (void)updateConfigEpoch:(id)a3;
- (void)updateDNSFilteringHint:(BOOL)a3;
- (void)updateGeohashSharingPreference:(BOOL)a3 geohashOverride:(id)a4;
- (void)updateProxyInfo:(id)a3 resolverInfo:(id)a4 proxyPathList:(id)a5 fallbackProxyPathList:(id)a6 obliviousConfigs:(id)a7 proxiedContentMaps:(id)a8;
- (void)updateUserEventAgentData;
- (void)useDefaultNetworkInterface:(BOOL)a3;
@end

@implementation NSPPrivacyProxyAgentManager

+ (id)multiHopProxyAgentUUID
{
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1000C3790);
}

+ (id)singleHopProxyAgentUUID
{
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1000C37A0);
}

+ (id)multiHopFallbackProxyAgentUUID
{
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1000C37B0);
}

+ (id)singleHopFallbackProxyAgentUUID
{
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_1000C37C0);
}

+ (BOOL)proxiesMatch:(id)a3 proxyPathList:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 pathWeight:(unint64_t)a7 supportsFallback:(BOOL)a8
{
  BOOL v38 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v39 = v16;
  if (!v13)
  {
    uint64_t v33 = nplog_obj(v16, v17, v18);
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v34 = "%s called with null proxyInfoArray";
LABEL_34:
    _os_log_fault_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_FAULT, v34, buf, 0xCu);
    goto LABEL_26;
  }

  if (!v15)
  {
    uint64_t v35 = nplog_obj(v16, v17, v18);
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v34 = "%s called with null matchIngressProxy";
    goto LABEL_34;
  }

  if (!v16)
  {
    uint64_t v36 = nplog_obj(0LL, v17, v18);
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v34 = "%s called with null matchEgressProxy";
    goto LABEL_34;
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  obj = (os_log_s *)v14;
  id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v45,  16LL);
  if (v19)
  {
    id v20 = v19;
    id v37 = v14;
    uint64_t v21 = *(void *)v42;
LABEL_6:
    uint64_t v22 = 0LL;
    while (1)
    {
      if (*(void *)v42 != v21) {
        objc_enumerationMutation(obj);
      }
      v23 = *(void **)(*((void *)&v41 + 1) + 8 * v22);
      if (!a7 || [*(id *)(*((void *)&v41 + 1) + 8 * v22) weight] == a7)
      {
        id v24 = objc_msgSend(v23, "proxiesCount", v37);
        if (v24 != (id)2)
        {
          uint64_t v30 = nplog_obj(v24, v25, v26);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          id v14 = v37;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
            _os_log_fault_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_FAULT,  "%s called with null (proxyPath.proxiesCount == MAX_PROXIES_ON_PATH)",  buf,  0xCu);
          }

          break;
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", *(unsigned int *)objc_msgSend(v23, "proxies")));
        if (sub_1000213B0((uint64_t)&OBJC_CLASS___NSPPrivacyProxyAgentManager, v27, v15)
          && sub_1000213B0((uint64_t)a1, v28, v39)
          && (!v38
           || [v27 supportsFallback] && objc_msgSend(v28, "supportsFallback")))
        {

          BOOL v29 = 1;
LABEL_22:
          id v14 = v37;
          goto LABEL_27;
        }
      }

      if (v20 == (id)++v22)
      {
        id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v45,  16LL);
        if (v20) {
          goto LABEL_6;
        }
        BOOL v29 = 0;
        goto LABEL_22;
      }
    }
  }

- (NSString)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    sub_100043E90(v3, self->_quicProxyPath, @"Quic proxy path", 0, 14LL);
    sub_100043E90(v3, self->_fallbackProxyPath, @"Fallback proxy path", 0, 14LL);
    sub_100043E90(v3, self->_preferredQUICProxyPaths, @"Preferred proxy paths", 0, 14LL);
    sub_100043E90(v3, self->_candidateQuicProxyPath, @"Candidate quic proxy path", 0, 14LL);
    sub_100043E90(v3, self->_candidateFallbackProxyPath, @"Candidate fallback proxy path", 0, 14LL);
    sub_100043E90(v3, self->_candidatePreferredQUICProxyPaths, @"Candidate preferred proxy paths", 0, 14LL);
    sub_100043E90(v3, self->_proxiedContentPaths, @"Proxied content paths", 0, 14LL);
    sub_100043E90(v3, self->_networkSpecificQUICProxyPaths, @"Network specific proxied paths", 0, 14LL);
    sub_100043E90(v3, self->_networkDiscoveredProxyInfos, @"Network discovered proxy ingree", 0, 14LL);
    sub_100043E90(v3, self->_obliviousPaths, @"Oblivious paths", 0, 14LL);
    sub_100043E90(v3, self->_proxyPathCustomEnumerator, @"Proxy path enumerator", 0, 14LL);
    sub_100043E90(v3, self->_fallbackProxyPathCustomEnumerator, @"Fallback proxy path enumerator", 0, 14LL);
    sub_100043E90(v3, self->_obliviousConfigs, @"Oblivious configs", 0, 14LL);
    sub_100043E90(v3, self->_penalizedObliviousProxyIndices, @"Penalized oblivious proxy indicies", 0, 14LL);
    sub_100043E90(v3, self->_proxiedContentMaps, @"Proxied content maps", 0, 14LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v4,  1LL,  2LL));
    sub_100043E90(v3, v5, @"Token issuance restricted", 0, 14LL);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
    sub_100043E90(v3, v6, @"Override preferred proxy", 0, 14LL);

    v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy]( self,  "overridePreferredObliviousProxy"));
    sub_100043E90(v3, v7, @"Override preferred oblivious proxy", 0, 14LL);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
    sub_100043E90(v3, v8, @"Override ingress proxy", 0, 14LL);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
    sub_100043E90(v3, v9, @"Override fallback ingress proxy", 0, 14LL);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
    sub_100043E90(v3, v10, @"Override ingress proxy key", 0, 14LL);

    sub_100043E90(v3, self->_overrideEnabledMaps, @"Override enabled maps", 0, 14LL);
    sub_1000446CC( v3,  self->_disableProxiedContentDoHBootstrap,  (uint64_t)@"Disable proxied content maps DoH bootstrap",  0,  14);
    sub_1000446CC( v3,  -[NSPPrivacyProxyAgentManager forceFallback](self, "forceFallback"),  (uint64_t)@"Force fallback",  0,  14);
    sub_100044730(v3, self->_networkProxiesRotated, (uint64_t)@"Network proxies rotated", 0, 14);
    sub_100044730(v3, self->_networkFallbackProxiesRotated, (uint64_t)@"Network fallback proxies rotated", 0, 14);
    sub_100044730(v3, self->_proxiesRotated, (uint64_t)@"Proxies rotated", 0, 14);
    sub_100043E90(v3, self->_proxyPathProber, @"Proxy path prober", 0, 14LL);
    sub_100043E90(v3, self->_directPathProber, @"Direct path prober", 0, 14LL);
    sub_100043E90(v3, self->_pvdConfigurationFetcher, @"Fetch PvD Options Configuration", 0, 14LL);
    sub_100044730(v3, self->_probingReason, (uint64_t)@"Probing reason", 0, 14);
    sub_1000446CC(v3, self->_reportedTokenOutage, (uint64_t)@"Reported token outage", 0, 14);
  }

  else
  {
    v3 = 0LL;
  }

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPPrivacyProxyAgentManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v149.receiver = self;
  v149.super_class = (Class)&OBJC_CLASS___NSPPrivacyProxyAgentManager;
  v5 = -[NSPPrivacyProxyAgentManager init](&v149, "init");
  if (v5)
  {
    id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSPPrivacyProxyProxyInfo) forKey:@"proxyAgentProxyArray"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    proxyArray = v5->_proxyArray;
    v5->_proxyArray = (NSArray *)v7;

    id v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSPPrivacyProxyResolverInfo) forKey:@"proxyAgentResolverArray"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    resolverArray = v5->_resolverArray;
    v5->_resolverArray = (NSArray *)v10;

    id v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSPPrivacyProxyProxyPathWeight) forKey:@"proxyAgentProxyPathList"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    proxyPathList = v5->_proxyPathList;
    v5->_proxyPathList = (NSArray *)v13;

    id v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSPPrivacyProxyProxyPathWeight) forKey:@"proxyAgentFallbackProxyPathList"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    fallbackProxyPathList = v5->_fallbackProxyPathList;
    v5->_fallbackProxyPathList = (NSArray *)v16;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___NSPPrivacyProxyObliviousHTTPConfig),  0LL);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"proxyAgentObliviousConfigs"]);
    obliviousConfigs = v5->_obliviousConfigs;
    v5->_obliviousConfigs = (NSArray *)v21;

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v23,  objc_opt_class(&OBJC_CLASS___NSPPrivacyProxyProxiedContentMap),  0LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v25 forKey:@"proxyAgentProxiedContentMaps"]);
    proxiedContentMaps = v5->_proxiedContentMaps;
    v5->_proxiedContentMaps = (NSArray *)v26;

    id v28 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"proxyAgentOverridePreferredProxy"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    overridePreferredProxy = v5->_overridePreferredProxy;
    v5->_overridePreferredProxy = (NSString *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"proxyAgentOverridePreferredObliviousProxy"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    overridePreferredObliviousProxy = v5->_overridePreferredObliviousProxy;
    v5->_overridePreferredObliviousProxy = (NSString *)v32;

    id v34 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"proxyAgentOverrideIngressProxy"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    overrideIngressProxy = v5->_overrideIngressProxy;
    v5->_overrideIngressProxy = (NSString *)v35;

    id v37 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"proxyAgentOverrideFallbackIngressProxy"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    overrideFallbackIngressProxy = v5->_overrideFallbackIngressProxy;
    v5->_overrideFallbackIngressProxy = (NSString *)v38;

    id v40 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"proxyAgentOverrideIngressProxyKey"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    overrideIngressProxyKey = v5->_overrideIngressProxyKey;
    v5->_overrideIngressProxyKey = (NSData *)v41;

    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSString);
    v45 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v43,  v44,  objc_opt_class(&OBJC_CLASS___NSPQuicProxyPath),  0LL);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v46 forKey:@"proxyAgentOverrideEnabledMaps"]);
    v48 = (NSMutableArray *)[v47 mutableCopy];
    overrideEnabledMaps = v5->_overrideEnabledMaps;
    v5->_overrideEnabledMaps = v48;

    v5->_disableProxiedContentDoHBootstrap = [v4 decodeBoolForKey:@"proxyAgentDisableProxiedContentDoHBootstrap"];
    v5->_forceFallback = [v4 decodeBoolForKey:@"proxyAgentForceFallbackKey"];
    id v50 = [v4 decodeObjectOfClass:objc_opt_class(NSPQuicProxyPath) forKey:@"proxyAgentQuicProxyPath"];
    uint64_t v51 = objc_claimAutoreleasedReturnValue(v50);
    quicProxyPath = v5->_quicProxyPath;
    v5->_quicProxyPath = (NSPQuicProxyPath *)v51;

    id v53 = [v4 decodeObjectOfClass:objc_opt_class(NSPFallbackProxyPath) forKey:@"proxyAgentFallbackProxyPath"];
    uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
    fallbackProxyPath = v5->_fallbackProxyPath;
    v5->_fallbackProxyPath = (NSPFallbackProxyPath *)v54;

    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSString);
    v58 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v56,  v57,  objc_opt_class(&OBJC_CLASS___NSPQuicProxyPath),  0LL);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    uint64_t v60 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v59 forKey:@"proxyAgentPreferredQuicProxyPaths"]);
    preferredQUICProxyPaths = v5->_preferredQUICProxyPaths;
    v5->_preferredQUICProxyPaths = (NSMutableDictionary *)v60;

    id v62 = [v4 decodeObjectOfClass:objc_opt_class(NSPCandidateQuicProxyPath) forKey:@"proxyAgentCandidateQuicProxyPath"];
    uint64_t v63 = objc_claimAutoreleasedReturnValue(v62);
    candidateQuicProxyPath = v5->_candidateQuicProxyPath;
    v5->_candidateQuicProxyPath = (NSPCandidateQuicProxyPath *)v63;

    id v65 = [v4 decodeObjectOfClass:objc_opt_class(NSPCandidateFallbackProxyPath) forKey:@"proxyAgentCandidateFallbackProxyPath"];
    uint64_t v66 = objc_claimAutoreleasedReturnValue(v65);
    candidateFallbackProxyPath = v5->_candidateFallbackProxyPath;
    v5->_candidateFallbackProxyPath = (NSPCandidateFallbackProxyPath *)v66;

    uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSString);
    v70 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v68,  v69,  objc_opt_class(&OBJC_CLASS___NSPCandidateQuicProxyPath),  0LL);
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    uint64_t v72 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v71 forKey:@"proxyAgentCandidatePreferredQuicProxyPaths"]);
    candidatePreferredQUICProxyPaths = v5->_candidatePreferredQUICProxyPaths;
    v5->_candidatePreferredQUICProxyPaths = (NSMutableDictionary *)v72;

    uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSArray);
    v75 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v74,  objc_opt_class(&OBJC_CLASS___NSPProxiedContentPath),  0LL);
    v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
    uint64_t v77 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v76 forKey:@"proxyAgentProxiedContentPaths"]);
    proxiedContentPaths = v5->_proxiedContentPaths;
    v5->_proxiedContentPaths = (NSMutableArray *)v77;

    uint64_t v79 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSString);
    v81 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v79,  v80,  objc_opt_class(&OBJC_CLASS___NSPQuicProxyPath),  0LL);
    v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
    uint64_t v83 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v82 forKey:@"proxyAgentNetworkQuicProxyPaths"]);
    networkSpecificQUICProxyPaths = v5->_networkSpecificQUICProxyPaths;
    v5->_networkSpecificQUICProxyPaths = (NSMutableDictionary *)v83;

    uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v86 = objc_opt_class(&OBJC_CLASS___NSString);
    v87 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v85,  v86,  objc_opt_class(&OBJC_CLASS___NSPPrivacyProxyProxyInfo),  0LL);
    v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
    uint64_t v89 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v88 forKey:@"proxyAgentNetworkDiscoveredProxyInfos"]);
    networkDiscoveredProxyInfos = v5->_networkDiscoveredProxyInfos;
    v5->_networkDiscoveredProxyInfos = (NSMutableDictionary *)v89;

    uint64_t v91 = objc_opt_class(&OBJC_CLASS___NSArray);
    v92 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v91,  objc_opt_class(&OBJC_CLASS___NSPObliviousPath),  0LL);
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    uint64_t v94 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v93 forKey:@"proxyAgentObliviousPaths"]);
    obliviousPaths = v5->_obliviousPaths;
    v5->_obliviousPaths = (NSMutableArray *)v94;

    id v96 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentLastQuicProxySwitchedDate"];
    uint64_t v97 = objc_claimAutoreleasedReturnValue(v96);
    lastQuicProxySwitchedDate = v5->_lastQuicProxySwitchedDate;
    v5->_lastQuicProxySwitchedDate = (NSDate *)v97;

    id v99 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentLastFallbackProxySwitchedDate"];
    uint64_t v100 = objc_claimAutoreleasedReturnValue(v99);
    lastFallbackProxySwitchedDate = v5->_lastFallbackProxySwitchedDate;
    v5->_lastFallbackProxySwitchedDate = (NSDate *)v100;

    id v102 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentProbeStartTime"];
    uint64_t v103 = objc_claimAutoreleasedReturnValue(v102);
    probeStartTime = v5->_probeStartTime;
    v5->_probeStartTime = (NSDate *)v103;

    id v105 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentProbeEndTime"];
    uint64_t v106 = objc_claimAutoreleasedReturnValue(v105);
    probeEndTime = v5->_probeEndTime;
    v5->_probeEndTime = (NSDate *)v106;

    id v108 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSPProxyTokenInfo) forKey:@"proxyAgentProxyTokenInfoArray"];
    v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
    if (v109)
    {
      uint64_t v110 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v109));
      proxyTokenInfoArray = v5->_proxyTokenInfoArray;
      v5->_proxyTokenInfoArray = (NSMutableArray *)v110;
    }

    id v112 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentTokenIssuanceRestrictedUntilDate"];
    uint64_t v113 = objc_claimAutoreleasedReturnValue(v112);
    tokenIssuanceRestrictedUntilDate = v5->_tokenIssuanceRestrictedUntilDate;
    v5->_tokenIssuanceRestrictedUntilDate = (NSDate *)v113;

    id v115 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentLastPathUnsatisfiedDate"];
    uint64_t v116 = objc_claimAutoreleasedReturnValue(v115);
    lastPathUnsatisfiedDate = v5->_lastPathUnsatisfiedDate;
    v5->_lastPathUnsatisfiedDate = (NSDate *)v116;

    id v118 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyAgentLastPrimaryInterfaceChangeDate"];
    uint64_t v119 = objc_claimAutoreleasedReturnValue(v118);
    lastPrimaryInterfaceChangedDate = v5->_lastPrimaryInterfaceChangedDate;
    v5->_lastPrimaryInterfaceChangedDate = (NSDate *)v119;

    uint64_t v121 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v122 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v123 = objc_opt_class(&OBJC_CLASS___NSString);
    v124 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v121,  v122,  v123,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
    uint64_t v126 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v125 forKey:@"proxyAgentNetworkCharacteristics"]);
    networkCharacteristics = v5->_networkCharacteristics;
    v5->_networkCharacteristics = (NSDictionary *)v126;

    v5->_useDefaultInterface = [v4 decodeBoolForKey:@"proxyAgentUseDefaultInterface"];
    v5->_subscriber = [v4 decodeBoolForKey:@"proxyAgentSubscriber"];
    v5->_unlimited = [v4 decodeBoolForKey:@"proxyAgentUnlimited"];
    v5->_geohashSharingEnabled = [v4 decodeBoolForKey:@"proxyAgentGeohashSharingEnabled"];
    id v128 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"proxyAgentGeohashOverride"];
    v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
    -[NSPPrivacyProxyAgentManager setGeohashOverride:](v5, "setGeohashOverride:", v129);

    -[NSPPrivacyProxyAgentManager setDnsFilteringHintEnabled:]( v5,  "setDnsFilteringHintEnabled:",  [v4 decodeBoolForKey:@"proxyAgentDNSFilteringHintEnabled"]);
    v5->_networkProxiesRotated = (unint64_t)[v4 decodeIntegerForKey:@"proxyAgentNetworkProxiesRotated"];
    v5->_networkFallbackProxiesRotated = (unint64_t)[v4 decodeIntegerForKey:@"proxyAgentNetworkFallbackProxiesRotated"];
    v5->_proxiesRotated = (unint64_t)[v4 decodeIntegerForKey:@"proxyAgentProxiesRotated"];
    id v130 = [v4 decodeObjectOfClass:objc_opt_class(NSPProber) forKey:@"proxyAgentProxyPathProber"];
    uint64_t v131 = objc_claimAutoreleasedReturnValue(v130);
    proxyPathProber = v5->_proxyPathProber;
    v5->_proxyPathProber = (NSPProber *)v131;

    id v133 = [v4 decodeObjectOfClass:objc_opt_class(NSPProber) forKey:@"proxyAgentDirectPathProber"];
    uint64_t v134 = objc_claimAutoreleasedReturnValue(v133);
    directPathProber = v5->_directPathProber;
    v5->_directPathProber = (NSPProber *)v134;

    id v136 = [v4 decodeObjectOfClass:objc_opt_class(NSPOutageReasonStats) forKey:@"proxyAgentLastProxyOutageReasonStats"];
    uint64_t v137 = objc_claimAutoreleasedReturnValue(v136);
    lastProxyOutageReasonStats = v5->_lastProxyOutageReasonStats;
    v5->_lastProxyOutageReasonStats = (NSPOutageReasonStats *)v137;

    id v139 = [v4 decodeObjectOfClass:objc_opt_class(NSPOutageReasonStats) forKey:@"proxyAgentLastTokenOutageReasonStats"];
    uint64_t v140 = objc_claimAutoreleasedReturnValue(v139);
    lastTokenOutageReasonStats = v5->_lastTokenOutageReasonStats;
    v5->_lastTokenOutageReasonStats = (NSPOutageReasonStats *)v140;

    v5->_probingReason = (int64_t)[v4 decodeIntegerForKey:@"proxyAgentProbingReason"];
    v5->_reportedTokenOutage = [v4 decodeBoolForKey:@"proxyAgentReportedTokenOutage"];
    id v142 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"proxyAgentConfigEpoch"];
    uint64_t v143 = objc_claimAutoreleasedReturnValue(v142);
    configEpoch = v5->_configEpoch;
    v5->_configEpoch = (NSNumber *)v143;

    id v145 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"proxyAgentReportedEpoch"];
    uint64_t v146 = objc_claimAutoreleasedReturnValue(v145);
    reportedEpoch = v5->_reportedEpoch;
    v5->_reportedEpoch = (NSNumber *)v146;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  if (self)
  {
    [v15 encodeObject:self->_proxyArray forKey:@"proxyAgentProxyArray"];
    [v15 encodeObject:self->_resolverArray forKey:@"proxyAgentResolverArray"];
    [v15 encodeObject:self->_proxyPathList forKey:@"proxyAgentProxyPathList"];
    [v15 encodeObject:self->_fallbackProxyPathList forKey:@"proxyAgentFallbackProxyPathList"];
    [v15 encodeObject:self->_obliviousConfigs forKey:@"proxyAgentObliviousConfigs"];
    proxiedContentMaps = self->_proxiedContentMaps;
  }

  else
  {
    [v15 encodeObject:0 forKey:@"proxyAgentProxyArray"];
    [v15 encodeObject:0 forKey:@"proxyAgentResolverArray"];
    [v15 encodeObject:0 forKey:@"proxyAgentProxyPathList"];
    [v15 encodeObject:0 forKey:@"proxyAgentFallbackProxyPathList"];
    [v15 encodeObject:0 forKey:@"proxyAgentObliviousConfigs"];
    proxiedContentMaps = 0LL;
  }

  [v15 encodeObject:proxiedContentMaps forKey:@"proxyAgentProxiedContentMaps"];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
  [v15 encodeObject:v5 forKey:@"proxyAgentOverridePreferredProxy"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy](self, "overridePreferredObliviousProxy"));
  [v15 encodeObject:v6 forKey:@"proxyAgentOverridePreferredObliviousProxy"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
  [v15 encodeObject:v7 forKey:@"proxyAgentOverrideIngressProxy"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
  [v15 encodeObject:v8 forKey:@"proxyAgentOverrideFallbackIngressProxy"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
  [v15 encodeObject:v9 forKey:@"proxyAgentOverrideIngressProxyKey"];

  if (self)
  {
    [v15 encodeObject:self->_overrideEnabledMaps forKey:@"proxyAgentOverrideEnabledMaps"];
    [v15 encodeBool:self->_disableProxiedContentDoHBootstrap forKey:@"proxyAgentDisableProxiedContentDoHBootstrap"];
    [v15 encodeObject:self->_quicProxyPath forKey:@"proxyAgentQuicProxyPath"];
    [v15 encodeObject:self->_fallbackProxyPath forKey:@"proxyAgentFallbackProxyPath"];
    [v15 encodeObject:self->_preferredQUICProxyPaths forKey:@"proxyAgentPreferredQuicProxyPaths"];
    [v15 encodeObject:self->_candidateQuicProxyPath forKey:@"proxyAgentCandidateQuicProxyPath"];
    [v15 encodeObject:self->_candidateFallbackProxyPath forKey:@"proxyAgentCandidateFallbackProxyPath"];
    [v15 encodeObject:self->_candidatePreferredQUICProxyPaths forKey:@"proxyAgentCandidatePreferredQuicProxyPaths"];
    [v15 encodeObject:self->_proxiedContentPaths forKey:@"proxyAgentProxiedContentPaths"];
    [v15 encodeObject:self->_networkSpecificQUICProxyPaths forKey:@"proxyAgentNetworkQuicProxyPaths"];
    [v15 encodeObject:self->_networkDiscoveredProxyInfos forKey:@"proxyAgentNetworkDiscoveredProxyInfos"];
    [v15 encodeObject:self->_obliviousPaths forKey:@"proxyAgentObliviousPaths"];
    [v15 encodeObject:self->_lastQuicProxySwitchedDate forKey:@"proxyAgentLastQuicProxySwitchedDate"];
    [v15 encodeObject:self->_lastFallbackProxySwitchedDate forKey:@"proxyAgentLastFallbackProxySwitchedDate"];
    [v15 encodeObject:self->_probeStartTime forKey:@"proxyAgentProbeStartTime"];
    [v15 encodeObject:self->_probeEndTime forKey:@"proxyAgentProbeEndTime"];
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }

  else
  {
    [v15 encodeObject:0 forKey:@"proxyAgentOverrideEnabledMaps"];
    [v15 encodeBool:0 forKey:@"proxyAgentDisableProxiedContentDoHBootstrap"];
    [v15 encodeObject:0 forKey:@"proxyAgentQuicProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentFallbackProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentPreferredQuicProxyPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentCandidateQuicProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentCandidateFallbackProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentCandidatePreferredQuicProxyPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentProxiedContentPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentNetworkQuicProxyPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentNetworkDiscoveredProxyInfos"];
    [v15 encodeObject:0 forKey:@"proxyAgentObliviousPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastQuicProxySwitchedDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastFallbackProxySwitchedDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentProbeStartTime"];
    [v15 encodeObject:0 forKey:@"proxyAgentProbeEndTime"];
    proxyTokenInfoArray = 0LL;
  }

  [v15 encodeObject:proxyTokenInfoArray forKey:@"proxyAgentProxyTokenInfoArray"];
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));
  [v15 encodeObject:v11 forKey:@"proxyAgentTokenIssuanceRestrictedUntilDate"];

  if (self)
  {
    [v15 encodeObject:self->_lastPathUnsatisfiedDate forKey:@"proxyAgentLastPathUnsatisfiedDate"];
    [v15 encodeObject:self->_lastPrimaryInterfaceChangedDate forKey:@"proxyAgentLastPrimaryInterfaceChangeDate"];
    [v15 encodeObject:self->_networkCharacteristics forKey:@"proxyAgentNetworkCharacteristics"];
    [v15 encodeBool:self->_useDefaultInterface forKey:@"proxyAgentUseDefaultInterface"];
    [v15 encodeBool:self->_subscriber forKey:@"proxyAgentSubscriber"];
    [v15 encodeBool:self->_unlimited forKey:@"proxyAgentUnlimited"];
    BOOL geohashSharingEnabled = self->_geohashSharingEnabled;
  }

  else
  {
    [v15 encodeObject:0 forKey:@"proxyAgentLastPathUnsatisfiedDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastPrimaryInterfaceChangeDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentNetworkCharacteristics"];
    [v15 encodeBool:0 forKey:@"proxyAgentUseDefaultInterface"];
    [v15 encodeBool:0 forKey:@"proxyAgentSubscriber"];
    [v15 encodeBool:0 forKey:@"proxyAgentUnlimited"];
    BOOL geohashSharingEnabled = 0LL;
  }

  [v15 encodeBool:geohashSharingEnabled forKey:@"proxyAgentGeohashSharingEnabled"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager geohashOverride](self, "geohashOverride"));
  [v15 encodeObject:v13 forKey:@"proxyAgentGeohashOverride"];

  objc_msgSend( v15,  "encodeBool:forKey:",  -[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled"),  @"proxyAgentDNSFilteringHintEnabled");
  if (self)
  {
    [v15 encodeInteger:self->_networkProxiesRotated forKey:@"proxyAgentNetworkProxiesRotated"];
    [v15 encodeInteger:self->_networkFallbackProxiesRotated forKey:@"proxyAgentNetworkFallbackProxiesRotated"];
    [v15 encodeInteger:self->_proxiesRotated forKey:@"proxyAgentProxiesRotated"];
    [v15 encodeObject:self->_proxyPathProber forKey:@"proxyAgentProxyPathProber"];
    [v15 encodeObject:self->_directPathProber forKey:@"proxyAgentDirectPathProber"];
    [v15 encodeObject:self->_lastProxyOutageReasonStats forKey:@"proxyAgentLastProxyOutageReasonStats"];
    [v15 encodeObject:self->_lastTokenOutageReasonStats forKey:@"proxyAgentLastTokenOutageReasonStats"];
    [v15 encodeInteger:self->_probingReason forKey:@"proxyAgentProbingReason"];
    [v15 encodeBool:self->_reportedTokenOutage forKey:@"proxyAgentReportedTokenOutage"];
    [v15 encodeObject:self->_configEpoch forKey:@"proxyAgentConfigEpoch"];
    reportedEpoch = self->_reportedEpoch;
  }

  else
  {
    [v15 encodeInteger:0 forKey:@"proxyAgentNetworkProxiesRotated"];
    [v15 encodeInteger:0 forKey:@"proxyAgentNetworkFallbackProxiesRotated"];
    [v15 encodeInteger:0 forKey:@"proxyAgentProxiesRotated"];
    [v15 encodeObject:0 forKey:@"proxyAgentProxyPathProber"];
    [v15 encodeObject:0 forKey:@"proxyAgentDirectPathProber"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastProxyOutageReasonStats"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastTokenOutageReasonStats"];
    [v15 encodeInteger:0 forKey:@"proxyAgentProbingReason"];
    [v15 encodeBool:0 forKey:@"proxyAgentReportedTokenOutage"];
    [v15 encodeObject:0 forKey:@"proxyAgentConfigEpoch"];
    reportedEpoch = 0LL;
  }

  [v15 encodeObject:reportedEpoch forKey:@"proxyAgentReportedEpoch"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPPrivacyProxyAgentManager init]( +[NSPPrivacyProxyAgentManager allocWithZone:](&OBJC_CLASS___NSPPrivacyProxyAgentManager, "allocWithZone:", a3),  "init");
  uint64_t v5 = (uint64_t)v4;
  if (self)
  {
    id v6 = self->_proxyArray;
    sub_100023D24(v5, v6);

    resolverArray = self->_resolverArray;
  }

  else
  {
    sub_100023D24((uint64_t)v4, 0LL);
    resolverArray = 0LL;
  }

  v8 = resolverArray;
  sub_100023D34(v5, v8);

  if (self)
  {
    id v9 = self->_proxyPathList;
    sub_100023D44(v5, v9);

    proxyPathCustomEnumerator = self->_proxyPathCustomEnumerator;
  }

  else
  {
    sub_100023D44(v5, 0LL);
    proxyPathCustomEnumerator = 0LL;
  }

  v11 = proxyPathCustomEnumerator;
  sub_100023D54(v5, v11);

  if (self)
  {
    id v12 = self->_fallbackProxyPathList;
    sub_100023D64(v5, v12);

    fallbackProxyPathCustomEnumerator = self->_fallbackProxyPathCustomEnumerator;
  }

  else
  {
    sub_100023D64(v5, 0LL);
    fallbackProxyPathCustomEnumerator = 0LL;
  }

  id v14 = fallbackProxyPathCustomEnumerator;
  sub_100023D74(v5, v14);

  if (self)
  {
    id v15 = self->_obliviousConfigs;
    sub_100023D84(v5, v15);

    penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
  }

  else
  {
    sub_100023D84(v5, 0LL);
    penalizedObliviousProxyIndices = 0LL;
  }

  uint64_t v17 = penalizedObliviousProxyIndices;
  sub_100023D94(v5, v17);

  if (self)
  {
    uint64_t v18 = self->_proxiedContentMaps;
    sub_100023DA4(v5, v18);

    networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
  }

  else
  {
    sub_100023DA4(v5, 0LL);
    networkSpecificQUICProxyPaths = 0LL;
  }

  id v20 = networkSpecificQUICProxyPaths;
  if (v5) {
    objc_storeStrong((id *)(v5 + 328), networkSpecificQUICProxyPaths);
  }

  if (self) {
    networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
  }
  else {
    networkDiscoveredProxyInfos = 0LL;
  }
  uint64_t v22 = networkDiscoveredProxyInfos;
  sub_100023DB4(v5, v22);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
  sub_10000E02C(v5, v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy]( self,  "overridePreferredObliviousProxy"));
  sub_100006F58(v5, v24);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
  sub_10000E03C(v5, v25);

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
  sub_10000C7E4(v5, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
  sub_100023DC4(v5, v27);

  if (self)
  {
    id v28 = self->_overrideEnabledMaps;
    id v29 = -[NSMutableArray copy](v28, "copy");
    sub_100023DD4(v5, v29);

    BOOL disableProxiedContentDoHBootstrap = self->_disableProxiedContentDoHBootstrap;
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  id v81 = [0 copy];
  sub_100023DD4(v5, v81);

  BOOL disableProxiedContentDoHBootstrap = 0;
  if (v5) {
LABEL_17:
  }
    *(_BYTE *)(v5 + 11) = disableProxiedContentDoHBootstrap;
LABEL_18:
  if (self)
  {
    id v31 = self->_quicProxyPath;
    sub_100023DE4(v5, v31);

    fallbackProxyPath = self->_fallbackProxyPath;
  }

  else
  {
    sub_100023DE4(v5, 0LL);
    fallbackProxyPath = 0LL;
  }

  uint64_t v33 = fallbackProxyPath;
  sub_100023DF4(v5, v33);

  if (self)
  {
    id v34 = self->_candidateQuicProxyPath;
    sub_100023E04(v5, v34);

    candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
  }

  else
  {
    sub_100023E04(v5, 0LL);
    candidateFallbackProxyPath = 0LL;
  }

  uint64_t v36 = candidateFallbackProxyPath;
  sub_100023E14(v5, v36);

  if (self)
  {
    id v37 = self->_lastQuicProxySwitchedDate;
    sub_100023E24(v5, v37);

    lastFallbackProxySwitchedDate = self->_lastFallbackProxySwitchedDate;
  }

  else
  {
    sub_100023E24(v5, 0LL);
    lastFallbackProxySwitchedDate = 0LL;
  }

  v39 = lastFallbackProxySwitchedDate;
  if (v5) {
    objc_storeStrong((id *)(v5 + 296), lastFallbackProxySwitchedDate);
  }

  if (self)
  {
    id v40 = self->_proxyTokenInfoArray;
    sub_100023E34(v5, v40);

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));
    sub_10001F910(v5, v41);

    path = self->_path;
  }

  else
  {
    sub_100023E34(v5, 0LL);
    v82 = (void *)objc_claimAutoreleasedReturnValue([0 tokenIssuanceRestrictedUntilDate]);
    sub_10001F910(v5, v82);

    path = 0LL;
  }

  uint64_t v43 = path;
  sub_100023E44(v5, v43);

  if (self)
  {
    uint64_t v44 = self->_lastPathUnsatisfiedDate;
    sub_100023E54(v5, v44);

    lastPrimaryInterfaceChangedDate = self->_lastPrimaryInterfaceChangedDate;
  }

  else
  {
    sub_100023E54(v5, 0LL);
    lastPrimaryInterfaceChangedDate = 0LL;
  }

  v46 = lastPrimaryInterfaceChangedDate;
  sub_100023E64(v5, v46);

  if (self)
  {
    v47 = self->_probeStartTime;
    sub_100023E74(v5, v47);

    probeEndTime = self->_probeEndTime;
  }

  else
  {
    sub_100023E74(v5, 0LL);
    probeEndTime = 0LL;
  }

  v49 = probeEndTime;
  if (v5) {
    objc_storeStrong((id *)(v5 + 280), probeEndTime);
  }

  if (self)
  {
    id v50 = self->_networkCharacteristics;
    sub_100023E84(v5, v50);

    BOOL useDefaultInterface = self->_useDefaultInterface;
    if (!v5) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  sub_100023E84(v5, 0LL);
  BOOL useDefaultInterface = 0;
  if (v5) {
LABEL_36:
  }
    *(_BYTE *)(v5 + 12) = useDefaultInterface;
LABEL_37:
  if (self)
  {
    BOOL subscriber = self->_subscriber;
    if (!v5) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }

  BOOL subscriber = 0;
  if (v5) {
LABEL_39:
  }
    *(_BYTE *)(v5 + 13) = subscriber;
LABEL_40:
  if (self)
  {
    BOOL unlimited = self->_unlimited;
    if (!v5) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }

  BOOL unlimited = 0;
  if (v5) {
LABEL_42:
  }
    *(_BYTE *)(v5 + 14) = unlimited;
LABEL_43:
  if (self)
  {
    BOOL geohashSharingEnabled = self->_geohashSharingEnabled;
    if (!v5) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }

  BOOL geohashSharingEnabled = 0;
  if (v5) {
LABEL_45:
  }
    *(_BYTE *)(v5 + 15) = geohashSharingEnabled;
LABEL_46:
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager geohashOverride](self, "geohashOverride"));
  [(id)v5 setGeohashOverride:v55];

  objc_msgSend( (id)v5,  "setDnsFilteringHintEnabled:",  -[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled"));
  if (self)
  {
    BOOL proxyConnectivityCheckActive = self->_proxyConnectivityCheckActive;
    if (!v5) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

  BOOL proxyConnectivityCheckActive = 0;
  if (v5) {
LABEL_48:
  }
    *(_BYTE *)(v5 + 16) = proxyConnectivityCheckActive;
LABEL_49:
  if (self)
  {
    unint64_t tokenFetchSuccessCount = self->_tokenFetchSuccessCount;
    if (!v5) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }

  unint64_t tokenFetchSuccessCount = 0LL;
  if (v5) {
LABEL_51:
  }
    *(void *)(v5 + 416) = tokenFetchSuccessCount;
LABEL_52:
  if (self)
  {
    unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
    if (!v5) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }

  unint64_t tokenFetchFailedCount = 0LL;
  if (v5) {
LABEL_54:
  }
    *(void *)(v5 + 424) = tokenFetchFailedCount;
LABEL_55:
  if (self)
  {
    unint64_t tokenConsumedCount = self->_tokenConsumedCount;
    if (!v5) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }

  unint64_t tokenConsumedCount = 0LL;
  if (v5) {
LABEL_57:
  }
    *(void *)(v5 + 432) = tokenConsumedCount;
LABEL_58:
  if (self)
  {
    unint64_t tokenExpiredCount = self->_tokenExpiredCount;
    if (!v5) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }

  unint64_t tokenExpiredCount = 0LL;
  if (v5) {
LABEL_60:
  }
    *(void *)(v5 + 440) = tokenExpiredCount;
LABEL_61:
  if (self)
  {
    unint64_t agentLowWaterMarkHitCount = self->_agentLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }

  unint64_t agentLowWaterMarkHitCount = 0LL;
  if (v5) {
LABEL_63:
  }
    *(void *)(v5 + 448) = agentLowWaterMarkHitCount;
LABEL_64:
  if (self)
  {
    unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }

  unint64_t cacheLowWaterMarkHitCount = 0LL;
  if (v5) {
LABEL_66:
  }
    *(void *)(v5 + 456) = cacheLowWaterMarkHitCount;
LABEL_67:
  if (self)
  {
    unint64_t networkProxiesRotated = self->_networkProxiesRotated;
    if (!v5) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }

  unint64_t networkProxiesRotated = 0LL;
  if (v5) {
LABEL_69:
  }
    *(void *)(v5 + 480) = networkProxiesRotated;
LABEL_70:
  if (self)
  {
    unint64_t networkFallbackProxiesRotated = self->_networkFallbackProxiesRotated;
    if (!v5) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }

  unint64_t networkFallbackProxiesRotated = 0LL;
  if (v5) {
LABEL_72:
  }
    *(void *)(v5 + 488) = networkFallbackProxiesRotated;
LABEL_73:
  if (self)
  {
    unint64_t proxiesRotated = self->_proxiesRotated;
    if (!v5) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }

  unint64_t proxiesRotated = 0LL;
  if (v5) {
LABEL_75:
  }
    *(void *)(v5 + 496) = proxiesRotated;
LABEL_76:
  if (self)
  {
    unint64_t generation = self->_generation;
    if (!v5) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }

  unint64_t generation = 0LL;
  if (v5) {
LABEL_78:
  }
    *(void *)(v5 + 544) = generation;
LABEL_79:
  if (self)
  {
    v67 = self->_proxyPathProber;
    sub_100023E94(v5, v67);

    directPathProber = self->_directPathProber;
  }

  else
  {
    sub_100023E94(v5, 0LL);
    directPathProber = 0LL;
  }

  uint64_t v69 = directPathProber;
  if (v5) {
    objc_storeStrong((id *)(v5 + 248), directPathProber);
  }

  if (self)
  {
    v70 = self->_pvdConfigurationFetcher;
    sub_100023EA4(v5, v70);

    lastProxyOutageReasonStats = self->_lastProxyOutageReasonStats;
  }

  else
  {
    sub_100023EA4(v5, 0LL);
    lastProxyOutageReasonStats = 0LL;
  }

  uint64_t v72 = lastProxyOutageReasonStats;
  if (v5) {
    objc_storeStrong((id *)(v5 + 504), lastProxyOutageReasonStats);
  }

  if (self)
  {
    v73 = self->_lastTokenOutageReasonStats;
    sub_100023EB4(v5, v73);

    int64_t probingReason = self->_probingReason;
    if (!v5) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }

  sub_100023EB4(v5, 0LL);
  int64_t probingReason = 0LL;
  if (v5) {
LABEL_89:
  }
    *(void *)(v5 + 520) = probingReason;
LABEL_90:
  if (self)
  {
    BOOL reportedTokenOutage = self->_reportedTokenOutage;
    if (!v5) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }

  BOOL reportedTokenOutage = 0;
  if (v5) {
LABEL_92:
  }
    *(_BYTE *)(v5 + 17) = reportedTokenOutage;
LABEL_93:
  if (self)
  {
    v76 = self->_configEpoch;
    sub_100023EC4(v5, v76);

    reportedEpoch = self->_reportedEpoch;
  }

  else
  {
    sub_100023EC4(v5, 0LL);
    reportedEpoch = 0LL;
  }

  v78 = reportedEpoch;
  sub_100023ED4(v5, v78);

  id v79 = (id)v5;
  return v79;
}

- (void)dealloc
{
  uint64_t v4 = nplog_obj(self, a2, v2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc: \nProxy Agent Manager: %@", buf, 0xCu);
  }

  if (self)
  {
    tokenIssuanceRestrictedUntilTimer = self->_tokenIssuanceRestrictedUntilTimer;
    if (tokenIssuanceRestrictedUntilTimer)
    {
      dispatch_source_cancel((dispatch_source_t)tokenIssuanceRestrictedUntilTimer);
      sub_100024240((uint64_t)self);
    }

    proxyPathRestoreTimer = self->_proxyPathRestoreTimer;
    if (proxyPathRestoreTimer)
    {
      dispatch_source_cancel((dispatch_source_t)proxyPathRestoreTimer);
      objc_storeStrong((id *)&self->_proxyPathRestoreTimer, 0LL);
    }

    replenishTokenTimer = self->_replenishTokenTimer;
    if (replenishTokenTimer)
    {
      dispatch_source_cancel((dispatch_source_t)replenishTokenTimer);
      objc_storeStrong((id *)&self->_replenishTokenTimer, 0LL);
    }
  }

  +[NSPPrivacyProxyAgentManager removeProxyInfoFromKeychain]( &OBJC_CLASS___NSPPrivacyProxyAgentManager,  "removeProxyInfoFromKeychain");
  objc_opt_self(&OBJC_CLASS___NSPPrivacyProxyAgentManager);
  _CFPreferencesSetFileProtectionClass( kCFPreferencesCurrentApplication,  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  0LL,  3LL);
  CFPreferencesSetAppValue(@"NSPProxyAgentManagerPreferences", 0LL, kCFPreferencesCurrentApplication);
  uint64_t v9 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  int v10 = v9;
  uint64_t v13 = nplog_obj(v9, v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Removed proxy agent info from preference file",  buf,  2u);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to remove proxy agent data from preference file",  buf,  2u);
  }

  uint64_t v16 = objc_opt_self(&OBJC_CLASS___NSPPrivacyProxyAgentManager);
  uint64_t v19 = nplog_obj(v16, v17, v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "remove userevent agent data", buf, 2u);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
  [v21 setAuxiliaryData:@"NIL" forKey:@"NSPProxyAgentManagerAuxilaryData"];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
  [v22 commit];

  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained multiHopProxyAgentRegistered:0];

    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
  }

  else
  {
    [0 multiHopProxyAgentRegistered:0];
    id v24 = 0LL;
  }

  [v24 singleHopProxyAgentRegistered:0];

  if (self)
  {
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    [v25 multiHopFallbackProxyAgentRegistered:0];

    id v26 = objc_loadWeakRetained((id *)&self->_delegate);
  }

  else
  {
    [0 multiHopFallbackProxyAgentRegistered:0];
    id v26 = 0LL;
  }

  [v26 singleHopFallbackProxyAgentRegistered:0];

  if (self) {
    ++self->_generation;
  }
  +[NPUtilities postNotification:value:]( &OBJC_CLASS___NPUtilities,  "postNotification:value:",  @"com.apple.networkserviceproxy.privacy-proxy-path-changed");
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NSPPrivacyProxyAgentManager;
  -[NSPPrivacyProxyAgentManager dealloc](&v27, "dealloc");
}

- (id)copyDomainFiltersDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  if (self) {
    candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
  }
  else {
    candidatePreferredQUICProxyPaths = 0LL;
  }
  uint64_t v5 = candidatePreferredQUICProxyPaths;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v9);
        if (self) {
          uint64_t v11 = self->_candidatePreferredQUICProxyPaths;
        }
        else {
          uint64_t v11 = 0LL;
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v9),  (void)v17));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 domainFilter]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 domainFilter]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v10);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      id v7 = v15;
    }

    while (v15);
  }

  return v3;
}

- (NSPPrivacyProxyAgentManager)initWithDelegate:(id)a3 toggleStats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v141.receiver = self;
  v141.super_class = (Class)&OBJC_CLASS___NSPPrivacyProxyAgentManager;
  uint64_t v8 = -[NSPPrivacyProxyAgentManager init](&v141, "init");
  if (!v8) {
    goto LABEL_114;
  }
  objc_opt_self(&OBJC_CLASS___NSPPrivacyProxyAgentManager);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
  id v10 = [v9 copyAuxiliaryDataForKey:@"NSPProxyAgentManagerAuxilaryData"];

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v12 = 0LL;
  }
  else {
    id v12 = v10;
  }

  objc_storeStrong((id *)&v8->_toggleStats, a4);
  if (!v12)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    id v65 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    proxyTokenInfoArray = v8->_proxyTokenInfoArray;
    v8->_proxyTokenInfoArray = v65;

    v8->_proxyPathRestoreIntervalSec = (unint64_t)sub_100024254((uint64_t)&OBJC_CLASS___NSPPrivacyProxyAgentManager);
    id v67 = sub_100024C98((uint64_t)&OBJC_CLASS___NSPPrivacyProxyAgentManager);
    id v37 = v67;
    if (v67)
    {
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"ConfiguredProxies"]);
      if (v68)
      {
        uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v68, v69) & 1) != 0)
        {
          v70 = (NSMutableDictionary *)[v68 mutableCopy];
          savedConfiguredProxies = v8->_savedConfiguredProxies;
          v8->_savedConfiguredProxies = v70;
        }
      }

      id v124 = v6;
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"PreferredPaths"]);
      if (v72)
      {
        uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v72, v73) & 1) != 0)
        {
          uint64_t v74 = (NSMutableArray *)[v72 mutableCopy];
          savedConfiguredPreferredPaths = v8->_savedConfiguredPreferredPaths;
          v8->_savedConfiguredPreferredPaths = v74;
        }
      }

      id v76 = sub_100024368();
      id v122 = v7;
      if (v76
        || (id v76 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"OverridePreferredProxy"])) != 0)
      {
        uint64_t v77 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v76, v77) & 1) != 0) {
          objc_storeStrong((id *)&v8->_overridePreferredProxy, v76);
        }
      }

      id v78 = sub_10002445C();
      id v79 = v8;
      if (v78
        || (id v78 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"OverridePreferredObliviousProxy"])) != 0)
      {
        uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v78, v80) & 1) != 0) {
          objc_storeStrong((id *)&v8->_overridePreferredObliviousProxy, v78);
        }
      }

      id v81 = sub_100024550();
      uint64_t v131 = v68;
      if (v81
        || (id v81 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"OverrideIngressProxy"])) != 0)
      {
        uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0) {
          objc_storeStrong((id *)&v79->_overrideIngressProxy, v81);
        }
      }

      id v83 = sub_100024644();
      if (v83
        || (id v83 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"OverrideFallbackIngressProxy"])) != 0)
      {
        uint64_t v84 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0) {
          objc_storeStrong((id *)&v79->_overrideFallbackIngressProxy, v83);
        }
      }

      id v85 = sub_100024738();
      if (v85
        || (id v85 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"OverrideIngressProxyKey"])) != 0)
      {
        uint64_t v86 = objc_opt_class(&OBJC_CLASS___NSData);
        if ((objc_opt_isKindOfClass(v85, v86) & 1) != 0) {
          objc_storeStrong((id *)&v79->_overrideIngressProxyKey, v85);
        }
      }

      id v87 = sub_10002482C();
      v88 = v37;
      if ((v87
         || (id v87 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"OverrideEnabledMaps"])) != 0)
        && (uint64_t v89 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v87, v89) & 1) != 0))
      {
        v90 = (NSMutableArray *)[v87 mutableCopy];
        uint64_t v91 = v79;
        overrideEnabledMaps = v79->_overrideEnabledMaps;
        v79->_overrideEnabledMaps = v90;
      }

      else
      {
        uint64_t v91 = v79;
      }

      unsigned __int8 v110 = sub_100024920();
      v91->_BOOL disableProxiedContentDoHBootstrap = v110;
      if ((v110 & 1) == 0)
      {
        v111 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"DisableProxiedContentDoHBootstrap"]);
        if (v111)
        {
          uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0) {
            v79->_BOOL disableProxiedContentDoHBootstrap = [v111 BOOLValue];
          }
        }
      }

      unsigned __int8 v113 = sub_100024A20();
      v79->_forceFallback = v113;
      id v37 = v88;
      if ((v113 & 1) == 0)
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"ForceFallback"]);
        if (v114)
        {
          uint64_t v115 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v114, v115) & 1) != 0) {
            v79->_forceFallback = [v114 BOOLValue];
          }
        }

        id v37 = v88;
      }

      id v7 = v122;
      id v6 = v124;
      uint64_t v8 = v79;
      id v12 = 0LL;
    }

    else
    {
      uint64_t v97 = (NSString *)sub_100024368();
      overridePreferredProxy = v8->_overridePreferredProxy;
      v8->_overridePreferredProxy = v97;

      id v99 = (NSString *)sub_10002445C();
      overridePreferredObliviousProxy = v8->_overridePreferredObliviousProxy;
      v8->_overridePreferredObliviousProxy = v99;

      v101 = (NSString *)sub_100024550();
      overrideIngressProxy = v8->_overrideIngressProxy;
      v8->_overrideIngressProxy = v101;

      uint64_t v103 = (NSString *)sub_100024644();
      overrideFallbackIngressProxy = v8->_overrideFallbackIngressProxy;
      v8->_overrideFallbackIngressProxy = v103;

      id v105 = (NSData *)sub_100024738();
      overrideIngressProxyKey = v8->_overrideIngressProxyKey;
      v8->_overrideIngressProxyKey = v105;

      id v107 = sub_10002482C();
      id v108 = (NSMutableArray *)[v107 mutableCopy];
      v109 = v8->_overrideEnabledMaps;
      v8->_overrideEnabledMaps = v108;

      v8->_BOOL disableProxiedContentDoHBootstrap = sub_100024920();
      v8->_forceFallback = sub_100024A20();
    }

    goto LABEL_113;
  }

  id v140 = 0LL;
  uint64_t v13 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v12,  &v140);
  id v14 = v140;
  __int128 v17 = v14;
  if (v13)
  {
    __int128 v18 = -[NSPPrivacyProxyAgentManager initWithCoder:](v8, "initWithCoder:", v13);
    if (v18)
    {
      uint64_t v8 = v18;
      objc_storeWeak((id *)&v18->_delegate, v6);
      -[NSPProxyPath setDelegate:](v8->_quicProxyPath, "setDelegate:", v8);
      -[NSPProxyPath setDelegate:](v8->_fallbackProxyPath, "setDelegate:", v8);
      -[NSPQuicProxyPath setQuicProxyPathDelegate:](v8->_quicProxyPath, "setQuicProxyPathDelegate:", v8);
      proxyPathProber = v8->_proxyPathProber;
      if (proxyPathProber) {
        objc_storeWeak((id *)&proxyPathProber->_delegate, v8);
      }
      uint64_t v119 = v13;
      v120 = v17;
      directPathProber = v8->_directPathProber;
      if (directPathProber) {
        objc_storeWeak((id *)&directPathProber->_delegate, v8);
      }
      id v125 = v12;
      __int128 v138 = 0u;
      __int128 v139 = 0u;
      __int128 v136 = 0u;
      __int128 v137 = 0u;
      uint64_t v23 = v8->_preferredQUICProxyPaths;
      id v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v136,  v151,  16LL);
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v137;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v137 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8->_preferredQUICProxyPaths,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v136 + 1) + 8LL * (void)i)));
            [v28 setDelegate:v8];
            [v28 setQuicProxyPathDelegate:v8];
          }

          id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v136,  v151,  16LL);
        }

        while (v25);
      }

      __int128 v134 = 0u;
      __int128 v135 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      id v29 = v8->_obliviousPaths;
      id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v132,  v150,  16LL);
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v133;
        do
        {
          for (j = 0LL; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v133 != v32) {
              objc_enumerationMutation(v29);
            }
            id v34 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)j);
            [v34 setDelegate:v8];
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 fallbackAgentUUID]);

            if (v35) {
              [v34 resetFallbackProxyAgent];
            }
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v34 quicAgentUUID]);

            if (v36) {
              [v34 resetQUICProxyAgentForceUpdateDelegate:0];
            }
          }

          id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v132,  v150,  16LL);
        }

        while (v31);
      }

      v8->_proxyPathRestoreIntervalSec = (unint64_t)sub_100024254((uint64_t)&OBJC_CLASS___NSPPrivacyProxyAgentManager);
      id v12 = v125;
      id v37 = v120;
      if (v8->_candidatePreferredQUICProxyPaths)
      {
        id v38 = sub_100024C98((uint64_t)&OBJC_CLASS___NSPPrivacyProxyAgentManager);
        v39 = v38;
        if (v38)
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"PreferredPaths"]);
          if (v40)
          {
            uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
            {
              v117 = v40;
              id v118 = v39;
              id v121 = v7;
              id v123 = v6;
              __int128 v148 = 0u;
              __int128 v149 = 0u;
              __int128 v146 = 0u;
              __int128 v147 = 0u;
              id obj = v40;
              id v128 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
              if (v128)
              {
                uint64_t v127 = *(void *)v147;
                do
                {
                  uint64_t v42 = 0LL;
                  do
                  {
                    if (*(void *)v147 != v127) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v129 = v42;
                    uint64_t v43 = *(void **)(*((void *)&v146 + 1) + 8 * v42);
                    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", @"Vendor", v117, v118, v119));
                    v45 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"PreferredPathConfigURL"]);
                    id v130 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"DomainFilter"]);
                    __int128 v142 = 0u;
                    __int128 v143 = 0u;
                    __int128 v144 = 0u;
                    __int128 v145 = 0u;
                    v46 = v8;
                    v47 = v8->_proxyArray;
                    id v48 = -[NSArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v142,  v154,  16LL);
                    if (v48)
                    {
                      id v49 = v48;
                      uint64_t v50 = *(void *)v143;
                      do
                      {
                        for (k = 0LL; k != v49; k = (char *)k + 1)
                        {
                          if (*(void *)v143 != v50) {
                            objc_enumerationMutation(v47);
                          }
                          v52 = *(void **)(*((void *)&v142 + 1) + 8LL * (void)k);
                          if ([v52 hasPreferredPathConfigUri])
                          {
                            id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 preferredPathConfigUri]);
                            unsigned int v54 = [v53 isEqualToString:v45];

                            if (v54)
                            {
                              v55 = (void *)objc_claimAutoreleasedReturnValue([v52 vendor]);
                              uint64_t v56 = v55;
                              if (v55 && [v55 isEqualToString:v44])
                              {
                                uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v46->_candidatePreferredQUICProxyPaths,  "objectForKeyedSubscript:",  v56));
                                v58 = v57;
                                if (v57)
                                {
                                  v59 = (void *)objc_claimAutoreleasedReturnValue([v57 domainFilter]);

                                  if (!v59)
                                  {
                                    id v60 = [v58 setDomainFilter:v130];
                                    uint64_t v63 = nplog_obj(v60, v61, v62);
                                    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 138412290;
                                      v153 = v56;
                                      _os_log_debug_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "Filled in domain filter for %@",  buf,  0xCu);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }

                        id v49 = -[NSArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v142,  v154,  16LL);
                      }

                      while (v49);
                    }

                    uint64_t v42 = v129 + 1;
                    uint64_t v8 = v46;
                  }

                  while ((id)(v129 + 1) != v128);
                  id v128 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
                }

                while (v128);
              }

              id v7 = v121;
              id v6 = v123;
              id v12 = v125;
              id v37 = v120;
              id v40 = v117;
              v39 = v118;
            }
          }
        }
      }

LABEL_113:
LABEL_114:
      uint64_t v8 = v8;
      id v96 = v8;
      goto LABEL_115;
    }

    uint64_t v95 = nplog_obj(0LL, v19, v20);
    uint64_t v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v155 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_ERROR,  "Failed to decode the NSP proxy token info from the keychain",  v155,  2u);
    }

    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v93 = nplog_obj(v14, v15, v16);
    uint64_t v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v155 = 138412290;
      v156 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_ERROR,  "Failed to create a decoder for the NSP proxy agent manager: %@",  v155,  0xCu);
    }
  }

  id v96 = 0LL;
LABEL_115:

  return v96;
}

- (void)setupWithPath:(id)a3 subscriber:(BOOL)a4 unlimited:(BOOL)a5 geohashSharingEnabled:(BOOL)a6 geohashOverride:(id)a7 configEpoch:(id)a8 linkQuality:(int)a9
{
  BOOL v55 = a6;
  BOOL v56 = a4;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));

  if (v16)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));
    [v17 timeIntervalSinceNow];
    double v19 = v18;

    if (v19 <= 0.0)
    {
      handler = 0LL;
      uint64_t p_handler = (uint64_t)&handler;
      uint64_t v72 = 0x3032000000LL;
      uint64_t v73 = sub_10000CED4;
      uint64_t v74 = sub_10000CEE4;
      id v75 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenIssuanceTimerReached");
      sub_10001F910((uint64_t)self, 0LL);
      uint64_t v21 = NPGetInternalQueue(v20);
      uint64_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100026178;
      block[3] = &unk_1000F9428;
      block[4] = self;
      block[5] = &handler;
      dispatch_async(v22, block);

      _Block_object_dispose(&handler, 8);
    }

    else
    {
      sub_100025FF4((uint64_t)self, (unint64_t)v19);
    }
  }

  -[NSPPrivacyProxyAgentManager handleUnlimitedChange:](self, "handleUnlimitedChange:", v11);
  if (self)
  {
    proxyPathRestoreTimer = self->_proxyPathRestoreTimer;
    if (proxyPathRestoreTimer)
    {
      dispatch_source_cancel((dispatch_source_t)proxyPathRestoreTimer);
      id v24 = self->_proxyPathRestoreTimer;
      self->_proxyPathRestoreTimer = 0LL;
    }

    unint64_t proxyPathRestoreIntervalSec = self->_proxyPathRestoreIntervalSec;
    uint64_t v26 = NPGetInternalQueue(proxyPathRestoreTimer);
    objc_super v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v27);
    id v29 = self->_proxyPathRestoreTimer;
    self->_proxyPathRestoreTimer = v28;

    id v30 = self->_proxyPathRestoreTimer;
    if (v30)
    {
      if (proxyPathRestoreIntervalSec) {
        uint64_t v31 = 1000000000 * proxyPathRestoreIntervalSec;
      }
      else {
        uint64_t v31 = 1800000000000LL;
      }
      uint64_t v32 = v30;
      dispatch_time_t v33 = dispatch_time(0x8000000000000000LL, v31);
      dispatch_source_set_timer(v32, v33, v31, 0LL);

      objc_initWeak(&location, self);
      id v34 = self->_proxyPathRestoreTimer;
      handler = _NSConcreteStackBlock;
      uint64_t p_handler = 3221225472LL;
      uint64_t v72 = (uint64_t)sub_100029854;
      uint64_t v73 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000F97C0;
      uint64_t v35 = v34;
      objc_copyWeak((id *)&v74, &location);
      dispatch_source_set_event_handler(v35, &handler);

      dispatch_resume((dispatch_object_t)self->_proxyPathRestoreTimer);
      objc_destroyWeak((id *)&v74);
      objc_destroyWeak(&location);
    }

    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }

  else
  {
    proxyTokenInfoArray = 0LL;
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v37 = -[NSMutableArray copy](proxyTokenInfoArray, "copy");
  id v38 = [v37 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v66 != v39) {
          objc_enumerationMutation(v37);
        }
        uint64_t v41 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)i);
        if (v41) {
          objc_storeWeak((id *)(v41 + 16), self);
        }
        sub_10000CAB4(v41);
      }

      id v38 = [v37 countByEnumeratingWithState:&v65 objects:v79 count:16];
    }

    while (v38);
  }

  if (self)
  {
    sub_10001FAE0((uint64_t)self->_proxyPathProber);
    sub_10001FAE0((uint64_t)self->_directPathProber);
    -[NSPFallbackProxyPath resetSingleHopProxyAgent](self->_fallbackProxyPath, "resetSingleHopProxyAgent");
    -[NSPFallbackProxyPath resetMultiHopProxyAgent](self->_fallbackProxyPath, "resetMultiHopProxyAgent");
    -[NSPQuicProxyPath resetSingleHopProxyAgent](self->_quicProxyPath, "resetSingleHopProxyAgent");
    quicProxyPath = self->_quicProxyPath;
  }

  else
  {
    sub_10001FAE0(0LL);
    [0 resetSingleHopProxyAgent];
    [0 resetMultiHopProxyAgent];
    [0 resetSingleHopProxyAgent];
    quicProxyPath = 0LL;
  }

  -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  if (self) {
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
  }
  else {
    preferredQUICProxyPaths = 0LL;
  }
  uint64_t v44 = preferredQUICProxyPaths;
  id v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v61,  v78,  16LL);
  if (v45)
  {
    uint64_t v46 = *(void *)v62;
    do
    {
      v47 = 0LL;
      do
      {
        if (*(void *)v62 != v46) {
          objc_enumerationMutation(v44);
        }
        if (self) {
          id v48 = self->_preferredQUICProxyPaths;
        }
        else {
          id v48 = 0LL;
        }
        id v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v48,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v61 + 1) + 8LL * (void)v47)));
        [v49 resetMultiHopProxyAgent];

        v47 = (char *)v47 + 1;
      }

      while (v45 != v47);
      id v50 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v61,  v78,  16LL);
      id v45 = v50;
    }

    while (v50);
  }

  -[NSPPrivacyProxyAgentManager handlePathChange:](self, "handlePathChange:", v13);
  -[NSPPrivacyProxyAgentManager handleTierChange:](self, "handleTierChange:", v56);
  -[NSPPrivacyProxyAgentManager updateGeohashSharingPreference:geohashOverride:]( self,  "updateGeohashSharingPreference:geohashOverride:",  v55,  v14);
  -[NSPPrivacyProxyAgentManager updateConfigEpoch:](self, "updateConfigEpoch:", v15);
  -[NSPPrivacyProxyAgentManager handleLinkQualityChange:](self, "handleLinkQualityChange:", a9);
  if (self)
  {
    if (self->_candidateQuicProxyPath) {
      sub_1000261CC((uint64_t)self, 0LL);
    }
    if (self->_candidateFallbackProxyPath) {
      sub_100026D14((id *)&self->super.isa, 0LL);
    }
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v51 = v37;
  id v52 = [v51 countByEnumeratingWithState:&v57 objects:v77 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v52; j = (char *)j + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(v51);
        }
        sub_10000F5A8(*(void *)(*((void *)&v57 + 1) + 8LL * (void)j));
      }

      id v52 = [v51 countByEnumeratingWithState:&v57 objects:v77 count:16];
    }

    while (v52);
  }
}

- (void)handlePathChange:(id)a3
{
  id v4 = a3;
  if (self) {
    path = self->_path;
  }
  else {
    path = 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](path, "interface"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 interfaceName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interface]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 interfaceName]);
  unsigned __int8 v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    sub_100023E64((uint64_t)self, v11);
  }

  if ([v4 status] == (id)2)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    sub_100023E54((uint64_t)self, v12);
  }

  sub_100023E44((uint64_t)self, v4);
  if (self) {
    id v13 = self->_path;
  }
  else {
    id v13 = 0LL;
  }
  id v14 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:]( &OBJC_CLASS___NPUtilities,  "copyCurrentNetworkCharacteristicsForPath:",  v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Signature"]);
  if (self) {
    networkCharacteristics = self->_networkCharacteristics;
  }
  else {
    networkCharacteristics = 0LL;
  }
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( networkCharacteristics,  "objectForKeyedSubscript:",  @"Signature"));
  unint64_t v18 = v15;
  unint64_t v19 = v17;
  uint64_t v20 = (void *)v19;
  if (!(v18 | v19) || v18 && v19 && [(id)v18 isEqual:v19])
  {
  }

  else
  {

    uint64_t v24 = nplog_obj(v21, v22, v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "proxy agent: network signature changed",  buf,  2u);
    }

    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained networkSignatureChanged];

      -[NSPProxyPath handleNetworkCharacteristicsChange:]( self->_quicProxyPath,  "handleNetworkCharacteristicsChange:",  v14);
      -[NSPProxyPath handleNetworkCharacteristicsChange:]( self->_fallbackProxyPath,  "handleNetworkCharacteristicsChange:",  v14);
      -[NSPPrivacyProxyAgentManager resetProxyErrors](self, "resetProxyErrors");
      self->_unint64_t networkProxiesRotated = 0LL;
      self->_unint64_t networkFallbackProxiesRotated = 0LL;
      objc_storeStrong((id *)&self->_networkCharacteristics, v14);
      if (self->_probingReason == 2) {
        sub_100027BE8((uint64_t)self);
      }
    }

    else
    {
      [0 networkSignatureChanged];
      [0 handleNetworkCharacteristicsChange:v14];
      [0 handleNetworkCharacteristicsChange:v14];
      [0 resetProxyErrors];
    }

    sub_100027E08((uint64_t)self, 0LL);
    sub_100027E18((uint64_t)self, v14);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v42 = v14;
  uint64_t v43 = (uint64_t *)self;
  uint64_t v41 = (void *)v18;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0LL;
  }
  id obj = proxyTokenInfoArray;
  id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
  if (v47)
  {
    uint64_t v45 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v49 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
        id v30 = v4;
        if (v29)
        {
          objc_storeStrong((id *)(v29 + 56), a3);
          id v31 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:]( &OBJC_CLASS___NPUtilities,  "copyCurrentNetworkCharacteristicsForPath:",  *(void *)(v29 + 56));
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"Signature"]);
          id v33 = *(id *)(v29 + 152);
          unint64_t v34 = v32;
          unint64_t v35 = (unint64_t)v33;
          uint64_t v36 = (void *)v35;
          if (v34 | v35
            && (v34 ? (BOOL v37 = v35 == 0) : (BOOL v37 = 1), v37 || ![(id)v34 isEqual:v35]))
          {

            objc_storeStrong((id *)(v29 + 152), v32);
            if ([*(id *)(v29 + 56) status] == (id)1) {
              sub_10000F840(v29, v38, v39);
            }
          }

          else
          {
          }
        }
      }

      id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
    }

    while (v47);
  }

  if (v43)
  {
    sub_10002110C(v43[30], v4);
    uint64_t v40 = v43[31];
  }

  else
  {
    sub_10002110C(0LL, v4);
    uint64_t v40 = 0LL;
  }

  sub_10002110C(v40, v4);
  [v43 updateUserEventAgentData];
}

- (void)handleTierChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    if (((self->_subscriber ^ a3) & 1) == 0) {
      return;
    }
    self->_BOOL subscriber = a3;
    -[NSPProxyPath enableFailOpen:](self->_fallbackProxyPath, "enableFailOpen:", !a3);
    uint64_t v5 = self->_quicProxyPath;
    BOOL v6 = !self->_subscriber;
  }

  else
  {
    if (!a3) {
      return;
    }
    BOOL v6 = 1LL;
    [0 enableFailOpen:1];
    uint64_t v5 = 0LL;
  }

  -[NSPProxyPath enableFailOpen:](v5, "enableFailOpen:", v6);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0LL;
  }
  uint64_t v8 = proxyTokenInfoArray;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (v13)
        {
          if ((*(_BYTE *)(v13 + 11) != 0) != v3) {
            *(_BYTE *)(v13 + 11) = v3;
          }
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v10);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData", (void)v14);
}

- (void)handleUnlimitedChange:(BOOL)a3
{
  if (self)
  {
    if (self->_unlimited != a3) {
      self->_BOOL unlimited = a3;
    }
  }

- (void)handleConfigChange
{
  if (self)
  {
    -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
    fallbackProxyPath = self->_fallbackProxyPath;
  }

  else
  {
    [0 resetStats];
    [0 resetError];
    [0 resetStats];
    fallbackProxyPath = 0LL;
  }

  -[NSPProxyPath resetError](fallbackProxyPath, "resetError");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  if (self) {
    obliviousPaths = self->_obliviousPaths;
  }
  else {
    obliviousPaths = 0LL;
  }
  uint64_t v5 = obliviousPaths;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "resetStats", (void)v11);
        [v10 resetError];
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
}

- (void)handleLinkQualityChange:(int)a3
{
  if (self)
  {
    if (self->_linkQuality == a3) {
      return;
    }
    self->_linkQuality = a3;
    uint64_t v5 = self->_proxyPathProber;
    id v9 = v5;
    if (v5 && v5->_linkQuality != a3)
    {
      v5->_linkQuality = a3;
      sub_10001F920((uint64_t)v5, v6, v7, v8);
    }

    id v10 = self->_directPathProber;
    __int128 v14 = v10;
    if (v10)
    {
      if (v10->_linkQuality != a3)
      {
        v10->_linkQuality = a3;
        sub_10001F920((uint64_t)v10, v11, v12, v13);
      }
    }

- (void)resetProxyErrors
{
  if (self)
  {
    -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
    fallbackProxyPath = self->_fallbackProxyPath;
  }

  else
  {
    [0 resetStats];
    [0 resetError];
    [0 resetStats];
    fallbackProxyPath = 0LL;
  }

  -[NSPProxyPath resetError](fallbackProxyPath, "resetError");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  if (self) {
    obliviousPaths = self->_obliviousPaths;
  }
  else {
    obliviousPaths = 0LL;
  }
  uint64_t v5 = obliviousPaths;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "resetStats", (void)v11);
        [v10 resetError];
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
}

- (void)useDefaultNetworkInterface:(BOOL)a3
{
  if (self)
  {
    if (self->_useDefaultInterface == a3) {
      return;
    }
    self->_BOOL useDefaultInterface = a3;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }

  else
  {
    if (!a3) {
      return;
    }
    proxyTokenInfoArray = 0LL;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
  }

  uint64_t v5 = proxyTokenInfoArray;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9);
        if (v10) {
          *(_BYTE *)(v10 + 10) = a3;
        }
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

+ (void)removeProxyInfoFromKeychain
{
  uint64_t v3 = nplog_obj(a1, a2, v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing proxy info keychain", v5, 2u);
  }

  +[NPUtilities removeDataFromKeychainWithIdentifier:]( &OBJC_CLASS___NPUtilities,  "removeDataFromKeychainWithIdentifier:",  @"com.apple.NetworkServiceProxy.ProxyToken");
}

- (void)tearDownNetworkDiscoveredProxy
{
  uint64_t v2 = self;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_networkSpecificQUICProxyPaths;
  }
  if (-[NSPPrivacyProxyAgentManager count](self, "count"))
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    if (v2) {
      networkSpecificQUICProxyPaths = v2->_networkSpecificQUICProxyPaths;
    }
    else {
      networkSpecificQUICProxyPaths = 0LL;
    }
    id v4 = networkSpecificQUICProxyPaths;
    id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v25;
      *(void *)&__int128 v6 = 138412290LL;
      __int128 v23 = v6;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v4);
          }
          if (v2) {
            uint64_t v10 = v2->_networkSpecificQUICProxyPaths;
          }
          else {
            uint64_t v10 = 0LL;
          }
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v10,  "objectForKey:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v9),  v23,  (void)v24));
          uint64_t v14 = nplog_obj(v11, v12, v13);
          __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 ingressProxy]);
            __int128 v17 = (void *)v16;
            if (v16) {
              unint64_t v18 = *(void **)(v16 + 24);
            }
            else {
              unint64_t v18 = 0LL;
            }
            id v19 = v18;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 vendor]);
            *(_DWORD *)buf = v23;
            uint64_t v29 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Tearing down existing network discovered proxy: %@",  buf,  0xCu);
          }

          [v11 tearDownMultiHopRegistration];
          -[NSPPrivacyProxyAgentManager multiHopAgentUnregistered:](v2, "multiHopAgentUnregistered:", v11);

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
        id v7 = v21;
      }

      while (v21);
    }

    if (v2) {
      uint64_t v22 = v2->_networkSpecificQUICProxyPaths;
    }
    else {
      uint64_t v22 = 0LL;
    }
    -[NSMutableDictionary removeAllObjects](v22, "removeAllObjects");
  }

- (BOOL)deferCommit
{
  if (self) {
    LOBYTE(self) = self->_deferAgentCommit;
  }
  return (char)self;
}

- (void)updateProxyInfo:(id)a3 resolverInfo:(id)a4 proxyPathList:(id)a5 fallbackProxyPathList:(id)a6 obliviousConfigs:(id)a7 proxiedContentMaps:(id)a8
{
  id v14 = a3;
  id v337 = a4;
  id v341 = a5;
  id v338 = a6;
  id v339 = a7;
  id v15 = a8;
  v340 = v15;
  v342 = v14;
  if (!v14)
  {
    uint64_t v334 = nplog_obj(v15, v16, v17);
    unint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v334);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v410 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null proxyInfoArray",  buf,  0xCu);
    }

    goto LABEL_285;
  }

  id v18 = [v14 count];
  if (!v18)
  {
    uint64_t v335 = nplog_obj(0LL, v19, v20);
    unint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v335);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v410 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null (proxyInfoArray.count > 0)",  buf,  0xCu);
    }

    goto LABEL_285;
  }

  if (!v341)
  {
    uint64_t v336 = nplog_obj(v18, v19, v20);
    unint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v336);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v410 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null proxyPathList",  buf,  0xCu);
    }

    goto LABEL_285;
  }

  sub_100023D24((uint64_t)self, v14);
  sub_100023D34((uint64_t)self, v337);
  sub_100023D44((uint64_t)self, v341);
  id v21 = [v341 mutableCopy];
  sub_100023D54((uint64_t)self, v21);

  sub_100023D64((uint64_t)self, v338);
  id v22 = [v338 mutableCopy];
  sub_100023D74((uint64_t)self, v22);

  sub_100023D84((uint64_t)self, v339);
  sub_100023D94((uint64_t)self, 0LL);
  val = self;
  sub_100023DA4((uint64_t)self, v340);
  uint64_t v26 = nplog_obj(v23, v24, v25);
  __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    obliviousConfigs = (const char *)self;
    if (self) {
      obliviousConfigs = (const char *)self->_obliviousConfigs;
    }
    *(_DWORD *)buf = 138412290;
    v410 = obliviousConfigs;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "updateProxyInfo self.obliviousConfigs %@",  buf,  0xCu);
  }

  if (self) {
    self->_deferAgentCommit = 1;
  }
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));
  BOOL v30 = v29 == 0LL;

  if (!v30)
  {
    uint64_t v34 = nplog_obj(v31, v32, v33);
    unint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSPPrivacyProxyAgentManager tokenIssuanceRestrictedUntilDate]( self,  "tokenIssuanceRestrictedUntilDate"));
      BOOL v37 = (char *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v36,  1LL,  2LL));
      *(_DWORD *)buf = 138412290;
      v410 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "deferring setting up of proxy agent until %@",  buf,  0xCu);
    }

- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  if (self) {
    overrideEnabledMaps = self->_overrideEnabledMaps;
  }
  else {
    overrideEnabledMaps = 0LL;
  }
  id v13 = v6;
  if (-[NSMutableArray containsObject:](overrideEnabledMaps, "containsObject:", v6) != v4)
  {
    id v8 = v13;
    if (v4)
    {
      if (self)
      {
        id v9 = self->_overrideEnabledMaps;
        if (!v9)
        {
          uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          sub_100023DD4((uint64_t)self, v10);

          id v9 = self->_overrideEnabledMaps;
          id v8 = v13;
        }
      }

      else
      {
        uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        sub_100023DD4(0LL, v12);

        id v8 = v13;
        id v9 = 0LL;
      }

      -[NSMutableArray addObject:](v9, "addObject:", v8);
    }

    else
    {
      if (self) {
        __int128 v11 = self->_overrideEnabledMaps;
      }
      else {
        __int128 v11 = 0LL;
      }
      -[NSMutableArray removeObject:](v11, "removeObject:", v13);
    }

    sub_10002C184((id *)&self->super.isa);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    sub_10002AB04((uint64_t)self);
  }
}

- (BOOL)proxiedContentMapIsOverrideEnabled:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_overrideEnabledMaps;
  }
  return -[NSPPrivacyProxyAgentManager containsObject:](self, "containsObject:", a3);
}

- (BOOL)disableDoHBootstrapResults
{
  if (self) {
    LOBYTE(self) = self->_disableProxiedContentDoHBootstrap;
  }
  return (char)self;
}

- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3
{
  if (self)
  {
    if (((self->_disableProxiedContentDoHBootstrap ^ a3) & 1) != 0) {
      return;
    }
    self->_BOOL disableProxiedContentDoHBootstrap = !a3;
LABEL_5:
    sub_10002C184((id *)&self->super.isa);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    sub_10002AB04((uint64_t)self);
    return;
  }

  if (!a3) {
    goto LABEL_5;
  }
}

- (void)overridePreferredProxy:(id)a3
{
  id v13 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredProxy](self, "overridePreferredProxy"));
  unsigned __int8 v5 = [v13 isEqualToString:v4];

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    sub_10000E02C((uint64_t)self, v13);
    sub_100023E04((uint64_t)self, 0LL);
    sub_100023E14((uint64_t)self, 0LL);
    sub_100023DE4((uint64_t)self, 0LL);
    sub_100023DF4((uint64_t)self, 0LL);
    if (self)
    {
      id v7 = self->_proxyArray;
      id v8 = self->_resolverArray;
      id v9 = self->_proxyPathList;
      uint64_t v10 = self->_fallbackProxyPathList;
      __int128 v11 = self->_obliviousConfigs;
      proxiedContentMaps = self->_proxiedContentMaps;
    }

    else
    {
      __int128 v11 = 0LL;
      id v9 = 0LL;
      id v7 = 0LL;
      id v8 = 0LL;
      uint64_t v10 = 0LL;
      proxiedContentMaps = 0LL;
    }

    -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:]( self,  "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:",  v7,  v8,  v9,  v10,  v11,  proxiedContentMaps);

    sub_10002AB04((uint64_t)self);
    id v6 = v13;
  }
}

- (void)overridePreferredObliviousProxy:(id)a3
{
  id v6 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overridePreferredObliviousProxy](self, "overridePreferredObliviousProxy"));
  unsigned __int8 v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    sub_100006F58((uint64_t)self, v6);
    sub_10002D130((uint64_t)self);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    sub_10002AB04((uint64_t)self);
  }
}

- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxy](self, "overrideIngressProxy"));
  if ([v20 isEqualToString:v10])
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideFallbackIngressProxy](self, "overrideFallbackIngressProxy"));
    if ([v8 isEqualToString:v11])
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager overrideIngressProxyKey](self, "overrideIngressProxyKey"));
      unsigned __int8 v13 = [v9 isEqualToData:v12];

      if ((v13 & 1) != 0) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
  }

LABEL_7:
  sub_10000E03C((uint64_t)self, v20);
  sub_10000C7E4((uint64_t)self, v8);
  sub_100023DC4((uint64_t)self, v9);
  sub_100023E04((uint64_t)self, 0LL);
  sub_100023E14((uint64_t)self, 0LL);
  sub_100023DE4((uint64_t)self, 0LL);
  sub_100023DF4((uint64_t)self, 0LL);
  if (self)
  {
    id v14 = self->_proxyArray;
    id v15 = self->_resolverArray;
    uint64_t v16 = self->_proxyPathList;
    uint64_t v17 = self->_fallbackProxyPathList;
    id v18 = self->_obliviousConfigs;
    proxiedContentMaps = self->_proxiedContentMaps;
  }

  else
  {
    id v18 = 0LL;
    uint64_t v16 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    uint64_t v17 = 0LL;
    proxiedContentMaps = 0LL;
  }

  -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:]( self,  "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:",  v14,  v15,  v16,  v17,  v18,  proxiedContentMaps);

  sub_10002AB04((uint64_t)self);
LABEL_10:
}

- (void)forceFallback:(BOOL)a3
{
  if (self)
  {
    self->_forceFallback = a3;
    objc_storeStrong((id *)&self->_candidateQuicProxyPath, 0LL);
    objc_storeStrong((id *)&self->_candidateFallbackProxyPath, 0LL);
    objc_storeStrong((id *)&self->_quicProxyPath, 0LL);
    objc_storeStrong((id *)&self->_fallbackProxyPath, 0LL);
    int v4 = self->_proxyArray;
    unsigned __int8 v5 = self->_resolverArray;
    id v6 = self->_proxyPathList;
    id v7 = self->_fallbackProxyPathList;
    id v8 = self->_obliviousConfigs;
    proxiedContentMaps = self->_proxiedContentMaps;
  }

  else
  {
    id v8 = 0LL;
    id v6 = 0LL;
    int v4 = 0LL;
    unsigned __int8 v5 = 0LL;
    id v7 = 0LL;
    proxiedContentMaps = 0LL;
  }

  -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:]( self,  "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:",  v4,  v5,  v6,  v7,  v8,  proxiedContentMaps);

  sub_10002AB04((uint64_t)self);
}

- (void)removeExpiredTokens
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0LL;
  }
  uint64_t v3 = proxyTokenInfoArray;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_10000E04C(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (void)updateGeohashSharingPreference:(BOOL)a3 geohashOverride:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self)
  {
    if (v4) {
      goto LABEL_20;
    }
    goto LABEL_3;
  }

  if (self->_geohashSharingEnabled == v4)
  {
LABEL_3:
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager geohashOverride](self, "geohashOverride"));
    unsigned __int8 v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) != 0) {
      goto LABEL_18;
    }
    if (self) {
      goto LABEL_5;
    }
LABEL_20:
    -[NSPPrivacyProxyAgentManager setGeohashOverride:](self, "setGeohashOverride:", v6);
    [0 updateGeohashSharing:v4];
    [0 updateGeohashSharing:v4];
    preferredQUICProxyPaths = 0LL;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    goto LABEL_6;
  }

- (void)updateConfigEpoch:(id)a3
{
  id v4 = a3;
  if (self) {
    configEpoch = self->_configEpoch;
  }
  else {
    configEpoch = 0LL;
  }
  if ((-[NSNumber isEqual:](configEpoch, "isEqual:", v4) & 1) == 0)
  {
    sub_100023EC4((uint64_t)self, v4);
    sub_100023ED4((uint64_t)self, 0LL);
    if (self)
    {
      -[NSPProxyPath updateConfigEpoch:](self->_fallbackProxyPath, "updateConfigEpoch:", v4);
      quicProxyPath = self->_quicProxyPath;
    }

    else
    {
      [0 updateConfigEpoch:v4];
      quicProxyPath = 0LL;
    }

    -[NSPProxyPath updateConfigEpoch:](quicProxyPath, "updateConfigEpoch:", v4);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    if (self) {
      preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
    }
    else {
      preferredQUICProxyPaths = 0LL;
    }
    unsigned __int8 v8 = preferredQUICProxyPaths;
    id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          if (self) {
            uint64_t v13 = self->_preferredQUICProxyPaths;
          }
          else {
            uint64_t v13 = 0LL;
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v13,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v12),  (void)v16));
          [v14 updateConfigEpoch:v4];

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        id v10 = v15;
      }

      while (v15);
    }

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
  }
}

- (void)updateDNSFilteringHint:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled") != a3)
  {
    -[NSPPrivacyProxyAgentManager setDnsFilteringHintEnabled:](self, "setDnsFilteringHintEnabled:", v3);
    if (self)
    {
      -[NSPFallbackProxyPath resetMultiHopProxyAgent](self->_fallbackProxyPath, "resetMultiHopProxyAgent");
      quicProxyPath = self->_quicProxyPath;
    }

    else
    {
      [0 resetMultiHopProxyAgent];
      quicProxyPath = 0LL;
    }

    -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    if (self) {
      preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
    }
    else {
      preferredQUICProxyPaths = 0LL;
    }
    id v7 = preferredQUICProxyPaths;
    id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (self) {
            id v12 = self->_preferredQUICProxyPaths;
          }
          else {
            id v12 = 0LL;
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
          [v13 resetMultiHopProxyAgent];

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        id v9 = v14;
      }

      while (v14);
    }

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
  }

- (id)tierString
{
  if (!self || !self->_subscriber) {
    return @"FREE";
  }
  if (self->_unlimited) {
    return @"SUBSCRIBER_UNLIMITED";
  }
  return @"SUBSCRIBER";
}

- (void)tokenLowWaterMarkReached:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (!v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v53 = "-[NSPPrivacyProxyAgentManager tokenLowWaterMarkReached:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v4[3];
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue([v10 vendor]);
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: token cache low water mark hit", buf, 0xCu);
  }

  id v12 = v4[3];
  if ([v12 proxyHop] == 1)
  {

LABEL_7:
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100031890;
    v48[3] = &unk_1000F9720;
    id v49 = v4;
    sub_10000CF58((uint64_t)v49, v48);
    id v9 = (os_log_s *)v49;
    goto LABEL_8;
  }

  unsigned int v13 = [v4[3] proxyHop];

  if (v13 == 3) {
    goto LABEL_7;
  }
  if (self) {
    quicProxyPath = self->_quicProxyPath;
  }
  else {
    quicProxyPath = 0LL;
  }
  if (-[NSPProxyPath matchEgress:](quicProxyPath, "matchEgress:", v4)) {
    sub_1000261CC((uint64_t)self, 0LL);
  }
  if (self) {
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else {
    fallbackProxyPath = 0LL;
  }
  if (-[NSPProxyPath matchEgress:](fallbackProxyPath, "matchEgress:", v4)) {
    sub_100026D14((id *)&self->super.isa, 0LL);
  }
  if (self) {
    candidateQuicProxyPath = self->_candidateQuicProxyPath;
  }
  else {
    candidateQuicProxyPath = 0LL;
  }
  if (-[NSPCandidateProxyPath matchEgress:](candidateQuicProxyPath, "matchEgress:", v4))
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_100031988;
    v46[3] = &unk_1000F9720;
    id v47 = v4;
    sub_10000CF58((uint64_t)v47, v46);
  }

  if (self) {
    candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
  }
  else {
    candidateFallbackProxyPath = 0LL;
  }
  if (-[NSPCandidateProxyPath matchEgress:](candidateFallbackProxyPath, "matchEgress:", v4))
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100031A80;
    v44[3] = &unk_1000F9720;
    uint64_t v45 = v4;
    sub_10000CF58((uint64_t)v45, v44);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  if (self) {
    candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
  }
  else {
    candidatePreferredQUICProxyPaths = 0LL;
  }
  __int128 v19 = candidatePreferredQUICProxyPaths;
  id v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v40,  v51,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v19);
        }
        if (self) {
          uint64_t v24 = self->_candidatePreferredQUICProxyPaths;
        }
        else {
          uint64_t v24 = 0LL;
        }
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v24,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v40 + 1) + 8LL * (void)v23)));
        if ([v25 matchEgress:v4])
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472LL;
          v38[2] = sub_100031B78;
          v38[3] = &unk_1000F9720;
          uint64_t v39 = v4;
          sub_10000CF58((uint64_t)v39, v38);
        }

        uint64_t v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v40,  v51,  16LL);
      id v21 = v26;
    }

    while (v26);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  if (self) {
    proxiedContentPaths = self->_proxiedContentPaths;
  }
  else {
    proxiedContentPaths = 0LL;
  }
  id v9 = proxiedContentPaths;
  id v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v34,  v50,  16LL);
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v34 + 1) + 8 * (void)i) matchEgress:v4])
        {
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472LL;
          v32[2] = sub_100031C70;
          v32[3] = &unk_1000F9720;
          uint64_t v33 = v4;
          sub_10000CF58((uint64_t)v33, v32);
        }
      }

      id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v34,  v50,  16LL);
    }

    while (v29);
  }

- (void)tokenFetched
{
  if (self) {
    -[NSPPrivacyProxyAgentManager tokensEmpty](self, "tokensEmpty");
  }
}

- (void)tokenAdded
{
  if (self) {
    -[NSPPrivacyProxyAgentManager tokensEmpty](self, "tokensEmpty");
  }
}

- (void)tokensEmpty
{
  if (self) {
    quicProxyPath = self->_quicProxyPath;
  }
  else {
    quicProxyPath = 0LL;
  }
  id v4 = quicProxyPath;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v4, "ingressProxy"));
  if (!sub_10000E688((uint64_t)v5))
  {

LABEL_18:
    sub_100032C60((uint64_t)self);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    return;
  }

  if (self) {
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else {
    fallbackProxyPath = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](fallbackProxyPath, "ingressProxy"));
  uint64_t v8 = sub_10000E688((uint64_t)v7);

  if (!v8) {
    goto LABEL_18;
  }
  if (self) {
    id v9 = self->_quicProxyPath;
  }
  else {
    id v9 = 0LL;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v9, "egressProxy"));
  uint64_t v11 = sub_10000E688((uint64_t)v10);

  if (v11)
  {
    if (self)
    {
LABEL_11:
      id v12 = self->_fallbackProxyPath;
      goto LABEL_12;
    }
  }

  else
  {
    __int128 v18 = sub_100029C28((uint64_t)self, 0);
    __int128 v64 = (id *)objc_claimAutoreleasedReturnValue(v18);
    if (!v64)
    {
      uint64_t v60 = nplog_obj(0LL, v19, v20);
      __int128 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        unint64_t v62 = "No egress proxy with availabe tokens for quic proxy path";
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, v62, buf, 2u);
      }

- (id)lastTokenOutageReason
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_lastTokenOutageReasonStats;
  }
  return self;
}

- (void)switchProxy:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v7 = v4;
  if (v4)
  {
    id v8 = [v4[3] proxyHop];
    int v9 = (int)v8;
    uint64_t v12 = nplog_obj(v8, v10, v11);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = v13;
    if (v9 == 2)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v7[3];
        __int128 v16 = (char *)objc_claimAutoreleasedReturnValue([v15 vendor]);
        int v23 = 138412290;
        uint64_t v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: switch proxy",  (uint8_t *)&v23,  0xCu);
      }

      if (self) {
        candidateQuicProxyPath = self->_candidateQuicProxyPath;
      }
      else {
        candidateQuicProxyPath = 0LL;
      }
      if (-[NSPCandidateProxyPath matchEgress:](candidateQuicProxyPath, "matchEgress:", v7))
      {
        sub_100023E04((uint64_t)self, 0LL);
        sub_100028AB8((id *)&self->super.isa, v7);
        sub_1000261CC((uint64_t)self, 0LL);
      }

      if (self) {
        candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
      }
      else {
        candidateFallbackProxyPath = 0LL;
      }
      if (-[NSPCandidateProxyPath matchEgress:](candidateFallbackProxyPath, "matchEgress:", v7))
      {
        sub_100023E14((uint64_t)self, 0LL);
        sub_100028CC8((id *)&self->super.isa, v7);
        sub_100026D14((id *)&self->super.isa, 0LL);
      }

      if (self) {
        quicProxyPath = self->_quicProxyPath;
      }
      else {
        quicProxyPath = 0LL;
      }
      if (-[NSPProxyPath matchEgress:](quicProxyPath, "matchEgress:", v7))
      {
        sub_100028AB8((id *)&self->super.isa, v7);
        sub_1000261CC((uint64_t)self, 0LL);
        sub_1000337F8(self, v7, 0LL);
      }

      if (self) {
        fallbackProxyPath = self->_fallbackProxyPath;
      }
      else {
        fallbackProxyPath = 0LL;
      }
      if (-[NSPProxyPath matchEgress:](fallbackProxyPath, "matchEgress:", v7))
      {
        sub_100028CC8((id *)&self->super.isa, v7);
        sub_100026D14((id *)&self->super.isa, 0LL);
        sub_1000337F8(self, v7, 1LL);
      }
    }

    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v23 = 136315138;
        uint64_t v24 = "-[NSPPrivacyProxyAgentManager switchProxy:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "%s called with null (proxyTokenInfo.proxyInfo.proxyHop == NSPPrivacyProxyProxyInfo_ProxyHop_EGRESS_ONLY)",  (uint8_t *)&v23,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v21 = nplog_obj(0LL, v5, v6);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      int v23 = 136315138;
      uint64_t v24 = "-[NSPPrivacyProxyAgentManager switchProxy:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  (uint8_t *)&v23,  0xCu);
    }
  }
}

- (void)tokenInfoInvalid:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v4[3];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 vendor]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: token info invalid",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000LL;
    uint64_t v22 = sub_10000CED4;
    int v23 = sub_10000CEE4;
    id v24 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenInfoInvalid");
    id inited = objc_initWeak(&location, self);
    uint64_t v13 = NPGetInternalQueue(inited);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100033DA4;
    v15[3] = &unk_1000F9AF8;
    objc_copyWeak(&v18, &location);
    __int128 v16 = v4;
    p___int128 buf = &buf;
    dispatch_async(v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyProxyAgentManager tokenInfoInvalid:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  (uint8_t *)&buf,  0xCu);
    }
  }
}

- (void)tokenRateLimited:(id)a3 untilDate:(double)a4
{
  uint64_t v6 = (id *)a3;
  uint64_t v9 = nplog_obj(v6, v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v6[3];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 vendor]);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: token rate limited for %f", buf, 0x16u);
    }

    sub_100023DE4((uint64_t)self, 0LL);
    sub_100023DF4((uint64_t)self, 0LL);
    sub_100023E04((uint64_t)self, 0LL);
    sub_100023E14((uint64_t)self, 0LL);
    sub_100029DC4((id *)&self->super.isa);
    sub_100025FF4((uint64_t)self, (unint64_t)a4);
    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    uint64_t v21 = sub_10000CED4;
    uint64_t v22 = sub_10000CEE4;
    id v23 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenIssuanceLimitReached");
    id inited = objc_initWeak(&location, self);
    uint64_t v15 = NPGetInternalQueue(inited);
    __int128 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000340B4;
    block[3] = &unk_1000F9B20;
    objc_copyWeak(&v18, &location);
    block[4] = buf;
    dispatch_async(v16, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NSPPrivacyProxyAgentManager tokenRateLimited:untilDate:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  buf,  0xCu);
    }
  }
}

- (void)requestAccessTokenWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyLocationMonitor sharedMonitor]( &OBJC_CLASS___NSPPrivacyProxyLocationMonitor,  "sharedMonitor"));
  [v4 refreshCountryPlusTimezone:&stru_1000F9B40];

  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NSPPrivacyProxyAgentManager requestAccessTokenWithCompletionHandler:]( self,  "requestAccessTokenWithCompletionHandler:",  v5);
}

- (void)mergeTokenStats:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4)
  {
    if (self)
    {
      unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
      self->_tokenFetchSuccessCount += v4[11];
      self->_unint64_t tokenFetchFailedCount = tokenFetchFailedCount + v4[14];
      unint64_t tokenExpiredCount = self->_tokenExpiredCount;
      self->_tokenConsumedCount += v4[12];
      self->_unint64_t tokenExpiredCount = tokenExpiredCount + v4[13];
      unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
      self->_agentLowWaterMarkHitCount += v4[15];
      self->_unint64_t cacheLowWaterMarkHitCount = cacheLowWaterMarkHitCount + v4[16];
      unint64_t missingTokenCount = self->_missingTokenCount;
      self->_badTokenCount += v4[17];
      self->_unint64_t missingTokenCount = missingTokenCount + v4[18];
    }

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
  }

  else
  {
    uint64_t v12 = nplog_obj(0LL, v5, v6);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[NSPPrivacyProxyAgentManager mergeTokenStats:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (BOOL)isMultiHopProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager isMultiHopRegistered](self, "isMultiHopRegistered");
}

- (void)sendRTCReportWithFailureType:(int64_t)a3 errorCode:(int)a4 url:(id)a5 ingressProxy:(id)a6 egressProxy:(id)a7 tokenServer:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  uint64_t v20 = nplog_obj(v17, v18, v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218240;
    int64_t v90 = a3;
    __int16 v91 = 1024;
    LODWORD(v92) = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received RTC report request for type: %ld, errorcode: %d",  buf,  0x12u);
  }

  id v22 = v17;
  id v23 = (id *)v16;
  id v24 = (id *)v15;
  uint64_t v86 = self;
  id v87 = v14;
  uint64_t v85 = v11;
  if (self)
  {
    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  @"Mosaic",  @"eventType");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  @"counter",  @"type");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  &off_100103350,  @"value");
    id v26 = @"privacy_proxy_quic_proxy_failure";
    switch(a3)
    {
      case 1000LL:
        goto LABEL_11;
      case 1001LL:
        id v26 = @"privacy_proxy_fallback_proxy_failure";
        goto LABEL_11;
      case 1002LL:
        id v26 = @"privacy_proxy_odoh_failure";
        goto LABEL_11;
      case 1003LL:
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  @"privacy_proxy_token_fetch_failure",  @"name");
        __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v27,  @"label_privacy-proxy-report-reason-code");
        int v28 = 1;
        goto LABEL_42;
      case 1004LL:
        id v26 = @"privacy_proxy_configuration_fetch_failure";
        goto LABEL_11;
      case 1007LL:
        id v26 = @"privacy_proxy_ohttp_failure";
        goto LABEL_11;
      default:
        id v26 = @"privacy_proxy_unknown_failure";
LABEL_11:
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v26,  @"name",  v11);
        if ((int)v11 > 1199)
        {
          switch((int)v11)
          {
            case 1200:
              uint64_t v30 = 3009LL;
              break;
            case 1201:
              uint64_t v30 = 3013LL;
              break;
            case 1202:
            case 1203:
              goto LABEL_34;
            case 1204:
              uint64_t v30 = 3010LL;
              break;
            case 1205:
              uint64_t v30 = 3014LL;
              break;
            case 1206:
              uint64_t v30 = 3016LL;
              break;
            case 1207:
              uint64_t v30 = 3018LL;
              break;
            default:
              if ((_DWORD)v11 == 1301)
              {
                uint64_t v30 = 3019LL;
              }

              else if ((_DWORD)v11 == 1302)
              {
                uint64_t v30 = 3020LL;
              }

              else
              {
LABEL_34:
                uint64_t v30 = (int)v85;
              }

              break;
          }
        }

        else if ((int)v11 > 1099)
        {
          switch((int)v11)
          {
            case 1100:
              uint64_t v30 = 3006LL;
              break;
            case 1101:
              uint64_t v30 = 3005LL;
              break;
            case 1104:
              uint64_t v30 = 3007LL;
              break;
            case 1105:
              uint64_t v30 = 3008LL;
              break;
            case 1106:
              uint64_t v30 = 3015LL;
              break;
            case 1107:
              uint64_t v30 = 3017LL;
              break;
            default:
              goto LABEL_34;
          }
        }

        else
        {
          int v29 = v11 - 60;
          uint64_t v30 = 3001LL;
          switch(v29)
          {
            case 0:
              break;
            case 1:
              uint64_t v30 = 3004LL;
              break;
            case 4:
              uint64_t v30 = 3003LL;
              break;
            case 5:
              uint64_t v30 = 3002LL;
              break;
            default:
              goto LABEL_34;
          }
        }

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v30));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v31,  @"label_privacy-proxy-report-reason-code");

        if ((unint64_t)(v30 - 3001) >= 0x14)
        {
          uint64_t v32 = strerror(v30);
          if (v32) {
            __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
          }
          else {
            __int128 v27 = @"unknown";
          }
        }

        else
        {
          __int128 v27 = *(&off_1000F9BF0 + v30 - 3001);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v27,  @"label_privacy-proxy-report-reason-description");
        int v28 = 0;
LABEL_42:

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v33 timeIntervalSince1970];
        double v35 = v34 * 1000.0;

        id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v36,  @"label_privacy-proxy-report-time");

        if (a3 == 1000 && v23)
        {
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v23[3] proxyURL]);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v37));
          id v39 = sub_1000342D8(v38);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v40,  @"label_privacy-proxy-ingress-proxy");
        }

        if (a3 == 1000 && v24)
        {
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v24[3] proxyURL]);
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v41));
          id v43 = sub_1000342D8(v42);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v44,  @"label_privacy-proxy-egress-proxy");
          BOOL v45 = v22 != 0LL;
          goto LABEL_61;
        }

        BOOL v46 = a3 == 1001;
        if (a3 == 1001 && v23)
        {
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v23[3] tcpProxyFqdn]);
          id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v47));
          id v49 = sub_1000342D8(v48);
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v50,  @"label_privacy-proxy-ingress-proxy");
          BOOL v46 = 1;
        }

        if (v24 && v46)
        {
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v24[3] tcpProxyFqdn]);
          id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v51));
          id v53 = sub_1000342D8(v52);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v54,  @"label_privacy-proxy-egress-proxy");
        }

        BOOL v45 = v22 != 0LL;
        if (a3 == 1002 && v22)
        {
          uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v22));
          id v56 = sub_1000342D8(v55);
          char v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v57,  @"label_privacy-proxy-odoh-resolver");
LABEL_60:
          BOOL v45 = 1;
          goto LABEL_61;
        }

        if (a3 == 1007 && v22)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v22,  @"label_privacy-proxy-ohttp-relay");
          goto LABEL_60;
        }

- (void)sendRTCReportForServiceOutage:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 outageReasonType]);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v75 = (uint64_t)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received RTC report request with service outage stats: %@",  buf,  0xCu);
  }

  id v10 = v4;
  uint64_t v11 = v10;
  if (!self || !v10)
  {

    goto LABEL_86;
  }

  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"Mosaic",  @"eventType");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"counter",  @"type");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &off_100103350,  @"value");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"privacy_proxy_outage_notification",  @"name");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 outageReasonType]);

  if (v13)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v11 outageReasonType]);
    if ([v14 isEqual:@"Token"])
    {
      uint64_t v15 = 4001LL;
    }

    else if ([v14 isEqual:@"Captive"])
    {
      uint64_t v15 = 4002LL;
    }

    else if ([v14 isEqual:@"Proxy"])
    {
      uint64_t v15 = 4003LL;
    }

    else if ([v14 isEqual:@"DNS"])
    {
      uint64_t v15 = 4004LL;
    }

    else
    {
      uint64_t v15 = 4000LL;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v19,  @"label_privacy-proxy-report-reason-code");
  }

  else
  {
    uint64_t v15 = 4000LL;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 outageReasonSubType]);

  if (v20)
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue([v11 outageReasonSubType]);
    if ([v21 isEqual:@"TokenFetchFailure"])
    {
      id v22 = @"private_relay_proxy_token_fetch_failure";
    }

    else if ([v21 isEqual:@"CaptiveProbeTimeout"])
    {
      id v22 = @"private_relay_proxy_captive_probe_time_out";
    }

    else if ([v21 isEqual:@"CaptiveProbeRedirected"])
    {
      id v22 = @"private_relay_proxy_captive_probe_redirect";
    }

    else if ([v21 isEqual:@"ProxyConnectionTimeout"])
    {
      id v22 = @"private_relay_proxy_connection_time_out";
    }

    else if ([v21 isEqual:@"ProxyConnectionRefused"])
    {
      id v22 = @"private_relay_proxy_connection_refused";
    }

    else if ([v21 isEqual:@"ProxyConnectionDNSTimeout"])
    {
      id v22 = @"private_relay_proxy_dns_time_out";
    }

    else if ([v21 isEqual:@"ProxyPrimaryEgressError"])
    {
      id v22 = @"private_relay_proxy_primary_egress_failure";
    }

    else if ([v21 isEqual:@"ProxyFallbackEgressError"])
    {
      id v22 = @"private_relay_proxy_fallback_egress_failure";
    }

    else if ([v21 isEqual:@"ProxyPrimaryOriginError"])
    {
      id v22 = @"private_relay_proxy_primary_origin_failure";
    }

    else if ([v21 isEqual:@"ProxyFallbackOriginError"])
    {
      id v22 = @"private_relay_proxy_fallback_origin_failure";
    }

    else if ([v21 isEqual:@"ProxyProbeRedirected"])
    {
      id v22 = @"private_relay_proxy_probe_redirect";
    }

    else if ([v21 isEqual:@"ProxyProbeTCPConnected"])
    {
      id v22 = @"private_relay_proxy_probe_tcp_connected";
    }

    else if ([v21 isEqual:@"ProxyProbeServerError"])
    {
      id v22 = @"private_relay_proxy_probe_server_failure";
    }

    else if ([v21 isEqual:@"ProxyProbeForbidden"])
    {
      id v22 = @"private_relay_proxy_probe_forbidden";
    }

    else if ([v21 isEqual:@"ProxyCertError"])
    {
      id v22 = @"private_relay_proxy_cert_error";
    }

    else if ([v21 isEqual:@"ProxyConnectionDNSError"])
    {
      id v22 = @"private_relay_proxy_dns_error";
    }

    else if ([v21 isEqual:@"ProxyError"])
    {
      id v22 = @"private_relay_proxy_failure";
    }

    else if ([v21 isEqual:@"ProxyPrimaryEgressUnavailableError"])
    {
      id v22 = @"private_relay_proxy_primary_egress_unavailable_failure";
    }

    else if ([v21 isEqual:@"ProxyFallbackEgressUnavailableError"])
    {
      id v22 = @"private_relay_proxy_fallback_egress_unavailable_failure";
    }

    else if ([v21 isEqual:@"ODoHAuthFailure"])
    {
      id v22 = @"private_relay_proxy_odoh_auth_failure";
    }

    else if ([v21 isEqual:@"ODoHBadMessage"])
    {
      id v22 = @"private_relay_proxy_odoh_bad_message";
    }

    else
    {
      id v22 = @"unknown";
    }

    id v23 = v22;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v23,  @"label_privacy-proxy-report-reason-description");
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v24 timeIntervalSince1970];
  double v26 = v25 * 1000.0;

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v27,  @"label_privacy-proxy-report-time");

  switch(v15)
  {
    case 4001LL:
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v11 tokenProxy]);

      if (!v50) {
        break;
      }
      id v51 = (void *)objc_claimAutoreleasedReturnValue([v11 tokenProxy]);
      id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v51));
      id v53 = sub_1000342D8(v52);
      BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(v53);

      uint64_t v54 = @"label_privacy-proxy-token-fetch-server";
LABEL_76:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v45, v54);
      goto LABEL_77;
    case 4004LL:
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v11 odohProxy]);

      if (!v55) {
        break;
      }
      id v56 = (void *)objc_claimAutoreleasedReturnValue([v11 odohProxy]);
      char v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v56));
      id v58 = sub_1000342D8(v57);
      BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(v58);

      uint64_t v54 = @"label_privacy-proxy-odoh-resolver";
      goto LABEL_76;
    case 4003LL:
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 primaryIngressProxy]);
      if (v28)
      {
        int v29 = (void *)v28;
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryEgressProxy]);

        if (v30)
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryIngressProxy]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v31));
          id v33 = sub_1000342D8(v32);
          double v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

          double v35 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryEgressProxy]);
          id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v35));
          id v37 = sub_1000342D8(v36);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v34,  @"label_privacy-proxy-ingress-proxy");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v38,  @"label_privacy-proxy-egress-proxy");
        }
      }

      uint64_t v39 = objc_claimAutoreleasedReturnValue([v11 fallbackIngressProxy]);
      if (v39)
      {
        uint64_t v40 = (void *)v39;
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v11 fallbackEgressProxy]);

        if (v41)
        {
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v11 fallbackIngressProxy]);
          id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v42));
          id v44 = sub_1000342D8(v43);
          BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

          BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([v11 fallbackEgressProxy]);
          id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v46));
          id v48 = sub_1000342D8(v47);
          id v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v45,  @"label_privacy-proxy-fallback-ingress-proxy");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v49,  @"label_privacy-proxy-fallback-egress-proxy");

LABEL_77:
        }
      }

      break;
  }

  id v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tierString](self, "tierString"));
  if (v59) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v59,  @"label_privacy-proxy-tier-type");
  }
  id v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyLocationMonitor sharedMonitor]( &OBJC_CLASS___NSPPrivacyProxyLocationMonitor,  "sharedMonitor"));
  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v60 currentCountryPlusTimezone]);

  if (v61) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v61,  @"label_privacy-proxy-report-region");
  }

  if (v12)
  {
    v80[0] = kRTCReportingSessionInfoClientType;
    v80[1] = kRTCReportingSessionInfoClientVersion;
    v81[0] = &off_100103368;
    v81[1] = &off_100103350;
    v80[2] = kRTCReportingSessionInfoSessionID;
    v80[3] = kRTCReportingSessionInfoBatchEvent;
    v81[2] = &off_100103338;
    v81[3] = &__kCFBooleanFalse;
    v80[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v81[4] = &__kCFBooleanTrue;
    unint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  5LL));
    v78[0] = kRTCReportingUserInfoClientName;
    v78[1] = kRTCReportingUserInfoServiceName;
    v79[0] = @"network-service-proxy";
    v79[1] = @"privacy-proxy-outage-notification";
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  2LL));
    id v73 = 0LL;
    unsigned __int8 v64 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:]( &OBJC_CLASS___RTCReporting,  "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:",  v62,  v63,  1005LL,  0LL,  v12,  &v73);
    id v65 = v73;
    uint64_t v68 = nplog_obj(v65, v66, v67);
    uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    uint64_t v70 = v69;
    if ((v64 & 1) != 0)
    {
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v75 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "sent service outage RTC report %@", buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218242;
      uint64_t v75 = 1005LL;
      __int16 v76 = 2112;
      id v77 = v65;
      _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "failed to send RTC report type: %ld error: %@",  buf,  0x16u);
    }

    goto LABEL_92;
  }

- (BOOL)proxyInfo:(id)a3 matchesProxyIndex:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    proxyArray = self->_proxyArray;
  }
  else {
    proxyArray = 0LL;
  }
  if (-[NSArray count](proxyArray, "count") <= a4)
  {
    unsigned __int8 v12 = 0;
  }

  else
  {
    if (self) {
      uint64_t v8 = self->_proxyArray;
    }
    else {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v8, "objectAtIndex:", a4));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 proxyURL]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 proxyURL]);
    unsigned __int8 v12 = [v10 isEqualToString:v11];
  }

  return v12;
}

- (void)sendRTCReportForPrivacyProxyToggleState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = nplog_obj(self, a2, a3);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v28) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received RTC report request for toggle state: %u",  buf,  8u);
  }

  if (!self) {
    goto LABEL_8;
  }
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  @"Mosaic",  @"eventType");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  @"counter",  @"type");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &off_100103350,  @"value");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  @"privacy_proxy_toggle_state",  @"name");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v11,  @"label_privacy-proxy-toggle-state");

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v12 timeIntervalSince1970];
  double v14 = v13 * 1000.0;

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v15,  @"label_privacy-proxy-report-time");

  if (v10)
  {
    v33[0] = kRTCReportingSessionInfoClientType;
    v33[1] = kRTCReportingSessionInfoClientVersion;
    v34[0] = &off_100103368;
    v34[1] = &off_100103350;
    v33[2] = kRTCReportingSessionInfoSessionID;
    v33[3] = kRTCReportingSessionInfoBatchEvent;
    v34[2] = &off_100103338;
    v34[3] = &__kCFBooleanFalse;
    v33[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v34[4] = &__kCFBooleanTrue;
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  5LL));
    v31[0] = kRTCReportingUserInfoClientName;
    v31[1] = kRTCReportingUserInfoServiceName;
    v32[0] = @"network-service-proxy";
    v32[1] = @"privacy-proxy-toggle";
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
    id v26 = 0LL;
    unsigned __int8 v18 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:]( &OBJC_CLASS___RTCReporting,  "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:",  v16,  v17,  1006LL,  0LL,  v10,  &v26);
    id v19 = v26;
    uint64_t v22 = nplog_obj(v19, v20, v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    id v24 = v23;
    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v28 = (uint64_t)v10;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "sent privacy proxy toggle report %@",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218242;
      uint64_t v28 = 1006LL;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "failed to send RTC report type: %ld error: %@",  buf,  0x16u);
    }
  }

  else
  {
LABEL_8:
    uint64_t v25 = nplog_obj(v7, v8, v9);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to create RTC report payload for toggle state",  buf,  2u);
    }

    id v10 = 0LL;
  }
}

- (BOOL)isSingleHopProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager isSingleHopRegistered](self, "isSingleHopRegistered");
}

- (BOOL)isMultiHopFallbackProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager isMultiHopRegistered](self, "isMultiHopRegistered");
}

- (BOOL)isSingleHopFallbackProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager isSingleHopRegistered](self, "isSingleHopRegistered");
}

- (void)multiHopAgentRegistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  uint64_t v7 = v4;
  if (!self)
  {
    if (v4)
    {
      preferredQUICProxyPaths = 0LL;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      goto LABEL_5;
    }

    goto LABEL_64;
  }

  if (self->_quicProxyPath == v4)
  {
LABEL_64:
    uint64_t v55 = nplog_obj(v4, v5, v6);
    id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "quic proxy path, multi hop agent registered",  buf,  2u);
    }

    if (self) {
      id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0LL;
    }
    -[NSMutableDictionary multiHopProxyAgentRegistered:](WeakRetained, "multiHopProxyAgentRegistered:", 1LL);
    goto LABEL_69;
  }

  if ((NSPQuicProxyPath *)self->_fallbackProxyPath != v4)
  {
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_5:
    uint64_t v9 = preferredQUICProxyPaths;
    id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v63,  v70,  16LL);
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v64;
      *(void *)&__int128 v11 = 138412290LL;
      __int128 v57 = v11;
      p_isa = (id *)&v9->super.super.isa;
      do
      {
        double v14 = 0LL;
        do
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)v14);
          if (self) {
            uint64_t v16 = self->_preferredQUICProxyPaths;
          }
          else {
            uint64_t v16 = 0LL;
          }
          uint64_t v17 = (NSPQuicProxyPath *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v16,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v63 + 1) + 8LL * (void)v14),  v57));

          if (v17 == v7)
          {
            if (self) {
              candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
            }
            else {
              candidatePreferredQUICProxyPaths = 0LL;
            }
            id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( candidatePreferredQUICProxyPaths,  "objectForKeyedSubscript:",  v15));
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 preferredPathPatterns]);
            id v21 = [v20 count];

            if (v21)
            {
              if (self) {
                quicProxyPath = self->_quicProxyPath;
              }
              else {
                quicProxyPath = 0LL;
              }
              -[NSPQuicProxyPath resetMultiHopProxyAgent](quicProxyPath, "resetMultiHopProxyAgent");
            }

            uint64_t v23 = objc_claimAutoreleasedReturnValue([v19 domainFilter]);
            id v26 = (void *)v23;
            if (v23)
            {
              uint64_t v27 = nplog_obj(v23, v24, v25);
              uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = v57;
                uint64_t v69 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Preferred QUIC proxy path for %@, multi hop agent registered",  buf,  0xCu);
              }

              if (self) {
                id v29 = objc_loadWeakRetained((id *)&self->_delegate);
              }
              else {
                id v29 = 0LL;
              }
              id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](v7, "nonDefaultAgentUUID"));
              [v29 preferredProxyAgentRegistered:v15 agentUUID:v30 domainFilter:v26];

              uint64_t v9 = (NSMutableDictionary *)p_isa;
            }
          }

          double v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v31 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v63,  v70,  16LL);
        id v12 = v31;
      }

      while (v31);
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    if (self) {
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
    }
    else {
      networkSpecificQUICProxyPaths = 0LL;
    }
    id WeakRetained = networkSpecificQUICProxyPaths;
    id v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( WeakRetained,  "countByEnumeratingWithState:objects:count:",  &v59,  v67,  16LL);
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v60;
      id v37 = &OBJC_IVAR___NSPProxyTokenInfo__tokenConsumedCount;
      do
      {
        uint64_t v38 = 0LL;
        do
        {
          if (*(void *)v60 != v36) {
            objc_enumerationMutation(WeakRetained);
          }
          uint64_t v39 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)v38);
          if (self) {
            uint64_t v40 = self->_networkSpecificQUICProxyPaths;
          }
          else {
            uint64_t v40 = 0LL;
          }
          uint64_t v41 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v40,  "objectForKey:",  *(void *)(*((void *)&v59 + 1) + 8LL * (void)v38)));
          __int128 v42 = (void *)v41;
          if (v41) {
            BOOL v43 = v41 == (void)v7;
          }
          else {
            BOOL v43 = 0;
          }
          if (v43)
          {
            uint64_t v44 = objc_opt_class(v37 + 762);
            uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v44);
            if ((isKindOfClass & 1) != 0)
            {
              uint64_t v48 = nplog_obj(isKindOfClass, v46, v47);
              id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEBUG,  "Network discovered QUIC proxy path registered",  buf,  2u);
              }

              if (self) {
                id v50 = objc_loadWeakRetained((id *)&self->_delegate);
              }
              else {
                id v50 = 0LL;
              }
              id v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](v7, "nonDefaultAgentUUID"));
              [v50 networkDiscoveredProxyPaths:v39 registeredForAgentUUID:v51];

              id v37 = &OBJC_IVAR___NSPProxyTokenInfo__tokenConsumedCount;
            }
          }

          uint64_t v38 = (char *)v38 + 1;
        }

        while (v35 != v38);
        id v52 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( WeakRetained,  "countByEnumeratingWithState:objects:count:",  &v59,  v67,  16LL);
        id v35 = v52;
      }

      while (v52);
    }

    goto LABEL_69;
  }

  uint64_t v53 = nplog_obj(v4, v5, v6);
  uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "fallback proxy path, multi hop agent registered",  buf,  2u);
  }

  id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableDictionary multiHopFallbackProxyAgentRegistered:]( WeakRetained,  "multiHopFallbackProxyAgentRegistered:",  1LL);
LABEL_69:
}

- (void)singleHopAgentRegistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  uint64_t v7 = v4;
  if (self)
  {
    if (self->_quicProxyPath != v4)
    {
      fallbackProxyPath = self->_fallbackProxyPath;
      goto LABEL_4;
    }

- (void)obliviousHopAgentRegistered:(id)a3 hostname:(id)a4 processes:(id)a5 agentUUID:(id)a6
{
  id v11 = a4;
  id v9 = a5;
  id v10 = a6;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NSPPrivacyProxyAgentManager obliviousHopAgentRegisteredForHostname:processes:agentUUID:]( self,  "obliviousHopAgentRegisteredForHostname:processes:agentUUID:",  v11,  v9,  v10);
}

- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  BOOL v8 = -[NSPPrivacyProxyAgentManager configurationFetchDateIsWithinStart:end:]( self,  "configurationFetchDateIsWithinStart:end:",  v6,  v7);

  return v8;
}

- (void)proxiedContentAgentRegistered:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 resolverAgentUUID]);
  if (v4) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v8 resolverAgentUUID]);
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v8 quicAgentUUID]);
  }
  id v6 = (void *)v5;

  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 associatedMaps]);
  -[NSPPrivacyProxyAgentManager proxiedContentMaps:registeredForAgentUUID:]( self,  "proxiedContentMaps:registeredForAgentUUID:",  v7,  v6);
}

- (void)multiHopAgentUnregistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  id v7 = v4;
  if (!self)
  {
    if (v4)
    {
      preferredQUICProxyPaths = 0LL;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      goto LABEL_5;
    }

    goto LABEL_57;
  }

  if (self->_quicProxyPath == v4)
  {
LABEL_57:
    uint64_t v52 = nplog_obj(v4, v5, v6);
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "quic proxy path, multihop agent unregistered",  buf,  2u);
    }

    if (self) {
      id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0LL;
    }
    -[NSMutableDictionary multiHopProxyAgentRegistered:](WeakRetained, "multiHopProxyAgentRegistered:", 0LL);
    goto LABEL_62;
  }

  if ((NSPQuicProxyPath *)self->_fallbackProxyPath != v4)
  {
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_5:
    id v9 = preferredQUICProxyPaths;
    id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v60,  v67,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v61;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v61 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)v13);
          if (self) {
            uint64_t v15 = self->_preferredQUICProxyPaths;
          }
          else {
            uint64_t v15 = 0LL;
          }
          uint64_t v16 = (NSPQuicProxyPath *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v60 + 1) + 8LL * (void)v13)));

          if (v16 == v7)
          {
            uint64_t v20 = nplog_obj(v17, v18, v19);
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              __int128 v66 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Preferred QUIC proxy path for %@, multi hop agent unregistered",  buf,  0xCu);
            }

            if (self) {
              id v22 = objc_loadWeakRetained((id *)&self->_delegate);
            }
            else {
              id v22 = 0LL;
            }
            [v22 preferredProxyAgentUnregistered:v14];
          }

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v60,  v67,  16LL);
        id v11 = v23;
      }

      while (v23);
    }

    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    if (self) {
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
    }
    else {
      networkSpecificQUICProxyPaths = 0LL;
    }
    id WeakRetained = networkSpecificQUICProxyPaths;
    id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( WeakRetained,  "countByEnumeratingWithState:objects:count:",  &v56,  v64,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v57;
      id v29 = &OBJC_IVAR___NSPProxyTokenInfo__tokenConsumedCount;
      uint64_t v54 = *(void *)v57;
      uint64_t v55 = WeakRetained;
      do
      {
        id v30 = 0LL;
        do
        {
          if (*(void *)v57 != v28) {
            objc_enumerationMutation(WeakRetained);
          }
          uint64_t v31 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)v30);
          if (self) {
            uint64_t v32 = self->_networkSpecificQUICProxyPaths;
          }
          else {
            uint64_t v32 = 0LL;
          }
          uint64_t v33 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v32,  "objectForKey:",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)v30)));
          id v34 = (void *)v33;
          if (v33) {
            BOOL v35 = v33 == (void)v7;
          }
          else {
            BOOL v35 = 0;
          }
          if (v35)
          {
            uint64_t v36 = objc_opt_class(v29 + 762);
            if ((objc_opt_isKindOfClass(v7, v36) & 1) != 0)
            {
              uint64_t v37 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v7, "ingressProxy"));
              uint64_t v38 = (void *)v37;
              if (v37) {
                uint64_t v39 = *(void **)(v37 + 24);
              }
              else {
                uint64_t v39 = 0LL;
              }
              id v40 = v39;
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 vendor]);
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Agent_%@_%@",  v31,  v41));

              uint64_t v46 = nplog_obj(v43, v44, v45);
              uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412290;
                __int128 v66 = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Network Discovered QUIC proxy path for %@, multi hop agent unregistered",  buf,  0xCu);
              }

              uint64_t v28 = v54;
              id WeakRetained = v55;
              if (self) {
                id v48 = objc_loadWeakRetained((id *)&self->_delegate);
              }
              else {
                id v48 = 0LL;
              }
              [v48 preferredProxyAgentUnregistered:v42];

              id v29 = &OBJC_IVAR___NSPProxyTokenInfo__tokenConsumedCount;
            }
          }

          id v30 = (char *)v30 + 1;
        }

        while (v27 != v30);
        id v49 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( WeakRetained,  "countByEnumeratingWithState:objects:count:",  &v56,  v64,  16LL);
        id v27 = v49;
      }

      while (v49);
    }

    goto LABEL_62;
  }

  uint64_t v50 = nplog_obj(v4, v5, v6);
  id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "fallback proxy path, multihop agent unregistered",  buf,  2u);
  }

  id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableDictionary multiHopFallbackProxyAgentRegistered:]( WeakRetained,  "multiHopFallbackProxyAgentRegistered:",  0LL);
LABEL_62:
}

- (void)singleHopAgentUnregistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  id v7 = v4;
  if (self)
  {
    if (self->_quicProxyPath != v4)
    {
      fallbackProxyPath = self->_fallbackProxyPath;
      goto LABEL_4;
    }

- (void)obliviousHopAgentUnregistered:(id)a3 hostname:(id)a4 agentUUID:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NSPPrivacyProxyAgentManager obliviousHopAgentUnregisteredForHostname:agentUUID:]( self,  "obliviousHopAgentUnregisteredForHostname:agentUUID:",  v8,  v7);
}

- (void)proxiedContentAgentUnregistered:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resolverAgentUUID]);
  if (v5) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 resolverAgentUUID]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 quicAgentUUID]);
  }
  id v7 = (id)v6;

  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NSPPrivacyProxyAgentManager proxiedContentMapsUnregisteredForAgentUUID:]( self,  "proxiedContentMapsUnregisteredForAgentUUID:",  v7);
}

- (void)reportProxySuccessOnInterface:(id)a3 proxyPath:(id)a4
{
  id v12 = a3;
  uint64_t v6 = (NSPQuicProxyPath *)a4;
  id v7 = v6;
  if (!self)
  {
    toggleStats = 0LL;
    id WeakRetained = 0LL;
    if (v6) {
      goto LABEL_13;
    }
LABEL_9:
    id v8 = toggleStats;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](v8, "primaryPathStatistics"));
    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if (self->_probingReason == 2)
  {
    sub_100027BE8((uint64_t)self);
    -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
    -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
  }

  if (self->_quicProxyPath == v7)
  {
    toggleStats = self->_toggleStats;
    goto LABEL_9;
  }

  if ((NSPQuicProxyPath *)self->_fallbackProxyPath == v7)
  {
    id v8 = self->_toggleStats;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](v8, "fallbackPathStatistics"));
    if (!v9)
    {

      goto LABEL_12;
    }

- (id)lastProxyOutageReason
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_lastProxyOutageReasonStats;
  }
  return self;
}

- (void)reportObliviousPathError:(int)a3 interface:(id)a4 obliviousPath:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v52 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if ((_DWORD)v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 proxyInfo]);
    uint64_t v11 = v10;
    if (v10) {
      id v10 = (void *)v10[3];
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 proxyURL]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));

    double v14 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 scheme]);
    -[NSURLComponents setScheme:](v14, "setScheme:", v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 host]);
    -[NSURLComponents setHost:](v14, "setHost:", v16);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 port]);
    -[NSURLComponents setPort:](v14, "setPort:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 obliviousTarget]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 proxyURLPath]);
    -[NSURLComponents setPath:](v14, "setPath:", v19);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v14, "URL"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 absoluteString]);
    -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:]( self,  "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:",  1007LL,  v6,  v21,  0LL,  0LL,  0LL);

    if ((int)v6 > 60)
    {
      if ((int)v6 > 1105)
      {
        switch((_DWORD)v6)
        {
          case 0x452:
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
            if (v22) {
              ++v22[10];
            }
            goto LABEL_41;
          case 0x515:
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
            if (v22) {
              ++v22[14];
            }
            goto LABEL_41;
          case 0x516:
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
            if (v22) {
              ++v22[15];
            }
            goto LABEL_41;
        }
      }

      else
      {
        if ((_DWORD)v6 == 61)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
          if (v22) {
            ++v22[4];
          }
          goto LABEL_41;
        }

        if ((_DWORD)v6 == 80 || (_DWORD)v6 == 1104)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
          if (v24) {
            ++v24[7];
          }

          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
          if (v25)
          {
            unint64_t v26 = v25[7];

            if (v26 >= 2)
            {
              if (self)
              {
                id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](self->_path, "interface"));
                objc_storeStrong((id *)&self->_proberInterface, v27);

                proberInterface = self->_proberInterface;
              }

              else
              {

                proberInterface = 0LL;
              }

              sub_100036CC8((uint64_t)self, proberInterface, 6LL);
            }
          }

          goto LABEL_42;
        }
      }
    }

    else
    {
      if ((v6 + 65568) <= 0x1E)
      {
        if (((1 << (v6 + 32)) & 0x4004C000) != 0)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
          if (v22) {
            ++v22[9];
          }
LABEL_41:

LABEL_42:
          goto LABEL_43;
        }

        if ((_DWORD)v6 == -65568)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
          if (v22) {
            ++v22[8];
          }
          goto LABEL_41;
        }
      }

      if ((_DWORD)v6 == 60)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
        if (v22) {
          ++v22[3];
        }
        goto LABEL_41;
      }
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 statistics]);
    if (v22) {
      ++v22[7];
    }
    goto LABEL_41;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v8 statistics]);
  uint64_t v13 = (void *)v23;
  if (v23) {
    ++*(void *)(v23 + 16);
  }
LABEL_43:

  if ([v9 shouldBePenalized])
  {
    id v29 = v9;
    id v30 = v29;
    if (self)
    {
      if (v29)
      {
        NSUInteger v31 = -[NSArray count](self->_proxyArray, "count");
        if (v31)
        {
          NSUInteger v32 = v31;
          NSUInteger v33 = 0LL;
          NSUInteger v34 = 0LL;
          while (1)
          {
            BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_proxyArray, "objectAtIndex:", v33));
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 proxyURL]);
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v30 proxyInfo]);
            uint64_t v38 = v37;
            if (v37) {
              uint64_t v37 = (void *)v37[3];
            }
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 proxyURL]);
            unsigned __int8 v40 = [v36 isEqualToString:v39];

            if ((v40 & 1) != 0) {
              break;
            }
            NSUInteger v33 = (v34 + 1);
            NSUInteger v34 = v33;
            if (v32 <= v33) {
              goto LABEL_58;
            }
          }

          uint64_t v44 = nplog_obj(v41, v42, v43);
          uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v30 shortName]);
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v54 = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Penalizing oblivious path %@",  buf,  0xCu);
          }

          penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
          if (!penalizedObliviousProxyIndices)
          {
            id v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            id v49 = self->_penalizedObliviousProxyIndices;
            self->_penalizedObliviousProxyIndices = v48;

            penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
          }

          uint64_t v50 = penalizedObliviousProxyIndices;
          id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v34));
          -[NSMutableArray addObject:](v50, "addObject:", v51);

          sub_10002D130((uint64_t)self);
        }
      }
    }

- (void)reportProxiedContentPathError:(int)a3 interface:(id)a4 proxiedContentPath:(id)a5 registration:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v18 = a4;
  id v10 = a5;
  id v11 = a6;
  if ((_DWORD)v8)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v10 quicRegistration]);

    if (v12 == v11)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v10 ingressProxy]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 egressProxy]);
      uint64_t v16 = self;
      uint64_t v17 = 1000LL;
      goto LABEL_6;
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue([v10 fallbackRegistration]);

    if (v13 == v11)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v10 ingressProxy]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 egressProxy]);
      uint64_t v16 = self;
      uint64_t v17 = 1001LL;
LABEL_6:
      -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:]( v16,  "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:",  v17,  v8,  0LL,  v14,  v15,  0LL);
    }
  }
}

- (void)reportProxyError:(int)a3 interface:(id)a4 proxyPath:(id)a5
{
  uint64_t v8 = *(void *)&a3;
  id v10 = (NSDate *)a4;
  id v11 = (NSPFallbackProxyPath *)a5;
  id v12 = (NSDate *)v11;
  if (self)
  {
    if ((NSPFallbackProxyPath *)self->_quicProxyPath != v11)
    {
      if (self->_fallbackProxyPath == v11)
      {
        a5 = self->_toggleStats;
        id v21 = (void *)objc_claimAutoreleasedReturnValue([a5 fallbackPathStatistics]);

        uint64_t v23 = 1001LL;
        goto LABEL_26;
      }

      if (!-[NSPPrivacyProxyAgentManager networkDiscoveredProxyPresentInAgentManager]( self,  "networkDiscoveredProxyPresentInAgentManager"))
      {
        id v21 = 0LL;
        uint64_t v23 = 0LL;
        goto LABEL_26;
      }

      uint64_t v13 = v8;
      __int128 v625 = 0u;
      __int128 v626 = 0u;
      __int128 v623 = 0u;
      __int128 v624 = 0u;
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
      goto LABEL_6;
    }

    toggleStats = self->_toggleStats;
LABEL_20:
    a5 = toggleStats;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([a5 primaryPathStatistics]);

    uint64_t v23 = 1000LL;
    goto LABEL_26;
  }

  uint64_t v13 = v8;
  a5 = v11;
  if (!v11)
  {
    toggleStats = 0LL;
    id v12 = 0LL;
    goto LABEL_20;
  }

  if ([0 networkDiscoveredProxyPresentInAgentManager])
  {
    networkSpecificQUICProxyPaths = 0LL;
    __int128 v625 = 0u;
    __int128 v626 = 0u;
    __int128 v623 = 0u;
    __int128 v624 = 0u;
LABEL_6:
    uint64_t v15 = networkSpecificQUICProxyPaths;
    id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v623,  v631,  16LL);
    if (v16)
    {
      a5 = v16;
      uint64_t v5 = *(void **)v624;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (self) {
            id v18 = self->_networkSpecificQUICProxyPaths;
          }
          else {
            id v18 = 0LL;
          }
          uint64_t v19 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v18,  "objectForKey:",  *(void *)(*((void *)&v623 + 1) + 8LL * (void)v17)));
          if (v19 == v12)
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate networkMultiHopAgentStatistics](v12, "networkMultiHopAgentStatistics"));

            goto LABEL_24;
          }

          uint64_t v17 = (char *)v17 + 1;
        }

        while (a5 != v17);
        id v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v623,  v631,  16LL);
        a5 = v20;
      }

      while (v20);
    }

    id v21 = 0LL;
LABEL_24:

    uint64_t v23 = 0LL;
    goto LABEL_25;
  }

  id v21 = 0LL;
  uint64_t v23 = 0LL;
LABEL_25:
  uint64_t v8 = v13;
LABEL_26:
  if ((int)v8 > 1199)
  {
    int v42 = 1 << (v8 + 80);
    if ((v42 & 0x51) != 0) {
      goto LABEL_60;
    }
    if ((v42 & 0xA2) == 0)
    {
LABEL_86:
      if ((_DWORD)v8 == 1301)
      {
        if (!v21) {
          goto LABEL_361;
        }
        uint64_t v110 = 14LL;
      }

      else
      {
        if ((_DWORD)v8 != 1302) {
          goto LABEL_168;
        }
        if (!v21) {
          goto LABEL_361;
        }
        uint64_t v110 = 15LL;
      }

- (void)reportEpoch:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self)
  {
    unsigned int v5 = -[NSNumber unsignedShortValue](self->_configEpoch, "unsignedShortValue");
    reportedEpoch = self->_reportedEpoch;
  }

  else
  {
    unsigned int v5 = [0 unsignedShortValue];
    reportedEpoch = 0LL;
  }

  id v7 = (id)-[NSNumber unsignedShortValue](reportedEpoch, "unsignedShortValue");
  if (v5 < v3 && v7 < v3)
  {
    uint64_t v11 = nplog_obj(v7, v8, v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        uint64_t v13 = self->_configEpoch;
        double v14 = self->_reportedEpoch;
      }

      else
      {
        uint64_t v13 = 0LL;
        double v14 = 0LL;
      }

      *(_DWORD *)__int128 buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v3;
      *(_WORD *)id v20 = 2112;
      *(void *)&v20[2] = v13;
      *(_WORD *)&v20[10] = 2112;
      *(void *)&v20[12] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "New epoch (%u) is larger than config epoch (%@) and previous reported epoch (%@), triggering config fetch",  buf,  0x1Cu);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
    sub_100023ED4((uint64_t)self, v15);

    *(void *)__int128 buf = 0LL;
    *(void *)id v20 = buf;
    *(void *)&v20[8] = 0x3032000000LL;
    *(void *)&v20[16] = sub_10000CED4;
    id v21 = sub_10000CEE4;
    id v22 = (id)os_transaction_create("com.apple.networkserviceproxy.reportEpoch");
    uint64_t v16 = NPGetInternalQueue(v22);
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003AD30;
    v18[3] = &unk_1000F9428;
    v18[4] = self;
    v18[5] = buf;
    dispatch_async(v17, v18);

    -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
    _Block_object_dispose(buf, 8);
  }

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NSPPrivacyProxyAgentManager reportActivityForApp:path:](self, "reportActivityForApp:path:", v7, v6);
}

- (void)probeSuccess:(id)a3
{
  id v4 = (NSPProber *)a3;
  id v7 = v4;
  if (!self) {
    goto LABEL_18;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_proxyPathProber == v4)
      {
        uint64_t v43 = nplog_obj(v4, v5, v6);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          int64_t v45 = self->_probingReason;
          uint64_t v46 = @"Unknown";
          if (v45 == 2) {
            uint64_t v46 = @"DNS";
          }
          if (v45 == 1) {
            uint64_t v47 = @"Proxy";
          }
          else {
            uint64_t v47 = (__CFString *)v46;
          }
          double v48 = v47;
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Probing(%@): Proxy path probe successful",  buf,  0xCu);
        }

        -[NSPProxyPath resetStats](self->_quicProxyPath, "resetStats");
        -[NSPProxyPath resetError](self->_quicProxyPath, "resetError");
        -[NSPProxyPath resetStats](self->_fallbackProxyPath, "resetStats");
        -[NSPProxyPath resetError](self->_fallbackProxyPath, "resetError");
        double v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        objc_storeStrong((id *)&self->_probeEndTime, v49);

        sub_100027BE8((uint64_t)self);
        *(void *)__int128 buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000LL;
        __int128 v61 = sub_10000CED4;
        int v62 = sub_10000CEE4;
        id v63 = (id)os_transaction_create("com.apple.networkserviceproxy.probeSuccess");
        uint64_t v50 = NPGetInternalQueue(v63);
        uint64_t v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v50);
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_10003B3D4;
        v59[3] = &unk_1000F9428;
        v59[4] = self;
        v59[5] = buf;
        dispatch_async(v51, v59);

        _Block_object_dispose(buf, 8);
      }

      else if (self->_directPathProber == v4)
      {
        uint64_t v9 = v4;
        if (v9)
        {
          unint64_t probeSuccessCount = v9->_probeSuccessCount;

          if (probeSuccessCount >= 2)
          {
            uint64_t v14 = nplog_obj(v11, v12, v13);
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              int64_t v16 = self->_probingReason;
              uint64_t v17 = @"Unknown";
              if (v16 == 2) {
                uint64_t v17 = @"DNS";
              }
              if (v16 == 1) {
                id v18 = @"Proxy";
              }
              else {
                id v18 = (__CFString *)v17;
              }
              uint64_t v19 = v18;
              id v20 = v19;
              directPathProber = self->_directPathProber;
              if (directPathProber) {
                directPathProber = (NSPProber *)directPathProber->_probeSuccessCount;
              }
              *(_DWORD *)__int128 buf = 138412546;
              *(void *)&uint8_t buf[4] = v19;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = directPathProber;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Probing(%@): Direct path probe successful %lu times",  buf,  0x16u);
            }

            objc_storeStrong((id *)&self->_directPathProber, 0LL);
          }
        }
      }

      goto LABEL_52;
    }

- (void)probeFailed:(id)a3
{
  id v4 = (NSPProber *)a3;
  id v7 = v4;
  if (!self) {
    goto LABEL_9;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason == 2) {
    goto LABEL_11;
  }
  if (probingReason == 1)
  {
    if (self->_proxyPathProber == v4)
    {
      uint64_t v9 = v4;
      if (v9 && v9->_probeFailedCount > 1)
      {
        directPathProber = self->_directPathProber;

        if (!directPathProber)
        {
          uint64_t v11 = self->_path;
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v11, "interface"));
          objc_storeStrong((id *)&self->_proberInterface, v12);

          sub_100036CC8((uint64_t)self, self->_proberInterface, 2LL);
        }
      }

      else
      {
      }
    }
  }

  else
  {
LABEL_9:
    uint64_t v13 = nplog_obj(v4, v5, v6);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        int64_t v15 = self->_probingReason;
        int64_t v16 = @"Unknown";
        if (v15 == 2) {
          int64_t v16 = @"DNS";
        }
        if (v15 == 1) {
          uint64_t v17 = @"Proxy";
        }
        else {
          uint64_t v17 = (__CFString *)v16;
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      id v18 = v17;
      int v19 = 138412290;
      id v20 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid probing reason: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

- (void)probeRedirected:(id)a3
{
  id v4 = (NSPProber *)a3;
  id v7 = v4;
  if (!self) {
    goto LABEL_13;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_directPathProber != v4)
      {
LABEL_24:
        -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
        goto LABEL_25;
      }

      uint64_t v9 = nplog_obj(v4, v5, v6);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int64_t v11 = self->_probingReason;
        uint64_t v12 = @"Unknown";
        if (v11 == 2) {
          uint64_t v12 = @"DNS";
        }
        if (v11 == 1) {
          uint64_t v13 = @"Proxy";
        }
        else {
          uint64_t v13 = (__CFString *)v12;
        }
        uint64_t v14 = v13;
        int v29 = 138412290;
        uint64_t v30 = (const char *)v14;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Probing(%@): Direct path probe redirected",  (uint8_t *)&v29,  0xCu);
      }

      -[NSPOutageReasonStats setOutageReasonSubType:]( self->_lastProxyOutageReasonStats,  "setOutageReasonSubType:",  @"CaptiveProbeRedirected");
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained proxyConnectivityNetworkOutage];
LABEL_14:

      goto LABEL_24;
    }

- (void)probeServerError:(id)a3 httpStatusCode:(int64_t)a4
{
  uint64_t v6 = (NSPProber *)a3;
  uint64_t v9 = v6;
  if (!self) {
    goto LABEL_14;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_directPathProber != v6)
      {
LABEL_25:
        -[NSPPrivacyProxyAgentManager updateUserEventAgentData](self, "updateUserEventAgentData");
        goto LABEL_26;
      }

      uint64_t v11 = nplog_obj(v6, v7, v8);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int64_t v13 = self->_probingReason;
        uint64_t v14 = @"Unknown";
        if (v13 == 2) {
          uint64_t v14 = @"DNS";
        }
        if (v13 == 1) {
          int64_t v15 = @"Proxy";
        }
        else {
          int64_t v15 = (__CFString *)v14;
        }
        uint64_t v16 = v15;
        int v32 = 138412290;
        NSUInteger v33 = (const char *)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Probing(%@): Direct path probe received server error",  (uint8_t *)&v32,  0xCu);
      }

      lastProxyOutageReasonStats = self->_lastProxyOutageReasonStats;
      if (a4 == 403)
      {
        -[NSPOutageReasonStats setOutageReasonSubType:]( lastProxyOutageReasonStats,  "setOutageReasonSubType:",  @"ProxyProbeForbidden");
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained proxyConnectivityNetworkOutage];
      }

      else
      {
        -[NSPOutageReasonStats setOutageReasonSubType:]( lastProxyOutageReasonStats,  "setOutageReasonSubType:",  @"ProxyProbeServerError");
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained proxyConnectivityOutage];
      }

- (id)ingressProxyURL
{
  if (self) {
    quicProxyPath = self->_quicProxyPath;
  }
  else {
    quicProxyPath = 0LL;
  }
  uint64_t v3 = quicProxyPath;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v3, "ingressProxy"));
  uint64_t v5 = v4;
  if (v4) {
    id v4 = (void *)v4[3];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 proxyURL]);

  return v6;
}

- (id)ingressFallbackProxyURL
{
  if (self) {
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else {
    fallbackProxyPath = 0LL;
  }
  uint64_t v3 = fallbackProxyPath;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v3, "ingressProxy"));
  uint64_t v5 = v4;
  if (v4) {
    id v4 = (void *)v4[3];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tcpProxyFqdn]);

  return v6;
}

- (void)copyProxyInfo:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    if (self) {
      quicProxyPath = self->_quicProxyPath;
    }
    else {
      quicProxyPath = 0LL;
    }
    uint64_t v8 = quicProxyPath;

    if (v8)
    {
      if (self) {
        uint64_t v9 = self->_quicProxyPath;
      }
      else {
        uint64_t v9 = 0LL;
      }
      id v10 = v9;
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v10, "ingressProxy"));
      uint64_t v12 = (void *)v11;
      if (v11) {
        int64_t v13 = *(void **)(v11 + 24);
      }
      else {
        int64_t v13 = 0LL;
      }
      id v14 = v13;
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 proxyURL]);
      [v6 setIngressProxyURL:v15];

      if (self) {
        uint64_t v16 = self->_quicProxyPath;
      }
      else {
        uint64_t v16 = 0LL;
      }
      uint64_t v17 = v16;
      uint64_t v18 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v17, "egressProxy"));
      uint64_t v19 = (void *)v18;
      if (v18) {
        id v20 = *(void **)(v18 + 24);
      }
      else {
        id v20 = 0LL;
      }
      id v21 = v20;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 proxyURL]);
      [v6 setEgressProxyURL:v22];
    }

    if (self) {
      fallbackProxyPath = self->_fallbackProxyPath;
    }
    else {
      fallbackProxyPath = 0LL;
    }
    int64_t v24 = fallbackProxyPath;

    if (v24)
    {
      if (self) {
        int64_t v25 = self->_fallbackProxyPath;
      }
      else {
        int64_t v25 = 0LL;
      }
      unint64_t v26 = v25;
      uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](v26, "ingressProxy"));
      int64_t v28 = (void *)v27;
      if (v27) {
        int v29 = *(void **)(v27 + 24);
      }
      else {
        int v29 = 0LL;
      }
      id v30 = v29;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 tcpProxyFqdn]);
      [v6 setIngressFallbackProxyURL:v31];

      if (self) {
        int v32 = self->_fallbackProxyPath;
      }
      else {
        int v32 = 0LL;
      }
      NSUInteger v33 = v32;
      uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](v33, "egressProxy"));
      BOOL v35 = (void *)v34;
      if (v34) {
        uint64_t v36 = *(void **)(v34 + 24);
      }
      else {
        uint64_t v36 = 0LL;
      }
      id v37 = v36;
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 tcpProxyFqdn]);
      [v6 setEgressFallbackProxyURL:v38];
    }

    if (self)
    {
      objc_msgSend( v6,  "setProxyTokenFetchSuccessCount:",  (char *)objc_msgSend(v6, "proxyTokenFetchSuccessCount") + self->_tokenFetchSuccessCount);
      unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
    }

    else
    {
      objc_msgSend(v6, "setProxyTokenFetchSuccessCount:", objc_msgSend(v6, "proxyTokenFetchSuccessCount"));
      unint64_t tokenFetchFailedCount = 0LL;
    }

    objc_msgSend( v6,  "setProxyTokenFetchFailedCount:",  (char *)objc_msgSend(v6, "proxyTokenFetchFailedCount") + tokenFetchFailedCount);
    if (self)
    {
      objc_msgSend( v6,  "setProxyTokenConsumedCount:",  (char *)objc_msgSend(v6, "proxyTokenConsumedCount") + self->_tokenConsumedCount);
      unint64_t tokenExpiredCount = self->_tokenExpiredCount;
    }

    else
    {
      objc_msgSend(v6, "setProxyTokenConsumedCount:", objc_msgSend(v6, "proxyTokenConsumedCount"));
      unint64_t tokenExpiredCount = 0LL;
    }

    objc_msgSend( v6,  "setProxyTokenExpiredCount:",  (char *)objc_msgSend(v6, "proxyTokenExpiredCount") + tokenExpiredCount);
    if (self)
    {
      objc_msgSend( v6,  "setProxyAgentLowWaterMarkHitCount:",  (char *)objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount") + self->_agentLowWaterMarkHitCount);
      unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    }

    else
    {
      objc_msgSend(v6, "setProxyAgentLowWaterMarkHitCount:", objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount"));
      unint64_t cacheLowWaterMarkHitCount = 0LL;
    }

    objc_msgSend( v6,  "setProxyCacheLowWaterMarkHitCount:",  (char *)objc_msgSend(v6, "proxyCacheLowWaterMarkHitCount") + cacheLowWaterMarkHitCount);
    if (self)
    {
      objc_msgSend(v6, "setBadTokenCount:", (char *)objc_msgSend(v6, "badTokenCount") + self->_badTokenCount);
      unint64_t missingTokenCount = self->_missingTokenCount;
    }

    else
    {
      objc_msgSend(v6, "setBadTokenCount:", objc_msgSend(v6, "badTokenCount"));
      unint64_t missingTokenCount = 0LL;
    }

    objc_msgSend(v6, "setMissingTokenCount:", (char *)objc_msgSend(v6, "missingTokenCount") + missingTokenCount);
    if (self)
    {
      objc_msgSend( v6,  "setNetworkProxiesRotated:",  (char *)objc_msgSend(v6, "networkProxiesRotated") + self->_networkProxiesRotated);
      unint64_t networkFallbackProxiesRotated = self->_networkFallbackProxiesRotated;
    }

    else
    {
      objc_msgSend(v6, "setNetworkProxiesRotated:", objc_msgSend(v6, "networkProxiesRotated"));
      unint64_t networkFallbackProxiesRotated = 0LL;
    }

    objc_msgSend( v6,  "setNetworkFallbackProxiesRotated:",  (char *)objc_msgSend(v6, "networkFallbackProxiesRotated") + networkFallbackProxiesRotated);
    if (self) {
      unint64_t proxiesRotated = self->_proxiesRotated;
    }
    else {
      unint64_t proxiesRotated = 0LL;
    }
    objc_msgSend(v6, "setProxiesRotated:", (char *)objc_msgSend(v6, "proxiesRotated") + proxiesRotated);
    log = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v89 = self;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    if (self) {
      proxyTokenInfoArray = self->_proxyTokenInfoArray;
    }
    else {
      proxyTokenInfoArray = 0LL;
    }
    uint64_t v46 = proxyTokenInfoArray;
    id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v99,  v105,  16LL);
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v100;
      do
      {
        uint64_t v50 = 0LL;
        do
        {
          if (*(void *)v100 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void *)(*((void *)&v99 + 1) + 8LL * (void)v50);
          if (v51) {
            uint64_t v52 = *(void **)(v51 + 24);
          }
          else {
            uint64_t v52 = 0LL;
          }
          id v53 = v52;
          unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 vendor]);

          if (v54)
          {
            id v55 = objc_alloc_init(&OBJC_CLASS___PrivacyProxyTokenInfo);
            uint64_t v56 = v55;
            if (v51)
            {
              [v55 setCachedTokens:*(void *)(v51 + 32)];
              uint64_t v57 = *(void *)(v51 + 40);
              if (v57) {
                uint64_t v58 = [*(id *)(v57 + 24) tokenCount];
              }
              else {
                uint64_t v58 = 0LL;
              }
              [v56 setAgentTokens:v58];
              if (*(_BYTE *)(v51 + 11)) {
                uint64_t v59 = 30LL;
              }
              else {
                uint64_t v59 = 10LL;
              }
            }

            else
            {
              [v55 setCachedTokens:0];
              [v56 setAgentTokens:0];
              uint64_t v59 = 0LL;
            }

            [v56 setCacheLowWaterMark:v59];
            [v56 setAgentLowWaterMark:sub_10000F2E8(v51)];
            -[NSMutableDictionary setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v56, v54);
          }

          if (v51)
          {
            objc_msgSend( v6,  "setProxyTokenFetchSuccessCount:",  (char *)objc_msgSend(v6, "proxyTokenFetchSuccessCount") + *(void *)(v51 + 88));
            uint64_t v60 = *(void *)(v51 + 112);
          }

          else
          {
            objc_msgSend(v6, "setProxyTokenFetchSuccessCount:", objc_msgSend(v6, "proxyTokenFetchSuccessCount"));
            uint64_t v60 = 0LL;
          }

          objc_msgSend( v6,  "setProxyTokenFetchFailedCount:",  (char *)objc_msgSend(v6, "proxyTokenFetchFailedCount") + v60);
          if (v51)
          {
            objc_msgSend( v6,  "setProxyTokenConsumedCount:",  (char *)objc_msgSend(v6, "proxyTokenConsumedCount") + *(void *)(v51 + 96));
            uint64_t v61 = *(void *)(v51 + 104);
          }

          else
          {
            objc_msgSend(v6, "setProxyTokenConsumedCount:", objc_msgSend(v6, "proxyTokenConsumedCount"));
            uint64_t v61 = 0LL;
          }

          objc_msgSend(v6, "setProxyTokenExpiredCount:", (char *)objc_msgSend(v6, "proxyTokenExpiredCount") + v61);
          if (v51)
          {
            objc_msgSend( v6,  "setProxyAgentLowWaterMarkHitCount:",  (char *)objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount") + *(void *)(v51 + 120));
            uint64_t v62 = *(void *)(v51 + 128);
          }

          else
          {
            objc_msgSend(v6, "setProxyAgentLowWaterMarkHitCount:", objc_msgSend(v6, "proxyAgentLowWaterMarkHitCount"));
            uint64_t v62 = 0LL;
          }

          objc_msgSend( v6,  "setProxyCacheLowWaterMarkHitCount:",  (char *)objc_msgSend(v6, "proxyCacheLowWaterMarkHitCount") + v62);
          if (v51)
          {
            objc_msgSend(v6, "setBadTokenCount:", (char *)objc_msgSend(v6, "badTokenCount") + *(void *)(v51 + 136));
            uint64_t v51 = *(void *)(v51 + 144);
          }

          else
          {
            objc_msgSend(v6, "setBadTokenCount:", objc_msgSend(v6, "badTokenCount"));
          }

          objc_msgSend(v6, "setMissingTokenCount:", (char *)objc_msgSend(v6, "missingTokenCount") + v51);

          uint64_t v50 = (char *)v50 + 1;
        }

        while (v48 != v50);
        id v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v99,  v105,  16LL);
        id v48 = v63;
      }

      while (v63);
    }

    [v6 setTokenCounts:log];
    __int128 v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v87 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    proxiedContentPaths = v89;
    if (v89) {
      proxiedContentPaths = v89->_proxiedContentPaths;
    }
    id obj = proxiedContentPaths;
    id v66 = [obj countByEnumeratingWithState:&v95 objects:v104 count:16];
    if (v66)
    {
      id v67 = v66;
      uint64_t v90 = *(void *)v96;
      do
      {
        uint64_t v68 = 0LL;
        do
        {
          if (*(void *)v96 != v90) {
            objc_enumerationMutation(obj);
          }
          uint64_t v69 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)v68);
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v69 associatedMaps]);
          id v71 = [v70 countByEnumeratingWithState:&v91 objects:v103 count:16];
          if (v71)
          {
            id v72 = v71;
            uint64_t v73 = *(void *)v92;
            do
            {
              for (i = 0LL; i != v72; i = (char *)i + 1)
              {
                if (*(void *)v92 != v73) {
                  objc_enumerationMutation(v70);
                }
                -[NSMutableArray addObject:](v64, "addObject:", v75);
              }

              id v72 = [v70 countByEnumeratingWithState:&v91 objects:v103 count:16];
            }

            while (v72);
          }

          __int16 v76 = (void *)objc_claimAutoreleasedReturnValue([v69 ingressProxy]);
          if (v76) {
            unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v69 ingressProxy]);
          }
          else {
            unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v69 egressProxy]);
          }
          uint64_t v78 = v77;
          if (v77) {
            unint64_t v77 = (void *)v77[3];
          }
          uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v77 vendor]);

          if (v79)
          {
            uint64_t v80 = objc_claimAutoreleasedReturnValue([v69 quicRegistration]);
            uint64_t v81 = (void *)v80;
            if (v80) {
              uint64_t v82 = [*(id *)(v80 + 24) tokenCount];
            }
            else {
              uint64_t v82 = 0LL;
            }

            id v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v82));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v87, "setObject:forKeyedSubscript:", v83, v79);
          }

          uint64_t v68 = (char *)v68 + 1;
        }

        while (v68 != v67);
        id v84 = [obj countByEnumeratingWithState:&v95 objects:v104 count:16];
        id v67 = v84;
      }

      while (v84);
    }

    [v6 setResumableSessionCounts:v87];
    [v6 setEnabledProxiedContentMaps:v64];
  }

  else
  {
    uint64_t v85 = nplog_obj(0LL, v4, v5);
    log = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v107 = "-[NSPPrivacyProxyAgentManager copyProxyInfo:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)log,  OS_LOG_TYPE_FAULT,  "%s called with null proxyInfo",  buf,  0xCu);
    }
  }
}

- (void)updateUserEventAgentData
{
  BOOL v3 = -[NSPPrivacyProxyAgentManager deferCommit](self, "deferCommit");
  if (!v3)
  {
    uint64_t v6 = nplog_obj(v3, v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updating userevent agent data", v12, 2u);
    }

    uint64_t v8 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSPPrivacyProxyAgentManager encodeWithCoder:](self, "encodeWithCoder:", v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v8, "encodedData"));
    [v9 setAuxiliaryData:v10 forKey:@"NSPProxyAgentManagerAuxilaryData"];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
    [v11 commit];
  }

- (void)setUserEventAgentTokenFetchParameters
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0LL;
  }
  BOOL v3 = proxyTokenInfoArray;
  char v4 = 0;
  id v5 = 0LL;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v8);
        if (v5)
        {
          if (v9)
          {
            id v10 = *(id *)(v9 + 80);
            if (v10)
            {
              uint64_t v11 = v10;
              [*(id *)(v9 + 80) timeIntervalSinceDate:v5];
              BOOL v13 = v12 < 0.0;

              if (v13)
              {
                id v14 = *(id *)(v9 + 80);

                id v5 = v14;
              }
            }

            goto LABEL_15;
          }
        }

        else
        {
          if (v9)
          {
            id v5 = *(id *)(v9 + 80);
LABEL_15:
            BOOL v15 = *(_BYTE *)(v9 + 9) != 0;
            goto LABEL_16;
          }

          id v5 = 0LL;
        }

        BOOL v15 = 0;
LABEL_16:
        v4 |= v15;
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      id v6 = v16;
    }

    while (v16);
  }

  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_10000CED4;
  v24[4] = sub_10000CEE4;
  id v25 = (id)os_transaction_create("com.apple.networkserviceproxy.setUserEventAgentTokenFetchParameters");
  uint64_t v17 = NPGetInternalQueue(v25);
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C954;
  block[3] = &unk_1000F9B90;
  char v23 = v4 & 1;
  id v21 = v5;
  uint64_t v22 = v24;
  id v19 = v5;
  dispatch_async(v18, block);

  _Block_object_dispose(v24, 8);
}

- (void)setUserEventAgentProberParameters
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = sub_10000CED4;
  v6[4] = sub_10000CEE4;
  id v7 = (id)os_transaction_create("com.apple.networkserviceproxy.setUserEventAgentProberParameters");
  uint64_t v3 = NPGetInternalQueue(v7);
  char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003CADC;
  v5[3] = &unk_1000F9428;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

- (void)reportTokenFetchFailure:(id)a3 statusCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyTokenManager sharedTokenManager]( &OBJC_CLASS___NSPPrivacyTokenManager,  "sharedTokenManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tokenFetchURL]);
  -[NSPPrivacyProxyAgentManager sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:]( self,  "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:",  1003LL,  a4,  v6,  0LL,  0LL,  v8);

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSPTokenServerStats);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager tierString](self, "tierString"));
  -[NSPTokenServerStats setTierType:](v9, "setTierType:", v10);

  if (self && self->_tokenServerMaskedAddress)
  {
    -[NSPTokenServerStats setTokenServerAddress:](v9, "setTokenServerAddress:");
    -[NSPProxyAnalytics sendAnalytics](v9, "sendAnalytics");
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyTokenManager sharedTokenManager]( &OBJC_CLASS___NSPPrivacyTokenManager,  "sharedTokenManager"));
    if (self) {
      path = self->_path;
    }
    else {
      path = 0LL;
    }
    BOOL v13 = path;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v13, "interface"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10003CE2C;
    v16[3] = &unk_1000F9BB8;
    v16[4] = self;
    BOOL v15 = v9;

    uint64_t v17 = v15;
    [v11 getTokenServerIPWithInterface:v14 completionHandler:v16];
  }
}

- (id)singleHopQUICProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager multiHopConfigurationHash](self, "multiHopConfigurationHash", a3);
}

- (id)multiHopQUICProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager singleHopConfigurationHash](self, "singleHopConfigurationHash", a3);
}

- (id)multiHopFallbackProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager multiHopConfigurationHash](self, "multiHopConfigurationHash", a3);
}

- (id)singleHopFallbackProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return -[NSPPrivacyProxyAgentManager singleHopConfigurationHash](self, "singleHopConfigurationHash", a3);
}

- (id)alternatePreferredPathAgentUUIDs:(id)a3
{
  id v29 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  if (self) {
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
  }
  else {
    preferredQUICProxyPaths = 0LL;
  }
  id obj = preferredQUICProxyPaths;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
  if (!v5)
  {
    __int128 v26 = 0LL;
    goto LABEL_31;
  }

  id v6 = v5;
  __int128 v26 = 0LL;
  uint64_t v28 = *(void *)v31;
  do
  {
    id v7 = 0LL;
    do
    {
      if (*(void *)v31 != v28) {
        objc_enumerationMutation(obj);
      }
      if (self) {
        uint64_t v8 = self->_preferredQUICProxyPaths;
      }
      else {
        uint64_t v8 = 0LL;
      }
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v7),  v26));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 egressProxy]);
      uint64_t v11 = (void *)v10;
      if (v10) {
        double v12 = *(void **)(v10 + 24);
      }
      else {
        double v12 = 0LL;
      }
      id v13 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 vendor]);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v29 egressProxy]);
      id v16 = v15;
      if (v15) {
        BOOL v15 = (void *)v15[3];
      }
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 vendor]);
      unsigned __int8 v18 = [v14 isEqualToString:v17];

      if ((v18 & 1) == 0)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 egressProxy]);
        id v20 = v19;
        if (v19) {
          id v19 = (void *)v19[3];
        }
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 preferredPathPatterns]);
        if ([v21 count])
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 nonDefaultAgentUUID]);

          if (!v22) {
            goto LABEL_24;
          }
          char v23 = v26;
          if (!v26) {
            char v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 nonDefaultAgentUUID]);
          __int128 v26 = v23;
          -[NSMutableArray addObject:](v23, "addObject:", v20);
        }

        else
        {
        }
      }

- (void)didReceiveUpdatedPvDOptions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = kSCPropNetPvDHTTPSupported;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKey:kSCPropNetPvDHTTPSupported]);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = kSCPropNetPvDIdentifier;
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 objectForKey:kSCPropNetPvDIdentifier]);
      if (!v10)
      {
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v11 = (void *)v10;
      uint64_t v12 = kSCPropNetPvDAdditionalInformation;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kSCPropNetPvDAdditionalInformation]);

      if (v13)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v12]);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v8, v14);
        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v32 = nplog_obj(isKindOfClass, v16, v17);
          char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "PvD additional info not in the correct format",  buf,  2u);
          }

          goto LABEL_20;
        }

        unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
        unsigned int v19 = [v18 intValue];

        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v9]);
        char v23 = v20;
        if (v19 == 1)
        {
          if (-[os_log_s length](v20, "length"))
          {
            __int128 v26 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
            -[NSURLComponents setPath:](v26, "setPath:", @"/.well-known/pvd");
            -[NSURLComponents setScheme:](v26, "setScheme:", @"https");
            -[NSURLComponents setHost:](v26, "setHost:", v23);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v26, "URL"));
            if (self)
            {
              pvdConfigurationFetcher = self->_pvdConfigurationFetcher;
              if (pvdConfigurationFetcher)
              {
LABEL_13:
                sub_10004BCF8(pvdConfigurationFetcher, v8, v27);

LABEL_20:
                goto LABEL_21;
              }

              id v29 = objc_alloc(&OBJC_CLASS___NSPPvDConfigurationFetcher);
              id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            }

            else
            {
              id v29 = objc_alloc(&OBJC_CLASS___NSPPvDConfigurationFetcher);
              id WeakRetained = 0LL;
            }

            __int128 v31 = sub_10004ACA8((id *)&v29->super.isa, self, WeakRetained);
            sub_100023EA4((uint64_t)self, v31);

            if (self) {
              pvdConfigurationFetcher = self->_pvdConfigurationFetcher;
            }
            else {
              pvdConfigurationFetcher = 0LL;
            }
            goto LABEL_13;
          }

          uint64_t v37 = nplog_obj(0LL, v24, v25);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v37);
          if (!os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
          {
LABEL_19:

            goto LABEL_20;
          }

          __int16 v38 = 0;
          BOOL v35 = "Identifier was not found in PvD options";
          uint64_t v36 = (uint8_t *)&v38;
        }

        else
        {
          uint64_t v33 = nplog_obj(v20, v21, v22);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          if (!os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          __int16 v39 = 0;
          BOOL v35 = "HTTP over TLS is not supported";
          uint64_t v36 = (uint8_t *)&v39;
        }

        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_ERROR, v35, v36, 2u);
        goto LABEL_19;
      }
    }
  }

- (BOOL)networkDiscoveredProxyPresentInAgentManager
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_networkSpecificQUICProxyPaths;
  }
  id v2 = -[NSPPrivacyProxyAgentManager count](self, "count");
  id v5 = v2;
  if (v2)
  {
    uint64_t v6 = nplog_obj(v2, v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Network discovered proxy was found to be present",  v9,  2u);
    }
  }

  return v5 != 0LL;
}

- (void)setupMasqueProxyWith:(id)a3
{
  id v14 = a3;
  if (v14)
  {
    uint64_t v4 = self ? self->_path : 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v4, "interface"));

    if (v5)
    {
      if (self)
      {
        networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
        if (!networkDiscoveredProxyInfos)
        {
          uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          sub_100023DB4((uint64_t)self, v7);

          networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
        }

        uint64_t v8 = networkDiscoveredProxyInfos;
        path = self->_path;
      }

      else
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        sub_100023DB4(0LL, v13);

        uint64_t v8 = 0LL;
        path = 0LL;
      }

      uint64_t v10 = path;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NWPath interface](v10, "interface"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 interfaceName]);
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v14, v12);

      sub_100031D68((uint64_t)self);
    }
  }
}

- (BOOL)dnsFilteringHintEnabled
{
  return self->dnsFilteringHintEnabled;
}

- (void)setDnsFilteringHintEnabled:(BOOL)a3
{
  self->dnsFilteringHintEnabled = a3;
}

- (NSString)geohashOverride
{
  return self->geohashOverride;
}

- (void)setGeohashOverride:(id)a3
{
}

- (NSDate)tokenIssuanceRestrictedUntilDate
{
  return self->_tokenIssuanceRestrictedUntilDate;
}

- (NSString)overridePreferredProxy
{
  return self->_overridePreferredProxy;
}

- (NSString)overridePreferredObliviousProxy
{
  return self->_overridePreferredObliviousProxy;
}

- (NSString)overrideIngressProxy
{
  return self->_overrideIngressProxy;
}

- (NSString)overrideFallbackIngressProxy
{
  return self->_overrideFallbackIngressProxy;
}

- (NSData)overrideIngressProxyKey
{
  return self->_overrideIngressProxyKey;
}

- (BOOL)forceFallback
{
  return self->_forceFallback;
}

- (void).cxx_destruct
{
}

@end