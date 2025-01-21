@interface WiFiXPCManager
+ (id)__filteredScanResults:(__CFArray *)a3 scanParameters:(id)a4;
+ (id)sharedXPCManager;
- (BOOL)__isActivityRegisteredWithType:(int64_t)a3;
- (BOOL)isBackgroundActivityRegistered;
- (BOOL)isDisableAutoJoinActivityRegistered;
- (BOOL)isForegroundActivityRegistered;
- (BOOL)isQuiesceWiFiActivityRegistered;
- (BOOL)isWiFiBoundActivityRegistered;
- (BOOL)isWoWActivityRegistered;
- (WiFiXPCManager)init;
- (__WiFiDeviceManager)__deviceManagerWithInterfaceName:(id)a3;
- (__WiFiManager)getWiFiManager;
- (__WiFiNetwork)__copyCurrentKnownNetworkRef;
- (__WiFiNetwork)__copyCurrentNetworkRef;
- (__WiFiNetwork)__copyCurrentSessionBasedNetworkRef;
- (__WiFiNetwork)copyCachedCurrentKnownNetworkRef:(id)a3;
- (__WiFiNetwork)copyCachedCurrentNetworkRef:(id)a3;
- (__WiFiNetwork)copyCachedCurrentSessionBasedNetworkRef;
- (id)__OSSpecificAttributes;
- (id)__copyCurrentNetworkHotspotNetwork;
- (id)__getSensingParams:(id)a3;
- (id)__peerAssistedDiscoveryNetworksForUUID:(id)a3;
- (id)__queueForRequest:(id)a3;
- (id)__sanitizeSensingParams:(id)a3;
- (id)__supportedRequestTypes;
- (id)copyCachedCurrentHotspotNetwork;
- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)__addKnownBSS:(id)a3;
- (void)__addKnownNetworkProfile:(id)a3;
- (void)__associate:(id)a3 XPCConnection:(id)a4;
- (void)__clearAutoJoinDenyList:(id)a3;
- (void)__disassociate:(id)a3 XPCConnection:(id)a4;
- (void)__getAutoHotspotMode:(id)a3;
- (void)__getAutoJoinDenyList:(id)a3;
- (void)__getAutoJoinMetric:(id)a3;
- (void)__getAutoJoinStatistics:(id)a3;
- (void)__getBackgroundScanConfiguration:(id)a3;
- (void)__getCountryBandSupport:(id)a3;
- (void)__getCurrentNetworkProfile:(id)a3 XPCConnection:(id)a4;
- (void)__getCurrentScanResult:(id)a3;
- (void)__getDeviceUUID:(id)a3;
- (void)__getKnownNetworkProfiles:(id)a3;
- (void)__getPassword:(id)a3;
- (void)__getThermalIndex:(id)a3;
- (void)__getUserAutoJoinState:(id)a3;
- (void)__getUserSettings:(id)a3;
- (void)__getWiFiAssistOverrideReasons:(id)a3;
- (void)__handleActivity:(id)a3;
- (void)__performANQP:(id)a3;
- (void)__performAutoJoin:(id)a3;
- (void)__performNDD:(id)a3 XPCConnection:(id)a4;
- (void)__performRanging:(id)a3;
- (void)__performScan:(id)a3 XPCConnection:(id)a4;
- (void)__performSensing:(id)a3;
- (void)__removeKnownBSS:(id)a3;
- (void)__removeKnownNetworkProfile:(id)a3;
- (void)__resetAutoJoinStatistics:(id)a3;
- (void)__setAutoHotspotMode:(id)a3;
- (void)__setAutoJoinDenyList:(id)a3;
- (void)__setBackgroundScanConfiguration:(id)a3;
- (void)__setBlockedBands:(id)a3;
- (void)__setCompanionCountryCode:(id)a3;
- (void)__setOSSpecificAttributeForKey:(__CFString *)a3 attributes:(id)a4;
- (void)__setPassword:(id)a3;
- (void)__setPeerAssistedDiscoveryNetwork:(id)a3 interfaceName:(id)a4 UUID:(id)a5;
- (void)__setPower:(id)a3 XPCConnection:(id)a4;
- (void)__setRangeable:(id)a3;
- (void)__setRangingIdentifier:(id)a3;
- (void)__setThermalIndex:(id)a3;
- (void)__setUserAutoJoinState:(id)a3 XPCConnection:(id)a4;
- (void)__setUserSettings:(id)a3;
- (void)__startAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4;
- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4;
- (void)__stopAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4;
- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4;
- (void)__updateKnownBSS:(id)a3;
- (void)__updateKnownNetworkProfile:(id)a3 XPCConnection:(id)a4;
- (void)__updateSoftAPBand:(id)a3 XPCConnection:(id)a4;
- (void)activate;
- (void)associationDoneWithNetwork:(__WiFiNetwork *)a3 error:(int)a4 interfaceName:(id)a5;
- (void)autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4;
- (void)autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4;
- (void)autoJoinUpdatedWithState:(int64_t)a3 interfaceName:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)replayLinkUpEventWithInterfaceName:(id)a3;
- (void)sendAutoHotspotModeDidChangeEvent;
- (void)sendInternetRelayLinkChangedEvent:(BOOL)a3 rssi:(int64_t)a4 interfaceName:(id)a5;
- (void)sendKnownNetworkDidChangeEventForProfile:(id)a3 eventType:(int64_t)a4;
- (void)sendUserAutoJoinStateDidChangeEvent;
- (void)sendUserSettingsDidChangeEvent;
- (void)sendWiFiAssistEventWithInterfaceName:(id)a3 linkQualityMetricInfo:(id)a4;
- (void)sendWoWDidChangeEventWithInterfaceName:(id)a3;
- (void)sendXPCEvent:(id)a3;
- (void)setCachedCurrentHotspotNetwork:(id)a3;
- (void)setCachedCurrentKnownNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4;
- (void)setCachedCurrentNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4;
- (void)setCachedCurrentSessionBasedNetworkRef:(__WiFiNetwork *)a3;
- (void)setWiFiManager:(__WiFiManager *)a3;
- (void)willAssociateWithNetwork:(__WiFiNetwork *)a3 isAutoJoin:(BOOL)a4 interfaceName:(id)a5;
@end

@implementation WiFiXPCManager

- (id)__supportedRequestTypes
{
  return &off_100205870;
}

- (__WiFiDeviceManager)__deviceManagerWithInterfaceName:(id)a3
{
  if (a3)
  {
    v4 = sub_10006C77C((CFArrayRef)self->_managerRef);
    if (v4)
    {
      v5 = v4;
      if (CFArrayGetCount(v4) < 1)
      {
        CFRelease(v5);
      }

      else
      {
        CFIndex v6 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, v6);
          uint64_t v8 = sub_10003BEDC((uint64_t)ValueAtIndex);
          if (v8 && (v9 = sub_100048F14(v8)) != 0LL)
          {
            v10 = v9;
            if (CFArrayGetCount(v9) < 1)
            {
              CFTypeRef v14 = 0LL;
            }

            else
            {
              CFIndex v11 = 0LL;
              do
              {
                v12 = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v11);
                Value = (void *)CFDictionaryGetValue(v12, @"VIRT_IF_NAME");
                else {
                  CFTypeRef v14 = 0LL;
                }
                ++v11;
              }

              while (CFArrayGetCount(v10) > v11 && !v14);
            }

            CFRelease(v10);
          }

          else
          {
            CFTypeRef v14 = 0LL;
          }

          ++v6;
        }

        while (CFArrayGetCount(v5) > v6 && !v14);
        CFRelease(v5);
        if (v14) {
          return (__WiFiDeviceManager *)CFAutorelease(v14);
        }
      }
    }
  }

  return 0LL;
}

- (__WiFiNetwork)__copyCurrentSessionBasedNetworkRef
{
  return (__WiFiNetwork *)sub_10007F628((const __CFArray *)self->_managerRef);
}

- (__WiFiNetwork)__copyCurrentNetworkRef
{
  v2 = sub_10006C77C((CFArrayRef)self->_managerRef);
  if (!v2) {
    return 0LL;
  }
  v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    v10 = 0LL;
  }

  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      uint64_t v8 = sub_10003BEDC((uint64_t)ValueAtIndex);
      else {
        v10 = 0LL;
      }
      ++v6;
    }

    while (v5 > v6 && !v10);
  }

  CFRelease(v3);
  return v10;
}

- (__WiFiNetwork)__copyCurrentKnownNetworkRef
{
  v2 = sub_10006C77C((CFArrayRef)self->_managerRef);
  if (!v2) {
    return 0LL;
  }
  v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    v10 = 0LL;
  }

  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
      uint64_t v8 = sub_10003BEDC((uint64_t)ValueAtIndex);
      else {
        v10 = 0LL;
      }
      ++v6;
    }

    while (v5 > v6 && !v10);
  }

  CFRelease(v3);
  return v10;
}

- (id)__copyCurrentNetworkHotspotNetwork
{
  v2 = sub_10006C77C((CFArrayRef)self->_managerRef);
  if (!v2) {
    return 0LL;
  }
  v3 = v2;
  CFIndex Count = CFArrayGetCount(v2);
  if (Count < 1)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    do
    {
      CFArrayGetValueAtIndex(v3, v6);
      uint64_t v7 = sub_1000FAF60();
      uint64_t v8 = (void *)v7;
      ++v6;
    }

    while (v5 > v6 && !v7);
  }

  CFRelease(v3);
  return v8;
}

- (__WiFiNetwork)copyCachedCurrentNetworkRef:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentNetworkMap, "objectForKeyedSubscript:", a3);
  if (v5) {
    CFIndex v6 = (__WiFiNetwork *)sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)v5);
  }
  else {
    CFIndex v6 = 0LL;
  }
  objc_sync_exit(self);
  return v6;
}

- (void)setCachedCurrentNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4
{
  if (a3)
  {
    uint64_t v7 = sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
    currentNetworkMap = self->_currentNetworkMap;
    if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentNetworkMap, "setObject:forKeyedSubscript:", v7, a4);
      CFRelease(v7);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentNetworkMap, "setObject:forKeyedSubscript:", 0LL, a4);
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_currentNetworkMap,  "setObject:forKeyedSubscript:",  0LL,  a4);
  }

  objc_sync_exit(self);
}

- (__WiFiNetwork)copyCachedCurrentKnownNetworkRef:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentKnownNetworkMap, "objectForKeyedSubscript:", a3);
  if (v5) {
    CFIndex v6 = (__WiFiNetwork *)sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)v5);
  }
  else {
    CFIndex v6 = 0LL;
  }
  objc_sync_exit(self);
  return v6;
}

- (void)setCachedCurrentKnownNetworkRef:(__WiFiNetwork *)a3 interfaceName:(id)a4
{
  if (a3)
  {
    uint64_t v7 = sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
    currentKnownNetworkMap = self->_currentKnownNetworkMap;
    if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( currentKnownNetworkMap,  "setObject:forKeyedSubscript:",  v7,  a4);
      CFRelease(v7);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( currentKnownNetworkMap,  "setObject:forKeyedSubscript:",  0LL,  a4);
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_currentKnownNetworkMap,  "setObject:forKeyedSubscript:",  0LL,  a4);
  }

  objc_sync_exit(self);
}

- (id)copyCachedCurrentHotspotNetwork
{
  id v3 = -[CWFScanResult copy](self->_currentHotspotNetwork, "copy");
  objc_sync_exit(self);
  return v3;
}

- (void)setCachedCurrentHotspotNetwork:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  objc_sync_enter(self);

  self->_currentHotspotNetwork = (CWFScanResult *)[a3 copy];
  objc_sync_exit(self);
  objc_autoreleasePoolPop(v5);
}

- (__WiFiNetwork)copyCachedCurrentSessionBasedNetworkRef
{
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef) {
    v4 = (__WiFiNetwork *)sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)cachedCurrentSessionBasedNetworkRef);
  }
  else {
    v4 = 0LL;
  }
  objc_sync_exit(self);
  return v4;
}

- (void)setCachedCurrentSessionBasedNetworkRef:(__WiFiNetwork *)a3
{
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
  {
    CFRelease(cachedCurrentSessionBasedNetworkRef);
    self->_cachedCurrentSessionBasedNetworkRef = 0LL;
  }

  if (a3) {
    self->_cachedCurrentSessionBasedNetworkRef = (__WiFiNetwork *)sub_100094E60( (uint64_t)kCFAllocatorDefault,  (uint64_t)a3);
  }
  objc_sync_exit(self);
}

- (void)__getDeviceUUID:(id)a3
{
  v4 = sub_10006F6C0(self->_managerRef, @"DeviceUUID");
  if (v4) {
    id v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
  }
  else {
    id v5 = 0LL;
  }
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v6 setObject:v5 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    uint64_t v7 = (void (**)(id, void, id))[a3 response];
    v7[2](v7, 0LL, v6);
  }

