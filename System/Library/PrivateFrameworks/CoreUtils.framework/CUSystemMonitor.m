@interface CUSystemMonitor
- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv4Addr;
- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv6Addr;
- ($D91DDCA3822F03E96939068EA8DE741A)bluetoothAddress48;
- ($D91DDCA3822F03E96939068EA8DE741A)rotatingIdentifier48;
- (BOOL)clamshellMode;
- (BOOL)firstUnlocked;
- (BOOL)firstUnlockedSync;
- (BOOL)manateeAvailable;
- (BOOL)meDeviceIsMe;
- (BOOL)meDeviceUseFindMyLocate;
- (BOOL)meDeviceValid;
- (BOOL)powerUnlimited;
- (BOOL)primaryAppleIDIsHSA2;
- (BOOL)screenLocked;
- (BOOL)screenLockedSync;
- (BOOL)screenOn;
- (BOOL)screenSaverActive;
- (CUSystemMonitor)init;
- (NSArray)familyMembers;
- (NSBundle)locationVisitsBundle;
- (NSData)bluetoothAddressData;
- (NSData)rotatingIdentifierData;
- (NSString)consoleUserName;
- (NSString)foregroundAppBundleID;
- (NSString)meDeviceFMFDeviceID;
- (NSString)meDeviceIDSDeviceID;
- (NSString)meDeviceName;
- (NSString)primaryAppleID;
- (NSString)primaryNetworkSignature;
- (NSString)regionISOCountryCode;
- (NSString)regionMobileCountryCode;
- (NSString)regionRoutineCountry;
- (NSString)regionRoutineState;
- (NSString)systemName;
- (OS_dispatch_queue)dispatchQueue;
- (id)bluetoothAddressChangedHandler;
- (id)callChangedHandler;
- (id)clamshellModeChangedHandler;
- (id)consoleUserChangedHandler;
- (id)familyUpdatedHandler;
- (id)firstUnlockHandler;
- (id)foregroundAppChangedHandler;
- (id)invalidationHandler;
- (id)locationVisitsChangedHandler;
- (id)manateeChangedHandler;
- (id)meDeviceChangedHandler;
- (id)motionHandler;
- (id)netFlagsChangedHandler;
- (id)netInterfacesChangedHandler;
- (id)powerUnlimitedChangedHandler;
- (id)primaryAppleIDChangedHandler;
- (id)primaryIPChangedHandler;
- (id)primaryNetworkChangedHandler;
- (id)regionChangedHandler;
- (id)rotatingIdentifierChangedHandler;
- (id)screenLockedChangedHandler;
- (id)screenOnChangedHandler;
- (id)screenSaverChangedHandler;
- (id)screenStateChangedHandler;
- (id)systemLockStateChangedHandler;
- (id)systemNameChangedHandler;
- (id)systemUIChangedHandler;
- (id)wifiStateChangedHandler;
- (int)activeCallCount;
- (int)callCountIncomingConnected;
- (int)callCountIncomingUnconnected;
- (int)callCountOutgoingConnected;
- (int)callCountOutgoingUnconnected;
- (int)connectedCallCount;
- (int)manateeState;
- (int)motionOrientation;
- (int)screenState;
- (int)systemLockState;
- (int)systemLockStateSync;
- (int)wifiState;
- (unsigned)callFlags;
- (unsigned)consoleUserID;
- (unsigned)locationVisitsFlags;
- (unsigned)motionFlags;
- (unsigned)netFlags;
- (unsigned)systemUIFlags;
- (unsigned)wifiFlags;
- (void)activateWithCompletion:(id)a3;
- (void)forceManateeStateRefresh;
- (void)invalidate;
- (void)setBluetoothAddressChangedHandler:(id)a3;
- (void)setCallChangedHandler:(id)a3;
- (void)setClamshellModeChangedHandler:(id)a3;
- (void)setConsoleUserChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFamilyUpdatedHandler:(id)a3;
- (void)setFirstUnlockHandler:(id)a3;
- (void)setForegroundAppChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocationVisitsBundle:(id)a3;
- (void)setLocationVisitsChangedHandler:(id)a3;
- (void)setManateeChangedHandler:(id)a3;
- (void)setMeDeviceChangedHandler:(id)a3;
- (void)setMeDeviceUseFindMyLocate:(BOOL)a3;
- (void)setMotionHandler:(id)a3;
- (void)setNetFlagsChangedHandler:(id)a3;
- (void)setNetInterfacesChangedHandler:(id)a3;
- (void)setPowerUnlimitedChangedHandler:(id)a3;
- (void)setPrimaryAppleIDChangedHandler:(id)a3;
- (void)setPrimaryIPChangedHandler:(id)a3;
- (void)setPrimaryNetworkChangedHandler:(id)a3;
- (void)setRegionChangedHandler:(id)a3;
- (void)setRotatingIdentifierChangedHandler:(id)a3;
- (void)setScreenLockedChangedHandler:(id)a3;
- (void)setScreenOnChangedHandler:(id)a3;
- (void)setScreenSaverChangedHandler:(id)a3;
- (void)setScreenStateChangedHandler:(id)a3;
- (void)setSystemLockStateChangedHandler:(id)a3;
- (void)setSystemNameChangedHandler:(id)a3;
- (void)setSystemUIChangedHandler:(id)a3;
- (void)setWifiStateChangedHandler:(id)a3;
@end

