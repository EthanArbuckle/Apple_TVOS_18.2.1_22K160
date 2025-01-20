@interface CWFInterface
+ (BOOL)logRedactionDisabled;
+ (unsigned)logRedactionSetting;
+ (void)setLogRedactionDisabled:(BOOL)a3;
+ (void)setLogRedactionSetting:(unsigned __int8)a3;
- (AWDLServiceDiscoveryManager)awdlServiceManager;
- (BOOL)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5;
- (BOOL)addKnownNetworkProfile:(id)a3 error:(id *)a4;
- (BOOL)applyUserSettings:(id)a3 properties:(id)a4 error:(id *)a5;
- (BOOL)associateWithParameters:(id)a3 error:(id *)a4;
- (BOOL)beginActivity:(id)a3 error:(id *)a4;
- (BOOL)beginActivityType:(int64_t)a3 reason:(id)a4 error:(id *)a5;
- (BOOL)cancelRequestsWithUUID:(id)a3 error:(id *)a4;
- (BOOL)isActivated;
- (BOOL)isNetworkServiceEnabled;
- (BOOL)isQuickProbeRequiredForNetworkProfile:(id)a3;
- (BOOL)performAutoJoinWithParameters:(id)a3 error:(id *)a4;
- (BOOL)powerOn;
- (BOOL)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5;
- (BOOL)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 error:(id *)a5;
- (BOOL)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 error:(id *)a5;
- (BOOL)setAWDLPeerTrafficRegistration:(id)a3 error:(id *)a4;
- (BOOL)setAutoHotspotMode:(int64_t)a3 error:(id *)a4;
- (BOOL)setBackgroundScanConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setBlockedBands:(id)a3 error:(id *)a4;
- (BOOL)setChannel:(id)a3 error:(id *)a4;
- (BOOL)setCompanionCountryCode:(id)a3 error:(id *)a4;
- (BOOL)setLinkQualityMetricConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setPassword:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5;
- (BOOL)setPower:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 error:(id *)a5;
- (BOOL)setPrivateMACAddressModeSystemSetting:(int64_t)a3 error:(id *)a4;
- (BOOL)setRangeable:(BOOL)a3 peerList:(id)a4 error:(id *)a5;
- (BOOL)setRangingIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setThermalIndex:(int64_t)a3 error:(id *)a4;
- (BOOL)setUserAutoJoinDisabled:(BOOL)a3 error:(id *)a4;
- (BOOL)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 error:(id *)a4;
- (BOOL)startHostAPModeWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringEvent:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringEventType:(int64_t)a3 error:(id *)a4;
- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 error:(id *)a7;
- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 error:(id *)a6;
- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 error:(id *)a6;
- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 error:(id *)a5;
- (BOOL)userAutoJoinDisabled;
- (BOOL)wakeOnWirelessEnabled;
- (CWFInterface)init;
- (CWFInterface)initWithServiceType:(int64_t)a3;
- (CWFInterface)initWithServiceType:(int64_t)a3 endpoint:(id)a4;
- (CWFInterface)initWithXPCClient:(id)a3 requestParameters:(id)a4;
- (CWFRequestParameters)requestParameters;
- (CWFXPCClient)XPCClient;
- (double)rxRate;
- (double)txPower;
- (double)txRate;
- (id)AWDL;
- (id)AWDLAFTxMode;
- (id)AWDLAvailabilityWindowAPAlignment;
- (id)AWDLBTLEStateParameters;
- (id)AWDLContinuousElectionAlgorithmEnabled;
- (id)AWDLElectionID;
- (id)AWDLElectionMetric;
- (id)AWDLElectionParameters;
- (id)AWDLElectionRSSIThresholds;
- (id)AWDLEncryptionType;
- (id)AWDLExtensionStateMachineParameters;
- (id)AWDLGuardTime;
- (id)AWDLMasterChannel;
- (id)AWDLOpMode;
- (id)AWDLPeerDatabase;
- (id)AWDLPeerTrafficRegistration;
- (id)AWDLPreferredChannels;
- (id)AWDLPresenceMode;
- (id)AWDLSecondaryMasterChannel;
- (id)AWDLSidecarDiagnostics;
- (id)AWDLSocialTimeSlots;
- (id)AWDLStatistics;
- (id)AWDLStrategy;
- (id)AWDLSyncChannelSequence;
- (id)AWDLSyncEnabled;
- (id)AWDLSyncParameters;
- (id)AWDLSyncState;
- (id)BSSID;
- (id)BSSIDForVendor;
- (id)DHCPLeaseExpiresAt;
- (id)DHCPLeaseStartedAt;
- (id)DHCPServerID;
- (id)DHCPv6ServerID;
- (id)DNSServerAddresses;
- (id)IO80211ControllerInfo;
- (id)IO80211InterfaceInfo;
- (id)IPv4ARPResolvedHardwareAddress;
- (id)IPv4ARPResolvedIPAddress;
- (id)IPv4Addresses;
- (id)IPv4NetworkSignature;
- (id)IPv4RouterAddress;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6NetworkSignature;
- (id)IPv6RouterAddress;
- (id)LQMSummary;
- (id)MACAddress;
- (id)NANData;
- (id)SSID;
- (id)SSIDForVendor;
- (id)__adjustedRequestParameters;
- (id)activities;
- (id)authType;
- (id)autoJoinStatistics;
- (id)auxiliaryInterface;
- (id)background;
- (id)backgroundScanCache;
- (id)backgroundScanConfiguration;
- (id)beaconCache;
- (id)blockedBands;
- (id)bluetoothCoexistenceConfig;
- (id)bluetoothCoexistenceProfiles2GHz;
- (id)bluetoothCoexistenceProfiles5GHz;
- (id)cachedAutoJoinMetric;
- (id)cachedAutoJoinStatus;
- (id)cachedJoinStatus;
- (id)cachedLinkDownStatus;
- (id)cachedLinkQualityMetric;
- (id)cachedRoamStatus;
- (id)capabilities;
- (id)chainAck;
- (id)channel;
- (id)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4;
- (id)countryCode;
- (id)currentKnownNetworkProfile;
- (id)currentScanResult;
- (id)desense;
- (id)desenseLevel;
- (id)deviceUUID;
- (id)eventHandler;
- (id)eventHandlerWithEventID:(id)a3;
- (id)eventIDs;
- (id)getAutoJoinDenyList;
- (id)globalDNSServerAddresses;
- (id)globalIPv4Addresses;
- (id)globalIPv4InterfaceName;
- (id)globalIPv4NetworkServiceID;
- (id)globalIPv4NetworkServiceName;
- (id)globalIPv4RouterAddress;
- (id)globalIPv6Addresses;
- (id)globalIPv6InterfaceName;
- (id)globalIPv6NetworkServiceID;
- (id)globalIPv6NetworkServiceName;
- (id)globalIPv6RouterAddress;
- (id)hardwareMACAddress;
- (id)hardwareSupportedChannels;
- (id)highPriority;
- (id)hostAPStationList;
- (id)interfaceName;
- (id)interfaceNames;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)knownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3;
- (id)knownNetworkProfileMatchingNetworkProfile:(id)a3;
- (id)knownNetworkProfileMatchingScanResult:(id)a3;
- (id)knownNetworkProfilesWithProperties:(id)a3;
- (id)leakyAPStats;
- (id)linkQualityMetricConfiguration;
- (id)lowPriority;
- (id)maxPHYModeDescription;
- (id)networkName;
- (id)networkServiceID;
- (id)networkServiceName;
- (id)parentInterfaceName;
- (id)passwordForKnownNetworkProfile:(id)a3 error:(id *)a4;
- (id)perAntennaRSSI;
- (id)performANQPWithParameters:(id)a3 error:(id *)a4;
- (id)performNearbyDeviceDiscovery:(id)a3;
- (id)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (id)performScanWithParameters:(id)a3 error:(id *)a4;
- (id)performSensingWithParameters:(id)a3 error:(id *)a4;
- (id)powerDebugInfo;
- (id)powerState;
- (id)privateMACAddressForNetworkProfile:(id)a3;
- (id)rangingCapabilities;
- (id)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4;
- (id)supportedChannel:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5 countryCode:(id)a6;
- (id)supportedChannelsWithCountryCode:(id)a3;
- (id)systemActivities;
- (id)systemEventIDs;
- (id)targetQueue;
- (id)txChainPower;
- (id)userInitiated;
- (id)userInteractive;
- (id)userSettings;
- (id)utility;
- (id)veryHighPriority;
- (id)veryLowPriority;
- (id)virtualInterfaceNames;
- (id)wifiAssistOverrideReasons;
- (int)EAP8021XClientStatus;
- (int)PHYMode;
- (int)bluetoothCoexistenceMode;
- (int)opMode;
- (int)powersave;
- (int)state;
- (int)supportedPHYModes;
- (int)virtualInterfaceRole;
- (int64_t)RSSI;
- (int64_t)WAPISubtype;
- (int64_t)WEPSubtype;
- (int64_t)autoHotspotMode;
- (int64_t)countryBandSupport;
- (int64_t)noise;
- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3;
- (int64_t)privateMACAddressModeSystemSetting;
- (int64_t)serviceType;
- (int64_t)thermalIndex;
- (unint64_t)CCA;
- (unint64_t)DTIMInterval;
- (unint64_t)MCSIndex;
- (unint64_t)guardInterval;
- (unint64_t)maxLinkSpeed;
- (unint64_t)maxNSSForAP;
- (unint64_t)numberOfSpatialStreams;
- (unint64_t)securityType;
- (unint64_t)txNSS;
- (unint64_t)wifiUIStateFlags;
- (unsigned)EAP8021XControlMode;
- (unsigned)EAP8021XControlState;
- (unsigned)EAP8021XSupplicantState;
- (unsigned)__flagsForChannelBand:(unsigned int)a3 width:(int)a4;
- (unsigned)reachabilityFlags;
- (void)activate;
- (void)associateWithParameters:(id)a3 reply:(id)a4;
- (void)clearAllEventHandlers;
- (void)disassociateWithReason:(int64_t)a3;
- (void)endActivity:(id)a3;
- (void)endActivityType:(int64_t)a3;
- (void)endAllActivities;
- (void)invalidate;
- (void)performANQPWithParameters:(id)a3 reply:(id)a4;
- (void)performActivity:(id)a3 usingBlock:(id)a4;
- (void)performAutoJoinWithParameters:(id)a3 reply:(id)a4;
- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 reply:(id)a5;
- (void)performScanWithParameters:(id)a3 reply:(id)a4;
- (void)performSensingWithParameters:(id)a3 reply:(id)a4;
- (void)resetAutoJoinStatistics;
- (void)resume;
- (void)setActivated:(BOOL)a3;
- (void)setAwdlServiceManager:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setEventHandler:(id)a3 eventID:(id)a4;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4;
- (void)setTargetQueue:(id)a3;
- (void)stopAWDLPeerAssistedDiscovery;
- (void)stopHostAPMode;
- (void)stopMonitoringAllEvents;
- (void)stopMonitoringEvent:(id)a3;
- (void)stopMonitoringEventType:(int64_t)a3;
- (void)suspend;
- (void)updateSoftAPBand:(unsigned int)a3;
@end