- (void)__getCurrentScanResult:(id)a3
{
  id v5 = [a3 info];
  unsigned int v6 = objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue");
  if (v6)
  {
    uint64_t v7 = CWFGetOSLog() ? (os_log_s *)CWFGetOSLog() : (os_log_s *)&_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136446722;
      v18 = "-[WiFiXPCManager __getCurrentScanResult:]";
      __int16 v19 = 2082;
      v20 = "WiFiXPCManager.m";
      __int16 v21 = 1024;
      int v22 = 411;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[corewifi] %{public}s (%{public}s:%u) Forcing non-cached query of current scan result",  &v17,  28);
    }
  }

  if (objc_msgSend(objc_msgSend(a3, "requestParameters"), "virtualInterfaceRole") == 10)
  {
    if (v6) {
      id v8 = -[WiFiXPCManager __copyCurrentNetworkHotspotNetwork](self, "__copyCurrentNetworkHotspotNetwork");
    }
    else {
      id v8 = -[WiFiXPCManager copyCachedCurrentHotspotNetwork](self, "copyCachedCurrentHotspotNetwork");
    }
    id v10 = v8;
  }

  else
  {
    if (v6) {
      v9 = -[WiFiXPCManager __copyCurrentNetworkRef](self, "__copyCurrentNetworkRef");
    }
    else {
      v9 = -[WiFiXPCManager copyCachedCurrentNetworkRef:]( self,  "copyCachedCurrentNetworkRef:",  objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName"));
    }
    CFIndex v11 = v9;
    if (v9)
    {
      id v10 = sub_1000A335C((uint64_t)v9);
      if (v6) {
        v12 = -[WiFiXPCManager __copyCurrentKnownNetworkRef](self, "__copyCurrentKnownNetworkRef");
      }
      else {
        v12 = -[WiFiXPCManager copyCachedCurrentKnownNetworkRef:]( self,  "copyCachedCurrentKnownNetworkRef:",  objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName"));
      }
      v13 = v12;
      if (v12)
      {
        CFTypeRef v14 = sub_1000A063C((CFDictionaryRef *)v12);
        if (v14) {
          id v10 = [v10 scanResultWithMatchingKnownNetworkProfile:v14];
        }
        CFRelease(v13);
      }

      CFRelease(v11);
    }

    else
    {
      id v10 = 0LL;
    }
  }

  id v15 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v15 setObject:v10 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    v16 = (void (**)(id, void, id))[a3 response];
    v16[2](v16, 0LL, v15);
  }

- (void)__getCurrentNetworkProfile:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  if (objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCForceNoCacheKey), "BOOLValue"))
  {
    if (CWFGetOSLog()) {
      id v8 = (os_log_s *)CWFGetOSLog();
    }
    else {
      id v8 = (os_log_s *)&_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int valuePtr = 136446722;
      v28 = "-[WiFiXPCManager __getCurrentNetworkProfile:XPCConnection:]";
      __int16 v29 = 2082;
      v30 = "WiFiXPCManager.m";
      __int16 v31 = 1024;
      int v32 = 454;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[corewifi] %{public}s (%{public}s:%u) Forcing non-cached query of current network profile",  &valuePtr,  28);
    }

    v9 = -[WiFiXPCManager __copyCurrentSessionBasedNetworkRef](self, "__copyCurrentSessionBasedNetworkRef");
    id v10 = -[WiFiXPCManager __copyCurrentKnownNetworkRef](self, "__copyCurrentKnownNetworkRef");
  }

  else
  {
    v9 = -[WiFiXPCManager copyCachedCurrentSessionBasedNetworkRef](self, "copyCachedCurrentSessionBasedNetworkRef");
    id v10 = -[WiFiXPCManager copyCachedCurrentKnownNetworkRef:]( self,  "copyCachedCurrentKnownNetworkRef:",  objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName"));
  }

  CFIndex v11 = v10;
  if (objc_msgSend(objc_msgSend(a3, "requestParameters"), "virtualInterfaceRole") == 10)
  {
    id v12 = -[WiFiXPCManager copyCachedCurrentHotspotNetwork](self, "copyCachedCurrentHotspotNetwork");
    if (v12)
    {
      v13 = v12;
      if (v11) {
        CFRelease(v11);
      }
      if ([v13 matchingKnownNetworkProfile]) {
        CFTypeRef v14 = (__WiFiNetwork *)sub_1000A1DEC([v13 matchingKnownNetworkProfile], 0);
      }
      else {
        CFTypeRef v14 = (__WiFiNetwork *)sub_1000A3DB0(v13);
      }
      CFIndex v11 = v14;
      if (v14) {
        sub_10009582C((uint64_t)v14, @"IsPersonalHotspot", kCFBooleanTrue);
      }
    }
  }

  if (v11)
  {
    id v15 = sub_100096804(v9);
    v16 = sub_100096804(v11);
    BOOL v17 = 0LL;
    if (v15 && v16) {
      BOOL v17 = CFEqual(v15, v16) != 0;
    }
    if (sub_100095B4C((uint64_t)v11)
      && objc_msgSend( objc_msgSend( a4,  "valueForEntitlement:",  @"com.apple.wifi.eap-nearby-device-setup-config-copy"),  "BOOLValue"))
    {
      int valuePtr = -1431655766;
      int v18 = sub_1000F08B0(v11);
      int valuePtr = v18;
      uint64_t v19 = sub_1000BD5E8(v18);
      if (v18 == 1 && !sub_1000F0918(v11))
      {
        int valuePtr = 4;
        Default = CFAllocatorGetDefault();
        CFNumberRef v21 = CFNumberCreate(Default, kCFNumberIntType, &valuePtr);
        if (v21)
        {
          CFNumberRef v22 = v21;
          sub_10009582C((uint64_t)v11, @"ShareableStatus", v21);
          CFRelease(v22);
        }
      }
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    v23 = sub_1000A063C((CFDictionaryRef *)v11);
    v24 = v23;
    if (v23)
    {
      [v23 setSessionBased:v17];
      [v24 setNearbyShareableStatus:v19];
    }

    v25 = 0LL;
    if (v9) {
      goto LABEL_33;
    }
  }

  else
  {
    v25 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
    v24 = 0LL;
    if (v9) {
LABEL_33:
    }
      CFRelease(v9);
  }

  if (v11) {
    CFRelease(v11);
  }
  if (v25)
  {
    if (![a3 response]) {
      return;
    }
  }

  else
  {
    id v26 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v26 setObject:v24 forKeyedSubscript:CWFXPCResultKey];
    if (![a3 response]) {
      return;
    }
  }

  (*((void (**)(void))[a3 response] + 2))();
}

- (void)__getKnownNetworkProfiles:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfilePropertiesKey];
  CFArrayRef v7 = sub_10006CA28((uint64_t)self->_managerRef);
  if (v7)
  {
    id v8 = v7;
    v9 = -[WiFiXPCManager __copyCurrentSessionBasedNetworkRef](self, "__copyCurrentSessionBasedNetworkRef");
    id v10 = v9;
    if (v9) {
      CFIndex v11 = sub_100096804(v9);
    }
    else {
      CFIndex v11 = 0LL;
    }
    id v12 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    if (CFArrayGetCount(v8) >= 1)
    {
      CFIndex v13 = 0LL;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, v13);
        id v15 = sub_100096804(ValueAtIndex);
        BOOL v16 = 0LL;
        if (v11 && v15) {
          BOOL v16 = CFEqual(v11, v15) != 0;
        }
        BOOL v17 = sub_1000A063C((CFDictionaryRef *)ValueAtIndex);
        if (v17)
        {
          int v18 = v17;
          [v17 setSessionBased:v16];
          objc_msgSend(v12, "addObject:", objc_msgSend(v18, "filteredNetworkProfileWithProperties:", v6));
        }

        ++v13;
      }

      while (CFArrayGetCount(v8) > v13);
    }

    if (v10) {
      CFRelease(v10);
    }
    CFRelease(v8);
  }

  else
  {
    if (+[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL))
    {
      if ([a3 response]) {
        goto LABEL_17;
      }
      return;
    }

    id v12 = 0LL;
  }

  id v19 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v20 = [v12 copy];
  [v19 setObject:v20 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response]) {
LABEL_17:
  }
    (*((void (**)(void))[a3 response] + 2))();
}

- (void)__getThermalIndex:(id)a3
{
  uint64_t v4 = sub_10007CB2C((uint64_t)self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v6 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4);
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    CFArrayRef v7 = (void (**)(id, void, id))[a3 response];
    v7[2](v7, 0LL, v5);
  }

- (void)__getCountryBandSupport:(id)a3
{
  uint64_t v4 = sub_10007CB34(self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v6 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4);
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    CFArrayRef v7 = (void (**)(id, void, id))[a3 response];
    v7[2](v7, 0LL, v5);
  }

- (void)__setThermalIndex:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCThermalIndexKey];
  if (v6)
  {
    sub_10007CC1C((uint64_t)self->_managerRef, (uint64_t)[v6 unsignedIntValue]);
    CFArrayRef v7 = 0LL;
  }

  else
  {
    CFArrayRef v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if ([a3 response])
  {
    id v8 = (void (**)(id, NSError *, void))[a3 response];
    v8[2](v8, v7, 0LL);
  }

- (void)__setCompanionCountryCode:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCCountryCodeKey];
  if (v6)
  {
    sub_100079C4C((uint64_t)self->_managerRef, [v6 stringValue]);
    sub_100084584((uint64_t)self->_managerRef, 1LL);
    CFArrayRef v7 = 0LL;
  }

  else
  {
    CFArrayRef v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if ([a3 response])
  {
    id v8 = (void (**)(id, NSError *, void))[a3 response];
    v8[2](v8, v7, 0LL);
  }

- (id)__peerAssistedDiscoveryNetworksForUUID:(id)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  id v10 = sub_10011D470;
  CFIndex v11 = sub_10011D480;
  uint64_t v12 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011D48C;
  block[3] = &unk_1001E58D0;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(mutexQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)__setPeerAssistedDiscoveryNetwork:(id)a3 interfaceName:(id)a4 UUID:(id)a5
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10011D650;
  v6[3] = &unk_1001E58F8;
  v6[4] = a5;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a3;
  dispatch_async(mutexQueue, v6);
}

- (void)__startAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCAWDLPeerAssistedDiscoveryParamsKey];
  if (!v9
    || (v10 = v9, (CFIndex v11 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 22LL;
    goto LABEL_37;
  }

  uint64_t v12 = v11;
  CFIndex v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v13)
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 6LL;
    goto LABEL_37;
  }

  uint64_t v14 = (uint64_t)v13;
  if (objc_msgSend( -[WiFiXPCManager __peerAssistedDiscoveryNetworksForUUID:]( self,  "__peerAssistedDiscoveryNetworksForUUID:",  objc_msgSend(a4, "UUID")),  "objectForKeyedSubscript:",  v12))
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 37LL;
    goto LABEL_37;
  }

  id v15 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ([v10 peerMACAddress])
  {
    BOOL v16 = ether_aton((const char *)objc_msgSend(objc_msgSend(v10, "peerMACAddress"), "UTF8String"));
    if (v16) {
      objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16, 6),  @"AWDL_IF_MAC_ADDRESS");
    }
  }

  if ([v10 peerMasterChannel]) {
    objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "peerMasterChannel")),  @"AWDL_INFO_PEER_MASTER_CHANNEL");
  }
  if ([v10 peerPreferredChannel]) {
    objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "peerPreferredChannel")),  @"AWDL_INFO_PREFERRED_CHANNEL");
  }
  if ([v10 peerSecondaryPreferredChannel])
  {
    unsigned __int16 v25 = (unsigned __int16)[v10 peerSecondaryPreferredChannel];
    objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v25, 2),  @"AWDL_INFO_EXT");
  }

  if ([v10 peerAssistedDiscoveryMetric]) {
    objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "peerAssistedDiscoveryMetric")),  @"AWDL_INFO_ASSISTED_DISCOVERY_METRIC");
  }
  if ([v10 peerSupportedChannelFlags]) {
    objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v10, "peerSupportedChannelFlags")),  @"AWDL_INFO_SUPPORTED_CHANNEL_FLAGS");
  }
  id v17 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ([v10 localMasterChannel]) {
    objc_msgSend( v17,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "localMasterChannel")),  @"AWDL_INFO_PEER_MASTER_CHANNEL");
  }
  if ([v10 localPreferredChannel]) {
    objc_msgSend( v17,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "localPreferredChannel")),  @"AWDL_INFO_PREFERRED_CHANNEL");
  }
  if ([v10 localSecondaryPreferredChannel])
  {
    unsigned __int16 v25 = (unsigned __int16)[v10 localSecondaryPreferredChannel];
    objc_msgSend( v17,  "setObject:forKeyedSubscript:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v25, 2),  @"AWDL_INFO_EXT");
  }

  if ([v10 localAssistedDiscoveryMetric]) {
    objc_msgSend( v17,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "localAssistedDiscoveryMetric")),  @"AWDL_INFO_ASSISTED_DISCOVERY_METRIC");
  }
  if ([v17 count]) {
    [v15 setObject:v17 forKeyedSubscript:@"AWDL_INFO_SELF"];
  }
  if ([v10 followMode])
  {
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"APPLE80211KEY_AWDL_INFO_ASSISTED_DISCOVERY_FOLLOW"];
    if ([v10 followModePreferredBand]) {
      objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "followModePreferredBand")),  @"AWDL_INFO_PEER_PREFERRED_BAND");
    }
  }

  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472LL;
  aBlock[2] = sub_10011DB94;
  aBlock[3] = &unk_1001E5920;
  aBlock[4] = self;
  aBlock[5] = v12;
  aBlock[6] = a4;
  aBlock[7] = a3;
  int v18 = _Block_copy(aBlock);
  int v19 = sub_1000E556C(v14, v12, 4, v15, (uint64_t)sub_10011DC60, (uint64_t)v18, [a4 processName]);
  if (v19)
  {
    NSErrorDomain v20 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v21 = v19;
LABEL_37:
    CFNumberRef v22 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  v21,  0LL);
    if (v22)
    {
      if ([a3 response])
      {
        v23 = (void (**)(id, NSError *, void))[a3 response];
        v23[2](v23, v22, 0LL);
      }
    }
  }

- (void)__stopAWDLPeerAssistedDiscovery:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v8)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 22LL;
    goto LABEL_16;
  }

  id v9 = v8;
  id v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
  if (!v10)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 6LL;
    goto LABEL_16;
  }

  uint64_t v11 = (uint64_t)v10;
  id v12 = objc_msgSend( -[WiFiXPCManager __peerAssistedDiscoveryNetworksForUUID:]( self,  "__peerAssistedDiscoveryNetworksForUUID:",  objc_msgSend(a4, "UUID")),  "objectForKeyedSubscript:",  v9);
  if (!v12)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 2LL;
    goto LABEL_16;
  }

  CFIndex v13 = sub_100094AAC((uint64_t)kCFAllocatorDefault, v12);
  if (!v13)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    uint64_t v20 = 12LL;
LABEL_16:
    id v17 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  v20,  0LL);
    if (!v17) {
      return;
    }
    goto LABEL_8;
  }

  uint64_t v14 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10011DEC4;
  v21[3] = &unk_1001E5948;
  v21[4] = self;
  v21[5] = v9;
  v21[6] = a4;
  v21[7] = a3;
  id v15 = _Block_copy(v21);
  int v16 = sub_1000E5F48(v11, v9, v14, (uint64_t)sub_10011DF6C, (uint64_t)v15);
  if (v16) {
    id v17 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  v16,  0LL);
  }
  else {
    id v17 = 0LL;
  }
  CFRelease(v14);
  if (v17)
  {
LABEL_8:
    if ([a3 response])
    {
      int v18 = (void (**)(id, NSError *, void))[a3 response];
      v18[2](v18, v17, 0LL);
    }
  }

