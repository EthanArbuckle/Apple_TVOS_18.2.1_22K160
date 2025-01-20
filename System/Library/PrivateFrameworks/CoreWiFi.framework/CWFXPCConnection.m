@interface CWFXPCConnection
+ (int)locationAuthorizationStatusForWiFiNetworking;
- (BOOL)__allowAlreadyPendingRequest:(id)a3;
- (BOOL)__allowXPCRequestWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)__hasPendingRequestWithType:(int64_t)a3;
- (BOOL)__isUserPrivacySensitiveRequestType:(int64_t)a3;
- (BOOL)__shouldCoalesceEventTypeWhileSuspended:(int64_t)a3;
- (BOOL)__shouldDropEventTypeWhileSuspended:(int64_t)a3;
- (BOOL)isCodesignedByApple;
- (BOOL)isLocal;
- (BOOL)isVisible;
- (CWFXPCConnection)init;
- (CWFXPCConnection)initWithServiceType:(int64_t)a3 XPCConnection:(id)a4 bootArgs:(id)a5;
- (CWFXPCConnectionDelegate)delegate;
- (CWFXPCProxyConnection)localXPCProxyConnection;
- (CWFXPCProxyConnection)remoteXPCProxyConnection;
- (NSArray)bootArgs;
- (NSString)bundleID;
- (NSString)codesignID;
- (NSString)processName;
- (NSUUID)UUID;
- (NSXPCConnection)XPCConnection;
- (id)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 parentRequestUUID:(id)a6 isParentRequest:(BOOL)a7 reply:(id)a8;
- (id)__bundleIDFromAuditToken:(id *)a3;
- (id)__codesignIDFromAuditToken:(id *)a3;
- (id)__filterScanResultsForPrivacy:(id)a3;
- (id)__locationBundleIDOverride;
- (id)__matchedScanResultsWithKnownNetworkProfiles:(id)a3 scanResults:(id)a4;
- (id)__passpointScanResults:(id)a3;
- (id)__privacyFilteredScanResult:(id)a3 allowSSID:(BOOL)a4 allowBSSID:(BOOL)a5 allowCountryCode:(BOOL)a6;
- (id)__shouldPerformPreAssociation6GHzFollowupScan:(id)a3;
- (id)description;
- (id)invalidationHandler;
- (id)processState;
- (id)registeredActivities;
- (id)registeredEventIDs;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)locationAuthorizationStatus;
- (int64_t)serviceType;
- (unint64_t)__defaultTimeoutForRequestType:(int64_t)a3;
- (void)__addXPCGetRequestWithType:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)__coalesceAndCacheEvent:(id)a3;
- (void)__didInvalidate;
- (void)__matchKnownNetworksWithScanResults:(id)a3 parentXPCRequest:(id)a4;
- (void)__perform6GHzFollowupScanAndAssociateWithParameters:(id)a3 BSS:(id)a4 parentXPCRequest:(id)a5;
- (void)__performANQPWithParameters:(id)a3 parentXPCRequest:(id)a4;
- (void)__performFollowupANQPForPasspointScanResults:(id)a3 combinedScanResults:(id)a4 parameters:(id)a5 parentXPCRequest:(id)a6;
- (void)__performScanWithParameters:(id)a3 parentXPCRequest:(id)a4;
- (void)__updateXPCTransactionCount;
- (void)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)addKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)associateWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)beginActivity:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)cancelRequestsWithUUID:(id)a3 reply:(id)a4;
- (void)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)disassociateWithReason:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)endActivityWithUUID:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)endAllActivitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)performANQPWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performAutoJoinWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performNearbyDeviceDiscovery:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)performScanWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performSensingWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryAWDLAFTxModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLAvailabilityWindowAPAlignmentWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLBTLEStateParamsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionMetricWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionParametersWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionRSSIThresholdsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLEncryptionTypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLExtensionStateMachineParamsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLGuardTimeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLMasterChannelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLOpModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPeerDatabaseWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPeerTrafficRegistrationWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPreferredChannelsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPresenceModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSecondaryMasterChannelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSidecarDiagnosticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSocialTimeSlotsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLStatisticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLStrategyWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncChannelSequenceWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncParametersWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryActivitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAuthTypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoHotspotModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinDenyListWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinMetricWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBSSIDForVendorWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBSSIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBackgroundScanCacheWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBackgroundScanConfigurationWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBeaconCacheWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBlockedBandsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexConfigWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexProfiles2GHzWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexProfiles5GHzWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCCAWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryChainAckWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryChannelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCountryBandSupport:(id)a3 reply:(id)a4;
- (void)queryCountryCodeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCurrentKnownNetworkProfileWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCurrentScanResultWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPLeaseExpirationTimeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPLeaseStartTimeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPServerIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPv6ServerIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDTIMIntervalWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDesenseLevelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDesenseWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDeviceUUIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XClientStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XControlModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XControlStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XSupplicantStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEventIDsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4InterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6InterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGuardIntervalWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryHardwareMACAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryHardwareSupportedChannelsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryHostAPStationListWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIO80211ControllerInfoWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIO80211InterfaceInfoWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4ARPResolvedHardwareAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4ARPResolvedIPAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4SubnetMasksWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv6NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv6RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryInterfaceCapabilitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryInterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIsNetworkServiceEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIsQuickProbeRequiredForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryJoinStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryKnownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryKnownNetworkProfileMatchingNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryKnownNetworkProfileMatchingScanResult:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryKnownNetworkProfilesWithProperties:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryLQMConfigurationWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLQMSummaryWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLeakyAPStatsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLinkDownStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLinkQualityMetricWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMACAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMCSIndexWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMaxLinkSpeedWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMaxNSSForAPWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNetworkReachabilityWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNoiseWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNumberOfSpatialStreamsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryOpModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPHYModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryParentInterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPasswordForKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryPowerDebugInfoWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPowerStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPowerWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPowersaveWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPrivateMACAddressForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryPrivateMACAddressModeForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryPrivateMACAddressModeSystemSettingWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRSSIWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRangingCapabilitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRoamStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRxRateWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySSIDForVendorWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySSIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySecurityWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySupportedChannelsWithCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)querySupportedPHYModesWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySystemActivitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySystemEventIDsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryThermalIndexWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxChainPowerWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxNSSWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxPowerWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxRateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryUserAutoJoinStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryUserSettingsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryVirtualInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryVirtualInterfaceRoleWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWAPISubtypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWEPSubtypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWiFiAssistOverrideReasonsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWiFiUIStateFlagsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWoWEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)resetAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)resume;
- (void)sendXPCEvent:(id)a3 reply:(id)a4;
- (void)setAutoHotspotMode:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setBackgroundScanConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setBlockedBands:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setChannel:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setCompanionCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLQMConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setPassword:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setPower:(BOOL)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setPrivateMACAddressModeSystemSetting:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setProcessState:(id)a3;
- (void)setRangeable:(BOOL)a3 peerList:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setRangingIdentifier:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setRemoteXPCProxyConnection:(id)a3;
- (void)setThermalIndex:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setUserAutoJoinState:(BOOL)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setUserSettings:(id)a3 properties:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)startHostAPModeWithConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)startMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)stopAWDLPeerAssistedDiscoveryWithRequestParams:(id)a3 reply:(id)a4;
- (void)stopHostAPModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)stopMonitoringAllEventsWithRequestParams:(id)a3 reply:(id)a4;
- (void)stopMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)suspend;
- (void)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 requestParams:(id)a7 reply:(id)a8;
- (void)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 requestParams:(id)a6 reply:(id)a7;
- (void)updateSoftAPBand:(unsigned int)a3 requestParams:(id)a4 reply:(id)a5;
@end

@implementation CWFXPCConnection

- (BOOL)isCodesignedByApple
{
  v2 = self;
  objc_sync_enter(v2);
  int codesignedByApple = v2->_codesignedByApple;
  if (!v2->_codesignedByApple)
  {
    objc_msgSend_XPCConnection(v2, v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    if (v8) {
      objc_msgSend_auditToken(v8, v9, v10, v11, v12);
    }
    v2->_int codesignedByApple = 1;

    int codesignedByApple = v2->_codesignedByApple;
  }

  BOOL v14 = codesignedByApple == 2;
  objc_sync_exit(v2);

  return v14;
}

- (id)__codesignIDFromAuditToken:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v24 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v24[16] = v3;
  sub_186454118();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    goto LABEL_14;
  }
  SecStaticCodeRef staticCode = 0LL;
  v8 = (const __CFURL *)objc_msgSend_fileURLWithPath_(MEMORY[0x189604030], v4, (uint64_t)v7, v5, v6);
  OSStatus v9 = SecStaticCodeCreateWithPath(v8, 0, &staticCode);
  if (staticCode)
  {
    CFDictionaryRef information = 0LL;
    OSStatus v13 = SecCodeCopySigningInformation(staticCode, 2u, &information);
    if (information)
    {
      objc_msgSend_objectForKey_(information, v10, *MEMORY[0x18960BBB8], v11, v12);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(information);
    }

    else
    {
      BOOL v14 = (void *)SecCopyErrorMessageString(v13, 0LL);
      CWFGetOSLog();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        CWFGetOSLog();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v18 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v20 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 138543874;
        *(void *)&v24[4] = v7;
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = v13;
        *(_WORD *)&v24[18] = 2114;
        *(void *)&v24[20] = v14;
        _os_log_send_and_compose_impl();
      }

      if (v14)
      {
        CFRelease(v14);
        BOOL v14 = 0LL;
      }
    }

    CFRelease(staticCode);
    goto LABEL_21;
  }

  BOOL v14 = (void *)SecCopyErrorMessageString(v9, 0LL);
  CWFGetOSLog();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    CWFGetOSLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v16 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v19 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v24 = 138543874;
    *(void *)&v24[4] = v7;
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = v9;
    *(_WORD *)&v24[18] = 2114;
    *(void *)&v24[20] = v14;
    _os_log_send_and_compose_impl();
  }

  if (v14)
  {
    CFRelease(v14);
LABEL_14:
    BOOL v14 = 0LL;
  }

