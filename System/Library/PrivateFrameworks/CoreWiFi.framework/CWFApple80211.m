@interface CWFApple80211
- (BOOL)__setupEventMonitoring;
- (BOOL)isAWDLEnabled;
- (BOOL)isMonitoringEventType:(unsigned int)a3 interfaceName:(id)a4;
- (BOOL)setChannel:(id)a3 error:(id *)a4;
- (BOOL)setLQMConfig:(id)a3 error:(id *)a4;
- (CWFApple80211)init;
- (CWFApple80211)initWithInterfaceName:(id)a3;
- (NSString)interfaceName;
- (NSString)virtualInterfaceParent;
- (_Apple80211)__apple80211RefWithInterfaceName:(id)a3;
- (id)AWDLAFTxMode:(id *)a3;
- (id)AWDLAvailabilityWindowAPAlignment:(id *)a3;
- (id)AWDLBTLEStateParameters:(id *)a3;
- (id)AWDLContinuousElectionAlgorithmEnabled:(id *)a3;
- (id)AWDLElectionID:(id *)a3;
- (id)AWDLElectionMetric:(id *)a3;
- (id)AWDLElectionParameters:(id *)a3;
- (id)AWDLElectionRSSIThresholds:(id *)a3;
- (id)AWDLEncryptionType:(id *)a3;
- (id)AWDLExtensionStateMachineParameters:(id *)a3;
- (id)AWDLGuardTime:(id *)a3;
- (id)AWDLMasterChannel:(id *)a3;
- (id)AWDLOpMode:(id *)a3;
- (id)AWDLPeerDatabase:(id *)a3;
- (id)AWDLPeerTrafficRegistration:(id *)a3;
- (id)AWDLPreferredChannels:(id *)a3;
- (id)AWDLPresenceMode:(id *)a3;
- (id)AWDLSecondaryMasterChannel:(id *)a3;
- (id)AWDLSidecarDiagnostics:(id *)a3;
- (id)AWDLSocialTimeSlots:(id *)a3;
- (id)AWDLStatistics:(id *)a3;
- (id)AWDLStrategy:(id *)a3;
- (id)AWDLSyncChannelSequence:(id *)a3;
- (id)AWDLSyncEnabled:(id *)a3;
- (id)AWDLSyncParameters:(id *)a3;
- (id)AWDLSyncState:(id *)a3;
- (id)BSSID:(id *)a3;
- (id)DTIMInterval:(id *)a3;
- (id)LQMConfig:(id *)a3;
- (id)LQMSummary:(id *)a3;
- (id)MCSIndex:(id *)a3;
- (id)RSSI:(id *)a3;
- (id)SSID:(id *)a3;
- (id)__MCSIndex:(id *)a3;
- (id)__guardInterval:(id *)a3;
- (id)__hardwareSupportedChannels:(id *)a3;
- (id)__numberOfSpatialStreams:(id *)a3;
- (id)__supportedChannelsWithCountryCode:(id)a3 error:(id *)a4;
- (id)activePHYMode:(id *)a3;
- (id)authType:(id *)a3;
- (id)backgroundScanCache:(id *)a3;
- (id)beaconCache:(id *)a3;
- (id)blockedBands:(id *)a3;
- (id)bluetoothCoexistenceConfig:(id *)a3;
- (id)bluetoothCoexistenceMode:(id *)a3;
- (id)bluetoothCoexistenceProfiles2GHz:(id *)a3;
- (id)bluetoothCoexistenceProfiles5GHz:(id *)a3;
- (id)capabilities:(id *)a3;
- (id)cca:(id *)a3;
- (id)chainAck:(id *)a3;
- (id)channel:(id *)a3;
- (id)countryBandSupport:(id *)a3;
- (id)countryCode:(id *)a3;
- (id)currentNetwork:(id *)a3;
- (id)description;
- (id)desense:(id *)a3;
- (id)desenseLevel:(id *)a3;
- (id)eventHandler;
- (id)guardInterval:(id *)a3;
- (id)hardwareMACAddress:(id *)a3;
- (id)hardwareSupportedChannels:(id *)a3;
- (id)hostAPStationList:(id *)a3;
- (id)interfaceNames:(id *)a3;
- (id)leakyAPStats:(id *)a3;
- (id)linkChangedEventData:(id *)a3;
- (id)maxLinkSpeed:(id *)a3;
- (id)maxNSSForAP:(id *)a3;
- (id)noise:(id *)a3;
- (id)numberOfSpatialStreams:(id *)a3;
- (id)opMode:(id *)a3;
- (id)perAntennaRSSI:(id *)a3;
- (id)powerDebugInfo:(id *)a3;
- (id)powerOn:(id *)a3;
- (id)powerState:(id *)a3;
- (id)powersave:(id *)a3;
- (id)rangingCapabilities:(id *)a3;
- (id)rxRate:(id *)a3;
- (id)state:(id *)a3;
- (id)supportedChannelsWithCountryCode:(id)a3 error:(id *)a4;
- (id)supportedPHYModes:(id *)a3;
- (id)txChainPower:(id *)a3;
- (id)txNSS:(id *)a3;
- (id)txPower:(id *)a3;
- (id)txRate:(id *)a3;
- (id)virtualInterfaceNames:(id *)a3;
- (id)virtualInterfaceParent:(id *)a3;
- (id)virtualInterfaceRole:(id *)a3;
- (id)wowEnabled:(id *)a3;
- (int)startMonitoringEventWithType:(unsigned int)a3 interfaceName:(id)a4;
- (int)virtualInterfaceRole;
- (unsigned)__apple80211FindServiceWithInterfaceName:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
- (void)stopMonitoringEventWithType:(unsigned int)a3 interfaceName:(id)a4;
@end