- (void)__addKnownNetworkProfile:(id)a3
{
  id v5 = a3;
  id v6 = [a3 info];
  objc_msgSend( objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey), "mutableCopy"),  "addObjectsFromArray:",  &off_100205888);
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (!v8) {
    goto LABEL_29;
  }
  id v9 = v8;
  id v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v10) {
    goto LABEL_29;
  }
  uint64_t v11 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v10);
  if (!v11)
  {
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = 6LL;
LABEL_31:
    id v26 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v33,  v34,  0LL);
    if (!v26) {
      return;
    }
    goto LABEL_25;
  }

  uint64_t v12 = (uint64_t)v11;
  CFIndex v13 = sub_1000A1DEC(v9, 0LL);
  if (!v13)
  {
LABEL_29:
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = 22LL;
    goto LABEL_31;
  }

  uint64_t v14 = v13;
  id v15 = sub_1000D8D10(v12, v13);
  if (v15)
  {
    v23 = v15;
    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 17LL;
    goto LABEL_36;
  }

  id v16 = [v9 copy];
  [v16 setOSSpecificAttributes:0];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v17 = objc_msgSend(objc_msgSend(v9, "OSSpecificAttributes", 0), "allKeys");
  id v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend( v16,  "setOSSpecificValue:forKey:",  objc_msgSend( objc_msgSend(v9, "OSSpecificAttributes"),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v35 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v35 + 1) + 8 * (void)i));
      }

      id v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v19);
  }

  CFNumberRef v22 = (const __CFArray *)sub_1000A1DEC(v16, 0LL);
  if (v22)
  {
    v23 = v22;
    if (((unint64_t)[v9 addReason] & 0xFFFFFFFFFFFFFFFELL) == 0xE)
    {
      id v24 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      objc_msgSend( v24,  "setObject:forKeyedSubscript:",  sub_1000951FC((uint64_t)v23, @"NetworkOriginator"),  @"NetworkOriginator");
      objc_msgSend( v24,  "setObject:forKeyedSubscript:",  sub_1000951FC((uint64_t)v23, @"BundleIdentifier"),  @"BundleIdentifier");
      unsigned int v25 = sub_100074A94( (uint64_t)self->_managerRef,  0LL,  v23,  (const __CFDictionary *)v24,  (void (*)(uint64_t, const void *, uint64_t, uint64_t))sub_10011E3EC,  (uint64_t)a3);
      id v26 = 0LL;
      if (!v25) {
        goto LABEL_23;
      }
      NSErrorDomain v27 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v28 = v25;
    }

    else
    {
      id v29 = objc_msgSend((id)sub_1000951FC((uint64_t)v23, @"WiFiManagerKnownNetworksEventType"), "intValue");
      if (sub_100072038((uint64_t)self->_managerRef, v23, (uint64_t)v29))
      {
        if ([a3 response])
        {
          id v30 = [a3 response];
          (*((void (**)(id, void, void))v30 + 2))(v30, 0LL, 0LL);
        }

        id v26 = 0LL;
        goto LABEL_23;
      }

      NSErrorDomain v27 = NSPOSIXErrorDomain;
      uint64_t v28 = 6LL;
    }

- (void)__updateKnownNetworkProfile:(id)a3 XPCConnection:(id)a4
{
  id v5 = a3;
  id v7 = [a3 info];
  id v8 = objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CWFXPCNetworkProfilePropertiesKey), "mutableCopy");
  [v8 addObjectsFromArray:&off_1002058A0];
  id v9 = [v5 info];
  id v10 = [v9 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_msgSend(objc_msgSend(v5, "requestParameters"), "interfaceName");
    if (v12)
    {
      CFIndex v13 = v12;
      uint64_t v14 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v12);
      if (!v14)
      {
        NSErrorDomain v39 = NSPOSIXErrorDomain;
        uint64_t v40 = 6LL;
        goto LABEL_34;
      }

      uint64_t v15 = (uint64_t)v14;
      id v16 = sub_1000A1DEC(v11, 0LL);
      if (v16)
      {
        id v17 = v16;
        id v18 = (CFDictionaryRef *)sub_1000D92D0(v15, v16);
        if (!v18)
        {
          __int128 v36 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
          __int128 v37 = v17;
LABEL_27:
          CFRelease(v37);
          goto LABEL_28;
        }

        id v19 = v18;
        uint64_t v20 = sub_1000A063C(v18);
        if (v20)
        {
          uint64_t v21 = v20;
          id v41 = a4;
          v42 = v17;
          id v43 = v5;
          v44 = v19;
          id v22 = [v5 info];
          id v23 = objc_msgSend( v11,  "filteredNetworkProfileWithProperties:OSSpecificKeys:",  v8,  objc_msgSend(v22, "objectForKeyedSubscript:", CWFXPCOSSpecificKeysKey));
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id v24 = objc_msgSend(objc_msgSend(v23, "OSSpecificAttributes"), "allKeys");
          id v25 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v46;
            do
            {
              for (i = 0LL; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v46 != v27) {
                  objc_enumerationMutation(v24);
                }
                objc_msgSend( v21,  "setOSSpecificValue:forKey:",  objc_msgSend( objc_msgSend(v23, "OSSpecificAttributes"),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v45 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v45 + 1) + 8 * (void)i));
              }

              id v26 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
            }

            while (v26);
          }

          [v23 setOSSpecificAttributes:0];
          [v21 mergeWithNetworkProfile:v23];
          id v29 = sub_1000A1DEC(v21, 0LL);
          if (v29)
          {
            id v19 = v44;
            if ((sub_1000787B0((uint64_t)self->_managerRef, v29, [v41 processName]) & 1) != 0
              && sub_100077498((uint64_t)self->_managerRef, v29, 1u))
            {
              unsigned int v30 = [v21 disable6EMode] == (id)2;
              __int16 v31 = sub_100095BC8(v29);
              sub_1000DF8C0(v15, v13, v31, v30);
              int v32 = sub_1000D3348(v15, v13);
              if (v32)
              {
                NSErrorDomain v33 = v32;
                uint64_t v34 = sub_100095BC8(v32);
                __int128 v35 = sub_100095BC8(v29);
                id v17 = v42;
                id v5 = v43;
                if (v34 && v35 && CFEqual(v34, v35)) {
                  sub_1000DAC64(v15, (const __CFDictionary **)v29);
                }
                CFRelease(v33);
                __int128 v36 = 0LL;
                goto LABEL_25;
              }

              __int128 v36 = 0LL;
            }

            else
            {
              __int128 v36 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  6LL,  0LL);
            }

            id v17 = v42;
            id v5 = v43;
          }

          else
          {
            __int128 v36 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
            id v5 = v43;
            id v19 = v44;
          }
        }

        else
        {
          __int128 v36 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
          id v29 = 0LL;
        }

- (void)__removeKnownNetworkProfile:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (!v6) {
    goto LABEL_38;
  }
  id v7 = v6;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCRemoveReasonKey];
  if (!v9) {
    goto LABEL_38;
  }
  id v10 = v9;
  id v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v11) {
    goto LABEL_38;
  }
  id v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v12)
  {
    NSErrorDomain v30 = NSPOSIXErrorDomain;
    uint64_t v31 = 6LL;
    goto LABEL_39;
  }

  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = sub_1000A1DEC(v7, 0LL);
  if (!v14)
  {
LABEL_38:
    NSErrorDomain v30 = NSPOSIXErrorDomain;
    uint64_t v31 = 22LL;
LABEL_39:
    uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  v31,  0LL);
    goto LABEL_35;
  }

  uint64_t v15 = v14;
  id v16 = sub_1000D8D10(v13, v14);
  if (v16)
  {
    id v17 = (const __CFDictionary **)v16;
    id v18 = [v10 integerValue];
    int v19 = 0;
    uint64_t v20 = 4LL;
    switch((unint64_t)v18)
    {
      case 2uLL:
      case 3uLL:
        int v19 = 1;
        goto LABEL_10;
      case 4uLL:
        break;
      case 6uLL:
        int v19 = 0;
        uint64_t v20 = 7LL;
        break;
      case 7uLL:
        int v19 = 0;
        uint64_t v20 = 12LL;
        break;
      case 8uLL:
        int v19 = 0;
        uint64_t v20 = 13LL;
        break;
      default:
        int v19 = 0;
LABEL_10:
        uint64_t v20 = 2LL;
        break;
    }

    if (sub_100076340((uint64_t)self->_managerRef, v17, v20))
    {
      sub_1000D8D78(v13, v17);
      if (v19)
      {
        else {
          id v22 = (os_log_s *)&_os_log_default;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v32 = 136315650;
          NSErrorDomain v33 = "-[WiFiXPCManager __removeKnownNetworkProfile:]";
          __int16 v34 = 2112;
          __int128 v35 = sub_100095BC8(v17);
          __int16 v36 = 2048;
          id v37 = [v10 integerValue];
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "[corewifi] %s: Removing password for %@ per reason %ld",  &v32,  32);
        }

        uint64_t v21 = sub_100099D38(v17);
      }

      uint64_t v23 = CWFGetOSLog(v21);
      if (v23) {
        id v24 = (os_log_s *)CWFGetOSLog(v23);
      }
      else {
        id v24 = (os_log_s *)&_os_log_default;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = "false";
        if (!&_EAPTLSRemoveTrustExceptionsBindings) {
          id v25 = "true";
        }
        int v32 = 136315138;
        NSErrorDomain v33 = v25;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  1LL,  "[corewifi] EAPTLSRemoveTrustExceptionsBindings is NULL = %s",  (const char *)&v32);
      }

      if (&_EAPTLSRemoveTrustExceptionsBindings && sub_100095B4C((uint64_t)v17))
      {
        id v26 = sub_100095BC8(v17);
        EAPTLSRemoveTrustExceptionsBindings(@"WirelessSSID", v26);
      }

      uint64_t v27 = 0LL;
    }

    else
    {
      uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  6LL,  0LL);
    }

    CFRelease(v15);
    uint64_t v28 = v17;
  }

  else
  {
    uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
    uint64_t v28 = (const __CFDictionary **)v15;
  }

  CFRelease(v28);
LABEL_35:
  if ([a3 response])
  {
    id v29 = (void (**)(id, NSError *, void))[a3 response];
    v29[2](v29, v27, 0LL);
  }

- (void)__addKnownBSS:(id)a3
{
  id v3 = a3;
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCBSSKey];
    if (v9)
    {
      id v10 = v9;
      id v11 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName");
      if (v11)
      {
        id v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
        if (!v12)
        {
          NSErrorDomain v30 = NSPOSIXErrorDomain;
          uint64_t v31 = 6LL;
          goto LABEL_26;
        }

        uint64_t v13 = (uint64_t)v12;
        uint64_t v14 = sub_1000A1DEC(v7, 0LL);
        if (v14)
        {
          uint64_t v15 = v14;
          id v16 = (CFDictionaryRef *)sub_1000D92D0(v13, v14);
          if (!v16)
          {
            uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
            uint64_t v28 = v15;
LABEL_21:
            CFRelease(v28);
            goto LABEL_22;
          }

          id v17 = v16;
          id v18 = sub_1000A063C(v16);
          if (v18)
          {
            int v19 = v18;
            if (![v18 matchingKnownBSS:v10])
            {
              __int16 v34 = self;
              id v35 = v3;
              id v20 = [v10 copy];
              [v20 setOSSpecificAttributes:0];
              __int128 v38 = 0u;
              __int128 v39 = 0u;
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              id v21 = objc_msgSend(objc_msgSend(v10, "OSSpecificAttributes"), "allKeys");
              id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v37;
                do
                {
                  for (i = 0LL; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v37 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    objc_msgSend( v20,  "setOSSpecificValue:forKey:",  objc_msgSend( objc_msgSend(v10, "OSSpecificAttributes"),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v36 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v36 + 1) + 8 * (void)i));
                  }

                  id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
                }

                while (v23);
              }

              objc_msgSend(v19, "setBSSList:", objc_msgSend(objc_msgSend(v19, "BSSList"), "setByAddingObject:", v20));
              id v26 = sub_1000A1DEC(v19, 0LL);
              if (v26)
              {
                id v3 = v35;
                if (sub_100077498((uint64_t)v34->_managerRef, v26, 1u))
                {
                  uint64_t v27 = 0LL;
LABEL_19:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v26) {
                    goto LABEL_22;
                  }
                  uint64_t v28 = v26;
                  goto LABEL_21;
                }

                uint64_t v33 = 6LL;
              }

              else
              {
                uint64_t v33 = 22LL;
                id v3 = v35;
              }

              uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v33,  0LL);
              goto LABEL_19;
            }

            uint64_t v32 = 17LL;
          }

          else
          {
            uint64_t v32 = 2LL;
          }

          uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v32,  0LL);
          id v26 = 0LL;
          goto LABEL_19;
        }
      }
    }
  }

  NSErrorDomain v30 = NSPOSIXErrorDomain;
  uint64_t v31 = 22LL;
LABEL_26:
  uint64_t v27 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  v31,  0LL);
LABEL_22:
  if ([v3 response])
  {
    id v29 = (void (**)(id, NSError *, void))[v3 response];
    v29[2](v29, v27, 0LL);
  }

- (void)__updateKnownBSS:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = [a3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCBSSKey];
    if (v9)
    {
      id v10 = v9;
      id v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
      if (v11)
      {
        id v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
        if (!v12)
        {
          NSErrorDomain v35 = NSPOSIXErrorDomain;
          uint64_t v36 = 6LL;
          goto LABEL_26;
        }

        uint64_t v13 = (uint64_t)v12;
        uint64_t v14 = sub_1000A1DEC(v7, 0LL);
        if (v14)
        {
          uint64_t v15 = v14;
          id v16 = (CFDictionaryRef *)sub_1000D92D0(v13, v14);
          if (!v16)
          {
            uint64_t v32 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
            uint64_t v33 = v15;
LABEL_21:
            CFRelease(v33);
            goto LABEL_22;
          }

          id v17 = v16;
          id v18 = sub_1000A063C(v16);
          if (v18)
          {
            int v19 = v18;
            id v20 = [v18 matchingKnownBSS:v10];
            if (v20)
            {
              id v21 = v20;
              __int128 v38 = self;
              CFTypeRef cf = v15;
              id v22 = [a3 info];
              id v23 = [v22 objectForKeyedSubscript:CWFXPCBSSPropertiesKey];
              id v24 = [a3 info];
              id v25 = objc_msgSend( v10,  "filteredBSSWithProperties:OSSpecificKeys:",  v23,  objc_msgSend(v24, "objectForKeyedSubscript:", CWFXPCOSSpecificKeysKey));
              __int128 v40 = 0u;
              __int128 v41 = 0u;
              __int128 v42 = 0u;
              __int128 v43 = 0u;
              id v26 = objc_msgSend(objc_msgSend(v25, "OSSpecificAttributes"), "allKeys");
              id v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v41;
                do
                {
                  for (i = 0LL; i != v28; i = (char *)i + 1)
                  {
                    if (*(void *)v41 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    objc_msgSend( v21,  "setOSSpecificValue:forKey:",  objc_msgSend( objc_msgSend(v25, "OSSpecificAttributes"),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v40 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v40 + 1) + 8 * (void)i));
                  }

                  id v28 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
                }

                while (v28);
              }

              [v25 setOSSpecificAttributes:0];
              [v21 mergeWithBSS:v25];
              uint64_t v31 = sub_1000A1DEC(v19, 0LL);
              if (v31)
              {
                uint64_t v15 = cf;
                if (sub_100077498((uint64_t)v38->_managerRef, v31, 1u))
                {
                  uint64_t v32 = 0LL;
LABEL_19:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v31) {
                    goto LABEL_22;
                  }
                  uint64_t v33 = v31;
                  goto LABEL_21;
                }

                uint64_t v37 = 6LL;
              }

              else
              {
                uint64_t v37 = 22LL;
                uint64_t v15 = cf;
              }

              uint64_t v32 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v37,  0LL);
              goto LABEL_19;
            }
          }

          uint64_t v32 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
          uint64_t v31 = 0LL;
          goto LABEL_19;
        }
      }
    }
  }

  NSErrorDomain v35 = NSPOSIXErrorDomain;
  uint64_t v36 = 22LL;
