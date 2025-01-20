@interface CWFXPCRequestProxy
- (BOOL)__allowXPCRequestWithoutAvailableInterface:(id)a3;
- (BOOL)__didFindMatching80211InterfaceForXPCRequest:(id)a3;
- (BOOL)isMonitoringEvents;
- (BOOL)isNon80211InterfaceName:(id)a3;
- (CWFPrivateMACManager)privateMACManager;
- (CWFXPCRequestProxy)init;
- (CWFXPCRequestProxyDelegate)delegate;
- (id)EAP8021XWithInterfaceName:(id)a3;
- (id)SCNetworkInterfaceWithInterfaceName:(id)a3;
- (id)SCNetworkServiceWithInterfaceName:(id)a3;
- (id)__EAP8021XWithInterfaceName:(id)a3;
- (id)__SCNetworkInterfaceWithInterfaceName:(id)a3;
- (id)__SCNetworkServiceWithInterfaceName:(id)a3;
- (id)__apple80211WithInterfaceName:(id)a3;
- (id)__apple80211WithVirtualInterfaceRole:(int)a3 parentInterfaceName:(id)a4;
- (id)__autojoinStatusWithInterfaceName:(id)a3;
- (id)__cachedKnownNetwork;
- (id)__currentNetworkProfileWithInterfaceName:(id)a3;
- (id)__currentScanResultWithInterfaceName:(id)a3 forceNoCache:(BOOL)a4;
- (id)__deviceUUID;
- (id)__hashedBSSID:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (id)__hashedSSID:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (id)__interfaceNames;
- (id)__interfaceSpecificEventIDs:(id)a3;
- (id)__joinStatusWithInterfaceName:(id)a3;
- (id)__knownNetworkProfiles;
- (id)__linkDownNetworkWithInterfaceName:(id)a3;
- (id)__linkDownStatusWithInterfaceName:(id)a3;
- (id)__linkQualityMetricWithInterfaceName:(id)a3;
- (id)__networkStackMACAddressWithInterfaceName:(id)a3;
- (id)__privateMACManager;
- (id)__queueForXPCRequest:(id)a3;
- (id)__roamStatusWithInterfaceName:(id)a3;
- (id)__userAutoJoinDisabled;
- (id)__vendorSpecificIdentifierForXPCConnection:(id)a3;
- (id)__virtualInterfaceNames;
- (id)__wifiInterfaceNames;
- (id)apple80211WithInterfaceName:(id)a3;
- (id)apple80211WithVirtualInterfaceRole:(int)a3 parentInterfaceName:(id)a4;
- (id)interfaceNames;
- (id)virtualInterfaceNames;
- (id)wifiInterfaceNames;
- (int)__defaultInterfaceRoleForRequestType:(int64_t)a3;
- (void)XPCManager:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5;
- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCManager:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5;
- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)XPCManager:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5;
- (void)__addJoinStatusWithScanResult:(id)a3 knownNetworkProfile:(id)a4 isAutoJoin:(BOOL)a5 interfaceName:(id)a6;
- (void)__addKnownNetwork:(id)a3 XPCConnection:(id)a4;
- (void)__autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4;
- (void)__autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4;
- (void)__cancelRequestsWithNamePrefix:(id)a3;
- (void)__currentScanResultWithInterfaceName:(id)a3 forceNoCache:(BOOL)a4 reply:(id)a5;
- (void)__disassocWithReason:(int64_t)a3 interfaceName:(id)a4;
- (void)__getActivities:(id)a3 XPCConnection:(id)a4;
- (void)__getApple80211:(id)a3;
- (void)__getAutoJoinStatus:(id)a3;
- (void)__getBSSID:(id)a3 XPCConnection:(id)a4;
- (void)__getBSSIDForVendor:(id)a3 XPCConnection:(id)a4;
- (void)__getCurrentScanResult:(id)a3 XPCConnection:(id)a4;
- (void)__getCurrentScanResult:(id)a3 XPCConnection:(id)a4 reply:(id)a5;
- (void)__getDHCPLeaseExpirationTime:(id)a3;
- (void)__getDHCPLeaseStartTime:(id)a3;
- (void)__getDHCPServerID:(id)a3;
- (void)__getDHCPv6ServerID:(id)a3;
- (void)__getDNSServerAddresses:(id)a3;
- (void)__getEAP8021XClientStatus:(id)a3;
- (void)__getEAP8021XControlMode:(id)a3;
- (void)__getEAP8021XControlState:(id)a3;
- (void)__getEAP8021XSupplicantState:(id)a3;
- (void)__getEventIDs:(id)a3 XPCConnection:(id)a4;
- (void)__getGlobalDNSServerAddresses:(id)a3;
- (void)__getGlobalIPv4Addresses:(id)a3;
- (void)__getGlobalIPv4InterfaceName:(id)a3;
- (void)__getGlobalIPv4NetServiceID:(id)a3;
- (void)__getGlobalIPv4NetServiceName:(id)a3;
- (void)__getGlobalIPv4Router:(id)a3;
- (void)__getGlobalIPv6Addresses:(id)a3;
- (void)__getGlobalIPv6InterfaceName:(id)a3;
- (void)__getGlobalIPv6NetServiceID:(id)a3;
- (void)__getGlobalIPv6NetServiceName:(id)a3;
- (void)__getGlobalIPv6Router:(id)a3;
- (void)__getHardwareMACAddress:(id)a3;
- (void)__getIO80211ControllerInfo:(id)a3;
- (void)__getIO80211InterfaceInfo:(id)a3;
- (void)__getIPv4ARPResolvedHardwareAddress:(id)a3;
- (void)__getIPv4ARPResolvedIPAddress:(id)a3;
- (void)__getIPv4Addresses:(id)a3;
- (void)__getIPv4NetworkSignature:(id)a3;
- (void)__getIPv4Router:(id)a3;
- (void)__getIPv4SubnetMasks:(id)a3;
- (void)__getIPv6Addresses:(id)a3;
- (void)__getIPv6NetworkSignature:(id)a3;
- (void)__getIPv6Router:(id)a3;
- (void)__getJoinStatus:(id)a3;
- (void)__getKnownNetworkInfoForLocalNetworkPrompt:(id)a3 XPCConnection:(id)a4;
- (void)__getKnownNetworkMatchingNetworkProfile:(id)a3;
- (void)__getKnownNetworkMatchingScanResult:(id)a3;
- (void)__getLinkDownStatus:(id)a3;
- (void)__getLinkQualityMetric:(id)a3;
- (void)__getMACAddress:(id)a3;
- (void)__getNetServiceEnabled:(id)a3;
- (void)__getNetServiceID:(id)a3;
- (void)__getNetServiceName:(id)a3;
- (void)__getNetworkReachability:(id)a3;
- (void)__getPlatformCapabilities:(id)a3;
- (void)__getPrivateMACAddress:(id)a3;
- (void)__getPrivateMACAddressMode:(id)a3;
- (void)__getPrivateMACAddressModeSystemSetting:(id)a3;
- (void)__getQuickProbeRequired:(id)a3;
- (void)__getRoamStatus:(id)a3;
- (void)__getSSID:(id)a3 XPCConnection:(id)a4;
- (void)__getSSIDForVendor:(id)a3 XPCConnection:(id)a4;
- (void)__getSecurity:(id)a3;
- (void)__getSystemActivities:(id)a3 XPCManager:(id)a4;
- (void)__getSystemEventIDs:(id)a3 XPCManager:(id)a4;
- (void)__getWAPISubtype:(id)a3;
- (void)__getWEPSubtype:(id)a3;
- (void)__getWiFiUIStateFlags:(id)a3;
- (void)__handleAssocDoneInternalEvent:(id)a3;
- (void)__handleAutoJoinStateChangedInternalEvent:(id)a3;
- (void)__handleKnownNetworkProfileChangedEvent:(id)a3;
- (void)__handleWillAssocInternalEvent:(id)a3;
- (void)__logLqmSummary:(id)a3;
- (void)__performAutoJoinWithParameters:(id)a3 interfaceName:(id)a4;
- (void)__performScan:(id)a3 XPCConnection:(id)a4;
- (void)__privateMACEvaluationCheckConnectivity;
- (void)__privateMACEvaluationCompletedWithState:(int64_t)a3 knownNetwork:(id)a4 interfaceName:(id)a5;
- (void)__privateMACSettingChangedForNetworkProfile:(id)a3 interfaceName:(id)a4;
- (void)__reportQuickProbeResult:(id)a3;
- (void)__setAutoJoinStatus:(id)a3 interfaceName:(id)a4;
- (void)__setCachedKnownNetwork:(id)a3;
- (void)__setChannel:(id)a3;
- (void)__setJoinStatus:(id)a3 interfaceName:(id)a4;
- (void)__setLQMConfig:(id)a3;
- (void)__setLinkDownStatus:(id)a3 interfaceName:(id)a4;
- (void)__setLinkQualityMetric:(id)a3 interfaceName:(id)a4;
- (void)__setPrivateMACAddressMode:(id)a3;
- (void)__setPrivateMACAddressModeSystemSetting:(id)a3;
- (void)__setPrivateMACAddressUserJoinFailureUIState:(id)a3;
- (void)__setRoamStatus:(id)a3 interfaceName:(id)a4;
- (void)__setupEventHandlers;
- (void)__setupEventHandlersWithInterfaceName:(id)a3;
- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4;
- (void)__startMonitoringDefaultEventIDs;
- (void)__startMonitoringDefaultEventIDsForInterfaceName:(id)a3;
- (void)__startNetworkRelayBridgeWithHostAPConfiguration:(id)a3 interfaceName:(id)a4 reply:(id)a5;
- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4;
- (void)__stopMonitoringDefaultEventIDs;
- (void)__stopMonitoringDefaultEventIDsForInterfaceName:(id)a3;
- (void)__stopNetworkRelayBridgeForInterfaceName:(id)a3 reply:(id)a4;
- (void)__updateAutoJoinState:(int64_t)a3 interfaceName:(id)a4;
- (void)__updateAutoJoinStatusWithJoin:(id)a3;
- (void)__updateCurrentKnownBSSWithIPConfigurationForInterfaceName:(id)a3;
- (void)__updateEventMonitoring:(id)a3;
- (void)__updateEventRegistration:(id)a3 XPCManager:(id)a4;
- (void)__updateJoinStatusWithAssoc:(id)a3;
- (void)__updateJoinStatusWithAuth:(id)a3;
- (void)__updateJoinStatusWithEAP8021X:(id)a3;
- (void)__updateJoinStatusWithError:(id)a3 interaceName:(id)a4;
- (void)__updateJoinStatusWithIPv4:(id)a3;
- (void)__updateJoinStatusWithIPv6:(id)a3;
- (void)__updateJoinStatusWithLinkUp:(id)a3;
- (void)__updateMonitoring:(BOOL)a3 eventIDs:(id)a4;
- (void)__updateNetworkProfile:(id)a3 updateProperties:(id)a4 interfaceName:(id)a5 reply:(id)a6;
- (void)__updateWiFiNetworkInterfaces:(id)a3 reply:(id)a4;
- (void)__updateWiFiNetworkServices;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFXPCRequestProxy

- (CWFXPCRequestProxy)init
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  v113.receiver = self;
  v113.super_class = (Class)&OBJC_CLASS___CWFXPCRequestProxy;
  v5 = -[CWFXPCRequestProxy init](&v113, sel_init);
  if (!v5)
  {
    v109 = 0LL;
    v75 = 0LL;
    goto LABEL_31;
  }

  id v6 = objc_msgSend_stringWithFormat_(NSString, v2, (uint64_t)@"com.apple.corewifi.XPC-common-mutex", v3, v4);
  v11 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
  mutexQueue = v5->_mutexQueue;
  v5->_mutexQueue = (OS_dispatch_queue *)v13;

  if (!v5->_mutexQueue) {
    goto LABEL_32;
  }
  id v18 = objc_msgSend_stringWithFormat_( NSString,  v15,  (uint64_t)@"com.apple.corewifi.XPC-common-event",  v16,  v17);
  v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
  eventQueue = v5->_eventQueue;
  v5->_eventQueue = (OS_dispatch_queue *)v25;

  if (!v5->_eventQueue) {
    goto LABEL_32;
  }
  id v30 = objc_msgSend_stringWithFormat_( NSString,  v27,  (uint64_t)@"com.apple.corewifi.XPC-common-intf",  v28,  v29);
  v35 = (const char *)objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v36 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v37 = dispatch_queue_create(v35, v36);
  interfaceQueue = v5->_interfaceQueue;
  v5->_interfaceQueue = (OS_dispatch_queue *)v37;

  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableLinkDownStatusMap = v5->_mutableLinkDownStatusMap;
  v5->_mutableLinkDownStatusMap = v39;

  if (!v5->_mutableLinkDownStatusMap) {
    goto LABEL_32;
  }
  v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableLinkDownNetworkMap = v5->_mutableLinkDownNetworkMap;
  v5->_mutableLinkDownNetworkMap = v41;

  if (!v5->_mutableLinkDownNetworkMap) {
    goto LABEL_32;
  }
  v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableRoamStatusMap = v5->_mutableRoamStatusMap;
  v5->_mutableRoamStatusMap = v43;

  if (!v5->_mutableRoamStatusMap) {
    goto LABEL_32;
  }
  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableJoinStatusMap = v5->_mutableJoinStatusMap;
  v5->_mutableJoinStatusMap = v45;

  if (!v5->_mutableJoinStatusMap) {
    goto LABEL_32;
  }
  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableAutoJoinTriggerMap = v5->_mutableAutoJoinTriggerMap;
  v5->_mutableAutoJoinTriggerMap = v47;

  if (!v5->_mutableAutoJoinTriggerMap) {
    goto LABEL_32;
  }
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableAutoJoinStatusMap = v5->_mutableAutoJoinStatusMap;
  v5->_mutableAutoJoinStatusMap = v49;

  if (!v5->_mutableAutoJoinStatusMap) {
    goto LABEL_32;
  }
  v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableLinkQualityMap = v5->_mutableLinkQualityMap;
  v5->_mutableLinkQualityMap = v51;

  if (!v5->_mutableLinkQualityMap) {
    goto LABEL_32;
  }
  v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableQueueMap = v5->_mutableQueueMap;
  v5->_mutableQueueMap = v53;

  if (!v5->_mutableQueueMap) {
    goto LABEL_32;
  }
  v55 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x189607988]);
  defaultQueue = v5->_defaultQueue;
  v5->_defaultQueue = v55;

  v60 = v5->_defaultQueue;
  if (!v60
    || (objc_msgSend_setName_(v60, v57, (uint64_t)@"default-concurrent", v58, v59),
        objc_msgSend_setMaxConcurrentOperationCount_(v5->_defaultQueue, v61, -1, v62, v63),
        objc_msgSend_setQualityOfService_(v5->_defaultQueue, v64, -1, v65, v66),
        v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]),
        apple80211Map = v5->_apple80211Map,
        v5->_apple80211Map = v67,
        apple80211Map,
        !v5->_apple80211Map))
  {
LABEL_32:
    v75 = 0LL;
LABEL_33:
    v109 = (os_log_s *)v5;
    v5 = 0LL;
    goto LABEL_31;
  }

  v69 = objc_alloc(&OBJC_CLASS___CWFApple80211);
  v75 = (void *)objc_msgSend_initWithInterfaceName_(v69, v70, 0, v71, v72);
  if (!v75) {
    goto LABEL_33;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5->_apple80211Map, v73, (uint64_t)v75, (uint64_t)&stru_189E65678, v74);
  v76 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  nonApple80211InterfaceList = v5->_nonApple80211InterfaceList;
  v5->_nonApple80211InterfaceList = v76;

  if (!v5->_nonApple80211InterfaceList) {
    goto LABEL_33;
  }
  v78 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  apple80211EligibleRemovalList = v5->_apple80211EligibleRemovalList;
  v5->_apple80211EligibleRemovalList = v78;

  if (!v5->_apple80211EligibleRemovalList) {
    goto LABEL_33;
  }
  v80 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  EAP8021XMap = v5->_EAP8021XMap;
  v5->_EAP8021XMap = v80;

  if (!v5->_EAP8021XMap) {
    goto LABEL_33;
  }
  v82 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  SCNetworkServiceMap = v5->_SCNetworkServiceMap;
  v5->_SCNetworkServiceMap = v82;

  if (!v5->_SCNetworkServiceMap) {
    goto LABEL_33;
  }
  v84 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  SCNetworkInterfaceMap = v5->_SCNetworkInterfaceMap;
  v5->_SCNetworkInterfaceMap = v84;

  if (!v5->_SCNetworkInterfaceMap) {
    goto LABEL_33;
  }
  v86 = objc_alloc_init(&OBJC_CLASS___CWFSCNetworkConfiguration);
  SCNetworkConfiguration = v5->_SCNetworkConfiguration;
  v5->_SCNetworkConfiguration = v86;

  if (!v5->_SCNetworkConfiguration) {
    goto LABEL_33;
  }
  v88 = objc_alloc_init(&OBJC_CLASS___CWFSCNetworkReachability);
  SCNetworkReachability = v5->_SCNetworkReachability;
  v5->_SCNetworkReachability = v88;

  if (!v5->_SCNetworkReachability) {
    goto LABEL_33;
  }
  v90 = objc_alloc_init(&OBJC_CLASS___CWFIO80211);
  IO80211 = v5->_IO80211;
  v5->_IO80211 = v90;

  if (!v5->_IO80211) {
    goto LABEL_33;
  }
  v92 = objc_alloc_init(&OBJC_CLASS___CWFKernelEventMonitor);
  keventMonitor = v5->_keventMonitor;
  v5->_keventMonitor = v92;

  if (!v5->_keventMonitor) {
    goto LABEL_33;
  }
  v94 = objc_alloc(&OBJC_CLASS___CWFXPCConnection);
  CWFBootArgs();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v97 = objc_msgSend_initWithServiceType_XPCConnection_bootArgs_(v94, v96, 1, 0, (uint64_t)v95);
  internalRequestXPCConnection = v5->_internalRequestXPCConnection;
  v5->_internalRequestXPCConnection = (CWFXPCConnection *)v97;

  objc_msgSend___setupEventHandlers(v5, v99, v100, v101, v102);
  objc_msgSend_startEventMonitoring(v5->_keventMonitor, v103, v104, v105, v106);
  __uint64_t v107 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    CWFGetOSLog();
    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v109 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v110 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v111 = v5->_keventMonitor;
    int v114 = 134219266;
    unint64_t v115 = v107 / 0x3B9ACA00;
    __int16 v116 = 2048;
    unint64_t v117 = v107 % 0x3B9ACA00 / 0x3E8;
    __int16 v118 = 2082;
    v119 = "-[CWFXPCRequestProxy init]";
    __int16 v120 = 2082;
    v121 = "CWFXPCRequestProxy.m";
    __int16 v122 = 1024;
    int v123 = 228;
    __int16 v124 = 2048;
    v125 = v111;
    _os_log_send_and_compose_impl();
  }