- (id)__bundleIDFromAuditToken:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v28 = 0LL;
  if (!qword_18C4A42B0)
  {
    __int128 v35 = xmmword_189E5C628;
    *(void *)&__int128 v36 = 0LL;
    qword_18C4A42B0 = _sl_dlopen();
  }

  if (!qword_18C4A42B0) {
    goto LABEL_8;
  }
  __int128 v6 = *(_OWORD *)&a3->var0[4];
  __int128 v33 = *(_OWORD *)a3->var0;
  __int128 v34 = v6;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  v7 = (void (*)(__int128 *, void, id *))off_18C4A42B8;
  v32 = off_18C4A42B8;
  if (!off_18C4A42B8)
  {
    *(void *)&__int128 v35 = MEMORY[0x1895F87A8];
    *((void *)&v35 + 1) = 3221225472LL;
    *(void *)&__int128 v36 = sub_18648CB38;
    *((void *)&v36 + 1) = &unk_189E5B480;
    v37 = &v29;
    sub_18648CB38(&v35, a2, (uint64_t)a3, v3, v4);
    v7 = (void (*)(__int128 *, void, id *))v30[3];
  }

  _Block_object_dispose(&v29, 8);
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v8, v9, v10, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_( NSString,  v22,  (uint64_t)"Boolean soft_CPCopyBundleIdentifierAndTeamFromAuditToken(audit_token_t, CFStringRef *, CFStringRef *)",  v23,  v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_( v21,  v27,  (uint64_t)v25,  (uint64_t)@"CWFXPCConnection.m",  42,  @"%s",  v26);

    __break(1u);
  }

  __int128 v35 = v33;
  __int128 v36 = v34;
  v7(&v35, 0LL, &v28);
  id v12 = v28;
  if (!v28)
  {
LABEL_8:
    __int128 v13 = *(_OWORD *)&a3->var0[4];
    __int128 v35 = *(_OWORD *)a3->var0;
    __int128 v36 = v13;
    sub_186454118();
    BOOL v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], v14, kCFURLPOSIXPathStyle, 0),
          (v16 = v15) != 0LL))
    {
      v17 = CFBundleCopyInfoDictionaryForURL(v15);
      v18 = v17;
      if (v17)
      {
        Value = (void *)CFDictionaryGetValue(v17, (const void *)*MEMORY[0x189604E00]);
        id v28 = Value;
        if (Value)
        {
          CFRetain(Value);
          id v12 = v28;
        }

        else
        {
          id v12 = 0LL;
        }

        CFRelease(v18);
      }

      else
      {
        id v12 = 0LL;
      }

      CFRelease(v16);
    }

    else
    {
      id v12 = 0LL;
    }
  }

  return v12;
}

- (CWFXPCConnection)initWithServiceType:(int64_t)a3 XPCConnection:(id)a4 bootArgs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v148.receiver = self;
  v148.super_class = (Class)&OBJC_CLASS___CWFXPCConnection;
  uint64_t v11 = -[CWFXPCConnection init](&v148, sel_init);
  v16 = v11;
  v11->_serviceType = a3;
  if (v9)
  {
    p_XPCConnection = (void **)&v11->_XPCConnection;
    objc_storeStrong((id *)&v11->_XPCConnection, a4);
    objc_initWeak(&location, v16);
    uint64_t v18 = MEMORY[0x1895F87A8];
    v145[0] = MEMORY[0x1895F87A8];
    v145[1] = 3221225472LL;
    v145[2] = sub_18647B798;
    v145[3] = &unk_189E5C248;
    objc_copyWeak(&v146, &location);
    objc_msgSend_setInterruptionHandler_(v16->_XPCConnection, v19, (uint64_t)v145, v20, v21);
    v143[0] = v18;
    v143[1] = 3221225472LL;
    v143[2] = sub_18647B938;
    v143[3] = &unk_189E5C248;
    objc_copyWeak(&v144, &location);
    objc_msgSend_setInvalidationHandler_(*p_XPCConnection, v22, (uint64_t)v143, v23, v24);
    objc_destroyWeak(&v144);
    objc_destroyWeak(&v146);
    objc_destroyWeak(&location);
    if (*p_XPCConnection) {
      objc_msgSend_auditToken(*p_XPCConnection, v25, v26, v27, v28);
    }
    else {
      memset(&v142[2], 0, 32);
    }
    sub_186454118();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = objc_msgSend_lastPathComponent(v40, v41, v42, v43, v44);
    processName = v16->_processName;
    v16->_processName = (NSString *)v45;

    if (!v16->_processName) {
      goto LABEL_31;
    }
    if (*p_XPCConnection) {
      objc_msgSend_auditToken(*p_XPCConnection, v47, v48, v49, v50);
    }
    else {
      memset(v142, 0, 32);
    }
    uint64_t v51 = objc_msgSend___bundleIDFromAuditToken_(v16, v47, (uint64_t)v142, v49, v50);
    bundleID = v16->_bundleID;
    v16->_bundleID = (NSString *)v51;

    XPCConnection = v16->_XPCConnection;
    if (XPCConnection) {
      objc_msgSend_auditToken(XPCConnection, v53, v54, v55, v56);
    }
    else {
      memset(v141, 0, sizeof(v141));
    }
    uint64_t v58 = objc_msgSend___codesignIDFromAuditToken_(v16, v53, (uint64_t)v141, v55, v56);
    codesignID = v16->_codesignID;
    v16->_codesignID = (NSString *)v58;
  }

  else
  {
    objc_msgSend_processInfo(MEMORY[0x1896079D8], v12, v13, v14, v15);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = objc_msgSend_processName(v29, v30, v31, v32, v33);
    __int128 v35 = v16->_processName;
    v16->_processName = (NSString *)v34;

    if (!v16->_processName)
    {
LABEL_31:

      v16 = 0LL;
      goto LABEL_30;
    }
  }

  uint64_t v60 = objc_msgSend_UUID(MEMORY[0x189607AB8], v36, v37, v38, v39);
  UUID = v16->_UUID;
  v16->_UUID = (NSUUID *)v60;

  if (!v16->_UUID) {
    goto LABEL_31;
  }
  uint64_t v66 = objc_msgSend_copy(v10, v62, v63, v64, v65);
  bootArgs = v16->_bootArgs;
  v16->_bootArgs = (NSArray *)v66;

  id v71 = objc_msgSend_stringWithFormat_( NSString,  v68,  (uint64_t)@"com.apple.corewifi.XPC-connection-request.%@",  v69,  v70,  v16->_processName);
  v76 = (const char *)objc_msgSend_UTF8String(v71, v72, v73, v74, v75);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v77 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v78 = dispatch_queue_create(v76, v77);
  requestQueue = v16->_requestQueue;
  v16->_requestQueue = (OS_dispatch_queue *)v78;

  if (!v16->_requestQueue) {
    goto LABEL_31;
  }
  id v83 = objc_msgSend_stringWithFormat_( NSString,  v80,  (uint64_t)@"com.apple.corewifi.XPC-connection-reply.%@",  v81,  v82,  v16->_processName);
  v88 = (const char *)objc_msgSend_UTF8String(v83, v84, v85, v86, v87);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v89 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v90 = dispatch_queue_create(v88, v89);
  replyQueue = v16->_replyQueue;
  v16->_replyQueue = (OS_dispatch_queue *)v90;

  if (!v16->_replyQueue) {
    goto LABEL_31;
  }
  id v95 = objc_msgSend_stringWithFormat_( NSString,  v92,  (uint64_t)@"com.apple.corewifi.XPC-connection-event.%@",  v93,  v94,  v16->_processName);
  v100 = (const char *)objc_msgSend_UTF8String(v95, v96, v97, v98, v99);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v101 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v102 = dispatch_queue_create(v100, v101);
  eventQueue = v16->_eventQueue;
  v16->_eventQueue = (OS_dispatch_queue *)v102;

  if (!v16->_eventQueue) {
    goto LABEL_31;
  }
  id v107 = objc_msgSend_stringWithFormat_( NSString,  v104,  (uint64_t)@"com.apple.corewifi.XPC-connection-ack.%@",  v105,  v106,  v16->_processName);
  v112 = (const char *)objc_msgSend_UTF8String(v107, v108, v109, v110, v111);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v113 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v114 = dispatch_queue_create(v112, v113);
  ackQueue = v16->_ackQueue;
  v16->_ackQueue = (OS_dispatch_queue *)v114;

  if (!v16->_ackQueue) {
    goto LABEL_31;
  }
  id v119 = objc_msgSend_stringWithFormat_( NSString,  v116,  (uint64_t)@"com.apple.corewifi.XPC-connection-mutex.%@",  v117,  v118,  v16->_processName);
  v124 = (const char *)objc_msgSend_UTF8String(v119, v120, v121, v122, v123);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v125 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v126 = dispatch_queue_create(v124, v125);
  mutexQueue = v16->_mutexQueue;
  v16->_mutexQueue = (OS_dispatch_queue *)v126;

  if (!v16->_mutexQueue) {
    goto LABEL_31;
  }
  v128 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  mutableEventIDs = v16->_mutableEventIDs;
  v16->_mutableEventIDs = v128;

  if (!v16->_mutableEventIDs) {
    goto LABEL_31;
  }
  v130 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  mutablePendingEventAcknowledgements = v16->_mutablePendingEventAcknowledgements;
  v16->_mutablePendingEventAcknowledgements = v130;

  if (!v16->_mutablePendingEventAcknowledgements) {
    goto LABEL_31;
  }
  v132 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutablePendingRequestMap = v16->_mutablePendingRequestMap;
  v16->_mutablePendingRequestMap = v132;

  if (!v16->_mutablePendingRequestMap) {
    goto LABEL_31;
  }
  v134 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  mutableActivities = v16->_mutableActivities;
  v16->_mutableActivities = v134;

  if (!v16->_mutableActivities) {
    goto LABEL_31;
  }
  v136 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  coalescedEvents = v16->_coalescedEvents;
  v16->_coalescedEvents = v136;

  if (!v16->_coalescedEvents) {
    goto LABEL_31;
  }
  v138 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  entitlementsCache = v16->_entitlementsCache;
  v16->_entitlementsCache = v138;

  if (!v16->_entitlementsCache) {
    goto LABEL_31;
  }
  v16->_defaultTimeoutOverride = -1LL;
LABEL_30:

  return v16;
}