LABEL_26:
  uint64_t v32 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v35,  v36,  0LL);
LABEL_22:
  if ([a3 response])
  {
    __int16 v34 = (void (**)(id, NSError *, void))[a3 response];
    v34[2](v34, v32, 0LL);
  }

- (void)__removeKnownBSS:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v6)
  {
    id v7 = v6;
    id v8 = [a3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCBSSKey];
    if (v9)
    {
      id v10 = v9;
      id v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
      if (v11)
      {
        id v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
        if (!v12)
        {
          NSErrorDomain v25 = NSPOSIXErrorDomain;
          uint64_t v26 = 6LL;
          goto LABEL_20;
        }

        uint64_t v13 = (uint64_t)v12;
        uint64_t v14 = sub_1000A1DEC(v7, 0LL);
        if (v14)
        {
          uint64_t v15 = v14;
          id v16 = (CFDictionaryRef *)sub_1000D92D0(v13, v14);
          if (!v16)
          {
            id v22 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
            id v23 = v15;
LABEL_14:
            CFRelease(v23);
            goto LABEL_15;
          }

          id v17 = v16;
          id v18 = sub_1000A063C(v16);
          if (v18)
          {
            int v19 = v18;
            id v20 = [v18 matchingKnownBSS:v10];
            if (v20)
            {
              id v21 = objc_msgSend(objc_msgSend(v19, "BSSList"), "mutableCopy");
              [v21 removeObject:v20];
              [v19 setBSSList:v21];
              id v20 = sub_1000A1DEC(v19, 0LL);
              if (v20)
              {
                if (sub_100077498((uint64_t)self->_managerRef, v20, 1u))
                {
                  id v22 = 0LL;
LABEL_12:
                  CFRelease(v15);
                  CFRelease(v17);
                  if (!v20) {
                    goto LABEL_15;
                  }
                  id v23 = v20;
                  goto LABEL_14;
                }

                uint64_t v27 = 6LL;
              }

              else
              {
                uint64_t v27 = 22LL;
              }

- (void)__setPower:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCPowerKey];
  if (v8 && (v9 = v8, (id v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    if (-[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v10))
    {
      sub_10006FC28( (uint64_t)self->_managerRef,  (int)[v9 BOOLValue],  (const __CFString *)objc_msgSend(a4, "processName"));
      id v11 = 0LL;
      goto LABEL_5;
    }

    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = 6LL;
  }

  else
  {
    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = 22LL;
  }

  id v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v14,  0LL);
LABEL_5:
  if ([a3 response])
  {
    id v12 = (void (**)(id, NSError *, void))[a3 response];
    v12[2](v12, v11, 0LL);
  }

- (void)__getPassword:(id)a3
{
  id v4 = [a3 info];
  id v5 = [v4 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v5 && (id v6 = (CFDictionaryRef *)sub_1000A1DEC(v5, 0LL)) != 0LL)
  {
    id v7 = v6;
    CFStringRef v8 = sub_100095408(v6);
    if (v8)
    {
      id v9 = (__CFString *)v8;
      id v10 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      id v11 = -[__CFString copy](v9, "copy");
      [v10 setObject:v11 forKeyedSubscript:CWFXPCResultKey];
      if ([a3 response])
      {
        id v12 = (void (**)(id, void, id))[a3 response];
        v12[2](v12, 0LL, v10);
      }

      CFRelease(v7);
      CFRelease(v9);
      return;
    }

    NSErrorDomain v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL);
    CFRelease(v7);
  }

  else
  {
    NSErrorDomain v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if (v13 && [a3 response])
  {
    uint64_t v14 = (void (**)(id, NSError *, void))[a3 response];
    v14[2](v14, v13, 0LL);
  }

- (void)__setPassword:(id)a3
{
  id v4 = [a3 info];
  id v5 = [v4 objectForKeyedSubscript:CWFXPCNetworkProfileKey];
  if (v5)
  {
    id v6 = v5;
    id v7 = [a3 info];
    CFStringRef v8 = (const __CFString *)[v7 objectForKeyedSubscript:CWFXPCPasswordKey];
    id v9 = sub_1000A1DEC(v6, 0LL);
    if (v9)
    {
      id v10 = v9;
      if (v8)
      {
        if (sub_100099C50(v9, v8))
        {
LABEL_5:
          id v11 = 0LL;
LABEL_6:
          CFRelease(v10);
          goto LABEL_7;
        }
      }

      else if (sub_100099D38(v9))
      {
        goto LABEL_5;
      }

      id v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  6LL,  0LL);
      goto LABEL_6;
    }
  }

  id v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
LABEL_7:
  if ([a3 response])
  {
    id v12 = (void (**)(id, NSError *, void))[a3 response];
    v12[2](v12, v11, 0LL);
  }

- (void)__disassociate:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCDisassocReasonKey];
  if (!v8 || (v9 = v8, (id v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 22LL;
LABEL_22:
    id v18 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  v21,  0LL);
    goto LABEL_17;
  }

  id v11 = v10;
  id v12 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v10);
  if (!v12)
  {
    NSErrorDomain v20 = NSPOSIXErrorDomain;
    uint64_t v21 = 6LL;
    goto LABEL_22;
  }

  uint64_t v13 = (uint64_t)v12;
  id v14 = [v9 integerValue];
  switch((unint64_t)v14)
  {
    case 1uLL:
      uint64_t v15 = 1033LL;
      break;
    case 2uLL:
    case 5uLL:
    case 6uLL:
      sub_10007D000( (const __CFArray *)objc_msgSend( +[WiFiXPCManager sharedXPCManager](WiFiXPCManager, "sharedXPCManager"),  "getWiFiManager"),  objc_msgSend(a4, "processName"));
      uint64_t v15 = 1011LL;
      break;
    case 3uLL:
      uint64_t v15 = 1015LL;
      break;
    case 4uLL:
      uint64_t v15 = 1012LL;
      break;
    case 7uLL:
      uint64_t v15 = 1027LL;
      break;
    default:
      uint64_t v15 = 1001LL;
      break;
  }

  uint64_t v16 = CWFGetOSLog(v14);
  if (v16) {
    id v17 = (os_log_s *)CWFGetOSLog(v16);
  }
  else {
    id v17 = (os_log_s *)&_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    id v23 = [v9 integerValue];
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[corewifi] __disassociate Request from CoreWiFi with reason:%ld \n",  &v22);
  }

  sub_1000CE074(v13, v11, v15, "-[WiFiXPCManager __disassociate:XPCConnection:]", 1461LL);
  id v18 = 0LL;
LABEL_17:
  if ([a3 response])
  {
    int v19 = (void (**)(id, NSError *, void))[a3 response];
    v19[2](v19, v18, 0LL);
  }

- (void)__updateSoftAPBand:(id)a3 XPCConnection:(id)a4
{
  id v6 = [a3 info];
  id v7 = [v6 objectForKeyedSubscript:CWFXPCSoftAPBand];
  if (!v7 || (id v8 = v7, (v9 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 22LL;
LABEL_30:
    NSErrorDomain v20 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v23,  0LL);
    goto LABEL_25;
  }

  id v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v9);
  if (!v10)
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 6LL;
    goto LABEL_30;
  }

  uint64_t v11 = (uint64_t)v10;
  id v12 = [v8 integerValue];
  if (v12 == (id)2)
  {
    uint64_t v15 = CWFGetOSLog(2LL);
    if (v15) {
      uint64_t v16 = (os_log_s *)CWFGetOSLog(v15);
    }
    else {
      uint64_t v16 = (os_log_s *)&_os_log_default;
    }
    int v19 = 2;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[corewifi] __updateSoftAPBand Request to 5G from CoreWiFi\n",  v24,  2,  *(void *)v24);
    }
  }

  else if (v12 == (id)1)
  {
    uint64_t v13 = CWFGetOSLog(1LL);
    if (v13) {
      id v14 = (os_log_s *)CWFGetOSLog(v13);
    }
    else {
      id v14 = (os_log_s *)&_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      int v19 = 1;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[corewifi] __updateSoftAPBand Request to 2.4G from CoreWiFi\n",  v24,  2,  *(void *)v24);
    }

    else
    {
      int v19 = 1;
    }
  }

  else
  {
    uint64_t v17 = CWFGetOSLog(v12);
    if (v17) {
      id v18 = (os_log_s *)CWFGetOSLog(v17);
    }
    else {
      id v18 = (os_log_s *)&_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v24 = 134217984;
      *(void *)&v24[4] = [v8 integerValue];
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[corewifi] __updateSoftAPBand Request with unexpected band(%ld)\n",  v24);
    }

    int v19 = 2;
  }

  sub_1000D95F8(v11, v19);
  NSErrorDomain v20 = 0LL;
LABEL_25:
  if ([a3 response])
  {
    uint64_t v21 = (void (**)(id, NSError *, void))[a3 response];
    v21[2](v21, v20, 0LL);
  }

- (void)__associate:(id)a3 XPCConnection:(id)a4
{
  uint64_t v7 = CWFGetOSLog(a3);
  if (v7) {
    id v8 = (os_log_s *)CWFGetOSLog(v7);
  }
  else {
    id v8 = (os_log_s *)&_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v37[0] = 0;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[corewifi] __associate Manual Association Requestion from user \n",  v37,  2);
  }

  id v9 = [a3 info];
  id v10 = [v9 objectForKeyedSubscript:CWFXPCAssocParamsKey];
  if (!v10) {
    goto LABEL_49;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(objc_msgSend(v10, "scanResult"), "scanRecord");
  if (!v12) {
    goto LABEL_49;
  }
  id v13 = v12;
  id v14 = sub_100094AAC((uint64_t)kCFAllocatorDefault, v12);
  if (!v14) {
    goto LABEL_49;
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v16)
  {
    NSErrorDomain v34 = NSPOSIXErrorDomain;
    uint64_t v35 = 22LL;
    goto LABEL_54;
  }

  uint64_t v17 = v16;
  id v18 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v16);
  if (!v18)
  {
    NSErrorDomain v34 = NSPOSIXErrorDomain;
    uint64_t v35 = 6LL;
    goto LABEL_54;
  }

  uint64_t v19 = (uint64_t)v18;
  id v36 = a4;
  NSErrorDomain v20 = (CFDictionaryRef *)sub_1000D8D10((uint64_t)v18, v15);
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = sub_1000A063C(v20);
    if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "hiddenState")) {
      objc_msgSend(v22, "setHiddenState:", objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "hiddenState"));
    }
    if (objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "EAPProfile")) {
      objc_msgSend(v22, "setEAPProfile:", objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "EAPProfile"));
    }
    CFRelease(v21);
    if (!v22) {
      goto LABEL_23;
    }
  }

  else
  {
    id v22 = objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "copy");
    if (!v22) {
      goto LABEL_23;
    }
  }

  objc_msgSend(v22, "setSSID:", objc_msgSend(objc_msgSend(v11, "scanResult"), "SSID"));
  objc_msgSend( v22,  "setPublicAirPlayNetwork:",  objc_msgSend(objc_msgSend(v11, "knownNetworkProfile"), "isPublicAirPlayNetwork"));
  uint64_t v23 = sub_1000A1DEC(v22, [v22 properties]);
  if (v23)
  {
    id v24 = v23;
    CFDictionaryRef v25 = sub_100012CEC((uint64_t)v23);
    if (!v25) {
      goto LABEL_22;
    }
    CFDictionaryRef v26 = v25;
    id v27 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v27 addEntriesFromDictionary:v26];
    [v27 addEntriesFromDictionary:v13];
    id v28 = [v27 copy];
    CFRelease(v15);
    uint64_t v15 = sub_100094AAC((uint64_t)kCFAllocatorDefault, v28);
    CFRelease(v26);
    if (v15)
    {
LABEL_22:
      CFRelease(v24);
      goto LABEL_23;
    }

+ (id)__filteredScanResults:(__CFArray *)a3 scanParameters:(id)a4
{
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (a3 && CFArrayGetCount(a3) >= 1)
  {
    CFIndex v7 = 0LL;
    do
    {
      id v8 = objc_autoreleasePoolPush();
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v7);
      if (ValueAtIndex)
      {
        id v10 = sub_1000A335C((uint64_t)ValueAtIndex);
        if (v10) {
          [v6 addObject:v10];
        }
      }

      objc_autoreleasePoolPop(v8);
      ++v7;
    }

    while (CFArrayGetCount(a3) > v7);
  }

  return (id)CWFFilteredScanResults(v6, a4);
}