@implementation CUSystemMonitor

- (CUSystemMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUSystemMonitor;
  v2 = -[CUSystemMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  self->_invalidateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CUSystemMonitor_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (int)activeCallCount
{
  return 0;
}

- ($D91DDCA3822F03E96939068EA8DE741A)bluetoothAddress48
{
  if (gCUSystemMonitor) {
    unint64_t v2 = *(unsigned int *)(gCUSystemMonitor + 24) | ((unint64_t)*(unsigned __int16 *)(gCUSystemMonitor + 28) << 32);
  }
  else {
    unint64_t v2 = 0LL;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return ($D91DDCA3822F03E96939068EA8DE741A)v2;
}

- (NSData)bluetoothAddressData
{
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 32);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSData *)v3;
}

- (int)callCountIncomingConnected
{
  return 0;
}

- (int)callCountIncomingUnconnected
{
  return 0;
}

- (int)callCountOutgoingConnected
{
  return 0;
}

- (int)callCountOutgoingUnconnected
{
  return 0;
}

- (unsigned)callFlags
{
  return 0;
}

- (BOOL)clamshellMode
{
  return 0;
}

- (int)connectedCallCount
{
  return 0;
}

- (unsigned)consoleUserID
{
  return 0;
}

- (NSString)consoleUserName
{
  return 0LL;
}

- (NSArray)familyMembers
{
  if (gCUSystemMonitor) {
    unint64_t v2 = (void *)[*(id *)(gCUSystemMonitor + 56) copy];
  }
  else {
    unint64_t v2 = 0LL;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSArray *)v2;
}

- (NSString)foregroundAppBundleID
{
  return 0LL;
}

- (unsigned)locationVisitsFlags
{
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 96);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)manateeAvailable
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 100) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)manateeState
{
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 104);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (void)forceManateeStateRefresh
{
}