- (CWFXPCConnection)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (CWFXPCConnection *)-[CWFXPCConnection valueForEntitlement:](v3, v4, v5);
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_18647BC80;
  uint64_t v23 = sub_18647BC90;
  id v24 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18647BC98;
  block[3] = &unk_189E5C270;
  uint64_t v18 = &v19;
  block[4] = self;
  id v6 = v4;
  id v17 = v6;
  dispatch_sync(mutexQueue, block);
  v7 = (void *)v20[5];
  objc_msgSend_null(MEMORY[0x189603FE8], v8, v9, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v12) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = (void *)v20[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (void)resume
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  if (self->_XPCConnection)
  {
    sub_186451960(self->_serviceType, a2, v2, v3, v4);
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v64, (uint64_t)v70, 16);
    if (v7)
    {
      uint64_t v12 = v7;
      uint64_t v54 = *(void *)v65;
      uint64_t v13 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v65 != v54) {
            objc_enumerationMutation(obj);
          }
          int64_t serviceType = self->_serviceType;
          v16 = (const char *)objc_msgSend_integerValue(*(void **)(*((void *)&v64 + 1) + 8 * i), v8, v9, v10, v11);
          sub_18644FAA4(serviceType, v16, 0LL, v17, v18);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = v19;
          if (v19)
          {
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v60 = 0u;
            __int128 v61 = 0u;
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v60, (uint64_t)v69, 16);
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v61;
              do
              {
                for (uint64_t j = 0LL; j != v23; ++j)
                {
                  if (*(void *)v61 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
                  block[0] = v13;
                  block[1] = 3221225472LL;
                  block[2] = sub_18647C030;
                  block[3] = &unk_189E5BF78;
                  block[4] = self;
                  void block[5] = v26;
                  dispatch_sync(mutexQueue, block);
                }

                uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_( v21,  v28,  (uint64_t)&v60,  (uint64_t)v69,  16);
              }

              while (v23);
            }
          }
        }

        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v64, (uint64_t)v70, 16);
      }

      while (v12);
    }

    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    uint64_t v29 = self->_bootArgs;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v55, (uint64_t)v68, 16);
    if (v31)
    {
      uint64_t v35 = v31;
      uint64_t v36 = *(void *)v56;
      while (2)
      {
        for (uint64_t k = 0LL; k != v35; ++k)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v29);
          }
          uint64_t v38 = *(void **)(*((void *)&v55 + 1) + 8 * k);
          if (objc_msgSend_hasPrefix_(v38, v32, (uint64_t)@"corewifi_timeout_override=", v33, v34))
          {
            uint64_t v40 = objc_msgSend_length(@"corewifi_timeout_override=", v32, v39, v33, v34);
            objc_msgSend_substringFromIndex_(v38, v41, v40, v42, v43);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
            self->_defaultTimeoutOverride = objc_msgSend_integerValue(v44, v45, v46, v47, v48);

            goto LABEL_27;
          }
        }

        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v55, (uint64_t)v68, 16);
        if (v35) {
          continue;
        }
        break;
      }
    }

- (void)suspend
{
}

- (void)__didInvalidate
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  objc_msgSend_registeredEventIDs(self, a2, v2, v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v90, (uint64_t)v99, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v91;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v91 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
        uint64_t v18 = objc_msgSend_type(v12, v14, v15, v16, v17);
        uint64_t v19 = sub_186451BD4(v18);
        objc_msgSend_setType_(v13, v20, v19, v21, v22);
        v97[0] = @"EventID";
        v97[1] = @"Remove";
        v98[0] = v12;
        v98[1] = MEMORY[0x189604A88];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v23, (uint64_t)v98, (uint64_t)v97, 2);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInfo_(v13, v25, (uint64_t)v24, v26, v27);

        v89[0] = MEMORY[0x1895F87A8];
        v89[1] = 3221225472LL;
        v89[2] = sub_18647C474;
        v89[3] = &unk_189E5C298;
        v89[4] = self;
        v89[5] = v12;
        objc_msgSend_setResponse_(v13, v28, (uint64_t)v89, v29, v30);
        objc_msgSend_delegate(self, v31, v32, v33, v34);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_XPCConnection_receivedXPCRequest_(v35, v36, (uint64_t)self, (uint64_t)v13, v37);
      }

      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v38, (uint64_t)&v90, (uint64_t)v99, 16);
    }

    while (v9);

    objc_msgSend_delegate(self, v39, v40, v41, v42);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_XPCConnection_updatedRegisteredEventIDs_(v6, v43, (uint64_t)self, 0, v44);
  }

  __int128 v88 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v85 = 0u;
  objc_msgSend_registeredActivities(self, v45, v46, v47, v48);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v85, (uint64_t)v96, 16);
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v86;
    do
    {
      for (uint64_t j = 0LL; j != v51; ++j)
      {
        if (*(void *)v86 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void **)(*((void *)&v85 + 1) + 8 * j);
        __int128 v55 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
        uint64_t v60 = objc_msgSend_type(v54, v56, v57, v58, v59);
        uint64_t v61 = sub_186451B70(v60);
        objc_msgSend_setType_(v55, v62, v61, v63, v64);
        v94[0] = @"EventID";
        v94[1] = @"Remove";
        v95[0] = v54;
        v95[1] = MEMORY[0x189604A88];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v65, (uint64_t)v95, (uint64_t)v94, 2);
        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInfo_(v55, v67, (uint64_t)v66, v68, v69);

        v84[0] = MEMORY[0x1895F87A8];
        v84[1] = 3221225472LL;
        v84[2] = sub_18647C504;
        v84[3] = &unk_189E5C298;
        v84[4] = self;
        v84[5] = v54;
        objc_msgSend_setResponse_(v55, v70, (uint64_t)v84, v71, v72);
        objc_msgSend_delegate(self, v73, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_XPCConnection_receivedXPCRequest_(v77, v78, (uint64_t)self, (uint64_t)v55, v79);
      }

      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v80, (uint64_t)&v85, (uint64_t)v96, 16);
    }

    while (v51);
  }

  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18647C594;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (void)invalidate
{
  XPCConnection = self->_XPCConnection;
  if (XPCConnection)
  {
    objc_msgSend_invalidate(XPCConnection, a2, v2, v3, v4);
  }

  else
  {
    objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v7, v8, v9, v10, v11);

    objc_msgSend_invalidationHandler(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_invalidationHandler(self, v17, v18, v19, v20);
      uint64_t v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v21[2]();
    }

    objc_msgSend_setInvalidationHandler_(self, v17, 0, v19, v20);
  }

- (void)__coalesceAndCacheEvent:(id)a3
{
  id v52 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
  uint64_t v9 = objc_msgSend_type(v52, v5, v6, v7, v8);
  objc_msgSend_setType_(v4, v10, v9, v11, v12);
  objc_msgSend_interfaceName(v52, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterfaceName_(v4, v18, (uint64_t)v17, v19, v20);

  switch(objc_msgSend_type(v52, v21, v22, v23, v24))
  {
    case 10LL:
      uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
      objc_msgSend_setType_(v27, v28, 11, v29, v30);
      goto LABEL_7;
    case 11LL:
      uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
      objc_msgSend_setType_(v27, v35, 10, v36, v37);
      goto LABEL_7;
    case 15LL:
      uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
      objc_msgSend_setType_(v27, v38, 16, v39, v40);
      goto LABEL_7;
    case 16LL:
      uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
      objc_msgSend_setType_(v27, v41, 15, v42, v43);
LABEL_7:
      objc_msgSend_interfaceName(v4, v31, v32, v33, v34);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInterfaceName_(v27, v45, (uint64_t)v44, v46, v47);

      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v48, 0, (uint64_t)v27, v49);
      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v50, (uint64_t)v52, (uint64_t)v4, v51);

      break;
    default:
      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v25, (uint64_t)v52, (uint64_t)v4, v26);
      break;
  }
}

- (BOOL)__shouldCoalesceEventTypeWhileSuspended:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x25;
}

- (BOOL)__shouldDropEventTypeWhileSuspended:(int64_t)a3
{
  return 0;
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_interfaceName(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
  uint64_t v18 = objc_msgSend_type(v6, v14, v15, v16, v17);
  objc_msgSend_setType_(v13, v19, v18, v20, v21);
  if (v12)
  {
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
    uint64_t v27 = objc_msgSend_type(v6, v23, v24, v25, v26);
    objc_msgSend_setType_(v22, v28, v27, v29, v30);
    objc_msgSend_setInterfaceName_(v22, v31, (uint64_t)v12, v32, v33);
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18647CA98;
  block[3] = &unk_189E5C310;
  uint64_t v40 = v22;
  uint64_t v41 = self;
  uint64_t v42 = v13;
  id v43 = v6;
  id v44 = v7;
  id v35 = v7;
  id v36 = v6;
  uint64_t v37 = v13;
  uint64_t v38 = v22;
  dispatch_async(mutexQueue, block);
}

- (id)registeredEventIDs
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_18647BC80;
  uint64_t v10 = sub_18647BC90;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_18647DC48;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)registeredActivities
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_18647BC80;
  uint64_t v10 = sub_18647BC90;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_18647DD44;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)processState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_18647BC80;
  uint64_t v10 = sub_18647BC90;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_18647DE40;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setProcessState:(id)a3
{
  id v4 = a3;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_18647DF04;
  v7[3] = &unk_189E5BF78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mutexQueue, v7);
}

- (BOOL)isVisible
{
  id v5 = (uint64_t *)MEMORY[0x18960F3C0];
  if (MEMORY[0x18960F3C0])
  {
    objc_msgSend_processState(self, a2, v2, v3, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_taskState(v6, v7, v8, v9, v10) == 4)
    {
      objc_msgSend_endowmentNamespaces(v6, v11, v12, v13, v14);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend_containsObject_(v15, v16, *v5, v17, v18);
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return (char)v5;
}

+ (int)locationAuthorizationStatusForWiFiNetworking
{
  uint64_t v4 = objc_msgSend_bundleWithPath_( MEMORY[0x1896077F8],  a2,  (uint64_t)@"/System/Library/PrivateFrameworks/MobileWiFi.framework",  v2,  v3);
  uint64_t v9 = (void *)v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (!qword_18C4A42C0)
  {
    uint64_t v4 = _sl_dlopen();
    qword_18C4A42C0 = v4;
  }

  if (qword_18C4A42C0)
  {
    id v10 = sub_18647E4AC(v4, v5, v6, v7, v8);
    int v14 = objc_msgSend_authorizationStatusForBundle_(v10, v11, (uint64_t)v9, v12, v13);
  }

  else
  {
LABEL_6:
    int v14 = 0;
  }

  return v14;
}

- (id)__locationBundleIDOverride
{
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleID(self, v7, v8, v9, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v11, v12, (uint64_t)@"com.apple.milod", v13, v14))
  {

LABEL_4:
    uint64_t v6 = @"/System/Library/LocationBundles/Milod.bundle";
    return v6;
  }

  objc_msgSend_processName(self, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  int isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)@"milod", v21, v22);

  if (isEqual) {
    goto LABEL_4;
  }
  return v6;
}