- (void)__performScan:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCScanParamsKey];
  if (v9 && (v10 = v9, (id v11 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    id v12 = v11;
    id v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
    if (v13)
    {
      uint64_t v42 = (uint64_t)v13;
      id v14 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      if ([v10 SSID] || _os_feature_enabled_impl("CoreWiFi", "WiFi6EAlwaysFollowup"))
      {
        objc_msgSend(v10, "setScanFlags:", objc_msgSend(v10, "scanFlags") | 0x800);
        if (![a4 processName]
          || (objc_msgSend(objc_msgSend(a4, "processName"), "isEqualToString:", @"locationd") & 1) == 0
          && (objc_msgSend(objc_msgSend(a4, "processName"), "isEqualToString:", @"milod") & 1) == 0)
        {
          objc_msgSend(v10, "setScanFlags:", objc_msgSend(v10, "scanFlags") | 0x100);
        }
      }

      __int128 v41 = v14;
      id v44 = a4;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v43 = v10;
      id v15 = objc_msgSend(v10, "channels", v12);
      id v16 = [v15 countByEnumeratingWithState:&v49 objects:v60 count:16];
      if (v16)
      {
        id v17 = v16;
        id v18 = 0LL;
        uint64_t v19 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
            if (!v18) {
              id v18 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            }
            v58[0] = @"CHANNEL";
            id v22 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 channel]);
            v58[1] = @"CHANNEL_FLAGS";
            v59[0] = v22;
            v59[1] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v21 flags]);
            objc_msgSend( v18,  "addObject:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2));
          }

          id v17 = [v15 countByEnumeratingWithState:&v49 objects:v60 count:16];
        }

        while (v17);
      }

      else
      {
        id v18 = 0LL;
      }

      [v14 setObject:v18 forKeyedSubscript:@"SCAN_CHANNELS"];
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v23 = [v10 SSIDList];
      id v24 = [v23 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v24)
      {
        id v25 = v24;
        id v26 = 0LL;
        uint64_t v27 = *(void *)v46;
        do
        {
          for (j = 0LL; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)j);
            if (!v26) {
              id v26 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            }
            v55 = @"SSID_STR";
            uint64_t v56 = v29;
            objc_msgSend( v26,  "addObject:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1));
          }

          id v25 = [v23 countByEnumeratingWithState:&v45 objects:v57 count:16];
        }

        while (v25);
      }

      else
      {
        id v26 = 0LL;
      }

      if ([v26 count])
      {
        v53 = @"SSID_STR";
        v54 = &stru_1001EB6E0;
        objc_msgSend( v26,  "addObject:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1));
      }

      [v41 setObject:v26 forKeyedSubscript:@"SCAN_SSID_LIST"];
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(v43, "SSID"), @"SSID_STR");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v43, "scanType")),  @"SCAN_TYPE");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v43, "BSSType")),  @"SCAN_BSS_TYPE");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v43, "PHYMode")),  @"SCAN_PHY_MODE");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v43, "restTime")),  @"SCAN_REST_TIME");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v43, "dwellTime")),  @"SCAN_DWELL_TIME");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v43, "mergeScanResults")),  @"SCAN_MERGE");
      if ([v43 numberOfScans]) {
        id v30 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v43 numberOfScans]);
      }
      else {
        id v30 = (NSNumber *)&off_1002052C8;
      }
      [v41 setObject:v30 forKeyedSubscript:@"SCAN_NUM_SCANS"];
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v43, "scanFlags")),  @"SCAN_FLAGS");
      if ([v43 shortSSID]) {
        int v31 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v43 shortSSID]);
      }
      else {
        int v31 = 0LL;
      }
      [v41 setObject:v31 forKeyedSubscript:@"SCAN_SHORT_SSID"];
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(v43, "BSSID"), @"BSSID");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend(v43, "minimumTimestamp")),  @"SCAN_MIN_TIMESTAMP");
      [v41 setObject:&__kCFBooleanFalse forKeyedSubscript:@"SCAN_MERGE"];
      [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SCAN_CLOSED_NETWORKS"];
      objc_msgSend(v41, "setObject:forKeyedSubscript:", objc_msgSend(v44, "processName"), @"ScanReqClientName");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(objc_msgSend(v44, "XPCConnection"), "processIdentifier")),  @"ScanReqClientPid");
      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "receivedAt"),  @"ScanReqReceiptTimestamp");
      if ([v43 acceptableCacheAge] == (id)-1)
      {
        uint64_t v35 = sub_10003BEDC(v42);
        if (v35 && (id v36 = sub_1000539A4(v35, 0)) != 0LL)
        {
          uint64_t v37 = v36;
          id v38 = +[WiFiXPCManager __filteredScanResults:scanParameters:]( &OBJC_CLASS___WiFiXPCManager,  "__filteredScanResults:scanParameters:",  v36,  v43);
          CFRelease(v37);
        }

        else
        {
          id v38 = 0LL;
        }

        id v39 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        [v39 setObject:v38 forKeyedSubscript:CWFXPCResultKey];
        if (![a3 response]) {
          goto LABEL_49;
        }
LABEL_48:
        (*((void (**)(void))[a3 response] + 2))();
LABEL_49:

        return;
      }

      objc_msgSend( v41,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)objc_msgSend(v43, "acceptableCacheAge") / 1000.0),  @"SCAN_MAXAGE");
      int v32 = sub_1000E0560( v42,  v40,  (const __CFDictionary *)v41,  [v44 processName],  (uint64_t)sub_1001211A4,  (uint64_t)a3);
      if (!v32) {
        return;
      }
      NSErrorDomain v33 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v34 = v32;
    }

    else
    {
      NSErrorDomain v33 = NSPOSIXErrorDomain;
      uint64_t v34 = 6LL;
    }
  }

  else
  {
    NSErrorDomain v33 = NSPOSIXErrorDomain;
    uint64_t v34 = 22LL;
  }

  if (+[NSError errorWithDomain:code:userInfo:](&OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", v33, v34, 0LL))
  {
    if (![a3 response]) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

- (void)__performANQP:(id)a3
{
  id v5 = a3;
  id v6 = [a3 info];
  id v7 = [v6 objectForKeyedSubscript:CWFXPCANQPParamsKey];
  if (!v7 || (id v8 = v7, (v9 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v28 = NSPOSIXErrorDomain;
    uint64_t v29 = 22LL;
    goto LABEL_27;
  }

  id v10 = v9;
  id v11 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v9);
  if (!v11)
  {
    NSErrorDomain v28 = NSPOSIXErrorDomain;
    uint64_t v29 = 6LL;
    goto LABEL_27;
  }

  uint64_t v12 = (uint64_t)v11;
  id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v13 setObject:&off_1002052E0 forKeyedSubscript:@"GAS_PROTOCOL"];
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v8, "ANQPElementIDList"), @"GAS_QUERY");
  id v14 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v15 = objc_msgSend(v8, "scanResults", 0);
  id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)i) scanRecord];
        if (v20) {
          [v14 addObject:v20];
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v17);
  }

  uint64_t v21 = sub_10003A530((const __CFArray *)v14);
  if (!v21)
  {
    NSErrorDomain v28 = NSPOSIXErrorDomain;
    uint64_t v29 = 12LL;
LABEL_27:
    id v26 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v28,  v29,  0LL);
    if (!v26) {
      return;
    }
    goto LABEL_20;
  }

  id v22 = v21;
  [v13 setObject:v21 forKeyedSubscript:@"GAS_NETWORKS"];
  if ([v8 acceptableCacheAge] == (id)-1)
  {
    [v13 setObject:&off_1002052F8 forKeyedSubscript:@"SCAN_MAXAGE"];
    id v23 = (NSNumber *)&__kCFBooleanTrue;
    id v24 = @"CacheOnly";
  }

  else
  {
    id v23 = +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[v8 acceptableCacheAge] / 1000.0);
    id v24 = @"SCAN_MAXAGE";
  }

  [v13 setObject:v23 forKeyedSubscript:v24];
  int v25 = sub_1000E68D4(v12, v10, v13, (uint64_t)sub_1001216F4, (uint64_t)a3);
  if (v25) {
    id v26 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  v25,  0LL);
  }
  else {
    id v26 = 0LL;
  }
  CFRelease(v22);
  if (v26)
  {
LABEL_20:
    if ([a3 response])
    {
      uint64_t v27 = (void (**)(id, NSError *, void))[a3 response];
      v27[2](v27, v26, 0LL);
    }
  }

- (void)__performRanging:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = [v3 info];
  id v7 = [v6 objectForKeyedSubscript:CWFXPCRangingPeerListKey];
  if (!v7
    || (id v8 = v7,
        id v9 = [v3 info],
        v10 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", CWFXPCRangingTimeoutKey),  "unsignedIntegerValue"),  (id v11 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 22LL;
    goto LABEL_26;
  }

  id v12 = v11;
  id v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v13)
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = 6LL;
    goto LABEL_26;
  }

  uint64_t v26 = (uint64_t)v13;
  uint64_t v27 = v12;
  unint64_t v28 = (unint64_t)v10;
  uint64_t v29 = (uint64_t)v3;
  id v14 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v15 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v20 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        if ([v19 MACAddress]) {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v19, "MACAddress"), @"STATION_MAC");
        }
        if ([v19 PMK]) {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v19, "PMK"), @"RANGING_PMK");
        }
        if ([v19 identifier]) {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v19, "identifier"), @"RANGING_TOKEN_ID");
        }
        if ([v19 numberOfMeasurements]) {
          objc_msgSend( v20,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v19, "numberOfMeasurements")),  @"RANGING_NUM_MEASUREMENTS");
        }
        [v14 addObject:v20];
      }

      id v16 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v16);
  }

  id v3 = (id)v29;
  int v21 = sub_1000E6BEC(v26, v27, (const __CFArray *)v14, (uint64_t)sub_100121B7C, v29, (double)v28);
  if (v21)
  {
    NSErrorDomain v22 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v23 = v21;
LABEL_26:
    id v24 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  v23,  0LL);
    if (v24)
    {
      if ([v3 response])
      {
        int v25 = (void (**)(id, NSError *, void))[v3 response];
        v25[2](v25, v24, 0LL);
      }
    }
  }

- (void)__setRangeable:(id)a3
{
  id v3 = a3;
  id v5 = [a3 info];
  id obj = [v5 objectForKeyedSubscript:CWFXPCRangingPeerListKey];
  if (!obj
    || (id v6 = [v3 info],
        unsigned int v7 = objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", CWFXPCRangeableKey), "BOOLValue"),
        (id v8 = objc_msgSend(objc_msgSend(v3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v21 = NSPOSIXErrorDomain;
    uint64_t v22 = 22LL;
LABEL_19:
    uint64_t v19 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v21,  v22,  0LL);
    goto LABEL_14;
  }

  uint64_t v9 = (uint64_t)v8;
  id v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
  if (!v10)
  {
    NSErrorDomain v21 = NSPOSIXErrorDomain;
    uint64_t v22 = 6LL;
    goto LABEL_19;
  }

  uint64_t v24 = (uint64_t)v10;
  uint64_t v25 = v9;
  unsigned int v26 = v7;
  id v23 = v3;
  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v17 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v16, "MACAddress"), @"STATION_MAC");
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v16, "PMK"), @"RANGING_PMK");
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v16, "identifier"), @"RANGING_TOKEN_ID");
        [v11 addObject:v17];
      }

      id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v13);
  }

  int v18 = sub_1000E6BD4(v24, v25, v26, (const __CFArray *)v11);
  if (v18) {
    uint64_t v19 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  v18,  0LL);
  }
  else {
    uint64_t v19 = 0LL;
  }
  id v3 = v23;
LABEL_14:
  if ([v3 response])
  {
    id v20 = (void (**)(id, NSError *, void))[v3 response];
    v20[2](v20, v19, 0LL);
  }

- (void)__setRangingIdentifier:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCRangingIdentifierKey];
  id v7 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    uint64_t v9 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v7);
    if (v9)
    {
      uint64_t v10 = (uint64_t)v9;
      if (v6)
      {
        id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        [v11 setObject:v6 forKeyedSubscript:@"RANGING_TOKEN_ID"];
      }

      else
      {
        id v11 = 0LL;
      }

      int v12 = sub_1000E6BE4(v10, v8, v11 != 0LL, (uint64_t)v11);
      if (!v12)
      {
        id v13 = 0LL;
        goto LABEL_8;
      }

      NSErrorDomain v15 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v16 = v12;
    }

    else
    {
      NSErrorDomain v15 = NSPOSIXErrorDomain;
      uint64_t v16 = 6LL;
    }
  }

  else
  {
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = 22LL;
  }

  id v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  v16,  0LL);
LABEL_8:
  if ([a3 response])
  {
    uint64_t v14 = (void (**)(id, NSError *, void))[a3 response];
    v14[2](v14, v13, 0LL);
  }

- (void)__handleActivity:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCActivityKey];
  if (v6)
  {
    id v7 = 0LL;
    switch((unint64_t)[v6 type])
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
        sub_10007190C((uint64_t)self->_managerRef);
        goto LABEL_11;
      case 4uLL:
        sub_10006E6B8((uint64_t)self->_managerRef, 0LL, 0, 2);
        goto LABEL_11;
      case 5uLL:
        sub_10006EE28((uint64_t)self->_managerRef, 0LL, 0);
        goto LABEL_11;
      case 6uLL:
        sub_100071AE0((uint64_t)self->_managerRef);
        goto LABEL_11;
      case 8uLL:
        unsigned int v8 = -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 8LL);
        managerRef = self->_managerRef;
        if (v8) {
          sub_10007A5DC((uint64_t)managerRef);
        }
        else {
          sub_10007A6C8((uint64_t)managerRef);
        }
        goto LABEL_11;
      case 0xCuLL:
        sub_100071AE8( (uint64_t)self->_managerRef,  -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 12LL));
LABEL_11:
        id v7 = 0LL;
        break;
      default:
        break;
    }
  }

  else
  {
    id v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if ([a3 response])
  {
    uint64_t v10 = (void (**)(id, NSError *, void))[a3 response];
    v10[2](v10, v7, 0LL);
  }

- (BOOL)__isActivityRegisteredWithType:(int64_t)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = -[CWFXPCManager registeredActivities](self->_XPCManager, "registeredActivities", 0LL);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) type] == (id)a3)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }

        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return (char)v5;
}

- (void)__getUserAutoJoinState:(id)a3
{
  int v4 = sub_1000653FC((uint64_t)self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v6 = v5;
  if (v4) {
    uint64_t v7 = &__kCFBooleanFalse;
  }
  else {
    uint64_t v7 = &__kCFBooleanTrue;
  }
  [v5 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    unsigned int v8 = (void (**)(id, void, id))[a3 response];
    v8[2](v8, 0LL, v6);
  }

- (void)__setUserAutoJoinState:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCUserAutoJoinStateKey];
  if (v8)
  {
    sub_10006570C( (uint64_t)self->_managerRef,  (uint64_t)[v8 BOOLValue],  0,  (uint64_t)objc_msgSend(a4, "processName"));
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if ([a3 response])
  {
    __int128 v10 = (void (**)(id, NSError *, void))[a3 response];
    v10[2](v10, v9, 0LL);
  }

- (void)__performAutoJoin:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCAutoJoinParamsKey];
  if (v6 && (v7 = v6, (id v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    uint64_t v9 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
    if (v9)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100122814;
      v14[3] = &unk_1001E2AC8;
      v14[4] = a3;
      sub_1000F6B50(v9, v7, (uint64_t)v14);
      return;
    }

    uint64_t v10 = 6LL;
  }

  else
  {
    uint64_t v10 = 22LL;
  }

  __int128 v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v10,  0LL);
  if (v11)
  {
    __int128 v12 = v11;
    if ([a3 response])
    {
      __int128 v13 = (void (**)(id, NSError *, void))[a3 response];
      v13[2](v13, v12, 0LL);
    }
  }

- (void)__getAutoHotspotMode:(id)a3
{
  unsigned int v4 = sub_1000824A4((uint64_t)self->_managerRef);
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_1000BD590(v4)),  CWFXPCResultKey);
  if ([a3 response])
  {
    id v6 = (void (**)(id, void, id))[a3 response];
    v6[2](v6, 0LL, v5);
  }