- (NSString)meDeviceFMFDeviceID
{
  int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    int v2 = *(void **)(gCUSystemMonitor + 136);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)meDeviceIDSDeviceID
{
  int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    int v2 = *(void **)(gCUSystemMonitor + 144);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)meDeviceName
{
  int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    int v2 = *(void **)(gCUSystemMonitor + 152);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (BOOL)meDeviceIsMe
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 160) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)meDeviceValid
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 161) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)motionFlags
{
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 200);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)motionOrientation
{
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 216);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)netFlags
{
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 240);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)powerUnlimited
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 316) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSString)primaryAppleID
{
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 320);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (BOOL)primaryAppleIDIsHSA2
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 329) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv4Addr
{
  uint64_t v4 = gCUSystemMonitor;
  if (gCUSystemMonitor)
  {
    retstr->var0 = *(sockaddr *)(gCUSystemMonitor + 244);
    *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)(v4 + 256);
  }

  else
  {
    *(void *)&retstr->var0.sa_len = 0LL;
    *(void *)retstr->var2.sin6_addr.__u6_addr8 = 0LL;
    retstr->var2.sin6_scope_id = 0;
    *(void *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0LL;
  }

  return ($4FF8D77539A8BD95DCE0A545902499A9 *)pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv6Addr
{
  uint64_t v4 = gCUSystemMonitor;
  if (gCUSystemMonitor)
  {
    retstr->var0 = *(sockaddr *)(gCUSystemMonitor + 272);
    *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)(v4 + 284);
  }

  else
  {
    *(void *)&retstr->var0.sa_len = 0LL;
    *(void *)retstr->var2.sin6_addr.__u6_addr8 = 0LL;
    retstr->var2.sin6_scope_id = 0;
    *(void *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0LL;
  }

  return ($4FF8D77539A8BD95DCE0A545902499A9 *)pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (NSString)primaryNetworkSignature
{
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 304);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionISOCountryCode
{
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 360);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionMobileCountryCode
{
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 368);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionRoutineCountry
{
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 384);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionRoutineState
{
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 400);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- ($D91DDCA3822F03E96939068EA8DE741A)rotatingIdentifier48
{
  if (gCUSystemMonitor) {
    unint64_t v2 = *(unsigned int *)(gCUSystemMonitor + 408) | ((unint64_t)*(unsigned __int16 *)(gCUSystemMonitor + 412) << 32);
  }
  else {
    unint64_t v2 = 0LL;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return ($D91DDCA3822F03E96939068EA8DE741A)v2;
}

- (NSData)rotatingIdentifierData
{
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 416);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSData *)v3;
}

- (BOOL)screenLocked
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 432) != 0;
  }
  else {
    BOOL v2 = 1;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)screenLockedSync
{
  if (!gCUSystemMonitor)
  {
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    return 1;
  }

  int v2 = *(_DWORD *)(gCUSystemMonitor + 436);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v2 == -1) {
    return 1;
  }
  uint64_t state64 = 0LL;
  uint32_t state = notify_get_state(v2, &state64);
  if (state64) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = state == 0;
  }
  return !v4;
}

- (BOOL)screenOn
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 440) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)screenSaverActive
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 452) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)screenState
{
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 464);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)systemLockState
{
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 536);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)systemLockStateSync
{
  unsigned int v2 = MKBGetDeviceLockState();
  if (v2 <= 4) {
    return 4 - v2;
  }
  else {
    return 0;
  }
}

- (NSString)systemName
{
  unsigned int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unsigned int v2 = *(void **)(gCUSystemMonitor + 528);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (unsigned)systemUIFlags
{
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 548);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)firstUnlocked
{
  if (gCUSystemMonitor) {
    BOOL v2 = *(_BYTE *)(gCUSystemMonitor + 568) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)firstUnlockedSync
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (unsigned)wifiFlags
{
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 592);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)wifiState
{
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 596);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)bluetoothAddressChangedHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBluetoothAddressChangedHandler:(id)a3
{
}

- (id)callChangedHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCallChangedHandler:(id)a3
{
}

- (id)clamshellModeChangedHandler
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setClamshellModeChangedHandler:(id)a3
{
}

- (id)consoleUserChangedHandler
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setConsoleUserChangedHandler:(id)a3
{
}

- (id)familyUpdatedHandler
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFamilyUpdatedHandler:(id)a3
{
}

- (id)foregroundAppChangedHandler
{
  return objc_getProperty(self, a2, 80LL, 1);
}

- (void)setForegroundAppChangedHandler:(id)a3
{
}

- (NSBundle)locationVisitsBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setLocationVisitsBundle:(id)a3
{
}