@implementation CWFApple80211

- (unsigned)__apple80211FindServiceWithInterfaceName:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  v5 = v3;
  if (v3)
  {
    id v11 = v3;
    v12 = @"IOPropertyMatch";
    v10 = @"IOInterfaceName";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v4, (uint64_t)&v11, (uint64_t)&v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v7, (uint64_t)v13, (uint64_t)&v12, 1);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v8) {
      LODWORD(v8) = IOServiceGetMatchingService(*MEMORY[0x1896086A8], v8);
    }
  }

  else
  {
    LODWORD(v8) = 0;
  }

  return v8;
}

- (_Apple80211)__apple80211RefWithInterfaceName:(id)a3
{
  id v4 = a3;
  if (Apple80211Open())
  {
    io_object_t v9 = 0;
    goto LABEL_11;
  }

  if (v4)
  {
    io_object_t ServiceWithInterfaceName = objc_msgSend___apple80211FindServiceWithInterfaceName_(self, v5, (uint64_t)v4, v6, v7);
    if (!ServiceWithInterfaceName) {
      goto LABEL_9;
    }
    io_object_t v9 = ServiceWithInterfaceName;
    if (Apple80211BindToInterfaceWithService())
    {
LABEL_11:
      Apple80211Close();
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  else
  {
    io_object_t v9 = 0;
  }

  if (v9) {
LABEL_8:
  }
    IOObjectRelease(v9);
LABEL_9:

  return 0LL;
}

- (CWFApple80211)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___CWFApple80211;
  io_object_t v9 = -[CWFApple80211 init](&v38, sel_init);
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
  interfaceName = v9->_interfaceName;
  v9->_interfaceName = (NSString *)v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.corewifi.apple80211-mutex", v12);
  mutexQueue = v9->_mutexQueue;
  v9->_mutexQueue = (OS_dispatch_queue *)v13;

  if (!v9->_mutexQueue) {
    goto LABEL_6;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.corewifi.apple80211-event", v15);
  eventQueue = v9->_eventQueue;
  v9->_eventQueue = (OS_dispatch_queue *)v16;

  if (!v9->_eventQueue) {
    goto LABEL_6;
  }
  uint64_t v21 = objc_msgSend___apple80211RefWithInterfaceName_(v9, v18, (uint64_t)v4, v19, v20);
  v9->_a11Ref = (_Apple80211 *)v21;
  if (!v21) {
    goto LABEL_6;
  }
  objc_msgSend_virtualInterfaceRole_(v9, v22, 0, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_virtualInterfaceRole = objc_msgSend_unsignedIntValue(v25, v26, v27, v28, v29);

  uint64_t v33 = objc_msgSend_virtualInterfaceParent_(v9, v30, 0, v31, v32);
  virtualInterfaceParent = v9->_virtualInterfaceParent;
  v9->_virtualInterfaceParent = (NSString *)v33;

  v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableInterfaceNameEventMap = v9->_mutableInterfaceNameEventMap;
  v9->_mutableInterfaceNameEventMap = v35;

  if (!v9->_mutableInterfaceNameEventMap)
  {
LABEL_6:

    io_object_t v9 = 0LL;
  }

  return v9;
}

- (CWFApple80211)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFApple80211 invalidate](v3, v4);
  return result;
}

- (void)invalidate
{
  if (self->_a11Ref) {
    Apple80211EventMonitoringHalt();
  }
}

- (void)dealloc
{
  if (self->_a11Ref) {
    Apple80211Close();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CWFApple80211;
  -[CWFApple80211 dealloc](&v3, sel_dealloc);
}

- (BOOL)__setupEventMonitoring
{
  if (Apple80211RawEventMonitoringInit())
  {
    CWFGetOSLog();
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      CWFGetOSLog();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v7 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  CWFGetOSLog();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CWFGetOSLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v12 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
LABEL_13:
    objc_msgSend_interfaceName(self, v8, v9, v10, v11);
    dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

- (int)startMonitoringEventWithType:(unsigned int)a3 interfaceName:(id)a4
{
  id v6 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18646A058;
  block[3] = &unk_189E5C010;
  block[4] = self;
  id v11 = v6;
  unsigned int v12 = a3;
  id v8 = v6;
  dispatch_sync(mutexQueue, block);

  return 0;
}

- (void)stopMonitoringEventWithType:(unsigned int)a3 interfaceName:(id)a4
{
  id v6 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18646A19C;
  block[3] = &unk_189E5C010;
  id v10 = v6;
  id v11 = self;
  unsigned int v12 = a3;
  id v8 = v6;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEventType:(unsigned int)a3 interfaceName:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_18646A2D8;
  v10[3] = &unk_189E5C038;
  id v11 = v6;
  unsigned int v12 = &v14;
  v10[4] = self;
  unsigned int v13 = a3;
  id v8 = v6;
  dispatch_sync(mutexQueue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (id)interfaceNames:(id *)a3
{
  int IfListCopy = Apple80211GetIfListCopy();
  if (IfListCopy)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  IfListCopy,  0);
      id v10 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    id v10 = (void *)objc_msgSend_initWithArray_(v6, v7, 0, v8, v9);
  }

  return v10;
}

- (id)virtualInterfaceNames:(id *)a3
{
  Virtualint IfListCopy = Apple80211GetVirtualIfListCopy();
  if (VirtualIfListCopy)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  VirtualIfListCopy,  0);
      id v10 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    id v10 = (void *)objc_msgSend_initWithArray_(v6, v7, 0, v8, v9);
  }

  return v10;
}

- (id)powerOn:(id *)a3
{
  int Power = Apple80211GetPower();
  if (Power)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  Power,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x189607968], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)__MCSIndex:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)MCSIndex:(id *)a3
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_unsignedIntValue(v7, v8, v9, v10, v11) & 0x80) != 0) {
    objc_msgSend___VHTMCSIndex_(self, v12, (uint64_t)a3, v13, v14);
  }
  else {
    objc_msgSend___MCSIndex_(self, v12, (uint64_t)a3, v13, v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)DTIMInterval:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 1LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __strlcpy_chk();
  LODWORD(v11) = 41;
  DWORD2(v11) = 8;
  unsigned int v12 = &v9;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v5, HIDWORD(v9), v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)perAntennaRSSI:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v13) = 16;
  DWORD2(v13) = 52;
  uint64_t v14 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 52, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)RSSI:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = 0LL;
  if (objc_msgSend_length(v5, v6, v7, v8, v9) == 52)
  {
    id v11 = v5;
    uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15);
    uint64_t v20 = 28LL;
    if (*(_DWORD *)(v16 + 4) == 1) {
      uint64_t v20 = 12LL;
    }
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v17, *(unsigned int *)(v16 + v20), v18, v19);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)noise:(id *)a3
{
  int v7 = Apple80211CopyValue();
  if (v7)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v4, (uint64_t)@"NOISE_CTL_AGR", v5, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a3 && v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)authType:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v10 = 0;
  uint64_t v9 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v12) = 2;
  DWORD2(v12) = 16;
  uint64_t v13 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 16, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)activePHYMode:(id *)a3
{
  int v7 = Apple80211CopyValue();
  if (v7)
  {
    int v8 = 0LL;
  }

  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v4, (uint64_t)@"PHYMODE_ACTIVE", v5, v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a3 && v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)supportedPHYModes:(id *)a3
{
  int v7 = Apple80211CopyValue();
  if (v7)
  {
    int v8 = 0LL;
  }

  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v4, (uint64_t)@"PHYMODE_SUPPORTED", v5, v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a3 && v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)txRate:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)txPower:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __strlcpy_chk();
  int v9 = 1;
  LODWORD(v12) = 7;
  DWORD2(v12) = 12;
  uint64_t v13 = &v9;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v5, HIDWORD(v10), v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)opMode:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    int v9 = 0LL;
  }
  else {
    int v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)__guardInterval:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    int v9 = 0LL;
  }
  else {
    int v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)guardInterval:(id *)a3
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_unsignedIntValue(v7, v8, v9, v10, v11) & 0x80) != 0) {
    objc_msgSend___VHTGuardInterval_(self, v12, (uint64_t)a3, v13, v14);
  }
  else {
    objc_msgSend___guardInterval_(self, v12, (uint64_t)a3, v13, v14);
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)__numberOfSpatialStreams:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)numberOfSpatialStreams:(id *)a3
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_unsignedIntValue(v7, v8, v9, v10, v11) & 0x80) != 0) {
    objc_msgSend___VHTNumberOfSpatialStreams_(self, v12, (uint64_t)a3, v13, v14);
  }
  else {
    objc_msgSend___numberOfSpatialStreams_(self, v12, (uint64_t)a3, v13, v14);
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)capabilities:(id *)a3
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!Mutable)
  {
    __int128 v12 = 0LL;
    int v7 = -3901;
    if (!a3) {
      return v12;
    }
    goto LABEL_5;
  }

  CFMutableArrayRef v6 = Mutable;
  int v7 = Apple80211Get();
  if (v7)
  {
    __int128 v12 = 0LL;
  }

  else
  {
    id v8 = objc_alloc(MEMORY[0x189603F18]);
    __int128 v12 = (void *)objc_msgSend_initWithArray_(v8, v9, (uint64_t)v6, v10, v11);
  }

  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)SSID:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)BSSID:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
    CWFCorrectEthernetAddressString(v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)countryCode:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)virtualInterfaceParent:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)virtualInterfaceRole:(id *)a3
{
  int v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v4,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)wowEnabled:(id *)a3
{
  int v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v4,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)linkChangedEventData:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __strlcpy_chk();
  LODWORD(v11) = 156;
  DWORD2(v11) = 32;
  __int128 v12 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0, v8, v9, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 32, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)channel:(id *)a3
{
  int v5 = Apple80211CopyValue();
  if (v5)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
    objc_msgSend_objectForKeyedSubscript_(0, v7, (uint64_t)@"CHANNEL", v8, v9);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13, v14);
    objc_msgSend_setChannel_(v6, v16, v15, v17, v18);

    objc_msgSend_objectForKeyedSubscript_(0, v19, (uint64_t)@"CHANNEL_FLAGS", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = objc_msgSend_intValue(v22, v23, v24, v25, v26);
    objc_msgSend_setFlags_(v6, v28, v27, v29, v30);
  }

  if (a3 && v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v5,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)setChannel:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x189603FC8];
  id v7 = a3;
  objc_msgSend_dictionary(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)MEMORY[0x189607968];
  uint64_t v18 = objc_msgSend_channel(v7, v14, v15, v16, v17);
  objc_msgSend_numberWithUnsignedInteger_(v13, v19, v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v22, (uint64_t)@"CHANNEL", v24);

  uint64_t v25 = (void *)MEMORY[0x189607968];
  uint64_t v30 = objc_msgSend_flags(v7, v26, v27, v28, v29);

  objc_msgSend_numberWithUnsignedInt_(v25, v31, v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v35, (uint64_t)v34, (uint64_t)@"CHANNEL_FLAGS", v36);

  int v37 = MEMORY[0x186E3A6FC](self->_a11Ref, 4LL, 0LL, v12, 0xFFFFFFFFLL);
  int v39 = v37;
  if (a4 && v37)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v38,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v37,  0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v39 == 0;
}