@implementation CWFInterface

+ (unsigned)logRedactionSetting
{
  id v2 = a1;
  objc_sync_enter(v2);
  unsigned __int8 v3 = byte_18C4A4230;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setLogRedactionSetting:(unsigned __int8)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  byte_18C4A4230 = a3;
  objc_sync_exit(obj);
}

+ (BOOL)logRedactionDisabled
{
  return objc_msgSend_logRedactionSetting(a1, a2, v2, v3, v4) == 1;
}

+ (void)setLogRedactionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  if (v3) {
    objc_msgSend_setLogRedactionSetting_(obj, v4, 1, v5, v6);
  }
  else {
    objc_msgSend_setLogRedactionSetting_(obj, v4, 2, v5, v6);
  }
  objc_sync_exit(obj);
}

- (id)__adjustedRequestParameters
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9);

  return v10;
}

- (CWFInterface)initWithXPCClient:(id)a3 requestParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CWFInterface;
  uint64_t v9 = -[CWFInterface init](&v18, sel_init);
  v14 = v9;
  if (!v7
    || !v9
    || ((objc_storeStrong((id *)&v9->_XPCClient, a3), !v8)
      ? (v15 = objc_alloc_init(&OBJC_CLASS___CWFRequestParameters))
      : (v15 = (CWFRequestParameters *)v8),
        requestParameters = v14->_requestParameters,
        v14->_requestParameters = v15,
        requestParameters,
        !v14->_requestParameters))
  {
    objc_msgSend_invalidate(v14, v10, v11, v12, v13);

    v14 = 0LL;
  }

  return v14;
}

- (CWFInterface)initWithServiceType:(int64_t)a3
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___CWFXPCClient);
  uint64_t v9 = (void *)objc_msgSend_initWithServiceType_(v5, v6, a3, v7, v8);
  uint64_t v12 = (CWFInterface *)objc_msgSend_initWithXPCClient_requestParameters_(self, v10, (uint64_t)v9, 0, v11);

  return v12;
}

- (CWFInterface)initWithServiceType:(int64_t)a3 endpoint:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_alloc(&OBJC_CLASS___CWFXPCClient);
  v10 = (void *)objc_msgSend_initWithServiceType_endpoint_(v7, v8, a3, (uint64_t)v6, v9);

  uint64_t v13 = (CWFInterface *)objc_msgSend_initWithXPCClient_requestParameters_(self, v11, (uint64_t)v10, 0, v12);
  return v13;
}

- (CWFInterface)init
{
  return (CWFInterface *)objc_msgSend_initWithServiceType_(self, a2, 2, v2, v3);
}

- (id)auxiliaryInterface
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v3, v14, (uint64_t)v8, (uint64_t)v13, v15);

  return v16;
}

- (id)AWDL
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setInterfaceName_(v11, v12, 0, v13, v14);
  objc_msgSend_setVirtualInterfaceRole_(v11, v15, 6, v16, v17);
  objc_super v18 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v18, v24, (uint64_t)v23, (uint64_t)v11, v25);

  return v26;
}

- (id)NANData
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setInterfaceName_(v11, v12, 0, v13, v14);
  objc_msgSend_setVirtualInterfaceRole_(v11, v15, 10, v16, v17);
  objc_super v18 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v18, v24, (uint64_t)v23, (uint64_t)v11, v25);

  return v26;
}

- (id)veryLowPriority
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, -8, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)lowPriority
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, -4, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)highPriority
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, 4, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)veryHighPriority
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, 8, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)background
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 9, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)utility
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 17, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)userInitiated
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 25, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)userInteractive
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 33, v13, v14);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFInterface);
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (void)activate
{
  id obj = self;
  objc_sync_enter(obj);
  if ((objc_msgSend_isActivated(obj, v2, v3, v4, v5) & 1) == 0)
  {
    objc_msgSend_setActivated_(obj, v6, 1, v7, v8);
    objc_msgSend_resume(obj->_XPCClient, v9, v10, v11, v12);
  }

  objc_sync_exit(obj);
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)invalidate
{
}

- (id)targetQueue
{
  return (id)objc_msgSend_targetQueue(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setTargetQueue:(id)a3
{
}

- (int64_t)serviceType
{
  return objc_msgSend_serviceType(self->_XPCClient, a2, v2, v3, v4);
}

- (id)invalidationHandler
{
  return (id)objc_msgSend_invalidationHandler(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return (id)objc_msgSend_interruptionHandler(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)eventHandler
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventHandlerWithEventID_(self, v5, (uint64_t)v4, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setEventHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v5, 0, 0, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_eventID_(self, v7, (uint64_t)v4, (uint64_t)v9, v8);
}

- (BOOL)cancelRequestsWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_1864F00EC;
  v28 = sub_1864F00FC;
  id v29 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 168, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = sub_1864F0104;
    v23[3] = &unk_189E5D7F8;
    v23[4] = &v24;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v23, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v22[1] = 3221225472LL;
    v22[2] = sub_1864F0114;
    v22[3] = &unk_189E5D7F8;
    v22[4] = &v24;
    objc_msgSend_cancelRequestsWithUUID_reply_(v15, v16, (uint64_t)v6, (uint64_t)v22, v17);
  }

  else
  {
    uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v25[5];
    v25[5] = v21;
  }

  uint64_t v18 = (void *)v25[5];
  if (a4 && v18)
  {
    *a4 = v18;
    uint64_t v18 = (void *)v25[5];
  }

  BOOL v19 = v18 == 0LL;
  _Block_object_dispose(&v24, 8);

  return v19;
}

- (int64_t)thermalIndex
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 35, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5D838, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F0218;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryThermalIndexWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)countryBandSupport
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 197, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5D880, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F0344;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryCountryBandSupport_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setThermalIndex:(int64_t)a3 error:(id *)a4
{
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1864F00EC;
  v30 = sub_1864F00FC;
  id v31 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 36, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_1864F0518;
    v25[3] = &unk_189E5D7F8;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472LL;
    v24[2] = sub_1864F0528;
    v24[3] = &unk_189E5D7F8;
    v24[4] = &v26;
    objc_msgSend_setThermalIndex_requestParams_reply_(v13, v19, a3, (uint64_t)v18, (uint64_t)v24);
  }

  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 45, 0);
    uint64_t v13 = (void *)v27[5];
    v27[5] = v23;
  }

  uint64_t v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = v20;
    uint64_t v20 = (void *)v27[5];
  }

  BOOL v21 = v20 == 0LL;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (id)deviceUUID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 145, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5D8A0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F0650;
    v18[3] = &unk_189E5D8C8;
    v18[4] = &v19;
    objc_msgSend_queryDeviceUUIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)interfaceName
{
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  v32 = sub_1864F00FC;
  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v6, v7, v8, v9, v10);
  id v33 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29[5] && (objc_msgSend_allowRequestType_(self->_XPCClient, v11, 3, v12, v13) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v14, (uint64_t)&unk_189E5D8E8, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F07E4;
    v27[3] = &unk_189E5D910;
    v27[4] = &v28;
    objc_msgSend_queryInterfaceNameWithRequestParams_reply_(v17, v23, (uint64_t)v22, (uint64_t)v27, v24);
  }

  id v25 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v25;
}