- (void)__setAutoHotspotMode:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCAutoHotspotModeKey];
  if (v6)
  {
    managerRef = self->_managerRef;
    int v8 = sub_1000BD5A0((uint64_t)[v6 integerValue]);
    sub_1000823EC(managerRef, v8, 0);
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if ([a3 response])
  {
    uint64_t v10 = (void (**)(id, NSError *, void))[a3 response];
    v10[2](v10, v9, 0LL);
  }

- (void)__getUserSettings:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___CWFUserSettings);
  unsigned int v6 = sub_1000824A4((uint64_t)self->_managerRef);
  [v5 setAutoHotspotMode:sub_1000BD590(v6)];
  unsigned int v7 = sub_10006DB1C((uint64_t)self->_managerRef);
  [v5 setAskToJoinMode:sub_1000BD5D4(v7)];
  int v8 = sub_10006DCC8((uint64_t)self->_managerRef);
  [v5 setCompatibilityMode:sub_1000BD5B8(v8)];
  objc_msgSend(v5, "setOSSpecificAttributes:", -[WiFiXPCManager __OSSpecificAttributes](self, "__OSSpecificAttributes"));
  id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v9 setObject:v5 forKeyedSubscript:CWFXPCResultKey];

  if ([a3 response])
  {
    uint64_t v10 = (void (**)(id, void, id))[a3 response];
    v10[2](v10, 0LL, v9);
  }

- (void)__setUserSettings:(id)a3
{
  id v3 = a3;
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCUserSettingsKey];
  if (v6)
  {
    unsigned int v7 = v6;
    id v56 = v3;
    id v8 = [v3 info];
    id v9 = [v8 objectForKeyedSubscript:CWFXPCUserSettingsPropertiesKey];
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v62 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          id v15 = [v14 integerValue];
          switch((unint64_t)v15)
          {
            case 1uLL:
              uint64_t v16 = sub_1000BD5A0((uint64_t)[v7 askToJoinMode]);
              unsigned int v17 = v16;
              uint64_t v18 = CWFGetOSLog(v16);
              if (v18) {
                uint64_t v19 = (os_log_s *)CWFGetOSLog(v18);
              }
              else {
                uint64_t v19 = (os_log_s *)&_os_log_default;
              }
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                int v65 = 67109120;
                LODWORD(v66) = v17;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "[corewifi] Setting user setting for ask to join to %d",  &v65);
              }

              sub_10006D9F4((uint64_t)self->_managerRef, v17, 0);
              break;
            case 2uLL:
              uint64_t v20 = sub_1000BD5A0((uint64_t)[v7 autoHotspotMode]);
              int v21 = v20;
              uint64_t v22 = CWFGetOSLog(v20);
              if (v22) {
                id v23 = (os_log_s *)CWFGetOSLog(v22);
              }
              else {
                id v23 = (os_log_s *)&_os_log_default;
              }
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                int v65 = 67109120;
                LODWORD(v66) = v21;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  1LL,  "[corewifi] Setting user setting for auto hotspot to %d",  &v65);
              }

              sub_1000823EC(self->_managerRef, v21, 0);
              break;
            case 3uLL:
              uint64_t v24 = CWFGetOSLog(v15);
              if (v24) {
                uint64_t v25 = (os_log_s *)CWFGetOSLog(v24);
              }
              else {
                uint64_t v25 = (os_log_s *)&_os_log_default;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                __int128 v31 = (__CFString *)[v7 syncMode];
                int v65 = 134217984;
                v66 = v31;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  1LL,  "[corewifi] Setting user setting sync mode to %ld",  &v65);
              }

              managerRef = self->_managerRef;
              id v33 = [v7 syncMode];
              nullsub_1(managerRef, v33, v34);
              break;
            case 4uLL:
              BOOL v26 = sub_1000BD5C8((uint64_t)[v7 compatibilityMode]);
              uint64_t v27 = CWFGetOSLog(v26);
              if (v27) {
                __int128 v28 = (os_log_s *)CWFGetOSLog(v27);
              }
              else {
                __int128 v28 = (os_log_s *)&_os_log_default;
              }
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                int v65 = 67109120;
                LODWORD(v66) = v26;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  1LL,  "[corewifi] Setting user setting compatibility mode to %d",  &v65);
              }

              sub_10006DB24((uint64_t)self->_managerRef, v26, 0);
              break;
            default:
              uint64_t v29 = CWFGetOSLog(v15);
              if (v29) {
                __int128 v30 = (os_log_s *)CWFGetOSLog(v29);
              }
              else {
                __int128 v30 = (os_log_s *)&_os_log_default;
              }
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                uint64_t v35 = (__CFString *)[v14 integerValue];
                int v65 = 134217984;
                v66 = v35;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  16LL,  "[corewifi] Unhandled set user settings property (%ld)",  &v65);
              }

              break;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v61 objects:v70 count:16];
      }

      while (v11);
    }

    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v36 = [v7 OSSpecificAttributes];
    id v37 = [v36 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v58;
      do
      {
        __int128 v40 = 0LL;
        do
        {
          if (*(void *)v58 != v39) {
            objc_enumerationMutation(v36);
          }
          __int128 v41 = *(__CFString **)(*((void *)&v57 + 1) + 8LL * (void)v40);
          id v42 = objc_msgSend(objc_msgSend(v7, "OSSpecificAttributes"), "objectForKey:", v41);
          uint64_t v43 = CWFGetOSLog(v42);
          if (v43) {
            id v44 = (os_log_s *)CWFGetOSLog(v43);
          }
          else {
            id v44 = (os_log_s *)&_os_log_default;
          }
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            int v65 = 138412546;
            v66 = v41;
            __int16 v67 = 2112;
            id v68 = v42;
            LODWORD(v55) = 22;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v44,  1LL,  "[corewifi] Setting user setting (os specific) for %@ to %@",  &v65,  v55);
          }

          id v45 = -[__CFString isEqualToString:](v41, "isEqualToString:", @"Custom network settings");
          if ((_DWORD)v45)
          {
            uint64_t v46 = CWFGetOSLog(v45);
            if (v46) {
              __int128 v47 = (os_log_s *)CWFGetOSLog(v46);
            }
            else {
              __int128 v47 = (os_log_s *)&_os_log_default;
            }
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              LOWORD(v65) = 0;
              LODWORD(v55) = 2;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  1LL,  "[corewifi] Setting custom network settings",  &v65,  v55);
            }

            if (v42
              && (uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSDictionary),
                  uint64_t isKindOfClass = objc_opt_isKindOfClass(v42, v48),
                  (isKindOfClass & 1) == 0))
            {
              uint64_t v50 = CWFGetOSLog(isKindOfClass);
              if (v50) {
                __int128 v51 = (os_log_s *)CWFGetOSLog(v50);
              }
              else {
                __int128 v51 = (os_log_s *)&_os_log_default;
              }
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v65) = 0;
                LODWORD(v55) = 2;
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  16LL,  "[corewifi] Custom network settings is neither nil or of type NSDictionary",  &v65,  v55);
              }
            }

            else
            {
              sub_100082AA4((uint64_t)self->_managerRef, (uint64_t)v42);
            }
          }

          else
          {
            sub_100071B18(self->_managerRef, v41, v42);
          }

          __int128 v40 = (char *)v40 + 1;
        }

        while (v38 != v40);
        id v52 = [v36 countByEnumeratingWithState:&v57 objects:v69 count:16];
        id v38 = v52;
      }

      while (v52);
    }

    -[WiFiXPCManager sendUserSettingsDidChangeEvent](self, "sendUserSettingsDidChangeEvent");
    v53 = 0LL;
    id v3 = v56;
  }

  else
  {
    v53 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  if ([v3 response])
  {
    v54 = (void (**)(id, NSError *, void))[v3 response];
    v54[2](v54, v53, 0LL);
  }

- (id)__OSSpecificAttributes
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WAPIEnabled",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"DiagnosticsEnabled",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"SBWiFiDontAskShown",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"kWiFiWhitelistingUUIDKey",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"KeepWiFiPoweredAirplaneModeEnabled",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"KeepWiFiPoweredAirplaneMode",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WiFiMobileAssetIsHealthMonitorDisabled",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"deviceSpecificKeyMacRandomisation",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"RotationKeyMacRandomisation",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WiFiCountryBandSupportKey",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"kWiFiWhitelistingUUIDKey",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"Custom network settings",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"kWiFiShowUnprovisionedHS20Networks",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WiFiSettingsLogging",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WiFiATJPickerLogging",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WiFiATJPickerLogging",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"DisableSoftErrorReporting",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"EnableRangingLogDump",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"UserPreferenceJoinAlertMode",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"EnableRangingLogDump",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"lpasEnable",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"mStageAutoJoin",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"optimizedAutoJoin",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"TrgDiscAskIfAppropriateDisconnect",  v3);
  -[WiFiXPCManager __setOSSpecificAttributeForKey:attributes:]( self,  "__setOSSpecificAttributeForKey:attributes:",  @"WakeMode",  v3);
  return v3;
}

- (void)__setOSSpecificAttributeForKey:(__CFString *)a3 attributes:(id)a4
{
  unsigned int v7 = -[__CFString isEqualToString:](a3, "isEqualToString:", @"Custom network settings");
  managerRef = self->_managerRef;
  if (v7)
  {
    CFDictionaryRef v9 = sub_100082A9C(managerRef);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      [a4 setObject:v9 forKey:a3];
      CFRelease(v10);
    }
  }

  else
  {
    id v11 = sub_10006F6C0(managerRef, a3);
    if (v11) {
      [a4 setObject:v11 forKey:a3];
    }
  }

+ (id)sharedXPCManager
{
  if (qword_100219E10 != -1) {
    dispatch_once(&qword_100219E10, &stru_1001E5968);
  }
  return (id)qword_100219E08;
}

- (WiFiXPCManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___WiFiXPCManager;
  v2 = -[WiFiXPCManager init](&v14, "init");
  if (!v2) {
    goto LABEL_12;
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  v2->_wifiManagerQueue = v3;
  if (!v3) {
    goto LABEL_12;
  }
  -[NSOperationQueue setMaxConcurrentOperationCount:](v3, "setMaxConcurrentOperationCount:", -1LL);
  -[NSOperationQueue setQualityOfService:](v2->_wifiManagerQueue, "setQualityOfService:", -1LL);
  unsigned int v4 = -[CWFXPCManager initWithServiceTypes:]( objc_alloc(&OBJC_CLASS___CWFXPCManager),  "initWithServiceTypes:",  &off_1002058B8);
  v2->_XPCManager = v4;
  if (!v4) {
    goto LABEL_12;
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v2->_peerAssistedDiscoveryNetworkMap = v5;
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v2->_wifiAssistOverrideReasonsMap = v6;
  if (!v6) {
    goto LABEL_12;
  }
  unsigned int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(0LL, v7);
  v2->_mutexQueue = (OS_dispatch_queue *)v8;
  if (!v8) {
    goto LABEL_12;
  }
  CFDictionaryRef v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifid.current-network", v9);
  v2->_currentNetworkQueue = (OS_dispatch_queue *)v10;
  if (v10
    && (id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary), (v2->_currentNetworkMap = v11) != 0LL)
    && (uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary), (v2->_currentKnownNetworkMap = v12) != 0LL))
  {
    -[CWFXPCManager setSupportedRequestTypes:]( v2->_XPCManager,  "setSupportedRequestTypes:",  +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  -[WiFiXPCManager __supportedRequestTypes](v2, "__supportedRequestTypes")));
    -[CWFXPCManager setDelegate:](v2->_XPCManager, "setDelegate:", v2);
  }

  else
  {
LABEL_12:

    return 0LL;
  }

  return v2;
}

- (void)dealloc
{
  self->_wifiManagerQueue = 0LL;
  -[CWFXPCManager setDelegate:](self->_XPCManager, "setDelegate:", 0LL);
  -[CWFXPCManager invalidate](self->_XPCManager, "invalidate");

  self->_XPCManager = 0LL;
  self->_peerAssistedDiscoveryNetworkMap = 0LL;

  self->_wifiAssistOverrideReasonsMap = 0LL;
  self->_currentHotspotNetwork = 0LL;

  self->_currentNetworkMap = 0LL;
  self->_currentKnownNetworkMap = 0LL;
  mutexQueue = (dispatch_object_s *)self->_mutexQueue;
  if (mutexQueue) {
    dispatch_release(mutexQueue);
  }
  currentNetworkQueue = (dispatch_object_s *)self->_currentNetworkQueue;
  if (currentNetworkQueue) {
    dispatch_release(currentNetworkQueue);
  }
  cachedCurrentSessionBasedNetworkRef = self->_cachedCurrentSessionBasedNetworkRef;
  if (cachedCurrentSessionBasedNetworkRef)
  {
    CFRelease(cachedCurrentSessionBasedNetworkRef);
    self->_cachedCurrentSessionBasedNetworkRef = 0LL;
  }

  managerRef = self->_managerRef;
  if (managerRef)
  {
    CFRelease(managerRef);
    self->_managerRef = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiXPCManager;
  -[WiFiXPCManager dealloc](&v7, "dealloc");
}

- (void)setWiFiManager:(__WiFiManager *)a3
{
  managerRef = self->_managerRef;
  if (managerRef != a3)
  {
    if (managerRef) {
      CFRelease(managerRef);
    }
    if (a3) {
      id v6 = (__WiFiManager *)CFRetain(a3);
    }
    else {
      id v6 = 0LL;
    }
    self->_managerRef = v6;
  }

- (__WiFiManager)getWiFiManager
{
  return self->_managerRef;
}

- (void)activate
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = -[WiFiXPCManager __supportedRequestTypes](self, "__supportedRequestTypes", 0LL);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      objc_super v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CWFXPCManager setTargetQueue:requestType:interfaceName:]( self->_XPCManager,  "setTargetQueue:requestType:interfaceName:",  self->_wifiManagerQueue,  [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) integerValue],  0);
        objc_super v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[CWFXPCManager resume](self->_XPCManager, "resume");
}

- (void)invalidate
{
}

- (BOOL)isQuiesceWiFiActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 5LL);
}

- (BOOL)isBackgroundActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 1LL);
}

- (BOOL)isForegroundActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 2LL);
}

- (BOOL)isWiFiBoundActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 3LL);
}

- (BOOL)isWoWActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 4LL);
}

- (BOOL)isDisableAutoJoinActivityRegistered
{
  return -[WiFiXPCManager __isActivityRegisteredWithType:](self, "__isActivityRegisteredWithType:", 6LL);
}