- (id)__supportedChannelsWithCountryCode:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  bzero((char *)v37 + 4, 0x12D4uLL);
  LODWORD(v37[0]) = 1;
  v38[1198] = -1;
  if (v5)
  {
    char v39 = 1;
    id v6 = v5;
    uint64_t v11 = objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    __int16 v12 = *(_WORD *)v11;
    char v41 = *(_BYTE *)(v11 + 2);
    __int16 v40 = v12;
  }

  v46 = 0LL;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __strlcpy_chk();
  LODWORD(v45) = 27;
  DWORD2(v45) = 4824;
  v46 = v37;
  uint64_t v17 = Apple80211RawGet();
  if ((_DWORD)v17)
  {
    uint64_t v18 = 0LL;
    if (!a4) {
      goto LABEL_10;
    }
  }

  else
  {
    objc_msgSend_array(MEMORY[0x189603FA8], v13, v14, v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!HIDWORD(v37[0])) {
      goto LABEL_10;
    }
    uint64_t v34 = v17;
    v35 = a4;
    id v36 = v5;
    unint64_t v19 = 0LL;
    uint64_t v20 = v38;
    do
    {
      v42[0] = @"SUP_CHANNEL";
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v13, *(v20 - 1), v15, v16, v34, v35, v36, v37[0]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = @"SUP_CHANNEL_FLAGS";
      v43[0] = v21;
      unsigned int v22 = *v20;
      v20 += 3;
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v23, v22, v24, v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v27, (uint64_t)v43, (uint64_t)v42, 2);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v18, v29, (uint64_t)v28, v30, v31);
      ++v19;
    }

    while (v19 < HIDWORD(v37[0]));
    a4 = v35;
    id v5 = v36;
    LODWORD(v17) = v34;
    if (!v35) {
      goto LABEL_10;
    }
  }

  if ((_DWORD)v17)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], (int)v17, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