- (id)interfaceNames
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 1, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5D930, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F0954;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryInterfaceNamesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)virtualInterfaceNames
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 2, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5D978, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F0AC4;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryVirtualInterfaceNamesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setPower:(BOOL)a3 error:(id *)a4
{
  BOOL v6 = a3;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1864F00EC;
  uint64_t v30 = sub_1864F00FC;
  id v31 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 6, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_1864F0CB8;
    v25[3] = &unk_189E5D7F8;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472LL;
    v24[2] = sub_1864F0CC8;
    v24[3] = &unk_189E5D7F8;
    v24[4] = &v26;
    objc_msgSend_setPower_requestParams_reply_(v13, v19, v6, (uint64_t)v18, (uint64_t)v24);
  }

  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 45, 0);
    uint64_t v13 = (void *)v27[5];
    void v27[5] = v23;
  }

  uint64_t v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = v20;
    uint64_t v20 = (void *)v27[5];
  }

  BOOL v21 = v20 == 0LL;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (BOOL)setChannel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 17, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F0E7C;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F0E8C;
    v26[3] = &unk_189E5D7F8;
    v26[4] = &v28;
    objc_msgSend_setChannel_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (id)performScanWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_1864F00EC;
  v38 = sub_1864F00FC;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 64, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F1080;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F1090;
    v26[3] = &unk_189E5D9A0;
    v26[4] = &v28;
    void v26[5] = &v34;
    objc_msgSend_performScanWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  if (a4)
  {
    uint64_t v22 = (void *)v29[5];
    if (v22) {
      *a4 = v22;
    }
  }

  id v23 = (id)v35[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (void)performScanWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 64, v9, v10))
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = sub_1864F1264;
    v28[3] = &unk_189E5D9C8;
    id v14 = v7;
    id v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F127C;
    v26[3] = &unk_189E5D9F0;
    id v27 = v14;
    objc_msgSend_performScanWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);
  }

  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607688], 45, 0);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void))v7 + 2))(v7, v25, 0LL);
  }
}

- (id)performANQPWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_1864F00EC;
  v38 = sub_1864F00FC;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 65, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F1474;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F1484;
    v26[3] = &unk_189E5D9A0;
    void v26[4] = &v28;
    void v26[5] = &v34;
    objc_msgSend_performANQPWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  if (a4)
  {
    uint64_t v22 = (void *)v29[5];
    if (v22) {
      *a4 = v22;
    }
  }

  id v23 = (id)v35[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (void)performANQPWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 65, v9, v10))
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = sub_1864F1658;
    v28[3] = &unk_189E5D9C8;
    id v14 = v7;
    id v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F1670;
    v26[3] = &unk_189E5D9F0;
    id v27 = v14;
    objc_msgSend_performANQPWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);
  }

  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607688], 45, 0);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void))v7 + 2))(v7, v25, 0LL);
  }
}

- (BOOL)associateWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 62, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F1828;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F1838;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_associateWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)associateWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 62, v9, v10))
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = sub_1864F19A4;
    v28[3] = &unk_189E5D9C8;
    id v14 = v7;
    id v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F19B8;
    v26[3] = &unk_189E5D9C8;
    id v27 = v14;
    objc_msgSend_associateWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);
  }

  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607688], 45, 0);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v25);
  }
}

- (void)disassociateWithReason:(int64_t)a3
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 63, v3, v4))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v7, (uint64_t)&unk_189E5DA10, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_disassociateWithReason_requestParams_reply_(v16, v15, a3, (uint64_t)v14, (uint64_t)&unk_189E5DA30);
  }

- (void)updateSoftAPBand:(unsigned int)a3
{
  uint64_t v5 = *(void *)&a3;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 219, v3, v4))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v7, (uint64_t)&unk_189E5DA50, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateSoftAPBand_requestParams_reply_(v16, v15, v5, (uint64_t)v14, (uint64_t)&unk_189E5DA70);
  }

- (id)currentScanResult
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 57, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DA90, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F1C14;
    v18[3] = &unk_189E5DAB8;
    v18[4] = &v19;
    objc_msgSend_queryCurrentScanResultWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)currentKnownNetworkProfile
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 58, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DAD8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F1D84;
    v18[3] = &unk_189E5DB00;
    v18[4] = &v19;
    objc_msgSend_queryCurrentKnownNetworkProfileWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)capabilities
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 4, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DB20, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F1EF4;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryInterfaceCapabilitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)powerOn
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 5, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DB40, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2040;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  char v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)powerState
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 147, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DB60, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2190;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryPowerStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)SSID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 7, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DBA8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2300;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_querySSIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)networkName
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v6 = objc_alloc(NSString);
    uint64_t v9 = (void *)objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)v5, 4, v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)SSIDForVendor
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 8, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DBC8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F24C4;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_querySSIDForVendorWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)BSSID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 9, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DBE8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2634;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryBSSIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)BSSIDForVendor
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 10, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DC08, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F27A4;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryBSSIDForVendorWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)perAntennaRSSI
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 18, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DC28, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2914;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryRSSIWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int64_t)RSSI
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v5, v6, v7, v8, v9) == 52)
  {
    id v10 = v5;
    uint64_t v15 = objc_msgSend_bytes(v10, v11, v12, v13, v14);
    uint64_t v16 = 28LL;
    if (*(_DWORD *)(v15 + 4) == 1) {
      uint64_t v16 = 12LL;
    }
    int64_t v17 = *(int *)(v15 + v16);
  }

  else
  {
    int64_t v17 = 0LL;
  }

  return v17;
}