- (void)XPCManager:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  uint64_t v13 = objc_msgSend_type(v7, v9, v10, v11, v12);
  if (v13 == 30)
  {
    objc_msgSend___handleKnownNetworkProfileChangedEvent_(self, v14, (uint64_t)v7, v16, v17);
LABEL_8:
    objc_msgSend_delegate(self, v14, v15, v16, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      CWFGetOSLog();
      dispatch_queue_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        CWFGetOSLog();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v26 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v27 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      unint64_t v32 = objc_msgSend_type(v7, v28, v29, v30, v31);
      sub_186451AFC(v32, v33, v34, v35, v36);
      dispatch_queue_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

- (int)__defaultInterfaceRoleForRequestType:(int64_t)a3
{
  int result = 0;
  return result;
}

- (id)__queueForXPCRequest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C1CFC;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)__didFindMatching80211InterfaceForXPCRequest:(id)a3
{
  uint64_t v329 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v307 = 0LL;
  v308 = &v307;
  uint64_t v309 = 0x3032000000LL;
  v310 = sub_1864C1CE4;
  v311 = sub_1864C1CF4;
  id v312 = 0LL;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestParameters(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = objc_msgSend_virtualInterfaceRole(v19, v20, v21, v22, v23);

  if (v14)
  {
    uint64_t v29 = objc_msgSend_apple80211WithInterfaceName_(self, v25, (uint64_t)v14, v27, v28);
    uint64_t v30 = (os_log_s *)v308[5];
    v308[5] = v29;
  }

  else
  {
    if (!v24)
    {
      uint64_t v31 = objc_msgSend_type(v4, v25, v26, v27, v28);
      uint64_t v35 = objc_msgSend___defaultInterfaceRoleForRequestType_(self, v32, v31, v33, v34);
      objc_msgSend_requestParameters(v4, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVirtualInterfaceRole_(v40, v41, v35, v42, v43);

      __uint64_t v44 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        CWFGetOSLog();
        uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v46 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v47 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_requestParameters(v4, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v57 = objc_msgSend_virtualInterfaceRole(v52, v53, v54, v55, v56);
        sub_1864536D0(v57, v58, v59, v60, v61);
        id v62 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v67 = objc_msgSend_type(v4, v63, v64, v65, v66);
        sub_1864504C4(v67, v68, v69, v70, v71);
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
        int v313 = 134219522;
        unint64_t v314 = v44 / 0x3B9ACA00;
        __int16 v315 = 2048;
        unint64_t v316 = v44 % 0x3B9ACA00 / 0x3E8;
        __int16 v317 = 2082;
        v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
        __int16 v319 = 2082;
        v320 = "CWFXPCRequestProxy.m";
        __int16 v321 = 1024;
        int v322 = 404;
        __int16 v323 = 2114;
        uint64_t v324 = (uint64_t)v62;
        __int16 v325 = 2114;
        id v326 = v72;
        int v291 = 68;
        v290 = &v313;
        _os_log_send_and_compose_impl();
      }
    }

    objc_msgSend_requestParameters(v4, v25, v26, v27, v28, v290, v291);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = objc_msgSend_virtualInterfaceRole(v73, v74, v75, v76, v77);
    uint64_t v81 = objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v79, v78, 0, v80);
    v82 = (void *)v308[5];
    v308[5] = v81;

    objc_msgSend_interfaceName((void *)v308[5], v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestParameters(v4, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterfaceName_(v92, v93, (uint64_t)v87, v94, v95);

    __uint64_t v96 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      CWFGetOSLog();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v30 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v98 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_requestParameters(v4, v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceName(v103, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestParameters(v4, v109, v110, v111, v112);
      objc_super v113 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v118 = objc_msgSend_virtualInterfaceRole(v113, v114, v115, v116, v117);
      sub_1864536D0(v118, v119, v120, v121, v122);
      int v123 = (void *)objc_claimAutoreleasedReturnValue();
      int v313 = 134219522;
      unint64_t v314 = v96 / 0x3B9ACA00;
      __int16 v315 = 2048;
      unint64_t v316 = v96 % 0x3B9ACA00 / 0x3E8;
      __int16 v317 = 2082;
      v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
      __int16 v319 = 2082;
      v320 = "CWFXPCRequestProxy.m";
      __int16 v321 = 1024;
      int v322 = 411;
      __int16 v323 = 2114;
      uint64_t v324 = (uint64_t)v108;
      __int16 v325 = 2114;
      id v326 = v123;
      _os_log_send_and_compose_impl();
    }
  }

  uint64_t v128 = v308[5];
  if (!v128 && !v24)
  {
    objc_msgSend_requestParameters(v4, v124, v125, v126, v127);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v129, v130, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    int isNon80211InterfaceName = objc_msgSend_isNon80211InterfaceName_(self, v135, (uint64_t)v134, v136, v137);

    if (isNon80211InterfaceName)
    {
      __uint64_t v139 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      if (v140)
      {
        CWFGetOSLog();
        v141 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v141 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v148 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_requestParameters(v4, v149, v150, v151, v152);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_interfaceName(v296, v153, v154, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestParameters(v4, v158, v159, v160, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v167 = objc_msgSend_virtualInterfaceRole(v162, v163, v164, v165, v166);
        sub_1864536D0(v167, v168, v169, v170, v171);
        id v172 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v4, v173, v174, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v177, v178, v179, v180, v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v182, v183, 5, v184, v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        int v313 = 134219778;
        unint64_t v314 = v139 / 0x3B9ACA00;
        __int16 v315 = 2048;
        unint64_t v316 = v139 % 0x3B9ACA00 / 0x3E8;
        __int16 v317 = 2082;
        v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
        __int16 v319 = 2082;
        v320 = "CWFXPCRequestProxy.m";
        __int16 v321 = 1024;
        int v322 = 429;
        __int16 v323 = 2114;
        uint64_t v324 = (uint64_t)v157;
        __int16 v325 = 2114;
        id v326 = v172;
        __int16 v327 = 2114;
        v328 = v186;
        _os_log_send_and_compose_impl();
      }
    }

    else
    {
      interfaceQueue = (dispatch_queue_s *)self->_interfaceQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864C2CCC;
      block[3] = &unk_189E5CFE0;
      v143 = v14;
      v306 = &v307;
      v303 = v143;
      v304 = self;
      id v144 = v4;
      id v305 = v144;
      dispatch_sync(interfaceQueue, block);
      if (!v308[5])
      {
        uint64_t v295 = (uint64_t)v143;
        __uint64_t v145 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (v146)
        {
          CWFGetOSLog();
          v147 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v147 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v187 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_requestParameters(v144, v188, v189, v190, v191);
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_interfaceName(v294, v192, v193, v194, v195);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_requestParameters(v144, v196, v197, v198, v199);
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v204 = objc_msgSend_virtualInterfaceRole(v293, v200, v201, v202, v203);
          sub_1864536D0(v204, v205, v206, v207, v208);
          id v209 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v144, v210, v211, v212, v213);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUIDString(v214, v215, v216, v217, v218);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_substringToIndex_(v219, v220, 5, v221, v222);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          int v313 = 134219778;
          unint64_t v314 = v145 / 0x3B9ACA00;
          __int16 v315 = 2048;
          unint64_t v316 = v145 % 0x3B9ACA00 / 0x3E8;
          __int16 v317 = 2082;
          v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
          __int16 v319 = 2082;
          v320 = "CWFXPCRequestProxy.m";
          __int16 v321 = 1024;
          int v322 = 448;
          __int16 v323 = 2114;
          uint64_t v324 = (uint64_t)v292;
          __int16 v325 = 2114;
          id v326 = v209;
          __int16 v327 = 2114;
          v328 = v223;
          _os_log_send_and_compose_impl();
        }

        v300[0] = 0LL;
        v300[1] = v300;
        v300[2] = 0x2020000000LL;
        int v301 = 0;
        dispatch_block_t v224 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5D000);
        v297[0] = MEMORY[0x1895F87A8];
        v297[1] = 3221225472LL;
        v297[2] = sub_1864C2D68;
        v297[3] = &unk_189E5D028;
        v299 = v300;
        id v225 = v224;
        id v298 = v225;
        objc_msgSend___updateWiFiNetworkInterfaces_reply_( self,  v226,  (uint64_t)@"CoreWiFi API force refresh",  (uint64_t)v297,  v227);
        dispatch_block_wait(v225, 0xFFFFFFFFFFFFFFFFLL);
        if (v14)
        {
          uint64_t v232 = objc_msgSend_apple80211WithInterfaceName_(self, v228, v295, v230, v231);
          v233 = (void *)v308[5];
          v308[5] = v232;
        }

        else
        {
          objc_msgSend_requestParameters(v144, v228, v229, v230, v231);
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v238 = objc_msgSend_virtualInterfaceRole(v233, v234, v235, v236, v237);
          uint64_t v241 = objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v239, v238, 0, v240);
          v242 = (void *)v308[5];
          v308[5] = v241;
        }

        if (v308[5])
        {
          __uint64_t v243 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          if (v244)
          {
            CWFGetOSLog();
            v245 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v245 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v248 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
          {
            sub_1864536D0(0LL, v249, v250, v251, v252);
            id v253 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUID(v144, v254, v255, v256, v257);
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUIDString(v258, v259, v260, v261, v262);
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substringToIndex_(v263, v264, 5, v265, v266);
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            int v313 = 134219778;
            unint64_t v314 = v243 / 0x3B9ACA00;
            __int16 v315 = 2048;
            unint64_t v316 = v243 % 0x3B9ACA00 / 0x3E8;
            __int16 v317 = 2082;
            v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
            __int16 v319 = 2082;
            v320 = "CWFXPCRequestProxy.m";
            __int16 v321 = 1024;
            int v322 = 468;
            __int16 v323 = 2114;
            uint64_t v324 = v295;
            __int16 v325 = 2114;
            id v326 = v253;
            __int16 v327 = 2114;
            v328 = v267;
            _os_log_send_and_compose_impl();
          }
        }

        else
        {
          __uint64_t v246 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          if (v247)
          {
            CWFGetOSLog();
            v245 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v245 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v268 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
          {
            sub_1864536D0(0LL, v269, v270, v271, v272);
            id v273 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUID(v144, v274, v275, v276, v277);
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUIDString(v278, v279, v280, v281, v282);
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substringToIndex_(v283, v284, 5, v285, v286);
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            int v313 = 134219778;
            unint64_t v314 = v246 / 0x3B9ACA00;
            __int16 v315 = 2048;
            unint64_t v316 = v246 % 0x3B9ACA00 / 0x3E8;
            __int16 v317 = 2082;
            v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
            __int16 v319 = 2082;
            v320 = "CWFXPCRequestProxy.m";
            __int16 v321 = 1024;
            int v322 = 472;
            __int16 v323 = 2114;
            uint64_t v324 = v295;
            __int16 v325 = 2114;
            id v326 = v273;
            __int16 v327 = 2114;
            v328 = v287;
            _os_log_send_and_compose_impl();
          }
        }

        _Block_object_dispose(v300, 8);
      }

      v141 = v303;
    }

    uint64_t v128 = v308[5];
  }

  BOOL v288 = v128 != 0;

  _Block_object_dispose(&v307, 8);
  return v288;
}

- (BOOL)__allowXPCRequestWithoutAvailableInterface:(id)a3
{
  id v3 = a3;
  objc_msgSend_type(v3, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_type(v3, v8, v9, v10, v11);
  if ((sub_186451B94(v12) & 1) != 0)
  {
    BOOL v17 = 1;
  }

  else
  {
    uint64_t v18 = objc_msgSend_type(v3, v13, v14, v15, v16);
    BOOL v17 = sub_186451B4C(v18);
  }

  return v17;
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  location[3] = *(id *)MEMORY[0x1895F89C0];
  id v123 = a3;
  id v124 = a4;
  id v8 = a5;
  objc_msgSend_requestParameters(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v13, v14, v15, v16, v17);
  uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestParameters(v8, v18, v19, v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v27 = objc_msgSend_virtualInterfaceRole(v22, v23, v24, v25, v26);

  if (objc_msgSend___allowXPCRequestWithoutAvailableInterface_(self, v28, (uint64_t)v8, v29, v30))
  {
    CWFGetOSLog();
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      CWFGetOSLog();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v35 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v40 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  int Matching80211InterfaceForXPCRequest = objc_msgSend___didFindMatching80211InterfaceForXPCRequest_( self,  v31,  (uint64_t)v8,  v32,  v33);
  uint64_t v37 = CWFGetOSLog();
  uint64_t v38 = (void *)v37;
  if (Matching80211InterfaceForXPCRequest)
  {
    if (v37)
    {
      CWFGetOSLog();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v35 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v45 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
LABEL_14:
    objc_msgSend_UUID(v8, v41, v42, v43, v44);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v46, v47, v48, v49, v50);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v51, v52, 5, v53, v54);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v55;
    LODWORD(v121) = 12;
    uint64_t v120 = location;
    _os_log_send_and_compose_impl();

LABEL_15:
    objc_msgSend___queueForXPCRequest_(self, v56, (uint64_t)v8, v57, v58);
    uint64_t v59 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, v8);
    v130[0] = MEMORY[0x1895F87A8];
    v130[1] = 3221225472LL;
    v130[2] = sub_1864C3394;
    v130[3] = &unk_189E5D050;
    uint64_t v122 = &v134;
    objc_copyWeak(&v134, location);
    v130[4] = self;
    id v131 = v124;
    id v132 = v123;
    id v133 = v125;
    int v135 = v27;
    objc_msgSend_addExecutionBlock_(v8, v60, (uint64_t)v130, v61, v62);
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    objc_msgSend_operations(v59, v63, v64, v65, v66);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v126, (uint64_t)v136, 16);
    if (v73)
    {
      uint64_t v74 = *(void *)v127;
      do
      {
        for (uint64_t i = 0LL; i != v73; ++i)
        {
          if (*(void *)v127 != v74) {
            objc_enumerationMutation(v67);
          }
          uint64_t v76 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          objc_msgSend_name(v76, v69, v70, v71, v72, v120, v121, v122);
          uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v82 = objc_msgSend_type(v8, v78, v79, v80, v81);
          sub_1864504C4(v82, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          int hasSuffix = objc_msgSend_hasSuffix_(v77, v88, (uint64_t)v87, v89, v90);

          if (hasSuffix) {
            objc_msgSend_addDependency_(v8, v69, (uint64_t)v76, v71, v72);
          }
        }

        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v69, (uint64_t)&v126, (uint64_t)v136, 16);
      }

      while (v73);
    }

    objc_msgSend_addOperation_(v59, v92, (uint64_t)v8, v93, v94);
    objc_destroyWeak(v122);
    objc_destroyWeak(location);
    goto LABEL_25;
  }

  if (v37)
  {
    CWFGetOSLog();
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v39 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v95 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_UUID(v8, v96, v97, v98, v99);
    uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v100, v101, v102, v103, v104);
    uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v105, v106, 5, v107, v108);
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_response(v8, v109, v110, v111, v112);
  objc_super v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (v113)
  {
    objc_msgSend_response(v8, v114, v115, v116, v117);
    uint64_t v59 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v118, *MEMORY[0x189607688], 45, 0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v59)[2](v59, v119, 0LL);

LABEL_25:
  }
}

- (void)__cancelRequestsWithNamePrefix:(id)a3
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v61 = self;
  objc_msgSend_allValues(self->_mutableQueueMap, v5, v6, v7, v8);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v80, (uint64_t)v87, 16);
  if (v64)
  {
    uint64_t v63 = *(void *)v81;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v81 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = v14;
        uint64_t v15 = *(void **)(*((void *)&v80 + 1) + 8 * v14);
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        objc_msgSend_allValues(v15, v10, v11, v12, v13);
        id v66 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v16, (uint64_t)&v76, (uint64_t)v86, 16);
        if (v17)
        {
          uint64_t v22 = v17;
          uint64_t v67 = *(void *)v77;
          do
          {
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v77 != v67) {
                objc_enumerationMutation(v66);
              }
              uint64_t v24 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              __int128 v72 = 0u;
              __int128 v73 = 0u;
              __int128 v74 = 0u;
              __int128 v75 = 0u;
              objc_msgSend_operations(v24, v18, v19, v20, v21);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v72, (uint64_t)v85, 16);
              if (v27)
              {
                uint64_t v32 = v27;
                uint64_t v33 = *(void *)v73;
                do
                {
                  for (uint64_t j = 0LL; j != v32; ++j)
                  {
                    if (*(void *)v73 != v33) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v35 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                    objc_msgSend_name(v35, v28, v29, v30, v31);
                    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                    int hasPrefix = objc_msgSend_hasPrefix_(v36, v37, (uint64_t)v4, v38, v39);

                    if (hasPrefix) {
                      objc_msgSend_cancel(v35, v28, v29, v30, v31);
                    }
                  }

                  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_( v25,  v28,  (uint64_t)&v72,  (uint64_t)v85,  16);
                }

                while (v32);
              }
            }

            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v18, (uint64_t)&v76, (uint64_t)v86, 16);
          }

          while (v22);
        }

        uint64_t v14 = v65 + 1;
      }

      while (v65 + 1 != v64);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v80, (uint64_t)v87, 16);
    }

    while (v64);
  }

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  objc_msgSend_operations(v61->_defaultQueue, v41, v42, v43, v44);
  id v45 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v68, (uint64_t)v84, 16);
  if (v47)
  {
    uint64_t v52 = v47;
    uint64_t v53 = *(void *)v69;
    do
    {
      for (uint64_t k = 0LL; k != v52; ++k)
      {
        if (*(void *)v69 != v53) {
          objc_enumerationMutation(v45);
        }
        uint64_t v55 = *(void **)(*((void *)&v68 + 1) + 8 * k);
        objc_msgSend_name(v55, v48, v49, v50, v51);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        int v60 = objc_msgSend_hasPrefix_(v56, v57, (uint64_t)v4, v58, v59);

        if (v60) {
          objc_msgSend_cancel(v55, v48, v49, v50, v51);
        }
      }

      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v68, (uint64_t)v84, 16);
    }

    while (v52);
  }
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C3F0C;
  block[3] = &unk_189E5BEB8;
  id v10 = v7;
  id v20 = v10;
  id v11 = v8;
  id v21 = v11;
  uint64_t v22 = self;
  dispatch_async(mutexQueue, block);
  objc_msgSend_delegate(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = v16;
  if (v16) {
    objc_msgSend_XPCRequestProxy_XPCConnection_canceledXPCRequestsWithUUID_( v16,  v17,  (uint64_t)self,  (uint64_t)v10,  (uint64_t)v11);
  }
}

- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4
{
  id v5 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  uint64_t v16 = MEMORY[0x1895F87A8];
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = sub_1864C4064;
  uint64_t v19 = &unk_189E5BF78;
  id v7 = v5;
  id v20 = v7;
  id v21 = self;
  dispatch_async(mutexQueue, &v16);
  objc_msgSend_delegate(self, v8, v9, v10, v11, v16, v17, v18, v19);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v12;
  if (v12) {
    objc_msgSend_XPCRequestProxy_invalidatedXPCConnection_(v12, v13, (uint64_t)self, (uint64_t)v7, v14);
  }
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5
{
  id v6 = a3;
  eventQueue = (dispatch_queue_s *)self->_eventQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_1864C4140;
  v9[3] = &unk_189E5BF78;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(eventQueue, v9);
}

- (id)__privateMACManager
{
  return 0LL;
}

- (CWFPrivateMACManager)privateMACManager
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864C1CE4;
  id v10 = sub_1864C1CF4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C4368;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CWFPrivateMACManager *)v3;
}

- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C4468;
  block[3] = &unk_189E5C970;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C4570;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C4700;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C48C4;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)invalidate
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C494C;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)__deviceUUID
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_1864C1CE4;
  uint64_t v34 = sub_1864C1CF4;
  id v35 = 0LL;
  objc_msgSend_delegate(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_6;
  }
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  int v29 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5D070);
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
  objc_msgSend_setType_(v8, v9, 145, v10, v11);
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_1864C4D5C;
  v24[3] = &unk_189E5D098;
  uint64_t v26 = &v30;
  uint64_t v27 = v28;
  id v12 = v7;
  id v25 = v12;
  objc_msgSend_setResponse_(v8, v13, (uint64_t)v24, v14, v15);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v6,  v16,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v8);
  dispatch_time_t v17 = dispatch_time(0LL, 4000000000LL);
  if (!dispatch_block_wait(v12, v17))
  {

    _Block_object_dispose(v28, 8);
LABEL_6:
    id v20 = (void *)v31[5];
    goto LABEL_11;
  }

  CWFGetOSLog();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CWFGetOSLog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v19 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v21 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v36 = 136446978;
    uint64_t v37 = "-[CWFXPCRequestProxy __deviceUUID]";
    __int16 v38 = 2082;
    uint64_t v39 = "CWFXPCRequestProxy.m";
    __int16 v40 = 1024;
    int v41 = 1442;
    __int16 v42 = 2048;
    uint64_t v43 = 4000000000LL;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v28, 8);
  id v20 = 0LL;
LABEL_11:
  id v22 = v20;

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (id)__vendorSpecificIdentifierForXPCConnection:(id)a3
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_string(MEMORY[0x189607940], v5, v6, v7, v8);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___deviceUUID(self, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v14, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_appendFormat_(v9, v20, (uint64_t)@"%@,", v21, v22, v19);
    objc_msgSend_bundleID(v4, v23, v24, v25, v26);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31) {
      goto LABEL_11;
    }
    if (!qword_18C4A4300)
    {
      __int128 v61 = xmmword_189E5D528;
      uint64_t v62 = 0LL;
      qword_18C4A4300 = _sl_dlopen();
    }

    if (qword_18C4A4300)
    {
      uint64_t v57 = 0LL;
      uint64_t v58 = &v57;
      uint64_t v59 = 0x2050000000LL;
      uint64_t v32 = (void *)qword_18C4A4308;
      uint64_t v60 = qword_18C4A4308;
      if (!qword_18C4A4308)
      {
        *(void *)&__int128 v61 = MEMORY[0x1895F87A8];
        *((void *)&v61 + 1) = 3221225472LL;
        uint64_t v62 = sub_1864E0540;
        uint64_t v63 = &unk_189E5B480;
        uint64_t v64 = &v57;
        sub_1864E0540((uint64_t)&v61, v27, v28, v29, v30);
        uint64_t v32 = (void *)v58[3];
      }

      id v33 = v32;
      _Block_object_dispose(&v57, 8);
      objc_msgSend_applicationProxyForIdentifier_(v33, v34, (uint64_t)v31, v35, v36);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceIdentifierForVendor(v37, v38, v39, v40, v41);
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v47 = objc_msgSend_UUIDString(v42, v43, v44, v45, v46);

      if (v47)
      {
        objc_msgSend_appendFormat_(v9, v48, (uint64_t)@"%@", v49, v50, v47);
        uint64_t v55 = (void *)objc_msgSend_copy(v9, v51, v52, v53, v54);
        uint64_t v19 = (void *)v47;
      }

      else
      {
        uint64_t v55 = 0LL;
        uint64_t v19 = 0LL;
      }
    }

    else
    {
LABEL_11:
      uint64_t v55 = 0LL;
    }
  }

  else
  {
    uint64_t v55 = 0LL;
    uint64_t v31 = 0LL;
  }

  return v55;
}

- (id)__hashedSSID:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v12 = a4;
  if (v8)
  {
    objc_msgSend___vendorSpecificIdentifierForXPCConnection_(self, v9, (uint64_t)v12, v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v13;
    if (v13)
    {
      objc_msgSend_dataUsingEncoding_(v13, v9, 4, v14, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        id v18 = v17;
        uint64_t v23 = (const void *)objc_msgSend_bytes(v18, v19, v20, v21, v22, 0, 0, 0, 0);
        size_t v28 = objc_msgSend_length(v18, v24, v25, v26, v27);
        id v29 = v8;
        uint64_t v34 = (const void *)objc_msgSend_bytes(v29, v30, v31, v32, v33);
        size_t v39 = objc_msgSend_length(v29, v35, v36, v37, v38);
        CCHmac(2u, v23, v28, v34, v39, &v50);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v40, (uint64_t)&v50, 32, v41);
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_(v42, v43, 0, v44, v45);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        id v47 = 0LL;
        goto LABEL_5;
      }
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v9, *MEMORY[0x189607688], 22, 0);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = 0LL;
  if (a5 && v47)
  {
    id v47 = v47;
    uint64_t v46 = 0LL;
    id v18 = 0LL;
    __int16 v42 = 0LL;
    *a5 = v47;
  }

  else
  {
    id v18 = 0LL;
    __int16 v42 = 0LL;
  }

- (id)__hashedBSSID:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  CWFEthernetAddressDataFromString(a3);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend___vendorSpecificIdentifierForXPCConnection_(self, v9, (uint64_t)v8, v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v13;
    if (v13)
    {
      objc_msgSend_dataUsingEncoding_(v13, v9, 4, v14, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        id v18 = v17;
        uint64_t v23 = (const void *)objc_msgSend_bytes(v18, v19, v20, v21, v22, 0, 0, 0, 0);
        size_t v28 = objc_msgSend_length(v18, v24, v25, v26, v27);
        id v29 = v12;
        uint64_t v34 = (const void *)objc_msgSend_bytes(v29, v30, v31, v32, v33);
        size_t v39 = objc_msgSend_length(v29, v35, v36, v37, v38);
        CCHmac(2u, v23, v28, v34, v39, &v50);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v40, (uint64_t)&v50, 32, v41);
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_(v42, v43, 0, v44, v45);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        id v47 = 0LL;
        goto LABEL_5;
      }
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v9, *MEMORY[0x189607688], 22, 0);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = 0LL;
  if (a5 && v47)
  {
    id v47 = v47;
    uint64_t v46 = 0LL;
    id v18 = 0LL;
    __int16 v42 = 0LL;
    *a5 = v47;
  }

  else
  {
    id v18 = 0LL;
    __int16 v42 = 0LL;
  }

- (void)__startMonitoringDefaultEventIDs
{
}

- (void)__stopMonitoringDefaultEventIDs
{
}

- (void)__startMonitoringDefaultEventIDsForInterfaceName:(id)a3
{
  id v46 = a3;
  objc_msgSend___apple80211WithInterfaceName_(self, v4, (uint64_t)v46, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v8, 4, (uint64_t)v46, v9);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v10, 3, (uint64_t)v46, v11);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v12, 20, (uint64_t)v46, v13);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v14, 76, (uint64_t)v46, v15);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v16, 70, (uint64_t)v46, v17);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v18, 71, (uint64_t)v46, v19);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v20, 80, (uint64_t)v46, v21);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v22, 39, (uint64_t)v46, v23);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v24, 17, (uint64_t)v46, v25);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v26, 12, (uint64_t)v46, v27);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v28, 13, (uint64_t)v46, v29);
  objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v30, (uint64_t)v46, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startEventMonitoring(v33, v34, v35, v36, v37);
  objc_msgSend___EAP8021XWithInterfaceName_(self, v38, (uint64_t)v46, v39, v40);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startEventMonitoring(v41, v42, v43, v44, v45);
}

- (void)__stopMonitoringDefaultEventIDsForInterfaceName:(id)a3
{
  id v46 = a3;
  objc_msgSend___apple80211WithInterfaceName_(self, v4, (uint64_t)v46, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v8, 4, (uint64_t)v46, v9);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v10, 3, (uint64_t)v46, v11);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v12, 20, (uint64_t)v46, v13);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v14, 76, (uint64_t)v46, v15);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v16, 70, (uint64_t)v46, v17);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v18, 71, (uint64_t)v46, v19);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v20, 80, (uint64_t)v46, v21);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v22, 39, (uint64_t)v46, v23);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v24, 17, (uint64_t)v46, v25);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v26, 12, (uint64_t)v46, v27);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v28, 13, (uint64_t)v46, v29);
  objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v30, (uint64_t)v46, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopEventMonitoring(v33, v34, v35, v36, v37);
  objc_msgSend___EAP8021XWithInterfaceName_(self, v38, (uint64_t)v46, v39, v40);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopEventMonitoring(v41, v42, v43, v44, v45);
}

- (id)__wifiInterfaceNames
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)objc_msgSend_mutableCopy(v5, v6, v7, v8, v9);

  objc_msgSend_removeObject_(v10, v11, (uint64_t)&stru_189E65678, v12, v13);
  return v10;
}

- (id)wifiInterfaceNames
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864C1CE4;
  uint64_t v10 = sub_1864C1CF4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C57E8;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__interfaceNames
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  objc_msgSend_allKeys(self->_apple80211Map, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_removeObject_(v11, v12, (uint64_t)&stru_189E65678, v13, v14);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  objc_msgSend_allValues(self->_apple80211Map, v15, v16, v17, v18, 0);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v21)
  {
    uint64_t v26 = v21;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0LL; i != v26; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v19);
        }
        uint64_t v29 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend_virtualInterfaceRole(v29, v22, v23, v24, v25))
        {
          objc_msgSend_interfaceName(v29, v22, v23, v24, v25);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v11, v31, (uint64_t)v30, v32, v33);
        }
      }

      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v35, (uint64_t)v39, 16);
    }

    while (v26);
  }

  return v11;
}

- (id)interfaceNames
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864C1CE4;
  uint64_t v10 = sub_1864C1CF4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C5A48;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__virtualInterfaceNames
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  objc_msgSend_allKeys(self->_apple80211Map, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_removeObject_(v11, v12, (uint64_t)&stru_189E65678, v13, v14);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  objc_msgSend_allValues(self->_apple80211Map, v15, v16, v17, v18, 0);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v21)
  {
    uint64_t v26 = v21;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0LL; i != v26; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v19);
        }
        uint64_t v29 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (!objc_msgSend_virtualInterfaceRole(v29, v22, v23, v24, v25))
        {
          objc_msgSend_interfaceName(v29, v22, v23, v24, v25);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v11, v31, (uint64_t)v30, v32, v33);
        }
      }

      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v35, (uint64_t)v39, 16);
    }

    while (v26);
  }

  return v11;
}

- (id)virtualInterfaceNames
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864C1CE4;
  uint64_t v10 = sub_1864C1CF4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C5CA8;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__interfaceSpecificEventIDs:(id)a3
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_set(MEMORY[0x189603FE0], v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(self->_apple80211Map, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17, v18);

  objc_msgSend_removeObject_(v19, v20, (uint64_t)&stru_189E65678, v21, v22);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  obuint64_t j = v4;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v68, (uint64_t)v73, 16);
  if (v24)
  {
    uint64_t v29 = v24;
    uint64_t v30 = *(void *)v69;
    uint64_t v61 = *(void *)v69;
    do
    {
      uint64_t v31 = 0LL;
      uint64_t v62 = v29;
      do
      {
        if (*(void *)v69 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v68 + 1) + 8 * v31);
        objc_msgSend_interfaceName(v32, v25, v26, v27, v28, v61);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend_addObject_(v9, v34, (uint64_t)v32, v35, v36);
        }

        else
        {
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          id v37 = v19;
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v64, (uint64_t)v72, 16);
          if (v39)
          {
            uint64_t v44 = v39;
            uint64_t v45 = *(void *)v65;
            do
            {
              for (uint64_t i = 0LL; i != v44; ++i)
              {
                if (*(void *)v65 != v45) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v47 = *(void *)(*((void *)&v64 + 1) + 8 * i);
                uint64_t v48 = objc_msgSend_type(v32, v40, v41, v42, v43);
                objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v49, v48, v47, v50);
                uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54) {
                  objc_msgSend_addObject_(v9, v51, (uint64_t)v54, v52, v53);
                }
              }

              uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v64, (uint64_t)v72, 16);
            }

            while (v44);
          }

          uint64_t v30 = v61;
          uint64_t v29 = v62;
        }

        ++v31;
      }

      while (v31 != v29);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v68, (uint64_t)v73, 16);
    }

    while (v29);
  }

  uint64_t v59 = (void *)objc_msgSend_copy(v9, v55, v56, v57, v58);
  return v59;
}