- (void)sendWoWDidChangeEventWithInterfaceName:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v6 setType:9];
  [v6 setInterfaceName:a3];
  objc_msgSend(v6, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v6, 0LL);
  objc_autoreleasePoolPop(v5);
}

- (void)sendInternetRelayLinkChangedEvent:(BOOL)a3 rssi:(int64_t)a4 interfaceName:(id)a5
{
  BOOL v7 = a3;
  __int128 v9 = objc_autoreleasePoolPush();
  id v10 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v10 setType:6];
  [v10 setInterfaceName:a5];
  objc_msgSend(v10, "setTimestamp:", +[NSDate date](NSDate, "date"));
  id v11 = objc_alloc_init(&OBJC_CLASS___CWFLinkChangeStatus);
  [v11 setLinkDown:v7];
  [v11 setRSSI:a4];
  uint64_t v18 = CWFEventLinkChangeStatusKey;
  id v19 = v11;
  uint64_t v12 = CWFGetOSLog( objc_msgSend( v10,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1)));
  if (v12) {
    __int128 v13 = (os_log_s *)CWFGetOSLog(v12);
  }
  else {
    __int128 v13 = (os_log_s *)&_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109376;
    v15[1] = v7;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    LODWORD(v14) = 18;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[corewifi] sendInternetRelayLinkChangedEvent send event to CoreWiFi isLinkDown:%d rssi:%ld dBm \n",  v15,  v14);
  }

  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v10, 0LL);
  objc_autoreleasePoolPop(v9);
}

- (void)replayLinkUpEventWithInterfaceName:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v6 setType:6];
  [v6 setInterfaceName:a3];
  objc_msgSend(v6, "setTimestamp:", +[NSDate date](NSDate, "date"));
  id v7 = objc_alloc_init(&OBJC_CLASS___CWFLinkChangeStatus);
  [v7 setLinkDown:0];
  uint64_t v12 = CWFEventLinkChangeStatusKey;
  id v13 = v7;
  uint64_t v8 = CWFGetOSLog( objc_msgSend( v6,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1)));
  if (v8) {
    __int128 v9 = (os_log_s *)CWFGetOSLog(v8);
  }
  else {
    __int128 v9 = (os_log_s *)&_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[WiFiXPCManager replayLinkUpEventWithInterfaceName:]";
    _os_log_send_and_compose_impl(1LL, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 0LL, "[corewifi] %s", (const char *)&v10);
  }

  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v6, 0LL);
  objc_autoreleasePoolPop(v5);
}

- (void)autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4
{
  id v7 = objc_autoreleasePoolPush();
  id v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v8 setInternalType:1];
  [v8 setInterfaceName:a4];
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  uint64_t v9 = CWFInternalEventAutoJoinTriggerKey;
  int v10 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  objc_msgSend( v8,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0LL);
  objc_autoreleasePoolPop(v7);
}

- (void)autoJoinUpdatedWithState:(int64_t)a3 interfaceName:(id)a4
{
  id v7 = objc_autoreleasePoolPush();
  id v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v8 setInternalType:1];
  [v8 setInterfaceName:a4];
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  uint64_t v9 = CWFInternalEventAutoJoinStateKey;
  int v10 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  objc_msgSend( v8,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0LL);
  objc_autoreleasePoolPop(v7);
}

- (void)autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4
{
  BOOL v5 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v8 setInternalType:1];
  [v8 setInterfaceName:a4];
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  int v10 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5);
  [v9 setObject:v10 forKeyedSubscript:CWFInternalEventAutoJoinResultKey];
  [v8 setInfo:v9];
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0LL);
  objc_autoreleasePoolPop(v7);
}

- (void)willAssociateWithNetwork:(__WiFiNetwork *)a3 isAutoJoin:(BOOL)a4 interfaceName:(id)a5
{
  BOOL v6 = a4;
  id v9 = objc_autoreleasePoolPush();
  id v10 = sub_1000A335C((uint64_t)a3);
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
    [v12 setInternalType:2];
    [v12 setInterfaceName:a5];
    objc_msgSend(v12, "setTimestamp:", +[NSDate date](NSDate, "date"));
    v13[0] = CWFInternalEventScanResultKey;
    v13[1] = CWFInternalEventIsAutoJoinKey;
    v14[0] = v11;
    v14[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6);
    objc_msgSend( v12,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2));
    -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v12, 0LL);
  }

  objc_autoreleasePoolPop(v9);
}

- (void)associationDoneWithNetwork:(__WiFiNetwork *)a3 error:(int)a4 interfaceName:(id)a5
{
  id v9 = objc_autoreleasePoolPush();
  id v10 = sub_1000A335C((uint64_t)a3);
  if (v10)
  {
    id v11 = v10;
    id v12 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    id v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  a4,  0LL);
    [v12 setObject:v13 forKeyedSubscript:CWFInternalEventErrorKey];
    [v12 setObject:v11 forKeyedSubscript:CWFInternalEventScanResultKey];
    id v14 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
    [v14 setInternalType:3];
    [v14 setInterfaceName:a5];
    objc_msgSend(v14, "setTimestamp:", +[NSDate date](NSDate, "date"));
    [v14 setInfo:v12];
    -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v14, 0LL);
  }

  objc_autoreleasePoolPop(v9);
}

- (void)sendUserAutoJoinStateDidChangeEvent
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v4 setType:25];
  objc_msgSend(v4, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v4, 0LL);
  objc_autoreleasePoolPop(v3);
}

- (void)sendAutoHotspotModeDidChangeEvent
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v4 setType:26];
  objc_msgSend(v4, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v4, 0LL);
  objc_autoreleasePoolPop(v3);
}

- (void)sendXPCEvent:(id)a3
{
  BOOL v5 = objc_autoreleasePoolPush();
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", a3, 0LL);
  objc_autoreleasePoolPop(v5);
}

- (void)sendKnownNetworkDidChangeEventForProfile:(id)a3 eventType:(int64_t)a4
{
  id v7 = objc_autoreleasePoolPush();
  id v8 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v8 setType:30];
  objc_msgSend(v8, "setTimestamp:", +[NSDate date](NSDate, "date"));
  id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v10 = v9;
  if (a3) {
    [v9 setObject:a3 forKey:CWFInternalEventKnownNetworkProfileKey];
  }
  id v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4);
  [v10 setObject:v11 forKey:CWFInternalEventKnownNetworkEventTypeKey];
  [v8 setInfo:v10];
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v8, 0LL);
  objc_autoreleasePoolPop(v7);
}

- (void)sendWiFiAssistEventWithInterfaceName:(id)a3 linkQualityMetricInfo:(id)a4
{
  id v7 = objc_autoreleasePoolPush();
  uint64_t v15 = 0LL;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v8 = [a4 objectForKeyedSubscript:@"WIFI_ASSIST_OVERRIDE_REASON"];
  if (v8)
  {
    id v9 = +[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet");
    [v9 addObject:v8];
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = [a4 objectForKeyedSubscript:@"WIFI_ASSIST_OVERRIDE_REASONS"];
  if ([v10 count])
  {
    if (!v9) {
      id v9 = +[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet");
    }
    [v9 addObjectsFromArray:v10];
  }

  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124628;
  block[3] = &unk_1001E5990;
  block[4] = self;
  block[5] = a3;
  block[6] = v9;
  void block[7] = &v15;
  dispatch_sync(mutexQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
    [v12 setType:34];
    [v12 setInterfaceName:a3];
    objc_msgSend(v12, "setTimestamp:", +[NSDate date](NSDate, "date"));
    if (v9)
    {
      uint64_t v19 = CWFEventWiFiAssistOverrideReasonsKey;
      id v20 = [v9 array];
      id v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL);
    }

    else
    {
      id v13 = 0LL;
    }

    [v12 setInfo:v13];
    -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v12, 0LL);
  }

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v7);
}

- (id)__sanitizeSensingParams:(id)a3
{
  if (((unint64_t)[a3 numberOfReports] & 0x8000000000000000) != 0
    || (unint64_t)objc_msgSend(objc_msgSend(a3, "matchMACAddresses"), "count") > 0x20
    || ((unint64_t)[a3 timeout] & 0x8000000000000000) != 0
    || (uint64_t)[a3 timeout] > 50000
    || (uint64_t)[a3 scheduleOnceAfter] < -2
    || (uint64_t)[a3 scheduleOnceAfter] > 15
    || (uint64_t)[a3 scheduleDailyAt] < -2
    || (uint64_t)[a3 scheduleDailyAt] >= 86401)
  {
    return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
  }

  else
  {
    return 0LL;
  }

- (id)__getSensingParams:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "numberOfReports")),  @"SENSING_PARAMS_NUMBER_OF_REPORTS");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "matchFrameType")),  @"SENSING_PARAMS_MATCH_FRAME_TYPE");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "matchMACAddresses"),  @"SENSING_PARAMS_MATCH_MAC_ADDRESS");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "timeout")),  @"SENSING_PARAMS_TIMEOUT");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "submitMetric")),  @"SENSING_PARAMS_SUBMIT_METRIC");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "scheduleDailyAt")),  @"SENSING_PARAMS_SCHEDULE_DAILY_AT");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "activityLabels"),  @"SENSING_PARAMS_ACTIVITY_LABELS");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "placeLabels"),  @"SENSING_PARAMS_PLACE_LABELS");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "comment"), @"SENSING_PARAMS_COMMENT");
  if ([a3 scheduleDailyAt] != (id)-2)
  {
    BOOL v5 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    if ([a3 scheduleDailyAt] == (id)-1) {
      -[NSUserDefaults removeObjectForKey:](v5, "removeObjectForKey:", @"WIFI_SENSING");
    }
    else {
      -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", v4, @"WIFI_SENSING");
    }
  }

  id v6 = [a3 scheduleOnceAfter];
  if ([a3 scheduleOnceAfter] == (id)-2 && objc_msgSend(a3, "scheduleDailyAt") == (id)-2) {
    id v6 = 0LL;
  }
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6),  @"SENSING_PARAMS_SCHEDULE_ONCE_AFTER");
  return v4;
}

- (void)__performSensing:(id)a3
{
  id v4 = a3;
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCSensingParamsKey];
  if (!v6) {
    goto LABEL_10;
  }
  id v7 = v6;
  id v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v8) {
    goto LABEL_10;
  }
  id v9 = v8;
  id v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
  if (!v10)
  {
    NSErrorDomain v16 = NSPOSIXErrorDomain;
    uint64_t v17 = 6LL;
    goto LABEL_15;
  }

  uint64_t v11 = (uint64_t)v10;
  id v12 = -[WiFiXPCManager __sanitizeSensingParams:](self, "__sanitizeSensingParams:", v7);
  if (!v12)
  {
    id v13 = -[WiFiXPCManager __getSensingParams:](self, "__getSensingParams:", v7);
    if (v13)
    {
      id v14 = v13;
      if ((MGGetBoolAnswer(@"InternalBuild") & 1) != 0
        && (_os_feature_enabled_impl("WiFiManager", "Sensing") & 1) != 0)
      {
        int v15 = sub_1000F7DA4( v11,  v9,  v14,  (void (*)(uint64_t, const void *, void, uint64_t, uint64_t))sub_100124B84,  (uint64_t)a3);
        if (!v15) {
          return;
        }
        NSErrorDomain v16 = (NSErrorDomain)CWFManagerErrorDomain;
        uint64_t v17 = v15;
      }

      else
      {
        NSErrorDomain v16 = (NSErrorDomain)CWFManagerErrorDomain;
        uint64_t v17 = -3907LL;
      }

- (void)__performNDD:(id)a3 XPCConnection:(id)a4
{
  id v7 = [a3 info];
  id v8 = [v7 objectForKeyedSubscript:CWFXPCNDDParamsKey];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = (uint64_t)v8;
  id v10 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (!v10) {
    goto LABEL_10;
  }
  if (!self->_managerRef)
  {
    NSErrorDomain v16 = NSPOSIXErrorDomain;
    uint64_t v17 = 6LL;
    goto LABEL_13;
  }

  uint64_t v11 = (uint64_t)v10;
  id v12 = [a4 processName];
  if (v12)
  {
    int v13 = sub_10006B298((uint64_t)self->_managerRef, (uint64_t)[a3 type], v9, (uint64_t)v12, v11);
    if (!v13)
    {
      id v14 = 0LL;
      goto LABEL_7;
    }

    NSErrorDomain v16 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v17 = v13;
  }

  else
  {
LABEL_10:
    NSErrorDomain v16 = NSPOSIXErrorDomain;
    uint64_t v17 = 22LL;
  }

- (void)sendUserSettingsDidChangeEvent
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___CWFXPCEvent);
  [v4 setType:27];
  objc_msgSend(v4, "setTimestamp:", +[NSDate date](NSDate, "date"));
  -[CWFXPCManager sendXPCEvent:reply:](self->_XPCManager, "sendXPCEvent:reply:", v4, 0LL);
  objc_autoreleasePoolPop(v3);
}

- (void)__getAutoJoinMetric:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      id v7 = sub_1000F6FF0((uint64_t)v6);
      goto LABEL_4;
    }

    uint64_t v14 = 6LL;
  }

  else
  {
    uint64_t v14 = 22LL;
  }

  int v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v14,  0LL);
  if (!v15)
  {
    id v7 = 0LL;
LABEL_4:
    id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
    if ([a3 response])
    {
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      uint64_t v11 = (void (*)(void *, NSError *, id))v9[2];
      id v12 = v9;
      int v13 = 0LL;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }

    return;
  }

  NSErrorDomain v16 = v15;
  if ([a3 response])
  {
    id v12 = [a3 response];
    uint64_t v11 = (void (*)(void *, NSError *, id))v12[2];
    int v13 = v16;
    id v10 = 0LL;
    goto LABEL_6;
  }

- (void)__getAutoJoinStatistics:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      id v7 = sub_1000F7008((uint64_t)v6);
      goto LABEL_4;
    }

    uint64_t v14 = 6LL;
  }

  else
  {
    uint64_t v14 = 22LL;
  }

  int v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v14,  0LL);
  if (!v15)
  {
    id v7 = 0LL;
LABEL_4:
    id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
    if ([a3 response])
    {
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      uint64_t v11 = (void (*)(void *, NSError *, id))v9[2];
      id v12 = v9;
      int v13 = 0LL;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }

    return;
  }

  NSErrorDomain v16 = v15;
  if ([a3 response])
  {
    id v12 = [a3 response];
    uint64_t v11 = (void (*)(void *, NSError *, id))v12[2];
    int v13 = v16;
    id v10 = 0LL;
    goto LABEL_6;
  }