- (int64_t)noise
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 19, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DC48, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2AC4;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryNoiseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)CCA
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 178, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DC68, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2BF0;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryCCAWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)txRate
{
  uint64_t v19 = 0LL;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 20, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DC88, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2D24;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryTxRateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  double v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)txPower
{
  uint64_t v19 = 0LL;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 21, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DCA8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2E58;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryTxPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  double v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)rxRate
{
  uint64_t v19 = 0LL;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 187, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DCC8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F2F8C;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryRxRateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  double v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)authType
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 11, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DCE8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F30DC;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAuthTypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unint64_t)securityType
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 12, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DD08, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F3228;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_querySecurityWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)WEPSubtype
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 13, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DD28, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F3354;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryWEPSubtypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)WAPISubtype
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 14, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DD48, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F3480;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryWAPISubtypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)countryCode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 22, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DD68, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F35D0;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryCountryCodeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setCompanionCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 23, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F37CC;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F37DC;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_setCompanionCountryCode_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (int)opMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 30, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DD88, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F38E0;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryOpModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)PHYMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 29, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DDA8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F3A0C;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryPHYModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)maxPHYModeDescription
{
  uint64_t v5 = objc_msgSend_PHYMode(self, a2, v2, v3, v4);
  if ((_DWORD)v5)
  {
    if ((v5 & 0x200) != 0) {
      return @"11BE";
    }
    if ((v5 & 0x100) != 0) {
      return @"11AX";
    }
    if ((v5 & 0x80) != 0) {
      return @"11AC";
    }
    if ((v5 & 0x10) != 0) {
      return @"11N";
    }
    if ((v5 & 8) != 0) {
      return @"11G";
    }
    if ((v5 & 0x40) != 0) {
      return @"TURBO_G";
    }
    if ((v5 & 2) != 0) {
      return @"11A";
    }
    if ((v5 & 0x20) != 0) {
      return @"TURBO_A";
    }
    if ((v5 & 4) != 0) {
      return @"11B";
    }
    objc_msgSend_stringWithFormat_(NSString, v6, (uint64_t)@"(%X)", v7, v8, v5);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (int)supportedPHYModes
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 28, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DDC8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F3C10;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_querySupportedPHYModesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)channel
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 16, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DDE8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F3D60;
    v18[3] = &unk_189E5DE10;
    v18[4] = &v19;
    objc_msgSend_queryChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)supportedChannelsWithCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1864F00EC;
  uint64_t v25 = sub_1864F00FC;
  id v26 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 15, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5DE30, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864F3EE8;
    v20[3] = &unk_189E5D958;
    v20[4] = &v21;
    objc_msgSend_querySupportedChannelsWithCountryCode_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)hardwareSupportedChannels
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 210, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DE50, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4058;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryHardwareSupportedChannelsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unsigned)__flagsForChannelBand:(unsigned int)a3 width:(int)a4
{
  if (a3 - 1 > 2) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = dword_18653E900[a3 - 1];
  }
  unsigned int v5 = v4 | 0x400;
  int v6 = v4 | 0x800;
  if (a4 != 160) {
    int v6 = v4;
  }
  if (a4 != 80) {
    unsigned int v5 = v6;
  }
  int v7 = v4 | 2;
  if (a4 == 40) {
    v4 |= 4u;
  }
  if (a4 == 20) {
    unsigned int v4 = v7;
  }
  if (a4 <= 79) {
    return v4;
  }
  else {
    return v5;
  }
}

- (id)supportedChannel:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5 countryCode:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v10 = a6;
  int v13 = objc_msgSend___flagsForChannelBand_width_(self, v11, v7, v6, v12);
  objc_msgSend_supportedChannelsWithCountryCode_(self, v14, (uint64_t)v10, v15, v16);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v19)
  {
    uint64_t v24 = v19;
    uint64_t v25 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0LL; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v17);
        }
        id v27 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend_channel(v27, v20, v21, v22, v23, (void)v30) == a3
          && (objc_msgSend_flags(v27, v20, v21, v22, v23) & v13) != 0)
        {
          id v28 = v27;
          goto LABEL_12;
        }
      }

      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v24) {
        continue;
      }
      break;
    }
  }

  id v28 = 0LL;
LABEL_12:

  return v28;
}

- (unint64_t)MCSIndex
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 26, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DE70, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4368;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryMCSIndexWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)guardInterval
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 25, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DE90, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4494;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryGuardIntervalWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)numberOfSpatialStreams
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 27, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DEB0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F45C0;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryNumberOfSpatialStreamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)DTIMInterval
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 24, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DED0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F46EC;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryDTIMIntervalWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)parentInterfaceName
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 32, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DEF0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F483C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryParentInterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)virtualInterfaceRole
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 31, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DF10, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4988;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryVirtualInterfaceRoleWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)MACAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 33, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DF30, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4AD8;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryMACAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)hardwareMACAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 173, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DF50, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4C48;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryHardwareMACAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IO80211ControllerInfo
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 114, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DF70, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4DB8;
    v18[3] = &unk_189E5DF98;
    v18[4] = &v19;
    objc_msgSend_queryIO80211ControllerInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IO80211InterfaceInfo
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 115, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DFB8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F4F28;
    v18[3] = &unk_189E5DF98;
    v18[4] = &v19;
    objc_msgSend_queryIO80211InterfaceInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedRoamStatus
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 142, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5DFD8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5098;
    v18[3] = &unk_189E5E000;
    v18[4] = &v19;
    objc_msgSend_queryRoamStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedJoinStatus
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 143, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E020, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5208;
    v18[3] = &unk_189E5E048;
    v18[4] = &v19;
    objc_msgSend_queryJoinStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedAutoJoinStatus
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 144, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E068, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5378;
    v18[3] = &unk_189E5E090;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)wakeOnWirelessEnabled
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 38, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E0B0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F54C4;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryWoWEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  char v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)cachedLinkDownStatus
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 37, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E0D0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5614;
    v18[3] = &unk_189E5E0F8;
    v18[4] = &v19;
    objc_msgSend_queryLinkDownStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)chainAck
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 148, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E118, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5784;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryChainAckWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)txChainPower
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 149, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E138, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F58F4;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryTxChainPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)desense
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 150, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E158, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5A64;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryDesenseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)desenseLevel
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 151, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E178, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5BD4;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryDesenseLevelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceConfig
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 152, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E198, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5D44;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexConfigWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceProfiles2GHz
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 153, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E1B8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F5EB4;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexProfiles2GHzWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceProfiles5GHz
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 154, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E1D8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F6024;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexProfiles5GHzWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)bluetoothCoexistenceMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 155, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E1F8, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F6170;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)leakyAPStats
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 156, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E218, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F62C0;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryLeakyAPStatsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)LQMSummary
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 175, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E238, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F6430;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryLQMSummaryWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedLinkQualityMetric
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 167, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E258, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F65A0;
    v18[3] = &unk_189E5E280;
    v18[4] = &v19;
    objc_msgSend_queryLinkQualityMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)powerDebugInfo
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  int v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 176, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E2A0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F6710;
    v18[3] = &unk_189E5DF98;
    v18[4] = &v19;
    objc_msgSend_queryPowerDebugInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)performAutoJoinWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 177, v9, v10))
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = sub_1864F68C4;
    v28[3] = &unk_189E5D9C8;
    id v14 = v7;
    id v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F68D8;
    v26[3] = &unk_189E5D9C8;
    id v27 = v14;
    objc_msgSend_performAutoJoinWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);
  }

  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607688], 45, 0);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v25);
  }
}

- (BOOL)performAutoJoinWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  __int128 v31 = sub_1864F00EC;
  __int128 v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 177, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F6A90;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F6AA0;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_performAutoJoinWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (BOOL)userAutoJoinDisabled
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 179, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E2C0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F6BA4;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryUserAutoJoinStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  char v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setUserAutoJoinDisabled:(BOOL)a3 error:(id *)a4
{
  BOOL v6 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1864F00EC;
  uint64_t v30 = sub_1864F00FC;
  id v31 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 180, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_1864F6D78;
    v25[3] = &unk_189E5D7F8;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472LL;
    v24[2] = sub_1864F6D88;
    v24[3] = &unk_189E5D7F8;
    v24[4] = &v26;
    objc_msgSend_setUserAutoJoinState_requestParams_reply_(v13, v19, !v6, (uint64_t)v18, (uint64_t)v24);
  }

  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 45, 0);
    uint64_t v13 = (void *)v27[5];
    void v27[5] = v23;
  }

  uint64_t v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = v20;
    uint64_t v20 = (void *)v27[5];
  }

  BOOL v21 = v20 == 0LL;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (int64_t)autoHotspotMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 182, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E2E0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F6E8C;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryAutoHotspotModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setAutoHotspotMode:(int64_t)a3 error:(id *)a4
{
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1864F00EC;
  uint64_t v30 = sub_1864F00FC;
  id v31 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 183, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_1864F7060;
    v25[3] = &unk_189E5D7F8;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472LL;
    v24[2] = sub_1864F7070;
    v24[3] = &unk_189E5D7F8;
    v24[4] = &v26;
    objc_msgSend_setAutoHotspotMode_requestParams_reply_(v13, v19, a3, (uint64_t)v18, (uint64_t)v24);
  }

  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 45, 0);
    uint64_t v13 = (void *)v27[5];
    void v27[5] = v23;
  }

  uint64_t v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = v20;
    uint64_t v20 = (void *)v27[5];
  }

  BOOL v21 = v20 == 0LL;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (unint64_t)wifiUIStateFlags
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 185, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E300, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F7174;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryWiFiUIStateFlagsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)maxLinkSpeed
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 211, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E320, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F72A0;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryMaxLinkSpeedWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)state
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 212, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E340, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F73CC;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)powersave
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 213, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E360, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F74F8;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryPowersaveWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)maxNSSForAP
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 214, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E380, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F7624;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryMaxNSSForAPWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)txNSS
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 215, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E3A0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F7750;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryTxNSSWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)beaconCache
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 216, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E3C0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F78A0;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryBeaconCacheWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)backgroundScanCache
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 241, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E3E0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F7A10;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryBackgroundScanCacheWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setBackgroundScanConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1864F00EC;
  id v31 = sub_1864F00FC;
  id v32 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 244, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F7BD8;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    v25[1] = 3221225472LL;
    v25[2] = sub_1864F7BE8;
    v25[3] = &unk_189E5D7F8;
    v25[4] = &v27;
    objc_msgSend_setBackgroundScanConfiguration_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v25);
  }

  uint64_t v22 = (void *)v28[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v28[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v27, 8);

  return v23;
}

