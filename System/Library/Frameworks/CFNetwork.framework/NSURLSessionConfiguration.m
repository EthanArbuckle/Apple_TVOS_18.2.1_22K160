@interface NSURLSessionConfiguration
+ (NSURLSessionConfiguration)defaultSessionConfiguration;
+ (id)_defaultProtocolClasses;
- (BOOL)HTTPShouldSetCookies;
- (BOOL)HTTPShouldUsePipelining;
- (BOOL)_allowTCPIOConnectionStreamTask;
- (BOOL)_allowsHSTSWithUntrustedRootCertificate;
- (BOOL)_allowsIndefiniteConnections;
- (BOOL)_allowsMultipathTCP;
- (BOOL)_allowsPowerNapScheduling;
- (BOOL)_allowsResponseMonitoringDuringBodyTranmission;
- (BOOL)_allowsRetryForBackgroundDataTasks;
- (BOOL)_allowsTCPFastOpen;
- (BOOL)_allowsTLSECH;
- (BOOL)_allowsTLSFallback;
- (BOOL)_allowsTLSFalseStart;
- (BOOL)_allowsTLSSessionResumption;
- (BOOL)_allowsTLSSessionTickets;
- (BOOL)_allowsVirtualInterfaces;
- (BOOL)_alwaysPerformDefaultTrustEvaluation;
- (BOOL)_clientIsNotExplicitlyDiscretionary;
- (BOOL)_disableAPWakeOnIdleConnections;
- (BOOL)_disablesNWLoader;
- (BOOL)_disablesOutOfProcessDirectWiFiUsage;
- (BOOL)_disablesUseOfProxySession;
- (BOOL)_duetPreauthorized;
- (BOOL)_enableOAuthBearerTokenChallenges;
- (BOOL)_forcesNewConnections;
- (BOOL)_ignoreDidReceiveResponseDisposition;
- (BOOL)_inPrivateBrowsing;
- (BOOL)_infersDiscretionaryFromOriginatingClient;
- (BOOL)_isProxySession;
- (BOOL)_onBehalfOfPairedDevice;
- (BOOL)_overridesBackgroundSessionAutoRedirect;
- (BOOL)_performsEVCertCheck;
- (BOOL)_prefersInfraWiFi;
- (BOOL)_preventsAppSSO;
- (BOOL)_preventsDirectWiFiAccess;
- (BOOL)_preventsIdleSleep;
- (BOOL)_preventsIdleSleepOnceConnected;
- (BOOL)_preventsSystemHTTPProxyAuthentication;
- (BOOL)_prohibitEncryptedDNS;
- (BOOL)_reportsDataStalls;
- (BOOL)_requiresClientToOpenFiles;
- (BOOL)_requiresPowerPluggedIn;
- (BOOL)_requiresSecureHTTPSProxyConnection;
- (BOOL)_requiresSustainedDataDelivery;
- (BOOL)_respectsAllowsCellularAccessForDiscretionaryTasks;
- (BOOL)_sessionSendsLaunchOnDemandEvents;
- (BOOL)_shouldPreserveBackgroundSessionDisposition;
- (BOOL)_shouldSkipPreferredClientCertificateLookup;
- (BOOL)_supportsAVAssetDownloads;
- (BOOL)_usePipeliningHeuristics;
- (BOOL)_usesNWLoader;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsConstrainedNetworkAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)isBackgroundSession;
- (BOOL)isDiscretionary;
- (BOOL)proxiesRequireNWLoader;
- (BOOL)requiresDNSSECValidation;
- (BOOL)sessionSendsLaunchEvents;
- (BOOL)shouldUseExtendedBackgroundIdleMode;
- (BOOL)skip_download_unlink;
- (BOOL)waitsForConnectivity;
- (HTTPConnectionCacheLimits)getConnectionCacheLimits;
- (NSArray)_proxyConfigurations;
- (NSArray)protocolClasses;
- (NSData)_atsContext;
- (NSData)_sourceApplicationAuditTokenData;
- (NSDictionary)HTTPAdditionalHeaders;
- (NSDictionary)_overriddenDelegateOptions;
- (NSDictionary)_socketStreamProperties;
- (NSDictionary)connectionProxyDictionary;
- (NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy;
- (NSInteger)HTTPMaximumConnectionsPerHost;
- (NSNumber)_maximumWatchCellularTransferSize;
- (NSSet)_authenticatorStatusCodes;
- (NSSet)_suppressedAutoAddedHTTPHeaders;
- (NSString)_CTDataConnectionServiceType;
- (NSString)_attributedBundleIdentifier;
- (NSString)_companionAppBundleIdentifier;
- (NSString)_connectionPoolName;
- (NSString)_downloadFileProtectionType;
- (NSString)_sourceApplicationBundleIdentifier;
- (NSString)_sourceApplicationSecondaryIdentifier;
- (NSString)_tcpConnectionPoolName;
- (NSString)_tlsTrustPinningPolicyName;
- (NSString)_watchAppBundleIdentifier;
- (NSString)_watchExtensionBundleIdentifier;
- (NSString)disposition;
- (NSString)identifier;
- (NSString)sharedContainerIdentifier;
- (NSTimeInterval)timeoutIntervalForRequest;
- (NSTimeInterval)timeoutIntervalForResource;
- (NSURL)_directoryForDownloadedFiles;
- (NSURLCache)URLCache;
- (NSURLCache)_phskip_urlCache;
- (NSURLCredentialStorage)URLCredentialStorage;
- (NSURLRequestCachePolicy)requestCachePolicy;
- (NSURLRequestNetworkServiceType)networkServiceType;
- (NSURLSessionAppleIDContext)_appleIDContext;
- (SSLProtocol)TLSMaximumSupportedProtocol;
- (SSLProtocol)TLSMinimumSupportedProtocol;
- (_CFHSTSPolicy)copyHSTSPolicy;
- (_NSHSTSStorage)_hstsStorage;
- (_NSHSTSStorage)_phskip_hstsStorage;
- (_NSHTTPAlternativeServicesStorage)_alternativeServicesStorage;
- (_NSHTTPAlternativeServicesStorage)_phskip_alternativeServicesStorage;
- (char)initWithDisposition:(void *)a1;
- (double)_connectionCacheCellPurgeTimeout;
- (double)_connectionCachePurgeTimeout;
- (double)_customReadBufferTimeout;
- (double)_longLivedConnectionCacheCellPurgeTimeout;
- (double)_longLivedConnectionCachePurgeTimeout;
- (id).cxx_construct;
- (id)copyImmutableVariant:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)_allowsHTTP3Internal;
- (int)_enablesL4SInternal;
- (int)_loggingPrivacyLevel;
- (int)_neTrackerTCCResult;
- (int)_pidForHAR;
- (int)_xpcActivityBudgeted;
- (int64_t)_IDSMessageTimeout;
- (int64_t)_connectionCacheMinimumFastLanePriority;
- (int64_t)_connectionCacheNumFastLanes;
- (int64_t)_connectionCacheNumPriorityLevels;
- (int64_t)_duetPreClearedMode;
- (int64_t)_expiredDNSBehavior;
- (int64_t)_timingDataOptions;
- (unint64_t)_TCPAdaptiveReadTimeout;
- (unint64_t)_TCPAdaptiveWriteTimeout;
- (unint64_t)_customReadBufferSize;
- (unint64_t)_forcedNetworkServiceType;
- (unint64_t)_multipathAlternatePort;
- (void)_copyAttribute:(__CFString *)a3;
- (void)dealloc;
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess;
- (void)setBackgroundSession:(BOOL)a3;
- (void)setConnectionProxyDictionary:(NSDictionary *)connectionProxyDictionary;
- (void)setDiscretionary:(BOOL)discretionary;
- (void)setDisposition:(id)a3;
- (void)setHTTPAdditionalHeaders:(NSDictionary *)HTTPAdditionalHeaders;
- (void)setHTTPCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy;
- (void)setHTTPMaximumConnectionsPerHost:(NSInteger)HTTPMaximumConnectionsPerHost;
- (void)setHTTPShouldSetCookies:(BOOL)HTTPShouldSetCookies;
- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining;
- (void)setIdentifier:(id)a3;
- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType;
- (void)setProtocolClasses:(NSArray *)protocolClasses;
- (void)setRequestCachePolicy:(NSURLRequestCachePolicy)requestCachePolicy;
- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation;
- (void)setSessionSendsLaunchEvents:(BOOL)sessionSendsLaunchEvents;
- (void)setSharedContainerIdentifier:(NSString *)sharedContainerIdentifier;
- (void)setShouldUseExtendedBackgroundIdleMode:(BOOL)shouldUseExtendedBackgroundIdleMode;
- (void)setSkip_download_unlink:(BOOL)a3;
- (void)setTLSMaximumSupportedProtocol:(SSLProtocol)TLSMaximumSupportedProtocol;
- (void)setTLSMinimumSupportedProtocol:(SSLProtocol)TLSMinimumSupportedProtocol;
- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest;
- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource;
- (void)setURLCache:(NSURLCache *)URLCache;
- (void)setWaitsForConnectivity:(BOOL)waitsForConnectivity;
- (void)set_CTDataConnectionServiceType:(id)a3;
- (void)set_IDSMessageTimeout:(int64_t)a3;
- (void)set_TCPAdaptiveReadTimeout:(unint64_t)a3;
- (void)set_TCPAdaptiveWriteTimeout:(unint64_t)a3;
- (void)set_allowTCPIOConnectionStreamTask:(BOOL)a3;
- (void)set_allowsHSTSWithUntrustedRootCertificate:(BOOL)a3;
- (void)set_allowsHTTP3Internal:(int)a3;
- (void)set_allowsIndefiniteConnections:(BOOL)a3;
- (void)set_allowsMultipathTCP:(BOOL)a3;
- (void)set_allowsPowerNapScheduling:(BOOL)a3;
- (void)set_allowsResponseMonitoringDuringBodyTranmission:(BOOL)a3;
- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3;
- (void)set_allowsTCPFastOpen:(BOOL)a3;
- (void)set_allowsTLSECH:(BOOL)a3;
- (void)set_allowsTLSFallback:(BOOL)a3;
- (void)set_allowsTLSFalseStart:(BOOL)a3;
- (void)set_allowsTLSSessionResumption:(BOOL)a3;
- (void)set_allowsTLSSessionTickets:(BOOL)a3;
- (void)set_allowsVirtualInterfaces:(BOOL)a3;
- (void)set_alternativeServicesStorage:(id)a3;
- (void)set_alwaysPerformDefaultTrustEvaluation:(BOOL)a3;
- (void)set_appleIDContext:(id)a3;
- (void)set_atsContext:(id)a3;
- (void)set_attributedBundleIdentifier:(id)a3;
- (void)set_authenticatorStatusCodes:(id)a3;
- (void)set_clientIsNotExplicitlyDiscretionary:(BOOL)a3;
- (void)set_companionAppBundleIdentifier:(id)a3;
- (void)set_connectionCacheCellPurgeTimeout:(double)a3;
- (void)set_connectionCacheMinimumFastLanePriority:(int64_t)a3;
- (void)set_connectionCacheNumFastLanes:(int64_t)a3;
- (void)set_connectionCacheNumPriorityLevels:(int64_t)a3;
- (void)set_connectionCachePurgeTimeout:(double)a3;
- (void)set_connectionPoolName:(id)a3;
- (void)set_customReadBufferSize:(unint64_t)a3;
- (void)set_customReadBufferTimeout:(double)a3;
- (void)set_directoryForDownloadedFiles:(id)a3;
- (void)set_disableAPWakeOnIdleConnections:(BOOL)a3;
- (void)set_disablesNWLoader:(BOOL)a3;
- (void)set_disablesOutOfProcessDirectWiFiUsage:(BOOL)a3;
- (void)set_disablesUseOfProxySession:(BOOL)a3;
- (void)set_downloadFileProtectionType:(id)a3;
- (void)set_duetPreClearedMode:(int64_t)a3;
- (void)set_duetPreauthorized:(BOOL)a3;
- (void)set_enableOAuthBearerTokenChallenges:(BOOL)a3;
- (void)set_enablesL4SInternal:(int)a3;
- (void)set_expiredDNSBehavior:(int64_t)a3;
- (void)set_forcedNetworkServiceType:(unint64_t)a3;
- (void)set_forcesNewConnections:(BOOL)a3;
- (void)set_hstsStorage:(id)a3;
- (void)set_ignoreDidReceiveResponseDisposition:(BOOL)a3;
- (void)set_infersDiscretionaryFromOriginatingClient:(BOOL)a3;
- (void)set_loggingPrivacyLevel:(int)a3;
- (void)set_longLivedConnectionCacheCellPurgeTimeout:(double)a3;
- (void)set_longLivedConnectionCachePurgeTimeout:(double)a3;
- (void)set_maximumWatchCellularTransferSize:(id)a3;
- (void)set_multipathAlternatePort:(unint64_t)a3;
- (void)set_neTrackerTCCResult:(int)a3;
- (void)set_onBehalfOfPairedDevice:(BOOL)a3;
- (void)set_overriddenDelegateOptions:(id)a3;
- (void)set_overridesBackgroundSessionAutoRedirect:(BOOL)a3;
- (void)set_performsEVCertCheck:(BOOL)a3;
- (void)set_phskip_alternativeServicesStorage:(id)a3;
- (void)set_phskip_hstsStorage:(id)a3;
- (void)set_phskip_urlCache:(id)a3;
- (void)set_pidForHAR:(int)a3;
- (void)set_prefersInfraWiFi:(BOOL)a3;
- (void)set_preventsAppSSO:(BOOL)a3;
- (void)set_preventsDirectWiFiAccess:(BOOL)a3;
- (void)set_preventsIdleSleep:(BOOL)a3;
- (void)set_preventsIdleSleepOnceConnected:(BOOL)a3;
- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3;
- (void)set_prohibitEncryptedDNS:(BOOL)a3;
- (void)set_proxyConfigurations:(id)a3;
- (void)set_proxySession:(BOOL)a3;
- (void)set_reportsDataStalls:(BOOL)a3;
- (void)set_requiresClientToOpenFiles:(BOOL)a3;
- (void)set_requiresPowerPluggedIn:(BOOL)a3;
- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3;
- (void)set_requiresSustainedDataDelivery:(BOOL)a3;
- (void)set_respectsAllowsCellularAccessForDiscretionaryTasks:(BOOL)a3;
- (void)set_sessionSendsLaunchOnDemandEvents:(BOOL)a3;
- (void)set_shouldPreserveBackgroundSessionDisposition:(BOOL)a3;
- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3;
- (void)set_socketStreamProperties:(id)a3;
- (void)set_sourceApplicationAuditTokenData:(id)a3;
- (void)set_sourceApplicationBundleIdentifier:(id)a3;
- (void)set_sourceApplicationSecondaryIdentifier:(id)a3;
- (void)set_supportsAVAssetDownloads:(BOOL)a3;
- (void)set_suppressedAutoAddedHTTPHeaders:(id)a3;
- (void)set_tcpConnectionPoolName:(id)a3;
- (void)set_timingDataOptions:(int64_t)a3;
- (void)set_tlsTrustPinningPolicyName:(id)a3;
- (void)set_usePipeliningHeuristics:(BOOL)a3;
- (void)set_usesNWLoader:(BOOL)a3;
- (void)set_watchAppBundleIdentifier:(id)a3;
- (void)set_watchExtensionBundleIdentifier:(id)a3;
- (void)set_xpcActivityBudgeted:(int)a3;
@end