- (void)__updateMonitoring:(BOOL)a3 eventIDs:(id)a4
{
  BOOL v4 = a3;
  uint64_t v117 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v113;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v113 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_type(v16, v9, v10, v11, v12);
        if (v17 > 30)
        {
          if ((unint64_t)(v17 - 35) < 2)
          {
LABEL_13:
            objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___SCNetworkInterfaceWithInterfaceName_(self, v41, (uint64_t)v40, v42, v43);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v4) {
              objc_msgSend_startEventMonitoring(v22, v44, v45, v46, v47);
            }
            else {
              objc_msgSend_stopEventMonitoring(v22, v44, v45, v46, v47);
            }
          }

          else
          {
            if (v17 == 31)
            {
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v105, (uint64_t)v104, v106, v107);
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v108, v109, v110, v111);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v30 = v22;
              uint64_t v31 = 20LL;
            }

            else
            {
              if (v17 != 37) {
                continue;
              }
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v33, (uint64_t)v32, v34, v35);
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v36, v37, v38, v39);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v30 = v22;
              uint64_t v31 = 63LL;
            }

- (id)__linkDownStatusWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6480;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__autojoinStatusWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C65BC;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__joinStatusWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C66FC;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__roamStatusWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6838;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__linkQualityMetricWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6974;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__linkDownNetworkWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1864C1CE4;
  uint64_t v17 = sub_1864C1CF4;
  id v18 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6AB0;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__cachedKnownNetwork
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864C1CE4;
  id v10 = sub_1864C1CF4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C6BCC;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)__setCachedKnownNetwork:(id)a3
{
  id v4 = a3;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_1864C6C90;
  v7[3] = &unk_189E5BF78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mutexQueue, v7);
}

- (void)__setLinkDownStatus:(id)a3 interfaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6D7C;
  block[3] = &unk_189E5BEB8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (void)__setJoinStatus:(id)a3 interfaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6EA4;
  block[3] = &unk_189E5BEB8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (void)__setAutoJoinStatus:(id)a3 interfaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C6FA8;
  block[3] = &unk_189E5BEB8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (void)__setRoamStatus:(id)a3 interfaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C70B0;
  block[3] = &unk_189E5BEB8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (void)__setLinkQualityMetric:(id)a3 interfaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C71B4;
  block[3] = &unk_189E5BEB8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (void)__setupEventHandlersWithInterfaceName:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_apple80211Map, v5, (uint64_t)v4, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v8;
  if (v8)
  {
    objc_msgSend_eventHandler(v8, v9, v10, v11, v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v55[0] = MEMORY[0x1895F87A8];
      v55[1] = 3221225472LL;
      v55[2] = sub_1864C744C;
      v55[3] = &unk_189E5D110;
      id v56 = v4;
      uint64_t v57 = self;
      objc_msgSend_setEventHandler_(v13, v15, (uint64_t)v55, v16, v17);
    }
  }

  objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v9, (uint64_t)v4, v11, v12);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v18;
  if (v18)
  {
    objc_msgSend_eventHandler(v18, v19, v20, v21, v22);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v53[0] = MEMORY[0x1895F87A8];
      v53[1] = 3221225472LL;
      v53[2] = sub_1864C8EE4;
      v53[3] = &unk_189E5D138;
      v53[4] = self;
      id v54 = v4;
      objc_msgSend_setEventHandler_(v23, v25, (uint64_t)v53, v26, v27);
    }
  }

  objc_msgSend___SCNetworkInterfaceWithInterfaceName_(self, v19, (uint64_t)v4, v21, v22);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = v28;
  if (v28)
  {
    objc_msgSend_eventHandler(v28, v29, v30, v31, v32);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v50[0] = MEMORY[0x1895F87A8];
      v50[1] = 3221225472LL;
      v50[2] = sub_1864C9548;
      v50[3] = &unk_189E5D160;
      id v51 = v4;
      uint64_t v52 = self;
      objc_msgSend_setEventHandler_(v33, v35, (uint64_t)v50, v36, v37);
    }
  }

  objc_msgSend___EAP8021XWithInterfaceName_(self, v29, (uint64_t)v4, v31, v32);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = v38;
  if (v38)
  {
    objc_msgSend_eventHandler(v38, v39, v40, v41, v42);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = sub_1864C98FC;
      v48[3] = &unk_189E5D188;
      v48[4] = self;
      id v49 = v4;
      objc_msgSend_setEventHandler_(v43, v45, (uint64_t)v48, v46, v47);
    }
  }
}

- (void)__updateWiFiNetworkServices
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864C9A7C;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (void)__updateWiFiNetworkInterfaces:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v54 = 0LL;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  uint64_t v57 = 0LL;
  uint64_t v50 = 0LL;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  uint64_t v53 = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  uint64_t v49 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  uint64_t v45 = 0LL;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  v41[3] = 0LL;
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  uint64_t v40 = 0LL;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  v36[3] = 0LL;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x2020000000LL;
  v35[3] = 0LL;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  v34[3] = 0LL;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  v33[3] = 0LL;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  v32[3] = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = 0LL;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  v30[3] = 0LL;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  v29[3] = 0LL;
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v43[3] = v8;
  v47[3] = v8;
  v51[3] = v8;
  v55[3] = v8;
  v38[3] = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  interfaceQueue = (dispatch_queue_s *)self->_interfaceQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864CA020;
  block[3] = &unk_189E5D1D8;
  uint64_t v16 = &v37;
  uint64_t v17 = v35;
  id v18 = v31;
  uint64_t v19 = v30;
  uint64_t v20 = v29;
  uint64_t v21 = v34;
  uint64_t v22 = v33;
  uint64_t v23 = v32;
  uint64_t v24 = &v46;
  uint64_t v25 = &v50;
  uint64_t v26 = &v54;
  uint64_t v27 = &v42;
  uint64_t v28 = v41;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = v36;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(interfaceQueue, block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
}

- (void)__setupEventHandlers
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = sub_1864CBF00;
  void v28[3] = &unk_189E5D200;
  objc_copyWeak(&v29, &location);
  objc_msgSend_setEventHandler_(self->_keventMonitor, v4, (uint64_t)v28, v5, v6);
  v26[0] = v3;
  v26[1] = 3221225472LL;
  v26[2] = sub_1864CC538;
  v26[3] = &unk_189E5D228;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setEventHandler_(self->_IO80211, v7, (uint64_t)v26, v8, v9);
  v24[0] = v3;
  v24[1] = 3221225472LL;
  v24[2] = sub_1864CC87C;
  v24[3] = &unk_189E5D250;
  objc_copyWeak(&v25, &location);
  objc_msgSend_setEventHandler_(self->_SCNetworkConfiguration, v10, (uint64_t)v24, v11, v12);
  v22[0] = v3;
  v22[1] = 3221225472LL;
  v22[2] = sub_1864CD2B0;
  v22[3] = &unk_189E5D278;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setEventHandler_(self->_SCNetworkReachability, v13, (uint64_t)v22, v14, v15);
  __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    CWFGetOSLog();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v18 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v19 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 134219010;
    unint64_t v32 = v16 / 0x3B9ACA00;
    __int16 v33 = 2048;
    unint64_t v34 = v16 % 0x3B9ACA00 / 0x3E8;
    __int16 v35 = 2082;
    uint64_t v36 = "-[CWFXPCRequestProxy __setupEventHandlers]";
    __int16 v37 = 2082;
    uint64_t v38 = "CWFXPCRequestProxy.m";
    __int16 v39 = 1024;
    int v40 = 3068;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend___updateWiFiNetworkInterfaces_reply_(self, v20, (uint64_t)@"Initial update", 0, v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)__addJoinStatusWithScanResult:(id)a3 knownNetworkProfile:(id)a4 isAutoJoin:(BOOL)a5 interfaceName:(id)a6
{
  BOOL v6 = a5;
  v69[1] = *MEMORY[0x1895F89C0];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___CWFJoinStatus);
  objc_msgSend_date(MEMORY[0x189603F50], v14, v15, v16, v17);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(v13, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_setScanResult_(v13, v22, (uint64_t)v12, v23, v24);
  objc_msgSend_setKnownNetworkProfile_(v13, v25, (uint64_t)v11, v26, v27);

  objc_msgSend_setInterfaceName_(v13, v28, (uint64_t)v10, v29, v30);
  objc_msgSend_setAutoJoin_(v13, v31, v6, v32, v33);
  objc_msgSend_setObject_forKeyedSubscript_(self->_mutableJoinStatusMap, v34, (uint64_t)v13, (uint64_t)v10, v35);
  uint64_t v36 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  objc_msgSend_setType_(v36, v37, 13, v38, v39);
  objc_msgSend_setInterfaceName_(v36, v40, (uint64_t)v10, v41, v42);
  objc_msgSend_startedAt(v13, v43, v44, v45, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v36, v48, (uint64_t)v47, v49, v50);

  __int128 v68 = @"JoinStatus";
  uint64_t v55 = (void *)objc_msgSend_copy(v13, v51, v52, v53, v54);
  v69[0] = v55;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v56, (uint64_t)v69, (uint64_t)&v68, 1);
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInfo_(v36, v58, (uint64_t)v57, v59, v60);

  eventQueue = (dispatch_queue_s *)self->_eventQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864CD558;
  block[3] = &unk_189E5BF78;
  void block[4] = self;
  uint64_t v67 = v36;
  uint64_t v62 = v36;
  dispatch_async(eventQueue, block);
  objc_msgSend___updateAutoJoinStatusWithJoin_(self, v63, (uint64_t)v10, v64, v65);
}

- (void)__updateJoinStatusWithAssoc:(id)a3
{
  v56[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v8;
  if (v8)
  {
    objc_msgSend_associationEndedAt(v8, v9, v10, v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_date(MEMORY[0x189603F50], v15, v16, v17, v18);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssociationEndedAt_(v13, v20, (uint64_t)v19, v21, v22);
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v23, v24, 13, v25, v26);
      objc_msgSend_setInterfaceName_(v23, v27, (uint64_t)v4, v28, v29);
      objc_msgSend_associationEndedAt(v13, v30, v31, v32, v33);
      unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v23, v35, (uint64_t)v34, v36, v37);

      uint64_t v55 = @"JoinStatus";
      uint64_t v42 = (void *)objc_msgSend_copy(v13, v38, v39, v40, v41);
      v56[0] = v42;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v43, (uint64_t)v56, (uint64_t)&v55, 1);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v23, v45, (uint64_t)v44, v46, v47);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CD774;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v54 = v23;
      uint64_t v49 = v23;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v50, (uint64_t)v4, v51, v52);
    }
  }
}

- (void)__updateJoinStatusWithError:(id)a3 interaceName:(id)a4
{
  v62[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v8, (uint64_t)v7, v9, v10);
  uint64_t v16 = (void *)v11;
  if (v6 && v11)
  {
    objc_msgSend_date(MEMORY[0x189603F50], v12, v13, v14, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_associationEndedAt(v16, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22) {
      objc_msgSend_setAssociationEndedAt_(v16, v23, (uint64_t)v17, v24, v25);
    }
    objc_msgSend_setError_(v16, v23, (uint64_t)v6, v24, v25);
    objc_msgSend_setEndedAt_(v16, v26, (uint64_t)v17, v27, v28);
    uint64_t v29 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
    objc_msgSend_setType_(v29, v30, 13, v31, v32);
    objc_msgSend_setInterfaceName_(v29, v33, (uint64_t)v7, v34, v35);
    objc_msgSend_associationEndedAt(v16, v36, v37, v38, v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamp_(v29, v41, (uint64_t)v40, v42, v43);

    uint64_t v61 = @"JoinStatus";
    uint64_t v48 = (void *)objc_msgSend_copy(v16, v44, v45, v46, v47);
    v62[0] = v48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v49, (uint64_t)v62, (uint64_t)&v61, 1);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v29, v51, (uint64_t)v50, v52, v53);

    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864CD9BC;
    block[3] = &unk_189E5BF78;
    void block[4] = self;
    uint64_t v60 = v29;
    uint64_t v55 = v29;
    dispatch_async(eventQueue, block);
    objc_msgSend___updateAutoJoinStatusWithJoin_(self, v56, (uint64_t)v7, v57, v58);
  }
}

- (void)__updateJoinStatusWithIPv4:(id)a3
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_date(MEMORY[0x189603F50], v8, v9, v10, v11);
    __int128 v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v13, (uint64_t)v4, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IPv4Addresses(v16, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_IPv4Router(v16, v22, v23, v24, v25);
    int v31 = 0;
    uint64_t v75 = (void *)v26;
    if (v21 && v26)
    {
      objc_msgSend_IPv4AssignedAt(v12, v27, v28, v29, v30);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        int v31 = 0;
      }

      else
      {
        objc_msgSend_setIPv4AssignedAt_(v12, v27, (uint64_t)v76, v29, v30);
        int v31 = 1;
      }
    }

    objc_msgSend_IPv4InterfaceName(self->_SCNetworkConfiguration, v27, v28, v29, v30);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = v33;
    if (v33)
    {
      if (objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v4, v35, v36))
      {
        objc_msgSend_IPv4PrimaryAt(v12, v38, v39, v40, v41);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          objc_msgSend_setIPv4PrimaryAt_(v12, v43, (uint64_t)v76, v44, v45);
          int v31 = 1;
        }
      }
    }

    __uint64_t v46 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      CWFGetOSLog();
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v48 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v49 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      int v81 = 134220034;
      unint64_t v82 = v46 / 0x3B9ACA00;
      __int16 v83 = 2048;
      unint64_t v84 = v46 % 0x3B9ACA00 / 0x3E8;
      __int16 v85 = 2082;
      uint64_t v86 = "-[CWFXPCRequestProxy __updateJoinStatusWithIPv4:]";
      __int16 v87 = 2082;
      uint64_t v88 = "CWFXPCRequestProxy.m";
      __int16 v89 = 1024;
      int v90 = 3190;
      __int16 v91 = 2114;
      id v92 = v4;
      __int16 v93 = 1024;
      int v94 = v31;
      __int16 v95 = 2114;
      __uint64_t v96 = v21;
      __int16 v97 = 2114;
      uint64_t v98 = v75;
      _os_log_send_and_compose_impl();
    }

    if (v31)
    {
      uint64_t v50 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v50, v51, 13, v52, v53);
      objc_msgSend_setInterfaceName_(v50, v54, (uint64_t)v4, v55, v56);
      objc_msgSend_setTimestamp_(v50, v57, (uint64_t)v76, v58, v59);
      uint64_t v79 = @"JoinStatus";
      uint64_t v64 = (void *)objc_msgSend_copy(v12, v60, v61, v62, v63);
      __int128 v80 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v65, (uint64_t)&v80, (uint64_t)&v79, 1);
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v50, v67, (uint64_t)v66, v68, v69);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CDDBC;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v78 = v50;
      uint64_t v71 = v50;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v72, (uint64_t)v4, v73, v74);
    }
  }
}

- (void)__updateJoinStatusWithIPv6:(id)a3
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_date(MEMORY[0x189603F50], v8, v9, v10, v11);
    __int128 v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v13, (uint64_t)v4, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IPv6Addresses(v16, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_IPv6Router(v16, v22, v23, v24, v25);
    int v31 = 0;
    uint64_t v75 = (void *)v26;
    if (v21 && v26)
    {
      objc_msgSend_IPv6AssignedAt(v12, v27, v28, v29, v30);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        int v31 = 0;
      }

      else
      {
        objc_msgSend_setIPv6AssignedAt_(v12, v27, (uint64_t)v76, v29, v30);
        int v31 = 1;
      }
    }

    objc_msgSend_IPv4InterfaceName(self->_SCNetworkConfiguration, v27, v28, v29, v30);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = v33;
    if (v33)
    {
      if (objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v4, v35, v36))
      {
        objc_msgSend_IPv6PrimaryAt(v12, v38, v39, v40, v41);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          objc_msgSend_setIPv6PrimaryAt_(v12, v43, (uint64_t)v76, v44, v45);
          int v31 = 1;
        }
      }
    }

    __uint64_t v46 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      CWFGetOSLog();
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v48 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v49 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      int v81 = 134220034;
      unint64_t v82 = v46 / 0x3B9ACA00;
      __int16 v83 = 2048;
      unint64_t v84 = v46 % 0x3B9ACA00 / 0x3E8;
      __int16 v85 = 2082;
      uint64_t v86 = "-[CWFXPCRequestProxy __updateJoinStatusWithIPv6:]";
      __int16 v87 = 2082;
      uint64_t v88 = "CWFXPCRequestProxy.m";
      __int16 v89 = 1024;
      int v90 = 3238;
      __int16 v91 = 2114;
      id v92 = v4;
      __int16 v93 = 1024;
      int v94 = v31;
      __int16 v95 = 2114;
      __uint64_t v96 = v21;
      __int16 v97 = 2114;
      uint64_t v98 = v75;
      _os_log_send_and_compose_impl();
    }

    if (v31)
    {
      uint64_t v50 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v50, v51, 13, v52, v53);
      objc_msgSend_setInterfaceName_(v50, v54, (uint64_t)v4, v55, v56);
      objc_msgSend_setTimestamp_(v50, v57, (uint64_t)v76, v58, v59);
      uint64_t v79 = @"JoinStatus";
      uint64_t v64 = (void *)objc_msgSend_copy(v12, v60, v61, v62, v63);
      __int128 v80 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v65, (uint64_t)&v80, (uint64_t)&v79, 1);
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v50, v67, (uint64_t)v66, v68, v69);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CE1BC;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v78 = v50;
      uint64_t v71 = v50;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v72, (uint64_t)v4, v73, v74);
    }
  }
}

- (void)__updateJoinStatusWithAuth:(id)a3
{
  v56[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v8;
  if (v8)
  {
    objc_msgSend_authenticationEndedAt(v8, v9, v10, v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_date(MEMORY[0x189603F50], v15, v16, v17, v18);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAuthenticationEndedAt_(v13, v20, (uint64_t)v19, v21, v22);
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v23, v24, 13, v25, v26);
      objc_msgSend_setInterfaceName_(v23, v27, (uint64_t)v4, v28, v29);
      objc_msgSend_authenticationEndedAt(v13, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v23, v35, (uint64_t)v34, v36, v37);

      uint64_t v55 = @"JoinStatus";
      uint64_t v42 = (void *)objc_msgSend_copy(v13, v38, v39, v40, v41);
      v56[0] = v42;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v43, (uint64_t)v56, (uint64_t)&v55, 1);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v23, v45, (uint64_t)v44, v46, v47);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CE3D8;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v54 = v23;
      id v49 = v23;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v50, (uint64_t)v4, v51, v52);
    }
  }
}

- (void)__updateJoinStatusWithLinkUp:(id)a3
{
  v59[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v8;
  if (v8)
  {
    objc_msgSend_linkUpAt(v8, v9, v10, v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_date(MEMORY[0x189603F50], v15, v16, v17, v18);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLinkUpAt_(v13, v20, (uint64_t)v19, v21, v22);
      objc_msgSend_setEndedAt_(v13, v23, (uint64_t)v19, v24, v25);
      uint64_t v26 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v26, v27, 13, v28, v29);
      objc_msgSend_setInterfaceName_(v26, v30, (uint64_t)v4, v31, v32);
      objc_msgSend_associationEndedAt(v13, v33, v34, v35, v36);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v26, v38, (uint64_t)v37, v39, v40);

      uint64_t v58 = @"JoinStatus";
      uint64_t v45 = (void *)objc_msgSend_copy(v13, v41, v42, v43, v44);
      v59[0] = v45;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v46, (uint64_t)v59, (uint64_t)&v58, 1);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v26, v48, (uint64_t)v47, v49, v50);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CE600;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v57 = v26;
      uint64_t v52 = v26;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v53, (uint64_t)v4, v54, v55);
    }
  }
}

- (void)__updateJoinStatusWithEAP8021X:(id)a3
{
  v101[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend___EAP8021XWithInterfaceName_(self, v8, (uint64_t)v4, v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_supplicantState_(v12, v13, 0, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_unsignedIntValue(v16, v17, v18, v19, v20);

    objc_msgSend_controlMode_(v12, v22, 0, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_unsignedIntValue(v25, v26, v27, v28, v29);

    objc_msgSend_controlState_(v12, v31, 0, v32, v33);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38);

    objc_msgSend_clientStatus_(v12, v40, 0, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = objc_msgSend_intValue(v43, v44, v45, v46, v47);

    if ((_DWORD)v21 != objc_msgSend_EAP8021XSupplicantState(v11, v49, v50, v51, v52)
      || (_DWORD)v30 != objc_msgSend_EAP8021XControlMode(v11, v53, v54, v55, v56)
      || (_DWORD)v39 != objc_msgSend_EAP8021XControlState(v11, v53, v57, v55, v56)
      || (_DWORD)v48 != objc_msgSend_EAP8021XClientStatus(v11, v53, v58, v55, v56))
    {
      objc_msgSend_setEAP8021XSupplicantState_(v11, v53, v21, v55, v56);
      objc_msgSend_setEAP8021XControlMode_(v11, v59, v30, v60, v61);
      objc_msgSend_setEAP8021XControlState_(v11, v62, v39, v63, v64);
      objc_msgSend_setEAP8021XClientStatus_(v11, v65, v48, v66, v67);
      uint64_t v68 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v68, v69, 13, v70, v71);
      objc_msgSend_setInterfaceName_(v68, v72, (uint64_t)v4, v73, v74);
      objc_msgSend_date(MEMORY[0x189603F50], v75, v76, v77, v78);
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v68, v80, (uint64_t)v79, v81, v82);

      uint64_t v100 = @"JoinStatus";
      __int16 v87 = (void *)objc_msgSend_copy(v11, v83, v84, v85, v86);
      v101[0] = v87;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v88, (uint64_t)v101, (uint64_t)&v100, 1);
      __int16 v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v68, v90, (uint64_t)v89, v91, v92);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CE8F0;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v99 = v68;
      int v94 = v68;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v95, (uint64_t)v4, v96, v97);
    }
  }
}

- (void)__updateAutoJoinStatusWithJoin:(id)a3
{
  v145[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v9, (uint64_t)v4, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v12;
  if (v8) {
    BOOL v18 = v12 == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    objc_msgSend_startedAt(v12, v13, v14, v15, v16);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v19, v20, v21, v22, v23);
    double v25 = v24;
    objc_msgSend_startedAt(v8, v26, v27, v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v30, v31, v32, v33, v34);
    if (v25 >= v39)
    {
      uint64_t v40 = objc_msgSend_endedAt(v8, v35, v36, v37, v38);
      if (v40)
      {
        uint64_t v45 = (void *)v40;
        objc_msgSend_startedAt(v17, v41, v42, v43, v44);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v46, v47, v48, v49, v50);
        double v52 = v51;
        objc_msgSend_endedAt(v8, v53, v54, v55, v56);
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v57, v58, v59, v60, v61);
        double v63 = v62;

        if (v52 > v63) {
          goto LABEL_24;
        }
      }

      else
      {
      }

      objc_msgSend_joinAttempts(v8, v64, v65, v66, v67);
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = (void *)objc_msgSend_mutableCopy(v68, v69, v70, v71, v72);

      if (!v19)
      {
        objc_msgSend_array(MEMORY[0x189603FA8], v73, v74, v75, v76);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      unint64_t v77 = objc_msgSend_count(v19, v73, v74, v75, v76);
      if (objc_msgSend_count(v19, v78, v79, v80, v81))
      {
        unint64_t v141 = v77;
        uint64_t v86 = 0LL;
        while (1)
        {
          objc_msgSend_objectAtIndexedSubscript_(v19, v82, v86, v84, v85, v141);
          __int16 v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v87, v88, v89, v90, v91);
          uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v17, v93, v94, v95, v96);
          uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
          char isEqual = objc_msgSend_isEqual_(v92, v98, (uint64_t)v97, v99, v100);

          if ((isEqual & 1) != 0) {
            break;
          }
          if (++v86 >= (unint64_t)objc_msgSend_count(v19, v82, v83, v84, v85))
          {
            unint64_t v77 = v141;
            goto LABEL_19;
          }
        }

        unint64_t v77 = v86;
      }