- (id)backgroundScanConfiguration
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 241, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E400, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F7D10;
    v18[3] = &unk_189E5E428;
    v18[4] = &v19;
    objc_msgSend_queryBackgroundScanConfigurationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)blockedBands
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  BOOL v23 = sub_1864F00EC;
  id v24 = sub_1864F00FC;
  id v25 = 0LL;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v3, 217, v4, v5) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v6, (uint64_t)&unk_189E5E448, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_1864F7E98;
    v19[3] = &unk_189E5D958;
    v19[4] = &v20;
    objc_msgSend_queryBlockedBandsWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }

  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)setBlockedBands:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1864F00EC;
  id v31 = sub_1864F00FC;
  id v32 = 0LL;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 218, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F80AC;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v26, v10, v11);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472LL;
    v25[2] = sub_1864F80BC;
    v25[3] = &unk_189E5D7F8;
    v25[4] = &v27;
    objc_msgSend_setBlockedBands_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }

  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v7, *MEMORY[0x189607688], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }

  BOOL v22 = v21 == 0LL;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (id)linkQualityMetricConfiguration
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 234, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E468, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F81E4;
    v18[3] = &unk_189E5DF98;
    v18[4] = &v19;
    objc_msgSend_queryLQMConfigurationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setLinkQualityMetricConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  id v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 235, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F83E0;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F83F0;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_setLQMConfiguration_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  BOOL v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    BOOL v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (id)wifiAssistOverrideReasons
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 236, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E488, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F8518;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryWiFiAssistOverrideReasonsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)beginActivity:(id)a3 error:(id *)a4
{
  XPCClient = self->_XPCClient;
  id v7 = a3;
  objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend_beginActivity_requestParameters_error_( XPCClient,  v13,  (uint64_t)v7,  (uint64_t)v12,  (uint64_t)a4);

  return (char)a4;
}

- (void)endActivity:(id)a3
{
  XPCClient = self->_XPCClient;
  id v5 = a3;
  objc_msgSend___adjustedRequestParameters(self, v6, v7, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endActivity_requestParameters_(XPCClient, v10, (uint64_t)v5, (uint64_t)v12, v11);
}

- (void)endAllActivities
{
  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endAllActivities_(XPCClient, v6, (uint64_t)v9, v7, v8);
}

- (void)performActivity:(id)a3 usingBlock:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      uint64_t v6 = (void (**)(void))a4;
      id v12 = a3;
      objc_msgSend_beginActivity_error_(self, v7, (uint64_t)v12, 0, v8);
      v6[2](v6);

      objc_msgSend_endActivity_(self, v9, (uint64_t)v12, v10, v11);
    }
  }

- (BOOL)beginActivityType:(int64_t)a3 reason:(id)a4 error:(id *)a5
{
  id v8 = a4;
  objc_msgSend_requestParameters(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v13, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityWithType_reason_UUID_(CWFActivity, v19, a3, (uint64_t)v8, (uint64_t)v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend_beginActivity_requestParameters_error_( XPCClient,  v27,  (uint64_t)v20,  (uint64_t)v26,  (uint64_t)a5);

  return (char)a5;
}

- (void)endActivityType:(int64_t)a3
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityWithType_reason_UUID_(CWFActivity, v13, a3, 0, (uint64_t)v12);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endActivity_requestParameters_(XPCClient, v20, (uint64_t)v22, (uint64_t)v19, v21);
}

- (id)activities
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 112, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E4A8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F897C;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryActivitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)systemActivities
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 113, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E4C8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F8AEC;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_querySystemActivitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)eventIDs
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 98, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E4E8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F8C5C;
    v18[3] = &unk_189E5E510;
    v18[4] = &v19;
    objc_msgSend_queryEventIDsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)systemEventIDs
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 99, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E530, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864F8DCC;
    v18[3] = &unk_189E5E510;
    v18[4] = &v19;
    objc_msgSend_querySystemEventIDsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)startMonitoringEventType:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend_startMonitoringEvent_error_(self, v8, (uint64_t)v7, (uint64_t)a4, v9);

  return (char)a4;
}

- (BOOL)startMonitoringEvent:(id)a3 error:(id *)a4
{
  XPCClient = self->_XPCClient;
  id v7 = a3;
  objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend_startMonitoringEvent_requestParameters_error_( XPCClient,  v13,  (uint64_t)v7,  (uint64_t)v12,  (uint64_t)a4);

  return (char)a4;
}

- (void)stopMonitoringEventType:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEvent_(self, v5, (uint64_t)v8, v6, v7);
}

- (void)stopMonitoringEvent:(id)a3
{
  XPCClient = self->_XPCClient;
  id v5 = a3;
  objc_msgSend___adjustedRequestParameters(self, v6, v7, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEvent_requestParameters_(XPCClient, v10, (uint64_t)v5, (uint64_t)v12, v11);
}

- (void)stopMonitoringAllEvents
{
  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringAllEvents_(XPCClient, v6, (uint64_t)v9, v7, v8);
}

- (void)setEventHandler:(id)a3 eventID:(id)a4
{
}

- (id)eventHandlerWithEventID:(id)a3
{
  return (id)objc_msgSend_eventHandlerWithEventID_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (void)clearAllEventHandlers
{
}

- (id)knownNetworkProfilesWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1864F00EC;
  uint64_t v25 = sub_1864F00FC;
  id v26 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 54, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5E550, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864F911C;
    v20[3] = &unk_189E5D958;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfilesWithProperties_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)knownNetworkProfileMatchingScanResult:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1864F00EC;
  uint64_t v25 = sub_1864F00FC;
  id v26 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 56, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5E570, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864F92A4;
    v20[3] = &unk_189E5DB00;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfileMatchingScanResult_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)knownNetworkProfileMatchingNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1864F00EC;
  uint64_t v25 = sub_1864F00FC;
  id v26 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 55, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5E590, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864F942C;
    v20[3] = &unk_189E5DB00;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfileMatchingNetworkProfile_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_1864F00EC;
  v38 = sub_1864F00FC;
  id v39 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v13, 61, v14, v15))
  {
    XPCClient = self->_XPCClient;
    uint64_t v20 = MEMORY[0x1895F87A8];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = sub_1864F9658;
    v33[3] = &unk_189E5D7F8;
    v33[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v16, (uint64_t)v33, v17, v18);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v22, v23, v24, v25);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v32[1] = 3221225472LL;
    v32[2] = sub_1864F9668;
    v32[3] = &unk_189E5D7F8;
    v32[4] = &v34;
    objc_msgSend_updateKnownNetworkProfile_properties_OSSpecificKeys_requestParams_reply_( v21,  v27,  (uint64_t)v10,  (uint64_t)v11,  (uint64_t)v12,  v26,  v32);
  }

  else
  {
    uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v16, *MEMORY[0x189607688], 45, 0);
    uint64_t v21 = (void *)v35[5];
    v35[5] = v31;
  }

  uint64_t v28 = (void *)v35[5];
  if (a6 && v28)
  {
    *a6 = v28;
    uint64_t v28 = (void *)v35[5];
  }

  BOOL v29 = v28 == 0LL;
  _Block_object_dispose(&v34, 8);

  return v29;
}

- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 error:(id *)a5
{
  return MEMORY[0x189616718](self, sel_updateKnownNetworkProfile_properties_OSSpecificKeys_error_, a3, a4, 0LL);
}