- (id)supportedChannelsWithCountryCode:(id)a3 error:(id *)a4
{
  uint64_t v104 = *MEMORY[0x1895F89C0];
  id v102 = 0LL;
  objc_msgSend___supportedChannelsWithCountryCode_error_(self, a2, (uint64_t)a3, (uint64_t)&v102, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v102;
  if (v11)
  {
    __int16 v12 = 0LL;
    if (a4) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }

  v97 = a4;
  objc_msgSend_array(MEMORY[0x189603FA8], v7, v8, v9, v10);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  v96 = v6;
  id v13 = v6;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v98, (uint64_t)v103, 16);
  if (!v15) {
    goto LABEL_19;
  }
  uint64_t v19 = v15;
  uint64_t v20 = *(void *)v99;
  do
  {
    uint64_t v21 = 0LL;
    do
    {
      if (*(void *)v99 != v20) {
        objc_enumerationMutation(v13);
      }
      unsigned int v22 = *(void **)(*((void *)&v98 + 1) + 8 * v21);
      objc_msgSend_objectForKeyedSubscript_(v22, v16, (uint64_t)@"SUP_CHANNEL", v17, v18);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)@"SUP_CHANNEL_FLAGS", v25, v26);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      int v32 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30, v31);
      int v33 = v32;
      if ((v32 & 2) != 0)
      {
        v49 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
        uint64_t v54 = objc_msgSend_unsignedIntegerValue(v23, v50, v51, v52, v53);
        objc_msgSend_setChannel_(v49, v55, v54, v56, v57);
        objc_msgSend_setFlags_(v49, v58, v33 & 0xFFFFF3FA, v59, v60);
        objc_msgSend_addObject_(v12, v61, (uint64_t)v49, v62, v63);

        if ((v33 & 4) == 0)
        {
LABEL_9:
          if ((v33 & 0x400) == 0) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }

      else if ((v32 & 4) == 0)
      {
        goto LABEL_9;
      }

      v64 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
      uint64_t v69 = objc_msgSend_unsignedIntegerValue(v23, v65, v66, v67, v68);
      objc_msgSend_setChannel_(v64, v70, v69, v71, v72);
      objc_msgSend_setFlags_(v64, v73, v33 & 0xFFFFF3FC, v74, v75);
      objc_msgSend_addObject_(v12, v76, (uint64_t)v64, v77, v78);

      if ((v33 & 0x400) == 0)
      {
LABEL_10:
        if ((v33 & 0x800) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        uint64_t v34 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
        uint64_t v39 = objc_msgSend_unsignedIntegerValue(v23, v35, v36, v37, v38);
        objc_msgSend_setChannel_(v34, v40, v39, v41, v42);
        objc_msgSend_setFlags_(v34, v43, v33 & 0xFFFFFBF8, v44, v45);
        objc_msgSend_addObject_(v12, v46, (uint64_t)v34, v47, v48);

        goto LABEL_12;
      }

- (id)__hardwareSupportedChannels:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  bzero(v27, 0x12D4uLL);
  int v26 = 1;
  v28[1198] = -1;
  char v29 = 1;
  uint64_t v34 = 0LL;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __strlcpy_chk();
  LODWORD(v33) = 27;
  DWORD2(v33) = 4824;
  uint64_t v34 = &v26;
  int v8 = Apple80211RawGet();
  if (v8)
  {
    uint64_t v9 = 0LL;
    if (!a3) {
      goto LABEL_8;
    }
  }

  else
  {
    objc_msgSend_array(MEMORY[0x189603FA8], v4, v5, v6, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27[0]) {
      goto LABEL_8;
    }
    uint64_t v25 = a3;
    unint64_t v10 = 0LL;
    id v11 = v28;
    do
    {
      v30[0] = @"SUP_CHANNEL";
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v4, *(v11 - 1), v6, v7);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = @"SUP_CHANNEL_FLAGS";
      v31[0] = v12;
      unsigned int v13 = *v11;
      v11 += 3;
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v14, v13, v15, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v17;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v18, (uint64_t)v31, (uint64_t)v30, 2);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v9, v20, (uint64_t)v19, v21, v22);
      ++v10;
    }

    while (v10 < v27[0]);
    a3 = v25;
    if (!v25) {
      goto LABEL_8;
    }
  }

  if (v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v4, *MEMORY[0x189607688], v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

- (id)hardwareSupportedChannels:(id *)a3
{
  uint64_t v104 = *MEMORY[0x1895F89C0];
  id v102 = 0LL;
  objc_msgSend___hardwareSupportedChannels_(self, a2, (uint64_t)&v102, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v102;
  if (v11)
  {
    __int16 v12 = 0LL;
    if (a3) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }

  v97 = a3;
  objc_msgSend_array(MEMORY[0x189603FA8], v7, v8, v9, v10);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  v96 = v6;
  id v13 = v6;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v98, (uint64_t)v103, 16);
  if (!v15) {
    goto LABEL_19;
  }
  uint64_t v19 = v15;
  uint64_t v20 = *(void *)v99;
  do
  {
    uint64_t v21 = 0LL;
    do
    {
      if (*(void *)v99 != v20) {
        objc_enumerationMutation(v13);
      }
      uint64_t v22 = *(void **)(*((void *)&v98 + 1) + 8 * v21);
      objc_msgSend_objectForKeyedSubscript_(v22, v16, (uint64_t)@"SUP_CHANNEL", v17, v18);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)@"SUP_CHANNEL_FLAGS", v25, v26);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      int v32 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30, v31);
      int v33 = v32;
      if ((v32 & 2) != 0)
      {
        v49 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
        uint64_t v54 = objc_msgSend_unsignedIntegerValue(v23, v50, v51, v52, v53);
        objc_msgSend_setChannel_(v49, v55, v54, v56, v57);
        objc_msgSend_setFlags_(v49, v58, v33 & 0xFFFFF3FA, v59, v60);
        objc_msgSend_addObject_(v12, v61, (uint64_t)v49, v62, v63);

        if ((v33 & 4) == 0)
        {
LABEL_9:
          if ((v33 & 0x400) == 0) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }

      else if ((v32 & 4) == 0)
      {
        goto LABEL_9;
      }

      v64 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
      uint64_t v69 = objc_msgSend_unsignedIntegerValue(v23, v65, v66, v67, v68);
      objc_msgSend_setChannel_(v64, v70, v69, v71, v72);
      objc_msgSend_setFlags_(v64, v73, v33 & 0xFFFFF3FC, v74, v75);
      objc_msgSend_addObject_(v12, v76, (uint64_t)v64, v77, v78);

      if ((v33 & 0x400) == 0)
      {
LABEL_10:
        if ((v33 & 0x800) == 0) {
          goto LABEL_12;
        }
LABEL_11:
        uint64_t v34 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
        uint64_t v39 = objc_msgSend_unsignedIntegerValue(v23, v35, v36, v37, v38);
        objc_msgSend_setChannel_(v34, v40, v39, v41, v42);
        objc_msgSend_setFlags_(v34, v43, v33 & 0xFFFFFBF8, v44, v45);
        objc_msgSend_addObject_(v12, v46, (uint64_t)v34, v47, v48);

        goto LABEL_12;
      }

- (BOOL)isAWDLEnabled
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    BOOL v11 = *(_DWORD *)(objc_msgSend_bytes(v6, v7, v8, v9, v10) + 8) != 0;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)AWDLSyncEnabled:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v11) = 117;
  DWORD2(v11) = 12;
  __int16 v12 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 12, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)AWDLSyncChannelSequence:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    __int128 v33 = 0u;
    memset(v34, 0, sizeof(v34));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v26 = 0u;
    __int128 v25 = 0u;
    __int128 v24 = 0u;
    __int128 v23 = 0u;
    __int128 v22 = 0u;
    __int128 v21 = 0u;
    __int128 v20 = 0u;
    __int128 v19 = 0u;
    __int128 v18 = 0u;
    __int128 v17 = 0u;
    __int128 v16 = 0u;
    __int128 v15 = 0u;
    __int128 v14 = 0u;
    __int128 v13 = 0u;
    __int128 v12 = 0u;
    __int128 v11 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v36) = 129;
    DWORD2(v36) = 400;
    uint64_t v37 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 400, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLSyncState:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
    int v13 = 0;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v15) = 134;
    DWORD2(v15) = 24;
    __int128 v16 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 24, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLSyncParameters:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
    int v13 = 0;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v15) = 116;
    DWORD2(v15) = 24;
    __int128 v16 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 24, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLElectionID:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 122;
    DWORD2(v12) = 8;
    int v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLElectionParameters:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    int v14 = 0;
    __int128 v13 = 0u;
    __int128 v12 = 0u;
    __int128 v11 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v16) = 155;
    DWORD2(v16) = 56;
    uint64_t v17 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 56, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLElectionRSSIThresholds:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v14) = 135;
    DWORD2(v14) = 20;
    __int128 v15 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 20, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLSocialTimeSlots:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 163;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLPeerDatabase:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    bzero(v11, 0x32E60uLL);
    __int128 v10 = 0u;
    __strlcpy_chk();
    v11[0] = 1;
    LODWORD(v10) = 203;
    DWORD2(v10) = 208480;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)v11, 208480, v8, 0, 0, v10, v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLStatistics:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    bzero(v10, 0xE80uLL);
    __int128 v13 = 0LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    v10[0] = 1;
    LODWORD(v12) = 223;
    DWORD2(v12) = 3712;
    __int128 v13 = v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)v10, 3712, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLMasterChannel:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 132;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLSecondaryMasterChannel:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 205;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLPreferredChannels:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v11 = 0LL;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v13) = 244;
    DWORD2(v13) = 12;
    uint64_t v14 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 12, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLOpMode:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 217;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLStrategy:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10[1] = 0LL;
    v10[2] = 0LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    v10[0] = 1LL;
    LODWORD(v12) = 148;
    DWORD2(v12) = 24;
    __int128 v13 = v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)v10, 24, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)rangingCapabilities:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v9 = 0LL;
  int v11 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v13) = 266;
  DWORD2(v13) = 24;
  uint64_t v14 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 24, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)AWDLSidecarDiagnostics:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    memset(v15, 0, sizeof(v15));
    __int128 v14 = 0u;
    __int128 v13 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0u;
    __strlcpy_chk();
    int v11 = 1;
    LODWORD(v10) = 351;
    DWORD2(v10) = 80;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v11, 80, v8, 0, 0, v10, &v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)powerState:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v9 = 0LL;
  int v11 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v13) = 19;
  DWORD2(v13) = 24;
  __int128 v14 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 24, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)chainAck:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v9 = 0LL;
  int v11 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v13) = 174;
  DWORD2(v13) = 24;
  __int128 v14 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 24, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)txChainPower:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v14 = 0;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v10 = 0u;
  __int128 v9 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v16) = 108;
  DWORD2(v16) = 88;
  uint64_t v17 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 88, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)desense:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v10 = 0;
  uint64_t v9 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __strlcpy_chk();
  int v8 = 1;
  LODWORD(v12) = 175;
  DWORD2(v12) = 16;
  __int128 v13 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 16, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)desenseLevel:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 1LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __strlcpy_chk();
  LODWORD(v10) = 194;
  DWORD2(v10) = 8;
  __int128 v11 = &v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v8, 8, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)bluetoothCoexistenceConfig:(id *)a3
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], a2, *MEMORY[0x189607688], 45, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)bluetoothCoexistenceProfiles2GHz:(id *)a3
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], a2, *MEMORY[0x189607688], 45, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)bluetoothCoexistenceProfiles5GHz:(id *)a3
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], a2, *MEMORY[0x189607688], 45, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)bluetoothCoexistenceMode:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 1LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __strlcpy_chk();
  LODWORD(v11) = 87;
  DWORD2(v11) = 8;
  uint64_t v12 = &v9;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v5, HIDWORD(v9), v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)leakyAPStats:(id *)a3
{
  *(void *)&v10[9044] = *MEMORY[0x1895F89C0];
  bzero(v10, 0x2354uLL);
  __int128 v8 = 0u;
  __strlcpy_chk();
  int v9 = 1;
  LODWORD(v8) = 232;
  DWORD2(v8) = 9048;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  *MEMORY[0x189607688],  v4,  0,  0,  0,  v8,  &v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v9, 9048, v6, 0, 0, v8, &v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)LQMSummary:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  bzero(v8, 0x15A0uLL);
  __int128 v10 = 0LL;
  v8[346] = 0u;
  __int128 v9 = 0u;
  __strlcpy_chk();
  LODWORD(v9) = 386;
  DWORD2(v9) = 5536;
  __int128 v10 = v8;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)v8, 5536, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)AWDLExtensionStateMachineParameters:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v14) = 118;
    DWORD2(v14) = 20;
    __int128 v15 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 20, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLElectionMetric:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v11 = 0LL;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v13) = 126;
    DWORD2(v13) = 12;
    __int128 v14 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 12, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLPresenceMode:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 136;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLGuardTime:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 124;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLAvailabilityWindowAPAlignment:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    int v12 = 0;
    uint64_t v11 = 0LL;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v14) = 127;
    DWORD2(v14) = 16;
    uint64_t v15 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 16, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLContinuousElectionAlgorithmEnabled:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 121;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLAFTxMode:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 208;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLPeerTrafficRegistration:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    int v23 = 0;
    __int128 v22 = 0u;
    __int128 v21 = 0u;
    __int128 v20 = 0u;
    __int128 v19 = 0u;
    __int128 v18 = 0u;
    __int128 v17 = 0u;
    __int128 v16 = 0u;
    __int128 v15 = 0u;
    __int128 v14 = 0u;
    __int128 v13 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0u;
    __strlcpy_chk();
    int v11 = 1;
    LODWORD(v10) = 164;
    DWORD2(v10) = 184;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v11, 184, v8, 0, 0, v10, &v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLEncryptionType:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 220;
    DWORD2(v12) = 8;
    __int128 v13 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)AWDLBTLEStateParameters:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __strlcpy_chk();
    int v10 = 1;
    LODWORD(v15) = 202;
    DWORD2(v15) = 28;
    __int128 v16 = &v10;
    int v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v6, (uint64_t)&v10, 28, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    int v7 = 6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v6, *MEMORY[0x189607688], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)powerDebugInfo:(id *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable)
  {
    uint64_t v12 = 0LL;
    int v7 = -3901;
    if (!a3) {
      return v12;
    }
    goto LABEL_5;
  }

  CFMutableDictionaryRef v6 = Mutable;
  int v7 = Apple80211Get();
  if (v7)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    id v8 = objc_alloc(MEMORY[0x189603F68]);
    uint64_t v12 = (void *)objc_msgSend_initWithDictionary_(v8, v9, (uint64_t)v6, v10, v11);
  }

  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)cca:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    __int128 v9 = 0LL;
  }
  else {
    __int128 v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)rxRate:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    __int128 v9 = 0LL;
  }
  else {
    __int128 v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)maxLinkSpeed:(id *)a3
{
  int v4 = Apple80211MaxLinkSpeed();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v4,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)state:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    __int128 v9 = 0LL;
  }
  else {
    __int128 v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)powersave:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    __int128 v9 = 0LL;
  }
  else {
    __int128 v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)maxNSSForAP:(id *)a3
{
  int v8 = Apple80211CopyValue();
  if (v8) {
    __int128 v9 = 0LL;
  }
  else {
    __int128 v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v8,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)txNSS:(id *)a3
{
  int v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v4,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)countryBandSupport:(id *)a3
{
  int v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v4,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)beaconCache:(id *)a3
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!Mutable)
  {
    __int128 v15 = 0LL;
    int v25 = -3901;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  __int128 v9 = Mutable;
  int v10 = Apple80211Get();
  if (v10)
  {
    int v25 = v10;
    __int128 v15 = 0LL;
  }

  else
  {
    objc_msgSend_array(MEMORY[0x189603FA8], v11, v12, v13, v14);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (CFArrayGetCount(v9) >= 1)
    {
      CFIndex v16 = 0LL;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v16);
        __int128 v18 = objc_alloc(&OBJC_CLASS___CWFScanResult);
        uint64_t v24 = (void *)objc_msgSend_initWithScanRecord_includeProperties_(v18, v19, (uint64_t)ValueAtIndex, 0, v20);
        if (v24) {
          objc_msgSend_addObject_(v15, v21, (uint64_t)v24, v22, v23);
        }

        ++v16;
      }

      while (CFArrayGetCount(v9) > v16);
    }

    int v25 = 0;
  }

  CFRelease(v9);
  if (a3)
  {
LABEL_10:
    if (v25)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v25,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

- (id)backgroundScanCache:(id *)a3
{
  uint64_t v104 = *MEMORY[0x1895F89C0];
  bzero(v90, 0xB00uLL);
  v103 = 0LL;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __strlcpy_chk();
  LODWORD(v102) = 215;
  DWORD2(v102) = 2816;
  v103 = v90;
  uint64_t v3 = 0LL;
  int v86 = Apple80211RawGet();
  if (v86) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v90[0] == 0;
  }
  if (!v8)
  {
    unint64_t v11 = 0LL;
    uint64_t v3 = 0LL;
    uint64_t v12 = 1LL;
    while (1)
    {
      __int128 v88 = *(_OWORD *)&v90[v12];
      int v89 = v90[v12 + 4];
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v4, v5, v6, v7, v83, v84);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (snprintf( __str,  0x12uLL,  "%02x:%02x:%02x:%02x:%02x:%02x",  v88,  BYTE1(v88),  BYTE2(v88),  BYTE3(v88),  BYTE4(v88),  BYTE5(v88)) != 17) {
        break;
      }
      objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)__str, v15, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      CWFCorrectEthernetAddressString(v17);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v19, (uint64_t)v18, (uint64_t)@"BSSID", v20);

      objc_msgSend_numberWithShort_(MEMORY[0x189607968], v21, (char)v89, v22, v23);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, (uint64_t)@"RSSI", v26);

      if (HIDWORD(v88))
      {
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v27, HIDWORD(v88), v28, v29);
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, (uint64_t)@"CHANNEL", v32);

        if (HIDWORD(v88) <= 0xE) {
          uint64_t v36 = 10LL;
        }
        else {
          uint64_t v36 = 18LL;
        }
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x189607968], v33, BYTE6(v88) & 1, v34, v35);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v38, (uint64_t)v37, (uint64_t)@"CONNECTED_BSSID", v39);

        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v40, v36, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v44, (uint64_t)v43, (uint64_t)@"CHANNEL_FLAGS", v45);

        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v46, 1000 * DWORD2(v88), v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v50, (uint64_t)v49, (uint64_t)@"AGE", v51);

        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v52, v91 - 1000000000 * DWORD2(v88), v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v56, (uint64_t)v55, (uint64_t)@"TIMESTAMP", v57);

        objc_msgSend_setObject_forKeyedSubscript_( v13,  v58,  (uint64_t)&unk_189E8A8F0,  (uint64_t)@"SCAN_RESULT_NET_FLAGS",  v59);
        objc_msgSend_setObject_forKeyedSubscript_( v13,  v60,  MEMORY[0x189604A88],  (uint64_t)@"SCAN_RESULT_FROM_BG_SCAN",  v61);
        uint64_t v62 = objc_alloc(&OBJC_CLASS___CWFScanResult);
        objc_msgSend_setWithObjects_( MEMORY[0x189604010],  v63,  (uint64_t)&unk_189E87E00,  v64,  v65,  &unk_189E87E18,  &unk_189E87E30,  &unk_189E87E48,  &unk_189E87E60,  &unk_189E87E78,  0);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v69 = (os_log_s *)objc_msgSend_initWithScanRecord_includeProperties_(v62, v67, (uint64_t)v13, (uint64_t)v66, v68);

        if (!v3)
        {
          objc_msgSend_array(MEMORY[0x189603FA8], v70, v71, v72, v73);
          uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend_addObject_(v3, v70, (uint64_t)v69, v72, v73);
      }

      else
      {
        CWFGetOSLog();
        uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
        {
          CWFGetOSLog();
          uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v69 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v75 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v76, (uint64_t)&v88, 20, v77);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          CWFHexadecimalStringFromData(v85, v78, v79, v80, v81);
          uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
          int v92 = 136446978;
          uint64_t v93 = "-[CWFApple80211 backgroundScanCache:]";
          __int16 v94 = 2082;
          v95 = "CWFApple80211.m";
          __int16 v96 = 1024;
          int v97 = 2468;
          __int16 v98 = 2112;
          __int128 v99 = v82;
          LODWORD(v84) = 38;
          uint64_t v83 = &v92;
          _os_log_send_and_compose_impl();
        }
      }

      ++v11;
      v12 += 5LL;
      if (v11 >= v90[0]) {
        goto LABEL_6;
      }
    }
  }