- (void)__autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4
{
  id v6 = a4;
  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinStatus);
  objc_msgSend_date(MEMORY[0x189603F50], v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(v23, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_setTrigger_(v23, v15, a3, v16, v17);
  objc_msgSend_setInterfaceName_(v23, v18, (uint64_t)v6, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(self->_mutableAutoJoinTriggerMap, v21, (uint64_t)v23, (uint64_t)v6, v22);
}

- (void)__updateAutoJoinState:(int64_t)a3 interfaceName:(id)a4
{
  v57[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinStatusMap, v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_state(v10, v11, v12, v13, v14))
  {
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinTriggerMap, v15, (uint64_t)v6, v17, v18);

    objc_msgSend_setObject_forKeyedSubscript_(self->_mutableAutoJoinStatusMap, v20, v19, (uint64_t)v6, v21);
    objc_msgSend_setObject_forKeyedSubscript_(self->_mutableAutoJoinTriggerMap, v22, 0, (uint64_t)v6, v23);
    uint64_t v10 = (void *)v19;
  }

  if (v10 && objc_msgSend_state(v10, v15, v16, v17, v18) != a3)
  {
    objc_msgSend_setState_(v10, v24, a3, v25, v26);
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
    objc_msgSend_setType_(v27, v28, 12, v29, v30);
    objc_msgSend_setInterfaceName_(v27, v31, (uint64_t)v6, v32, v33);
    objc_msgSend_date(MEMORY[0x189603F50], v34, v35, v36, v37);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamp_(v27, v39, (uint64_t)v38, v40, v41);

    uint64_t v56 = @"AutoJoinStatus";
    objc_msgSend_deepCopy(v10, v42, v43, v44, v45);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v46;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v47, (uint64_t)v57, (uint64_t)&v56, 1);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v27, v49, (uint64_t)v48, v50, v51);

    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864CEF90;
    block[3] = &unk_189E5BF78;
    void block[4] = self;
    uint64_t v55 = v27;
    uint64_t v53 = v27;
    dispatch_async(eventQueue, block);
  }
}

- (void)__autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4
{
  BOOL v4 = a3;
  v61[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinStatusMap, v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v10;
  if (v10)
  {
    objc_msgSend_endedAt(v10, v11, v12, v13, v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend_setState_(v15, v17, 0, v18, v19);
      objc_msgSend_setResult_(v15, v20, v4, v21, v22);
      objc_msgSend_date(MEMORY[0x189603F50], v23, v24, v25, v26);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEndedAt_(v15, v28, (uint64_t)v27, v29, v30);

      uint64_t v31 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
      objc_msgSend_setType_(v31, v32, 12, v33, v34);
      objc_msgSend_setInterfaceName_(v31, v35, (uint64_t)v6, v36, v37);
      objc_msgSend_endedAt(v15, v38, v39, v40, v41);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v31, v43, (uint64_t)v42, v44, v45);

      uint64_t v60 = @"AutoJoinStatus";
      objc_msgSend_deepCopy(v15, v46, v47, v48, v49);
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v50;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v51, (uint64_t)v61, (uint64_t)&v60, 1);
      double v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v31, v53, (uint64_t)v52, v54, v55);

      eventQueue = (dispatch_queue_s *)self->_eventQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CF1B8;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      uint64_t v59 = v31;
      uint64_t v57 = v31;
      dispatch_async(eventQueue, block);
    }
  }
}

- (void)__handleWillAssocInternalEvent:(id)a3
{
  id v4 = a3;
  defaultQueue = self->_defaultQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_1864CF28C;
  v10[3] = &unk_189E5BF78;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v4;
  objc_msgSend_addOperationWithBlock_(defaultQueue, v7, (uint64_t)v10, v8, v9);
}

- (void)__handleAssocDoneInternalEvent:(id)a3
{
  id v4 = a3;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_1864CF4A8;
  v7[3] = &unk_189E5BF78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(mutexQueue, v7);
}

- (void)__handleAutoJoinStateChangedInternalEvent:(id)a3
{
  id v4 = a3;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_1864CF5F0;
  v7[3] = &unk_189E5BF78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(mutexQueue, v7);
}

- (void)__handleKnownNetworkProfileChangedEvent:(id)a3
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_info(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)@"Type", v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = objc_msgSend_integerValue(v13, v14, v15, v16, v17);

  objc_msgSend_objectForKeyedSubscript_(v9, v19, (uint64_t)@"Profile", v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v23, (uint64_t)@"PreviousProfile", v24, v25);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v18)
  {
    case 3LL:
      objc_msgSend_networkName(v22, v26, v27, v28, v29);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        defaultQueue = self->_defaultQueue;
        v69[0] = MEMORY[0x1895F87A8];
        v69[1] = 3221225472LL;
        void v69[2] = sub_1864CFAF4;
        v69[3] = &unk_189E5BF78;
        id v70 = v22;
        id v71 = v4;
        objc_msgSend_addOperationWithBlock_(defaultQueue, v48, (uint64_t)v69, v49, v50);
      }

      uint64_t v51 = objc_msgSend_SSID(v22, v43, v44, v45, v46);
      if (v51)
      {
        double v52 = (void *)v51;
        if (!qword_18C4A42F0)
        {
          __int128 v74 = xmmword_189E5D510;
          uint64_t v75 = 0LL;
          qword_18C4A42F0 = _sl_dlopen();
        }

        uint64_t v53 = qword_18C4A42F0;

        if (v53)
        {
          uint64_t v54 = self->_defaultQueue;
          v67[0] = MEMORY[0x1895F87A8];
          v67[1] = 3221225472LL;
          v67[2] = sub_1864CFC24;
          v67[3] = &unk_189E5BC10;
          id v68 = v22;
          objc_msgSend_addOperationWithBlock_(v54, v55, (uint64_t)v67, v56, v57);
        }
      }

      break;
    case 2LL:
      objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v26, 0, 0, v29);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceName(v58, v59, v60, v61, v62);
      double v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(self, v64, (uint64_t)v63, v65, v66);

      _os_feature_enabled_impl();
      break;
    case 1LL:
      objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v26, 0, 0, v29);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceName(v31, v32, v33, v34, v35);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(self, v37, (uint64_t)v36, v38, v39);

      mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864CFA00;
      block[3] = &unk_189E5BF78;
      void block[4] = self;
      id v73 = v31;
      id v41 = v31;
      dispatch_async(mutexQueue, block);

      break;
  }
}

- (id)__currentScanResultWithInterfaceName:(id)a3 forceNoCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_1864C1CE4;
  uint64_t v27 = sub_1864C1CF4;
  id v28 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  int v22 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5D2C0);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_1864CFFBC;
  v17[3] = &unk_189E5D2E8;
  uint64_t v19 = &v23;
  uint64_t v20 = v21;
  id v8 = v7;
  id v18 = v8;
  objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_reply_(self, v9, (uint64_t)v6, v4, (uint64_t)v17);
  dispatch_time_t v10 = dispatch_time(0LL, 4000000000LL);
  if (dispatch_block_wait(v8, v10))
  {
    CWFGetOSLog();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      CWFGetOSLog();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v14 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136446978;
      uint64_t v30 = "-[CWFXPCRequestProxy __currentScanResultWithInterfaceName:forceNoCache:]";
      __int16 v31 = 2082;
      uint64_t v32 = "CWFXPCRequestProxy.m";
      __int16 v33 = 1024;
      int v34 = 3683;
      __int16 v35 = 2048;
      uint64_t v36 = 4000000000LL;
      _os_log_send_and_compose_impl();
    }

    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v13 = (void *)v24[5];
  }

  id v15 = v13;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

- (void)__currentScanResultWithInterfaceName:(id)a3 forceNoCache:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_msgSend_delegate(self, v10, v11, v12, v13);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v14, v15, v16, v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x189607968], v20, v6, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v24, (uint64_t)v23, (uint64_t)@"ForceNoCache", v25);

    uint64_t v26 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v26, v27, 57, v28, v29);
    objc_msgSend_setInfo_(v26, v30, (uint64_t)v19, v31, v32);
    __int16 v33 = objc_alloc_init(&OBJC_CLASS___CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v33, v34, (uint64_t)v8, v35, v36);
    objc_msgSend_setRequestParameters_(v26, v37, (uint64_t)v33, v38, v39);
    objc_msgSend_date(MEMORY[0x189603F50], v40, v41, v42, v43);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v26, v45, (uint64_t)v44, v46, v47);

    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = sub_1864D022C;
    v53[3] = &unk_189E5C338;
    id v54 = v9;
    objc_msgSend_setResponse_(v26, v48, (uint64_t)v53, v49, v50);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v18,  v51,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v26);
  }

  else if (v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
    double v52 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void))v9 + 2))(v9, v52, 0LL);
  }
}

- (id)__userAutoJoinDisabled
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  __int16 v33 = sub_1864C1CE4;
  int v34 = sub_1864C1CF4;
  id v35 = 0LL;
  objc_msgSend_delegate(self, a2, v2, v3, v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_6;
  }
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  int v29 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5D308);
  id v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
  objc_msgSend_setType_(v8, v9, 179, v10, v11);
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_1864D05A0;
  v24[3] = &unk_189E5D098;
  uint64_t v26 = &v30;
  uint64_t v27 = v28;
  id v12 = v7;
  id v25 = v12;
  objc_msgSend_setResponse_(v8, v13, (uint64_t)v24, v14, v15);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v6,  v16,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v8);
  dispatch_time_t v17 = dispatch_time(0LL, 4000000000LL);
  if (!dispatch_block_wait(v12, v17))
  {

    _Block_object_dispose(v28, 8);
LABEL_6:
    uint64_t v20 = (void *)v31[5];
    goto LABEL_11;
  }

  CWFGetOSLog();
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CWFGetOSLog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v19 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v21 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v36 = 136446978;
    uint64_t v37 = "-[CWFXPCRequestProxy __userAutoJoinDisabled]";
    __int16 v38 = 2082;
    uint64_t v39 = "CWFXPCRequestProxy.m";
    __int16 v40 = 1024;
    int v41 = 3743;
    __int16 v42 = 2048;
    uint64_t v43 = 4000000000LL;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v28, 8);
  uint64_t v20 = 0LL;
LABEL_11:
  id v22 = v20;

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (id)__currentNetworkProfileWithInterfaceName:(id)a3
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v40 = 0LL;
  int v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  uint64_t v43 = sub_1864C1CE4;
  uint64_t v44 = sub_1864C1CF4;
  id v45 = 0LL;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    goto LABEL_6;
  }
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  int v39 = 0;
  dispatch_block_t v10 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5D328);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___CWFRequestParameters);
  objc_msgSend_setInterfaceName_(v11, v12, (uint64_t)v4, v13, v14);
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
  objc_msgSend_setRequestParameters_(v15, v16, (uint64_t)v11, v17, v18);
  objc_msgSend_setType_(v15, v19, 58, v20, v21);
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = sub_1864D0978;
  v34[3] = &unk_189E5D098;
  int v36 = &v40;
  uint64_t v37 = v38;
  id v22 = v10;
  id v35 = v22;
  objc_msgSend_setResponse_(v15, v23, (uint64_t)v34, v24, v25);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v9,  v26,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v15);
  dispatch_time_t v27 = dispatch_time(0LL, 4000000000LL);
  if (!dispatch_block_wait(v22, v27))
  {

    _Block_object_dispose(v38, 8);
LABEL_6:
    uint64_t v30 = (void *)v41[5];
    goto LABEL_11;
  }

  CWFGetOSLog();
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CWFGetOSLog();
    int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v29 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v31 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    int v46 = 136446978;
    uint64_t v47 = "-[CWFXPCRequestProxy __currentNetworkProfileWithInterfaceName:]";
    __int16 v48 = 2082;
    uint64_t v49 = "CWFXPCRequestProxy.m";
    __int16 v50 = 1024;
    int v51 = 3779;
    __int16 v52 = 2048;
    uint64_t v53 = 4000000000LL;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v38, 8);
  uint64_t v30 = 0LL;
LABEL_11:
  id v32 = v30;

  _Block_object_dispose(&v40, 8);
  return v32;
}

- (id)__knownNetworkProfiles
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  __int16 v33 = sub_1864C1CE4;
  int v34 = sub_1864C1CF4;
  id v35 = 0LL;
  objc_msgSend_delegate(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_6;
  }
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  int v29 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5D348);
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
  objc_msgSend_setType_(v8, v9, 54, v10, v11);
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_1864D0D08;
  v24[3] = &unk_189E5D098;
  uint64_t v26 = &v30;
  dispatch_time_t v27 = v28;
  id v12 = v7;
  id v25 = v12;
  objc_msgSend_setResponse_(v8, v13, (uint64_t)v24, v14, v15);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v6,  v16,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v8);
  dispatch_time_t v17 = dispatch_time(0LL, 4000000000LL);
  if (!dispatch_block_wait(v12, v17))
  {

    _Block_object_dispose(v28, 8);
LABEL_6:
    uint64_t v20 = (void *)v31[5];
    goto LABEL_11;
  }

  CWFGetOSLog();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CWFGetOSLog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v19 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v21 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v36 = 136446978;
    uint64_t v37 = "-[CWFXPCRequestProxy __knownNetworkProfiles]";
    __int16 v38 = 2082;
    int v39 = "CWFXPCRequestProxy.m";
    __int16 v40 = 1024;
    int v41 = 3810;
    __int16 v42 = 2048;
    uint64_t v43 = 4000000000LL;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v28, 8);
  uint64_t v20 = 0LL;
LABEL_11:
  id v22 = v20;

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (BOOL)isNon80211InterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864D0E60;
  block[3] = &unk_189E5CFB8;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  LOBYTE(mutexQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)mutexQueue;
}

- (id)__apple80211WithVirtualInterfaceRole:(int)a3 parentInterfaceName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v123 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
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

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v15 = v7 / 0x3B9ACA00;
    unint64_t v16 = v7 % 0x3B9ACA00 / 0x3E8;
    sub_1864536D0(v4, v11, v12, v13, v14);
    dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    apple80211Map = self->_apple80211Map;
    int v107 = 134219778;
    unint64_t v108 = v15;
    __int16 v109 = 2048;
    unint64_t v110 = v16;
    __int16 v111 = 2082;
    uint64_t v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
    __int16 v113 = 2082;
    __int128 v114 = "CWFXPCRequestProxy.m";
    __int16 v115 = 1024;
    int v116 = 3837;
    __int16 v117 = 2114;
    uint64_t v118 = v17;
    __int16 v119 = 2114;
    id v120 = v6;
    __int16 v121 = 2114;
    uint64_t v122 = apple80211Map;
    LODWORD(v99) = 78;
    uint64_t v98 = &v107;
    _os_log_send_and_compose_impl();
  }

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  objc_msgSend_allValues(self->_apple80211Map, v19, v20, v21, v22);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v102, (uint64_t)v106, 16);
  if (!v24)
  {
    uint64_t v69 = 0LL;
    id v68 = 0LL;
    goto LABEL_40;
  }

  uint64_t v29 = v24;
  id v100 = 0LL;
  uint64_t v30 = *(void *)v103;
  while (2)
  {
    for (uint64_t i = 0LL; i != v29; ++i)
    {
      if (*(void *)v103 != v30) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = *(void **)(*((void *)&v102 + 1) + 8 * i);
      objc_msgSend_interfaceName(v32, v25, v26, v27, v28, v98, v99);
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if (objc_msgSend_virtualInterfaceRole(v32, v25, v26, v27, v28) == (_DWORD)v4)
        {
          if (!v6) {
            goto LABEL_34;
          }
          uint64_t v34 = objc_msgSend_virtualInterfaceParent(v32, v25, v26, v27, v28);
          if ((id)v34 == v6)
          {

LABEL_34:
            __uint64_t v70 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            CWFGetOSLog();
            id v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v71)
            {
              CWFGetOSLog();
              uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v72 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v73 = MEMORY[0x1895F8DA0];
            }

            uint64_t v69 = v100;

            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              int v107 = 134219266;
              unint64_t v108 = v70 / 0x3B9ACA00;
              __int16 v109 = 2048;
              unint64_t v110 = v70 % 0x3B9ACA00 / 0x3E8;
              __int16 v111 = 2082;
              uint64_t v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
              __int16 v113 = 2082;
              __int128 v114 = "CWFXPCRequestProxy.m";
              __int16 v115 = 1024;
              int v116 = 3848;
              __int16 v117 = 2114;
              uint64_t v118 = v32;
              _os_log_send_and_compose_impl();
            }

            id v68 = v32;
            goto LABEL_40;
          }

          int v39 = (void *)v34;
          uint64_t v40 = objc_msgSend_virtualInterfaceParent(v32, v35, v36, v37, v38);
          if (v40)
          {
            id v45 = (void *)v40;
            objc_msgSend_virtualInterfaceParent(v32, v41, v42, v43, v44);
            int v46 = (void *)objc_claimAutoreleasedReturnValue();
            int isEqual = objc_msgSend_isEqual_(v6, v47, (uint64_t)v46, v48, v49);

            if (isEqual) {
              goto LABEL_34;
            }
          }

          else
          {
          }
        }

        if ((_DWORD)v4 == 7 && !objc_msgSend_virtualInterfaceRole(v32, v25, v26, v27, v28))
        {
          if (!v6) {
            goto LABEL_27;
          }
          uint64_t v51 = objc_msgSend_interfaceName(v32, v25, v26, v27, v28);
          if ((id)v51 == v6)
          {

LABEL_27:
            uint64_t v56 = v100;
            id v100 = v32;
LABEL_28:

            continue;
          }

          uint64_t v56 = (void *)v51;
          uint64_t v57 = objc_msgSend_interfaceName(v32, v52, v53, v54, v55);
          if (!v57) {
            goto LABEL_28;
          }
          uint64_t v62 = (void *)v57;
          objc_msgSend_interfaceName(v32, v58, v59, v60, v61);
          double v63 = (void *)objc_claimAutoreleasedReturnValue();
          int v67 = objc_msgSend_isEqual_(v6, v64, (uint64_t)v63, v65, v66);

          if (v67) {
            goto LABEL_27;
          }
        }
      }
    }

    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v102, (uint64_t)v106, 16);
    if (v29) {
      continue;
    }
    break;
  }

  id v68 = 0LL;
  uint64_t v69 = v100;
LABEL_40:

  if ((_DWORD)v4 == 7 && !v68 && v69)
  {
    objc_msgSend_capabilities_(v69, v74, 0, v75, v76);
    unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_containsObject_(v77, v78, (uint64_t)&unk_189E88CD0, v79, v80) & 1) != 0
      || objc_msgSend_containsObject_(v77, v81, (uint64_t)&unk_189E88CE8, v82, v83))
    {
      __uint64_t v84 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (v85)
      {
        CWFGetOSLog();
        uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v86 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v87 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        int v107 = 134219266;
        unint64_t v108 = v84 / 0x3B9ACA00;
        __int16 v109 = 2048;
        unint64_t v110 = v84 % 0x3B9ACA00 / 0x3E8;
        __int16 v111 = 2082;
        uint64_t v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
        __int16 v113 = 2082;
        __int128 v114 = "CWFXPCRequestProxy.m";
        __int16 v115 = 1024;
        int v116 = 3867;
        __int16 v117 = 2114;
        uint64_t v118 = v69;
        _os_log_send_and_compose_impl();
      }

      id v68 = v69;
    }

    else
    {
      id v68 = 0LL;
    }
  }

  if (!v68)
  {
    __uint64_t v88 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      CWFGetOSLog();
      uint64_t v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v90 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v91 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      sub_1864536D0(v4, v92, v93, v94, v95);
      uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
      int v107 = 134219522;
      unint64_t v108 = v88 / 0x3B9ACA00;
      __int16 v109 = 2048;
      unint64_t v110 = v88 % 0x3B9ACA00 / 0x3E8;
      __int16 v111 = 2082;
      uint64_t v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
      __int16 v113 = 2082;
      __int128 v114 = "CWFXPCRequestProxy.m";
      __int16 v115 = 1024;
      int v116 = 3875;
      __int16 v117 = 2114;
      uint64_t v118 = v96;
      __int16 v119 = 2114;
      id v120 = v6;
      _os_log_send_and_compose_impl();
    }
  }

  return v68;
}

- (id)__apple80211WithInterfaceName:(id)a3
{
  id v7 = a3;
  apple80211Map = self->_apple80211Map;
  if (v7) {
    objc_msgSend_objectForKeyedSubscript_(apple80211Map, v4, (uint64_t)v7, v5, v6);
  }
  else {
    objc_msgSend_objectForKeyedSubscript_(apple80211Map, v4, (uint64_t)&stru_189E65678, v5, v6);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v12 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }

  return v9;
}

- (id)apple80211WithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  unint64_t v15 = sub_1864C1CE4;
  unint64_t v16 = sub_1864C1CF4;
  id v17 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864D1878;
  block[3] = &unk_189E5C270;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)apple80211WithVirtualInterfaceRole:(int)a3 parentInterfaceName:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0LL;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_1864C1CE4;
  uint64_t v19 = sub_1864C1CF4;
  id v20 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_1864D19A4;
  v11[3] = &unk_189E5C038;
  id v12 = v6;
  uint64_t v13 = &v15;
  int v14 = a3;
  v11[4] = self;
  id v8 = v6;
  dispatch_sync(mutexQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)__EAP8021XWithInterfaceName:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_EAP8021XMap, v5, (uint64_t)v4, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      CWFGetOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v11 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }

  return v8;
}

- (id)EAP8021XWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1864C1CE4;
  unint64_t v16 = sub_1864C1CF4;
  id v17 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864D1C6C;
  block[3] = &unk_189E5C270;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)__SCNetworkServiceWithInterfaceName:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_SCNetworkServiceMap, v5, (uint64_t)v4, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      CWFGetOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v11 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }

  return v8;
}

- (id)SCNetworkServiceWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1864C1CE4;
  unint64_t v16 = sub_1864C1CF4;
  id v17 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864D1F30;
  block[3] = &unk_189E5C270;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)__SCNetworkInterfaceWithInterfaceName:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_SCNetworkInterfaceMap, v5, (uint64_t)v4, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      CWFGetOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v11 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }

  return v8;
}

- (id)SCNetworkInterfaceWithInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1864C1CE4;
  unint64_t v16 = sub_1864C1CF4;
  id v17 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864D21F4;
  block[3] = &unk_189E5C270;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)__updateEventRegistration:(id)a3 XPCManager:(id)a4
{
  id v47 = a3;
  id v9 = a4;
  id v10 = v47;
  if (!v47)
  {
    uint64_t v28 = 0LL;
    goto LABEL_13;
  }

  objc_msgSend_info(v47, v5, v6, v7, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)@"EventID", v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (objc_msgSend_type(v15, v16, v17, v18, v19) == 12)
    {
      objc_msgSend_supportedRequestTypes(v9, v20, v21, v22, v23);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(MEMORY[0x189604010], v25, (uint64_t)&unk_189E8AA88, v26, v27);
LABEL_8:
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isSubsetOfSet_(v36, v37, (uint64_t)v24, v38, v39))
      {
        uint64_t v28 = 0LL;
      }

      else
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v40, *MEMORY[0x189607688], 45, 0);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_12;
    }

    if (objc_msgSend_type(v15, v20, v21, v22, v23) == 13)
    {
      objc_msgSend_supportedRequestTypes(v9, v29, v30, v31, v32);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(MEMORY[0x189604010], v33, (uint64_t)&unk_189E8AAA0, v34, v35);
      goto LABEL_8;
    }

    uint64_t v28 = 0LL;
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v16, *MEMORY[0x189607688], 22, 0);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

- (void)__updateEventMonitoring:(id)a3
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864D2474;
  block[3] = &unk_189E5BF78;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(mutexQueue, block);
}

- (void)__getSystemEventIDs:(id)a3 XPCManager:(id)a4
{
  id v29 = a3;
  uint64_t v5 = (void *)MEMORY[0x189603FC8];
  id v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredEventIDs(v6, v12, v13, v14, v15);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)@"Result", v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    uint64_t v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v28)[2](v28, 0LL, v11);
  }
}

- (void)__getSystemActivities:(id)a3 XPCManager:(id)a4
{
  id v29 = a3;
  uint64_t v5 = (void *)MEMORY[0x189603FC8];
  id v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredActivities(v6, v12, v13, v14, v15);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)@"Result", v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    uint64_t v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v28)[2](v28, 0LL, v11);
  }
}