- (int)locationAuthorizationStatus
{
  if (!qword_18C4A42C0) {
    qword_18C4A42C0 = _sl_dlopen();
  }
  if (!qword_18C4A42C0) {
    return 0;
  }
  uint64_t v6 = objc_msgSend___locationBundleIDOverride(self, a2, v2, v3, v4);
  id v11 = (void *)v6;
  if (v6)
  {
    id v12 = sub_18647E4AC(v6, v7, v8, v9, v10);
    int v16 = objc_msgSend_authorizationStatusForBundleIdentifier_(v12, v13, (uint64_t)v11, v14, v15);
  }

  else
  {
    CWFGetOSLog();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      CWFGetOSLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v18 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v19 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_processIdentifier(self->_XPCConnection, v20, v21, v22, v23);
      sub_18644F860(self->_serviceType);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }

    int v16 = 0;
  }

  return v16;
}

- (id)__privacyFilteredScanResult:(id)a3 allowSSID:(BOOL)a4 allowBSSID:(BOOL)a5 allowCountryCode:(BOOL)a6
{
  id v9 = a3;
  objc_msgSend_properties(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_189E88760, v16, v17) & 1) == 0
    && (objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_189E88778, v19, v20) & 1) == 0
    && (objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_189E88790, v19, v20) & 1) == 0
    && !objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_189E887A8, v19, v20))
  {
    id v42 = v9;
    goto LABEL_22;
  }

  if (!objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_189E887A8, v19, v20))
  {
    uint64_t v30 = (void *)objc_msgSend_mutableCopy(v14, v21, v22, v23, v24);
    objc_msgSend_filteredScanResultWithProperties_(v9, v52, (uint64_t)v30, v53, v54);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }

  objc_msgSend_scanRecord(v9, v21, v22, v23, v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = (void *)objc_msgSend_mutableCopy(v25, v26, v27, v28, v29);

  if (a4)
  {
    if (a5) {
      goto LABEL_8;
    }
LABEL_24:
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, (uint64_t)@"BSSID", v32);
    if (a6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, (uint64_t)@"SSID", v32);
  objc_msgSend_setObject_forKeyedSubscript_(v30, v56, 0, (uint64_t)@"SSID_STR", v57);
  if (!a5) {
    goto LABEL_24;
  }
LABEL_8:
  if (!a6)
  {
LABEL_9:
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, (uint64_t)@"80211D_IE", v32);
    objc_msgSend_setObject_forKeyedSubscript_(v30, v33, 0, (uint64_t)@"IE", v34);
  }

- (void)__updateXPCTransactionCount
{
  XPCTransaction = self->_XPCTransaction;
  if (objc_msgSend_count(self->_mutablePendingRequestMap, a2, v2, v3, v4)
    || objc_msgSend_count(self->_mutableEventIDs, v7, v8, v9, v10)
    || objc_msgSend_count(self->_mutableActivities, v7, v11, v9, v10)
    || objc_msgSend_count(self->_mutablePendingEventAcknowledgements, v7, v12, v9, v10))
  {
    if (XPCTransaction) {
      return;
    }
    id v20 = objc_msgSend_stringWithFormat_( NSString,  v7,  (uint64_t)@"com.apple.corewifi.xpc-transaction.%@",  v9,  v10,  self->_processName);
    objc_msgSend_UTF8String(v20, v13, v14, v15, v16);
    uint64_t v17 = (OS_os_transaction *)os_transaction_create();
    uint64_t v18 = self->_XPCTransaction;
    self->_XPCTransaction = v17;

    uint64_t v19 = (OS_os_transaction *)v20;
LABEL_8:

    return;
  }

  if (XPCTransaction)
  {
    uint64_t v19 = self->_XPCTransaction;
    self->_XPCTransaction = 0LL;
    goto LABEL_8;
  }

- (unint64_t)__defaultTimeoutForRequestType:(int64_t)a3
{
  unint64_t result = 4000000000LL;
  if (a3 > 180)
  {
    if (a3 > 187)
    {
      if ((unint64_t)(a3 - 192) <= 0x32)
      {
        if (a3 == 220 || a3 == 238) {
          return 10000000000LL;
        }
      }

      BOOL v4 = a3 == 188;
      unint64_t v5 = 60000000000LL;
LABEL_17:
      if (v4) {
        return v5;
      }
      return result;
    }

    if (a3 != 181 && a3 != 184 && a3 != 186) {
      return result;
    }
    return 20000000000LL;
  }

  switch(a3)
  {
    case '>':
    case '@':
      unint64_t result = 120000000000LL;
      break;
    case '?':
    case 'B':
    case 'C':
    case 'D':
    case 'O':
      return result;
    case 'A':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
      return 20000000000LL;
    default:
      BOOL v4 = a3 == 6;
      unint64_t v5 = 10000000000LL;
      goto LABEL_17;
  }

  return result;
}

- (void)__addXPCGetRequestWithType:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_18647EC28;
  v11[3] = &unk_189E5C338;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v10, a3, 0, (uint64_t)a4, v11);
}

- (BOOL)__allowXPCRequestWithType:(int64_t)a3 error:(id *)a4
{
  unint64_t v5 = a4;
  uint64_t v235 = *MEMORY[0x1895F89C0];
  __int16 v230 = 0;
  if ((unint64_t)(a3 - 249) <= 0xFFFFFFFFFFFFFF07LL)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], a2, *MEMORY[0x189607688], 22, 0);
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    id v78 = 0LL;
    id v34 = 0LL;
    id v8 = 0LL;
  }

  else
  {
    sub_186451960(self->_serviceType, a2, a3, (uint64_t)a4, v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v9, a3, v10, v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = objc_msgSend_containsObject_(v8, v13, (uint64_t)v12, v14, v15);

    if ((v16 & 1) != 0)
    {
      if (objc_msgSend_containsObject_( self->_bootArgs,  v17,  (uint64_t)@"corewifi_api_enforcement_disable=1",  v18,  v19))
      {
        CWFGetOSLog();
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          CWFGetOSLog();
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v25 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v53 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          int v58 = objc_msgSend_processIdentifier(self->_XPCConnection, v54, v55, v56, v57);
          processName = self->_processName;
          bundleID = self->_bundleID;
          codesignID = self->_codesignID;
          sub_18644F860(self->_serviceType);
          __int128 v62 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1864504C4(a3, v63, v64, v65, v66);
          int v232 = 67110402;
          *(_DWORD *)v233 = v58;
          *(_WORD *)&v233[4] = 2114;
          *(void *)&v233[6] = processName;
          *(_WORD *)&v233[14] = 2114;
          *(void *)&v233[16] = bundleID;
          *(_WORD *)&v233[24] = 2114;
          *(void *)&v233[26] = codesignID;
          *(_WORD *)&v233[34] = 2114;
          *(void *)&v233[36] = v62;
          *(void *)&v233[46] = *(_WORD *)&v233[44] = 2114;
          _os_log_send_and_compose_impl();
        }

- (BOOL)__allowAlreadyPendingRequest:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_type(v3, v4, v5, v6, v7) == 64)
  {
    objc_msgSend_info(v3, v8, v9, v10, v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)@"ScanParams", v14, v15);
    char v16 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v21 = objc_msgSend_acceptableCacheAge(v16, v17, v18, v19, v20) == -1;
  }

  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

- (BOOL)__hasPendingRequestWithType:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  objc_msgSend_allValues(self->_mutablePendingRequestMap, a2, a3, v3, v4, 0);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v6);
        }
        char v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend_type(v16, v9, v10, v11, v12) == a3
          && !objc_msgSend_isSubrequest(v16, v9, v10, v11, v12))
        {
          BOOL v17 = 1;
          goto LABEL_12;
        }
      }

      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 0;
LABEL_12:

  return v17;
}

- (BOOL)__isUserPrivacySensitiveRequestType:(int64_t)a3
{
  return (unint64_t)(a3 - 201) <= 1 && sub_186454094(self->_bootArgs) != 1;
}