@implementation NSURLSessionConfiguration

- (void)_copyAttribute:(__CFString *)a3
{
  v5 = (void *)MEMORY[0x186E1578C](self, a2);
  int ExactString = _findExactString(a3, 0xEu);
  if (ExactString > 576945453)
  {
    if (ExactString > 580181338)
    {
      if (ExactString <= 583310728)
      {
        if (ExactString != 580181339)
        {
          if (ExactString == 582237560)
          {
            -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
            unint64_t valuePtr = v7;
            v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
            CFNumberType v9 = kCFNumberDoubleType;
LABEL_41:
            v15 = CFNumberCreate(v8, v9, &valuePtr);
            goto LABEL_42;
          }

          goto LABEL_43;
        }

        BOOL v11 = -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics");
        goto LABEL_33;
      }

      if (ExactString == 583310729)
      {
        if (-[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol") == kSSLProtocolUnknown)
        {
LABEL_44:
          v16 = 0LL;
          goto LABEL_45;
        }

        SSLProtocol v12 = -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol");
        goto LABEL_39;
      }

      if (ExactString == 584359324)
      {
        SSLProtocol v12 = -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol");
LABEL_39:
        unint64_t valuePtr = v12;
        goto LABEL_40;
      }

- (NSURLRequestCachePolicy)requestCachePolicy
{
  return self->_requestCachePolicy;
}

- (NSTimeInterval)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (BOOL)_usePipeliningHeuristics
{
  return self->_usePipeliningHeuristics;
}

- (BOOL)HTTPShouldUsePipelining
{
  return self->_HTTPShouldUsePipelining;
}

- (NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy
{
  return self->_HTTPCookieAcceptPolicy;
}

- (BOOL)_preventsIdleSleep
{
  return self->_preventsIdleSleep;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSURLRequestNetworkServiceType)networkServiceType
{
  return self->_networkServiceType;
}

- (NSDictionary)connectionProxyDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 200LL, 1);
}

- (SSLProtocol)TLSMinimumSupportedProtocol
{
  return self->_TLSMinimumSupportedProtocol;
}

- (SSLProtocol)TLSMaximumSupportedProtocol
{
  return self->_TLSMaximumSupportedProtocol;
}

- (NSDictionary)HTTPAdditionalHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 216LL, 1);
}

- (NSTimeInterval)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (NSURLSessionAppleIDContext)_appleIDContext
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 296LL, 1);
}

- (NSSet)_authenticatorStatusCodes
{
  return (NSSet *)objc_getProperty(self, a2, 456LL, 1);
}

- (BOOL)_requiresSustainedDataDelivery
{
  return self->_requiresSustainedDataDelivery;
}

- (BOOL)_shouldSkipPreferredClientCertificateLookup
{
  return self->_shouldSkipPreferredClientCertificateLookup;
}

- (BOOL)_preventsSystemHTTPProxyAuthentication
{
  return self->_preventsSystemHTTPProxyAuthentication;
}

- (BOOL)_requiresSecureHTTPSProxyConnection
{
  return self->_requiresSecureHTTPSProxyConnection;
}