- (void)__performScan:(id)a3 XPCConnection:(id)a4
{
  uint64_t v269 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v249 = self;
    objc_msgSend_info(v6, v21, v22, v23, v24);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)@"ScanParams", v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      if (!objc_msgSend_numberOfScans(v30, v43, v44, v45, v46)) {
        objc_msgSend_setNumberOfScans_(v30, v47, 1, v49, v50);
      }
      objc_msgSend_channels(v30, v47, v48, v49, v50);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

      v247 = v25;
      id v248 = v7;
      if (v51)
      {
        v245 = v17;
        id v246 = v6;
        objc_msgSend_dictionary(MEMORY[0x189603FC8], v52, v53, v54, v55);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x189603FA8], v57, v58, v59, v60);
        uint64_t v252 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v257 = 0u;
        __int128 v258 = 0u;
        __int128 v259 = 0u;
        __int128 v260 = 0u;
        uint64_t v250 = v30;
        objc_msgSend_channels(v30, v61, v62, v63, v64);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v257, (uint64_t)v267, 16);
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v258;
          do
          {
            for (uint64_t i = 0LL; i != v68; ++i)
            {
              if (*(void *)v258 != v69) {
                objc_enumerationMutation(v65);
              }
              id v71 = *(id *)(*((void *)&v257 + 1) + 8 * i);
              if (objc_msgSend_width(v71, v72, v73, v74, v75) != 20)
              {
                CWFGetOSLog();
                uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80)
                {
                  CWFGetOSLog();
                  uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  uint64_t v81 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v82 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                {
                  int v265 = 138543362;
                  id v266 = v71;
                  LODWORD(v244) = 12;
                  __uint64_t v243 = &v265;
                  _os_log_send_and_compose_impl();
                }

                uint64_t v87 = objc_msgSend_channel(v71, v83, v84, v85, v86);
                uint64_t v92 = objc_msgSend_band(v71, v88, v89, v90, v91);
                uint64_t v94 = objc_msgSend_channelWithNumber_band_width_(CWFChannel, v93, v87, v92, 20);

                id v71 = (id)v94;
              }

              uint64_t v95 = objc_msgSend_band(v71, v76, v77, v78, v79, v243, v244);
              objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v96, v95, v97, v98);
              uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v56, v100, (uint64_t)v99, v101, v102);
              __int128 v103 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v103)
              {
                objc_msgSend_set(MEMORY[0x189603FE0], v104, v105, v106, v107);
                __int128 v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v108, v95, v109, v110);
                __int16 v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v56, v112, (uint64_t)v103, (uint64_t)v111, v113);
              }

              __int128 v114 = (void *)MEMORY[0x189607968];
              uint64_t v115 = objc_msgSend_channel(v71, v104, v105, v106, v107);
              objc_msgSend_numberWithUnsignedInteger_(v114, v116, v115, v117, v118);
              __int16 v119 = (void *)objc_claimAutoreleasedReturnValue();
              char v123 = objc_msgSend_containsObject_(v103, v120, (uint64_t)v119, v121, v122);

              if ((v123 & 1) == 0)
              {
                uint64_t v128 = (void *)MEMORY[0x189607968];
                uint64_t v129 = objc_msgSend_channel(v71, v124, v125, v126, v127);
                objc_msgSend_numberWithUnsignedInteger_(v128, v130, v129, v131, v132);
                id v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v103, v134, (uint64_t)v133, v135, v136);

                objc_msgSend_addObject_(v252, v137, (uint64_t)v71, v138, v139);
              }
            }

            uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_( v65,  v140,  (uint64_t)&v257,  (uint64_t)v267,  16);
          }

          while (v68);
        }

        unint64_t v141 = v250;
        id v142 = v252;
        objc_msgSend_setChannels_(v250, v143, (uint64_t)v252, v144, v145);
        uint64_t v17 = v245;
        id v6 = v246;
      }

      else
      {
        objc_msgSend_countryCode_(v25, v52, 0, v54, v55);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_supportedChannelsWithCountryCode_error_(v25, v146, (uint64_t)v56, 0, v147);
        id v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x189603FA8], v149, v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v261 = 0u;
        __int128 v262 = 0u;
        __int128 v263 = 0u;
        __int128 v264 = 0u;
        id v142 = v148;
        uint64_t v155 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v154, (uint64_t)&v261, (uint64_t)v268, 16);
        if (v155)
        {
          uint64_t v160 = v155;
          uint64_t v161 = *(void *)v262;
          do
          {
            for (uint64_t j = 0LL; j != v160; ++j)
            {
              if (*(void *)v262 != v161) {
                objc_enumerationMutation(v142);
              }
              v163 = *(void **)(*((void *)&v261 + 1) + 8 * j);
              if (objc_msgSend_width(v163, v156, v157, v158, v159) == 20
                && (!objc_msgSend_is6GHz(v163, v156, v157, v158, v159)
                 || objc_msgSend_is6GHzPSC(v163, v156, v157, v158, v159)
                 && (objc_msgSend_exclude6GChannels(v30, v156, v157, v158, v159) & 1) == 0)
                && (!objc_msgSend_is6GHz(v163, v156, v157, v158, v159)
                 || objc_msgSend_scanType(v30, v156, v164, v158, v159) != 9))
              {
                objc_msgSend_addObject_(v153, v156, (uint64_t)v163, v158, v159);
              }
            }

            uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_( v142,  v156,  (uint64_t)&v261,  (uint64_t)v268,  16);
          }

          while (v160);
        }

        unint64_t v141 = v30;
        objc_msgSend_setChannels_(v30, v165, (uint64_t)v153, v166, v167);
      }

      id v7 = v248;

      uint64_t v25 = v247;
      self = v249;
LABEL_47:
      objc_msgSend_delegate(self, v168, v169, v170, v171);
      id v172 = (void *)objc_claimAutoreleasedReturnValue();
      if (v172)
      {
        v173 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
        objc_msgSend_setType_(v173, v174, 64, v175, v176);
        objc_msgSend_requestParameters(v6, v177, v178, v179, v180);
        uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRequestParameters_(v173, v182, (uint64_t)v181, v183, v184);

        objc_msgSend_info(v6, v185, v186, v187, v188);
        uint64_t v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInfo_(v173, v190, (uint64_t)v189, v191, v192);

        v253[0] = MEMORY[0x1895F87A8];
        v253[1] = 3221225472LL;
        v253[2] = sub_1864D3094;
        v253[3] = &unk_189E5D370;
        uint64_t v251 = v141;
        id v254 = v141;
        id v255 = v6;
        id v256 = v25;
        objc_msgSend_setResponse_(v173, v193, (uint64_t)v253, v194, v195);
        CWFGetOSLog();
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        if (v196)
        {
          CWFGetOSLog();
          uint64_t v197 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v197 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v200 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_info(v173, v201, v202, v203, v204);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v205, v206, (uint64_t)@"ScanParams", v207, v208);
          id v209 = v17;
          id v210 = v7;
          uint64_t v211 = (void *)objc_claimAutoreleasedReturnValue();
          int v265 = 138543362;
          id v266 = v211;
          _os_log_send_and_compose_impl();

          id v7 = v210;
          uint64_t v17 = v209;
        }

        objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v172,  v212,  (uint64_t)self,  (uint64_t)v7,  (uint64_t)v173);
        uint64_t v213 = v254;
        unint64_t v141 = v251;
      }

      else
      {
        CWFGetOSLog();
        uint64_t v198 = (void *)objc_claimAutoreleasedReturnValue();
        if (v198)
        {
          CWFGetOSLog();
          uint64_t v199 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v199 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v214 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
        {
          uint64_t v219 = objc_msgSend_type(v6, v215, v216, v217, v218);
          sub_1864504C4(v219, v220, v221, v222, v223);
          dispatch_block_t v224 = (void *)objc_claimAutoreleasedReturnValue();
          int v265 = 138543362;
          id v266 = v224;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_response(v6, v225, v226, v227, v228);
        uint64_t v229 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v229) {
          goto LABEL_62;
        }
        objc_msgSend_response(v6, v230, v231, v232, v233);
        v173 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v234, *MEMORY[0x189607688], 45, 0);
        uint64_t v213 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(CWFXPCRequest *, void *, void))v173->super.super._iop.__nextOp)(v173, v213, 0LL);
      }

LABEL_62:
      uint64_t v235 = 0LL;
      goto LABEL_63;
    }

    self = v249;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v31, *MEMORY[0x189607688], 22, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v21, *MEMORY[0x189607688], 6, 0);
  }
  uint64_t v236 = ;
  if (!v236)
  {
    unint64_t v141 = 0LL;
    goto LABEL_47;
  }

  uint64_t v235 = (void *)v236;
  objc_msgSend_response(v6, v168, v169, v170, v171);
  uint64_t v237 = (void *)objc_claimAutoreleasedReturnValue();

  if (v237)
  {
    objc_msgSend_response(v6, v238, v239, v240, v241);
    v242 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v242)[2](v242, v235, 0LL);
  }

- (void)__setChannel:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_info(v4, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)@"Channel", v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v24, (uint64_t)v14, v25, v26);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      uint64_t v31 = v27;
      objc_msgSend_countryCode_(v27, v28, 0, v29, v30);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_supportedChannelsWithCountryCode_error_(v31, v33, (uint64_t)v32, 0, v34);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      char v39 = objc_msgSend_containsObject_(v35, v36, (uint64_t)v23, v37, v38);

      if ((v39 & 1) != 0)
      {
        objc_msgSend_powerOn_(v31, v40, 0, v41, v42);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
        char v48 = objc_msgSend_BOOLValue(v43, v44, v45, v46, v47);

        if ((v48 & 1) != 0)
        {
          objc_msgSend_BSSID_(v31, v49, 0, v50, v51);
          __int16 v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v52)
          {
            id v67 = 0LL;
            objc_msgSend_setChannel_error_(v31, v53, (uint64_t)v23, (uint64_t)&v67, v54);
            id v55 = v67;
LABEL_7:
            uint64_t v56 = v55;

            goto LABEL_8;
          }

          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v53, *MEMORY[0x189607688], 1, 0);
        }

        else
        {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v49, *MEMORY[0x189607688], 82, 0);
        }
      }

      else
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v40, *MEMORY[0x189607688], 45, 0);
      }

      id v55 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v28, *MEMORY[0x189607688], 6, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v24, *MEMORY[0x189607688], 22, 0);
  }

  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend_response(v4, v57, v58, v59, v60);
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_response(v4, v62, v63, v64, v65);
    uint64_t v66 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v66)[2](v66, v56, 0LL);
  }
}

- (void)__getWEPSubtype:(id)a3
{
  id v89 = a3;
  objc_msgSend_requestParameters(v89, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v17;
  if (v17)
  {
    objc_msgSend_SSID_(v17, v18, 0, v19, v20);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend_authType_(v21, v22, 0, v24, v25);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v27, v28, v29, v30, v31) == 16
        && (id v27 = v27,
            (*(_DWORD *)(objc_msgSend_bytes(v27, v32, v33, v34, v35) + 4) - 3) >= 0xFFFFFFFE))
      {
        objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
        uint64_t v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(self, v37, (uint64_t)v13, 0, v40);
          char v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_EAP8021XWithInterfaceName_(self, v49, (uint64_t)v13, v50, v51);
          __int16 v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_supplicantState_(v52, v53, 0, v54, v55);
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
          int v61 = objc_msgSend_unsignedIntValue(v56, v57, v58, v59, v60);

          uint64_t v41 = 0LL;
          else {
            uint64_t v47 = &unk_189E88C88;
          }
          goto LABEL_11;
        }

        uint64_t v41 = v36;
        uint64_t v42 = (void *)MEMORY[0x189607968];
        uint64_t v43 = objc_msgSend_WEPSubtype(v36, v37, v38, v39, v40);
        objc_msgSend_numberWithInteger_(v42, v44, v43, v45, v46);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v41 = 0LL;
        uint64_t v47 = 0LL;
      }

- (void)__getWAPISubtype:(id)a3
{
  id v75 = a3;
  objc_msgSend_requestParameters(v75, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v17;
  if (v17)
  {
    objc_msgSend_SSID_(v17, v18, 0, v19, v20);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(self, v22, (uint64_t)v13, 0, v25);
      id v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v27, v28, v29, v30, v31);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      int isEqualToData = objc_msgSend_isEqualToData_(v32, v33, (uint64_t)v26, v34, v35);

      if (isEqualToData)
      {
        objc_msgSend_authType_(v21, v22, 0, v24, v25);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_length(v37, v38, v39, v40, v41) == 16
          && (id v37 = v37, *(_DWORD *)(objc_msgSend_bytes(v37, v42, v43, v44, v45) + 8) == 512))
        {
          uint64_t v46 = (void *)MEMORY[0x189607968];
          uint64_t v47 = objc_msgSend_WAPISubtype(v27, v22, v23, v24, v25);
          objc_msgSend_numberWithInteger_(v46, v48, v47, v49, v50);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v51 = 0LL;
        }

- (void)__getSecurity:(id)a3
{
  id v134 = a3;
  objc_msgSend_requestParameters(v134, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v17;
  if (v17)
  {
    objc_msgSend_SSID_(v17, v18, 0, v19, v20);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend_currentNetwork_(v21, v22, 0, v24, v25);
      id v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_authType_(v21, v28, 0, v29, v30);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v31, v32, v33, v34, v35) == 16)
      {
        id v133 = v21;
        uint64_t v36 = v26;
        id v37 = v13;
        id v38 = v31;
        unint64_t v43 = *(unsigned int *)(objc_msgSend_bytes(v38, v39, v40, v41, v42) + 8);
        id v44 = v38;
        int v49 = *(_DWORD *)(objc_msgSend_bytes(v44, v45, v46, v47, v48) + 4);
        id v31 = v44;
        int v132 = *(_DWORD *)(objc_msgSend_bytes(v31, v50, v51, v52, v53) + 12);
        objc_msgSend_scanRecord(v27, v54, v55, v56, v57);
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v58, v59, (uint64_t)@"RSN_IE", v60, v61);
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v62, v63, (uint64_t)@"IE_KEY_RSN_MCIPHER", v64, v65);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
        int v71 = objc_msgSend_intValue(v66, v67, v68, v69, v70);

        uint64_t v72 = v27;
        objc_msgSend_scanRecord(v27, v73, v74, v75, v76);
        uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v77, v78, (uint64_t)@"SCAN_RESULT_OWE_MULTI_SSID", v79, v80);
        uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
        int v86 = objc_msgSend_BOOLValue(v81, v82, v83, v84, v85);

        if (v49 == 2)
        {
          uint64_t v13 = v37;
          uint64_t v26 = v36;
          id v27 = v72;
          uint64_t v21 = v133;
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v87, 1, v89, v90);
LABEL_34:
          uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
          objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
          unint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v108, v109, (uint64_t)v107, (uint64_t)@"Result", v110);
          objc_msgSend_response(v134, v111, v112, v113, v114);
          uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue();

          if (v115)
          {
            objc_msgSend_response(v134, v116, v117, v118, v119);
            id v120 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            uint64_t v125 = (void *)objc_msgSend_copy(v108, v121, v122, v123, v124);
            ((void (**)(void, void, void *))v120)[2](v120, 0LL, v125);
          }

          uint64_t v26 = 0LL;
          goto LABEL_38;
        }

        int v131 = v86;
        BOOL v91 = v49 == 1;
        uint64_t v13 = v37;
        uint64_t v26 = v36;
        id v27 = v72;
        uint64_t v21 = v133;
        if (!v91)
        {
LABEL_31:
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v87, 512, v89, v90);
          goto LABEL_34;
        }

        uint64_t v92 = (__rbit32(v43) >> 28) & 0xC;
        if ((v43 & 0x884) != 0)
        {
          if (v71 == 2)
          {
            v92 |= 0x28uLL;
          }

          else if (objc_msgSend_isMFPCapable(v72, v87, v88, v89, v90) {
                 && (int isMFPRequired = objc_msgSend_isMFPRequired(v72, v87, v88, v89, v90), (v43 & 4) == 0)
          }
                 && isMFPRequired)
          {
            v92 |= 0x80uLL;
          }

          else
          {
            v92 |= 0x20uLL;
          }
        }

        uint64_t v94 = 16LL;
        if (v71 == 2) {
          uint64_t v94 = 20LL;
        }
        if ((v43 & 0x418) == 0) {
          uint64_t v94 = 0LL;
        }
        uint64_t v95 = v92 | v94;
        if ((v43 & 0xC000) != 0) {
          v95 |= 0x80uLL;
        }
        if ((v43 & 0x33000) != 0) {
          v95 |= 0x40uLL;
        }
        uint64_t v96 = v95 | (v43 >> 8) & 2;
        objc_msgSend_SSID(v72, v87, v88, v89, v90);
        uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToData_(v97, v98, (uint64_t)v26, v99, v100))
        {
          unsigned int isWEP = objc_msgSend_isWEP(v72, v101, v102, v103, v104);

          v96 |= isWEP;
        }

        else
        {
        }

        uint64_t v106 = 256LL;
        if (v131) {
          uint64_t v106 = 768LL;
        }
        if ((v132 & 1) != 0)
        {
          uint64_t v96 = v106;
        }

        else if (!v96)
        {
          goto LABEL_31;
        }

        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v87, v96, v89, v90);
        goto LABEL_34;
      }

- (void)__getKnownNetworkMatchingNetworkProfile:(id)a3
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_info(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)@"NetworkProfile", v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    uint64_t v84 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 22, 0);
    if (v84)
    {
      uint64_t v83 = (void *)v84;
      objc_msgSend_response(v4, v19, v20, v21, v22);
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
      {
        objc_msgSend_response(v4, v86, v87, v88, v89);
        uint64_t v90 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *, void))v90)[2](v90, v83, 0LL);
      }

      goto LABEL_25;
    }

- (void)__getKnownNetworkMatchingScanResult:(id)a3
{
  id v48 = a3;
  objc_msgSend_info(v48, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)@"ScanResult", v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend___knownNetworkProfiles(self, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864528AC(v12, v17);
    uint64_t v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v18, (uint64_t)@"Result", v25);
    objc_msgSend_response(v48, v26, v27, v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend_response(v48, v31, v32, v33, v34);
      uint64_t v35 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v40 = (void *)objc_msgSend_copy(v23, v36, v37, v38, v39);
      ((void (**)(void, void, void *))v35)[2](v35, 0LL, v40);
    }

    uint64_t v41 = 0LL;
    goto LABEL_6;
  }

  uint64_t v42 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 22, 0);
  if (!v42)
  {
    uint64_t v18 = 0LL;
    goto LABEL_3;
  }

  uint64_t v41 = (void *)v42;
  objc_msgSend_response(v48, v19, v20, v21, v22);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43) {
    goto LABEL_7;
  }
  objc_msgSend_response(v48, v44, v45, v46, v47);
  uint64_t v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v18)[2](v18, v41, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__addKnownNetwork:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_info(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)@"NetworkProfile", v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_SSID(v16, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = v21;
    if (!v21
      || objc_msgSend_length(v21, v17, v22, v23, v24)
      && (unint64_t)objc_msgSend_length(v25, v17, v26, v27, v28) < 0x21)
    {
      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  uint64_t v57 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v17, *MEMORY[0x189607688], 22, 0);
  if (!v57)
  {
LABEL_5:
    objc_msgSend_delegate(self, v17, v22, v23, v24);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = v29;
    if (v29)
    {
      objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v29, v30, (uint64_t)self, (uint64_t)v7, (uint64_t)v6);
    }

    else
    {
      CWFGetOSLog();
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        CWFGetOSLog();
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v33 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v34 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = objc_msgSend_type(v6, v35, v36, v37, v38);
        sub_1864504C4(v39, v40, v41, v42, v43);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_response(v6, v44, v45, v46, v47);
      id v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend_response(v6, v49, v50, v51, v52);
        uint64_t v53 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v54, *MEMORY[0x189607688], 45, 0);
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *, void))v53)[2](v53, v55, 0LL);
      }
    }

    uint64_t v56 = 0LL;
    goto LABEL_15;
  }

  uint64_t v56 = (void *)v57;
  objc_msgSend_response(v6, v17, v22, v23, v24);
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend_response(v6, v59, v60, v61, v62);
    uint64_t v63 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v63)[2](v63, v56, 0LL);
  }