- (id)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 parentRequestUUID:(id)a6 isParentRequest:(BOOL)a7 reply:(id)a8
{
  uint64_t v266 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  char v16 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
  objc_msgSend_setType_(v16, v17, a3, v18, v19);
  objc_msgSend_setRequestParameters_(v16, v20, (uint64_t)v13, v21, v22);
  objc_msgSend_setInfo_(v16, v23, (uint64_t)v12, v24, v25);
  objc_msgSend_date(MEMORY[0x189603F50], v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReceivedAt_(v16, v31, (uint64_t)v30, v32, v33);

  objc_msgSend_setIsSubrequest_(v16, v34, v14 != 0, v35, v36);
  objc_msgSend_UUID(v16, v37, v38, v39, v40);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  qos_class_t v215 = qos_class_self();
  CWFGetOSLog();
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    CWFGetOSLog();
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v43 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v44 = MEMORY[0x1895F8DA0];
  }

  v218 = v13;
  v219 = v12;
  v216 = v15;
  v217 = v14;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v49 = @"REQ";
    if (v14) {
      uint64_t v49 = @"SUBREQ";
    }
    uint64_t v210 = v49;
    sub_1864504C4(a3, v45, v46, v47, v48);
    uint64_t v211 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = v41;
    int v55 = objc_msgSend_processIdentifier(self->_XPCConnection, v50, v51, v52, v53);
    processName = self->_processName;
    bundleID = self->_bundleID;
    codesignID = self->_codesignID;
    sub_18644F860(self->_serviceType);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v13, v57, v58, v59, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = v54;
    objc_msgSend_UUIDString(v54, v62, v63, v64, v65);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v66, v67, 5, v68, v69);
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v212 = a3;
    char isUserPrivacySensitiveRequestType = objc_msgSend___isUserPrivacySensitiveRequestType_(self, v71, a3, v72, v73);
    if ((isUserPrivacySensitiveRequestType & 1) != 0)
    {
      BOOL v79 = @"<private>";
    }

    else
    {
      objc_msgSend_description(v219, v74, v75, v76, v77);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v206, v80, v81, v82, v83);
      BOOL v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    int v246 = 138545922;
    v247 = v210;
    __int16 v248 = 2114;
    *(void *)v249 = v211;
    *(_WORD *)&v249[8] = 1024;
    *(_DWORD *)&v249[10] = v55;
    __int16 v250 = 2114;
    v251 = processName;
    __int16 v252 = 2114;
    v253 = bundleID;
    __int16 v254 = 2114;
    v255 = codesignID;
    __int16 v256 = 2114;
    v257 = v56;
    __int16 v258 = 1024;
    qos_class_t v259 = v215;
    __int16 v260 = 2114;
    v261 = v61;
    __int16 v262 = 2114;
    v263 = v70;
    __int16 v264 = 2114;
    v265 = v79;
    LODWORD(v204) = 104;
    uint64_t v202 = &v246;
    _os_log_send_and_compose_impl();
    if ((isUserPrivacySensitiveRequestType & 1) == 0)
    {
    }

    id v13 = v218;
    id v12 = v219;
    id v15 = v216;
    id v14 = v217;
    a3 = v212;
    uint64_t v41 = v213;
  }

  __uint64_t v84 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  id v245 = 0LL;
  int v87 = objc_msgSend___allowXPCRequestWithType_error_(self, v85, a3, (uint64_t)&v245, v86);
  id v88 = v245;
  __int128 v93 = v88;
  if (v87)
  {
    objc_msgSend_requestParameters(v16, v89, v90, v91, v92);
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v99 = objc_msgSend_timeout(v94, v95, v96, v97, v98);

    if (!v99)
    {
      int64_t defaultTimeoutOverride = self->_defaultTimeoutOverride;
      if (defaultTimeoutOverride < 0)
      {
        uint64_t v105 = objc_msgSend_type(v16, v100, v101, v102, v103);
        int64_t defaultTimeoutOverride = objc_msgSend___defaultTimeoutForRequestType_(self, v106, v105, v107, v108);
      }

      objc_msgSend_requestParameters(v16, v100, v101, v102, v103, v202, v204);
      uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimeout_(v109, v110, defaultTimeoutOverride, v111, v112);
    }

    uint64_t v113 = objc_msgSend_queuePriority(v13, v100, v101, v102, v103, v202, v204);
    if (v113) {
      objc_msgSend_setQueuePriority_(v16, v114, v113, v116, v117);
    }
    uint64_t v118 = objc_msgSend_qualityOfService(v13, v114, v115, v116, v117);
    if (v118)
    {
      uint64_t v122 = v118;
      CWFGetOSLog();
      uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue();
      if (v123)
      {
        CWFGetOSLog();
        int v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        int v124 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v133 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_UUIDString(v41, v134, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v138, v139, 5, v140, v141);
        v142 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v147 = objc_msgSend_qualityOfService(v13, v143, v144, v145, v146);
        int v246 = 138543874;
        v247 = v142;
        __int16 v248 = 1024;
        *(_DWORD *)v249 = v215;
        *(_WORD *)&v249[4] = 2048;
        *(void *)&v249[6] = v147;
        LODWORD(v205) = 28;
        uint64_t v203 = &v246;
        _os_log_send_and_compose_impl();
      }
    }

    else if (v215 > 0x14)
    {
      HIDWORD(v149) = v215 - 9;
      LODWORD(v149) = v215 - 9;
      unsigned int v148 = v149 >> 2;
      if (v148 > 6) {
        uint64_t v122 = 0LL;
      }
      else {
        uint64_t v122 = qword_18653E3F0[v148];
      }
    }

    else
    {
      CWFGetOSLog();
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      if (v131)
      {
        CWFGetOSLog();
        id v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v132 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v150 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_UUIDString(v41, v151, v152, v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v155, v156, 5, v157, v158);
        v159 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v246 = 138543362;
        v247 = v159;
        LODWORD(v205) = 12;
        uint64_t v203 = &v246;
        _os_log_send_and_compose_impl();
      }

      uint64_t v122 = -1LL;
    }

    objc_msgSend_setQualityOfService_(v16, v119, v122, v120, v121, v203, v205);
    v160 = (void *)NSString;
    objc_msgSend_UUID(self, v161, v162, v163, v164);
    uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v165, v166, v167, v168, v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v41, v171, v172, v173, v174);
    uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864504C4(a3, v176, v177, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v160, v181, (uint64_t)@"%@/%@/%@", v182, v183, v170, v175, v180);
    uint64_t v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v16, v185, (uint64_t)v184, v186, v187);

    v237[0] = MEMORY[0x1895F87A8];
    v237[1] = 3221225472LL;
    v237[2] = sub_1864803FC;
    v237[3] = &unk_189E5C388;
    v237[4] = self;
    id v238 = v41;
    id v188 = v217;
    int64_t v243 = a3;
    __uint64_t v244 = v84;
    id v13 = v218;
    id v239 = v188;
    id v240 = v218;
    id v15 = v216;
    id v189 = v216;
    id v241 = v93;
    id v242 = v189;
    id v190 = v41;
    id v191 = v218;
    id v192 = v93;
    objc_msgSend_setResponse_(v16, v193, (uint64_t)v237, v194, v195);
    uint64_t v196 = v41;
    mutexQueue = self->_mutexQueue;
    v230[0] = MEMORY[0x1895F87A8];
    v230[1] = 3221225472LL;
    v230[2] = sub_186480E70;
    v230[3] = &unk_189E5C3D8;
    id v231 = v188;
    int v232 = self;
    id v234 = v189;
    int64_t v235 = a3;
    v233 = v16;
    BOOL v236 = a7;
    id v198 = v188;
    id v199 = v189;
    id v14 = v217;
    id v200 = (dispatch_queue_s *)mutexQueue;
    uint64_t v41 = v196;
    dispatch_async(v200, v230);

    id v12 = v219;
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648130C;
    block[3] = &unk_189E5C400;
    id v222 = v88;
    id v223 = v14;
    int64_t v228 = a3;
    __uint64_t v229 = v84;
    __int128 v224 = self;
    id v225 = v13;
    id v226 = v41;
    id v227 = v15;
    id v126 = v41;
    id v127 = v13;
    id v128 = v14;
    id v129 = v93;
    id v130 = v15;
    dispatch_async(replyQueue, block);
  }

  return v16;
}

- (void)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v6 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  a2,  a3,  (uint64_t)a4,  (uint64_t)a5,  0,  0,  a6);
}

- (CWFXPCProxyConnection)localXPCProxyConnection
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___CWFXPCProxyConnection);
  uint64_t v7 = (void *)objc_msgSend_initWithForwardingTarget_(v3, v4, (uint64_t)self, v5, v6);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = sub_18648163C;
  v12[3] = &unk_189E5BC10;
  v12[4] = self;
  objc_msgSend_setInvalidationHandler_(v7, v8, (uint64_t)v12, v9, v10);
  return (CWFXPCProxyConnection *)v7;
}

- (BOOL)isLocal
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (id)remoteObjectProxy
{
  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection) {
    remoteXPCProxyConnection = self->_XPCConnection;
  }
  objc_msgSend_remoteObjectProxy(remoteXPCProxyConnection, a2, v2, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection) {
    remoteXPCProxyConnection = self->_XPCConnection;
  }
  objc_msgSend_remoteObjectProxyWithErrorHandler_(remoteXPCProxyConnection, a2, (uint64_t)a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection) {
    remoteXPCProxyConnection = self->_XPCConnection;
  }
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(remoteXPCProxyConnection, a2, (uint64_t)a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  uint64_t v5 = (void *)NSString;
  processName = self->_processName;
  uint64_t v7 = objc_msgSend_processIdentifier(self->_XPCConnection, a2, v2, v3, v4);
  return (id)objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)@"%@ (pid=%d)", v9, v10, processName, v7);
}

- (void)startMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CWFGetOSLog();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = objc_msgSend_type(v8, v14, v15, v16, v17);
    sub_186451AFC(v18, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v28 = objc_msgSend_processIdentifier(self->_XPCConnection, v24, v25, v26, v27);
    processName = self->_processName;
    bundleID = self->_bundleID;
    id v42 = v8;
    id v31 = v10;
    codesignID = self->_codesignID;
    sub_18644F860(self->_serviceType);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v9, v34, v35, v36, v37);
    int v47 = 138544898;
    uint64_t v48 = v23;
    __int16 v49 = 1024;
    int v50 = v28;
    __int16 v51 = 2114;
    uint64_t v52 = processName;
    __int16 v53 = 2114;
    uint64_t v54 = bundleID;
    __int16 v55 = 2114;
    uint64_t v56 = codesignID;
    id v10 = v31;
    id v8 = v42;
    __int16 v57 = 2114;
    uint64_t v58 = v33;
    __int16 v59 = 2114;
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186481B00;
  block[3] = &unk_189E5C540;
  void block[4] = self;
  id v44 = v8;
  id v45 = v9;
  id v46 = v10;
  id v39 = v10;
  id v40 = v9;
  id v41 = v8;
  dispatch_async(mutexQueue, block);
}

- (void)stopMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CWFGetOSLog();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = objc_msgSend_type(v8, v14, v15, v16, v17);
    sub_186451AFC(v18, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v28 = objc_msgSend_processIdentifier(self->_XPCConnection, v24, v25, v26, v27);
    processName = self->_processName;
    bundleID = self->_bundleID;
    id v42 = v8;
    id v31 = v10;
    codesignID = self->_codesignID;
    sub_18644F860(self->_serviceType);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v9, v34, v35, v36, v37);
    int v47 = 138544898;
    uint64_t v48 = v23;
    __int16 v49 = 1024;
    int v50 = v28;
    __int16 v51 = 2114;
    uint64_t v52 = processName;
    __int16 v53 = 2114;
    uint64_t v54 = bundleID;
    __int16 v55 = 2114;
    uint64_t v56 = codesignID;
    id v10 = v31;
    id v8 = v42;
    __int16 v57 = 2114;
    uint64_t v58 = v33;
    __int16 v59 = 2114;
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648219C;
  block[3] = &unk_189E5C540;
  void block[4] = self;
  id v44 = v8;
  id v45 = v9;
  id v46 = v10;
  id v39 = v10;
  id v40 = v9;
  id v41 = v8;
  dispatch_async(mutexQueue, block);
}

- (void)stopMonitoringAllEventsWithRequestParams:(id)a3 reply:(id)a4
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  CWFGetOSLog();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CWFGetOSLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v10 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = objc_msgSend_processIdentifier(self->_XPCConnection, v11, v12, v13, v14);
    processName = self->_processName;
    bundleID = self->_bundleID;
    codesignID = self->_codesignID;
    sub_18644F860(self->_serviceType);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v6, v20, v21, v22, v23);
    int v30 = 67110402;
    int v31 = v15;
    __int16 v32 = 2114;
    uint64_t v33 = processName;
    __int16 v34 = 2114;
    uint64_t v35 = bundleID;
    __int16 v36 = 2114;
    uint64_t v37 = codesignID;
    __int16 v38 = 2114;
    id v39 = v19;
    __int16 v40 = 2114;
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864827D4;
  block[3] = &unk_189E5C2E8;
  void block[4] = self;
  id v28 = v6;
  id v29 = v7;
  id v25 = v7;
  id v26 = v6;
  dispatch_async(mutexQueue, block);
}