- (BOOL)addKnownNetworkProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1864F00EC;
  id v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 59, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864F9828;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864F9838;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_addKnownNetworkProfile_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v25;
  }

  id v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    id v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (BOOL)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_1864F00EC;
  uint64_t v34 = sub_1864F00FC;
  id v35 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 60, v10, v11))
  {
    XPCClient = self->_XPCClient;
    uint64_t v16 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_1864F99FC;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472LL;
    v28[2] = sub_1864F9A0C;
    v28[3] = &unk_189E5D7F8;
    void v28[4] = &v30;
    objc_msgSend_removeKnownNetworkProfile_reason_requestParams_reply_(v17, v23, (uint64_t)v8, a4, (uint64_t)v22, v28);
  }

  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v12, *MEMORY[0x189607688], 45, 0);
    uint64_t v17 = (void *)v31[5];
    v31[5] = v27;
  }

  uint64_t v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    uint64_t v24 = (void *)v31[5];
  }

  BOOL v25 = v24 == 0LL;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_1864F00EC;
  v41 = sub_1864F00FC;
  id v42 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v16, 200, v17, v18))
  {
    XPCClient = self->_XPCClient;
    uint64_t v23 = MEMORY[0x1895F87A8];
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = sub_1864F9C0C;
    v36[3] = &unk_189E5D7F8;
    v36[4] = &v37;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v19, (uint64_t)v36, v20, v21);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v25, v26, v27, v28);
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v23;
    v35[1] = 3221225472LL;
    v35[2] = sub_1864F9C1C;
    v35[3] = &unk_189E5D7F8;
    v35[4] = &v37;
    objc_msgSend_updateKnownBSS_knownNetworkProfile_properties_OSSpecificKeys_requestParams_reply_( v24,  v30,  (uint64_t)v12,  (uint64_t)v13,  (uint64_t)v14,  v15,  v29,  v35);
  }

  else
  {
    uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v19, *MEMORY[0x189607688], 45, 0);
    uint64_t v24 = (void *)v38[5];
    v38[5] = v34;
  }

  uint64_t v31 = (void *)v38[5];
  if (a7 && v31)
  {
    *a7 = v31;
    uint64_t v31 = (void *)v38[5];
  }

  BOOL v32 = v31 == 0LL;
  _Block_object_dispose(&v37, 8);

  return v32;
}

- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 error:(id *)a6
{
  return MEMORY[0x189616718](self, sel_updateKnownBSS_knownNetworkProfile_properties_OSSpecificKeys_error_, a3, a4, a5);
}

- (BOOL)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0LL;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_1864F00EC;
  id v35 = sub_1864F00FC;
  id v36 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 198, v11, v12))
  {
    XPCClient = self->_XPCClient;
    uint64_t v17 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_1864F9DF8;
    v30[3] = &unk_189E5D7F8;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472LL;
    v29[2] = sub_1864F9E08;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v31;
    objc_msgSend_addKnownBSS_knownNetworkProfile_requestParams_reply_( v18,  v24,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)v23,  v29);
  }

  else
  {
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v18 = (void *)v32[5];
    void v32[5] = v28;
  }

  BOOL v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = v25;
    BOOL v25 = (void *)v32[5];
  }

  BOOL v26 = v25 == 0LL;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (BOOL)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0LL;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_1864F00EC;
  id v35 = sub_1864F00FC;
  id v36 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 199, v11, v12))
  {
    XPCClient = self->_XPCClient;
    uint64_t v17 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_1864F9FD8;
    v30[3] = &unk_189E5D7F8;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472LL;
    v29[2] = sub_1864F9FE8;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v31;
    objc_msgSend_removeKnownBSS_knownNetworkProfile_requestParams_reply_( v18,  v24,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)v23,  v29);
  }

  else
  {
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v18 = (void *)v32[5];
    void v32[5] = v28;
  }

  BOOL v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = v25;
    BOOL v25 = (void *)v32[5];
  }

  BOOL v26 = v25 == 0LL;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (id)passwordForKnownNetworkProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_1864F00EC;
  v38 = sub_1864F00FC;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1864F00EC;
  BOOL v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 201, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864FA1BC;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864FA1CC;
    v26[3] = &unk_189E5E5B8;
    void v26[4] = &v34;
    void v26[5] = &v28;
    objc_msgSend_queryPasswordForKnownNetworkProfile_requestParams_reply_( v15,  v21,  (uint64_t)v6,  (uint64_t)v20,  (uint64_t)v26);
  }

  uint64_t v22 = (void *)v35[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v35[5];
  }

  if (v22) {
    uint64_t v23 = 0LL;
  }
  else {
    uint64_t v23 = (void *)v29[5];
  }
  id v24 = v23;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

- (BOOL)setPassword:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0LL;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_1864F00EC;
  id v35 = sub_1864F00FC;
  id v36 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 202, v11, v12))
  {
    XPCClient = self->_XPCClient;
    uint64_t v17 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_1864FA400;
    v30[3] = &unk_189E5D7F8;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472LL;
    v29[2] = sub_1864FA410;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v31;
    objc_msgSend_setPassword_knownNetworkProfile_requestParams_reply_( v18,  v24,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)v23,  v29);
  }

  else
  {
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v18 = (void *)v32[5];
    void v32[5] = v28;
  }

  BOOL v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = v25;
    BOOL v25 = (void *)v32[5];
  }

  BOOL v26 = v25 == 0LL;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (id)knownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1864F00EC;
  BOOL v25 = sub_1864F00FC;
  id v26 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 248, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5E5D8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_1864FA550;
    v20[3] = &unk_189E5DF98;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkInfoForLocalNetworkPromptWithOptions_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)networkServiceID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 120, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E5F8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FA6C0;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryNetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)networkServiceName
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 121, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E618, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FA830;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryNetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)isNetworkServiceEnabled
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 122, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E638, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FA97C;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryIsNetworkServiceEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  char v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)IPv4RouterAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 117, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E658, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FAACC;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryIPv4RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4Addresses
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 116, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E678, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FAC3C;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryIPv4AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4SubnetMasks
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 203, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E698, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FADAC;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryIPv4SubnetMasksWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4ARPResolvedHardwareAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 204, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E6B8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FAF1C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryIPv4ARPResolvedHardwareAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4ARPResolvedIPAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 205, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E6D8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB08C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryIPv4ARPResolvedIPAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6RouterAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 119, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E6F8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB1FC;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryIPv6RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6Addresses
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 118, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E718, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB36C;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryIPv6AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DNSServerAddresses
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 125, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E738, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB4DC;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryDNSServerAddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPLeaseStartedAt
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 123, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E758, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB64C;
    v18[3] = &unk_189E5E780;
    v18[4] = &v19;
    objc_msgSend_queryDHCPLeaseStartTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPLeaseExpiresAt
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 124, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E7A0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB7BC;
    v18[3] = &unk_189E5E780;
    v18[4] = &v19;
    objc_msgSend_queryDHCPLeaseExpirationTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPServerID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 206, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E7C0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FB92C;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryDHCPServerIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPv6ServerID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 207, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E7E0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FBA9C;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryDHCPv6ServerIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4NetworkSignature
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 208, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E800, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FBC0C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryIPv4NetworkSignatureWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6NetworkSignature
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 209, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E820, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FBD7C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryIPv6NetworkSignatureWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4InterfaceName
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 130, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E840, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FBEEC;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4InterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4NetworkServiceID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 128, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E860, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC05C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4NetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4NetworkServiceName
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 129, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E880, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC1CC;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4NetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4RouterAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 127, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E8A0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC33C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4Addresses
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 126, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E8C0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC4AC;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6InterfaceName
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 135, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E8E0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC61C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6InterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6NetworkServiceID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 133, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E900, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC78C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6NetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6NetworkServiceName
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 134, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E920, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FC8FC;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6NetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6RouterAddress
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 132, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E940, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FCA6C;
    v18[3] = &unk_189E5D910;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6Addresses
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 131, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E960, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FCBDC;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalDNSServerAddresses
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 136, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E980, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FCD4C;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryGlobalDNSServerAddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unsigned)reachabilityFlags
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 137, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E9A0, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FCE98;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryNetworkReachabilityWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  unsigned int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unsigned)EAP8021XSupplicantState
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1864F00EC;
  id v24 = sub_1864F00FC;
  id v25 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 138, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E9C0, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_1864FCFE8;
    v19[3] = &unk_189E5D860;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XSupplicantStateWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }

  unsigned int v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (unsigned)EAP8021XControlMode
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1864F00EC;
  id v24 = sub_1864F00FC;
  id v25 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 139, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5E9E0, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_1864FD158;
    v19[3] = &unk_189E5D860;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XControlModeWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }

  unsigned int v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (unsigned)EAP8021XControlState
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1864F00EC;
  id v24 = sub_1864F00FC;
  id v25 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 140, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EA00, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_1864FD2C8;
    v19[3] = &unk_189E5D860;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XControlStateWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }

  unsigned int v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (int)EAP8021XClientStatus
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1864F00EC;
  id v24 = sub_1864F00FC;
  id v25 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 141, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EA20, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = sub_1864FD438;
    v19[3] = &unk_189E5D860;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XClientStatusWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }

  int v17 = objc_msgSend_intValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1864F00EC;
  BOOL v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 66, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1864FD634;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1864FD644;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_startAWDLPeerAssistedDiscoveryWithParameters_requestParams_reply_( v15,  v21,  (uint64_t)v6,  (uint64_t)v20,  (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    void v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)stopAWDLPeerAssistedDiscovery
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 67, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EA40, v6, v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopAWDLPeerAssistedDiscoveryWithRequestParams_reply_( v15,  v13,  (uint64_t)v12,  (uint64_t)&unk_189E5EA60,  v14);
  }