- (void)__getApple80211:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    uint64_t v23 = objc_msgSend_type(v4, v18, v19, v20, v21);
    switch(v23)
    {
      case 1LL:
        uint64_t v28 = objc_msgSend_interfaceNames(self, v24, v25, v26, v27);
        goto LABEL_11;
      case 2LL:
        uint64_t v28 = objc_msgSend_virtualInterfaceNames(self, v24, v25, v26, v27);
LABEL_11:
        uint64_t v33 = (void *)v28;
        goto LABEL_88;
      case 3LL:
      case 6LL:
      case 8LL:
      case 10LL:
      case 12LL:
      case 13LL:
      case 14LL:
      case 17LL:
      case 23LL:
      case 33LL:
      case 34LL:
      case 35LL:
      case 36LL:
      case 37LL:
LABEL_8:
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v24, *MEMORY[0x189607688], 45, 0);
        goto LABEL_9;
      case 4LL:
        uint64_t v138 = 0LL;
        objc_msgSend_capabilities_(v22, v24, (uint64_t)&v138, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v138;
        goto LABEL_84;
      case 5LL:
        uint64_t v137 = 0LL;
        objc_msgSend_powerOn_(v22, v24, (uint64_t)&v137, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v137;
        goto LABEL_84;
      case 7LL:
        uint64_t v136 = 0LL;
        objc_msgSend_SSID_(v22, v24, (uint64_t)&v136, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v136;
        goto LABEL_84;
      case 9LL:
        uint64_t v135 = 0LL;
        objc_msgSend_BSSID_(v22, v24, (uint64_t)&v135, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v135;
        goto LABEL_84;
      case 11LL:
        id v134 = 0LL;
        objc_msgSend_authType_(v22, v24, (uint64_t)&v134, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v134;
        goto LABEL_84;
      case 15LL:
        objc_msgSend_info(v4, v24, v25, v26, v27);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)@"CountryCode", v38, v39);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        id v130 = 0LL;
        objc_msgSend_supportedChannelsWithCountryCode_error_(v22, v41, (uint64_t)v40, (uint64_t)&v130, v42);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v35 = v130;

        break;
      case 16LL:
        int v132 = 0LL;
        objc_msgSend_channel_(v22, v24, (uint64_t)&v132, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v132;
        goto LABEL_84;
      case 18LL:
        uint64_t v128 = 0LL;
        objc_msgSend_perAntennaRSSI_(v22, v24, (uint64_t)&v128, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v128;
        goto LABEL_84;
      case 19LL:
        uint64_t v127 = 0LL;
        objc_msgSend_noise_(v22, v24, (uint64_t)&v127, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v127;
        goto LABEL_84;
      case 20LL:
        uint64_t v123 = 0LL;
        objc_msgSend_txRate_(v22, v24, (uint64_t)&v123, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v123;
        goto LABEL_84;
      case 21LL:
        uint64_t v122 = 0LL;
        objc_msgSend_txPower_(v22, v24, (uint64_t)&v122, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v122;
        goto LABEL_84;
      case 22LL:
        id v133 = 0LL;
        objc_msgSend_countryCode_(v22, v24, (uint64_t)&v133, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v133;
        goto LABEL_84;
      case 24LL:
        uint64_t v121 = 0LL;
        objc_msgSend_DTIMInterval_(v22, v24, (uint64_t)&v121, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v121;
        goto LABEL_84;
      case 25LL:
        id v120 = 0LL;
        objc_msgSend_guardInterval_(v22, v24, (uint64_t)&v120, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v120;
        goto LABEL_84;
      case 26LL:
        uint64_t v119 = 0LL;
        objc_msgSend_MCSIndex_(v22, v24, (uint64_t)&v119, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v119;
        goto LABEL_84;
      case 27LL:
        uint64_t v118 = 0LL;
        objc_msgSend_numberOfSpatialStreams_(v22, v24, (uint64_t)&v118, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v118;
        goto LABEL_84;
      case 28LL:
        uint64_t v125 = 0LL;
        objc_msgSend_supportedPHYModes_(v22, v24, (uint64_t)&v125, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v125;
        goto LABEL_84;
      case 29LL:
        uint64_t v126 = 0LL;
        objc_msgSend_activePHYMode_(v22, v24, (uint64_t)&v126, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v126;
        goto LABEL_84;
      case 30LL:
        uint64_t v124 = 0LL;
        objc_msgSend_opMode_(v22, v24, (uint64_t)&v124, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v124;
        goto LABEL_84;
      case 31LL:
        uint64_t v117 = 0LL;
        objc_msgSend_virtualInterfaceRole_(v22, v24, (uint64_t)&v117, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v117;
        goto LABEL_84;
      case 32LL:
        int v116 = 0LL;
        objc_msgSend_virtualInterfaceParent_(v22, v24, (uint64_t)&v116, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v116;
        goto LABEL_84;
      case 38LL:
        int v131 = 0LL;
        objc_msgSend_wowEnabled_(v22, v24, (uint64_t)&v131, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v131;
        goto LABEL_84;
      case 39LL:
        uint64_t v115 = 0LL;
        objc_msgSend_AWDLSyncEnabled_(v22, v24, (uint64_t)&v115, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v115;
        goto LABEL_84;
      case 40LL:
        uint64_t v101 = 0LL;
        objc_msgSend_AWDLPreferredChannels_(v22, v24, (uint64_t)&v101, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v101;
        goto LABEL_84;
      case 41LL:
        uint64_t v113 = 0LL;
        objc_msgSend_AWDLSyncState_(v22, v24, (uint64_t)&v113, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v113;
        goto LABEL_84;
      case 42LL:
        uint64_t v114 = 0LL;
        objc_msgSend_AWDLSyncChannelSequence_(v22, v24, (uint64_t)&v114, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v114;
        goto LABEL_84;
      case 43LL:
        uint64_t v112 = 0LL;
        objc_msgSend_AWDLSyncParameters_(v22, v24, (uint64_t)&v112, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v112;
        goto LABEL_84;
      case 44LL:
        uint64_t v105 = 0LL;
        objc_msgSend_AWDLStrategy_(v22, v24, (uint64_t)&v105, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v105;
        goto LABEL_84;
      case 45LL:
        uint64_t v110 = 0LL;
        objc_msgSend_AWDLElectionParameters_(v22, v24, (uint64_t)&v110, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v110;
        goto LABEL_84;
      case 46LL:
        __int16 v111 = 0LL;
        objc_msgSend_AWDLElectionID_(v22, v24, (uint64_t)&v111, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v111;
        goto LABEL_84;
      case 47LL:
        uint64_t v109 = 0LL;
        objc_msgSend_AWDLElectionRSSIThresholds_(v22, v24, (uint64_t)&v109, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v109;
        goto LABEL_84;
      case 48LL:
        uint64_t v107 = 0LL;
        objc_msgSend_AWDLPeerDatabase_(v22, v24, (uint64_t)&v107, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v107;
        goto LABEL_84;
      case 49LL:
        unint64_t v108 = 0LL;
        objc_msgSend_AWDLSocialTimeSlots_(v22, v24, (uint64_t)&v108, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v108;
        goto LABEL_84;
      case 50LL:
        uint64_t v103 = 0LL;
        objc_msgSend_AWDLMasterChannel_(v22, v24, (uint64_t)&v103, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v103;
        goto LABEL_84;
      case 51LL:
        uint64_t v102 = 0LL;
        objc_msgSend_AWDLSecondaryMasterChannel_(v22, v24, (uint64_t)&v102, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v102;
        goto LABEL_84;
      case 52LL:
        uint64_t v104 = 0LL;
        objc_msgSend_AWDLOpMode_(v22, v24, (uint64_t)&v104, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v104;
        goto LABEL_84;
      case 53LL:
        uint64_t v106 = 0LL;
        objc_msgSend_AWDLStatistics_(v22, v24, (uint64_t)&v106, v26, v27);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = v106;
        goto LABEL_84;
      default:
        switch(v23)
        {
          case 146LL:
            uint64_t v100 = 0LL;
            objc_msgSend_AWDLSidecarDiagnostics_(v22, v24, (uint64_t)&v100, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v100;
            break;
          case 147LL:
            uint64_t v99 = 0LL;
            objc_msgSend_powerState_(v22, v24, (uint64_t)&v99, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v99;
            break;
          case 148LL:
            __int128 v98 = 0LL;
            objc_msgSend_chainAck_(v22, v24, (uint64_t)&v98, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v98;
            break;
          case 149LL:
            __int128 v97 = 0LL;
            objc_msgSend_txChainPower_(v22, v24, (uint64_t)&v97, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v97;
            break;
          case 150LL:
            __int128 v96 = 0LL;
            objc_msgSend_desense_(v22, v24, (uint64_t)&v96, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v96;
            break;
          case 151LL:
            __int128 v95 = 0LL;
            objc_msgSend_desenseLevel_(v22, v24, (uint64_t)&v95, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v95;
            break;
          case 152LL:
            uint64_t v94 = 0LL;
            objc_msgSend_bluetoothCoexistenceConfig_(v22, v24, (uint64_t)&v94, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v94;
            break;
          case 153LL:
            uint64_t v93 = 0LL;
            objc_msgSend_bluetoothCoexistenceProfiles2GHz_(v22, v24, (uint64_t)&v93, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v93;
            break;
          case 154LL:
            uint64_t v92 = 0LL;
            objc_msgSend_bluetoothCoexistenceProfiles5GHz_(v22, v24, (uint64_t)&v92, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v92;
            break;
          case 155LL:
            id v91 = 0LL;
            objc_msgSend_bluetoothCoexistenceMode_(v22, v24, (uint64_t)&v91, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v91;
            break;
          case 156LL:
            uint64_t v90 = 0LL;
            objc_msgSend_leakyAPStats_(v22, v24, (uint64_t)&v90, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v90;
            break;
          case 157LL:
            uint64_t v88 = 0LL;
            objc_msgSend_AWDLExtensionStateMachineParameters_(v22, v24, (uint64_t)&v88, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v88;
            break;
          case 158LL:
            uint64_t v87 = 0LL;
            objc_msgSend_AWDLElectionMetric_(v22, v24, (uint64_t)&v87, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v87;
            break;
          case 159LL:
            int v86 = 0LL;
            objc_msgSend_AWDLPresenceMode_(v22, v24, (uint64_t)&v86, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v86;
            break;
          case 160LL:
            uint64_t v85 = 0LL;
            objc_msgSend_AWDLGuardTime_(v22, v24, (uint64_t)&v85, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v85;
            break;
          case 161LL:
            uint64_t v84 = 0LL;
            objc_msgSend_AWDLAvailabilityWindowAPAlignment_(v22, v24, (uint64_t)&v84, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v84;
            break;
          case 162LL:
            uint64_t v83 = 0LL;
            objc_msgSend_AWDLContinuousElectionAlgorithmEnabled_(v22, v24, (uint64_t)&v83, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v83;
            break;
          case 163LL:
            uint64_t v82 = 0LL;
            objc_msgSend_AWDLAFTxMode_(v22, v24, (uint64_t)&v82, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v82;
            break;
          case 164LL:
            uint64_t v81 = 0LL;
            objc_msgSend_AWDLPeerTrafficRegistration_(v22, v24, (uint64_t)&v81, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v81;
            break;
          case 165LL:
            uint64_t v80 = 0LL;
            objc_msgSend_AWDLEncryptionType_(v22, v24, (uint64_t)&v80, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v80;
            break;
          case 166LL:
            uint64_t v79 = 0LL;
            objc_msgSend_AWDLBTLEStateParameters_(v22, v24, (uint64_t)&v79, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v79;
            break;
          case 167LL:
          case 168LL:
          case 169LL:
          case 170LL:
          case 171LL:
          case 172LL:
          case 173LL:
          case 174LL:
          case 177LL:
          case 179LL:
          case 180LL:
          case 181LL:
          case 182LL:
          case 183LL:
          case 184LL:
          case 185LL:
          case 186LL:
          case 188LL:
          case 189LL:
          case 190LL:
          case 191LL:
          case 192LL:
          case 193LL:
          case 194LL:
          case 195LL:
          case 196LL:
          case 198LL:
          case 199LL:
          case 200LL:
          case 201LL:
          case 202LL:
          case 203LL:
          case 204LL:
          case 205LL:
          case 206LL:
          case 207LL:
          case 208LL:
          case 209LL:
          case 218LL:
          case 219LL:
          case 220LL:
          case 221LL:
          case 222LL:
          case 223LL:
          case 224LL:
          case 225LL:
          case 226LL:
          case 227LL:
          case 228LL:
          case 229LL:
          case 230LL:
          case 231LL:
          case 232LL:
            goto LABEL_8;
          case 175LL:
            uint64_t v89 = 0LL;
            objc_msgSend_LQMSummary_(v22, v24, (uint64_t)&v89, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v89;
            break;
          case 176LL:
            uint64_t v78 = 0LL;
            objc_msgSend_powerDebugInfo_(v22, v24, (uint64_t)&v78, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v78;
            break;
          case 178LL:
            uint64_t v77 = 0LL;
            objc_msgSend_cca_(v22, v24, (uint64_t)&v77, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v77;
            break;
          case 187LL:
            uint64_t v76 = 0LL;
            objc_msgSend_rxRate_(v22, v24, (uint64_t)&v76, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v76;
            break;
          case 197LL:
            uint64_t v70 = 0LL;
            objc_msgSend_countryBandSupport_(v22, v24, (uint64_t)&v70, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v70;
            break;
          case 210LL:
            uint64_t v129 = 0LL;
            objc_msgSend_hardwareSupportedChannels_(v22, v24, (uint64_t)&v129, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v129;
            break;
          case 211LL:
            uint64_t v75 = 0LL;
            objc_msgSend_maxLinkSpeed_(v22, v24, (uint64_t)&v75, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v75;
            break;
          case 212LL:
            uint64_t v74 = 0LL;
            objc_msgSend_state_(v22, v24, (uint64_t)&v74, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v74;
            break;
          case 213LL:
            uint64_t v72 = 0LL;
            objc_msgSend_powersave_(v22, v24, (uint64_t)&v72, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v72;
            break;
          case 214LL:
            uint64_t v73 = 0LL;
            objc_msgSend_maxNSSForAP_(v22, v24, (uint64_t)&v73, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v73;
            break;
          case 215LL:
            uint64_t v71 = 0LL;
            objc_msgSend_txNSS_(v22, v24, (uint64_t)&v71, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v71;
            break;
          case 216LL:
            uint64_t v69 = 0LL;
            objc_msgSend_beaconCache_(v22, v24, (uint64_t)&v69, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v69;
            break;
          case 217LL:
            uint64_t v68 = 0LL;
            objc_msgSend_blockedBands_(v22, v24, (uint64_t)&v68, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v68;
            break;
          case 233LL:
            uint64_t v67 = 0LL;
            objc_msgSend_hostAPStationList_(v22, v24, (uint64_t)&v67, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v67;
            break;
          case 234LL:
            uint64_t v66 = 0LL;
            objc_msgSend_LQMConfig_(v22, v24, (uint64_t)&v66, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v66;
            break;
          default:
            if (v23 != 241) {
              goto LABEL_8;
            }
            uint64_t v65 = 0LL;
            objc_msgSend_backgroundScanCache_(v22, v24, (uint64_t)&v65, v26, v27);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v34 = v65;
            break;
        }

- (void)__getWiFiUIStateFlags:(id)a3
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = v18;
  if (v18)
  {
    id v95 = 0LL;
    objc_msgSend_powerOn_(v18, v19, (uint64_t)&v95, v20, v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = v95;
    if (!v23)
    {
      CWFGetOSLog();
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        CWFGetOSLog();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v30 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v31 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v96 = 138543362;
        id v97 = v28;
        int v92 = 12;
        uint64_t v90 = &v96;
        _os_log_send_and_compose_impl();
      }
    }

    else {
      uint64_t v35 = 0LL;
    }
    id v94 = v28;
    objc_msgSend_opMode_(v22, v32, (uint64_t)&v94, v33, v34);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    id v37 = v94;

    if (!v36)
    {
      CWFGetOSLog();
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        CWFGetOSLog();
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v43 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v44 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        int v96 = 138543362;
        id v97 = v37;
        LODWORD(v93) = 12;
        id v91 = &v96;
        _os_log_send_and_compose_impl();
      }
    }

    objc_msgSend___userAutoJoinDisabled(self, v45, v46, v47, v48);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v54 = objc_msgSend_BOOLValue(v49, v50, v51, v52, v53);

    objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(self, v55, (uint64_t)v14, 0, v56);
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57) {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v58, v35 | v54 | 4, v59, v60);
    }
    else {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v58, v35 | v54, v59, v60);
    }
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v19, *MEMORY[0x189607688], 6, 0);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    id v37 = 0LL;
    uint64_t v65 = 0LL;
    uint64_t v36 = 0LL;
LABEL_25:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v61, v62, v63, v64);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v65, (uint64_t)@"Result", v68);
    objc_msgSend_response(v4, v69, v70, v71, v72);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_response(v4, v74, v75, v76, v77);
      uint64_t v78 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v83 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
      ((void (**)(void, void, void *))v78)[2](v78, 0LL, v83);
    }

    uint64_t v23 = 0LL;
    goto LABEL_28;
  }

  objc_msgSend_response(v4, v61, v62, v63, v64);
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend_response(v4, v85, v86, v87, v88);
    uint64_t v89 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v89)[2](v89, v23, 0LL);
  }

- (id)__networkStackMACAddressWithInterfaceName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  size_t __size = 0LL;
  *(_OWORD *)uint64_t v18 = xmmword_18653E8B0;
  int v19 = 3;
  id v3 = a3;
  uint64_t v8 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7);
  unsigned int v20 = if_nametoindex(v8);
  sysctl(v18, 6u, 0LL, &__size, 0LL, 0LL);
  if (!__size)
  {
LABEL_7:
    uint64_t v9 = 0LL;
    return v9;
  }

  uint64_t v9 = (unsigned __int8 *)malloc(__size);
  if (v9)
  {
    if (sysctl(v18, 6u, v9, &__size, 0LL, 0LL) < 0)
    {
      free(v9);
    }

    else
    {
      ether_addr v16 = *(ether_addr *)&v9[v9[117] + 120];
      uint64_t v10 = ether_ntoa(&v16);
      free(v9);
      if (v10)
      {
        objc_msgSend_stringWithCString_encoding_(NSString, v11, (uint64_t)v10, 4, v12);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        CWFCorrectEthernetAddressString(v13);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

        return v14;
      }
    }

    goto LABEL_7;
  }

  return v9;
}

- (void)__getMACAddress:(id)a3
{
  id v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___networkStackMACAddressWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)@"Result", v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);
    }

    uint64_t v40 = 0LL;
    goto LABEL_6;
  }

  uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v41)
  {
    uint64_t v21 = 0LL;
    goto LABEL_3;
  }

  uint64_t v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42) {
    goto LABEL_7;
  }
  objc_msgSend_response(v47, v43, v44, v45, v46);
  uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v21)[2](v21, v40, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getHardwareMACAddress:(id)a3
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v15, (uint64_t)v14, v18, v19);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        uint64_t v25 = v21;
        uint64_t v26 = objc_msgSend_hardwareAddress(v21, v15, v22, v23, v24);
        if (v26) {
          goto LABEL_17;
        }
        CWFGetOSLog();
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          CWFGetOSLog();
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v33 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          int v73 = 138543362;
          uint64_t v74 = v14;
          int v72 = 12;
          uint64_t v71 = &v73;
          _os_log_send_and_compose_impl();
        }

        uint64_t v26 = objc_msgSend___networkStackMACAddressWithInterfaceName_(self, v34, (uint64_t)v14, v35, v36);
        if (v26) {
          goto LABEL_17;
        }
        CWFGetOSLog();
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          CWFGetOSLog();
          uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v38 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v39 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          int v73 = 138543362;
          uint64_t v74 = v14;
          int v72 = 12;
          uint64_t v71 = &v73;
          _os_log_send_and_compose_impl();
        }

        uint64_t v26 = objc_msgSend_hardwareMACAddress_(v20, v40, 0, v41, v42);
        if (v26)
        {
LABEL_17:
          uint64_t v43 = (void *)v26;
LABEL_18:
          objc_msgSend_dictionary(MEMORY[0x189603FC8], v27, v28, v29, v30, v71, v72);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v43, (uint64_t)@"Result", v46);
          objc_msgSend_response(v4, v47, v48, v49, v50);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            objc_msgSend_response(v4, v52, v53, v54, v55);
            uint64_t v56 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            uint64_t v61 = (void *)objc_msgSend_copy(v44, v57, v58, v59, v60);
            ((void (**)(void, void, void *))v56)[2](v56, 0LL, v61);
          }

          uint64_t v25 = 0LL;
          goto LABEL_21;
        }

        CWFGetOSLog();
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          CWFGetOSLog();
          uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v63 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v64 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          int v73 = 138543362;
          uint64_t v74 = v14;
          int v72 = 12;
          uint64_t v71 = &v73;
          _os_log_send_and_compose_impl();
        }

LABEL_28:
        uint64_t v43 = 0LL;
        goto LABEL_18;
      }
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25) {
    goto LABEL_28;
  }
  objc_msgSend_response(v4, v27, v28, v29, v30);
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend_response(v4, v66, v67, v68, v69);
    uint64_t v70 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v70)[2](v70, v25, 0LL);
  }

- (void)__getEventIDs:(id)a3 XPCConnection:(id)a4
{
  id v29 = a3;
  uint64_t v5 = (void *)MEMORY[0x189603FC8];
  id v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredEventIDs(v6, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)@"Result", v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    uint64_t v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v28)[2](v28, 0LL, v11);
  }
}

- (void)__getActivities:(id)a3 XPCConnection:(id)a4
{
  id v29 = a3;
  uint64_t v5 = (void *)MEMORY[0x189603FC8];
  id v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredActivities(v6, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)@"Result", v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    uint64_t v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v28)[2](v28, 0LL, v11);
  }
}

- (void)__getIO80211ControllerInfo:(id)a3
{
  id v48 = a3;
  objc_msgSend_requestParameters(v48, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_IO80211ControllerInfo(self->_IO80211, v14, v15, v16, v17);
    uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
LABEL_3:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v18, v19, v20, v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v22, (uint64_t)@"Result", v25);
      objc_msgSend_response(v48, v26, v27, v28, v29);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend_response(v48, v31, v32, v33, v34);
        uint64_t v35 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v40 = (void *)objc_msgSend_copy(v23, v36, v37, v38, v39);
        ((void (**)(void, void, void *))v35)[2](v35, 0LL, v40);
      }

      uint64_t v41 = 0LL;
      goto LABEL_6;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 19, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  }
  uint64_t v42 = ;
  if (!v42)
  {
    uint64_t v22 = 0LL;
    goto LABEL_3;
  }

  uint64_t v41 = (void *)v42;
  objc_msgSend_response(v48, v18, v19, v20, v21);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43) {
    goto LABEL_7;
  }
  objc_msgSend_response(v48, v44, v45, v46, v47);
  uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v22)[2](v22, v41, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getIO80211InterfaceInfo:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    IO80211 = self->_IO80211;
    id v47 = 0LL;
    objc_msgSend_IO80211InterfaceInfo_error_(IO80211, v15, (uint64_t)v14, (uint64_t)&v47, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v47;
    if (v23) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v19, v20, v21, v22);
    uint64_t v29 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v29, v30, (uint64_t)v18, (uint64_t)@"Result", v31);
    objc_msgSend_response(v4, v32, v33, v34, v35);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend_response(v4, v37, v38, v39, v40);
      uint64_t v41 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v46 = (void *)objc_msgSend_copy(v29, v42, v43, v44, v45);
      ((void (**)(void, void, void *))v41)[2](v41, 0LL, v46);
    }

    goto LABEL_8;
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = 0LL;
  if (!v23) {
    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend_response(v4, v19, v20, v21, v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_response(v4, v25, v26, v27, v28);
    uint64_t v29 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v29)[2](v29, v23, 0LL);
LABEL_8:
  }
}

- (void)__getIPv4Addresses:(id)a3
{
  id v59 = a3;
  objc_msgSend_requestParameters(v59, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4Addresses(v17, v18, v19, v20, v21);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  if (v26) {
    goto LABEL_10;
  }
  objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = objc_msgSend_IPv4Addresses(v27, v28, v29, v30, v31);
  uint64_t v26 = (void (**)(void, void, void))v32;
  if (v27 || v17 || v32)
  {

LABEL_10:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v26, (uint64_t)@"Result", v43);
    objc_msgSend_response(v59, v44, v45, v46, v47);
    id v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_response(v59, v49, v50, v51, v52);
      uint64_t v53 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v58 = (void *)objc_msgSend_copy(v41, v54, v55, v56, v57);
      ((void (**)(void, void, void *))v53)[2](v53, 0LL, v58);
    }

    uint64_t v35 = 0LL;
    goto LABEL_13;
  }

  uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v33, *MEMORY[0x189607688], 6, 0);
  if (!v34)
  {
    uint64_t v26 = 0LL;
    goto LABEL_10;
  }

  uint64_t v35 = (void *)v34;
  objc_msgSend_response(v59, v22, v23, v24, v25);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v59, v37, v38, v39, v40);
    uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v26)[2](v26, v35, 0LL);
LABEL_13:
  }
}

- (void)__getIPv4SubnetMasks:(id)a3
{
  id v59 = a3;
  objc_msgSend_requestParameters(v59, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4SubnetMasks(v17, v18, v19, v20, v21);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  if (v26) {
    goto LABEL_10;
  }
  objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = objc_msgSend_IPv4SubnetMasks(v27, v28, v29, v30, v31);
  uint64_t v26 = (void (**)(void, void, void))v32;
  if (v27 || v17 || v32)
  {

LABEL_10:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v26, (uint64_t)@"Result", v43);
    objc_msgSend_response(v59, v44, v45, v46, v47);
    id v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_response(v59, v49, v50, v51, v52);
      uint64_t v53 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v58 = (void *)objc_msgSend_copy(v41, v54, v55, v56, v57);
      ((void (**)(void, void, void *))v53)[2](v53, 0LL, v58);
    }

    uint64_t v35 = 0LL;
    goto LABEL_13;
  }

  uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v33, *MEMORY[0x189607688], 6, 0);
  if (!v34)
  {
    uint64_t v26 = 0LL;
    goto LABEL_10;
  }

  uint64_t v35 = (void *)v34;
  objc_msgSend_response(v59, v22, v23, v24, v25);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v59, v37, v38, v39, v40);
    uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v26)[2](v26, v35, 0LL);
LABEL_13:
  }
}

- (void)__getGlobalIPv4Addresses:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv4Addresses(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getIPv6Addresses:(id)a3
{
  id v59 = a3;
  objc_msgSend_requestParameters(v59, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv6Addresses(v17, v18, v19, v20, v21);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  if (v26) {
    goto LABEL_10;
  }
  objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = objc_msgSend_IPv6Addresses(v27, v28, v29, v30, v31);
  uint64_t v26 = (void (**)(void, void, void))v32;
  if (v27 || v17 || v32)
  {

LABEL_10:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v26, (uint64_t)@"Result", v43);
    objc_msgSend_response(v59, v44, v45, v46, v47);
    id v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_response(v59, v49, v50, v51, v52);
      uint64_t v53 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v58 = (void *)objc_msgSend_copy(v41, v54, v55, v56, v57);
      ((void (**)(void, void, void *))v53)[2](v53, 0LL, v58);
    }

    uint64_t v35 = 0LL;
    goto LABEL_13;
  }

  uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v33, *MEMORY[0x189607688], 6, 0);
  if (!v34)
  {
    uint64_t v26 = 0LL;
    goto LABEL_10;
  }

  uint64_t v35 = (void *)v34;
  objc_msgSend_response(v59, v22, v23, v24, v25);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v59, v37, v38, v39, v40);
    uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v26)[2](v26, v35, 0LL);
LABEL_13:
  }
}

- (void)__getGlobalIPv6Addresses:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv6Addresses(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getIPv4ARPResolvedHardwareAddress:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_IPv4ARPResolvedHardwareAddress((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getIPv4ARPResolvedIPAddress:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_IPv4ARPResolvedIPAddress((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getIPv4Router:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_IPv4Router((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getGlobalIPv4Router:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv4Router(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getIPv6Router:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_IPv6Router((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getGlobalIPv6Router:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv6Router(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getGlobalIPv4InterfaceName:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv4InterfaceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getGlobalIPv6InterfaceName:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv6InterfaceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getNetServiceID:(id)a3
{
  id v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      objc_msgSend_serviceID(v17, v14, v18, v19, v20);
      uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)@"Result", v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        uint64_t v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(void, void, void *))v39)[2](v39, 0LL, v44);
      }

      uint64_t v21 = 0LL;
      goto LABEL_7;
    }
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    uint64_t v26 = 0LL;
    goto LABEL_4;
  }

  objc_msgSend_response(v50, v22, v23, v24, v25);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45) {
    goto LABEL_8;
  }
  objc_msgSend_response(v50, v46, v47, v48, v49);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v26)[2](v26, v21, 0LL);
LABEL_7:

LABEL_8:
}

- (void)__getNetServiceName:(id)a3
{
  id v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      objc_msgSend_serviceName(v17, v14, v18, v19, v20);
      uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)@"Result", v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        uint64_t v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(void, void, void *))v39)[2](v39, 0LL, v44);
      }

      uint64_t v21 = 0LL;
      goto LABEL_7;
    }
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    uint64_t v26 = 0LL;
    goto LABEL_4;
  }

  objc_msgSend_response(v50, v22, v23, v24, v25);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45) {
    goto LABEL_8;
  }
  objc_msgSend_response(v50, v46, v47, v48, v49);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v26)[2](v26, v21, 0LL);
LABEL_7:

LABEL_8:
}

- (void)__getNetServiceEnabled:(id)a3
{
  id v54 = a3;
  objc_msgSend_requestParameters(v54, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      objc_msgSend_serviceID(v17, v14, v18, v19, v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = v22 != 0LL;

      goto LABEL_4;
    }
  }

  uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v23)
  {
LABEL_4:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v24, v25, v26, v27);
    uint64_t v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x189607968], v29, v23, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v33, (uint64_t)v32, (uint64_t)@"Result", v34);

    uint64_t v23 = objc_msgSend_response(v54, v35, v36, v37, v38);

    if (v23)
    {
      objc_msgSend_response(v54, v39, v40, v41, v42);
      uint64_t v43 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v48 = (void *)objc_msgSend_copy(v28, v44, v45, v46, v47);
      ((void (**)(void, void, void *))v43)[2](v43, 0LL, v48);

      uint64_t v23 = 0LL;
    }

    goto LABEL_6;
  }

  objc_msgSend_response(v54, v24, v25, v26, v27);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49) {
    goto LABEL_7;
  }
  objc_msgSend_response(v54, v50, v51, v52, v53);
  uint64_t v28 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  v28[2](v28, v23, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getGlobalIPv4NetServiceID:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv4ServiceID(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getGlobalIPv6NetServiceID:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv6ServiceID(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getGlobalIPv4NetServiceName:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv4ServiceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getGlobalIPv6NetServiceName:(id)a3
{
  id v31 = a3;
  objc_msgSend_IPv6ServiceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getGlobalDNSServerAddresses:(id)a3
{
  id v31 = a3;
  objc_msgSend_DNSServerAddresses(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)@"Result", v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    uint64_t v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(void, void, void *))v25)[2](v25, 0LL, v30);
  }
}

- (void)__getDNSServerAddresses:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_DNSServerAddresses((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getNetworkReachability:(id)a3
{
  id v36 = a3;
  id v4 = (void *)MEMORY[0x189607968];
  uint64_t v9 = objc_msgSend_flags(self->_SCNetworkReachability, v5, v6, v7, v8);
  objc_msgSend_numberWithUnsignedInt_(v4, v10, v9, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v13, (uint64_t)@"Result", v20);
  objc_msgSend_response(v36, v21, v22, v23, v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_response(v36, v26, v27, v28, v29);
    uint64_t v30 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v35 = (void *)objc_msgSend_copy(v18, v31, v32, v33, v34);
    ((void (**)(void, void, void *))v30)[2](v30, 0LL, v35);
  }
}

- (void)__getDHCPLeaseStartTime:(id)a3
{
  id v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      objc_msgSend_DHCPLeaseStartTimestamp(v17, v14, v18, v19, v20);
      uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)@"Result", v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        uint64_t v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(void, void, void *))v39)[2](v39, 0LL, v44);
      }

      uint64_t v21 = 0LL;
      goto LABEL_7;
    }
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    uint64_t v26 = 0LL;
    goto LABEL_4;
  }

  objc_msgSend_response(v50, v22, v23, v24, v25);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45) {
    goto LABEL_8;
  }
  objc_msgSend_response(v50, v46, v47, v48, v49);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v26)[2](v26, v21, 0LL);
LABEL_7:

LABEL_8:
}

- (void)__getDHCPLeaseExpirationTime:(id)a3
{
  id v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      objc_msgSend_DHCPLeaseExpirationTimestamp(v17, v14, v18, v19, v20);
      uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)@"Result", v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        uint64_t v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(void, void, void *))v39)[2](v39, 0LL, v44);
      }

      uint64_t v21 = 0LL;
      goto LABEL_7;
    }
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    uint64_t v26 = 0LL;
    goto LABEL_4;
  }

  objc_msgSend_response(v50, v22, v23, v24, v25);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45) {
    goto LABEL_8;
  }
  objc_msgSend_response(v50, v46, v47, v48, v49);
  uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v26)[2](v26, v21, 0LL);