- (id)blockedBands:(id *)a3
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!Mutable)
  {
    uint64_t v12 = 0LL;
    int v7 = -3901;
    if (!a3) {
      return v12;
    }
    goto LABEL_5;
  }

  CFMutableArrayRef v6 = Mutable;
  int v7 = Apple80211Get();
  if (v7)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    id v8 = objc_alloc(MEMORY[0x189603F18]);
    uint64_t v12 = (void *)objc_msgSend_initWithArray_(v8, v9, (uint64_t)v6, v10, v11);
  }

  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)hostAPStationList:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!Mutable)
  {
    uint64_t v15 = 0LL;
    int v36 = -3901;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  CFMutableArrayRef v9 = Mutable;
  int v10 = Apple80211Get();
  if (v10)
  {
    int v36 = v10;
    uint64_t v15 = 0LL;
  }

  else
  {
    objc_msgSend_array(MEMORY[0x189603FA8], v11, v12, v13, v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    uint64_t v39 = v9;
    uint64_t v16 = v9;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v23 = objc_alloc_init(&OBJC_CLASS___CWFHostAPStation);
          objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)@"STATION_MAC", v25, v26);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
          CWFCorrectEthernetAddressString(v27);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setBSSID_(v23, v29, (uint64_t)v28, v30, v31);

          objc_msgSend_addObject_(v15, v32, (uint64_t)v23, v33, v34);
        }

        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v35, (uint64_t)&v40, (uint64_t)v44, 16);
      }

      while (v19);
    }

    int v36 = 0;
    CFMutableArrayRef v9 = v39;
  }

  CFRelease(v9);
  if (a3)
  {
LABEL_12:
    if (v36)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v36,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

- (id)LQMConfig:(id *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable)
  {
    uint64_t v12 = 0LL;
    int v7 = -3901;
    if (!a3) {
      return v12;
    }
    goto LABEL_5;
  }

  CFMutableDictionaryRef v6 = Mutable;
  int v7 = Apple80211Get();
  if (v7)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    id v8 = objc_alloc(MEMORY[0x189603F68]);
    uint64_t v12 = (void *)objc_msgSend_initWithDictionary_(v8, v9, (uint64_t)v6, v10, v11);
  }

  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v7,  0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (BOOL)setLQMConfig:(id)a3 error:(id *)a4
{
  int v5 = MEMORY[0x186E3A6FC](self->_a11Ref, 337LL, 0LL, a3, 0xFFFFFFFFLL);
  int v7 = v5;
  if (a4 && v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v6,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v5,  0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 0;
}

- (id)currentNetwork:(id *)a3
{
  int v5 = Apple80211CopyCurrentNetwork();
  if (v5)
  {
    CFMutableArrayRef v9 = 0LL;
  }

  else
  {
    CFMutableDictionaryRef v6 = objc_alloc(&OBJC_CLASS___CWFScanResult);
    CFMutableArrayRef v9 = (void *)objc_msgSend_initWithScanRecord_includeProperties_(v6, v7, 0, 0, v8);
  }

  if (a3 && v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v4,  (uint64_t)@"com.apple.corewifi.error.apple80211",  v5,  0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)hardwareMACAddress:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __strlcpy_chk();
  int v11 = 1;
  LODWORD(v14) = 359;
  DWORD2(v14) = 12;
  uint64_t v15 = &v11;
  int v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], v4, 0);
      CFMutableArrayRef v9 = 0LL;
      uint64_t v8 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      CFMutableArrayRef v9 = 0LL;
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v5, (uint64_t)&v12, 6, v6);
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v7)
    {
      CWFEthernetAddressStringFromData(v7);
      CFMutableArrayRef v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      CFMutableArrayRef v9 = 0LL;
    }
  }

  return v9;
}

- (id)description
{
  uint64_t v6 = (void *)NSString;
  interfaceName = self->_interfaceName;
  sub_1864536D0(self->_virtualInterfaceRole, a2, v2, v3, v4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_( v6,  v9,  (uint64_t)@"name=%@, role=%@, parent=%@",  v10,  v11,  interfaceName,  v8,  self->_virtualInterfaceParent);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int)virtualInterfaceRole
{
  return self->_virtualInterfaceRole;
}

- (NSString)virtualInterfaceParent
{
  return self->_virtualInterfaceParent;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end