- (void)__resetAutoJoinStatistics:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      sub_1000F7020((uint64_t)v6);
      id v7 = 0LL;
      goto LABEL_4;
    }

    NSErrorDomain v9 = NSPOSIXErrorDomain;
    uint64_t v10 = 6LL;
  }

  else
  {
    NSErrorDomain v9 = NSPOSIXErrorDomain;
    uint64_t v10 = 22LL;
  }

  id v7 = +[NSError errorWithDomain:code:userInfo:](&OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", v9, v10, 0LL);
LABEL_4:
  if ([a3 response])
  {
    id v8 = (void (**)(id, NSError *, void))[a3 response];
    v8[2](v8, v7, 0LL);
  }

- (void)__setBlockedBands:(id)a3
{
  id v5 = [a3 info];
  id v6 = (const __CFArray *)[v5 objectForKeyedSubscript:CWFXPCBlockedBandsKey];
  if (v6)
  {
    int v7 = sub_100084718((uint64_t)self->_managerRef, v6);
    if (!v7)
    {
      id v8 = 0LL;
      goto LABEL_4;
    }

    NSErrorDomain v10 = (NSErrorDomain)CWFManagerErrorDomain;
    uint64_t v11 = v7;
  }

  else
  {
    NSErrorDomain v10 = NSPOSIXErrorDomain;
    uint64_t v11 = 22LL;
  }

  id v8 = +[NSError errorWithDomain:code:userInfo:](&OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", v10, v11, 0LL);
LABEL_4:
  if ([a3 response])
  {
    NSErrorDomain v9 = (void (**)(id, NSError *, void))[a3 response];
    v9[2](v9, v8, 0LL);
  }

- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = [a3 info];
  id v9 = [v8 objectForKeyedSubscript:CWFXPCHostAPConfigurationKey];
  if (!v9
    || (v10 = v9, (uint64_t v11 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) == 0))
  {
    NSErrorDomain v23 = NSPOSIXErrorDomain;
    uint64_t v24 = 22LL;
    goto LABEL_22;
  }

  id v12 = v11;
  int v13 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v11);
  if (!v13)
  {
    NSErrorDomain v23 = NSPOSIXErrorDomain;
    uint64_t v24 = 6LL;
    goto LABEL_22;
  }

  uint64_t v14 = (uint64_t)v13;
  id v15 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (![v10 channel]) {
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AP_MODE_MOVETOIOS_MIGRATION"];
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v10, "SSID"), @"AP_MODE_SSID_BYTES");
  objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(objc_msgSend(v10, "channel"), "channel")),  @"CHANNEL");
  objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(objc_msgSend(v10, "channel"), "flags")),  @"CHANNEL_FLAGS");
  objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "PHYMode")),  @"AP_MODE_PHY_MODE");
  objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v10, "forceBeaconInterval100ms")),  @"AP_MODE_FORCE_BI_100");
  objc_msgSend( v15,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "forceHiddenMode")),  @"SOFTAP_SOFTAP_HIDDEN_NETWORK");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v10, "IEList"), @"AP_MODE_IE_LIST");
  uint64_t v16 = (uint64_t)[v10 securityType];
  if (v16 > 79)
  {
    if (v16 == 80)
    {
      [v15 setObject:&off_1002052C8 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      uint64_t v17 = &off_1002053B8;
      goto LABEL_15;
    }

    if (v16 == 512)
    {
      [v15 setObject:&off_1002052C8 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      [v15 setObject:&off_1002052E0 forKeyedSubscript:@"AP_MODE_AUTH_UPPER"];
      char v18 = @"AP_MODE_CYPHER_TYPE";
      id v19 = v15;
      id v20 = &off_1002052E0;
LABEL_16:
      [v19 setObject:v20 forKeyedSubscript:v18];
    }
  }

  else
  {
    if (v16 == 16)
    {
      [v15 setObject:&off_1002052C8 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      uint64_t v17 = &off_100205388;
      goto LABEL_15;
    }

    if (v16 == 64)
    {
      [v15 setObject:&off_1002052C8 forKeyedSubscript:@"AP_MODE_AUTH_LOWER"];
      uint64_t v17 = &off_1002053D0;
LABEL_15:
      [v15 setObject:v17 forKeyedSubscript:@"AP_MODE_AUTH_UPPER"];
      [v15 setObject:&off_1002053A0 forKeyedSubscript:@"AP_MODE_CYPHER_TYPE"];
      id v20 = (_UNKNOWN **)[v10 password];
      char v18 = @"AP_MODE_KEY";
      id v19 = v15;
      goto LABEL_16;
    }
  }

  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472LL;
  aBlock[2] = sub_1001255F4;
  aBlock[3] = &unk_1001E59B8;
  aBlock[4] = a3;
  int v21 = _Block_copy(aBlock);
  int v22 = sub_1000E556C(v14, v12, 2, v15, (uint64_t)sub_10011DC60, (uint64_t)v21, [a4 processName]);
  if (!v22) {
    return;
  }
  NSErrorDomain v23 = (NSErrorDomain)CWFManagerErrorDomain;
  uint64_t v24 = v22;
LABEL_22:
  uint64_t v25 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  v24,  0LL);
  if (v25)
  {
    if ([a3 response])
    {
      BOOL v26 = (void (**)(id, NSError *, void))[a3 response];
      v26[2](v26, v25, 0LL);
    }
  }

- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v7)
  {
    id v8 = v7;
    id v9 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v7);
    if (v9)
    {
      uint64_t v10 = (uint64_t)v9;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472LL;
      aBlock[2] = sub_1001257BC;
      aBlock[3] = &unk_1001E59E0;
      aBlock[4] = a3;
      uint64_t v11 = _Block_copy(aBlock);
      int v12 = sub_1000E5E14(v10, v8, 2, (uint64_t)sub_10011DF6C, (uint64_t)v11);
      if (!v12) {
        return;
      }
      NSErrorDomain v13 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v14 = v12;
    }

    else
    {
      NSErrorDomain v13 = NSPOSIXErrorDomain;
      uint64_t v14 = 6LL;
    }
  }

  else
  {
    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = 22LL;
  }

  id v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v14,  0LL);
  if (v15)
  {
    if ([a3 response])
    {
      uint64_t v16 = (void (**)(id, NSError *, void))[a3 response];
      v16[2](v16, v15, 0LL);
    }
  }

- (void)__getWiFiAssistOverrideReasons:(id)a3
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  int v12 = sub_10011D470;
  NSErrorDomain v13 = sub_10011D480;
  uint64_t v14 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100125950;
  block[3] = &unk_1001E5A08;
  block[5] = a3;
  block[6] = &v9;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v6 = (id)v10[5];
  [v5 setObject:v6 forKeyedSubscript:CWFXPCResultKey];
  if ([a3 response])
  {
    id v7 = (void (**)(id, void, id))[a3 response];
    v7[2](v7, 0LL, v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)__getBackgroundScanConfiguration:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      id v7 = sub_1000FB764((uint64_t)v6);
      goto LABEL_4;
    }

    uint64_t v14 = 6LL;
  }

  else
  {
    uint64_t v14 = 22LL;
  }

  id v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v14,  0LL);
  if (!v15)
  {
    id v7 = 0LL;
LABEL_4:
    id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
    if ([a3 response])
    {
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      uint64_t v11 = (void (*)(void *, NSError *, id))v9[2];
      int v12 = v9;
      NSErrorDomain v13 = 0LL;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }

    return;
  }

  uint64_t v16 = v15;
  if ([a3 response])
  {
    int v12 = [a3 response];
    uint64_t v11 = (void (*)(void *, NSError *, id))v12[2];
    NSErrorDomain v13 = v16;
    id v10 = 0LL;
    goto LABEL_6;
  }

- (void)__setBackgroundScanConfiguration:(id)a3
{
  id v5 = [a3 info];
  id v6 = [v5 objectForKeyedSubscript:CWFXPCBackgroundScanConfigurationKey];
  if (v6 && (v7 = v6, (id v8 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName")) != 0))
  {
    uint64_t v9 = v8;
    id v10 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v8);
    if (v10)
    {
      int v11 = sub_1000FB120((uint64_t *)v10, v9, v7);
      if (!v11)
      {
        int v12 = 0LL;
        goto LABEL_6;
      }

      NSErrorDomain v14 = (NSErrorDomain)CWFManagerErrorDomain;
      uint64_t v15 = v11;
    }

    else
    {
      NSErrorDomain v14 = NSPOSIXErrorDomain;
      uint64_t v15 = 6LL;
    }
  }

  else
  {
    NSErrorDomain v14 = NSPOSIXErrorDomain;
    uint64_t v15 = 22LL;
  }

  int v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  v15,  0LL);
LABEL_6:
  if ([a3 response])
  {
    NSErrorDomain v13 = (void (**)(id, NSError *, void))[a3 response];
    v13[2](v13, v12, 0LL);
  }

- (void)__getAutoJoinDenyList:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      id v7 = sub_1000FBBB0((uint64_t)v6);
      goto LABEL_4;
    }

    uint64_t v14 = 6LL;
  }

  else
  {
    uint64_t v14 = 22LL;
  }

  uint64_t v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v14,  0LL);
  if (!v15)
  {
    id v7 = 0LL;
LABEL_4:
    id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v8 setObject:v7 forKeyedSubscript:CWFXPCResultKey];
    if ([a3 response])
    {
      uint64_t v9 = [a3 response];
      id v10 = [v8 copy];
      int v11 = (void (*)(void *, NSError *, id))v9[2];
      int v12 = v9;
      NSErrorDomain v13 = 0LL;
LABEL_6:
      v11(v12, v13, v10);
      return;
    }

    return;
  }

  uint64_t v16 = v15;
  if ([a3 response])
  {
    int v12 = [a3 response];
    int v11 = (void (*)(void *, NSError *, id))v12[2];
    NSErrorDomain v13 = v16;
    id v10 = 0LL;
    goto LABEL_6;
  }

- (void)__setAutoJoinDenyList:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      id v8 = [a3 info];
      unint64_t v9 = (int)objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CWFAutoJoinDenyListAddReasonKey), "intValue");
      id v10 = [a3 info];
      int v11 = sub_1000A1DEC([v10 objectForKeyedSubscript:CWFXPCNetworkProfileKey], 0);
      if (!sub_1000FBD60(v7, v9, (uint64_t)v11))
      {
        int v12 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s - WiFiDeviceManagerSetAutoJoinDenylistedNetwork %lu failed",  "-[WiFiXPCManager __setAutoJoinDenyList:]",  v9);
        }
        objc_autoreleasePoolPop(v12);
      }

      NSErrorDomain v13 = sub_1000FBBB0(v7);
LABEL_8:
      id v14 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      [v14 setObject:v13 forKeyedSubscript:CWFXPCResultKey];
      if ([a3 response])
      {
        uint64_t v15 = [a3 response];
        id v16 = [v14 copy];
        uint64_t v17 = (void (*)(void *, NSError *, id))v15[2];
        char v18 = v15;
        id v19 = 0LL;
LABEL_10:
        v17(v18, v19, v16);
        return;
      }

      return;
    }

    uint64_t v20 = 6LL;
  }

  else
  {
    uint64_t v20 = 22LL;
  }

  int v21 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  0LL);
  if (!v21)
  {
    NSErrorDomain v13 = 0LL;
    goto LABEL_8;
  }

  int v22 = v21;
  if ([a3 response])
  {
    char v18 = [a3 response];
    uint64_t v17 = (void (*)(void *, NSError *, id))v18[2];
    id v19 = v22;
    id v16 = 0LL;
    goto LABEL_10;
  }

- (void)__clearAutoJoinDenyList:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "requestParameters"), "interfaceName");
  if (v5)
  {
    id v6 = -[WiFiXPCManager __deviceManagerWithInterfaceName:](self, "__deviceManagerWithInterfaceName:", v5);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      id v8 = [a3 info];
      uint64_t v9 = (int)objc_msgSend( objc_msgSend(v8, "objectForKeyedSubscript:", CWFAutoJoinDenyListRemoveReasonKey),  "intValue");
      id v10 = [a3 info];
      int v11 = sub_1000A1DEC([v10 objectForKeyedSubscript:CWFXPCNetworkProfileKey], 0);
      if ((sub_1000FBD7C(v7, v9, (uint64_t)v11) & 1) == 0)
      {
        int v12 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s - WiFiDeviceManagerClearAutoJoinDenylistedNetwork %lu failed",  "-[WiFiXPCManager __clearAutoJoinDenyList:]",  v9);
        }
        objc_autoreleasePoolPop(v12);
      }

      NSErrorDomain v13 = sub_1000FBBB0(v7);
LABEL_8:
      id v14 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      [v14 setObject:v13 forKeyedSubscript:CWFXPCResultKey];
      if ([a3 response])
      {
        uint64_t v15 = [a3 response];
        id v16 = [v14 copy];
        uint64_t v17 = (void (*)(void *, NSError *, id))v15[2];
        char v18 = v15;
        id v19 = 0LL;
LABEL_10:
        v17(v18, v19, v16);
        return;
      }

      return;
    }

    uint64_t v20 = 6LL;
  }

  else
  {
    uint64_t v20 = 22LL;
  }

  int v21 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  0LL);
  if (!v21)
  {
    NSErrorDomain v13 = 0LL;
    goto LABEL_8;
  }

  int v22 = v21;
  if ([a3 response])
  {
    char v18 = [a3 response];
    uint64_t v17 = (void (*)(void *, NSError *, id))v18[2];
    id v19 = v22;
    id v16 = 0LL;
    goto LABEL_10;
  }

- (id)__queueForRequest:(id)a3
{
  id v5 = [a3 info];
  else {
    return self->_currentNetworkQueue;
  }
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  id v8 = objc_autoreleasePoolPush();
  uint64_t v9 = -[WiFiXPCManager __queueForRequest:](self, "__queueForRequest:", a5);
  if (v9)
  {
    id v10 = v9;
    qos_class_t v11 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001261D8;
    block[3] = &unk_1001E5A30;
    block[4] = a5;
    block[5] = self;
    block[6] = a4;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    dispatch_async(v10, v12);
    _Block_release(v12);
  }

  else if ([a5 response])
  {
    NSErrorDomain v13 = (void (**)(id, NSError *, void))[a5 response];
    v13[2]( v13,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  6LL,  0LL),  0LL);
  }

  objc_autoreleasePoolPop(v8);
}

- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4
{
  id v6 = objc_autoreleasePoolPush();
  uint64_t v7 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_managerRef);
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100126744;
    v8[3] = &unk_1001E2778;
    v8[4] = self;
    v8[5] = a4;
    dispatch_async(v7, v8);
  }

  objc_autoreleasePoolPop(v6);
}

@end