LABEL_7:

LABEL_8:
}

- (void)__getDHCPServerID:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_DHCPServerID((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getDHCPv6ServerID:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_DHCPv6ServerID((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getIPv4NetworkSignature:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_IPv4NetworkSignature((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getIPv6NetworkSignature:(id)a3
{
  id v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  uint64_t v26 = objc_msgSend_IPv6NetworkSignature((void *)v17, v18, v19, v20, v21);
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0),
        (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)@"Result", v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      uint64_t v45 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(void, void, void *))v45)[2](v45, 0LL, v50);

      uint64_t v28 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v34)[2](v34, v28, 0LL);
LABEL_7:
  }
}

- (void)__getEAP8021XSupplicantState:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v18;
    if (v18)
    {
      id v52 = 0LL;
      objc_msgSend_supplicantState_(v18, v19, (uint64_t)&v52, v20, v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = v52;
      if (v28) {
        goto LABEL_4;
      }
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v24, v25, v26, v27);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)@"Result", v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        id v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(void, void, void *))v46)[2](v46, 0LL, v51);
      }

      goto LABEL_11;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v19, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = 0LL;
  if (!v28) {
    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v34)[2](v34, v28, 0LL);
LABEL_11:
  }
}

- (void)__getEAP8021XControlMode:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v18;
    if (v18)
    {
      id v52 = 0LL;
      objc_msgSend_controlMode_(v18, v19, (uint64_t)&v52, v20, v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = v52;
      if (v28) {
        goto LABEL_4;
      }
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v24, v25, v26, v27);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)@"Result", v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        id v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(void, void, void *))v46)[2](v46, 0LL, v51);
      }

      goto LABEL_11;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v19, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = 0LL;
  if (!v28) {
    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v34)[2](v34, v28, 0LL);
LABEL_11:
  }
}

- (void)__getEAP8021XControlState:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v18;
    if (v18)
    {
      id v52 = 0LL;
      objc_msgSend_controlState_(v18, v19, (uint64_t)&v52, v20, v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = v52;
      if (v28) {
        goto LABEL_4;
      }
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v24, v25, v26, v27);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)@"Result", v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        id v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(void, void, void *))v46)[2](v46, 0LL, v51);
      }

      goto LABEL_11;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v19, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = 0LL;
  if (!v28) {
    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v34)[2](v34, v28, 0LL);
LABEL_11:
  }
}

- (void)__getEAP8021XClientStatus:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v18;
    if (v18)
    {
      id v52 = 0LL;
      objc_msgSend_clientStatus_(v18, v19, (uint64_t)&v52, v20, v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = v52;
      if (v28) {
        goto LABEL_4;
      }
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v24, v25, v26, v27);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)@"Result", v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        id v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(void, void, void *))v46)[2](v46, 0LL, v51);
      }

      goto LABEL_11;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v19, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = 0LL;
  if (!v28) {
    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v34)[2](v34, v28, 0LL);
LABEL_11:
  }
}

- (void)__getRoamStatus:(id)a3
{
  id v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___roamStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)@"Result", v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);
    }

    uint64_t v40 = 0LL;
    goto LABEL_6;
  }

  uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v41)
  {
    uint64_t v21 = 0LL;
    goto LABEL_3;
  }

  uint64_t v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42) {
    goto LABEL_7;
  }
  objc_msgSend_response(v47, v43, v44, v45, v46);
  uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v21)[2](v21, v40, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getJoinStatus:(id)a3
{
  id v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___joinStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)@"Result", v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);
    }

    uint64_t v40 = 0LL;
    goto LABEL_6;
  }

  uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v41)
  {
    uint64_t v21 = 0LL;
    goto LABEL_3;
  }

  uint64_t v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42) {
    goto LABEL_7;
  }
  objc_msgSend_response(v47, v43, v44, v45, v46);
  uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v21)[2](v21, v40, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getAutoJoinStatus:(id)a3
{
  id v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___autojoinStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)@"Result", v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);
    }

    uint64_t v40 = 0LL;
    goto LABEL_6;
  }

  uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v41)
  {
    uint64_t v21 = 0LL;
    goto LABEL_3;
  }

  uint64_t v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42) {
    goto LABEL_7;
  }
  objc_msgSend_response(v47, v43, v44, v45, v46);
  uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v21)[2](v21, v40, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getLinkDownStatus:(id)a3
{
  id v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___linkDownStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)@"Result", v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);
    }

    uint64_t v40 = 0LL;
    goto LABEL_6;
  }

  uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v41)
  {
    uint64_t v21 = 0LL;
    goto LABEL_3;
  }

  uint64_t v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42) {
    goto LABEL_7;
  }
  objc_msgSend_response(v47, v43, v44, v45, v46);
  uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v21)[2](v21, v40, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getSSID:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = 0LL;
    uint64_t v53 = 0LL;
    id v26 = 0LL;
    uint64_t v60 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_12;
  }

  objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = v21;
  if (!v21)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = 0LL;
    uint64_t v53 = 0LL;
    id v26 = 0LL;
LABEL_23:
    uint64_t v60 = 0LL;
    goto LABEL_12;
  }

  id v89 = 0LL;
  objc_msgSend_SSID_(v21, v22, (uint64_t)&v89, v23, v24);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v89;
  if (!v26)
  {
    uint64_t v35 = 0LL;
    uint64_t v53 = 0LL;
    goto LABEL_23;
  }

  if (objc_msgSend_serviceType(v7, v27, v28, v29, v30) == 4)
  {
    objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v32, (uint64_t)v17, v33, v34);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v35, v36, v37, v38, v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    char isEqualToData = objc_msgSend_isEqualToData_(v40, v41, (uint64_t)v26, v42, v43);

    if ((isEqualToData & 1) == 0)
    {
      uint64_t v59 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v45, *MEMORY[0x189607688], 1, 0);

      uint64_t v53 = 0LL;
      goto LABEL_9;
    }

    objc_msgSend_bundleID(v7, v45, v46, v47, v48);
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53
      || (objc_msgSend_bundleID(v35, v49, v50, v51, v52),
          id v54 = (void *)objc_claimAutoreleasedReturnValue(),
          char isEqualToString = objc_msgSend_isEqualToString_(v54, v55, (uint64_t)v53, v56, v57),
          v54,
          (isEqualToString & 1) == 0))
    {
      uint64_t v59 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v49, *MEMORY[0x189607688], 1, 0);

LABEL_9:
      uint64_t v60 = 0LL;
      id v31 = (id)v59;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v35 = 0LL;
    uint64_t v53 = 0LL;
  }

  id v26 = v26;
  uint64_t v60 = v26;
LABEL_12:
  if (!v31)
  {
    id v88 = v7;
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v27, v28, v29, v30);
    uint64_t v66 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v60, (uint64_t)@"Result", v68);
    objc_msgSend_response(v6, v69, v70, v71, v72);
    int v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_response(v6, v74, v75, v76, v77);
      uint64_t v78 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v87 = v17;
      uint64_t v83 = v25;
      id v84 = v6;
      uint64_t v85 = v35;
      uint64_t v86 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
      ((void (**)(void, void, void *))v78)[2](v78, 0LL, v86);

      uint64_t v35 = v85;
      id v6 = v84;
      uint64_t v25 = v83;
      uint64_t v17 = v87;
    }

    id v7 = v88;
    goto LABEL_18;
  }

  objc_msgSend_response(v6, v27, v28, v29, v30);
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_response(v6, v62, v63, v64, v65);
    uint64_t v66 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v66)[2](v66, v31, 0LL);
LABEL_18:
  }
}

- (void)__getSSIDForVendor:(id)a3 XPCConnection:(id)a4
{
  id v83 = a3;
  id v84 = a4;
  objc_msgSend_requestParameters(v83, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v10, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v16, *MEMORY[0x189607688], 6, 0);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v58 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_12;
  }

  objc_msgSend_apple80211WithInterfaceName_(self, v16, (uint64_t)v15, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v19;
  if (!v19)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v20, *MEMORY[0x189607688], 6, 0);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v24 = 0LL;
LABEL_22:
    uint64_t v58 = 0LL;
    goto LABEL_12;
  }

  id v86 = 0LL;
  objc_msgSend_SSID_(v19, v20, (uint64_t)&v86, v21, v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = v86;
  if (!v24)
  {
    uint64_t v51 = 0LL;
    uint64_t v50 = 0LL;
    goto LABEL_22;
  }

  if (objc_msgSend_serviceType(v84, v25, v26, v27, v28) != 4)
  {
    uint64_t v51 = 0LL;
    uint64_t v50 = 0LL;
    goto LABEL_10;
  }

  objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v30, (uint64_t)v15, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v33, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  char isEqualToData = objc_msgSend_isEqualToData_(v38, v39, (uint64_t)v24, v40, v41);

  if ((isEqualToData & 1) != 0)
  {
    objc_msgSend_bundleID(v84, v43, v44, v45, v46);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = v33;
    if (!v50
      || (objc_msgSend_bundleID(v33, v30, v47, v48, v49),
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(),
          char isEqualToString = objc_msgSend_isEqualToString_(v52, v53, (uint64_t)v50, v54, v55),
          v52,
          (isEqualToString & 1) == 0))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v30, *MEMORY[0x189607688], 1, 0);
      id v57 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v58 = 0LL;
LABEL_11:
      id v29 = v57;
      goto LABEL_12;
    }

- (void)__getBSSID:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = v21;
    if (v21)
    {
      id v103 = 0LL;
      objc_msgSend_SSID_(v21, v22, (uint64_t)&v103, v23, v24);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      id v31 = v103;
      if (v26)
      {
        if (objc_msgSend_serviceType(v7, v27, v28, v29, v30) == 4)
        {
          objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v32, (uint64_t)v17, v33, v34);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v35, v36, v37, v38, v39);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
          char isEqualToData = objc_msgSend_isEqualToData_(v40, v41, (uint64_t)v26, v42, v43);

          if ((isEqualToData & 1) == 0)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v45, *MEMORY[0x189607688], 1, 0);
            id v74 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v52 = 0LL;
            goto LABEL_11;
          }

          objc_msgSend_bundleID(v7, v45, v46, v47, v48);
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v52) {
            goto LABEL_10;
          }
          objc_msgSend_bundleID(v35, v32, v49, v50, v51);
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
          char isEqualToString = objc_msgSend_isEqualToString_(v53, v54, (uint64_t)v52, v55, v56);

          if ((isEqualToString & 1) == 0
            || (objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v32, v58, v59, v60),
                double v62 = v61,
                objc_msgSend_addedAt(v35, v63, v64, v65, v66),
                uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend_timeIntervalSinceReferenceDate(v67, v68, v69, v70, v71),
                double v73 = v62 - v72,
                v67,
                v73 <= 0.0)
            || v73 > 300.0)
          {
LABEL_10:
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v32, *MEMORY[0x189607688], 1, 0);
            id v74 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
            uint64_t v75 = 0LL;
LABEL_14:
            id v31 = v74;
            goto LABEL_15;
          }
        }

        else
        {
          uint64_t v52 = 0LL;
          uint64_t v35 = 0LL;
        }

        id v102 = v31;
        objc_msgSend_BSSID_(v25, v32, (uint64_t)&v102, v33, v34);
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
        id v74 = v102;

        goto LABEL_14;
      }

      uint64_t v52 = 0LL;
    }

    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v22, *MEMORY[0x189607688], 6, 0);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v52 = 0LL;
      uint64_t v26 = 0LL;
    }

    uint64_t v75 = 0LL;
    uint64_t v35 = 0LL;
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v75 = 0LL;
    uint64_t v35 = 0LL;
    uint64_t v25 = 0LL;
  }

- (void)__getBSSIDForVendor:(id)a3 XPCConnection:(id)a4
{
  id v88 = a3;
  id v89 = a4;
  objc_msgSend_requestParameters(v88, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v10, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v16, *MEMORY[0x189607688], 6, 0);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = 0LL;
    uint64_t v54 = 0LL;
    uint64_t v24 = 0LL;
    id v31 = 0LL;
    uint64_t v60 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_13;
  }

  objc_msgSend_apple80211WithInterfaceName_(self, v16, (uint64_t)v15, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v19;
  if (!v19)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v20, *MEMORY[0x189607688], 6, 0);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = 0LL;
    uint64_t v54 = 0LL;
    uint64_t v24 = 0LL;
LABEL_24:
    id v31 = 0LL;
LABEL_27:
    uint64_t v60 = 0LL;
    goto LABEL_13;
  }

  id v92 = 0LL;
  objc_msgSend_SSID_(v19, v20, (uint64_t)&v92, v21, v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = v92;
  id v30 = v25;
  if (!v24)
  {
    uint64_t v36 = 0LL;
    uint64_t v54 = 0LL;
    goto LABEL_24;
  }

  id v91 = v25;
  objc_msgSend_BSSID_(v23, v26, (uint64_t)&v91, v28, v29);
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  id v32 = v91;

  if (!v31)
  {
    uint64_t v36 = 0LL;
    uint64_t v54 = 0LL;
    uint64_t v60 = 0LL;
    id v30 = v32;
    goto LABEL_13;
  }

  if (objc_msgSend_serviceType(v89, v26, v27, v28, v29) != 4)
  {
    uint64_t v36 = 0LL;
    uint64_t v54 = 0LL;
    goto LABEL_11;
  }

  objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v33, (uint64_t)v15, v34, v35);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v36, v37, v38, v39, v40);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  char isEqualToData = objc_msgSend_isEqualToData_(v41, v42, (uint64_t)v24, v43, v44);

  if ((isEqualToData & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v46, *MEMORY[0x189607688], 1, 0);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v54 = 0LL;
    goto LABEL_27;
  }

  uint64_t v50 = v24;
  objc_msgSend_bundleID(v89, v46, v47, v48, v49);
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend_bundleID(v36, v33, v51, v52, v53);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    char isEqualToString = objc_msgSend_isEqualToString_(v55, v56, (uint64_t)v54, v57, v58);

    if ((isEqualToString & 1) != 0)
    {
      uint64_t v24 = v50;
LABEL_11:
      id v90 = v32;
      objc_msgSend___hashedBSSID_XPCConnection_error_(self, v33, (uint64_t)v31, (uint64_t)v89, (uint64_t)&v90);
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      id v30 = v90;

      goto LABEL_13;
    }
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v33, *MEMORY[0x189607688], 1, 0);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v60 = 0LL;
  uint64_t v24 = v50;
LABEL_13:
  if (!v30)
  {
    uint64_t v87 = v24;
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v26, v27, v28, v29);
    uint64_t v66 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v60, (uint64_t)@"Result", v68);
    objc_msgSend_response(v88, v69, v70, v71, v72);
    double v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_response(v88, v74, v75, v76, v77);
      uint64_t v78 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v86 = v31;
      uint64_t v83 = v54;
      id v84 = v36;
      uint64_t v85 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
      ((void (**)(void, void, void *))v78)[2](v78, 0LL, v85);

      uint64_t v36 = v84;
      uint64_t v54 = v83;
      id v31 = v86;
    }

    uint64_t v24 = v87;
    goto LABEL_19;
  }

  objc_msgSend_response(v88, v26, v27, v28, v29);
  double v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_response(v88, v62, v63, v64, v65);
    uint64_t v66 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v66)[2](v66, v30, 0LL);
LABEL_19:
  }
}

- (void)__getLinkQualityMetric:(id)a3
{
  id v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___linkQualityMetricWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v17, v18, v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)@"Result", v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);
    }

    uint64_t v40 = 0LL;
    goto LABEL_6;
  }

  uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 6, 0);
  if (!v41)
  {
    uint64_t v21 = 0LL;
    goto LABEL_3;
  }

  uint64_t v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42) {
    goto LABEL_7;
  }
  objc_msgSend_response(v47, v43, v44, v45, v46);
  uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v21)[2](v21, v40, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getPlatformCapabilities:(id)a3
{
  uint64_t v129 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_set(MEMORY[0x189603FE0], v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apple80211WithInterfaceName_(self, v10, 0, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceNames_(v13, v14, 0, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v18, 0, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_virtualInterfaceNames_(v21, v22, 0, v23, v24);
  id v25 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  id v26 = v17;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v122, (uint64_t)v128, 16);
  if (v28)
  {
    uint64_t v32 = v28;
    uint64_t v33 = *(void *)v123;
    do
    {
      for (uint64_t i = 0LL; i != v32; ++i)
      {
        if (*(void *)v123 != v33) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend_apple80211WithInterfaceName_(self, v29, *(void *)(*((void *)&v122 + 1) + 8 * i), v30, v31);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_capabilities_(v35, v36, 0, v37, v38);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39) {
          objc_msgSend_addObjectsFromArray_(v9, v40, (uint64_t)v39, v41, v42);
        }
      }

      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v122, (uint64_t)v128, 16);
    }

    while (v32);
  }

  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  id v43 = v25;
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v118, (uint64_t)v127, 16);
  if (v45)
  {
    uint64_t v49 = v45;
    uint64_t v50 = *(void *)v119;
    do
    {
      for (uint64_t j = 0LL; j != v49; ++j)
      {
        if (*(void *)v119 != v50) {
          objc_enumerationMutation(v43);
        }
        objc_msgSend_apple80211WithInterfaceName_( self,  v46,  *(void *)(*((void *)&v118 + 1) + 8 * j),  v47,  v48,  (void)v118);
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_capabilities_(v52, v53, 0, v54, v55);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56) {
          objc_msgSend_addObjectsFromArray_(v9, v57, (uint64_t)v56, v58, v59);
        }
      }

      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v118, (uint64_t)v127, 16);
    }

    while (v49);
  }

  uint64_t v60 = IOServiceNameMatching("pci14e4,4464");
  if (v60)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086A8], v60);
    if (MatchingService)
    {
      io_object_t v64 = MatchingService;
      uint64_t v65 = (void *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"WiFiCapability",  (CFAllocatorRef)*MEMORY[0x189604DB0],  3u);
      if (v65)
      {
        uint64_t v69 = v65;
        objc_msgSend_objectForKey_(v65, v66, (uint64_t)@"awdl", v67, v68);
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        int v75 = objc_msgSend_BOOLValue(v70, v71, v72, v73, v74);

        if (v75) {
          objc_msgSend_addObject_(v9, v76, (uint64_t)&unk_189E88D60, v77, v78);
        }
        objc_msgSend_objectForKey_(v69, v76, (uint64_t)@"ranging", v77, v78, (void)v118);
        uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
        int v84 = objc_msgSend_BOOLValue(v79, v80, v81, v82, v83);

        if (v84) {
          objc_msgSend_addObject_(v9, v85, (uint64_t)&unk_189E88D78, v86, v87);
        }
        CFRelease(v69);
      }

      IOObjectRelease(v64);
    }
  }

  objc_msgSend_sortDescriptorWithKey_ascending_( MEMORY[0x189607A20],  v61,  (uint64_t)@"integerValue",  1,  v62,  (void)v118);
  id v88 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v126 = v88;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v89, (uint64_t)&v126, 1, v90);
  id v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v9, v92, (uint64_t)v91, v93, v94);
  uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x189603FC8], v96, v97, v98, v99);
  id v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v100, v101, (uint64_t)v95, (uint64_t)@"Result", v102);
  objc_msgSend_response(v4, v103, v104, v105, v106);
  uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();

  if (v107)
  {
    objc_msgSend_response(v4, v108, v109, v110, v111);
    uint64_t v112 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v117 = (void *)objc_msgSend_copy(v100, v113, v114, v115, v116);
    ((void (**)(void, void, void *))v112)[2](v112, 0LL, v117);
  }
}

- (void)__updateCurrentKnownBSSWithIPConfigurationForInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1896077F0];
  uint64_t v6 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_1864DA624;
  v19[3] = &unk_189E5BF78;
  v19[4] = self;
  id v20 = v4;
  id v7 = v4;
  objc_msgSend_blockOperationWithBlock_(v5, v8, (uint64_t)v19, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v11, v12, (uint64_t)@"updateKnownBSS", v13, v14);
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v17[0] = v6;
  v17[1] = 3221225472LL;
  v17[2] = sub_1864DB1BC;
  v17[3] = &unk_189E5BF78;
  void v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  dispatch_async(mutexQueue, v17);
}

- (void)__getPrivateMACAddress:(id)a3
{
  id v50 = a3;
  objc_msgSend_info(v50, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)@"NetworkProfile", v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_privateMACManager(self, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      objc_msgSend_privateMACAddressForNetworkProfile_(v17, v18, (uint64_t)v12, v19, v20);
      id v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v22, v23, v24, v25);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)@"Result", v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        uint64_t v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(void, void, void *))v39)[2](v39, 0LL, v44);
      }

      uint64_t v21 = 0LL;
      goto LABEL_7;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 22, 0);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    id v26 = 0LL;
    goto LABEL_4;
  }

  objc_msgSend_response(v50, v22, v23, v24, v25);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45) {
    goto LABEL_8;
  }
  objc_msgSend_response(v50, v46, v47, v48, v49);
  id v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v26)[2](v26, v21, 0LL);
LABEL_7:

LABEL_8:
}

- (void)__getPrivateMACAddressMode:(id)a3
{
  id v53 = a3;
  objc_msgSend_info(v53, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)@"NetworkProfile", v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_privateMACManager(self, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v21 = v17;
      uint64_t v22 = (void *)objc_msgSend_privateMACAddressModeForNetworkProfile_(v17, v18, (uint64_t)v12, v19, v20);

      goto LABEL_4;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 22, 0);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
LABEL_4:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v23, v24, v25, v26);
    uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v28, (uint64_t)v22, v29, v30);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)@"Result", v33);

    objc_msgSend_response(v53, v34, v35, v36, v37);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_response(v53, v38, v39, v40, v41);
      uint64_t v42 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v47 = (void *)objc_msgSend_copy(v27, v43, v44, v45, v46);
      ((void (**)(void, void, void *))v42)[2](v42, 0LL, v47);

      uint64_t v22 = 0LL;
    }

    goto LABEL_6;
  }

  objc_msgSend_response(v53, v23, v24, v25, v26);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48) {
    goto LABEL_7;
  }
  objc_msgSend_response(v53, v49, v50, v51, v52);
  uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v27)[2](v27, v22, 0LL);
LABEL_6:

LABEL_7:
}