- (void)queryEventIDsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySystemEventIDsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)beginActivity:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_186482C0C;
  v15[3] = &unk_189E5C540;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(mutexQueue, v15);
}

- (void)endActivityWithUUID:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_186483660;
  v15[3] = &unk_189E5C540;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(mutexQueue, v15);
}

- (void)endAllActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186483D28;
  block[3] = &unk_189E5C2E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mutexQueue, block);
}

- (void)queryActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySystemActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)cancelRequestsWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186484114;
  block[3] = &unk_189E5C2E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mutexQueue, block);
}

- (void)queryMACAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryHardwareMACAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBSSIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBSSIDForVendorWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryChannelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryCountryCodeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setCompanionCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"CountryCode";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186484658;
    v20[3] = &unk_189E5C338;
    int v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 23, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648466C;
    block[3] = &unk_189E5C2C0;
    int v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryCurrentKnownNetworkProfileWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryCurrentScanResultWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_1864847D8;
  v10[3] = &unk_189E5C5B8;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, v9, 57, (uint64_t)v6, (uint64_t)v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryDTIMIntervalWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGuardIntervalWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryInterfaceCapabilitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryInterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryMCSIndexWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNumberOfSpatialStreamsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNoiseWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryOpModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPHYModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryParentInterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowerWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRangingCapabilitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRSSIWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySSIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySSIDForVendorWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySecurityWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAuthTypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryWEPSubtypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryWAPISubtypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySupportedChannelsWithCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x189603FC8];
  id v10 = a4;
  id v11 = a3;
  objc_msgSend_dictionary(v9, v12, v13, v14, v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)@"CountryCode", v18);

  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = sub_186484AFC;
  v21[3] = &unk_189E5C338;
  id v22 = v8;
  id v19 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 15, (uint64_t)v16, (uint64_t)v10, v21);
}

- (void)queryHardwareSupportedChannelsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySupportedPHYModesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxPowerWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxRateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowerStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryChainAckWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxChainPowerWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDesenseWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDesenseLevelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexConfigWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexProfiles2GHzWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexProfiles5GHzWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLeakyAPStatsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLQMSummaryWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryVirtualInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryVirtualInterfaceRoleWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionParametersWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionRSSIThresholdsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLMasterChannelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLOpModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPeerDatabaseWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPreferredChannelsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSecondaryMasterChannelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSocialTimeSlotsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLStrategyWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncChannelSequenceWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncParametersWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSidecarDiagnosticsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLExtensionStateMachineParamsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionMetricWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPresenceModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLGuardTimeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLAvailabilityWindowAPAlignmentWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLAFTxModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPeerTrafficRegistrationWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLEncryptionTypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLBTLEStateParamsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (id)__filterScanResultsForPrivacy:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v7 = objc_msgSend___allowXPCRequestWithType_error_(self, v5, 7, 0, v6);
  uint64_t v10 = objc_msgSend___allowXPCRequestWithType_error_(self, v8, 9, 0, v9);
  uint64_t v13 = objc_msgSend___allowXPCRequestWithType_error_(self, v11, 22, 0, v12);
  objc_msgSend_array(MEMORY[0x189603FA8], v14, v15, v16, v17);
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v18 = v4;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * v23);
        id v25 = (void *)MEMORY[0x186E3AE7C]();
        objc_msgSend___privacyFilteredScanResult_allowSSID_allowBSSID_allowCountryCode_(self, v26, v24, v7, v10, v13);
        int v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30) {
          objc_msgSend_addObject_(v38, v27, (uint64_t)v30, v28, v29);
        }

        objc_autoreleasePoolPop(v25);
        ++v23;
      }

      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v31, (uint64_t)&v39, (uint64_t)v43, 16);
    }

    while (v21);
  }

  __int16 v36 = (void *)objc_msgSend_copy(v38, v32, v33, v34, v35);
  return v36;
}

- (id)__matchedScanResultsWithKnownNetworkProfiles:(id)a3 scanResults:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend_array(MEMORY[0x189603FA8], v7, v8, v9, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v12 = v6;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x186E3AE7C](v14);
        sub_1864528AC(v18, v5);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend_scanResultWithMatchingKnownNetworkProfile_(v18, v20, (uint64_t)v23, v21, v22);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v11, v25, (uint64_t)v24, v26, v27);
        }

        else
        {
          objc_msgSend_addObject_(v11, v20, (uint64_t)v18, v21, v22, (void)v35);
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }

      while (v15 != v17);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v28, (uint64_t)&v35, (uint64_t)v39, 16);
      uint64_t v15 = v14;
    }

    while (v14);
  }

  uint64_t v33 = (void *)objc_msgSend_copy(v11, v29, v30, v31, v32);
  return v33;
}

- (void)__matchKnownNetworksWithScanResults:(id)a3 parentXPCRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_requestParameters(v7, v8, v9, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = sub_1864852C0;
  v22[3] = &unk_189E5C4F0;
  objc_copyWeak(&v25, &location);
  id v18 = v6;
  id v23 = v18;
  id v19 = v7;
  id v24 = v19;
  id v21 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v20,  54,  0,  (uint64_t)v12,  v17,  0,  v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)__performFollowupANQPForPasspointScanResults:(id)a3 combinedScanResults:(id)a4 parameters:(id)a5 parentXPCRequest:(id)a6
{
  v66[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___CWFANQPParameters);
  objc_msgSend_ANQPElementIDListForPasspointScanResults(v12, v15, v16, v17, v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setANQPElementIDList_(v14, v20, (uint64_t)v19, v21, v22);

  uint64_t v27 = objc_msgSend_acceptableANQPCacheAgeForPasspointScanResults(v12, v23, v24, v25, v26);
  objc_msgSend_setAcceptableCacheAge_(v14, v28, v27, v29, v30);
  uint64_t v35 = objc_msgSend_maximumANQPAgeForPasspointScanResults(v12, v31, v32, v33, v34);
  objc_msgSend_setMaximumAge_(v14, v36, v35, v37, v38);
  objc_msgSend_setScanResults_(v14, v39, (uint64_t)v10, v40, v41);
  objc_initWeak(&location, self);
  uint64_t v65 = @"ANQPParams";
  v66[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v42, (uint64_t)v66, (uint64_t)&v65, 1);
  id v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v13, v44, v45, v46, v47);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v13, v49, v50, v51, v52);
  __int16 v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1895F87A8];
  v59[1] = 3221225472LL;
  v59[2] = sub_186485668;
  v59[3] = &unk_189E5C5E0;
  objc_copyWeak(&v63, &location);
  id v54 = v11;
  id v60 = v54;
  id v55 = v12;
  id v61 = v55;
  id v56 = v13;
  id v62 = v56;
  id v58 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v57,  65,  (uint64_t)v43,  (uint64_t)v48,  v53,  0,  v59);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);
}

- (id)__passpointScanResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isPasspoint(v14, v6, v7, v8, v9))
        {
          if (!v11)
          {
            objc_msgSend_array(MEMORY[0x189603FA8], v6, v7, v8, v9);
            id v11 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend_addObject_(v11, v6, (uint64_t)v14, v8, v9);
        }
      }

      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
    }

    while (v10);
  }

  else
  {
    id v11 = 0LL;
  }

  uint64_t v15 = (void *)objc_msgSend_copy(v11, v6, v7, v8, v9);

  return v15;
}

- (void)__performScanWithParameters:(id)a3 parentXPCRequest:(id)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v29 = @"ScanParams";
  v30[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v8, (uint64_t)v30, (uint64_t)&v29, 1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v7, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v15, v16, v17, v18);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_186485AEC;
  v24[3] = &unk_189E5C4F0;
  objc_copyWeak(&v27, &location);
  id v20 = v6;
  id v25 = v20;
  id v21 = v7;
  id v26 = v21;
  id v23 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v22,  64,  (uint64_t)v9,  (uint64_t)v14,  v19,  0,  v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)performScanWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v43[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    objc_msgSend_ANQPElementIDListForPasspointScanResults(v8, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
    }

    else if ((objc_msgSend_includeMatchingKnownNetworkProfiles(v8, v17, v18, v19, v20) & 1) == 0)
    {
      uint64_t v40 = @"ScanParams";
      id v41 = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)&v41, (uint64_t)&v40, 1);
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = sub_186486088;
      v33[3] = &unk_189E5C608;
      uint64_t v24 = &v35;
      objc_copyWeak(&v35, &location);
      id v34 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v30, 64, (uint64_t)v26, (uint64_t)v9, v33);
      uint64_t v29 = &v34;
      goto LABEL_7;
    }

    __int128 v42 = @"ScanParams";
    v43[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)v43, (uint64_t)&v42, 1);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = sub_186485FBC;
    v36[3] = &unk_189E5C608;
    uint64_t v24 = &v38;
    objc_copyWeak(&v38, &location);
    id v37 = v11;
    objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v25,  64,  (uint64_t)v23,  (uint64_t)v9,  0,  1,  v36);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend___performScanWithParameters_parentXPCRequest_(self, v27, (uint64_t)v8, (uint64_t)v26, v28);
    uint64_t v29 = &v37;
LABEL_7:

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }

  replyQueue = (dispatch_queue_s *)self->_replyQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186486154;
  block[3] = &unk_189E5C2C0;
  id v32 = v10;
  dispatch_async(replyQueue, block);

LABEL_8:
}

- (void)__performANQPWithParameters:(id)a3 parentXPCRequest:(id)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v29 = @"ANQPParams";
  v30[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v8, (uint64_t)v30, (uint64_t)&v29, 1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v7, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_186486384;
  v24[3] = &unk_189E5C4F0;
  objc_copyWeak(&v27, &location);
  id v20 = v6;
  id v25 = v20;
  id v21 = v7;
  id v26 = v21;
  id v23 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v22,  65,  (uint64_t)v9,  (uint64_t)v14,  v19,  0,  v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)performANQPWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    if (objc_msgSend_includeMatchingKnownNetworkProfiles(v8, v12, v13, v14, v15))
    {
      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = sub_186486674;
      v29[3] = &unk_189E5C608;
      uint64_t v16 = &v31;
      objc_copyWeak(&v31, &location);
      id v30 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v17,  65,  0,  (uint64_t)v9,  0,  1,  v29);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___performANQPWithParameters_parentXPCRequest_(self, v19, (uint64_t)v8, (uint64_t)v18, v20);
      id v21 = &v30;
    }

    else
    {
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = sub_186486740;
      v26[3] = &unk_189E5C608;
      uint64_t v16 = &v28;
      objc_copyWeak(&v28, &location);
      id v27 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v23, 65, 0, (uint64_t)v9, v26);
      id v21 = &v27;
    }

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = sub_18648680C;
    v24[3] = &unk_189E5C2C0;
    id v25 = v10;
    dispatch_async(replyQueue, v24);
  }
}