- (id)locationVisitsChangedHandler
{
  return objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLocationVisitsChangedHandler:(id)a3
{
}

- (id)manateeChangedHandler
{
  return objc_getProperty(self, a2, 104LL, 1);
}

- (void)setManateeChangedHandler:(id)a3
{
}

- (BOOL)meDeviceUseFindMyLocate
{
  return self->_meDeviceUseFindMyLocate;
}

- (void)setMeDeviceUseFindMyLocate:(BOOL)a3
{
  self->_meDeviceUseFindMyLocate = a3;
}

- (id)meDeviceChangedHandler
{
  return objc_getProperty(self, a2, 112LL, 1);
}

- (void)setMeDeviceChangedHandler:(id)a3
{
}

- (id)motionHandler
{
  return objc_getProperty(self, a2, 120LL, 1);
}

- (void)setMotionHandler:(id)a3
{
}

- (id)netFlagsChangedHandler
{
  return objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNetFlagsChangedHandler:(id)a3
{
}

- (id)netInterfacesChangedHandler
{
  return objc_getProperty(self, a2, 136LL, 1);
}

- (void)setNetInterfacesChangedHandler:(id)a3
{
}

- (id)primaryIPChangedHandler
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setPrimaryIPChangedHandler:(id)a3
{
}

- (id)primaryNetworkChangedHandler
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setPrimaryNetworkChangedHandler:(id)a3
{
}

- (id)powerUnlimitedChangedHandler
{
  return objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPowerUnlimitedChangedHandler:(id)a3
{
}

- (id)primaryAppleIDChangedHandler
{
  return objc_getProperty(self, a2, 168LL, 1);
}

- (void)setPrimaryAppleIDChangedHandler:(id)a3
{
}

- (id)regionChangedHandler
{
  return objc_getProperty(self, a2, 176LL, 1);
}

- (void)setRegionChangedHandler:(id)a3
{
}

- (id)rotatingIdentifierChangedHandler
{
  return objc_getProperty(self, a2, 184LL, 1);
}

- (void)setRotatingIdentifierChangedHandler:(id)a3
{
}

- (id)screenLockedChangedHandler
{
  return objc_getProperty(self, a2, 192LL, 1);
}

- (void)setScreenLockedChangedHandler:(id)a3
{
}

- (id)screenOnChangedHandler
{
  return objc_getProperty(self, a2, 200LL, 1);
}

- (void)setScreenOnChangedHandler:(id)a3
{
}

- (id)screenSaverChangedHandler
{
  return objc_getProperty(self, a2, 208LL, 1);
}

- (void)setScreenSaverChangedHandler:(id)a3
{
}

- (id)screenStateChangedHandler
{
  return objc_getProperty(self, a2, 216LL, 1);
}

- (void)setScreenStateChangedHandler:(id)a3
{
}

- (id)systemLockStateChangedHandler
{
  return objc_getProperty(self, a2, 224LL, 1);
}

- (void)setSystemLockStateChangedHandler:(id)a3
{
}

- (id)systemNameChangedHandler
{
  return objc_getProperty(self, a2, 232LL, 1);
}

- (void)setSystemNameChangedHandler:(id)a3
{
}

- (id)systemUIChangedHandler
{
  return objc_getProperty(self, a2, 240LL, 1);
}

- (void)setSystemUIChangedHandler:(id)a3
{
}

- (id)firstUnlockHandler
{
  return objc_getProperty(self, a2, 248LL, 1);
}

- (void)setFirstUnlockHandler:(id)a3
{
}

- (id)wifiStateChangedHandler
{
  return objc_getProperty(self, a2, 256LL, 1);
}

- (void)setWifiStateChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __29__CUSystemMonitor_invalidate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 25))
  {
    *(_BYTE *)(v8 + 25) = 1;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitor invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v64);
    }

    pthread_mutex_lock(&gCUSystemMonitorLock);
    [(id)gCUSystemMonitor removeMonitor:*(void *)(a1 + 32)];
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0LL;

    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = 0LL;

    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 56);
    *(void *)(v14 + 56) = 0LL;

    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = 0LL;

    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 72);
    *(void *)(v18 + 72) = 0LL;

    uint64_t v20 = *(void *)(a1 + 32);
    v21 = *(void **)(v20 + 96);
    *(void *)(v20 + 96) = 0LL;

    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(void **)(v22 + 104);
    *(void *)(v22 + 104) = 0LL;

    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 112);
    *(void *)(v24 + 112) = 0LL;

    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 120);
    *(void *)(v26 + 120) = 0LL;

    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 128);
    *(void *)(v28 + 128) = 0LL;

    uint64_t v30 = *(void *)(a1 + 32);
    v31 = *(void **)(v30 + 136);
    *(void *)(v30 + 136) = 0LL;

    uint64_t v32 = *(void *)(a1 + 32);
    v33 = *(void **)(v32 + 160);
    *(void *)(v32 + 160) = 0LL;

    uint64_t v34 = *(void *)(a1 + 32);
    v35 = *(void **)(v34 + 168);
    *(void *)(v34 + 168) = 0LL;

    uint64_t v36 = *(void *)(a1 + 32);
    v37 = *(void **)(v36 + 144);
    *(void *)(v36 + 144) = 0LL;

    uint64_t v38 = *(void *)(a1 + 32);
    v39 = *(void **)(v38 + 152);
    *(void *)(v38 + 152) = 0LL;

    uint64_t v40 = *(void *)(a1 + 32);
    v41 = *(void **)(v40 + 176);
    *(void *)(v40 + 176) = 0LL;

    uint64_t v42 = *(void *)(a1 + 32);
    v43 = *(void **)(v42 + 184);
    *(void *)(v42 + 184) = 0LL;

    uint64_t v44 = *(void *)(a1 + 32);
    v45 = *(void **)(v44 + 192);
    *(void *)(v44 + 192) = 0LL;

    uint64_t v46 = *(void *)(a1 + 32);
    v47 = *(void **)(v46 + 200);
    *(void *)(v46 + 200) = 0LL;

    uint64_t v48 = *(void *)(a1 + 32);
    v49 = *(void **)(v48 + 208);
    *(void *)(v48 + 208) = 0LL;

    uint64_t v50 = *(void *)(a1 + 32);
    v51 = *(void **)(v50 + 216);
    *(void *)(v50 + 216) = 0LL;

    uint64_t v52 = *(void *)(a1 + 32);
    v53 = *(void **)(v52 + 224);
    *(void *)(v52 + 224) = 0LL;

    uint64_t v54 = *(void *)(a1 + 32);
    v55 = *(void **)(v54 + 232);
    *(void *)(v54 + 232) = 0LL;

    uint64_t v56 = *(void *)(a1 + 32);
    v57 = *(void **)(v56 + 240);
    *(void *)(v56 + 240) = 0LL;

    uint64_t v58 = *(void *)(a1 + 32);
    v59 = *(void **)(v58 + 248);
    *(void *)(v58 + 248) = 0LL;

    uint64_t v60 = *(void *)(a1 + 32);
    v61 = *(void **)(v60 + 256);
    *(void *)(v60 + 256) = 0LL;

    uint64_t v62 = *(void *)(a1 + 32);
    v63 = *(void (***)(void))(v62 + 32);
    if (v63)
    {
      v63[2]();
      uint64_t v62 = *(void *)(a1 + 32);
      v63 = *(void (***)(void))(v62 + 32);
    }

    *(void *)(v62 + 32) = 0LL;
  }

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(unsigned __int8 *)(v9 + 8);
  *(_BYTE *)(v9 + 8) = 1;
  if (v10)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v11 = "Activating (again)\n";