- (BOOL)setAWDLPeerTrafficRegistration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_awdlServiceManager)
  {
    uint64_t v7 = (AWDLServiceDiscoveryManager *)objc_alloc_init(MEMORY[0x189612C38]);
    awdlServiceManager = self->_awdlServiceManager;
    self->_awdlServiceManager = v7;
  }

  char v24 = 0;
  id v9 = objc_alloc(MEMORY[0x189612C40]);
  uint64_t v14 = objc_msgSend_serializedRegistrationInfo(v6, v10, v11, v12, v13);
  isActive = (void *)objc_msgSend_initWithDictionary_isActive_(v9, v15, v14, (uint64_t)&v24, v16);
  if (isActive)
  {
    uint64_t v20 = self->_awdlServiceManager;
    if (v24) {
      char v21 = objc_msgSend_setTrafficRegistration_error_(v20, v17, (uint64_t)isActive, (uint64_t)a4, v18);
    }
    else {
      char v21 = objc_msgSend_clearTrafficRegistration_error_(v20, v17, (uint64_t)isActive, (uint64_t)a4, v18);
    }
    BOOL v22 = v21;
  }

  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v17, *MEMORY[0x189607688], 22, 0);
    BOOL v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)AWDLPreferredChannels
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 40, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EA80, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FD8F8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPreferredChannelsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncEnabled
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 39, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EAA0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FDA68;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncState
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 41, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EAC0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FDBD8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncChannelSequence
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 42, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EAE0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FDD48;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncChannelSequenceWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLStrategy
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 44, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EB00, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FDEB8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLStrategyWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionParameters
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 45, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EB20, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE028;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionParametersWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPeerDatabase
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 48, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EB40, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE198;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPeerDatabaseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSocialTimeSlots
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 49, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EB60, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE308;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSocialTimeSlotsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionID
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 46, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EB80, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE478;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionRSSIThresholds
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 47, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EBA0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE5E8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionRSSIThresholdsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLMasterChannel
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 50, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EBC0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE758;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLMasterChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSecondaryMasterChannel
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 51, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EBE0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FE8C8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSecondaryMasterChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLOpMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 52, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EC00, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FEA38;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLOpModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncParameters
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 43, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EC20, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FEBA8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncParametersWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLStatistics
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 53, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EC40, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FED18;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLStatisticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSidecarDiagnostics
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 146, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EC60, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FEE88;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSidecarDiagnosticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLExtensionStateMachineParameters
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 157, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EC80, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FEFF8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLExtensionStateMachineParamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionMetric
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 158, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ECA0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FF168;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPresenceMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 159, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ECC0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FF2D8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPresenceModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLGuardTime
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 160, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ECE0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FF448;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLGuardTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLAvailabilityWindowAPAlignment
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 161, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ED00, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FF5B8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLAvailabilityWindowAPAlignmentWithRequestParams_reply_( v8,  v14,  (uint64_t)v13,  (uint64_t)v18,  v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLContinuousElectionAlgorithmEnabled
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 162, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ED20, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FF728;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams_reply_( v8,  v14,  (uint64_t)v13,  (uint64_t)v18,  v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLAFTxMode
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 163, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ED40, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FF898;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLAFTxModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPeerTrafficRegistration
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 164, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ED60, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FFA08;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPeerTrafficRegistrationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLEncryptionType
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 165, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5ED80, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FFB78;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLEncryptionTypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLBTLEStateParameters
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 166, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EDA0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FFCE8;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryAWDLBTLEStateParamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)rangingCapabilities
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  BOOL v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 34, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EDC0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1864FFE58;
    v18[3] = &unk_189E5DB88;
    v18[4] = &v19;
    objc_msgSend_queryRangingCapabilitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setRangeable:(BOOL)a3 peerList:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_1864F00EC;
  uint64_t v34 = sub_1864F00FC;
  id v35 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 68, v10, v11))
  {
    XPCClient = self->_XPCClient;
    uint64_t v16 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_186500064;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472LL;
    v28[2] = sub_186500074;
    v28[3] = &unk_189E5D7F8;
    void v28[4] = &v30;
    objc_msgSend_setRangeable_peerList_requestParams_reply_(v17, v23, v6, (uint64_t)v8, (uint64_t)v22, v28);
  }

  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v12, *MEMORY[0x189607688], 45, 0);
    uint64_t v17 = (void *)v31[5];
    v31[5] = v27;
  }

  id v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    id v24 = (void *)v31[5];
  }

  BOOL v25 = v24 == 0LL;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 69, v11, v12))
  {
    XPCClient = self->_XPCClient;
    uint64_t v15 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_1865001F4;
    v30[3] = &unk_189E5D9C8;
    id v16 = v9;
    id v31 = v16;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v17, (uint64_t)v30, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v21, v22, v23, v24);
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472LL;
    v28[2] = sub_18650020C;
    v28[3] = &unk_189E5D9F0;
    id v29 = v16;
    objc_msgSend_performRangingWithPeerList_timeout_requestParams_reply_(v20, v26, (uint64_t)v8, a4, (uint64_t)v25, v28);
  }

  else if (v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void))v9 + 2))(v9, v27, 0LL);
  }
}

- (id)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  id v39 = sub_1864F00EC;
  v40 = sub_1864F00FC;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_1864F00EC;
  uint64_t v34 = sub_1864F00FC;
  id v35 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 69, v10, v11))
  {
    XPCClient = self->_XPCClient;
    uint64_t v16 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_186500414;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472LL;
    v28[2] = sub_186500424;
    v28[3] = &unk_189E5D9A0;
    void v28[4] = &v30;
    void v28[5] = &v36;
    objc_msgSend_performRangingWithPeerList_timeout_requestParams_reply_(v17, v23, (uint64_t)v8, a4, (uint64_t)v22, v28);
  }

  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v12, *MEMORY[0x189607688], 45, 0);
    uint64_t v17 = (void *)v31[5];
    v31[5] = v27;
  }

  if (a5)
  {
    uint64_t v24 = (void *)v31[5];
    if (v24) {
      *a5 = v24;
    }
  }

  id v25 = (id)v37[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v25;
}

- (BOOL)setRangingIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1864F00EC;
  uint64_t v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 174, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_18650063C;
    v27[3] = &unk_189E5D7F8;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_18650064C;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_setRangingIdentifier_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    void v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (id)performSensingWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = sub_1864F00EC;
  uint64_t v37 = sub_1864F00FC;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1864F00EC;
  id v31 = sub_1864F00FC;
  id v32 = 0LL;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 188, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_186500858;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v26, v10, v11);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472LL;
    v25[2] = sub_186500868;
    v25[3] = &unk_189E5EDE8;
    v25[4] = &v27;
    void v25[5] = &v33;
    objc_msgSend_performSensingWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }

  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v7, *MEMORY[0x189607688], 45, 0);
    uint64_t v14 = (void *)v28[5];
    void v28[5] = v24;
  }

  if (a4)
  {
    uint64_t v21 = (void *)v28[5];
    if (v21) {
      *a4 = v21;
    }
  }

  id v22 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

- (void)performSensingWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl()
    && objc_msgSend_allowRequestType_(self->_XPCClient, v8, 188, v9, v10))
  {
    XPCClient = self->_XPCClient;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_186500A54;
    v27[3] = &unk_189E5D9C8;
    id v13 = v7;
    id v28 = v13;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v14, (uint64_t)v27, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    v25[1] = 3221225472LL;
    v25[2] = sub_186500A6C;
    v25[3] = &unk_189E5EE10;
    id v26 = v13;
    objc_msgSend_performSensingWithParameters_requestParams_reply_(v17, v23, (uint64_t)v6, (uint64_t)v22, (uint64_t)v25);
  }

  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 45, 0);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void))v7 + 2))(v7, v24, 0LL);
  }
}