- (BOOL)_preventsAppSSO
{
  return self->_preventsAppSSO;
}

- (int64_t)_timingDataOptions
{
  return self->_timingDataOptions;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (int)_pidForHAR
{
  return self->_pidForHAR;
}

- (BOOL)_disableAPWakeOnIdleConnections
{
  return self->_disableAPWakeOnIdleConnections;
}

- (NSString)disposition
{
  return self->_disposition;
}

- (BOOL)_isProxySession
{
  return self->_proxySession;
}

- (NSArray)protocolClasses
{
  return (NSArray *)objc_getProperty(self, a2, 224LL, 1);
}

+ (id)_defaultProtocolClasses
{
  v2 = (void *)MEMORY[0x189603F18];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

- (_CFHSTSPolicy)copyHSTSPolicy
{
  result = -[_NSHSTSStorage _policyRef](-[NSURLSessionConfiguration _hstsStorage](self, "_hstsStorage"), "_policyRef");
  if (result) {
    return (_CFHSTSPolicy *)CFRetain(result);
  }
  return result;
}

- (_NSHSTSStorage)_hstsStorage
{
  if (!self->_phskip_hstsStorageSet)
  {
    if (self->_disposition == qword_18C5B2728) {
      id v3 = -[_NSHSTSStorage initInMemoryStore](objc_alloc(&OBJC_CLASS____NSHSTSStorage), "initInMemoryStore");
    }
    else {
      id v3 = +[_NSHSTSStorage sharedPersistentStore](&OBJC_CLASS____NSHSTSStorage, "sharedPersistentStore");
    }
    -[NSURLSessionConfiguration set_hstsStorage:](self, "set_hstsStorage:", v3);
  }

  return -[NSURLSessionConfiguration _phskip_hstsStorage](self, "_phskip_hstsStorage");
}

- (_NSHSTSStorage)_phskip_hstsStorage
{
  return (_NSHSTSStorage *)objc_getProperty(self, a2, 432LL, 1);
}

- (NSSet)_suppressedAutoAddedHTTPHeaders
{
  return (NSSet *)objc_getProperty(self, a2, 504LL, 1);
}

- (NSURLCache)URLCache
{
  if (self->_phskip_urlCacheSet) {
    return -[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache");
  }
  else {
    return +[NSURLCache sharedURLCache](&OBJC_CLASS___NSURLCache, "sharedURLCache");
  }
}

- (NSDictionary)_socketStreamProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 448LL, 1);
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (BOOL)_allowsVirtualInterfaces
{
  return self->_allowsVirtualInterfaces;
}

- (unint64_t)_multipathAlternatePort
{
  return self->_multipathAlternatePort;
}

- (unint64_t)_TCPAdaptiveReadTimeout
{
  return self->_TCPAdaptiveReadTimeout;
}

- (unint64_t)_TCPAdaptiveWriteTimeout
{
  return self->_TCPAdaptiveWriteTimeout;
}

- (BOOL)_allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (NSString)_tcpConnectionPoolName
{
  return (NSString *)objc_getProperty(self, a2, 440LL, 1);
}

- (NSString)_companionAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 464LL, 1);
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (NSData)_sourceApplicationAuditTokenData
{
  return self->_sourceApplicationAuditTokenData;
}

- (NSString)_attributedBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (BOOL)_preventsIdleSleepOnceConnected
{
  return self->_preventsIdleSleepOnceConnected;
}

- (BOOL)_forcesNewConnections
{
  return self->_forcesNewConnections;
}

- (BOOL)shouldUseExtendedBackgroundIdleMode
{
  return self->_shouldUseExtendedBackgroundIdleMode;
}

- (BOOL)_allowsMultipathTCP
{
  return self->_allowsMultipathTCP;
}

- (BOOL)_allowsResponseMonitoringDuringBodyTranmission
{
  return self->_allowsResponseMonitoringDuringBodyTranmission;
}

- (BOOL)waitsForConnectivity
{
  return self->_waitsForConnectivity;
}

- (BOOL)_allowsIndefiniteConnections
{
  return self->_allowsIndefiniteConnections;
}

- (NSString)_CTDataConnectionServiceType
{
  return (NSString *)objc_getProperty(self, a2, 320LL, 1);
}

- (BOOL)_allowsTCPFastOpen
{
  return self->_allowsTCPFastOpen;
}

- (BOOL)_allowsTLSSessionTickets
{
  return self->_allowsTLSSessionTickets;
}

- (BOOL)_allowsTLSSessionResumption
{
  return self->_allowsTLSSessionResumption;
}

- (BOOL)_allowsTLSFalseStart
{
  return self->_allowsTLSFalseStart;
}

- (NSString)_tlsTrustPinningPolicyName
{
  return (NSString *)objc_getProperty(self, a2, 328LL, 1);
}

- (BOOL)_allowsTLSECH
{
  return self->_allowsTLSECH;
}

- (unint64_t)_customReadBufferSize
{
  return self->_customReadBufferSize;
}

- (double)_customReadBufferTimeout
{
  return self->_customReadBufferTimeout;
}

- (int64_t)_expiredDNSBehavior
{
  return self->_expiredDNSBehavior;
}

- (unint64_t)_forcedNetworkServiceType
{
  return self->_forcedNetworkServiceType;
}

- (int)_allowsHTTP3Internal
{
  return self->_allowsHTTP3Internal;
}

- (int)_enablesL4SInternal
{
  return self->_enablesL4SInternal;
}

- (BOOL)requiresDNSSECValidation
{
  return self->_requiresDNSSECValidation;
}

- (BOOL)_prohibitEncryptedDNS
{
  return self->_prohibitEncryptedDNS;
}

- (BOOL)_requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (NSURLCredentialStorage)URLCredentialStorage
{
  if (self->_phskip_credStorageSet) {
    return -[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage");
  }
  else {
    return +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage");
  }
}

- (NSData)_atsContext
{
  return (NSData *)objc_getProperty(self, a2, 304LL, 1);
}

- (_NSHTTPAlternativeServicesStorage)_alternativeServicesStorage
{
  if (self->_phskip_alternativeServicesStorageSet) {
    return -[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage");
  }
  if (self->_disposition == qword_18C5B2728) {
    result = -[_NSHTTPAlternativeServicesStorage initInMemoryStore]( objc_alloc(&OBJC_CLASS____NSHTTPAlternativeServicesStorage),  "initInMemoryStore");
  }
  else {
    result = (_NSHTTPAlternativeServicesStorage *) +[_NSHTTPAlternativeServicesStorage sharedPersistentStore]( &OBJC_CLASS____NSHTTPAlternativeServicesStorage,  "sharedPersistentStore");
  }
  self->_phskip_alternativeServicesStorage = result;
  self->_phskip_alternativeServicesStorageSet = 1;
  return result;
}

- (_NSHTTPAlternativeServicesStorage)_phskip_alternativeServicesStorage
{
  return (_NSHTTPAlternativeServicesStorage *)objc_getProperty(self, a2, 520LL, 1);
}

+ (NSURLSessionConfiguration)defaultSessionConfiguration
{
  if (+[NSURLSessionConfiguration defaultSessionConfiguration]::sOnce != -1) {
    dispatch_once(&+[NSURLSessionConfiguration defaultSessionConfiguration]::sOnce, &__block_literal_global_19627);
  }
  return (NSURLSessionConfiguration *)(id)[(id)+[NSURLSessionConfiguration defaultSessionConfiguration]::sDefaultConfiguration copy];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = -[NSURLSessionConfiguration initWithDisposition:]( objc_alloc(&OBJC_CLASS___NSURLSessionConfiguration),  -[NSURLSessionConfiguration disposition](self, "disposition"));
  objc_msgSend( v4,  "setAllowsCellularAccess:",  -[NSURLSessionConfiguration allowsCellularAccess](self, "allowsCellularAccess"));
  objc_msgSend( v4,  "setAllowsExpensiveNetworkAccess:",  -[NSURLSessionConfiguration allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  objc_msgSend( v4,  "setAllowsConstrainedNetworkAccess:",  -[NSURLSessionConfiguration allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  objc_msgSend(v4, "_setAllowsUCA:", -[NSURLSessionConfiguration _allowsUCA](self, "_allowsUCA"));
  objc_msgSend( v4,  "set_allowsVirtualInterfaces:",  -[NSURLSessionConfiguration _allowsVirtualInterfaces](self, "_allowsVirtualInterfaces"));
  objc_msgSend( v4,  "setWaitsForConnectivity:",  -[NSURLSessionConfiguration waitsForConnectivity](self, "waitsForConnectivity"));
  objc_msgSend(v4, "setDiscretionary:", -[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary"));
  objc_msgSend( v4,  "setSharedContainerIdentifier:",  -[NSURLSessionConfiguration sharedContainerIdentifier](self, "sharedContainerIdentifier"));
  objc_msgSend( v4,  "setSessionSendsLaunchEvents:",  -[NSURLSessionConfiguration sessionSendsLaunchEvents](self, "sessionSendsLaunchEvents"));
  objc_msgSend( v4,  "setHTTPShouldUsePipelining:",  -[NSURLSessionConfiguration HTTPShouldUsePipelining](self, "HTTPShouldUsePipelining"));
  objc_msgSend( v4,  "setHTTPShouldSetCookies:",  -[NSURLSessionConfiguration HTTPShouldSetCookies](self, "HTTPShouldSetCookies"));
  objc_msgSend( v4,  "set_requiresPowerPluggedIn:",  -[NSURLSessionConfiguration _requiresPowerPluggedIn](self, "_requiresPowerPluggedIn"));
  objc_msgSend( v4,  "set_allowsPowerNapScheduling:",  -[NSURLSessionConfiguration _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"));
  objc_msgSend( v4,  "set_allowsHSTSWithUntrustedRootCertificate:",  -[NSURLSessionConfiguration _allowsHSTSWithUntrustedRootCertificate]( self,  "_allowsHSTSWithUntrustedRootCertificate"));
  objc_msgSend( v4,  "set_sessionSendsLaunchOnDemandEvents:",  -[NSURLSessionConfiguration _sessionSendsLaunchOnDemandEvents](self, "_sessionSendsLaunchOnDemandEvents"));
  objc_msgSend( v4,  "set_timingDataOptions:",  -[NSURLSessionConfiguration _timingDataOptions](self, "_timingDataOptions"));
  objc_msgSend( v4,  "set_shouldSkipPreferredClientCertificateLookup:",  -[NSURLSessionConfiguration _shouldSkipPreferredClientCertificateLookup]( self,  "_shouldSkipPreferredClientCertificateLookup"));
  objc_msgSend( v4,  "set_allowsRetryForBackgroundDataTasks:",  -[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"));
  objc_msgSend( v4,  "set_onBehalfOfPairedDevice:",  -[NSURLSessionConfiguration _onBehalfOfPairedDevice](self, "_onBehalfOfPairedDevice"));
  objc_msgSend( v4,  "set_clientIsNotExplicitlyDiscretionary:",  -[NSURLSessionConfiguration _clientIsNotExplicitlyDiscretionary](self, "_clientIsNotExplicitlyDiscretionary"));
  objc_msgSend( v4,  "set_respectsAllowsCellularAccessForDiscretionaryTasks:",  -[NSURLSessionConfiguration _respectsAllowsCellularAccessForDiscretionaryTasks]( self,  "_respectsAllowsCellularAccessForDiscretionaryTasks"));
  objc_msgSend( v4,  "set_infersDiscretionaryFromOriginatingClient:",  -[NSURLSessionConfiguration _infersDiscretionaryFromOriginatingClient]( self,  "_infersDiscretionaryFromOriginatingClient"));
  objc_msgSend( v4,  "setBackgroundSession:",  -[NSURLSessionConfiguration isBackgroundSession](self, "isBackgroundSession"));
  objc_msgSend( v4,  "setSkip_download_unlink:",  -[NSURLSessionConfiguration skip_download_unlink](self, "skip_download_unlink"));
  objc_msgSend( v4,  "set_requiresClientToOpenFiles:",  -[NSURLSessionConfiguration _requiresClientToOpenFiles](self, "_requiresClientToOpenFiles"));
  objc_msgSend( v4,  "set_forcesNewConnections:",  -[NSURLSessionConfiguration _forcesNewConnections](self, "_forcesNewConnections"));
  objc_msgSend( v4,  "set_supportsAVAssetDownloads:",  -[NSURLSessionConfiguration _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"));
  objc_msgSend(v4, "set_proxySession:", -[NSURLSessionConfiguration _isProxySession](self, "_isProxySession"));
  objc_msgSend( v4,  "set_preventsIdleSleep:",  -[NSURLSessionConfiguration _preventsIdleSleep](self, "_preventsIdleSleep"));
  objc_msgSend( v4,  "set_usePipeliningHeuristics:",  -[NSURLSessionConfiguration _usePipeliningHeuristics](self, "_usePipeliningHeuristics"));
  objc_msgSend( v4,  "setTLSMinimumSupportedProtocol:",  -[NSURLSessionConfiguration TLSMinimumSupportedProtocol](self, "TLSMinimumSupportedProtocol"));
  objc_msgSend( v4,  "setTLSMaximumSupportedProtocol:",  -[NSURLSessionConfiguration TLSMaximumSupportedProtocol](self, "TLSMaximumSupportedProtocol"));
  objc_msgSend(v4, "setIdentifier:", -[NSURLSessionConfiguration identifier](self, "identifier"));
  objc_msgSend( v4,  "setRequestCachePolicy:",  -[NSURLSessionConfiguration requestCachePolicy](self, "requestCachePolicy"));
  -[NSURLSessionConfiguration timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  objc_msgSend(v4, "setTimeoutIntervalForRequest:");
  -[NSURLSessionConfiguration timeoutIntervalForResource](self, "timeoutIntervalForResource");
  objc_msgSend(v4, "setTimeoutIntervalForResource:");
  objc_msgSend( v4,  "setNetworkServiceType:",  -[NSURLSessionConfiguration networkServiceType](self, "networkServiceType"));
  objc_msgSend( v4,  "setConnectionProxyDictionary:",  -[NSURLSessionConfiguration connectionProxyDictionary](self, "connectionProxyDictionary"));
  objc_msgSend( v4,  "setHTTPCookieAcceptPolicy:",  -[NSURLSessionConfiguration HTTPCookieAcceptPolicy](self, "HTTPCookieAcceptPolicy"));
  objc_msgSend( v4,  "setHTTPAdditionalHeaders:",  -[NSURLSessionConfiguration HTTPAdditionalHeaders](self, "HTTPAdditionalHeaders"));
  objc_msgSend( v4,  "setHTTPMaximumConnectionsPerHost:",  -[NSURLSessionConfiguration HTTPMaximumConnectionsPerHost](self, "HTTPMaximumConnectionsPerHost"));
  objc_msgSend( v4,  "setShouldUseExtendedBackgroundIdleMode:",  -[NSURLSessionConfiguration shouldUseExtendedBackgroundIdleMode](self, "shouldUseExtendedBackgroundIdleMode"));
  objc_msgSend(v4, "setProtocolClasses:", -[NSURLSessionConfiguration protocolClasses](self, "protocolClasses"));
  objc_msgSend( v4,  "set_directoryForDownloadedFiles:",  -[NSURLSessionConfiguration _directoryForDownloadedFiles](self, "_directoryForDownloadedFiles"));
  objc_msgSend( v4,  "set_sourceApplicationBundleIdentifier:",  -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier"));
  objc_msgSend( v4,  "set_sourceApplicationSecondaryIdentifier:",  -[NSURLSessionConfiguration _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier"));
  objc_msgSend( v4,  "set_sourceApplicationAuditTokenData:",  -[NSURLSessionConfiguration _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData"));
  objc_msgSend( v4,  "set_attributedBundleIdentifier:",  -[NSURLSessionConfiguration _attributedBundleIdentifier](self, "_attributedBundleIdentifier"));
  objc_msgSend( v4,  "set_TCPAdaptiveReadTimeout:",  -[NSURLSessionConfiguration _TCPAdaptiveReadTimeout](self, "_TCPAdaptiveReadTimeout"));
  objc_msgSend( v4,  "set_TCPAdaptiveWriteTimeout:",  -[NSURLSessionConfiguration _TCPAdaptiveWriteTimeout](self, "_TCPAdaptiveWriteTimeout"));
  objc_msgSend( v4,  "set_reportsDataStalls:",  -[NSURLSessionConfiguration _reportsDataStalls](self, "_reportsDataStalls"));
  -[NSURLSessionConfiguration _connectionCachePurgeTimeout](self, "_connectionCachePurgeTimeout");
  objc_msgSend(v4, "set_connectionCachePurgeTimeout:");
  -[NSURLSessionConfiguration _connectionCacheCellPurgeTimeout](self, "_connectionCacheCellPurgeTimeout");
  objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:");
  -[NSURLSessionConfiguration _longLivedConnectionCachePurgeTimeout](self, "_longLivedConnectionCachePurgeTimeout");
  objc_msgSend(v4, "set_longLivedConnectionCachePurgeTimeout:");
  -[NSURLSessionConfiguration _longLivedConnectionCacheCellPurgeTimeout]( self,  "_longLivedConnectionCacheCellPurgeTimeout");
  objc_msgSend(v4, "set_longLivedConnectionCacheCellPurgeTimeout:");
  objc_msgSend( v4,  "set_connectionPoolName:",  -[NSURLSessionConfiguration _connectionPoolName](self, "_connectionPoolName"));
  objc_msgSend( v4,  "set_connectionCacheNumPriorityLevels:",  -[NSURLSessionConfiguration _connectionCacheNumPriorityLevels](self, "_connectionCacheNumPriorityLevels"));
  objc_msgSend( v4,  "set_connectionCacheNumFastLanes:",  -[NSURLSessionConfiguration _connectionCacheNumFastLanes](self, "_connectionCacheNumFastLanes"));
  objc_msgSend( v4,  "set_connectionCacheMinimumFastLanePriority:",  -[NSURLSessionConfiguration _connectionCacheMinimumFastLanePriority]( self,  "_connectionCacheMinimumFastLanePriority"));
  objc_msgSend( v4,  "set_tcpConnectionPoolName:",  -[NSURLSessionConfiguration _tcpConnectionPoolName](self, "_tcpConnectionPoolName"));
  objc_msgSend( v4,  "set_socketStreamProperties:",  -[NSURLSessionConfiguration _socketStreamProperties](self, "_socketStreamProperties"));
  objc_msgSend( v4,  "set_preventsIdleSleepOnceConnected:",  -[NSURLSessionConfiguration _preventsIdleSleepOnceConnected](self, "_preventsIdleSleepOnceConnected"));
  objc_msgSend( v4,  "set_overridesBackgroundSessionAutoRedirect:",  -[NSURLSessionConfiguration _overridesBackgroundSessionAutoRedirect]( self,  "_overridesBackgroundSessionAutoRedirect"));
  objc_msgSend( v4,  "set_performsEVCertCheck:",  -[NSURLSessionConfiguration _performsEVCertCheck](self, "_performsEVCertCheck"));
  objc_msgSend(v4, "set_appleIDContext:", -[NSURLSessionConfiguration _appleIDContext](self, "_appleIDContext"));
  objc_msgSend( v4,  "set_authenticatorStatusCodes:",  -[NSURLSessionConfiguration _authenticatorStatusCodes](self, "_authenticatorStatusCodes"));
  objc_msgSend(v4, "set_atsContext:", -[NSURLSessionConfiguration _atsContext](self, "_atsContext"));
  objc_msgSend(v4, "set_prefersInfraWiFi:", -[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi"));
  objc_msgSend( v4,  "set_shouldPreserveBackgroundSessionDisposition:",  -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition]( self,  "_shouldPreserveBackgroundSessionDisposition"));
  objc_msgSend( v4,  "set_disablesOutOfProcessDirectWiFiUsage:",  -[NSURLSessionConfiguration _disablesOutOfProcessDirectWiFiUsage](self, "_disablesOutOfProcessDirectWiFiUsage"));
  objc_msgSend( v4,  "set_disablesUseOfProxySession:",  -[NSURLSessionConfiguration _disablesUseOfProxySession](self, "_disablesUseOfProxySession"));
  objc_msgSend( v4,  "set_CTDataConnectionServiceType:",  -[NSURLSessionConfiguration _CTDataConnectionServiceType](self, "_CTDataConnectionServiceType"));
  objc_msgSend( v4,  "set_preventsDirectWiFiAccess:",  -[NSURLSessionConfiguration _preventsDirectWiFiAccess](self, "_preventsDirectWiFiAccess"));
  objc_msgSend( v4,  "set_allowTCPIOConnectionStreamTask:",  -[NSURLSessionConfiguration _allowTCPIOConnectionStreamTask](self, "_allowTCPIOConnectionStreamTask"));
  objc_msgSend( v4,  "set_customReadBufferSize:",  -[NSURLSessionConfiguration _customReadBufferSize](self, "_customReadBufferSize"));
  -[NSURLSessionConfiguration _customReadBufferTimeout](self, "_customReadBufferTimeout");
  objc_msgSend(v4, "set_customReadBufferTimeout:");
  objc_msgSend( v4,  "set_preventsSystemHTTPProxyAuthentication:",  -[NSURLSessionConfiguration _preventsSystemHTTPProxyAuthentication](self, "_preventsSystemHTTPProxyAuthentication"));
  objc_msgSend( v4,  "set_requiresSecureHTTPSProxyConnection:",  -[NSURLSessionConfiguration _requiresSecureHTTPSProxyConnection](self, "_requiresSecureHTTPSProxyConnection"));
  objc_msgSend( v4,  "set_proxyConfigurations:",  -[NSURLSessionConfiguration _proxyConfigurations](self, "_proxyConfigurations"));
  objc_msgSend(v4, "set_preventsAppSSO:", -[NSURLSessionConfiguration _preventsAppSSO](self, "_preventsAppSSO"));
  objc_msgSend( v4,  "set_loggingPrivacyLevel:",  -[NSURLSessionConfiguration _loggingPrivacyLevel](self, "_loggingPrivacyLevel"));
  objc_msgSend( v4,  "set_duetPreauthorized:",  -[NSURLSessionConfiguration _duetPreauthorized](self, "_duetPreauthorized"));
  objc_msgSend( v4,  "set_duetPreClearedMode:",  -[NSURLSessionConfiguration _duetPreClearedMode](self, "_duetPreClearedMode"));
  objc_msgSend( v4,  "set_xpcActivityBudgeted:",  -[NSURLSessionConfiguration _xpcActivityBudgeted](self, "_xpcActivityBudgeted"));
  objc_msgSend( v4,  "set_requiresSustainedDataDelivery:",  -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self, "_requiresSustainedDataDelivery"));
  objc_msgSend( v4,  "set_IDSMessageTimeout:",  -[NSURLSessionConfiguration _IDSMessageTimeout](self, "_IDSMessageTimeout"));
  objc_msgSend( v4,  "set_ignoreDidReceiveResponseDisposition:",  -[NSURLSessionConfiguration _ignoreDidReceiveResponseDisposition](self, "_ignoreDidReceiveResponseDisposition"));
  objc_msgSend( v4,  "set_alwaysPerformDefaultTrustEvaluation:",  -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](self, "_alwaysPerformDefaultTrustEvaluation"));
  objc_msgSend( v4,  "set_allowsMultipathTCP:",  -[NSURLSessionConfiguration _allowsMultipathTCP](self, "_allowsMultipathTCP"));
  objc_msgSend( v4,  "set_allowsResponseMonitoringDuringBodyTranmission:",  -[NSURLSessionConfiguration _allowsResponseMonitoringDuringBodyTranmission]( self,  "_allowsResponseMonitoringDuringBodyTranmission"));
  objc_msgSend( v4,  "set_allowsIndefiniteConnections:",  -[NSURLSessionConfiguration _allowsIndefiniteConnections](self, "_allowsIndefiniteConnections"));
  objc_msgSend( v4,  "set_allowsTCPFastOpen:",  -[NSURLSessionConfiguration _allowsTCPFastOpen](self, "_allowsTCPFastOpen"));
  objc_msgSend( v4,  "set_allowsTLSSessionTickets:",  -[NSURLSessionConfiguration _allowsTLSSessionTickets](self, "_allowsTLSSessionTickets"));
  objc_msgSend( v4,  "set_allowsTLSSessionResumption:",  -[NSURLSessionConfiguration _allowsTLSSessionResumption](self, "_allowsTLSSessionResumption"));
  objc_msgSend( v4,  "set_allowsTLSFalseStart:",  -[NSURLSessionConfiguration _allowsTLSFalseStart](self, "_allowsTLSFalseStart"));
  objc_msgSend( v4,  "set_tlsTrustPinningPolicyName:",  -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](self, "_tlsTrustPinningPolicyName"));
  objc_msgSend( v4,  "set_allowsTLSFallback:",  -[NSURLSessionConfiguration _allowsTLSFallback](self, "_allowsTLSFallback"));
  objc_msgSend(v4, "set_allowsTLSECH:", -[NSURLSessionConfiguration _allowsTLSECH](self, "_allowsTLSECH"));
  objc_msgSend( v4,  "set_companionAppBundleIdentifier:",  -[NSURLSessionConfiguration _companionAppBundleIdentifier](self, "_companionAppBundleIdentifier"));
  objc_msgSend( v4,  "set_watchAppBundleIdentifier:",  -[NSURLSessionConfiguration _watchAppBundleIdentifier](self, "_watchAppBundleIdentifier"));
  objc_msgSend( v4,  "set_watchExtensionBundleIdentifier:",  -[NSURLSessionConfiguration _watchExtensionBundleIdentifier](self, "_watchExtensionBundleIdentifier"));
  objc_msgSend( v4,  "set_forcedNetworkServiceType:",  -[NSURLSessionConfiguration _forcedNetworkServiceType](self, "_forcedNetworkServiceType"));
  objc_msgSend( v4,  "set_overriddenDelegateOptions:",  -[NSURLSessionConfiguration _overriddenDelegateOptions](self, "_overriddenDelegateOptions"));
  objc_msgSend( v4,  "set_suppressedAutoAddedHTTPHeaders:",  -[NSURLSessionConfiguration _suppressedAutoAddedHTTPHeaders](self, "_suppressedAutoAddedHTTPHeaders"));
  objc_msgSend( v4,  "set_expiredDNSBehavior:",  -[NSURLSessionConfiguration _expiredDNSBehavior](self, "_expiredDNSBehavior"));
  objc_msgSend( v4,  "setRequiresDNSSECValidation:",  -[NSURLSessionConfiguration requiresDNSSECValidation](self, "requiresDNSSECValidation"));
  objc_msgSend( v4,  "set_maximumWatchCellularTransferSize:",  -[NSURLSessionConfiguration _maximumWatchCellularTransferSize](self, "_maximumWatchCellularTransferSize"));
  objc_msgSend( v4,  "set_multipathAlternatePort:",  -[NSURLSessionConfiguration _multipathAlternatePort](self, "_multipathAlternatePort"));
  if (self->_phskip_credStorageSet) {
    objc_msgSend( v4,  "setURLCredentialStorage:",  -[NSURLSessionConfiguration _phskip_credStorage](self, "_phskip_credStorage"));
  }
  if (self->_phskip_urlCacheSet) {
    objc_msgSend(v4, "setURLCache:", -[NSURLSessionConfiguration _phskip_urlCache](self, "_phskip_urlCache"));
  }
  if (self->_phskip_cookieStorageSet) {
    objc_msgSend( v4,  "setHTTPCookieStorage:",  -[NSURLSessionConfiguration _phskip_cookieStorage](self, "_phskip_cookieStorage"));
  }
  if (self->_phskip_hstsStorageSet) {
    objc_msgSend(v4, "set_hstsStorage:", -[NSURLSessionConfiguration _hstsStorage](self, "_hstsStorage"));
  }
  objc_msgSend( v4,  "set_allowsHTTP3Internal:",  -[NSURLSessionConfiguration _allowsHTTP3Internal](self, "_allowsHTTP3Internal"));
  if (self->_phskip_alternativeServicesStorageSet) {
    objc_msgSend( v4,  "set_alternativeServicesStorage:",  -[NSURLSessionConfiguration _phskip_alternativeServicesStorage](self, "_phskip_alternativeServicesStorage"));
  }
  objc_msgSend(v4, "set_usesNWLoader:", -[NSURLSessionConfiguration _usesNWLoader](self, "_usesNWLoader"));
  objc_msgSend(v4, "set_disablesNWLoader:", -[NSURLSessionConfiguration _disablesNWLoader](self, "_disablesNWLoader"));
  objc_msgSend( v4,  "set_downloadFileProtectionType:",  -[NSURLSessionConfiguration _downloadFileProtectionType](self, "_downloadFileProtectionType"));
  objc_msgSend(v4, "set_pidForHAR:", -[NSURLSessionConfiguration _pidForHAR](self, "_pidForHAR"));
  objc_msgSend( v4,  "set_enablesL4SInternal:",  -[NSURLSessionConfiguration _enablesL4SInternal](self, "_enablesL4SInternal"));
  objc_msgSend( v4,  "set_prohibitEncryptedDNS:",  -[NSURLSessionConfiguration _prohibitEncryptedDNS](self, "_prohibitEncryptedDNS"));
  objc_msgSend( v4,  "set_enableOAuthBearerTokenChallenges:",  -[NSURLSessionConfiguration _enableOAuthBearerTokenChallenges](self, "_enableOAuthBearerTokenChallenges"));
  objc_msgSend( v4,  "set_neTrackerTCCResult:",  -[NSURLSessionConfiguration _neTrackerTCCResult](self, "_neTrackerTCCResult"));
  objc_msgSend( v4,  "set_disableAPWakeOnIdleConnections:",  -[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](self, "_disableAPWakeOnIdleConnections"));
  return v4;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = xmmword_182C9D730;
  *(_OWORD *)((char *)self + 24) = xmmword_182C9D740;
  *((void *)self + 5) = 0x7800000078LL;
  return self;
}

- (char)initWithDisposition:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_CLASS___NSURLSessionConfiguration;
  id v3 = (char *)objc_msgSendSuper2(&v14, sel_init);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x186E1578C]();
    if ([a2 isEqualToString:0x18C5B2920])
    {
      uint64_t v5 = &mutableGlobalLimits(void)::gLimits;
    }

    else
    {
      uint64_t v5 = &defaultConnectionCacheLimits(void)::sImmutableLimits;
    }

    uint64_t v6 = *v5;
    uint64_t v7 = *(void *)(v6 + 32);
    __int128 v8 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)(v3 + 8) = *(_OWORD *)v6;
    *(_OWORD *)(v3 + 24) = v8;
    *((void *)v3 + 5) = v7;
    [v3 setDisposition:a2];
    v3[94] = 0;
    *((void *)v3 + 19) = 0LL;
    *((void *)v3 + 20) = 0LL;
    *(_OWORD *)(v3 + 168) = xmmword_182C9D830;
    *((void *)v3 + 23) = 0LL;
    v3[48] = 1;
    *((void *)v3 + 48) = 0LL;
    v3[52] = 0;
    *(void *)(v3 + 116) = 4LL;
    *((void *)v3 + 25) = 0LL;
    *((void *)v3 + 26) = 2LL;
    *((void *)v3 + 27) = 0LL;
    *(_DWORD *)(v3 + 54) = 0x10000;
    *(_DWORD *)(v3 + 95) = 0;
    *(_OWORD *)(v3 + 408) = 0u;
    *(_OWORD *)(v3 + 424) = 0u;
    *((void *)v3 + 28) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultProtocolClasses"), "copy");
    *(_WORD *)(v3 + 49) = 257;
    v3[93] = 0;
    v3[51] = 1;
    *((void *)v3 + 41) = 0LL;
    *(_DWORD *)(v3 + 79) = 65537;
    if (*((void *)v3 + 50) == 0x18C5B2728LL)
    {
      *((_DWORD *)v3 + 31) = 3;
    }

    else
    {
      CFNumberType v9 = (void *)nw_context_copy_implicit_context();
      *((_DWORD *)v3 + 31) = nw_context_get_privacy_level();
      if (v9) {
        nw_release(v9);
      }
    }

    v3[60] = 1;
    if (__CFNGetHTTP3Override::onceToken != -1) {
      dispatch_once(&__CFNGetHTTP3Override::onceToken, &__block_literal_global_45);
    }
    if (__CFNGetHTTP3Override::value) {
      int v10 = 1;
    }
    else {
      int v10 = 2;
    }
    else {
      int v11 = v10;
    }
    *((_DWORD *)v3 + 33) = v11;
    v3[110] = 0;
    SSLProtocol v12 = (StrictSecurityPolicy *)[(id)*MEMORY[0x189607518] copy];
    *((void *)v3 + 66) = v12;
    *((_DWORD *)v3 + 35) = 0;
    *((_WORD *)v3 + 56) = 0;
    v3[99] = 0;
    *((void *)v3 + 38) = StrictSecurityPolicy::CopyATSState(v12);
    *((void *)v3 + 47) = 50LL;
    *((_DWORD *)v3 + 34) = getpid();
    objc_autoreleasePoolPop(v4);
  }

  return v3;
}

- (void)setDisposition:(id)a3
{
  self->_disposition = (NSString *)a3;
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  self->_allowsCellularAccess = allowsCellularAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess
{
  self->_allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess
{
  self->_allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess;
}

- (void)set_allowsVirtualInterfaces:(BOOL)a3
{
  self->_allowsVirtualInterfaces = a3;
}

- (void)setWaitsForConnectivity:(BOOL)waitsForConnectivity
{
  self->_waitsForConnectivity = waitsForConnectivity;
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)discretionary
{
  self->_discretionary = discretionary;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setSharedContainerIdentifier:(NSString *)sharedContainerIdentifier
{
}

- (BOOL)sessionSendsLaunchEvents
{
  return self->_sessionSendsLaunchEvents;
}

- (void)setSessionSendsLaunchEvents:(BOOL)sessionSendsLaunchEvents
{
  self->_sessionSendsLaunchEvents = sessionSendsLaunchEvents;
}

- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining
{
  self->_HTTPShouldUsePipelining = HTTPShouldUsePipelining;
}

- (BOOL)HTTPShouldSetCookies
{
  return self->_HTTPShouldSetCookies;
}

- (void)setHTTPShouldSetCookies:(BOOL)HTTPShouldSetCookies
{
  self->_HTTPShouldSetCookies = HTTPShouldSetCookies;
}

- (void)set_requiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (void)set_allowsPowerNapScheduling:(BOOL)a3
{
  self->_allowsPowerNapScheduling = a3;
}

- (BOOL)_allowsHSTSWithUntrustedRootCertificate
{
  return self->_allowsHSTSWithUntrustedRootCertificate;
}

- (void)set_allowsHSTSWithUntrustedRootCertificate:(BOOL)a3
{
  self->_allowsHSTSWithUntrustedRootCertificate = a3;
}

- (BOOL)_sessionSendsLaunchOnDemandEvents
{
  return self->_sessionSendsLaunchOnDemandEvents;
}

- (void)set_sessionSendsLaunchOnDemandEvents:(BOOL)a3
{
  self->_sessionSendsLaunchOnDemandEvents = a3;
}

- (void)set_timingDataOptions:(int64_t)a3
{
  self->_timingDataOptions = a3;
}

- (void)set_shouldSkipPreferredClientCertificateLookup:(BOOL)a3
{
  self->_shouldSkipPreferredClientCertificateLookup = a3;
}

- (BOOL)_allowsRetryForBackgroundDataTasks
{
  return self->_allowsRetryForBackgroundDataTasks;
}

- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3
{
  self->_allowsRetryForBackgroundDataTasks = a3;
}

- (BOOL)_onBehalfOfPairedDevice
{
  return self->_onBehalfOfPairedDevice;
}

- (void)set_onBehalfOfPairedDevice:(BOOL)a3
{
  self->_onBehalfOfPairedDevice = a3;
}

- (BOOL)_clientIsNotExplicitlyDiscretionary
{
  return self->_clientIsNotExplicitlyDiscretionary;
}

- (void)set_clientIsNotExplicitlyDiscretionary:(BOOL)a3
{
  self->_clientIsNotExplicitlyDiscretionary = a3;
}

- (BOOL)_respectsAllowsCellularAccessForDiscretionaryTasks
{
  return self->_respectsAllowsCellularAccessForDiscretionaryTasks;
}

- (void)set_respectsAllowsCellularAccessForDiscretionaryTasks:(BOOL)a3
{
  self->_respectsAllowsCellularAccessForDiscretionaryTasks = a3;
}

- (BOOL)_infersDiscretionaryFromOriginatingClient
{
  return self->_infersDiscretionaryFromOriginatingClient;
}

- (void)set_infersDiscretionaryFromOriginatingClient:(BOOL)a3
{
  self->_infersDiscretionaryFromOriginatingClient = a3;
}

- (BOOL)isBackgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(BOOL)a3
{
  self->_backgroundSession = a3;
}

- (BOOL)skip_download_unlink
{
  return self->_skip_download_unlink;
}

- (void)setSkip_download_unlink:(BOOL)a3
{
  self->_skip_download_unlink = a3;
}

- (BOOL)_requiresClientToOpenFiles
{
  return self->_requiresClientToOpenFiles;
}

- (void)set_requiresClientToOpenFiles:(BOOL)a3
{
  self->_requiresClientToOpenFiles = a3;
}

- (void)set_forcesNewConnections:(BOOL)a3
{
  self->_forcesNewConnections = a3;
}

- (BOOL)_supportsAVAssetDownloads
{
  return self->_supportsAVAssetDownloads;
}

- (void)set_supportsAVAssetDownloads:(BOOL)a3
{
  self->_supportsAVAssetDownloads = a3;
}

- (void)set_proxySession:(BOOL)a3
{
  self->_proxySession = a3;
}

- (void)set_preventsIdleSleep:(BOOL)a3
{
  self->_preventsIdleSleep = a3;
}

- (void)set_usePipeliningHeuristics:(BOOL)a3
{
  self->_usePipeliningHeuristics = a3;
}

- (void)setTLSMinimumSupportedProtocol:(SSLProtocol)TLSMinimumSupportedProtocol
{
  self->_TLSMinimumSupportedProtocol = TLSMinimumSupportedProtocol;
}

- (void)setTLSMaximumSupportedProtocol:(SSLProtocol)TLSMaximumSupportedProtocol
{
  self->_TLSMaximumSupportedProtocol = TLSMaximumSupportedProtocol;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void)setRequestCachePolicy:(NSURLRequestCachePolicy)requestCachePolicy
{
  self->_requestCachePolicy = requestCachePolicy;
}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  self->_timeoutIntervalForRequest = timeoutIntervalForRequest;
}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  self->_timeoutIntervalForResource = timeoutIntervalForResource;
}

- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType
{
  self->_networkServiceType = networkServiceType;
}

- (void)setConnectionProxyDictionary:(NSDictionary *)connectionProxyDictionary
{
}

- (void)setHTTPCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)HTTPCookieAcceptPolicy
{
  self->_HTTPCookieAcceptPolicy = HTTPCookieAcceptPolicy;
}

- (void)setHTTPAdditionalHeaders:(NSDictionary *)HTTPAdditionalHeaders
{
}

- (NSInteger)HTTPMaximumConnectionsPerHost
{
  return self->_limits.fHTTPLoadWidth;
}

- (void)setHTTPMaximumConnectionsPerHost:(NSInteger)HTTPMaximumConnectionsPerHost
{
  self->_limits.fHTTPLoadWidth = HTTPMaximumConnectionsPerHost;
}

- (void)setShouldUseExtendedBackgroundIdleMode:(BOOL)shouldUseExtendedBackgroundIdleMode
{
  self->_shouldUseExtendedBackgroundIdleMode = shouldUseExtendedBackgroundIdleMode;
}

- (void)setProtocolClasses:(NSArray *)protocolClasses
{
}

- (NSURL)_directoryForDownloadedFiles
{
  return (NSURL *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)set_directoryForDownloadedFiles:(id)a3
{
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
}

- (void)set_sourceApplicationAuditTokenData:(id)a3
{
  if ([a3 length] == 32)
  {
    self->_sourceApplicationAuditTokenData = (NSData *)[a3 copy];
    [a3 bytes];
    if (!self->_sourceApplicationBundleIdentifier)
    {
      gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromAuditToken(v5);
      if (*(void *)(v7 + 3784)) {
        CPCopyBundleIdentifierAndTeamFromAuditToken_delayInitStub(*v6);
      }
    }
  }

  else
  {

    self->_sourceApplicationAuditTokenData = 0LL;
  }

- (void)set_attributedBundleIdentifier:(id)a3
{
}

- (void)set_TCPAdaptiveReadTimeout:(unint64_t)a3
{
  self->_TCPAdaptiveReadTimeout = a3;
}

- (void)set_TCPAdaptiveWriteTimeout:(unint64_t)a3
{
  self->_TCPAdaptiveWriteTimeout = a3;
}

- (BOOL)_reportsDataStalls
{
  return self->_reportsDataStalls;
}

- (void)set_reportsDataStalls:(BOOL)a3
{
  self->_reportsDataStalls = a3;
}

- (double)_connectionCachePurgeTimeout
{
  return (double)self->_limits.fHTTPConnectionCachePurgeTimeout;
}

- (void)set_connectionCachePurgeTimeout:(double)a3
{
  self->_limits.fHTTPConnectionCachePurgeTimeout = (int)a3;
}

- (double)_connectionCacheCellPurgeTimeout
{
  return (double)self->_limits.fHTTPConnectionCacheCellPurgeTimeout;
}

- (void)set_connectionCacheCellPurgeTimeout:(double)a3
{
  self->_limits.fHTTPConnectionCacheCellPurgeTimeout = (int)a3;
}

- (double)_longLivedConnectionCachePurgeTimeout
{
  return (double)self->_limits.fLongLivedConnectionCachePurgeTimeout;
}

- (void)set_longLivedConnectionCachePurgeTimeout:(double)a3
{
  self->_limits.fLongLivedConnectionCachePurgeTimeout = (int)a3;
}

- (double)_longLivedConnectionCacheCellPurgeTimeout
{
  return (double)self->_limits.fLongLivedConnectionCacheCellPurgeTimeout;
}

- (void)set_longLivedConnectionCacheCellPurgeTimeout:(double)a3
{
  self->_limits.fLongLivedConnectionCacheCellPurgeTimeout = (int)a3;
}

- (NSString)_connectionPoolName
{
  return (NSString *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)set_connectionPoolName:(id)a3
{
}

- (int64_t)_connectionCacheNumPriorityLevels
{
  return self->_limits.fHTTPPriorityNumLevels;
}

- (void)set_connectionCacheNumPriorityLevels:(int64_t)a3
{
}

- (int64_t)_connectionCacheNumFastLanes
{
  return self->_limits.fHTTPNumFastLanes;
}

- (void)set_connectionCacheNumFastLanes:(int64_t)a3
{
}

- (int64_t)_connectionCacheMinimumFastLanePriority
{
  return self->_limits.fHTTPMinimumFastLanePriority;
}

- (void)set_connectionCacheMinimumFastLanePriority:(int64_t)a3
{
  self->_limits.fHTTPMinimumFastLanePriority = a3;
}

- (void)set_tcpConnectionPoolName:(id)a3
{
}

- (void)set_socketStreamProperties:(id)a3
{
}

- (void)set_preventsIdleSleepOnceConnected:(BOOL)a3
{
  self->_preventsIdleSleepOnceConnected = a3;
}

- (BOOL)_overridesBackgroundSessionAutoRedirect
{
  return self->_overridesBackgroundSessionAutoRedirect;
}

- (void)set_overridesBackgroundSessionAutoRedirect:(BOOL)a3
{
  self->_overridesBackgroundSessionAutoRedirect = a3;
}

- (BOOL)_performsEVCertCheck
{
  return self->_performsEVCertCheck;
}

- (void)set_performsEVCertCheck:(BOOL)a3
{
  self->_performsEVCertCheck = a3;
}

- (void)set_appleIDContext:(id)a3
{
}

- (void)set_authenticatorStatusCodes:(id)a3
{
}

- (void)set_atsContext:(id)a3
{
}

- (BOOL)_prefersInfraWiFi
{
  return self->_prefersInfraWiFi;
}

- (void)set_prefersInfraWiFi:(BOOL)a3
{
  self->_prefersInfraWiFi = a3;
}

- (BOOL)_shouldPreserveBackgroundSessionDisposition
{
  return self->_shouldPreserveBackgroundSessionDisposition;
}

- (void)set_shouldPreserveBackgroundSessionDisposition:(BOOL)a3
{
  self->_shouldPreserveBackgroundSessionDisposition = a3;
}

- (BOOL)_disablesOutOfProcessDirectWiFiUsage
{
  return self->_disablesOutOfProcessDirectWiFiUsage;
}

- (void)set_disablesOutOfProcessDirectWiFiUsage:(BOOL)a3
{
  self->_disablesOutOfProcessDirectWiFiUsage = a3;
}

- (BOOL)_disablesUseOfProxySession
{
  return self->_disablesUseOfProxySession;
}

- (void)set_disablesUseOfProxySession:(BOOL)a3
{
  self->_disablesUseOfProxySession = a3;
}

- (void)set_CTDataConnectionServiceType:(id)a3
{
}

- (BOOL)_preventsDirectWiFiAccess
{
  return self->_preventsDirectWiFiAccess;
}

- (void)set_preventsDirectWiFiAccess:(BOOL)a3
{
  self->_preventsDirectWiFiAccess = a3;
}

- (BOOL)_allowTCPIOConnectionStreamTask
{
  return self->_allowTCPIOConnectionStreamTask;
}

- (void)set_allowTCPIOConnectionStreamTask:(BOOL)a3
{
  self->_allowTCPIOConnectionStreamTask = a3;
}

- (void)set_customReadBufferSize:(unint64_t)a3
{
  self->_customReadBufferSize = a3;
}

- (void)set_customReadBufferTimeout:(double)a3
{
  self->_customReadBufferTimeout = a3;
}

- (void)set_preventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self->_preventsSystemHTTPProxyAuthentication = a3;
}

- (void)set_requiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self->_requiresSecureHTTPSProxyConnection = a3;
}

- (NSArray)_proxyConfigurations
{
  return (NSArray *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)set_proxyConfigurations:(id)a3
{
}

- (void)set_preventsAppSSO:(BOOL)a3
{
  self->_preventsAppSSO = a3;
}

- (int)_loggingPrivacyLevel
{
  return self->_loggingPrivacyLevel;
}

- (void)set_loggingPrivacyLevel:(int)a3
{
  self->_loggingPrivacyLevel = a3;
}

- (BOOL)_duetPreauthorized
{
  return self->_duetPreauthorized;
}

- (void)set_duetPreauthorized:(BOOL)a3
{
  self->_duetPreauthorized = a3;
}

- (int64_t)_duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (void)set_duetPreClearedMode:(int64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (int)_xpcActivityBudgeted
{
  return self->_xpcActivityBudgeted;
}

- (void)set_xpcActivityBudgeted:(int)a3
{
  self->_xpcActivityBudgeted = a3;
}

- (void)set_requiresSustainedDataDelivery:(BOOL)a3
{
  self->_requiresSustainedDataDelivery = a3;
}

- (int64_t)_IDSMessageTimeout
{
  return self->_IDSMessageTimeout;
}

- (void)set_IDSMessageTimeout:(int64_t)a3
{
  self->_IDSMessageTimeout = a3;
}

- (BOOL)_ignoreDidReceiveResponseDisposition
{
  return self->_ignoreDidReceiveResponseDisposition;
}

- (void)set_ignoreDidReceiveResponseDisposition:(BOOL)a3
{
  self->_ignoreDidReceiveResponseDisposition = a3;
}

- (BOOL)_alwaysPerformDefaultTrustEvaluation
{
  return self->_alwaysPerformDefaultTrustEvaluation;
}

- (void)set_alwaysPerformDefaultTrustEvaluation:(BOOL)a3
{
  self->_alwaysPerformDefaultTrustEvaluation = a3;
}

- (void)set_allowsMultipathTCP:(BOOL)a3
{
  self->_allowsMultipathTCP = a3;
}

- (void)set_allowsResponseMonitoringDuringBodyTranmission:(BOOL)a3
{
  self->_allowsResponseMonitoringDuringBodyTranmission = a3;
}

- (void)set_allowsIndefiniteConnections:(BOOL)a3
{
  self->_allowsIndefiniteConnections = a3;
}

- (void)set_allowsTCPFastOpen:(BOOL)a3
{
  self->_allowsTCPFastOpen = a3;
}

- (void)set_allowsTLSSessionTickets:(BOOL)a3
{
  self->_allowsTLSSessionTickets = a3;
}

- (void)set_allowsTLSSessionResumption:(BOOL)a3
{
  self->_allowsTLSSessionResumption = a3;
}

- (void)set_allowsTLSFalseStart:(BOOL)a3
{
  self->_allowsTLSFalseStart = a3;
}

- (void)set_tlsTrustPinningPolicyName:(id)a3
{
}

- (BOOL)_allowsTLSFallback
{
  return self->_allowsTLSFallback;
}

- (void)set_allowsTLSFallback:(BOOL)a3
{
  self->_allowsTLSFallback = a3;
}

- (void)set_allowsTLSECH:(BOOL)a3
{
  self->_allowsTLSECH = a3;
}

- (void)set_companionAppBundleIdentifier:(id)a3
{
}

- (NSString)_watchAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 472LL, 1);
}

- (void)set_watchAppBundleIdentifier:(id)a3
{
}

- (NSString)_watchExtensionBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 480LL, 1);
}

- (void)set_watchExtensionBundleIdentifier:(id)a3
{
}

- (void)set_forcedNetworkServiceType:(unint64_t)a3
{
  self->_forcedNetworkServiceType = a3;
}

- (NSDictionary)_overriddenDelegateOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 496LL, 1);
}

- (void)set_overriddenDelegateOptions:(id)a3
{
}

- (void)set_suppressedAutoAddedHTTPHeaders:(id)a3
{
}

- (void)set_expiredDNSBehavior:(int64_t)a3
{
  self->_expiredDNSBehavior = a3;
}

- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation
{
  self->_requiresDNSSECValidation = requiresDNSSECValidation;
}

- (NSNumber)_maximumWatchCellularTransferSize
{
  return (NSNumber *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)set_maximumWatchCellularTransferSize:(id)a3
{
}

- (void)set_multipathAlternatePort:(unint64_t)a3
{
  self->_multipathAlternatePort = a3;
}

- (void)set_allowsHTTP3Internal:(int)a3
{
  self->_allowsHTTP3Internal = a3;
}

- (BOOL)_usesNWLoader
{
  return self->_usesNWLoader;
}

- (void)set_usesNWLoader:(BOOL)a3
{
  self->_usesNWLoader = a3;
}

- (BOOL)_disablesNWLoader
{
  return self->_disablesNWLoader;
}

- (void)set_disablesNWLoader:(BOOL)a3
{
  self->_disablesNWLoader = a3;
}

- (NSString)_downloadFileProtectionType
{
  return (NSString *)objc_getProperty(self, a2, 528LL, 1);
}

- (void)set_downloadFileProtectionType:(id)a3
{
}

- (void)set_pidForHAR:(int)a3
{
  self->_pidForHAR = a3;
}

- (void)set_enablesL4SInternal:(int)a3
{
  self->_enablesL4SInternal = a3;
}

- (BOOL)_inPrivateBrowsing
{
  return -[NSString isEqualToString:]( -[NSURLSessionConfiguration disposition](self, "disposition"),  "isEqualToString:",  0x18C5B2728LL);
}

- (void)set_prohibitEncryptedDNS:(BOOL)a3
{
  self->_prohibitEncryptedDNS = a3;
}

- (BOOL)_enableOAuthBearerTokenChallenges
{
  return self->_enableOAuthBearerTokenChallenges;
}

- (void)set_enableOAuthBearerTokenChallenges:(BOOL)a3
{
  self->_enableOAuthBearerTokenChallenges = a3;
}

- (int)_neTrackerTCCResult
{
  return self->_neTrackerTCCResult;
}

- (void)set_neTrackerTCCResult:(int)a3
{
  self->_neTrackerTCCResult = a3;
}

- (void)set_disableAPWakeOnIdleConnections:(BOOL)a3
{
  self->_disableAPWakeOnIdleConnections = a3;
}

- (void)setURLCache:(NSURLCache *)URLCache
{
  self->_phskip_urlCacheSet = 1;
}

- (void)set_phskip_urlCache:(id)a3
{
}

- (BOOL)proxiesRequireNWLoader
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  proxyConfigurations = self->_proxyConfigurations;
  uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( proxyConfigurations,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(proxyConfigurations);
        }
        if ((nw_proxy_config_stack_requires_http_protocols() & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( proxyConfigurations,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return v3;
}

- (id)copyImmutableVariant:(id)a3
{
  uint64_t v4 = (void *)-[NSURLSessionConfiguration copy](self, "copy");
  if (a3) {
    (*((void (**)(id, void *))a3 + 2))(a3, v4);
  }
  return v4;
}

- (NSURLCache)_phskip_urlCache
{
  return (NSURLCache *)objc_getProperty(self, a2, 416LL, 1);
}

- (HTTPConnectionCacheLimits)getConnectionCacheLimits
{
  __int128 v3 = *(_OWORD *)&self->fHTTPConnectionCachePurgeTimeout;
  *(_OWORD *)&retstr->fHTTPLoadWidth = *(_OWORD *)&self->fHTTPPipeliningLowWatermark;
  *(_OWORD *)&retstr->fHTTPNumFastLanes = v3;
  *(void *)&retstr->fLongLivedConnectionCachePurgeTimeout = *(void *)&self[1].fHTTPLoadWidth;
  return self;
}

- (void)set_hstsStorage:(id)a3
{
  if (self->_disposition != qword_18C5B2728) {
    goto LABEL_7;
  }
  uint64_t v5 = [a3 _policyRef];
  uint64_t v6 = v5 + 16;
  if (!v5) {
    uint64_t v6 = 0LL;
  }
  if (*(_BYTE *)(*(void *)(v6 + 16) + 73LL))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Ephemeral sessions must use ephemeral HSTS storage." userInfo:0]);
    -[NSURLSessionConfiguration set_phskip_hstsStorage:](v7, v8, v9);
  }

  else
  {
LABEL_7:
    -[NSURLSessionConfiguration set_phskip_hstsStorage:](self, "set_phskip_hstsStorage:", a3);
    self->_phskip_hstsStorageSet = 1;
  }

- (void)set_phskip_hstsStorage:(id)a3
{
}

- (void)set_alternativeServicesStorage:(id)a3
{
  self->_phskip_alternativeServicesStorageSet = 1;
}

- (void)set_phskip_alternativeServicesStorage:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLSessionConfiguration;
  -[NSURLSessionConfiguration dealloc](&v3, sel_dealloc);
}

@end