LABEL_8:
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)v11,  a5,  a6,  a7,  a8,  v19);
    }
  }

  else if (gLogCategory_CUSystemMonitor <= 30 {
         && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize( (uint64_t)&gLogCategory_CUSystemMonitor,  0x1Eu)))
  }
  {
    v11 = "Activating\n";
    goto LABEL_8;
  }

  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v12 = (void *)gCUSystemMonitor;
  if (!gCUSystemMonitor)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitorImp);
    uint64_t v14 = (void *)gCUSystemMonitor;
    gCUSystemMonitor = (uint64_t)v13;

    uint64_t v12 = (void *)gCUSystemMonitor;
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v16 = *(void *)(v15 + 16);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke_2;
    v22[3] = &unk_189F34300;
    id v23 = *(id *)(a1 + 40);
    [v12 updateWithQueue:v16 completion:v22];
    v17 = v23;
  }

  else
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke_3;
    v20[3] = &unk_189F33060;
    v20[4] = v15;
    id v21 = *(id *)(a1 + 40);
    [v12 addMonitor:v15 completion:v20];
    v17 = v21;
  }

  return pthread_mutex_unlock(&gCUSystemMonitorLock);
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke_2",  0x1Eu,  (uint64_t)"Activated (again)\n",  a5,  a6,  a7,  a8,  v10);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke_3",  0x1Eu,  (uint64_t)"Activated\n",  a5,  a6,  a7,  a8,  v10);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 1;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end