- (id)performNearbyDeviceDiscovery:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_1864F00EC;
  uint64_t v30 = sub_1864F00FC;
  uint64_t v5 = *MEMORY[0x189607688];
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], 61, 0);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 238, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_186500C3C;
    v25[3] = &unk_189E5D7F8;
    void v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v25, v10, v11);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472LL;
    v24[2] = sub_186500C4C;
    v24[3] = &unk_189E5D7F8;
    v24[4] = &v26;
    objc_msgSend_performNearbyDeviceDiscovery_requestParams_reply_(v14, v20, (uint64_t)v4, (uint64_t)v19, (uint64_t)v24);
  }

  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v7, v5, 45, 0);
    uint64_t v14 = (void *)v27[5];
    void v27[5] = v23;
  }

  id v21 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (id)cachedAutoJoinMetric
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 193, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EE30, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_186500D74;
    v18[3] = &unk_189E5EE58;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)autoJoinStatistics
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 194, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EE78, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_186500EE4;
    v18[3] = &unk_189E5EEA0;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinStatisticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)resetAutoJoinStatistics
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 195, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EEC0, v6, v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resetAutoJoinStatisticsWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_189E5EEE0, v14);
  }

- (id)userSettings
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 189, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EF00, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_1865010E4;
    v18[3] = &unk_189E5EF28;
    v18[4] = &v19;
    objc_msgSend_queryUserSettingsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)applyUserSettings:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_1864F00EC;
  uint64_t v35 = sub_1864F00FC;
  id v36 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 190, v11, v12))
  {
    XPCClient = self->_XPCClient;
    uint64_t v17 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_1865012FC;
    v30[3] = &unk_189E5D7F8;
    void v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472LL;
    v29[2] = sub_18650130C;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v31;
    objc_msgSend_setUserSettings_properties_requestParams_reply_(v18, v24, (uint64_t)v8, (uint64_t)v9, (uint64_t)v23, v29);
  }

  else
  {
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v18 = (void *)v32[5];
    void v32[5] = v28;
  }

  uint64_t v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = v25;
    uint64_t v25 = (void *)v32[5];
  }

  BOOL v26 = v25 == 0LL;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (BOOL)startHostAPModeWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1864F00EC;
  id v32 = sub_1864F00FC;
  id v33 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 220, v8, v9))
  {
    XPCClient = self->_XPCClient;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_1865014C0;
    v27[3] = &unk_189E5D7F8;
    void v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = sub_1865014D0;
    v26[3] = &unk_189E5D7F8;
    void v26[4] = &v28;
    objc_msgSend_startHostAPModeWithConfiguration_requestParams_reply_( v15,  v21,  (uint64_t)v6,  (uint64_t)v20,  (uint64_t)v26);
  }

  else
  {
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    uint64_t v15 = (void *)v29[5];
    void v29[5] = v25;
  }

  uint64_t v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = v22;
    uint64_t v22 = (void *)v29[5];
  }

  BOOL v23 = v22 == 0LL;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)stopHostAPMode
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 221, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EF48, v6, v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopHostAPModeWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_189E5EF68, v14);
  }

- (id)hostAPStationList
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  BOOL v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 233, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EF88, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_186501688;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryHostAPStationListWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)privateMACAddressForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1864F00EC;
  uint64_t v25 = sub_1864F00FC;
  id v26 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 222, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5EFA8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186501810;
    v20[3] = &unk_189E5D910;
    v20[4] = &v21;
    objc_msgSend_queryPrivateMACAddressForNetworkProfile_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 223, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5EFC8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186501974;
    v20[3] = &unk_189E5D860;
    v20[4] = &v21;
    objc_msgSend_queryPrivateMACAddressModeForNetworkProfile_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  int64_t v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_1864F00EC;
  uint64_t v34 = sub_1864F00FC;
  id v35 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 224, v10, v11))
  {
    XPCClient = self->_XPCClient;
    uint64_t v16 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_186501B60;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472LL;
    v28[2] = sub_186501B70;
    v28[3] = &unk_189E5D7F8;
    void v28[4] = &v30;
    objc_msgSend_setPrivateMACAddressMode_networkProfile_requestParams_reply_( v17,  v23,  a3,  (uint64_t)v8,  (uint64_t)v22,  v28);
  }

  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v12, *MEMORY[0x189607688], 45, 0);
    uint64_t v17 = (void *)v31[5];
    v31[5] = v27;
  }

  uint64_t v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    uint64_t v24 = (void *)v31[5];
  }

  BOOL v25 = v24 == 0LL;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (int64_t)privateMACAddressModeSystemSetting
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 225, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5EFE8, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_186501C74;
    v18[3] = &unk_189E5D860;
    v18[4] = &v19;
    objc_msgSend_queryPrivateMACAddressModeSystemSettingWithRequestParams_reply_( v8,  v14,  (uint64_t)v13,  (uint64_t)v18,  v15);
  }

  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setPrivateMACAddressModeSystemSetting:(int64_t)a3 error:(id *)a4
{
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_1864F00EC;
  uint64_t v30 = sub_1864F00FC;
  id v31 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 226, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_186501E48;
    v25[3] = &unk_189E5D7F8;
    void v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472LL;
    v24[2] = sub_186501E58;
    v24[3] = &unk_189E5D7F8;
    v24[4] = &v26;
    objc_msgSend_setPrivateMACAddressModeSystemSetting_requestParams_reply_(v13, v19, a3, (uint64_t)v18, (uint64_t)v24);
  }

  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v8, *MEMORY[0x189607688], 45, 0);
    uint64_t v13 = (void *)v27[5];
    void v27[5] = v23;
  }

  uint64_t v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = v20;
    uint64_t v20 = (void *)v27[5];
  }

  BOOL v21 = v20 == 0LL;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v6, 227, v7, v8))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v9, (uint64_t)&unk_189E5F008, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPrivateMACAddressUserJoinFailureUIState_networkProfile_requestParams_reply_( v12,  v18,  v4,  (uint64_t)v19,  (uint64_t)v17,  &unk_189E5F028);
  }
}

- (BOOL)isQuickProbeRequiredForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 228, v6, v7))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_189E5F048, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_186502014;
    v20[3] = &unk_189E5D860;
    v20[4] = &v21;
    objc_msgSend_queryIsQuickProbeRequiredForNetworkProfile_requestParams_reply_( v11,  v17,  (uint64_t)v4,  (uint64_t)v16,  (uint64_t)v20);
  }

  char v18 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_1864F00EC;
  uint64_t v34 = sub_1864F00FC;
  id v35 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 229, v10, v11))
  {
    XPCClient = self->_XPCClient;
    uint64_t v16 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = sub_186502200;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472LL;
    v28[2] = sub_186502210;
    v28[3] = &unk_189E5D7F8;
    void v28[4] = &v30;
    objc_msgSend_reportQuickProbeResult_networkProfile_requestParams_reply_( v17,  v23,  v6,  (uint64_t)v8,  (uint64_t)v22,  v28);
  }

  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v12, *MEMORY[0x189607688], 45, 0);
    uint64_t v17 = (void *)v31[5];
    v31[5] = v27;
  }

  char v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    char v24 = (void *)v31[5];
  }

  BOOL v25 = v24 == 0LL;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (id)getAutoJoinDenyList
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1864F00EC;
  uint64_t v23 = sub_1864F00FC;
  id v24 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 245, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_189E5F068, v6, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_186502338;
    v18[3] = &unk_189E5D958;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinDenyListWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_1864F00EC;
  uint64_t v27 = sub_1864F00FC;
  id v28 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 246, v8, v9))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v10, (uint64_t)&unk_189E5F088, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = sub_1865024E4;
    v22[3] = &unk_189E5D958;
    v22[4] = &v23;
    objc_msgSend_setAutoJoinDenyListForNetwork_reason_requestParams_reply_(v13, v19, (uint64_t)v6, a4, (uint64_t)v18, v22);
  }

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_1864F00EC;
  uint64_t v27 = sub_1864F00FC;
  id v28 = 0LL;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 247, v8, v9))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v10, (uint64_t)&unk_189E5F0A8, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = sub_186502690;
    v22[3] = &unk_189E5D958;
    v22[4] = &v23;
    objc_msgSend_clearAutoJoinDenyListForNetwork_reason_requestParams_reply_( v13,  v19,  (uint64_t)v6,  a4,  (uint64_t)v18,  v22);
  }

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (CWFXPCClient)XPCClient
{
  return self->_XPCClient;
}

- (CWFRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (AWDLServiceDiscoveryManager)awdlServiceManager
{
  return self->_awdlServiceManager;
}

- (void)setAwdlServiceManager:(id)a3
{
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (void).cxx_destruct
{
}

@end