- (void)__getPrivateMACAddressModeSystemSetting:(id)a3
{
  id v45 = a3;
  objc_msgSend_privateMACManager(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v8;
  if (v8)
  {
    id v18 = (void *)objc_msgSend_systemSetting(v8, v9, v10, v11, v12);
    goto LABEL_3;
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v9, *MEMORY[0x189607688], 6, 0);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v14, v15, v16, v17);
    uint64_t v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v20, (uint64_t)v18, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v24, (uint64_t)v23, (uint64_t)@"Result", v25);

    objc_msgSend_response(v45, v26, v27, v28, v29);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_response(v45, v30, v31, v32, v33);
      uint64_t v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)objc_msgSend_copy(v19, v35, v36, v37, v38);
      ((void (**)(void, void, void *))v34)[2](v34, 0LL, v39);

      id v18 = 0LL;
    }

    goto LABEL_5;
  }

  objc_msgSend_response(v45, v14, v15, v16, v17);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40) {
    goto LABEL_6;
  }
  objc_msgSend_response(v45, v41, v42, v43, v44);
  uint64_t v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *, void))v19)[2](v19, v18, 0LL);
LABEL_5:

LABEL_6:
}

- (void)__setPrivateMACAddressModeSystemSetting:(id)a3
{
  id v38 = a3;
  objc_msgSend_info(v38, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)@"PrivateMACMode", v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    uint64_t v17 = objc_msgSend_privateMACManager(self, v13, v14, v15, v16);
    if (v17)
    {
      uint64_t v22 = (void *)v17;
      uint64_t v23 = objc_msgSend_integerValue(v12, v18, v19, v20, v21);
      objc_msgSend_setSystemSetting_(v22, v24, v23, v25, v26);

      uint64_t v31 = 0LL;
      goto LABEL_4;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 22, 0);
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  objc_msgSend_response(v38, v27, v28, v29, v30);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend_response(v38, v33, v34, v35, v36);
    uint64_t v37 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v37)[2](v37, v31, 0LL);
  }
}

- (void)__setPrivateMACAddressUserJoinFailureUIState:(id)a3
{
  id v45 = a3;
  objc_msgSend_info(v45, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)@"NetworkProfile", v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend_info(v45, v13, v14, v15, v16),
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)@"State", v19, v20),
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v21))
  {
    uint64_t v25 = objc_msgSend_privateMACManager(self, v13, v22, v23, v24);
    if (v25)
    {
      uint64_t v30 = (void *)v25;
      uint64_t v31 = objc_msgSend_BOOLValue(v21, v26, v27, v28, v29);
      objc_msgSend_setUserJoinFailureUIState_networkProfile_(v30, v32, v31, (uint64_t)v12, v33);

      id v38 = 0LL;
    }

    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v26, *MEMORY[0x189607688], 6, 0);
      id v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 22, 0);
    id v38 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend_response(v45, v34, v35, v36, v37);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_response(v45, v40, v41, v42, v43);
    uint64_t v44 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v44)[2](v44, v38, 0LL);
  }
}

- (void)__setPrivateMACAddressMode:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    uint64_t v21 = 0LL;
    goto LABEL_13;
  }

  objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_13:
    uint64_t v26 = 0LL;
    uint64_t v35 = 0LL;
    goto LABEL_14;
  }

  objc_msgSend_info(v4, v15, v18, v19, v20);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)@"NetworkProfile", v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    uint64_t v35 = 0LL;
    goto LABEL_16;
  }

  objc_msgSend_info(v4, v27, v28, v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)@"PrivateMACMode", v33, v34);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_16:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v27, *MEMORY[0x189607688], 22, 0);
LABEL_17:
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      objc_msgSend_response(v4, v76, v77, v78, v79);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43) {
        goto LABEL_11;
      }
      objc_msgSend_response(v4, v80, v81, v82, v83);
      int v84 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void))v84)[2](v84, v70, 0LL);
    }

    uint64_t v43 = 0LL;
    goto LABEL_11;
  }

  uint64_t v39 = objc_msgSend_privateMACManager(self, v27, v36, v37, v38);
  if (!v39)
  {
LABEL_14:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607688], 6, 0);
    goto LABEL_17;
  }

  uint64_t v43 = (void *)v39;
  objc_msgSend_addedAt(v26, v15, v40, v41, v42);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v50 = objc_msgSend_integerValue(v35, v45, v46, v47, v48);
  if (v44)
  {
    objc_msgSend_setPrivateMACAddressModeUserSetting_(v26, v49, v50, v51, v52);
    objc_msgSend_date(MEMORY[0x189603F50], v53, v54, v55, v56);
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPrivateMACAddressModeUserSettingUpdatedAt_(v26, v58, (uint64_t)v57, v59, v60);

    objc_msgSend_setWithObjects_(MEMORY[0x189604010], v61, (uint64_t)&unk_189E88DC0, v62, v63, &unk_189E88DD8, 0);
    io_object_t v64 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1895F87A8];
    v85[1] = 3221225472LL;
    v85[2] = sub_1864DBD08;
    v85[3] = &unk_189E5D398;
    id v86 = v4;
    objc_msgSend___updateNetworkProfile_updateProperties_interfaceName_reply_( self,  v65,  (uint64_t)v26,  (uint64_t)v64,  (uint64_t)v14,  v85);

LABEL_10:
    uint64_t v70 = 0LL;
    goto LABEL_11;
  }

  objc_msgSend_setTemporaryUserSetting_networkProfile_(v43, v49, v50, (uint64_t)v26, v52);
  objc_msgSend_response(v4, v66, v67, v68, v69);
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend_response(v4, v71, v72, v73, v74);
    int v75 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v75[2](v75, 0LL, 0LL);

    goto LABEL_10;
  }

- (void)__getQuickProbeRequired:(id)a3
{
  id v36 = a3;
  _os_feature_enabled_impl();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v3, *MEMORY[0x189607688], 45, 0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v4, v5, v6, v7);
    uint64_t v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x189607968], v15, 0, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v14, v19, (uint64_t)v18, (uint64_t)@"Result", v20);

    objc_msgSend_response(v36, v21, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend_response(v36, v26, v27, v28, v29);
      uint64_t v30 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v35 = (void *)objc_msgSend_copy(v14, v31, v32, v33, v34);
      ((void (**)(void, void, void *))v30)[2](v30, 0LL, v35);
    }

    goto LABEL_6;
  }

  objc_msgSend_response(v36, v4, v5, v6, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_response(v36, v10, v11, v12, v13);
    uint64_t v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v14)[2](v14, v8, 0LL);
LABEL_6:
  }
}

- (void)__performAutoJoinWithParameters:(id)a3 interfaceName:(id)a4
{
  v42[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v13, v14, 177, v15, v16);
    uint64_t v41 = @"AutoJoinParams";
    v42[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v17, (uint64_t)v42, (uint64_t)&v41, 1);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v13, v19, (uint64_t)v18, v20, v21);

    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v22, v23, (uint64_t)v7, v24, v25);
    objc_msgSend_setRequestParameters_(v13, v26, (uint64_t)v22, v27, v28);
    objc_msgSend_date(MEMORY[0x189603F50], v29, v30, v31, v32);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v13, v34, (uint64_t)v33, v35, v36);

    objc_msgSend_setResponse_(v13, v37, (uint64_t)&unk_189E5D3D8, v38, v39);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v12,  v40,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v13);
  }
}

- (void)__disassocWithReason:(int64_t)a3 interfaceName:(id)a4
{
  v42[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v12, v13, 63, v14, v15);
    uint64_t v41 = @"DisassocReason";
    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v16, a3, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v20, (uint64_t)v42, (uint64_t)&v41, 1);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v12, v22, (uint64_t)v21, v23, v24);

    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v25, v26, (uint64_t)v6, v27, v28);
    objc_msgSend_setRequestParameters_(v12, v29, (uint64_t)v25, v30, v31);
    objc_msgSend_date(MEMORY[0x189603F50], v32, v33, v34, v35);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v12, v37, (uint64_t)v36, v38, v39);

    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v11,  v40,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v12);
  }
}

- (void)__updateNetworkProfile:(id)a3 updateProperties:(id)a4 interfaceName:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_msgSend_delegate(self, v14, v15, v16, v17);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v18, v19, v20, v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v10, (uint64_t)@"NetworkProfile", v25);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v11, (uint64_t)@"NetworkProfileProperties", v27);
    uint64_t v28 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v28, v29, 61, v30, v31);
    objc_msgSend_setInfo_(v28, v32, (uint64_t)v23, v33, v34);
    uint64_t v35 = objc_alloc_init(&OBJC_CLASS___CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v35, v36, (uint64_t)v12, v37, v38);
    objc_msgSend_setRequestParameters_(v28, v39, (uint64_t)v35, v40, v41);
    objc_msgSend_date(MEMORY[0x189603F50], v42, v43, v44, v45);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v28, v47, (uint64_t)v46, v48, v49);

    v55[0] = MEMORY[0x1895F87A8];
    v55[1] = 3221225472LL;
    v55[2] = sub_1864DC384;
    v55[3] = &unk_189E5C338;
    id v56 = v13;
    objc_msgSend_setResponse_(v28, v50, (uint64_t)v55, v51, v52);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_( v22,  v53,  (uint64_t)self,  (uint64_t)self->_internalRequestXPCConnection,  (uint64_t)v28);
  }

  else if (v13)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v54);
  }
}

- (void)__privateMACEvaluationCompletedWithState:(int64_t)a3 knownNetwork:(id)a4 interfaceName:(id)a5
{
}

- (void)__reportQuickProbeResult:(id)a3
{
  id v15 = a3;
  _os_feature_enabled_impl();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v3, *MEMORY[0x189607688], 45, 0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v15, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_response(v15, v10, v11, v12, v13);
    uint64_t v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v14)[2](v14, v4, 0LL);
  }
}

- (void)__setLQMConfig:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_info(v4, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)@"LQMConfiguration", v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v24, (uint64_t)v14, v25, v26);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      uint64_t v30 = v27;
      id v42 = 0LL;
      objc_msgSend_setLQMConfig_error_(v27, v28, (uint64_t)v23, (uint64_t)&v42, v29);
      id v31 = v42;

      goto LABEL_4;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v28, *MEMORY[0x189607688], 6, 0);
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v24, *MEMORY[0x189607688], 22, 0);
  }

  id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  objc_msgSend_response(v4, v32, v33, v34, v35);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v4, v37, v38, v39, v40);
    uint64_t v41 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v41)[2](v41, v31, 0LL);
  }
}

- (void)__privateMACSettingChangedForNetworkProfile:(id)a3 interfaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1896077F0];
  uint64_t v9 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = sub_1864DC6B0;
  v20[3] = &unk_189E5BEB8;
  v20[4] = self;
  id v21 = v7;
  id v22 = v6;
  id v10 = v6;
  id v11 = v7;
  objc_msgSend_blockOperationWithBlock_(v8, v12, (uint64_t)v20, v13, v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = v9;
  block[1] = 3221225472LL;
  block[2] = sub_1864DCABC;
  block[3] = &unk_189E5BF78;
  void block[4] = self;
  id v19 = v15;
  id v17 = v15;
  dispatch_async(mutexQueue, block);
}

- (void)__privateMACEvaluationCheckConnectivity
{
}

- (void)__startNetworkRelayBridgeWithHostAPConfiguration:(id)a3 interfaceName:(id)a4 reply:(id)a5
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v15 = (void (**)(void, void))v10;
  if (self->_netRBClient)
  {
    CWFGetOSLog();
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      CWFGetOSLog();
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v50 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v64 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id location = 0;
      _os_log_send_and_compose_impl();
    }

    uint64_t v66 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v65, *MEMORY[0x189607688], 37, 0);
    goto LABEL_70;
  }

  if (!v8)
  {
    CWFGetOSLog();
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      CWFGetOSLog();
      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v52 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v67 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446722;
      *(void *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
      __int16 v85 = 2082;
      id v86 = "CWFXPCRequestProxy.m";
      __int16 v87 = 1024;
      int v88 = 7035;
      _os_log_send_and_compose_impl();
    }

    goto LABEL_38;
  }

  if (!v9)
  {
    CWFGetOSLog();
    id v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      CWFGetOSLog();
      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v52 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v69 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446722;
      *(void *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
      __int16 v85 = 2082;
      id v86 = "CWFXPCRequestProxy.m";
      __int16 v87 = 1024;
      int v88 = 7040;
      _os_log_send_and_compose_impl();
    }

- (void)__stopNetworkRelayBridgeForInterfaceName:(id)a3 reply:(id)a4
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = (void (**)(void, void))v7;
  if (!self->_netRBClient)
  {
    CWFGetOSLog();
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v20 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v25 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v39) = 0;
      int v38 = 2;
      uint64_t v37 = &v39;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v26, *MEMORY[0x189607688], 6, 0, v37, v38);
    goto LABEL_27;
  }

  if (!v6)
  {
    CWFGetOSLog();
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      CWFGetOSLog();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v22 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v27 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136446722;
      uint64_t v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      __int16 v41 = 2082;
      uint64_t v42 = "CWFXPCRequestProxy.m";
      __int16 v43 = 1024;
      int v44 = 7171;
      int v38 = 28;
      uint64_t v37 = &v39;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v28, *MEMORY[0x189607688], 22, 0, v37, v38);
LABEL_27:
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }

  uint64_t v13 = (void *)objc_msgSend_copy(v7, v8, v9, v10, v11);
  id netRBStopServiceReply = self->_netRBStopServiceReply;
  self->_id netRBStopServiceReply = v13;

  if (IOPMAssertionRelease(self->_netRBAssertionID))
  {
    CWFGetOSLog();
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      CWFGetOSLog();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v16 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v17 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136446722;
      uint64_t v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      __int16 v41 = 2082;
      uint64_t v42 = "CWFXPCRequestProxy.m";
      __int16 v43 = 1024;
      int v44 = 7177;
      _os_log_send_and_compose_impl();
    }
  }

  if ((_NETRBClientStopService() & 1) != 0)
  {
    uint64_t v18 = 0LL;
    goto LABEL_12;
  }

  CWFGetOSLog();
  xpc_object_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    CWFGetOSLog();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v24 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v29 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v39 = 136446722;
    uint64_t v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
    __int16 v41 = 2082;
    uint64_t v42 = "CWFXPCRequestProxy.m";
    __int16 v43 = 1024;
    int v44 = 7181;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v30, *MEMORY[0x189607688], 6, 0);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NETRBClientSetHostCount() & 1) == 0)
  {
    CWFGetOSLog();
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v35 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136446722;
      uint64_t v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      __int16 v41 = 2082;
      uint64_t v42 = "CWFXPCRequestProxy.m";
      __int16 v43 = 1024;
      int v44 = 7184;
      _os_log_send_and_compose_impl();
    }
  }

  if ((_NETRBClientDestroy() & 1) == 0)
  {
    CWFGetOSLog();
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v34 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v36 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136446722;
      uint64_t v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      __int16 v41 = 2082;
      uint64_t v42 = "CWFXPCRequestProxy.m";
      __int16 v43 = 1024;
      int v44 = 7186;
      _os_log_send_and_compose_impl();
    }
  }

  self->_netRBClient = 0LL;
LABEL_34:
  if (v12 && v18) {
    ((void (**)(void, void *))v12)[2](v12, v18);
  }
LABEL_12:
}

- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_info(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)@"HostAPConfiguration", v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_delegate(self, v17, v18, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v22, v23, 220, v24, v25);
    objc_msgSend_requestParameters(v6, v26, v27, v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestParameters_(v22, v31, (uint64_t)v30, v32, v33);

    objc_msgSend_info(v6, v34, v35, v36, v37);
    int v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v22, v39, (uint64_t)v38, v40, v41);

    v71[0] = MEMORY[0x1895F87A8];
    v71[1] = 3221225472LL;
    v71[2] = sub_1864DE2E4;
    v71[3] = &unk_189E5D478;
    id v72 = v16;
    uint64_t v73 = self;
    id v74 = v6;
    id v42 = v21;
    id v75 = v42;
    id v43 = v7;
    id v76 = v43;
    objc_msgSend_setResponse_(v22, v44, (uint64_t)v71, v45, v46);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v42, v47, (uint64_t)self, (uint64_t)v43, (uint64_t)v22);

    uint64_t v48 = v72;
LABEL_10:

    goto LABEL_11;
  }

  CWFGetOSLog();
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    CWFGetOSLog();
    uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v50 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v51 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    uint64_t v56 = objc_msgSend_type(v6, v52, v53, v54, v55);
    sub_1864504C4(v56, v57, v58, v59, v60);
    int v77 = 138543362;
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_response(v6, v61, v62, v63, v64);
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend_response(v6, v66, v67, v68, v69);
    uint64_t v22 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v70, *MEMORY[0x189607688], 45, 0);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(CWFXPCRequest *, void *, void))v22->super.super._iop.__nextOp)(v22, v48, 0LL);
    goto LABEL_10;
  }

- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v13, v14, 221, v15, v16);
    objc_msgSend_requestParameters(v6, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestParameters_(v13, v22, (uint64_t)v21, v23, v24);

    v52[0] = MEMORY[0x1895F87A8];
    v52[1] = 3221225472LL;
    v52[2] = sub_1864DEB9C;
    v52[3] = &unk_189E5C298;
    v52[4] = self;
    id v53 = v6;
    objc_msgSend_setResponse_(v13, v25, (uint64_t)v52, v26, v27);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v12, v28, (uint64_t)self, (uint64_t)v7, (uint64_t)v13);

LABEL_10:
    goto LABEL_11;
  }

  CWFGetOSLog();
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    CWFGetOSLog();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v30 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v31 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = objc_msgSend_type(v6, v32, v33, v34, v35);
    sub_1864504C4(v36, v37, v38, v39, v40);
    int v54 = 138543362;
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_response(v6, v41, v42, v43, v44);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_response(v6, v46, v47, v48, v49);
    uint64_t v13 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v50, *MEMORY[0x189607688], 45, 0);
    id v51 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(CWFXPCRequest *, void *, void))v13->super.super._iop.__nextOp)(v13, v51, 0LL);

    goto LABEL_10;
  }

- (void)__logLqmSummary:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  if (v5 && !objc_msgSend_virtualInterfaceRole(v5, v6, v7, v8, v9))
  {
    objc_msgSend_LQMSummary_(v10, v11, 0, v12, v13);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      id v14 = v30;
      uint64_t v19 = 0LL;
      uint64_t v29 = objc_msgSend_bytes(v14, v15, v16, v17, v18);
      uint64_t v20 = (void *)MEMORY[0x1895F8DA0];
      do
      {
        if (*(_BYTE *)(v29 + 160 + v19))
        {
          CWFGetOSLog();
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            CWFGetOSLog();
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v23 = v20;
            uint64_t v22 = (os_log_s *)v20;
          }

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            _os_log_send_and_compose_impl();
          }
        }

        v19 += 256LL;
      }

      while (v19 != 4096);
      uint64_t v24 = 0LL;
      uint64_t v25 = (void *)MEMORY[0x1895F8DA0];
      do
      {
        if (*(_BYTE *)(v29 + 4256 + v24))
        {
          CWFGetOSLog();
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            CWFGetOSLog();
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v28 = v25;
            uint64_t v27 = (os_log_s *)v25;
          }

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            _os_log_send_and_compose_impl();
          }
        }

        v24 += 256LL;
      }

      while (v24 != 1280);
    }
  }
}

- (void)__getCurrentScanResult:(id)a3 XPCConnection:(id)a4 reply:(id)a5
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend_delegate(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___CWFXPCRequest);
    objc_msgSend_setType_(v16, v17, 57, v18, v19);
    objc_msgSend_requestParameters(v8, v20, v21, v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestParameters_(v16, v25, (uint64_t)v24, v26, v27);

    objc_msgSend_info(v8, v28, v29, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v16, v33, (uint64_t)v32, v34, v35);

    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = sub_1864DF340;
    v53[3] = &unk_189E5C338;
    id v54 = v10;
    objc_msgSend_setResponse_(v16, v36, (uint64_t)v53, v37, v38);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v15, v39, (uint64_t)self, (uint64_t)v9, (uint64_t)v16);

LABEL_10:
    goto LABEL_11;
  }

  CWFGetOSLog();
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    CWFGetOSLog();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v41 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v42 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    uint64_t v47 = objc_msgSend_type(v8, v43, v44, v45, v46);
    sub_1864504C4(v47, v48, v49, v50, v51);
    int v55 = 138543362;
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  if (v10)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v52, *MEMORY[0x189607688], 45, 0);
    uint64_t v16 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CWFXPCRequest *, void))v10 + 2))(v10, v16, 0LL);
    goto LABEL_10;
  }

- (void)__getCurrentScanResult:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  uint64_t v46 = sub_1864C1CE4;
  uint64_t v47 = sub_1864C1CF4;
  id v48 = 0LL;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17
    && (objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20),
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(),
        (uint64_t v24 = v21) != 0LL))
  {
    id v42 = 0LL;
    uint64_t v25 = objc_msgSend_currentNetwork_(v21, v18, (uint64_t)&v42, v22, v23);
    id v26 = v42;
    uint64_t v27 = (void *)v44[5];
    v44[5] = v25;

    v39[0] = MEMORY[0x1895F87A8];
    v39[1] = 3221225472LL;
    v39[2] = sub_1864DF5C0;
    v39[3] = &unk_189E5D4A0;
    uint64_t v41 = &v43;
    uint64_t v40 = (void (**)(id, id, void))v6;
    objc_msgSend___getCurrentScanResult_XPCConnection_reply_(self, v28, (uint64_t)v40, (uint64_t)v7, (uint64_t)v39);
    uint64_t v29 = v40;
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v18, *MEMORY[0x189607688], 6, 0);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v6, v30, v31, v32, v33);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      uint64_t v24 = 0LL;
      goto LABEL_5;
    }

    objc_msgSend_response(v6, v35, v36, v37, v38);
    uint64_t v29 = (void (**)(id, id, void))objc_claimAutoreleasedReturnValue();
    v29[2](v29, v26, 0LL);
    uint64_t v24 = 0LL;
  }

LABEL_5:
  _Block_object_dispose(&v43, 8);
}

- (void)__getKnownNetworkInfoForLocalNetworkPrompt:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_info(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)@"KnownNetworkInfoOptions", v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)@"DeviceDiscovery", v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_objectForKeyedSubscript_(v16, v21, (uint64_t)@"DeviceDiscovery", v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v29 = objc_msgSend_BOOLValue(v24, v25, v26, v27, v28);

    if (v29)
    {
      uint64_t v30 = objc_alloc_init(&OBJC_CLASS___CWFLocalDeviceDiscovery);
      v86[0] = MEMORY[0x1895F87A8];
      v86[1] = 3221225472LL;
      v86[2] = sub_1864DFBE8;
      v86[3] = &unk_189E5D4C8;
      id v87 = v6;
      objc_msgSend_setHandler_(v30, v31, (uint64_t)v86, v32, v33);
      objc_msgSend_activate(v30, v34, v35, v36, v37);

      uint64_t v38 = 0LL;
      id v39 = 0LL;
      id v40 = 0LL;
      id v41 = 0LL;
LABEL_12:

      goto LABEL_13;
    }
  }

  id v42 = objc_alloc(&OBJC_CLASS___CWFKnownNetworkPreparer);
  objc_msgSend___knownNetworkProfiles(self, v43, v44, v45, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  id v40 = (id)objc_msgSend_initWithNetworkProfiles_(v42, v48, (uint64_t)v47, v49, v50);

  if (v40)
  {
    objc_msgSend_localNetworkPromptProfiles(v40, v51, v52, v53, v54);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v58 = objc_msgSend_prepareLocalNetworkProfilesForPresentation_(v40, v55, (uint64_t)v39, v56, v57);
    if (v58)
    {
      id v41 = (id)v58;
      goto LABEL_7;
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v59, *MEMORY[0x189607688], 2, 0);
  }

  else
  {
    id v39 = 0LL;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v51, *MEMORY[0x189607688], 6, 0);
  }
  uint64_t v80 = ;
  if (!v80)
  {
    id v41 = 0LL;
LABEL_7:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v59, v60, v61, v62);
    uint64_t v63 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v41, (uint64_t)@"Result", v65);
    objc_msgSend_response(v6, v66, v67, v68, v69);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_response(v6, v70, v71, v72, v73);
      id v74 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v79 = (void *)objc_msgSend_copy(v63, v75, v76, v77, v78);
      ((void (**)(void, void, void *))v74)[2](v74, 0LL, v79);

      uint64_t v38 = 0LL;
    }

    goto LABEL_9;
  }

  uint64_t v38 = (void *)v80;
  objc_msgSend_response(v6, v59, v60, v61, v62);
  id v41 = (id)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend_response(v6, v81, v82, v83, v84);
    uint64_t v63 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void))v63)[2](v63, v38, 0LL);
    id v41 = 0LL;
LABEL_9:
  }

  if (objc_opt_class())
  {
    __int16 v85 = (CWFLocalDeviceDiscovery *)v7;
    id v39 = v39;
    id v41 = v41;
    id v40 = v40;
    AnalyticsSendEventLazy();

    uint64_t v30 = v85;
    goto LABEL_12;
  }

- (CWFXPCRequestProxyDelegate)delegate
{
  return (CWFXPCRequestProxyDelegate *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end