- (void)setChannel:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"Channel";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864869F4;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 17, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186486A08;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)setPower:(BOOL)a3 requestParams:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v21 = @"Power";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithBool_(v9, v11, v6, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_186486BAC;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 6, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)setRangeable:(BOOL)a3 peerList:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  v29[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (a4)
  {
    v28[0] = @"Rangeable";
    uint64_t v13 = (void *)MEMORY[0x189607968];
    id v14 = a4;
    objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = @"RangingPeerList";
    v29[0] = v18;
    v29[1] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v19, (uint64_t)v29, (uint64_t)v28, 2);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_186486D70;
    v26[3] = &unk_189E5C338;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 68, (uint64_t)v20, (uint64_t)v10, v26);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186486D84;
    block[3] = &unk_189E5C2C0;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (a3)
  {
    v29[0] = a3;
    v28[0] = @"RangingPeerList";
    v28[1] = @"RangingTimeout";
    uint64_t v13 = (void *)MEMORY[0x189607968];
    id v14 = a3;
    objc_msgSend_numberWithUnsignedInteger_(v13, v15, a4, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v19, (uint64_t)v29, (uint64_t)v28, 2);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_186486FA4;
    v26[3] = &unk_189E5C338;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 69, (uint64_t)v20, (uint64_t)v10, v26);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186487030;
    block[3] = &unk_189E5C2C0;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)setRangingIdentifier:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v8)
  {
    uint64_t v17 = @"RangingIdentifier";
    v18[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v10, (uint64_t)v18, (uint64_t)&v17, 1);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_1864871D0;
  v15[3] = &unk_189E5C338;
  id v13 = v11;
  id v16 = v13;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v14, 174, (uint64_t)v12, (uint64_t)v9, v15);
  if (v8) {
}
  }

- (void)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"AWDLPeerAssistedDiscoveryParams";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186487354;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 66, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186487368;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)stopAWDLPeerAssistedDiscoveryWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_18648746C;
  v9[3] = &unk_189E5C338;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 67, 0, (uint64_t)a3, v9);
}

- (id)__shouldPerformPreAssociation6GHzFollowupScan:(id)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v8 = v3;
  if (!v3
    || (objc_msgSend_isFILSDiscoveryFrame(v3, v4, v5, v6, v7) & 1) != 0
    || (objc_msgSend_channel(v8, v9, v10, v11, v12),
        id v13 = (void *)objc_claimAutoreleasedReturnValue(),
        char v18 = objc_msgSend_is6GHz(v13, v14, v15, v16, v17),
        v13,
        (v18 & 1) != 0))
  {
    id v23 = 0LL;
    goto LABEL_26;
  }

  objc_msgSend_RNRBSSList(v8, v19, v20, v21, v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v23, v24, v25, v26, v27))
  {
LABEL_26:
    id v35 = 0LL;
    goto LABEL_24;
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v23 = v23;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v28, (uint64_t)&v52, (uint64_t)v56, 16);
  if (!v29)
  {
    id v35 = 0LL;
    goto LABEL_23;
  }

  uint64_t v34 = v29;
  id v35 = 0LL;
  uint64_t v36 = *(void *)v53;
  while (2)
  {
    for (uint64_t i = 0LL; i != v34; ++i)
    {
      if (*(void *)v53 != v36) {
        objc_enumerationMutation(v23);
      }
      id v38 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      objc_msgSend_channel(v38, v30, v31, v32, v33, (void)v52);
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
      int v44 = objc_msgSend_is6GHz(v39, v40, v41, v42, v43);

      if (v44)
      {
        uint64_t v45 = objc_msgSend_shortSSID(v38, v30, v31, v32, v33);
        if (v45)
        {
          if (v45 != objc_msgSend_shortSSID(v8, v46, v47, v48, v49)) {
            continue;
          }
        }

        else if ((objc_msgSend_isSameSSID(v38, v46, v47, v48, v49) & 1) == 0)
        {
          continue;
        }

        if (objc_msgSend_isColocatedAP(v38, v30, v31, v32, v33))
        {
          id v50 = v38;

          id v35 = v50;
          goto LABEL_23;
        }

        if (!v35) {
          id v35 = v38;
        }
      }
    }

    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v30, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v34) {
      continue;
    }
    break;
  }

- (void)__perform6GHzFollowupScanAndAssociateWithParameters:(id)a3 BSS:(id)a4 parentXPCRequest:(id)a5
{
  v86[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
  objc_msgSend_scanResult(v8, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_shortSSID(v16, v17, v18, v19, v20);
  objc_msgSend_setShortSSID_(v11, v22, v21, v23, v24);

  objc_msgSend_BSSID(v9, v25, v26, v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBSSID_(v11, v30, (uint64_t)v29, v31, v32);

  objc_msgSend_channel(v9, v33, v34, v35, v36);
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v37;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v38, (uint64_t)v86, 1, v39);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannels_(v11, v41, (uint64_t)v40, v42, v43);

  objc_msgSend_setBSSType_(v11, v44, 3, v45, v46);
  objc_msgSend_setIncludeHiddenNetworks_(v11, v47, 0, v48, v49);
  objc_msgSend_setAcceptableCacheAge_(v11, v50, 0, v51, v52);
  objc_msgSend_setScanType_(v11, v53, 1, v54, v55);
  else {
    objc_msgSend_setScanFlags_(v11, v60, 1056, v61, v62);
  }
  objc_initWeak(&location, self);
  __uint64_t v84 = @"ScanParams";
  id v85 = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v63, (uint64_t)&v85, (uint64_t)&v84, 1);
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestParameters(v10, v65, v66, v67, v68);
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v10, v70, v71, v72, v73);
  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1895F87A8];
  v79[1] = 3221225472LL;
  v79[2] = sub_18648791C;
  v79[3] = &unk_189E5C4F0;
  objc_copyWeak(&v82, &location);
  id v75 = v8;
  id v80 = v75;
  id v76 = v10;
  id v81 = v76;
  id v78 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v77,  64,  (uint64_t)v64,  (uint64_t)v69,  v74,  0,  v79);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&location);
}

- (void)associateWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v38[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = v10;
  if (v8)
  {
    objc_msgSend_scanResult(v8, v11, v12, v13, v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___shouldPerformPreAssociation6GHzFollowupScan_(self, v17, (uint64_t)v16, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      id v37 = @"AssocParams";
      v38[0] = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)v38, (uint64_t)&v37, 1);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = sub_186487D20;
      v33[3] = &unk_189E5C338;
      uint64_t v23 = &v34;
      id v34 = v15;
      objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_( self,  v24,  62,  (uint64_t)v22,  (uint64_t)v9,  0,  1,  v33);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend___perform6GHzFollowupScanAndAssociateWithParameters_BSS_parentXPCRequest_( self,  v26,  (uint64_t)v8,  (uint64_t)v20,  (uint64_t)v25);
    }

    else
    {
      uint64_t v35 = @"AssocParams";
      id v36 = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)&v36, (uint64_t)&v35, 1);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = sub_186487D34;
      v31[3] = &unk_189E5C338;
      uint64_t v23 = &v32;
      id v32 = v15;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v28, 62, (uint64_t)v25, (uint64_t)v9, v31);
    }
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_186487D48;
    void v29[3] = &unk_189E5C2C0;
    id v30 = v10;
    dispatch_async(replyQueue, v29);
    uint64_t v20 = v30;
  }
}

- (void)disassociateWithReason:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  uint64_t v21 = @"DisassocReason";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_186487EEC;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 63, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)updateSoftAPBand:(unsigned int)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  uint64_t v21 = @"SoftAPBand";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithUnsignedInt_(v9, v11, v6, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_186488030;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 219, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryKnownNetworkProfileMatchingNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"NetworkProfile";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864881B4;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 55, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186488240;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryKnownNetworkProfileMatchingScanResult:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"ScanResult";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186488428;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 56, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864884B4;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryKnownNetworkProfilesWithProperties:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x189603FC8];
  id v10 = a4;
  id v11 = a3;
  objc_msgSend_dictionary(v9, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)@"NetworkProfileProperties", v18);

  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = sub_186488618;
  v21[3] = &unk_189E5C338;
  id v22 = v8;
  id v19 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 54, (uint64_t)v16, (uint64_t)v10, v21);
}

- (void)addKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186488814;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 59, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186488828;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 requestParams:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v21 = v16;
  if (v12)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v12, (uint64_t)@"NetworkProfile", v24);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v25, (uint64_t)v13, (uint64_t)@"NetworkProfileProperties", v26);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v27, (uint64_t)v14, (uint64_t)@"OSSpecificKeys", v28);
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = sub_186488A24;
    v33[3] = &unk_189E5C338;
    id v34 = v21;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v29, 61, (uint64_t)v22, (uint64_t)v15, v33);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = sub_186488A38;
    v31[3] = &unk_189E5C2C0;
    id v32 = v16;
    dispatch_async(replyQueue, v31);
    id v22 = v32;
  }
}

- (void)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a3)
  {
    v29[0] = a3;
    v28[0] = @"NetworkProfile";
    v28[1] = @"RemoveReason";
    id v13 = (void *)MEMORY[0x189607968];
    id v14 = a3;
    objc_msgSend_numberWithInteger_(v13, v15, a4, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v19, (uint64_t)v29, (uint64_t)v28, 2);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_186488C58;
    v26[3] = &unk_189E5C338;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 60, (uint64_t)v20, (uint64_t)v10, v26);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186488C6C;
    block[3] = &unk_189E5C2C0;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryThermalIndexWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryCountryBandSupport:(id)a3 reply:(id)a4
{
}

- (void)setThermalIndex:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v21 = @"ThermalIndex";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_186488E30;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 36, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryLinkDownStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryWoWEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIO80211ControllerInfoWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIO80211InterfaceInfoWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIsNetworkServiceEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv6RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPLeaseStartTimeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPLeaseExpirationTimeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4InterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6InterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNetworkReachabilityWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XSupplicantStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XControlModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XControlStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XClientStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRoamStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryJoinStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAutoJoinStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDeviceUUIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLinkQualityMetricWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowerDebugInfoWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)performAutoJoinWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v26[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = (CWFAutoJoinParameters *)v8;
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinParameters);
    objc_msgSend_setTrigger_(v13, v14, 16, v15, v16);
    objc_msgSend_setMode_(v13, v17, 1, v18, v19);
  }

  id v25 = @"AutoJoinParams";
  v26[0] = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v11, (uint64_t)v26, (uint64_t)&v25, 1);
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  void v23[2] = sub_1864891D4;
  v23[3] = &unk_189E5C338;
  id v24 = v10;
  id v21 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 177, (uint64_t)v20, (uint64_t)v9, v23);
}

- (void)queryCCAWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryUserAutoJoinStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setUserAutoJoinState:(BOOL)a3 requestParams:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v21 = @"UserAutoJoinState";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithBool_(v9, v11, v6, v12, v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_186489338;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 180, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryAutoHotspotModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setAutoHotspotMode:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v21 = @"AutoHotspotMode";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_18648948C;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 183, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryWiFiUIStateFlagsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRxRateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)performSensingWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"SensingParams";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186489630;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 188, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864896BC;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)performNearbyDeviceDiscovery:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NDDParams";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864898A4;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 238, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864898B8;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryUserSettingsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setUserSettings:(id)a3 properties:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v10)
  {
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v10, (uint64_t)@"UserSettings", v17);
    if (v11) {
      objc_msgSend_setObject_forKey_(v15, v18, (uint64_t)v11, (uint64_t)@"UserSettingsProperties", v19);
    }
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = sub_186489A94;
    v24[3] = &unk_189E5C338;
    id v25 = v14;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 190, (uint64_t)v15, (uint64_t)v12, v24);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    void v22[2] = sub_186489AA8;
    v22[3] = &unk_189E5C2C0;
    id v23 = v13;
    dispatch_async(replyQueue, v22);
    id v15 = v23;
  }
}

- (void)queryAutoJoinMetricWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)resetAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_186489BCC;
  v9[3] = &unk_189E5C338;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 195, 0, (uint64_t)a3, v9);
}

- (void)queryIPv4SubnetMasksWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4ARPResolvedHardwareAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4ARPResolvedIPAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPServerIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPv6ServerIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv6NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 requestParams:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v24 = v19;
  if (v14 && v15)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v20, v21, v22, v23);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v15, (uint64_t)@"NetworkProfile", v27);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v28, (uint64_t)v14, (uint64_t)@"BSS", v29);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v30, (uint64_t)v16, (uint64_t)@"BSSProperties", v31);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v32, (uint64_t)v17, (uint64_t)@"OSSpecificKeys", v33);
    v38[0] = MEMORY[0x1895F87A8];
    v38[1] = 3221225472LL;
    void v38[2] = sub_186489E04;
    v38[3] = &unk_189E5C338;
    id v39 = v24;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v34, 200, (uint64_t)v25, (uint64_t)v18, v38);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = sub_186489E18;
    v36[3] = &unk_189E5C2C0;
    id v37 = v19;
    dispatch_async(replyQueue, v36);
    id v25 = v37;
  }
}

- (void)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  void v28[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a3 && a4)
  {
    v27[0] = @"NetworkProfile";
    v27[1] = @"BSS";
    v28[0] = a4;
    v28[1] = a3;
    id v13 = (void *)MEMORY[0x189603F68];
    id v14 = a4;
    id v15 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v16, (uint64_t)v28, (uint64_t)v27, 2);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_18648A02C;
    v25[3] = &unk_189E5C338;
    id v18 = &v26;
    id v26 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v19, 198, (uint64_t)v17, (uint64_t)v10, v25);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648A040;
    block[3] = &unk_189E5C2C0;
    id v18 = &v24;
    id v24 = v11;
    id v21 = a4;
    id v22 = a3;
    dispatch_async(replyQueue, block);
  }
}

- (void)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  void v28[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a3 && a4)
  {
    v27[0] = @"NetworkProfile";
    v27[1] = @"BSS";
    v28[0] = a4;
    v28[1] = a3;
    id v13 = (void *)MEMORY[0x189603F68];
    id v14 = a4;
    id v15 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v16, (uint64_t)v28, (uint64_t)v27, 2);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_18648A254;
    v25[3] = &unk_189E5C338;
    id v18 = &v26;
    id v26 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v19, 199, (uint64_t)v17, (uint64_t)v10, v25);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648A268;
    block[3] = &unk_189E5C2C0;
    id v18 = &v24;
    id v24 = v11;
    id v21 = a4;
    id v22 = a3;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryPasswordForKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648A44C;
    v20[3] = &unk_189E5C338;
    id v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 201, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648A4D8;
    block[3] = &unk_189E5C2C0;
    id v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)setPassword:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v18 = v13;
  if (v11)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v14, v15, v16, v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, (uint64_t)v11, (uint64_t)@"NetworkProfile", v21);
    objc_msgSend_setObject_forKeyedSubscript_(v19, v22, (uint64_t)v10, (uint64_t)@"Password", v23);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    void v28[2] = sub_18648A6A8;
    void v28[3] = &unk_189E5C338;
    id v29 = v18;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v24, 202, (uint64_t)v19, (uint64_t)v12, v28);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    void v26[2] = sub_18648A6BC;
    v26[3] = &unk_189E5C2C0;
    id v27 = v13;
    dispatch_async(replyQueue, v26);
    id v19 = v27;
  }
}

- (void)queryMaxLinkSpeedWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowersaveWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryMaxNSSForAPWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxNSSWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBeaconCacheWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_18648A86C;
  v10[3] = &unk_189E5C608;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v9, 216, 0, (uint64_t)v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryBackgroundScanCacheWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_18648AA24;
  v10[3] = &unk_189E5C608;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v9, 241, 0, (uint64_t)v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryBackgroundScanConfigurationWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setBackgroundScanConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"BackgroundScanConfiguration";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648AC70;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 244, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648AC84;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryBlockedBandsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setBlockedBands:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"BlockedBands";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648AE78;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 218, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648AE8C;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)startHostAPModeWithConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"HostAPConfiguration";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648B070;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 220, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648B084;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)stopHostAPModeWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_18648B188;
  v9[3] = &unk_189E5C338;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 221, 0, (uint64_t)a3, v9);
}

- (void)queryPrivateMACAddressForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648B30C;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 222, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648B398;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryPrivateMACAddressModeForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648B580;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 223, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648B60C;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = @"NetworkProfile";
    v28[1] = @"PrivateMACMode";
    id v13 = (void *)MEMORY[0x189607968];
    id v14 = a4;
    objc_msgSend_numberWithInteger_(v13, v15, a3, v16, v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v19, (uint64_t)v29, (uint64_t)v28, 2);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    void v26[2] = sub_18648B830;
    v26[3] = &unk_189E5C338;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 224, (uint64_t)v20, (uint64_t)v10, v26);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648B844;
    block[3] = &unk_189E5C2C0;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryPrivateMACAddressModeSystemSettingWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_18648B948;
  v9[3] = &unk_189E5C338;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 225, 0, (uint64_t)a3, v9);
}

- (void)setPrivateMACAddressModeSystemSetting:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v21 = @"PrivateMACMode";
  id v9 = (void *)MEMORY[0x189607968];
  id v10 = a4;
  objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_18648BB04;
  v19[3] = &unk_189E5C338;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 226, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  v29[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = @"NetworkProfile";
    v28[1] = @"State";
    uint64_t v13 = (void *)MEMORY[0x189607968];
    id v14 = a4;
    objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v19, (uint64_t)v29, (uint64_t)v28, 2);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    void v26[2] = sub_18648BCC4;
    v26[3] = &unk_189E5C338;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 227, (uint64_t)v20, (uint64_t)v10, v26);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648BCD8;
    block[3] = &unk_189E5C2C0;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryIsQuickProbeRequiredForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648BEBC;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 228, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648BF48;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  v29[2] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = @"NetworkProfile";
    v28[1] = @"Result";
    uint64_t v13 = (void *)MEMORY[0x189607968];
    id v14 = a4;
    objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v19, (uint64_t)v29, (uint64_t)v28, 2);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    void v26[2] = sub_18648C16C;
    v26[3] = &unk_189E5C338;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 229, (uint64_t)v20, (uint64_t)v10, v26);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648C180;
    block[3] = &unk_189E5C2C0;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryHostAPStationListWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLQMConfigurationWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setLQMConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"LQMConfiguration";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x189603F68];
    id v12 = a3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_18648C384;
    v20[3] = &unk_189E5C338;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 235, (uint64_t)v14, (uint64_t)v8, v20);
  }

  else
  {
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18648C398;
    block[3] = &unk_189E5C2C0;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryWiFiAssistOverrideReasonsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAutoJoinDenyListWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v25[2] = *MEMORY[0x1895F89C0];
  id v10 = a6;
  v24[0] = @"NetworkProfile";
  v24[1] = @"AutoJoinDenyListAddReason";
  v25[0] = a3;
  id v11 = (void *)MEMORY[0x189607968];
  id v12 = a5;
  id v13 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v11, v14, a4, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v18, (uint64_t)v25, (uint64_t)v24, 2);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  void v22[2] = sub_18648C584;
  v22[3] = &unk_189E5C338;
  id v23 = v10;
  id v20 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v21, 246, (uint64_t)v19, (uint64_t)v12, v22);
}

- (void)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v25[2] = *MEMORY[0x1895F89C0];
  id v10 = a6;
  v24[0] = @"NetworkProfile";
  v24[1] = @"AutoJoinDenyListRemoveReason";
  v25[0] = a3;
  id v11 = (void *)MEMORY[0x189607968];
  id v12 = a5;
  id v13 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v11, v14, a4, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v18, (uint64_t)v25, (uint64_t)v24, 2);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  void v22[2] = sub_18648C768;
  v22[3] = &unk_189E5C338;
  id v23 = v10;
  id v20 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v21, 247, (uint64_t)v19, (uint64_t)v12, v22);
}

- (void)queryKnownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v8)
  {
    uint64_t v17 = @"KnownNetworkInfoOptions";
    v18[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v10, (uint64_t)v18, (uint64_t)&v17, 1);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_18648C918;
  v15[3] = &unk_189E5C338;
  id v16 = v11;
  id v13 = v11;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v14, 248, (uint64_t)v12, (uint64_t)v9, v15);
}

- (CWFXPCConnectionDelegate)delegate
{
  return (CWFXPCConnectionDelegate *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)bootArgs
{
  return self->_bootArgs;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)codesignID
{
  return self->_codesignID;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 192LL, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (CWFXPCProxyConnection)remoteXPCProxyConnection
{
  return self->_remoteXPCProxyConnection;
}

- (void)setRemoteXPCProxyConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end