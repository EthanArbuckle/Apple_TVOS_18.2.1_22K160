@interface CUSystemMonitorImp
- (BOOL)_hasMonitorPassingTest:(id)a3;
- (CUSystemMonitorImp)init;
- (id)_primaryAppleIDAccount;
- (void)_bluetoothAddressMonitorStart;
- (void)_bluetoothAddressMonitorStop;
- (void)_familyGetMembers:(BOOL)a3;
- (void)_familyMonitorStart;
- (void)_familyMonitorStop;
- (void)_familyNetworkChanged;
- (void)_familyUpdated:(id)a3;
- (void)_firstUnlockMonitorCheck:(BOOL)a3;
- (void)_firstUnlockMonitorStart;
- (void)_firstUnlockMonitorStop;
- (void)_forceManateeStateRefresh;
- (void)_invokeBlock:(id)a3 passingTest:(id)a4;
- (void)_locationVisitUpdate:(id)a3 arrived:(BOOL)a4;
- (void)_locationVisitsMonitorStart;
- (void)_locationVisitsMonitorStop;
- (void)_locationsOfInterestDidChange:(BOOL)a3;
- (void)_manateeMonitorStart;
- (void)_manateeMonitorStop;
- (void)_manateeRead;
- (void)_manatreeUpdateRetryTimer:(BOOL)a3;
- (void)_meDeviceCheckCompletion:(id)a3 error:(id)a4 firstCheck:(BOOL)a5;
- (void)_meDeviceCheckStart:(BOOL)a3;
- (void)_meDeviceMonitorStart;
- (void)_meDeviceMonitorStop;
- (void)_meDeviceMonitorStopFMF;
- (void)_meDeviceRetryTimerUpdate:(BOOL)a3;
- (void)_meDeviceUpdate:(id)a3;
- (void)_motionMonitorHandleActivity:(id)a3;
- (void)_motionMonitorOrientationChanged:(id)a3;
- (void)_motionMonitorStart;
- (void)_motionMonitorStop;
- (void)_netInterfaceMonitorStart;
- (void)_netInterfaceMonitorStop;
- (void)_powerUnlimitedMonitorStart;
- (void)_powerUnlimitedMonitorStop;
- (void)_primaryAppleIDChanged2:(BOOL)a3;
- (void)_primaryAppleIDChanged:(id)a3;
- (void)_primaryAppleIDMonitorStart;
- (void)_primaryAppleIDMonitorStop;
- (void)_regionMonitorGet;
- (void)_regionMonitorStart;
- (void)_regionMonitorStop;
- (void)_regionMonitorUpdateLocationsOfInterest:(id)a3;
- (void)_regionMonitorUpdateMCC:(id)a3;
- (void)_rotatingIdentifierMonitorStart;
- (void)_rotatingIdentifierMonitorStop;
- (void)_rotatingIdentifierTimerFired;
- (void)_screenChanged:(BOOL)a3;
- (void)_screenLockedChanged;
- (void)_screenLockedMonitorStart;
- (void)_screenLockedMonitorStop;
- (void)_screenOnMonitorStartiOS;
- (void)_screenOnMonitorStop;
- (void)_screenSaverMonitorStart;
- (void)_screenSaverMonitorStop;
- (void)_screenStateMonitorStart;
- (void)_screenStateMonitorStop;
- (void)_screenStateMonitorUpdateWithLayout:(id)a3;
- (void)_systemConfigChanged:(id)a3 initial:(BOOL)a4;
- (void)_systemConfigNetInterfaceChanged:(id)a3 initial:(BOOL)a4;
- (void)_systemConfigSystemNameChanged:(BOOL)a3;
- (void)_systemConfigUpdateKeyPtr:(id *)a3 name:(id)a4 enabled:(BOOL)a5 creator:(id)a6;
- (void)_systemConfigUpdateNotifications;
- (void)_systemLockStateMonitorStart;
- (void)_systemLockStateMonitorStop;
- (void)_systemLockStateUpdate:(BOOL)a3;
- (void)_systemUIMonitorChangedFlags:(unsigned int)a3;
- (void)_systemUIMonitorStart;
- (void)_systemUIMonitorStop;
- (void)_update;
- (void)_wifiMonitorStart;
- (void)_wifiMonitorStateChanged:(BOOL)a3;
- (void)_wifiMonitorStop;
- (void)addMonitor:(id)a3 completion:(id)a4;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)locationManager:(id)a3 didArrive:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didDepart:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)removeMonitor:(id)a3;
- (void)updateWithQueue:(id)a3 completion:(id)a4;
@end

@implementation CUSystemMonitorImp

- (CUSystemMonitorImp)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CUSystemMonitorImp;
  v2 = -[CUSystemMonitorImp init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("CUSystemMonitor", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
    v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    *((_DWORD *)v2 + 12) = -1;
    *((_DWORD *)v2 + 20) = -1;
    *(void *)(v2 + 164) = -1LL;
    *((_DWORD *)v2 + 46) = -1;
    *((_DWORD *)v2 + 78) = -1;
    *((_DWORD *)v2 + 83) = -1;
    *((_DWORD *)v2 + 98) = -1;
    v2[432] = 1;
    *((_DWORD *)v2 + 109) = -1;
    *(void *)(v2 + 444) = -1LL;
    *(void *)(v2 + 540) = -1LL;
    *((_DWORD *)v2 + 143) = -1;
    v8 = v2;
  }

  return (CUSystemMonitorImp *)v2;
}

- (void)addMonitor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__CUSystemMonitorImp_addMonitor_completion___block_invoke;
  block[3] = &unk_189F31B90;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)removeMonitor:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__CUSystemMonitorImp_removeMonitor___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)_hasMonitorPassingTest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = (uint64_t (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_monitors;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ((v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_invokeBlock:(id)a3 passingTest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void))a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_monitors;
  uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(_BYTE **)(*((void *)&v17 + 1) + 8 * i);
        if (v13[9] && v7[2](v7, *(void *)(*((void *)&v17 + 1) + 8 * i)))
        {
          [v13 dispatchQueue];
          v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1895F87A8];
          v15[1] = 3221225472LL;
          v15[2] = __47__CUSystemMonitorImp__invokeBlock_passingTest___block_invoke;
          v15[3] = &unk_189F33060;
          v15[4] = v13;
          id v16 = v6;
          dispatch_async(v14, v15);
        }
      }

      uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v10);
  }
}

- (void)updateWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke;
  block[3] = &unk_189F31B90;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_8157)) {
    -[CUSystemMonitorImp _bluetoothAddressMonitorStart](self, "_bluetoothAddressMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _bluetoothAddressMonitorStop](self, "_bluetoothAddressMonitorStop");
  }
  BOOL v3 = -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_20);
  BOOL v4 = v3;
  if (!v3)
  {
    -[CUSystemMonitorImp _familyMonitorStop](self, "_familyMonitorStop");
    goto LABEL_8;
  }

  if (self->_firstUnlocked)
  {
    -[CUSystemMonitorImp _familyMonitorStart](self, "_familyMonitorStart");
LABEL_8:
    char v5 = 0;
    goto LABEL_9;
  }

  char v5 = 1;
LABEL_9:
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_21)) {
    -[CUSystemMonitorImp _locationVisitsMonitorStart](self, "_locationVisitsMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _locationVisitsMonitorStop](self, "_locationVisitsMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_22)) {
    -[CUSystemMonitorImp _manateeMonitorStart](self, "_manateeMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _manateeMonitorStop](self, "_manateeMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_23)) {
    -[CUSystemMonitorImp _meDeviceMonitorStart](self, "_meDeviceMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _meDeviceMonitorStop](self, "_meDeviceMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_24)) {
    -[CUSystemMonitorImp _motionMonitorStart](self, "_motionMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _motionMonitorStop](self, "_motionMonitorStop");
  }
  BOOL v6 = -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_25);
  -[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]( self,  "_systemConfigUpdateKeyPtr:name:enabled:creator:",  &self->_scPatternNetInterfaceIPv4,  @"NetIfIPv4",  v6,  &__block_literal_global_29);
  -[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]( self,  "_systemConfigUpdateKeyPtr:name:enabled:creator:",  &self->_scPatternNetInterfaceIPv6,  @"NetIfIPv6",  v6,  &__block_literal_global_32);
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_33)
    || -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_34_8159)
    || -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_35))
  {
    -[CUSystemMonitorImp _netInterfaceMonitorStart](self, "_netInterfaceMonitorStart");
  }

  else
  {
    -[CUSystemMonitorImp _netInterfaceMonitorStop](self, "_netInterfaceMonitorStop");
  }

  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_36_8160))
  {
    -[CUSystemMonitorImp _powerUnlimitedMonitorStart](self, "_powerUnlimitedMonitorStart");
    if (v4) {
      goto LABEL_30;
    }
  }

  else
  {
    -[CUSystemMonitorImp _powerUnlimitedMonitorStop](self, "_powerUnlimitedMonitorStop");
    if (v4)
    {
LABEL_30:
      -[CUSystemMonitorImp _primaryAppleIDMonitorStart](self, "_primaryAppleIDMonitorStart");
      goto LABEL_32;
    }
  }

  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_37)) {
    goto LABEL_30;
  }
  -[CUSystemMonitorImp _primaryAppleIDMonitorStop](self, "_primaryAppleIDMonitorStop");
LABEL_32:
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_38_8161)) {
    -[CUSystemMonitorImp _regionMonitorStart](self, "_regionMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _regionMonitorStop](self, "_regionMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_39)) {
    -[CUSystemMonitorImp _rotatingIdentifierMonitorStart](self, "_rotatingIdentifierMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _rotatingIdentifierMonitorStop](self, "_rotatingIdentifierMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_40)) {
    -[CUSystemMonitorImp _screenLockedMonitorStart](self, "_screenLockedMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _screenLockedMonitorStop](self, "_screenLockedMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_41)) {
    -[CUSystemMonitorImp _screenOnMonitorStart](self, "_screenOnMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _screenOnMonitorStop](self, "_screenOnMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_42_8162)) {
    -[CUSystemMonitorImp _screenSaverMonitorStart](self, "_screenSaverMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _screenSaverMonitorStop](self, "_screenSaverMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_43)) {
    -[CUSystemMonitorImp _screenStateMonitorStart](self, "_screenStateMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _screenStateMonitorStop](self, "_screenStateMonitorStop");
  }
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_44)) {
    -[CUSystemMonitorImp _systemLockStateMonitorStart](self, "_systemLockStateMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _systemLockStateMonitorStop](self, "_systemLockStateMonitorStop");
  }
  -[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]( self,  "_systemConfigUpdateKeyPtr:name:enabled:creator:",  &self->_scKeySystemName,  @"SystemName",  -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_45),  &__block_literal_global_48);
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_49))
  {
    -[CUSystemMonitorImp _systemUIMonitorStart](self, "_systemUIMonitorStart");
    if ((v5 & 1) != 0) {
      goto LABEL_58;
    }
  }

  else
  {
    -[CUSystemMonitorImp _systemUIMonitorStop](self, "_systemUIMonitorStop");
    if ((v5 & 1) != 0)
    {
LABEL_58:
      -[CUSystemMonitorImp _firstUnlockMonitorStart](self, "_firstUnlockMonitorStart");
      goto LABEL_60;
    }
  }

  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_50)) {
    goto LABEL_58;
  }
  -[CUSystemMonitorImp _firstUnlockMonitorStop](self, "_firstUnlockMonitorStop");
LABEL_60:
  if (-[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_51)) {
    -[CUSystemMonitorImp _wifiMonitorStart](self, "_wifiMonitorStart");
  }
  else {
    -[CUSystemMonitorImp _wifiMonitorStop](self, "_wifiMonitorStop");
  }
  if (self->_scChangesPending) {
    -[CUSystemMonitorImp _systemConfigUpdateNotifications](self, "_systemConfigUpdateNotifications");
  }
}

- (void)_bluetoothAddressMonitorStart
{
  if (!self->_bluetoothClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]",  0x1Eu,  (uint64_t)"Bluetooth address monitor start\n",  v2,  v3,  v4,  v5,  v9);
    }

    id v7 = objc_alloc_init(&OBJC_CLASS___CUBluetoothClient);
    bluetoothClient = self->_bluetoothClient;
    self->_bluetoothClient = v7;

    -[CUBluetoothClient setDispatchQueue:](self->_bluetoothClient, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBluetoothClient setLabel:](self->_bluetoothClient, "setLabel:", @"SysMon");
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke;
    v10[3] = &unk_189F31F98;
    v10[4] = self;
    -[CUBluetoothClient setBluetoothAddressChangedHandler:]( self->_bluetoothClient,  "setBluetoothAddressChangedHandler:",  v10);
    -[CUBluetoothClient activate](self->_bluetoothClient, "activate");
  }

- (void)_bluetoothAddressMonitorStop
{
  if (self->_bluetoothClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStop]",  0x1Eu,  (uint64_t)"Bluetooth address monitor stop\n",  v2,  v3,  v4,  v5,  v8);
    }

    -[CUBluetoothClient invalidate](self->_bluetoothClient, "invalidate");
    bluetoothClient = self->_bluetoothClient;
    self->_bluetoothClient = 0LL;
  }

- (void)_familyMonitorStart
{
  if (!self->_familyPrimaryIPMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]",  0x1Eu,  (uint64_t)"Family monitoring start\n",  v2,  v3,  v4,  v5,  v14[0]);
    }

    id v7 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
    self->_familyPrimaryIPMonitor = v7;

    -[CUSystemMonitor setDispatchQueue:](self->_familyPrimaryIPMonitor, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v9 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke;
    v17[3] = &unk_189F34238;
    v17[4] = self;
    -[CUSystemMonitor setPrimaryIPChangedHandler:](self->_familyPrimaryIPMonitor, "setPrimaryIPChangedHandler:", v17);
    id v10 = self->_familyPrimaryIPMonitor;
    v16[0] = v9;
    v16[1] = 3221225472LL;
    v16[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_2;
    v16[3] = &unk_189F34238;
    v16[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v10, "activateWithCompletion:", v16);
  }

  if (self->_familyBuddyToken == -1)
  {
    uint64_t v11 = (const char *)[(id) getBYSetupAssistantFinishedDarwinNotification[0]() UTF8String];
    if (v11)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_3;
      handler[3] = &unk_189F32EC8;
      handler[4] = self;
      notify_register_dispatch(v11, &self->_familyBuddyToken, dispatchQueue, handler);
    }
  }

  if (self->_familyUpdatedToken == -1)
  {
    id v13 = (dispatch_queue_s *)self->_dispatchQueue;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_4;
    v14[3] = &unk_189F32EC8;
    v14[4] = self;
    notify_register_dispatch("com.apple.family.family_updated", &self->_familyUpdatedToken, v13, v14);
    -[CUSystemMonitorImp _familyGetMembers:](self, "_familyGetMembers:", 1LL);
  }

- (void)_familyMonitorStop
{
  self->_familyFailed = 0;
  -[CUSystemMonitor invalidate](self->_familyPrimaryIPMonitor, "invalidate");
  familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
  self->_familyPrimaryIPMonitor = 0LL;

  int familyBuddyToken = self->_familyBuddyToken;
  if (familyBuddyToken != -1)
  {
    notify_cancel(familyBuddyToken);
    self->_int familyBuddyToken = -1;
  }

  int familyUpdatedToken = self->_familyUpdatedToken;
  if (familyUpdatedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_9;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyMonitorStop]",  0x1Eu,  (uint64_t)"Family monitoring stop\n",  v4,  v5,  v6,  v7,  v10);
    }
    int familyUpdatedToken = self->_familyUpdatedToken;
    if (familyUpdatedToken != -1)
    {
LABEL_9:
      notify_cancel(familyUpdatedToken);
      self->_int familyUpdatedToken = -1;
    }
  }

- (void)_familyGetMembers:(BOOL)a3
{
  BOOL v7 = a3;
  if (SetupAssistantLibrary_sOnce != -1) {
    dispatch_once(&SetupAssistantLibrary_sOnce, &__block_literal_global_976_8131);
  }
  if (SetupAssistantLibrary_sLib
    && dlsym((void *)SetupAssistantLibrary_sLib, "BYSetupAssistantNeedsToRun")
    && softLinkBYSetupAssistantNeedsToRun())
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]",  0x1Eu,  (uint64_t)"Family get members skipped when setup needs to run\n",  v3,  v4,  v5,  v6,  v13);
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v9 = "";
      if (v7) {
        uint64_t v9 = "(first)";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]",  0x1Eu,  (uint64_t)"Family get members %s\n",  v3,  v4,  v5,  v6,  (char)v9);
    }

    self->_familyFailed = 0;
    id v10 = objc_alloc_init((Class)getFAFetchFamilyCircleRequestClass[0]());
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __40__CUSystemMonitorImp__familyGetMembers___block_invoke;
    v11[3] = &unk_189F32000;
    v11[4] = self;
    BOOL v12 = v7;
    [v10 startRequestWithCompletionHandler:v11];
  }

- (void)_familyNetworkChanged
{
  familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
  if (familyPrimaryIPMonitor && self->_familyFailed)
  {
    -[CUSystemMonitor primaryIPv4Addr](familyPrimaryIPMonitor, "primaryIPv4Addr");
    uint64_t v4 = self->_familyPrimaryIPMonitor;
    if (v4)
    {
      -[CUSystemMonitor primaryIPv6Addr](v4, "primaryIPv6Addr");
      BOOL v5 = v11 != 30;
    }

    else
    {
      BOOL v5 = 1;
    }

    if (v12[1] == 2 || !v5)
    {
      -[CUSystemMonitorImp _primaryAppleIDAccount](self, "_primaryAppleIDAccount");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyNetworkChanged]",  0x1Eu,  (uint64_t)"Family retry on network change: IPv4 %##a, IPv6 %##a\n",  v7,  v8,  v9,  v10,  (char)v12);
        }

        -[CUSystemMonitorImp _familyGetMembers:](self, "_familyGetMembers:", 0LL);
      }
    }
  }

- (void)_familyUpdated:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __37__CUSystemMonitorImp__familyUpdated___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_locationVisitsMonitorStart
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  p_locationManager = &self->_locationManager;
  id v4 = self->_locationManager;
  if (!v4)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    BOOL v5 = self->_monitors;
    uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) locationVisitsBundle];
          if (v10)
          {
            uint64_t v15 = (void *)v10;

            if (gLogCategory_CUSystemMonitor <= 30
              && (gLogCategory_CUSystemMonitor != -1
               || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
            {
              getkCLLocationAccuracyHundredMeters();
              LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStart]",  0x1Eu,  (uint64_t)"Location visit monitoring start: %f",  v16,  v17,  v18,  v19,  v20);
            }

            id v4 = (CLLocationManager *)[objc_alloc(getCLLocationManagerClass()) initWithEffectiveBundle:v15 delegate:self onQueue:self->_dispatchQueue];
            objc_storeStrong((id *)p_locationManager, v4);
            getkCLLocationAccuracyHundredMeters();
            -[CLLocationManager setDesiredAccuracy:](v4, "setDesiredAccuracy:");
            -[CLLocationManager startMonitoringVisits](v4, "startMonitoringVisits");

            goto LABEL_20;
          }
        }

        uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStart]",  0x5Au,  (uint64_t)"### Location visit no bundle",  v11,  v12,  v13,  v14,  v21);
    }

    id v4 = 0LL;
  }

- (void)_locationVisitsMonitorStop
{
  uint64_t v3 = self->_locationManager;
  if (v3)
  {
    uint64_t v10 = v3;
    locationManager = self->_locationManager;
    self->_locationManager = 0LL;

    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStop]",  0x1Eu,  (uint64_t)"Location visit monitoring stop",  v5,  v6,  v7,  v8,  v9);
    }

    -[CLLocationManager stopMonitoringVisits](v10, "stopMonitoringVisits");
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_locationVisitsFlags = 0;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    uint64_t v3 = v10;
  }
}

- (void)_locationVisitUpdate:(id)a3 arrived:(BOOL)a4
{
  BOOL v4 = a4;
  [a3 _placeInference];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v20 userType];
  else {
    int v11 = dword_186B49D00[v6 - 1];
  }
  unsigned int locationVisitsFlags = self->_locationVisitsFlags;
  int v13 = locationVisitsFlags | v11;
  int v14 = locationVisitsFlags & ~v11;
  if (v4) {
    unsigned int v15 = v13;
  }
  else {
    unsigned int v15 = v14;
  }
  if (v15 == locationVisitsFlags)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationVisitUpdate:arrived:]",  0xAu,  (uint64_t)"Location visit unchanged: %#{flags}",  v7,  v8,  v9,  v10,  locationVisitsFlags);
    }
  }

  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_unsigned int locationVisitsFlags = v15;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationVisitUpdate:arrived:]",  0x1Eu,  (uint64_t)"Location visit changed: %#{flags} -> %#{flags}\n",  v16,  v17,  v18,  v19,  locationVisitsFlags);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_89,  &__block_literal_global_90);
  }
}

- (void)locationManager:(id)a3 didArrive:(id)a4 completion:(id)a5
{
  id v20 = a4;
  uint64_t v8 = (void (**)(void))a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v10 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v10)
  {
    [v20 _placeInference];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 userType];
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      unint64_t v14 = v13;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v14 > 4) {
          unsigned int v15 = "?";
        }
        else {
          unsigned int v15 = off_189F32A98[v14];
        }
        [v12 confidence];
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp locationManager:didArrive:completion:]",  0x1Eu,  (uint64_t)"Location visit arrived: %s, confidence %f",  v16,  v17,  v18,  v19,  (char)v15);
      }
    }

    -[CUSystemMonitorImp _locationVisitUpdate:arrived:](self, "_locationVisitUpdate:arrived:", v20, 1LL);
    v8[2](v8);
  }

  else
  {
    v8[2](v8);
  }
}

- (void)locationManager:(id)a3 didDepart:(id)a4 completion:(id)a5
{
  id v20 = a4;
  uint64_t v8 = (void (**)(void))a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v10 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v10)
  {
    [v20 _placeInference];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 userType];
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      unint64_t v14 = v13;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v14 > 4) {
          unsigned int v15 = "?";
        }
        else {
          unsigned int v15 = off_189F32A98[v14];
        }
        [v12 confidence];
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp locationManager:didDepart:completion:]",  0x1Eu,  (uint64_t)"Location visit departed: %s, confidence %f",  v16,  v17,  v18,  v19,  (char)v15);
      }
    }

    -[CUSystemMonitorImp _locationVisitUpdate:arrived:](self, "_locationVisitUpdate:arrived:", v20, 0LL);
    v8[2](v8);
  }

  else
  {
    v8[2](v8);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  int v11 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v4 = v11;
  if (self->_locationManager == v11 && gLogCategory_CUSystemMonitor <= 30)
  {
    if (gLogCategory_CUSystemMonitor != -1
      || (v10 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu), BOOL v4 = v11, v10))
    {
      char v5 = -[CLLocationManager authorizationStatus](v4, "authorizationStatus");
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp locationManagerDidChangeAuthorization:]",  0x1Eu,  (uint64_t)"Location authorization changed: %d",  v6,  v7,  v8,  v9,  v5);
      BOOL v4 = v11;
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    char v5 = [v10 count];
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp locationManager:didUpdateLocations:]",  0x1Eu,  (uint64_t)"Location updated locations: %d",  v6,  v7,  v8,  v9,  v5);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v13 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v7 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v7
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp locationManager:didFailWithError:]",  0x1Eu,  (uint64_t)"Location visit failed: %{error}",  v9,  v10,  v11,  v12,  (char)v13);
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v17 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v7 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v7)
  {
    [v17 _placeInference];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 userType];
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      unint64_t v11 = v10;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v11 > 4) {
          uint64_t v12 = "?";
        }
        else {
          uint64_t v12 = off_189F32A98[v11];
        }
        [v9 confidence];
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp locationManager:didVisit:]",  0x1Eu,  (uint64_t)"Location visited: %s, confidence %f",  v13,  v14,  v15,  v16,  (char)v12);
      }
    }

    -[CUSystemMonitorImp _locationVisitUpdate:arrived:](self, "_locationVisitUpdate:arrived:", v17, 1LL);
  }
}

- (void)_manateeMonitorStart
{
  if (!self->_manateeObserving)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _manateeMonitorStart]",  0x1Eu,  (uint64_t)"Manatee monitoring start\n",  v2,  v3,  v4,  v5,  v8);
    }

    [MEMORY[0x189607860] defaultCenter];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:getCDPManateeAvailabilityNotification[0]()];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 addObserver:self selector:sel__manateeChanged_ name:v7 object:0];
    self->_manateeObserving = 1;
    -[CUSystemMonitorImp _manateeRead](self, "_manateeRead");
  }

- (void)_manateeMonitorStop
{
  if (self->_manateeObserving)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _manateeMonitorStop]",  0x1Eu,  (uint64_t)"Manatee monitoring stop\n",  v2,  v3,  v4,  v5,  v11);
    }

    [MEMORY[0x189607860] defaultCenter];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:getCDPManateeAvailabilityNotification[0]()];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 removeObserver:self name:v8 object:0];
    self->_manateeObserving = 0;
  }

  manateeRetryTimer = self->_manateeRetryTimer;
  if (manateeRetryTimer)
  {
    uint64_t v12 = manateeRetryTimer;
    dispatch_source_cancel(v12);
    uint64_t v10 = self->_manateeRetryTimer;
    self->_manateeRetryTimer = 0LL;
  }

- (void)_manateeRead
{
  if (_manateeRead_sOnce != -1) {
    dispatch_once(&_manateeRead_sOnce, &__block_literal_global_103);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_2;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async((dispatch_queue_t)_manateeRead_cdpQueue, block);
}

- (void)_forceManateeStateRefresh
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__CUSystemMonitorImp__forceManateeStateRefresh__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_manatreeUpdateRetryTimer:(BOOL)a3
{
  BOOL v7 = a3;
  manateeRetryTimer = self->_manateeRetryTimer;
  if (manateeRetryTimer)
  {
    if (gLogCategory_CUSystemMonitor >= 31)
    {
      uint64_t v10 = manateeRetryTimer;
LABEL_8:
      dispatch_source_cancel(v10);
      char v11 = self->_manateeRetryTimer;
      self->_manateeRetryTimer = 0LL;

      goto LABEL_9;
    }

    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]",  0x1Eu,  (uint64_t)"Manatee retry timer cancel",  v3,  v4,  v5,  v6,  v22);
    }
    uint64_t v10 = self->_manateeRetryTimer;
    if (v10) {
      goto LABEL_8;
    }
  }

- (void)_meDeviceMonitorStart
{
  if ((self->_meDeviceUseFindMyLocate
     || (BOOL v3 = -[CUSystemMonitorImp _hasMonitorPassingTest:]( self,  "_hasMonitorPassingTest:",  &__block_literal_global_112),  self->_meDeviceUseFindMyLocate = v3,  v3))
    && [(Class)getCUFindMyLocateMeDeviceMonitorClass[0]() supported])
  {
    -[CUSystemMonitorImp _meDeviceMonitorStopFMF](self, "_meDeviceMonitorStopFMF");
    if (!self->_meDeviceFindMyLocateMonitor)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]",  0x1Eu,  (uint64_t)"MeDevice monitoring start (FML)",  v4,  v5,  v6,  v7,  v21[0]);
      }

      uint64_t v14 = (CUFindMyLocateMeDeviceMonitor *)[objc_alloc((Class)getCUFindMyLocateMeDeviceMonitorClass[0]()) initWithDispatchQueue:self->_dispatchQueue];
      meDeviceFindMyLocateMonitor = self->_meDeviceFindMyLocateMonitor;
      self->_meDeviceFindMyLocateMonitor = v14;

      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_2;
      v24[3] = &unk_189F32110;
      v24[4] = self;
      -[CUFindMyLocateMeDeviceMonitor setMeDeviceUpdatedHandler:]( self->_meDeviceFindMyLocateMonitor,  "setMeDeviceUpdatedHandler:",  v24);
      -[CUFindMyLocateMeDeviceMonitor activate](self->_meDeviceFindMyLocateMonitor, "activate");
    }
  }

  else
  {
    if (self->_meDeviceChangedToken == -1)
    {
      id v8 = getFMFMeDeviceChangedNotification[0]();
      id v9 = (const char *)[v8 UTF8String];

      if (!v9) {
        return;
      }
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]",  0x1Eu,  (uint64_t)"MeDevice monitoring start\n",  v10,  v11,  v12,  v13,  v21[0]);
      }

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_3;
      handler[3] = &unk_189F32EC8;
      handler[4] = self;
      notify_register_dispatch(v9, &self->_meDeviceChangedToken, dispatchQueue, handler);
      -[CUSystemMonitorImp _meDeviceCheckStart:](self, "_meDeviceCheckStart:", 1LL);
    }

    if (self->_fmfDevicesChangedToken == -1)
    {
      id v17 = getFMFDevicesChangedNotification[0]();
      uint64_t v18 = (const char *)[v17 UTF8String];

      if (!v18) {
        return;
      }
      uint64_t v19 = (dispatch_queue_s *)self->_dispatchQueue;
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_4;
      v22[3] = &unk_189F32EC8;
      v22[4] = self;
      notify_register_dispatch(v18, &self->_fmfDevicesChangedToken, v19, v22);
    }

    if (self->_meDeviceRetryToken == -1)
    {
      id v20 = (dispatch_queue_s *)self->_dispatchQueue;
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_5;
      v21[3] = &unk_189F32EC8;
      v21[4] = self;
      notify_register_dispatch( "com.apple.siri.personal.requests.companion.update",  &self->_meDeviceRetryToken,  v20,  v21);
    }
  }

- (void)_meDeviceMonitorStop
{
  if (self->_meDeviceFindMyLocateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStop]",  0x1Eu,  (uint64_t)"MeDevice monitoring stop (FML)",  v2,  v3,  v4,  v5,  v11);
    }

    -[CUFindMyLocateMeDeviceMonitor invalidate](self->_meDeviceFindMyLocateMonitor, "invalidate");
    meDeviceFindMyLocateMonitor = self->_meDeviceFindMyLocateMonitor;
    self->_meDeviceFindMyLocateMonitor = 0LL;
  }

  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  self->_meDeviceFMFDeviceID = 0LL;

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  self->_meDeviceIDSDeviceID = 0LL;

  meDeviceName = self->_meDeviceName;
  self->_meDeviceName = 0LL;

  *(_WORD *)&self->_meDeviceIsMe = 0;
  -[CUSystemMonitorImp _meDeviceMonitorStopFMF](self, "_meDeviceMonitorStopFMF");
}

- (void)_meDeviceMonitorStopFMF
{
  int meDeviceChangedToken = self->_meDeviceChangedToken;
  if (meDeviceChangedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStopFMF]",  0x1Eu,  (uint64_t)"MeDevice monitoring stop\n",  v2,  v3,  v4,  v5,  v13);
    }
    int meDeviceChangedToken = self->_meDeviceChangedToken;
    if (meDeviceChangedToken != -1)
    {
LABEL_7:
      notify_cancel(meDeviceChangedToken);
      self->_int meDeviceChangedToken = -1;
    }
  }

  int fmfDevicesChangedToken = self->_fmfDevicesChangedToken;
  if (fmfDevicesChangedToken != -1)
  {
    notify_cancel(fmfDevicesChangedToken);
    self->_int fmfDevicesChangedToken = -1;
  }

  meDeviceRetryTimer = self->_meDeviceRetryTimer;
  if (meDeviceRetryTimer)
  {
    uint64_t v10 = meDeviceRetryTimer;
    dispatch_source_cancel(v10);
    char v11 = self->_meDeviceRetryTimer;
    self->_meDeviceRetryTimer = 0LL;
  }

  int meDeviceRetryToken = self->_meDeviceRetryToken;
  if (meDeviceRetryToken != -1)
  {
    notify_cancel(meDeviceRetryToken);
    self->_int meDeviceRetryToken = -1;
  }

- (void)_meDeviceCheckStart:(BOOL)a3
{
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckStart:]",  0xAu,  (uint64_t)"MeDevice check\n",  v3,  v4,  v5,  v6,  v12);
  }

  id v9 = objc_alloc_init(MEMORY[0x189607988]);
  [v9 setUnderlyingQueue:self->_dispatchQueue];
  uint64_t v10 = (void *)[objc_alloc((Class)getFMFSessionClass[0]()) initWithDelegate:self delegateQueue:v9];
  [v10 forceRefresh];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __42__CUSystemMonitorImp__meDeviceCheckStart___block_invoke;
  v13[3] = &unk_189F32138;
  BOOL v15 = a3;
  v13[4] = self;
  id v14 = v10;
  id v11 = v10;
  [v11 getActiveLocationSharingDevice:v13];
}

- (void)_meDeviceCheckCompletion:(id)a3 error:(id)a4 firstCheck:(BOOL)a5
{
  BOOL v5 = a5;
  id v38 = a4;
  id v8 = a3;
  [v8 deviceId];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 idsDeviceId];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 deviceName];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v8 isThisDevice];

  if (v38)
  {
    if (!v9 || !v10 || !v11)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]",  0x5Au,  (uint64_t)"### MeDevice check failed: %{error}\n",  v13,  v14,  v15,  v16,  (char)v38);
      }

      -[CUSystemMonitorImp _meDeviceRetryTimerUpdate:](self, "_meDeviceRetryTimerUpdate:", 1LL);
      goto LABEL_49;
    }

    if (gLogCategory_CUSystemMonitor <= 50
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x32u)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]",  0x32u,  (uint64_t)"MeDevice provided device info, but reported an error? : %{error}\n",  v13,  v14,  v15,  v16,  (char)v38);
    }
  }

  -[CUSystemMonitorImp _meDeviceRetryTimerUpdate:](self, "_meDeviceRetryTimerUpdate:", 0LL);
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  uint64_t v18 = v9;
  uint64_t v19 = meDeviceFMFDeviceID;
  BOOL v37 = v12;
  if (v18 == v19)
  {
  }

  else
  {
    id v20 = v19;
    if ((v18 == 0LL) == (v19 != 0LL))
    {
      uint64_t v27 = v18;
      goto LABEL_34;
    }

    int v21 = -[NSString isEqual:](v18, "isEqual:", v19);

    if (!v21) {
      goto LABEL_35;
    }
  }

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  uint64_t v27 = v10;
  v28 = meDeviceIDSDeviceID;
  if (v27 == v28)
  {
  }

  else
  {
    id v20 = v28;
    if ((v27 == 0LL) == (v28 != 0LL)) {
      goto LABEL_34;
    }
    int v35 = -[NSString isEqual:](v27, "isEqual:", v28);

    if (!v35) {
      goto LABEL_35;
    }
  }

  meDeviceName = self->_meDeviceName;
  v36 = v11;
  v30 = v11;
  v31 = meDeviceName;
  if (v30 != v31)
  {
    id v20 = v31;
    if ((v30 == 0LL) != (v31 != 0LL))
    {
      int v34 = -[NSString isEqual:](v30, "isEqual:", v31);

      id v11 = v36;
      if (!v34)
      {
LABEL_35:
        if (v5)
        {
          BOOL v32 = v37;
          if (gLogCategory_CUSystemMonitor > 30
            || gLogCategory_CUSystemMonitor == -1
            && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
          {
            goto LABEL_46;
          }

          v33 = "MeDevice initial: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n";
        }

        else
        {
          BOOL v32 = v37;
          if (gLogCategory_CUSystemMonitor > 30
            || gLogCategory_CUSystemMonitor == -1
            && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
          {
            goto LABEL_46;
          }

          v33 = "MeDevice changed: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n";
        }

        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]",  0x1Eu,  (uint64_t)v33,  v22,  v23,  v24,  v25,  (char)v18);
LABEL_46:
        pthread_mutex_lock(&gCUSystemMonitorLock);
        objc_storeStrong((id *)&self->_meDeviceFMFDeviceID, v9);
        objc_storeStrong((id *)&self->_meDeviceIDSDeviceID, v10);
        objc_storeStrong((id *)&self->_meDeviceName, v11);
        self->_meDeviceIsMe = v32;
        self->_meDeviceValid = 1;
        pthread_mutex_unlock(&gCUSystemMonitorLock);
        -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_132,  &__block_literal_global_133);
        goto LABEL_49;
      }

      goto LABEL_28;
    }

    uint64_t v27 = v30;
    id v11 = v36;
LABEL_34:

    goto LABEL_35;
  }

  id v11 = v36;
LABEL_28:
  if (self->_meDeviceIsMe != v37) {
    goto LABEL_35;
  }
  if (v5)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]",  0x1Eu,  (uint64_t)"MeDevice initial: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n",  v22,  v23,  v24,  v25,  (char)v18);
    }
  }

  else if (gLogCategory_CUSystemMonitor <= 10 {
         && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  }
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]",  0xAu,  (uint64_t)"MeDevice unchanged: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n",  v22,  v23,  v24,  v25,  (char)v18);
  }

- (void)_meDeviceRetryTimerUpdate:(BOOL)a3
{
  if (a3)
  {
    if (GestaltGetDeviceClass_sOnce != -1) {
      dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13042);
    }
    BOOL v8 = GestaltGetDeviceClass_deviceClass > 7 || ((1 << GestaltGetDeviceClass_deviceClass) & 0x8A) == 0;
    if (!v8 || GestaltGetDeviceClass_deviceClass == 100)
    {
      if (!self->_meDeviceRetryTimer)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]",  0x1Eu,  (uint64_t)"MeDevice retry timer start",  v3,  v4,  v5,  v6,  v17);
        }

        id v9 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        meDeviceRetryTimer = self->_meDeviceRetryTimer;
        self->_meDeviceRetryTimer = v9;

        id v11 = self->_meDeviceRetryTimer;
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __48__CUSystemMonitorImp__meDeviceRetryTimerUpdate___block_invoke;
        handler[3] = &unk_189F34238;
        handler[4] = self;
        dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
        int v12 = self->_meDeviceRetryTimer;
        dispatch_time_t v13 = dispatch_time(0LL, 30000000000LL);
        dispatch_source_set_timer((dispatch_source_t)v12, v13, 0x6FC23AC00uLL, 0x12A05F200uLL);
        dispatch_activate((dispatch_object_t)self->_meDeviceRetryTimer);
      }

      return;
    }

    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]",  0x1Eu,  (uint64_t)"MeDevice retry timer disabled on unsupported device",  v3,  v4,  v5,  v6,  v17);
    }
  }

  uint64_t v14 = self->_meDeviceRetryTimer;
  if (!v14) {
    return;
  }
  if (gLogCategory_CUSystemMonitor >= 31)
  {
    uint64_t v15 = v14;
LABEL_27:
    uint64_t v18 = v15;
    dispatch_source_cancel(v15);
    uint64_t v16 = self->_meDeviceRetryTimer;
    self->_meDeviceRetryTimer = 0LL;

    return;
  }

  if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]",  0x1Eu,  (uint64_t)"MeDevice retry timer stop",  v3,  v4,  v5,  v6,  v17);
  }
  uint64_t v15 = self->_meDeviceRetryTimer;
  if (v15) {
    goto LABEL_27;
  }
}

- (void)_meDeviceUpdate:(id)a3
{
  id v4 = a3;
  [v4 findMyIdentifier];
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  [v4 idsID];
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  [v4 name];
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  char v8 = [v4 isThisDevice];

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceUpdate:]",  0x1Eu,  (uint64_t)"MeDevice updated: fml=<%.8@>, ids=<%.8@>, name='%@', isThisDevice=%s",  v9,  v10,  v11,  v12,  (char)v5);
  }

  pthread_mutex_lock(&gCUSystemMonitorLock);
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  self->_meDeviceFMFDeviceID = v5;
  uint64_t v14 = v5;

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  self->_meDeviceIDSDeviceID = v6;
  uint64_t v16 = v6;

  meDeviceName = self->_meDeviceName;
  self->_meDeviceName = v7;

  self->_meDeviceIsMe = v8;
  self->_meDeviceValid = 1;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_139,  &__block_literal_global_140);
}

- (void)_motionMonitorStart
{
  p_motionActivityManager = &self->_motionActivityManager;
  char v8 = self->_motionActivityManager;
  if (!*p_motionActivityManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorStart]",  0x1Eu,  (uint64_t)"Motion monitor start",  v4,  v5,  v6,  v7,  v15[0]);
    }

    id v9 = objc_alloc_init(getCMMotionActivityManagerClass());

    objc_storeStrong((id *)p_motionActivityManager, v9);
    id v10 = objc_alloc_init(MEMORY[0x189607988]);
    [v10 setUnderlyingQueue:self->_dispatchQueue];
    motionActivityManager = self->_motionActivityManager;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __41__CUSystemMonitorImp__motionMonitorStart__block_invoke;
    v18[3] = &unk_189F321E0;
    char v8 = (CMMotionActivityManager *)v9;
    uint64_t v19 = v8;
    id v20 = self;
    -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:]( motionActivityManager,  "startActivityUpdatesToQueue:withHandler:",  v10,  v18);
    id v13 = objc_alloc_init(getCMDeviceOrientationManagerClass());
    objc_storeStrong((id *)&self->_orientationManager, v13);
    v15[0] = v12;
    v15[1] = 3221225472LL;
    v15[2] = __41__CUSystemMonitorImp__motionMonitorStart__block_invoke_2;
    v15[3] = &unk_189F32208;
    id v16 = v13;
    char v17 = self;
    id v14 = v13;
    [v14 startDeviceOrientationUpdatesToQueue:v10 withHandler:v15];
  }
}

- (void)_motionMonitorStop
{
  if (self->_motionActivityManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorStop]",  0x1Eu,  (uint64_t)"Motion monitor stop",  v2,  v3,  v4,  v5,  v9);
    }

    -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0LL;

    self->_motionFlags = 0;
    -[CMDeviceOrientationManager stopDeviceOrientationUpdates]( self->_orientationManager,  "stopDeviceOrientationUpdates");
    orientationManager = self->_orientationManager;
    self->_orientationManager = 0LL;

    self->_motionOrientation = 0;
  }

- (void)_motionMonitorHandleActivity:(id)a3
{
  id v17 = a3;
  unsigned int v4 = [v17 stationary];
  else {
    uint64_t v5 = v4;
  }
  if ((_DWORD)v5 == self->_motionFlags)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      NSPrintF();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "confidence", v5, &unk_186B4ABB1);
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorHandleActivity:]",  0xAu,  (uint64_t)"Motion unchanged: %@, confidence %s",  v13,  v14,  v15,  v16,  (char)v12);
    }
  }

  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_motionFlags = v5;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      NSPrintF();
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "confidence", v5, &unk_186B4ABB1);
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorHandleActivity:]",  0x1Eu,  (uint64_t)"Motion changed: %@ -> %@, confidence %s",  v8,  v9,  v10,  v11,  (char)v6);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_149_8082,  &__block_literal_global_150);
  }
}

- (void)_motionMonitorOrientationChanged:(id)a3
{
  unsigned int v8 = [a3 orientation];
  uint64_t motionOrientation = self->_motionOrientation;
  if (v8 == (_DWORD)motionOrientation)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      if (v8 > 6) {
        uint64_t v15 = "?";
      }
      else {
        uint64_t v15 = off_189F32AF0[v8];
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorOrientationChanged:]",  0xAu,  (uint64_t)"Motion orientation unchanged: %s",  v4,  v5,  v6,  v7,  (char)v15);
    }
  }

  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_uint64_t motionOrientation = v8;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      else {
        uint64_t v14 = off_189F32AF0[motionOrientation];
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorOrientationChanged:]",  0x1Eu,  (uint64_t)"Motion orientation: %s -> %s",  v10,  v11,  v12,  v13,  (char)v14);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_153,  &__block_literal_global_154);
  }

- (void)_netInterfaceMonitorStart
{
  if (!self->_netInterfaceMonitor)
  {
    logger_8068();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_186A3B000, v3, OS_LOG_TYPE_DEFAULT, "NetInterface monitoring start", buf, 2u);
    }

    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CUNetInterfaceMonitor);
    netInterfaceMonitor = self->_netInterfaceMonitor;
    self->_netInterfaceMonitor = v4;

    -[CUNetInterfaceMonitor setDispatchQueue:](self->_netInterfaceMonitor, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke;
    v11[3] = &unk_189F34238;
    v11[4] = self;
    -[CUNetInterfaceMonitor setFlagsChangedHandler:](self->_netInterfaceMonitor, "setFlagsChangedHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3;
    v10[3] = &unk_189F34238;
    v10[4] = self;
    -[CUNetInterfaceMonitor setPrimaryIPChangedHandler:](self->_netInterfaceMonitor, "setPrimaryIPChangedHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472LL;
    v9[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_164;
    v9[3] = &unk_189F34238;
    v9[4] = self;
    -[CUNetInterfaceMonitor setPrimaryNetworkChangedHandler:]( self->_netInterfaceMonitor,  "setPrimaryNetworkChangedHandler:",  v9);
    uint64_t v7 = self->_netInterfaceMonitor;
    v8[0] = v6;
    v8[1] = 3221225472LL;
    v8[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_169;
    v8[3] = &unk_189F34238;
    v8[4] = self;
    -[CUNetInterfaceMonitor activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }

- (void)_netInterfaceMonitorStop
{
  if (self->_netInterfaceMonitor)
  {
    logger_8068();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_186A3B000, v3, OS_LOG_TYPE_DEFAULT, "NetInterface monitoring stop", v6, 2u);
    }

    -[CUNetInterfaceMonitor invalidate](self->_netInterfaceMonitor, "invalidate");
    netInterfaceMonitor = self->_netInterfaceMonitor;
    self->_netInterfaceMonitor = 0LL;

    self->_netFlags = 0;
    self->_primaryIPv4Addr.sa.sa_family = 0;
    self->_primaryIPv6Addr.sa.sa_family = 0;
    primaryNetworkSignature = self->_primaryNetworkSignature;
    self->_primaryNetworkSignature = 0LL;
  }

- (void)_powerUnlimitedMonitorStart
{
  if (self->_powerSourceToken == -1)
  {
    p_powerSourceToken = &self->_powerSourceToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]",  0x1Eu,  (uint64_t)"PowerUnlimited monitoring start\n",  v2,  v3,  v4,  v5,  v15);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", p_powerSourceToken, dispatchQueue, handler);
    int v9 = IOPSDrawingUnlimitedPower();
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_powerUnlimited = v9;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v14 = "no";
      if (v9) {
        uint64_t v14 = "yes";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]",  0x1Eu,  (uint64_t)"PowerUnlimited initial: %s\n",  v10,  v11,  v12,  v13,  (char)v14);
    }
  }

- (void)_powerUnlimitedMonitorStop
{
  int powerSourceToken = self->_powerSourceToken;
  if (powerSourceToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStop]",  0x1Eu,  (uint64_t)"PowerUnlimited monitoring stop\n",  v2,  v3,  v4,  v5,  v8);
    }
    int powerSourceToken = self->_powerSourceToken;
    if (powerSourceToken != -1)
    {
LABEL_7:
      notify_cancel(powerSourceToken);
      self->_int powerSourceToken = -1;
    }
  }

- (void)_primaryAppleIDMonitorStart
{
  if (!self->_primaryAppleIDObserving)
  {
    [MEMORY[0x189607860] defaultCenter];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObserver:self selector:sel__primaryAppleIDChanged_ name:@"com.apple.authkit.user-info-changed" object:0];
    if (self->_primaryAppleIDNotifyToken == -1)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __49__CUSystemMonitorImp__primaryAppleIDMonitorStart__block_invoke;
      handler[3] = &unk_189F32EC8;
      handler[4] = self;
      notify_register_dispatch( "com.apple.rapport.primaryAccountChanged",  &self->_primaryAppleIDNotifyToken,  dispatchQueue,  handler);
    }

    self->_primaryAppleIDObserving = 1;
    -[CUSystemMonitorImp _primaryAppleIDChanged2:](self, "_primaryAppleIDChanged2:", 1LL);
  }

- (void)_primaryAppleIDMonitorStop
{
  if (self->_primaryAppleIDObserving)
  {
    [MEMORY[0x189607860] defaultCenter];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 removeObserver:self name:@"com.apple.authkit.user-info-changed" object:0];
    int primaryAppleIDNotifyToken = self->_primaryAppleIDNotifyToken;
    if (primaryAppleIDNotifyToken != -1)
    {
      notify_cancel(primaryAppleIDNotifyToken);
      self->_int primaryAppleIDNotifyToken = -1;
    }

    self->_primaryAppleIDObserving = 0;
    primaryAppleID = self->_primaryAppleID;
    self->_primaryAppleID = 0LL;

    *(_WORD *)&self->_primaryAppleIDActive = 0;
  }

- (id)_primaryAppleIDAccount
{
  if (AppleAccountLibrary_sOnce_8049 != -1) {
    dispatch_once(&AppleAccountLibrary_sOnce_8049, &__block_literal_global_1021);
  }
  -[objc_class defaultStore](getACAccountStoreClass_8050(), "defaultStore");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_primaryAppleIDChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__CUSystemMonitorImp__primaryAppleIDChanged___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_primaryAppleIDChanged2:(BOOL)a3
{
  BOOL v7 = a3;
  if (!a3
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]",  0x1Eu,  (uint64_t)"PrimaryAppleID change notification\n",  v3,  v4,  v5,  v6,  v27);
  }

  uint64_t v9 = -[CUSystemMonitorImp _primaryAppleIDAccount](self, "_primaryAppleIDAccount");
  BOOL primaryAppleIDActive = self->_primaryAppleIDActive;
  self->_BOOL primaryAppleIDActive = v9 != 0;
  id v28 = (id)v9;
  if (v9 && !primaryAppleIDActive && self->_familyFailed)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]",  0x1Eu,  (uint64_t)"Family re-check on PrimaryAppleID active\n",  v10,  v11,  v12,  v13,  v27);
    }

    -[CUSystemMonitorImp _familyGetMembers:](self, "_familyGetMembers:", 0LL);
  }

  -[objc_class sharedInstance](getAKAccountManagerClass_8038(), "sharedInstance");
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 accountPropertyForKey:@"altDSID"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    && ([v15 authKitAccountWithAltDSID:v16 error:0], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = (void *)v17;
    int v19 = [v15 securityLevelForAccount:v17] == 4;
  }

  else
  {
    int v19 = 0;
  }

  [v28 username];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int v21 = self->_primaryAppleID;
  objc_storeStrong((id *)&self->_primaryAppleID, v20);
  int primaryAppleIDIsHSA2 = self->_primaryAppleIDIsHSA2;
  self->_int primaryAppleIDIsHSA2 = v19;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v7)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]",  0x1Eu,  (uint64_t)"PrimaryAppleID initial: %@, HSA2 %s\n",  v23,  v24,  v25,  v26,  (char)v20);
    }
  }

  else if (primaryAppleIDIsHSA2 == v19)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]",  0xAu,  (uint64_t)"PrimaryAppleID unchanged (%@, HSA2 %s)\n",  v23,  v24,  v25,  v26,  (char)v20);
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]",  0x1Eu,  (uint64_t)"PrimaryAppleID changed: %@, HSA2 %s -> %@, HSA2 %s\n",  v23,  v24,  v25,  v26,  (char)v21);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_199,  &__block_literal_global_200);
  }
}

- (void)_regionMonitorStart
{
  BOOL v7 = self->_regionCTClient;
  if (!v7)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorStart]",  0x1Eu,  (uint64_t)"Region monitor start",  v3,  v4,  v5,  v6,  v10);
    }

    BOOL v7 = (CoreTelephonyClient *)[objc_alloc(getCoreTelephonyClientClass()) initWithQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_regionCTClient, v7);
    -[CoreTelephonyClient setDelegate:](v7, "setDelegate:", self);
    -[CUSystemMonitorImp _regionMonitorGet](self, "_regionMonitorGet");
  }

  char v8 = self->_regionRoutineManager;
  if (!v8)
  {
    -[objc_class defaultManager](getRTRoutineManagerClass(), "defaultManager");
    char v8 = (RTRoutineManager *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_regionRoutineManager, v8);
    if (self->_regionRoutineNotifyToken == -1)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __41__CUSystemMonitorImp__regionMonitorStart__block_invoke;
      handler[3] = &unk_189F32EC8;
      handler[4] = self;
      notify_register_dispatch( "RTLocationsOfInterestDidChangeNotification",  &self->_regionRoutineNotifyToken,  dispatchQueue,  handler);
    }

    -[CUSystemMonitorImp _locationsOfInterestDidChange:](self, "_locationsOfInterestDidChange:", 0LL);
  }
}

- (void)_regionMonitorStop
{
  if (self->_regionCTClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorStop]",  0x1Eu,  (uint64_t)"Region monitor stop",  v2,  v3,  v4,  v5,  v15);
    }

    regionCTClient = self->_regionCTClient;
    self->_regionCTClient = 0LL;
  }

  regionCTServerCnx = self->_regionCTServerCnx;
  if (regionCTServerCnx)
  {
    CFRelease(regionCTServerCnx);
    self->_regionCTServerCnx = 0LL;
  }

  regionRoutineManager = self->_regionRoutineManager;
  if (regionRoutineManager)
  {
    self->_regionRoutineManager = 0LL;
  }

  int regionRoutineNotifyToken = self->_regionRoutineNotifyToken;
  if (regionRoutineNotifyToken != -1)
  {
    notify_cancel(regionRoutineNotifyToken);
    self->_int regionRoutineNotifyToken = -1;
  }

  pthread_mutex_lock(&gCUSystemMonitorLock);
  regionISOCountryCode = self->_regionISOCountryCode;
  self->_regionISOCountryCode = 0LL;

  regionMobileCountryCode = self->_regionMobileCountryCode;
  self->_regionMobileCountryCode = 0LL;

  regionRoutineCountry = self->_regionRoutineCountry;
  self->_regionRoutineCountry = 0LL;

  regionRoutineState = self->_regionRoutineState;
  self->_regionRoutineState = 0LL;

  pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (void)_regionMonitorGet
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]",  0x1Eu,  (uint64_t)"Region monitor get CT subscription context",  v2,  v3,  v4,  v5,  v9[0]);
  }

  regionCTClient = self->_regionCTClient;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __39__CUSystemMonitorImp__regionMonitorGet__block_invoke;
  v9[3] = &unk_189F324D8;
  v9[4] = self;
  void v9[5] = regionCTClient;
  char v8 = regionCTClient;
  -[CoreTelephonyClient getCurrentDataSubscriptionContext:](v8, "getCurrentDataSubscriptionContext:", v9);
}

- (void)_regionMonitorUpdateLocationsOfInterest:(id)a3
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603F50] distantPast];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v6 = v4;
  id v50 = (id)[v6 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v50)
  {
    v47 = self;
    obuint64_t j = v6;
    BOOL v7 = 0LL;
    uint64_t v49 = *(void *)v57;
    do
    {
      for (uint64_t i = 0LL; i != v50; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        [v9 visits];
        char v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v53;
          do
          {
            for (uint64_t j = 0LL; j != v12; ++j)
            {
              if (*(void *)v53 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v52 + 1) + 8 * j) entryDate];
              char v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v15 compare:v5] <= 1)
              {
                id v16 = v9;

                id v17 = v15;
                uint64_t v5 = v17;
                BOOL v7 = v16;
              }
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
          }

          while (v12);
        }
      }

      id v6 = obj;
      id v50 = (id)[obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }

    while (v50);

    if (v7)
    {
      uint64_t v22 = v47->_regionRoutineCountry;
      [v7 mapItem];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 address];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 country];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v26 = v22;
      id v51 = v25;
      char v27 = v25;
      id v28 = v27;
      if (v26 == v27)
      {
        int v29 = 1;
      }

      else if ((v26 == 0LL) == (v27 != 0LL))
      {
        int v29 = 0;
      }

      else
      {
        int v29 = -[NSString isEqual:](v26, "isEqual:", v27);
      }

      v30 = v47->_regionRoutineState;
      [v7 mapItem];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 address];
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 administrativeAreaCode];
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      int v34 = v30;
      int v35 = v33;
      v36 = v35;
      if (v34 == v35)
      {
        int v37 = 1;
      }

      else
      {
        if ((v34 == 0LL) == (v35 != 0LL))
        {

          LOBYTE(v37) = 0;
          goto LABEL_36;
        }

        int v37 = -[NSString isEqual:](v34, "isEqual:", v35);
      }

      if ((v29 & v37 & 1) != 0)
      {
        if (gLogCategory_CUSystemMonitor <= 10
          && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize( (uint64_t)&gLogCategory_CUSystemMonitor,  0xAu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]",  0xAu,  (uint64_t)"Region routine unchanged: Country %@, State %@",  v38,  v39,  v40,  v41,  (char)v28);
        }

- (void)_regionMonitorUpdateMCC:(id)a3
{
  id v5 = a3;
  id v6 = self->_regionMobileCountryCode;
  BOOL v7 = (NSString *)v5;
  char v8 = v6;
  uint64_t v9 = v8;
  if (v8 == v7)
  {
    int v10 = 1;
  }

  else if ((v7 == 0LL) == (v8 != 0LL))
  {
    int v10 = 0;
  }

  else
  {
    int v10 = -[NSString isEqual:](v7, "isEqual:", v8);
  }

  uint64_t v11 = self->_regionISOCountryCode;
  uint64_t v12 = v11;
  if (v10)
  {
    if (v7) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v14 = v13;
    goto LABEL_26;
  }

  if (!v7) {
    goto LABEL_25;
  }
  regionCTServerCnx = self->_regionCTServerCnx;
  if (!regionCTServerCnx)
  {
    int v35 = getprogname();
    NSPrintF();
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = (__CTServerConnection *)softLink_CTServerConnectionCreateOnTargetQueue( 0LL,  (uint64_t)v16,  self->_dispatchQueue,  0LL);
    if (v17)
    {
      regionCTServerCnx = v17;
      self->_regionCTServerCnx = v17;

      goto LABEL_15;
    }

    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]",  0x5Au,  (uint64_t)"### Region monitor CTServerConnectionCreate failed",  v18,  v19,  v20,  v21,  (char)v35);
    }

    self->_regionCTServerCnx = 0LL;

LABEL_25:
    uint64_t v14 = 0LL;
    goto LABEL_26;
  }

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_regionCTClient)
  {
    [v5 legacyInfo];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      char v7 = [v6 count];
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp cellMonitorUpdate:info:]",  0x1Eu,  (uint64_t)"Region monitor cell update: %d items",  v8,  v9,  v10,  v11,  v7);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v26 = self;
      char v15 = 0;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v18 objectForKeyedSubscript:getkCTCellMonitorMCC()];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uint64_t v20 = [v19 integerValue];
              if (v20 >= 1)
              {
                if (v20 != 0xFFFF)
                {
                  [v19 stringValue];
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CUSystemMonitorImp _regionMonitorUpdateMCC:](v26, "_regionMonitorUpdateMCC:", v25);

                  goto LABEL_24;
                }

                char v15 = 1;
              }
            }
          }
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }

      if ((v15 & 1) != 0)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp cellMonitorUpdate:info:]",  0x1Eu,  (uint64_t)"Region monitor mapping %d -> null (update)",  v21,  v22,  v23,  v24,  255);
        }

        -[CUSystemMonitorImp _regionMonitorUpdateMCC:](v26, "_regionMonitorUpdateMCC:", 0LL);
      }
    }

    else
    {
LABEL_24:
    }
  }
}

- (void)_locationsOfInterestDidChange:(BOOL)a3
{
  if (gLogCategory_CUSystemMonitor <= 30)
  {
    BOOL v8 = a3;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      uint64_t v9 = "(initial)";
      if (v8) {
        uint64_t v9 = "(changed)";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]",  0x1Eu,  (uint64_t)"Region monitor LOI fetch start %s",  v3,  v4,  v5,  v6,  (char)v9);
    }
  }

  [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:-1209600.0];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] now];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  regionRoutineManager = self->_regionRoutineManager;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke;
  v13[3] = &unk_189F32580;
  v13[4] = self;
  -[RTRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:]( regionRoutineManager,  "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:",  v10,  v11,  v13);
}

- (void)_rotatingIdentifierMonitorStart
{
  if (!self->_rotatingIdentifierTimer)
  {
    NSRandomData(6uLL, 0LL);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)&self->_rotatingIdentifierData, v3);
    id v4 = v3;
    uint64_t v5 = [v4 bytes];
    __int16 v6 = *(_WORD *)(v5 + 4);
    *(_DWORD *)self->_rotatingIdentifier48.bytes = *(_DWORD *)v5;
    *(_WORD *)&self->_rotatingIdentifier48.bytes[4] = v6;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      char v7 = [v4 bytes];
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierMonitorStart]",  0x1Eu,  (uint64_t)"Rotating identifier monitor start: %.6a\n",  v8,  v9,  v10,  v11,  v7);
    }

    id v12 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    rotatingIdentifierTimer = self->_rotatingIdentifierTimer;
    self->_rotatingIdentifierTimer = v12;

    uint64_t v14 = self->_rotatingIdentifierTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __53__CUSystemMonitorImp__rotatingIdentifierMonitorStart__block_invoke;
    handler[3] = &unk_189F34238;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v14, handler);
    char v15 = self->_rotatingIdentifierTimer;
    dispatch_time_t v16 = dispatch_time(0x8000000000000000LL, 1020000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v15, v16, 0xED7CBCD800uLL, 0xB2D05E00uLL);
    dispatch_activate((dispatch_object_t)self->_rotatingIdentifierTimer);
  }

- (void)_rotatingIdentifierMonitorStop
{
  rotatingIdentifierTimer = self->_rotatingIdentifierTimer;
  if (rotatingIdentifierTimer)
  {
    if (gLogCategory_CUSystemMonitor >= 31)
    {
      uint64_t v8 = rotatingIdentifierTimer;
LABEL_8:
      uint64_t v11 = v8;
      dispatch_source_cancel(v8);
      uint64_t v9 = self->_rotatingIdentifierTimer;
      self->_rotatingIdentifierTimer = 0LL;

      return;
    }

    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierMonitorStop]",  0x1Eu,  (uint64_t)"Rotating identifier monitor stop\n",  v2,  v3,  v4,  v5,  v10);
    }
    uint64_t v8 = self->_rotatingIdentifierTimer;
    if (v8) {
      goto LABEL_8;
    }
  }

- (void)_rotatingIdentifierTimerFired
{
  p_rotatingIdentifierData = &self->_rotatingIdentifierData;
  uint64_t v13 = self->_rotatingIdentifierData;
  NSRandomData(6uLL, 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)p_rotatingIdentifierData, v4);
  id v5 = v4;
  uint64_t v6 = [v5 bytes];
  __int16 v7 = *(_WORD *)(v6 + 4);
  *(_DWORD *)self->_rotatingIdentifier48.bytes = *(_DWORD *)v6;
  *(_WORD *)&self->_rotatingIdentifier48.bytes[4] = v7;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    char v8 = (char)-[NSData bytes](v13, "bytes");
    [v5 bytes];
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierTimerFired]",  0x1Eu,  (uint64_t)"Rotating identifier changed timer: %.6a -> %.6a\n",  v9,  v10,  v11,  v12,  v8);
  }

  -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_237,  &__block_literal_global_238);
}

- (void)_screenLockedMonitorStart
{
  if (self->_screenLockedToken == -1)
  {
    p_int screenLockedToken = &self->_screenLockedToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStart]",  0x1Eu,  (uint64_t)"ScreenLocked monitoring start\n",  v2,  v3,  v4,  v5,  v17);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __47__CUSystemMonitorImp__screenLockedMonitorStart__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.lockstate", p_screenLockedToken, dispatchQueue, handler);
    int screenLockedToken = self->_screenLockedToken;
    uint64_t state64 = 0LL;
    notify_get_state(screenLockedToken, &state64);
    uint64_t v10 = state64;
    BOOL v11 = state64 != 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_screenLocked = v11;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      dispatch_time_t v16 = "no";
      if (v10) {
        dispatch_time_t v16 = "yes";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStart]",  0x1Eu,  (uint64_t)"ScreenLocked initial: %s\n",  v12,  v13,  v14,  v15,  (char)v16);
    }
  }

- (void)_screenLockedMonitorStop
{
  int screenLockedToken = self->_screenLockedToken;
  if (screenLockedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStop]",  0x1Eu,  (uint64_t)"ScreenLocked monitoring stop\n",  v2,  v3,  v4,  v5,  v8);
    }
    int screenLockedToken = self->_screenLockedToken;
    if (screenLockedToken != -1)
    {
LABEL_7:
      notify_cancel(screenLockedToken);
      self->_int screenLockedToken = -1;
    }
  }

  self->_screenLocked = 1;
}

- (void)_screenLockedChanged
{
  int screenLockedToken = self->_screenLockedToken;
  uint64_t state64 = 0LL;
  notify_get_state(screenLockedToken, &state64);
  uint64_t v4 = state64;
  int v5 = state64 != 0;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int screenLocked = self->_screenLocked;
  self->_int screenLocked = v5;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (screenLocked == v5)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      BOOL v11 = "no";
      if (v4) {
        BOOL v11 = "yes";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenLockedChanged]",  0xAu,  (uint64_t)"ScreenLocked unchanged (%s)\n",  v7,  v8,  v9,  v10,  (char)v11);
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (screenLocked) {
        uint64_t v12 = "yes";
      }
      else {
        uint64_t v12 = "no";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenLockedChanged]",  0x1Eu,  (uint64_t)"ScreenLocked changed: %s -> %s\n",  v7,  v8,  v9,  v10,  (char)v12);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_245,  &__block_literal_global_246);
  }

- (void)_screenOnMonitorStartiOS
{
  if (self->_screenBlankedToken == -1)
  {
    p_int screenBlankedToken = &self->_screenBlankedToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStartiOS]",  0x1Eu,  (uint64_t)"ScreenOn monitoring start\n",  v2,  v3,  v4,  v5,  v17);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __46__CUSystemMonitorImp__screenOnMonitorStartiOS__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", p_screenBlankedToken, dispatchQueue, handler);
    int screenBlankedToken = self->_screenBlankedToken;
    uint64_t state64 = 0LL;
    notify_get_state(screenBlankedToken, &state64);
    uint64_t v10 = state64;
    BOOL v11 = state64 == 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_screenOn = v11;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      dispatch_time_t v16 = "off";
      if (!v10) {
        dispatch_time_t v16 = "on";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStartiOS]",  0x1Eu,  (uint64_t)"ScreenOn initial: %s\n",  v12,  v13,  v14,  v15,  (char)v16);
    }
  }

- (void)_screenOnMonitorStop
{
  int screenBlankedToken = self->_screenBlankedToken;
  if (screenBlankedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStop]",  0x1Eu,  (uint64_t)"ScreenOn monitoring stop\n",  v2,  v3,  v4,  v5,  v8);
    }
    int screenBlankedToken = self->_screenBlankedToken;
    if (screenBlankedToken != -1)
    {
LABEL_7:
      notify_cancel(screenBlankedToken);
      self->_int screenBlankedToken = -1;
    }
  }

- (void)_screenChanged:(BOOL)a3
{
  int v3 = a3;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int screenOn = self->_screenOn;
  self->_int screenOn = v3;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (screenOn == v3)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      uint64_t v10 = "off";
      if (v3) {
        uint64_t v10 = "on";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenChanged:]",  0xAu,  (uint64_t)"ScreenOn unchanged (%s)\n",  v6,  v7,  v8,  v9,  (char)v10);
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (screenOn) {
        BOOL v11 = "on";
      }
      else {
        BOOL v11 = "off";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenChanged:]",  0x1Eu,  (uint64_t)"ScreenOn changed: %s -> %s\n",  v6,  v7,  v8,  v9,  (char)v11);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_255,  &__block_literal_global_256);
  }

- (void)_screenSaverMonitorStart
{
  if (self->_screenSaverToken == -1)
  {
    p_int screenSaverToken = &self->_screenSaverToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenSaverMonitorStart]",  0x1Eu,  (uint64_t)"ScreenSaver monitoring start\n",  v2,  v3,  v4,  v5,  v17);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __46__CUSystemMonitorImp__screenSaverMonitorStart__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.appletv.backgroundstate", p_screenSaverToken, dispatchQueue, handler);
    int screenSaverToken = self->_screenSaverToken;
    uint64_t state64 = 0LL;
    notify_get_state(screenSaverToken, &state64);
    uint64_t v10 = state64;
    BOOL v11 = state64 != 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_screenSaverActive = v11;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      dispatch_time_t v16 = "off";
      if (v10) {
        dispatch_time_t v16 = "on";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenSaverMonitorStart]",  0x1Eu,  (uint64_t)"ScreenSaver initial: %s\n",  v12,  v13,  v14,  v15,  (char)v16);
    }
  }

- (void)_screenSaverMonitorStop
{
  int screenSaverToken = self->_screenSaverToken;
  if (screenSaverToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenSaverMonitorStop]",  0x1Eu,  (uint64_t)"ScreenSaver monitoring stop\n",  v2,  v3,  v4,  v5,  v8);
    }
    int screenSaverToken = self->_screenSaverToken;
    if (screenSaverToken != -1)
    {
LABEL_7:
      notify_cancel(screenSaverToken);
      self->_int screenSaverToken = -1;
    }
  }

  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_screenSaverActive = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (void)_screenStateMonitorStart
{
  if (!self->_screenStateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]",  0x1Eu,  (uint64_t)"ScreenState monitor start",  v2,  v3,  v4,  v5,  v18);
    }

    -[objc_class configurationForDefaultMainDisplayMonitor]( getFBSDisplayLayoutMonitorConfigurationClass(),  "configurationForDefaultMainDisplayMonitor");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v7;
    if (v7)
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke;
      v19[3] = &unk_189F326A8;
      v19[4] = self;
      [v7 setTransitionHandler:v19];
      -[objc_class monitorWithConfiguration:](getFBSDisplayLayoutMonitorClass(), "monitorWithConfiguration:", v12);
      char v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_storeStrong((id *)&self->_screenStateMonitor, v17);
      }

      else if (gLogCategory_CUSystemMonitor <= 90 {
             && (gLogCategory_CUSystemMonitor != -1
      }
              || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]",  0x5Au,  (uint64_t)"### ScreenState no monitor",  v13,  v14,  v15,  v16,  v18);
      }
    }

    else if (gLogCategory_CUSystemMonitor <= 90 {
           && (gLogCategory_CUSystemMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]",  0x5Au,  (uint64_t)"### ScreenState no monitor config",  v8,  v9,  v10,  v11,  v18);
    }
  }

- (void)_screenStateMonitorStop
{
  if (self->_screenStateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStop]",  0x1Eu,  (uint64_t)"ScreenState monitor stop",  v2,  v3,  v4,  v5,  v8);
    }

    -[FBSDisplayLayoutMonitor invalidate](self->_screenStateMonitor, "invalidate");
    screenStateMonitor = self->_screenStateMonitor;
    self->_screenStateMonitor = 0LL;

    self->_screenState = 0;
  }

- (void)_screenStateMonitorUpdateWithLayout:(id)a3
{
  id v14 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v8 = [v14 backlightState];
    if (v8 >= 4) {
      int v9 = 0;
    }
    else {
      int v9 = dword_186B49D10[v8];
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor > 30)
    {
      int v9 = 0;
      goto LABEL_28;
    }

    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorUpdateWithLayout:]",  0x1Eu,  (uint64_t)"ScreenState update no layout/backlight",  v4,  v5,  v6,  v7,  v13);
    }
    int v9 = 0;
  }

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    int screenState = self->_screenState;
    if (screenState <= 19)
    {
      if (!screenState)
      {
        uint64_t v11 = @"Unknown";
        goto LABEL_27;
      }

      if (screenState == 10)
      {
        uint64_t v11 = @"Off";
        goto LABEL_27;
      }
    }

    else
    {
      switch(screenState)
      {
        case 20:
          uint64_t v11 = @"InactiveOn";
          goto LABEL_27;
        case 30:
          uint64_t v11 = @"ActiveDimmed";
          goto LABEL_27;
        case 40:
          uint64_t v11 = @"ActiveOn";
LABEL_27:
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorUpdateWithLayout:]",  0x1Eu,  (uint64_t)"ScreenState changed: %@ -> %@ (raw %d)",  v4,  v5,  v6,  v7,  (char)v11);
          goto LABEL_28;
      }
    }

    uint64_t v11 = @"?";
    goto LABEL_27;
  }

- (void)_systemConfigUpdateKeyPtr:(id *)a3 name:(id)a4 enabled:(BOOL)a5 creator:(id)a6
{
  BOOL v7 = a5;
  id v21 = a4;
  id v14 = (void (**)(void))a6;
  id v15 = *a3;
  if (v7)
  {
    if (!v15)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]",  0x1Eu,  (uint64_t)"SystemConfig monitoring add: %@\n",  v10,  v11,  v12,  v13,  (char)v21);
      }

      v14[2](v14);
      char v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(a3, v17);
      self->_scChangesPending = 1;
      scInitialKeys = self->_scInitialKeys;
      if (!scInitialKeys)
      {
        uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v20 = self->_scInitialKeys;
        self->_scInitialKeys = v19;

        scInitialKeys = self->_scInitialKeys;
      }

      -[NSMutableArray addObject:](scInitialKeys, "addObject:", v17);
    }
  }

  else if (v15)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]",  0x1Eu,  (uint64_t)"SystemConfig monitoring remove: %@\n",  v10,  v11,  v12,  v13,  (char)v21);
    }

    id v16 = *a3;
    *a3 = 0LL;

    self->_scChangesPending = 1;
  }
}

- (void)_systemConfigUpdateNotifications
{
  scPatternNetInterfaceIPuint64_t v4 = self->_scPatternNetInterfaceIPv4;
  if (scPatternNetInterfaceIPv4)
  {
    uint64_t v4 = (objc_class *)MEMORY[0x189603FA8];
    uint64_t v5 = scPatternNetInterfaceIPv4;
    id v6 = objc_alloc_init(v4);
    [v6 addObject:v5];

    BOOL v7 = self->_scPatternNetInterfaceIPv6;
    if (!v7) {
      goto LABEL_8;
    }
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  BOOL v7 = self->_scPatternNetInterfaceIPv6;
  if (v7)
  {
LABEL_6:
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
LABEL_7:
    [v6 addObject:v7];
    goto LABEL_8;
  }

  id v6 = 0LL;
LABEL_8:

  scKeySystemName = self->_scKeySystemName;
  if (scKeySystemName)
  {
    int v9 = (objc_class *)MEMORY[0x189603FA8];
    uint64_t v10 = scKeySystemName;
    id v11 = objc_alloc_init(v9);
    [v11 addObject:v10];
  }

  else
  {
    id v11 = 0LL;
  }

  if (![v11 count] && !objc_msgSend(v6, "count"))
  {
    if (self->_scDynamicStore)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]",  0x1Eu,  (uint64_t)"SystemConfig monitoring stop\n",  v12,  v13,  v14,  v15,  v52);
      }

      SCDynamicStoreSetDispatchQueue(self->_scDynamicStore, 0LL);
      scDynamicStore = self->_scDynamicStore;
      if (scDynamicStore)
      {
        CFRelease(scDynamicStore);
        self->_scDynamicStore = 0LL;
      }
    }

    scNotificationKeys = self->_scNotificationKeys;
    self->_scNotificationKeys = 0LL;

    scNotificationPatterns = self->_scNotificationPatterns;
    self->_scNotificationPatterns = 0LL;

    goto LABEL_57;
  }

  id v16 = self->_scDynamicStore;
  if (!v16)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]",  0x1Eu,  (uint64_t)"SystemConfig monitoring start\n",  v12,  v13,  v14,  v15,  v52);
    }

    getprogname();
    NSPrintF();
    char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    context.version = 0LL;
    memset(&context.retain, 0, 24);
    context.info = self;
    char v18 = SCDynamicStoreCreate(0LL, v17, (SCDynamicStoreCallBack)_systemConfigChanged, &context);
    if (!v18)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        char v24 = SCError();
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]",  0x5Au,  (uint64_t)"### SCDynamicStoreCreate failed: %#m\n",  v25,  v26,  v27,  v28,  v24);
      }

      goto LABEL_61;
    }

    id v16 = v18;
    self->_scDynamicStore = v18;
    if (!SCDynamicStoreSetDispatchQueue(v18, (dispatch_queue_t)self->_dispatchQueue)
      && gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      char v19 = SCError();
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]",  0x5Au,  (uint64_t)"### SCDynamicStoreSetDispatchQueue failed: %#m\n",  v20,  v21,  v22,  v23,  v19);
    }
  }

  uint64_t v32 = self->_scNotificationKeys;
  v33 = (NSArray *)v11;
  char v34 = v32;
  if (v33 == v34)
  {

    goto LABEL_44;
  }

  int v35 = v34;
  if ((v33 == 0LL) == (v34 != 0LL))
  {
    uint64_t v42 = v33;
LABEL_49:

    goto LABEL_50;
  }

  int v36 = -[NSArray isEqual:](v33, "isEqual:", v34);

  if (v36)
  {
LABEL_44:
    uint64_t v41 = self->_scNotificationPatterns;
    uint64_t v42 = (NSArray *)v6;
    uint64_t v43 = v41;
    if (v42 == v43)
    {

LABEL_57:
      scInitialKeys = self->_scInitialKeys;
      if (scInitialKeys)
      {
        -[CUSystemMonitorImp _systemConfigChanged:initial:](self, "_systemConfigChanged:initial:", scInitialKeys, 1LL);
        char v46 = self->_scInitialKeys;
      }

      else
      {
        char v46 = 0LL;
      }

      self->_scInitialKeys = 0LL;

      self->_scChangesPending = 0;
      goto LABEL_61;
    }

    int v35 = v43;
    if ((v42 == 0LL) != (v43 != 0LL))
    {
      char v44 = -[NSArray isEqual:](v42, "isEqual:", v43);

      if ((v44 & 1) != 0) {
        goto LABEL_57;
      }
      goto LABEL_50;
    }

    goto LABEL_49;
  }

- (void)_systemConfigChanged:(id)a3 initial:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    BOOL v19 = v4;
    char v9 = 0;
    char v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 hasPrefix:@"State:/Network/Interface/"])
        {
          char v10 = 1;
        }

        else if ((-[NSString isEqual:](self->_scKeySystemName, "isEqual:", v13) & 1) != 0)
        {
          char v9 = 1;
        }

        else if (gLogCategory_CUSystemMonitor <= 30 {
               && (gLogCategory_CUSystemMonitor != -1
        }
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigChanged:initial:]",  0x1Eu,  (uint64_t)"SystemConfig unknown key changed: '%@'\n",  v14,  v15,  v16,  v17,  (char)v13);
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
    if ((v10 & 1) != 0)
    {
      BOOL v18 = v19;
      -[CUSystemMonitorImp _systemConfigNetInterfaceChanged:initial:]( self,  "_systemConfigNetInterfaceChanged:initial:",  v6,  v19);
      if ((v9 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }

    BOOL v18 = v19;
    if ((v9 & 1) != 0) {
LABEL_20:
    }
      -[CUSystemMonitorImp _systemConfigSystemNameChanged:](self, "_systemConfigSystemNameChanged:", v18);
  }

- (void)_systemConfigNetInterfaceChanged:(id)a3 initial:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v11 = v6;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigNetInterfaceChanged:initial:]",  0x1Eu,  (uint64_t)"NetInterfaces changed: %##@\n",  v7,  v8,  v9,  v10,  (char)v11);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_290,  &__block_literal_global_291);
    id v6 = v11;
  }
}

- (void)_systemConfigSystemNameChanged:(BOOL)a3
{
  uint64_t v5 = (__CFString *)SCDynamicStoreCopyComputerName(0LL, 0LL);
  obuint64_t j = v5;
  if (a3)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]",  0x1Eu,  (uint64_t)"SystemName initial: '%@'\n",  v6,  v7,  v8,  v9,  (char)obj);
    }

- (void)_systemLockStateMonitorStart
{
  if (self->_systemLockStateToken == -1)
  {
    p_systemLockStateToken = &self->_systemLockStateToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemLockStateMonitorStart]",  0x1Eu,  (uint64_t)"SystemLockState monitoring start\n",  v2,  v3,  v4,  v5,  v10);
    }

    uint64_t v8 = (const char *)*MEMORY[0x189611578];
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __50__CUSystemMonitorImp__systemLockStateMonitorStart__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch(v8, p_systemLockStateToken, dispatchQueue, handler);
    -[CUSystemMonitorImp _systemLockStateUpdate:](self, "_systemLockStateUpdate:", 1LL);
  }

- (void)_systemLockStateMonitorStop
{
  int systemLockStateToken = self->_systemLockStateToken;
  if (systemLockStateToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemLockStateMonitorStop]",  0x1Eu,  (uint64_t)"SystemLockState monitoring stop\n",  v2,  v3,  v4,  v5,  v8);
    }
    int systemLockStateToken = self->_systemLockStateToken;
    if (systemLockStateToken != -1)
    {
LABEL_7:
      notify_cancel(systemLockStateToken);
      self->_int systemLockStateToken = -1;
    }
  }

- (void)_systemLockStateUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = MKBGetDeviceLockState();
  if (v5 <= 4) {
    int v6 = 4 - v5;
  }
  else {
    int v6 = 0;
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t systemLockState = self->_systemLockState;
  self->_uint64_t systemLockState = v6;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v3)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]",  0x1Eu,  (uint64_t)"SystemLockState initial: %s\n",  v8,  v9,  v10,  v11,  (char)off_189F32B28[v6]);
    }
  }

  else if (v6 == (_DWORD)systemLockState)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]",  0xAu,  (uint64_t)"SystemLockState unchanged: %s\n",  v8,  v9,  v10,  v11,  (char)off_189F32B28[v6]);
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      else {
        uint64_t v12 = off_189F32B28[systemLockState];
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]",  0x1Eu,  (uint64_t)"SystemLockState changed: %s -> %s\n",  v8,  v9,  v10,  v11,  (char)v12);
    }

    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_302,  &__block_literal_global_303);
  }

- (void)_systemUIMonitorStart
{
  v28[10] = *MEMORY[0x1895F89C0];
  BOOL v3 = self->_systemUIIdentifierMap;
  if (!v3)
  {
    uint64_t v4 = getFBSDisplayLayoutElementControlCenterIdentifier();
    unsigned int v5 = (void *)v4;
    int v6 = @"com.apple.control-center";
    if (v4) {
      int v6 = (const __CFString *)v4;
    }
    v27[0] = v6;
    v28[0] = &unk_189F52410;
    uint64_t v7 = getFBSDisplayLayoutElementLockScreenIdentifier();
    uint64_t v8 = (void *)v7;
    uint64_t v9 = @"com.apple.lock-screen";
    if (v7) {
      uint64_t v9 = (const __CFString *)v7;
    }
    v27[1] = v9;
    v28[1] = &unk_189F52428;
    uint64_t v10 = getFBSDisplayLayoutElementNotificationCenterIdentifier();
    uint64_t v11 = (void *)v10;
    uint64_t v12 = @"com.apple.notification-center";
    if (v10) {
      uint64_t v12 = (const __CFString *)v10;
    }
    v27[2] = v12;
    v28[2] = &unk_189F52440;
    uint64_t v13 = getFBSDisplayLayoutElementSiriIdentifier();
    char v14 = (void *)v13;
    uint64_t v15 = @"com.apple.Siri";
    if (v13) {
      uint64_t v15 = (const __CFString *)v13;
    }
    v27[3] = v15;
    v27[4] = @"com.apple.camera";
    v28[3] = &unk_189F52458;
    v28[4] = &unk_189F52470;
    v27[5] = @"com.apple.CoreAuthUI";
    v27[6] = @"com.apple.InCallService";
    v28[5] = &unk_189F52488;
    v28[6] = &unk_189F524A0;
    v27[7] = @"com.apple.SharingViewService";
    v27[8] = @"SBSpotlightAlert";
    v28[7] = &unk_189F524B8;
    v28[8] = &unk_189F524D0;
    v27[9] = @"SBVoiceControlAlert";
    v28[9] = &unk_189F524E8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:10];
    BOOL v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_systemUIIdentifierMap, v3);
  }

  uint64_t v16 = self->_systemUIMonitor;
  if (!v16)
  {
    if (getFBSDisplayLayoutMonitorConfigurationClass() && getFBSDisplayLayoutMonitorClass())
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStart]",  0x1Eu,  (uint64_t)"SystemUI monitoring start",  v17,  v18,  v19,  v20,  v23[0]);
      }

      -[objc_class configurationForDefaultMainDisplayMonitor]( getFBSDisplayLayoutMonitorConfigurationClass(),  "configurationForDefaultMainDisplayMonitor");
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke;
      v24[3] = &unk_189F327D0;
      uint64_t v25 = v3;
      uint64_t v26 = self;
      [v21 setTransitionHandler:v24];
      -[objc_class monitorWithConfiguration:](getFBSDisplayLayoutMonitorClass(), "monitorWithConfiguration:", v21);
      uint64_t v16 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_systemUIMonitor, v16);
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  if (self->_systemUIBluetoothNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_3;
    v23[3] = &unk_189F32EC8;
    v23[4] = self;
    notify_register_dispatch( "com.apple.bluetooth.systemFlags",  &self->_systemUIBluetoothNotifyToken,  dispatchQueue,  v23);
  }
}

- (void)_systemUIMonitorStop
{
  if (self->_systemUIMonitor
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStop]",  0x1Eu,  (uint64_t)"SystemUI monitoring stop",  v2,  v3,  v4,  v5,  v10);
  }

  -[FBSDisplayLayoutMonitor invalidate](self->_systemUIMonitor, "invalidate");
  systemUIMonitor = self->_systemUIMonitor;
  self->_systemUIMonitor = 0LL;

  systemUIIdentifierMap = self->_systemUIIdentifierMap;
  self->_systemUIIdentifierMap = 0LL;

  int systemUIBluetoothNotifyToken = self->_systemUIBluetoothNotifyToken;
  if (systemUIBluetoothNotifyToken != -1)
  {
    notify_cancel(systemUIBluetoothNotifyToken);
    self->_int systemUIBluetoothNotifyToken = -1;
  }

- (void)_systemUIMonitorChangedFlags:(unsigned int)a3
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    NSPrintF();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorChangedFlags:]",  0x1Eu,  (uint64_t)"SystemUI changed: %@, diff %@",  v6,  v7,  v8,  v9,  (char)v5);
  }

  unsigned int systemUIFlags = self->_systemUIFlags;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_unsigned int systemUIFlags = a3;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (systemUIFlags != a3) {
    -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_340_7942,  &__block_literal_global_341);
  }
}

- (void)_firstUnlockMonitorStart
{
  if (!self->_firstUnlocked && self->_firstUnlockToken == -1)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorStart]",  0x1Eu,  (uint64_t)"FirstUnlock monitoring start\n",  v2,  v3,  v4,  v5,  v9);
    }

    uint64_t v7 = (const char *)*MEMORY[0x189611578];
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __46__CUSystemMonitorImp__firstUnlockMonitorStart__block_invoke;
    handler[3] = &unk_189F32EC8;
    handler[4] = self;
    notify_register_dispatch(v7, &self->_firstUnlockToken, dispatchQueue, handler);
    -[CUSystemMonitorImp _firstUnlockMonitorCheck:](self, "_firstUnlockMonitorCheck:", 1LL);
  }

- (void)_firstUnlockMonitorStop
{
  int firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorStop]",  0x1Eu,  (uint64_t)"FirstUnlock monitoring stop\n",  v2,  v3,  v4,  v5,  v10);
    }
    int firstUnlockToken = self->_firstUnlockToken;
    if (firstUnlockToken != -1)
    {
LABEL_7:
      notify_cancel(firstUnlockToken);
      self->_int firstUnlockToken = -1;
    }
  }

  firstUnlockTimer = self->_firstUnlockTimer;
  if (firstUnlockTimer)
  {
    uint64_t v11 = firstUnlockTimer;
    dispatch_source_cancel(v11);
    char v9 = self->_firstUnlockTimer;
    self->_firstUnlockTimer = 0LL;
  }

- (void)_firstUnlockMonitorCheck:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = MKBDeviceUnlockedSinceBoot();
  BOOL v10 = v5 == 1;
  if (v3)
  {
    int v11 = v5;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v12 = "no";
      if (v11 == 1) {
        uint64_t v12 = "yes";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]",  0x1Eu,  (uint64_t)"FirstUnlock initial: %s\n",  v6,  v7,  v8,  v9,  (char)v12);
    }

    if (v11 == 1) {
      goto LABEL_13;
    }
  }

  else
  {
    if (v5 == 1)
    {
LABEL_13:
      pthread_mutex_lock(&gCUSystemMonitorLock);
      self->_firstUnlocked = v10;
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (!v3)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]",  0x1Eu,  (uint64_t)"FirstUnlock changed: No -> Yes\n",  v13,  v14,  v15,  v16,  v22);
        }

        -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_347,  &__block_literal_global_348);
      }

      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]",  0x1Eu,  (uint64_t)"FirstUnlock monitoring stop after unlock\n",  v13,  v14,  v15,  v16,  v22);
      }

      int firstUnlockToken = self->_firstUnlockToken;
      if (firstUnlockToken != -1)
      {
        notify_cancel(firstUnlockToken);
        self->_int firstUnlockToken = -1;
      }

      firstUnlockTimer = self->_firstUnlockTimer;
      if (firstUnlockTimer)
      {
        uint64_t v19 = firstUnlockTimer;
        dispatch_source_cancel(v19);
        uint64_t v20 = self->_firstUnlockTimer;
        self->_firstUnlockTimer = 0LL;
      }

      if (v3)
      {
        dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_3;
        block[3] = &unk_189F34238;
        block[4] = self;
        dispatch_async(dispatchQueue, block);
      }

      else
      {
        -[CUSystemMonitorImp _update](self, "_update");
      }

      return;
    }

    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]",  0xAu,  (uint64_t)"FirstUnlock unchanged (No)\n",  v6,  v7,  v8,  v9,  v24);
    }
  }

- (void)_wifiMonitorStart
{
  if (!self->_wifiManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStart]",  0x1Eu,  (uint64_t)"WiFi monitoring start\n",  v2,  v3,  v4,  v5,  v11[0]);
    }

    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___CUWiFiManager);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v7;

    -[CUWiFiManager setControlFlags:]( self->_wifiManager,  "setControlFlags:",  -[CUWiFiManager controlFlags](self->_wifiManager, "controlFlags") | 0x100);
    -[CUWiFiManager setDispatchQueue:](self->_wifiManager, "setDispatchQueue:", self->_dispatchQueue);
    -[CUWiFiManager setLabel:](self->_wifiManager, "setLabel:", @"SysMon");
    uint64_t v9 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke;
    v12[3] = &unk_189F34238;
    v12[4] = self;
    -[CUWiFiManager setWifiStateChangedHandler:](self->_wifiManager, "setWifiStateChangedHandler:", v12);
    BOOL v10 = self->_wifiManager;
    v11[0] = v9;
    v11[1] = 3221225472LL;
    v11[2] = __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke_2;
    v11[3] = &unk_189F32878;
    v11[4] = self;
    -[CUWiFiManager activateWithCompletion:](v10, "activateWithCompletion:", v11);
  }

- (void)_wifiMonitorStop
{
  if (self->_wifiManager
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStop]",  0x1Eu,  (uint64_t)"WiFi monitoring stop\n",  v2,  v3,  v4,  v5,  v8);
  }

  -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0LL;
}

- (void)_wifiMonitorStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[CUWiFiManager wifiFlags](self->_wifiManager, "wifiFlags");
  int v6 = -[CUWiFiManager wifiState](self->_wifiManager, "wifiState");
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unsigned int wifiFlags = self->_wifiFlags;
  int wifiState = self->_wifiState;
  self->_unsigned int wifiFlags = v5;
  self->_int wifiState = v6;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v6 != wifiState || v5 != wifiFlags)
  {
    if (v3)
    {
      if (gLogCategory_CUSystemMonitor > 30
        || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        goto LABEL_76;
      }

      if (wifiState <= 19)
      {
        if (!wifiState)
        {
          uint64_t v14 = "Unknown";
          goto LABEL_75;
        }

        if (wifiState == 10)
        {
          uint64_t v14 = "Off";
          goto LABEL_75;
        }
      }

      else
      {
        switch(wifiState)
        {
          case 20:
            uint64_t v14 = "NotConnected";
            goto LABEL_75;
          case 30:
            uint64_t v14 = "Connecting";
            goto LABEL_75;
          case 40:
            uint64_t v14 = "Connected";
LABEL_75:
            LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]",  0x1Eu,  (uint64_t)"WiFi state changed: %s -> %s, %#{flags}\n",  v9,  v10,  v11,  v12,  (char)v14);
            goto LABEL_76;
        }
      }

      uint64_t v14 = "?";
      goto LABEL_75;
    }

    if (gLogCategory_CUSystemMonitor > 30
      || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      goto LABEL_76;
    }

    if (v6 <= 19)
    {
      if (!v6)
      {
        uint64_t v16 = "Unknown";
        goto LABEL_70;
      }

      if (v6 == 10)
      {
        uint64_t v16 = "Off";
        goto LABEL_70;
      }
    }

    else
    {
      switch(v6)
      {
        case 20:
          uint64_t v16 = "NotConnected";
          goto LABEL_70;
        case 30:
          uint64_t v16 = "Connecting";
          goto LABEL_70;
        case 40:
          uint64_t v16 = "Connected";
LABEL_70:
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]",  0x1Eu,  (uint64_t)"WiFi state initial: %s, %#{flags}\n",  v9,  v10,  v11,  v12,  (char)v16);
LABEL_76:
          -[CUSystemMonitorImp _invokeBlock:passingTest:]( self,  "_invokeBlock:passingTest:",  &__block_literal_global_360,  &__block_literal_global_361);
          return;
      }
    }

    uint64_t v16 = "?";
    goto LABEL_70;
  }

  if (!v3)
  {
    if (gLogCategory_CUSystemMonitor > 30
      || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      return;
    }

    if (v6 <= 19)
    {
      if (!v6)
      {
        uint64_t v17 = "Unknown";
        goto LABEL_73;
      }

      if (v6 == 10)
      {
        uint64_t v17 = "Off";
        goto LABEL_73;
      }
    }

    else
    {
      switch(v6)
      {
        case 20:
          uint64_t v17 = "NotConnected";
          goto LABEL_73;
        case 30:
          uint64_t v17 = "Connecting";
          goto LABEL_73;
        case 40:
          uint64_t v17 = "Connected";
LABEL_73:
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]",  0x1Eu,  (uint64_t)"WiFi state initial: %s\n",  v9,  v10,  v11,  v12,  (char)v17);
          return;
      }
    }

    uint64_t v17 = "?";
    goto LABEL_73;
  }

  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    if (v6 <= 19)
    {
      if (!v6)
      {
        uint64_t v15 = "Unknown";
        goto LABEL_67;
      }

      if (v6 == 10)
      {
        uint64_t v15 = "Off";
        goto LABEL_67;
      }
    }

    else
    {
      switch(v6)
      {
        case 20:
          uint64_t v15 = "NotConnected";
          goto LABEL_67;
        case 30:
          uint64_t v15 = "Connecting";
          goto LABEL_67;
        case 40:
          uint64_t v15 = "Connected";
LABEL_67:
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]",  0xAu,  (uint64_t)"WiFi state unchanged: %s, %#{flags}\n",  v9,  v10,  v11,  v12,  (char)v15);
          return;
      }
    }

    uint64_t v15 = "?";
    goto LABEL_67;
  }

- (void).cxx_destruct
{
}

BOOL __47__CUSystemMonitorImp__wifiMonitorStateChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__wifiMonitorStateChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 wifiStateChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wifiMonitorStateChanged:1];
}

void __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7
    && gLogCategory_CUSystemMonitor <= 90
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStart]_block_invoke_2",  0x5Au,  (uint64_t)"### WiFi monitoring start failed: %{error}\n",  v3,  v4,  v5,  v6,  (char)v7);
  }

  [*(id *)(a1 + 32) _wifiMonitorStateChanged:0];
}

uint64_t __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

BOOL __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 firstUnlockHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __46__CUSystemMonitorImp__firstUnlockMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _firstUnlockMonitorCheck:0];
}

BOOL __51__CUSystemMonitorImp__systemUIMonitorChangedFlags___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __51__CUSystemMonitorImp__systemUIMonitorChangedFlags___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 systemUIChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

void __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  [a3 elements];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v10 identifier];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = v12;
          BOOL v14 = v12 != 0LL;
          if (v12) {
            v7 |= [v12 unsignedIntValue];
          }
        }

        else
        {
          BOOL v14 = 0;
        }

        [v10 bundleIdentifier];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          && ([*(id *)(a1 + 32) objectForKeyedSubscript:v19],
              (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
        {
          __int128 v21 = v20;
          v7 |= [v20 unsignedIntValue];
        }

        else if (!v14 {
               && gLogCategory_CUSystemMonitor <= 30
        }
               && (gLogCategory_CUSystemMonitor != -1
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStart]_block_invoke",  0x1Eu,  (uint64_t)"SystemUI unknown identifier: '%@' / '%@'",  v15,  v16,  v17,  v18,  (char)v11);
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v6);
  }

  else
  {
    int v7 = 0;
  }

  uint64_t v22 = *(void *)(a1 + 40);
  __int128 v23 = *(dispatch_queue_s **)(v22 + 8);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_2;
  block[3] = &unk_189F32F60;
  block[4] = v22;
  int v25 = v7;
  dispatch_async(v23, block);
}

uint64_t __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_3(uint64_t a1, int token)
{
  uint64_t state64 = 0LL;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) _systemUIMonitorChangedFlags:*(_DWORD *)(*(void *)(a1 + 32) + 548) & 0xFFFBFFFF | ((state64 & 1) << 18)];
}

uint64_t __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _systemUIMonitorChangedFlags:*(_DWORD *)(*(void *)(a1 + 32) + 548) & 0x40000u | *(_DWORD *)(a1 + 40)];
}

BOOL __45__CUSystemMonitorImp__systemLockStateUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __45__CUSystemMonitorImp__systemLockStateUpdate___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 systemLockStateChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __50__CUSystemMonitorImp__systemLockStateMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _systemLockStateUpdate:0];
}

BOOL __53__CUSystemMonitorImp__systemConfigSystemNameChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __53__CUSystemMonitorImp__systemConfigSystemNameChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 systemNameChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

BOOL __63__CUSystemMonitorImp__systemConfigNetInterfaceChanged_initial___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __63__CUSystemMonitorImp__systemConfigNetInterfaceChanged_initial___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 netInterfacesChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

BOOL __58__CUSystemMonitorImp__screenStateMonitorUpdateWithLayout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __58__CUSystemMonitorImp__screenStateMonitorUpdateWithLayout___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 screenStateChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

void __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(dispatch_queue_s **)(v5 + 8);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke_2;
  v8[3] = &unk_189F33088;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void *__46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[57]) {
    return (void *)[result _screenStateMonitorUpdateWithLayout:*(void *)(a1 + 40)];
  }
  return result;
}

uint64_t __46__CUSystemMonitorImp__screenSaverMonitorStart__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0LL;
  notify_get_state(token, &state64);
  uint64_t v3 = state64;
  int v4 = state64 != 0;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(v5 + 452);
  *(_BYTE *)(v5 + 452) = v4;
  uint64_t result = pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v6 == v4)
  {
    if (gLogCategory_CUSystemMonitor <= 10)
    {
      if (gLogCategory_CUSystemMonitor != -1
        || (uint64_t result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), (_DWORD)result))
      {
        uint64_t v12 = "off";
        if (v3) {
          uint64_t v12 = "on";
        }
        return LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenSaverMonitorStart]_block_invoke",  0xAu,  (uint64_t)"ScreenSaver unchanged (%s)\n",  v8,  v9,  v10,  v11,  (char)v12);
      }
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (v6) {
        uint64_t v13 = "on";
      }
      else {
        uint64_t v13 = "off";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _screenSaverMonitorStart]_block_invoke",  0x1Eu,  (uint64_t)"ScreenSaver changed: %s -> %s\n",  v8,  v9,  v10,  v11,  (char)v13);
    }

    return [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_261 passingTest:&__block_literal_global_262];
  }

  return result;
}

BOOL __46__CUSystemMonitorImp__screenSaverMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __46__CUSystemMonitorImp__screenSaverMonitorStart__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 screenSaverChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

BOOL __37__CUSystemMonitorImp__screenChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __37__CUSystemMonitorImp__screenChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 screenOnChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __46__CUSystemMonitorImp__screenOnMonitorStartiOS__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0LL;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) _screenChanged:state64 == 0];
}

BOOL __42__CUSystemMonitorImp__screenLockedChanged__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __42__CUSystemMonitorImp__screenLockedChanged__block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 screenLockedChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __47__CUSystemMonitorImp__screenLockedMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _screenLockedChanged];
}

BOOL __51__CUSystemMonitorImp__rotatingIdentifierTimerFired__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __51__CUSystemMonitorImp__rotatingIdentifierTimerFired__block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 rotatingIdentifierChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __53__CUSystemMonitorImp__rotatingIdentifierMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rotatingIdentifierTimerFired];
}

void __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = v5;
  if (!v11 || v6)
  {
    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]_block_invoke",  0x5Au,  (uint64_t)"### Region monitor LOI fetch failed: %{error}",  v7,  v8,  v9,  v10,  (char)v6);
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      char v12 = [v11 count];
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]_block_invoke",  0x1Eu,  (uint64_t)"Region monitor LOI fetch completed: %d total",  v13,  v14,  v15,  v16,  v12);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(dispatch_queue_s **)(v17 + 8);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke_2;
    block[3] = &unk_189F33088;
    block[4] = v17;
    void block[5] = v11;
    dispatch_async(v18, block);
  }
}

uint64_t __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _regionMonitorUpdateLocationsOfInterest:*(void *)(a1 + 40)];
}

BOOL __46__CUSystemMonitorImp__regionMonitorUpdateMCC___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __46__CUSystemMonitorImp__regionMonitorUpdateMCC___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 regionChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

BOOL __62__CUSystemMonitorImp__regionMonitorUpdateLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __62__CUSystemMonitorImp__regionMonitorUpdateLocationsOfInterest___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 regionChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

void __39__CUSystemMonitorImp__regionMonitorGet__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 344LL))
  {
    id v11 = v5;
    if (!v11 || v6)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke",  0x5Au,  (uint64_t)"### Region monitor get CT subscription context failed: %{error}",  v7,  v8,  v9,  v10,  (char)v6);
      }
    }

    else
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke",  0x1Eu,  (uint64_t)"Region monitor get MCC",  v7,  v8,  v9,  v10,  v13);
      }

      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __39__CUSystemMonitorImp__regionMonitorGet__block_invoke_2;
      v14[3] = &unk_189F324B0;
      char v12 = *(void **)(a1 + 40);
      v14[4] = *(void *)(a1 + 32);
      void v14[5] = v12;
      [v12 copyMobileCountryCode:v11 completion:v14];
    }
  }
}

void __39__CUSystemMonitorImp__regionMonitorGet__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 344LL))
  {
    if (v5)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke_2",  0x5Au,  (uint64_t)"### Region monitor get MCC failed: MCC %@, %{error}",  v6,  v7,  v8,  v9,  (char)v15);
      }
    }

    else
    {
      if ([v15 integerValue] == 0xFFFF)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke_2",  0x1Eu,  (uint64_t)"Region monitor mapping %@ -> null (get)",  v10,  v11,  v12,  v13,  (char)v15);
        }

        id v14 = 0LL;
      }

      else
      {
        id v14 = v15;
      }

      id v15 = v14;
      objc_msgSend(*(id *)(a1 + 32), "_regionMonitorUpdateMCC:");
    }
  }
}

uint64_t __41__CUSystemMonitorImp__regionMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _locationsOfInterestDidChange:1];
}

BOOL __46__CUSystemMonitorImp__primaryAppleIDChanged2___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __46__CUSystemMonitorImp__primaryAppleIDChanged2___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 primaryAppleIDChangedHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __45__CUSystemMonitorImp__primaryAppleIDChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _primaryAppleIDChanged2:0];
}

uint64_t __49__CUSystemMonitorImp__primaryAppleIDMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _primaryAppleIDChanged2:0];
}

uint64_t __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke(uint64_t a1)
{
  int v2 = IOPSDrawingUnlimitedPower();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(unsigned __int8 *)(v3 + 316);
  *(_BYTE *)(v3 + 316) = v2;
  uint64_t result = pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v4 == v2)
  {
    if (gLogCategory_CUSystemMonitor <= 10)
    {
      if (gLogCategory_CUSystemMonitor != -1
        || (uint64_t result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), (_DWORD)result))
      {
        uint64_t v10 = "no";
        if (v2) {
          uint64_t v10 = "yes";
        }
        return LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]_block_invoke",  0xAu,  (uint64_t)"PowerUnlimited unchanged (%s)\n",  v6,  v7,  v8,  v9,  (char)v10);
      }
    }
  }

  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (v4) {
        uint64_t v11 = "yes";
      }
      else {
        uint64_t v11 = "no";
      }
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]_block_invoke",  0x1Eu,  (uint64_t)"PowerUnlimited changed: %s -> %s\n",  v6,  v7,  v8,  v9,  (char)v11);
    }

    return [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_183 passingTest:&__block_literal_global_184];
  }

  return result;
}

BOOL __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 powerUnlimitedChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

uint64_t __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  *(_DWORD *)(*(void *)(a1 + 32) + 240) = [*(id *)(*(void *)(a1 + 32) + 232) flags];
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger_8068();
  int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF();
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_186A3B000, v2, OS_LOG_TYPE_DEFAULT, "Network interface flags changed: %@", buf, 0xCu);
  }

  return [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_158 passingTest:&__block_literal_global_159];
}

uint64_t __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = (_OWORD *)(v2 + 244);
  int v4 = *(void **)(v2 + 232);
  if (v4) {
    [v4 primaryIPv4Addr];
  }
  else {
    memset(buf, 0, 28);
  }
  _OWORD *v3 = *(_OWORD *)buf;
  *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)&buf[12];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (_OWORD *)(v5 + 272);
  uint64_t v7 = *(void **)(v5 + 232);
  if (v7) {
    [v7 primaryIPv6Addr];
  }
  else {
    memset(buf, 0, 28);
  }
  *uint64_t v6 = *(_OWORD *)buf;
  *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)&buf[12];
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger_8068();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_186A3B000, v8, OS_LOG_TYPE_DEFAULT, "PrimaryIP changed: IPv4 %@, IPv6 %@", buf, 0x16u);
  }

  return [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_161 passingTest:&__block_literal_global_163];
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_164(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(a1 + 32) + 232) primaryNetworkSignature];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 304LL), v2);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger_8068();
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_186A3B000, v3, OS_LOG_TYPE_DEFAULT, "PrimaryNetwork changed: %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_166 passingTest:&__block_literal_global_168];
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_169(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 232) flags];
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 232LL);
  if (v3)
  {
    [v3 primaryIPv4Addr];
    int v4 = *(void **)(*(void *)(a1 + 32) + 232LL);
    if (v4)
    {
      [v4 primaryIPv6Addr];
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 232LL);
      goto LABEL_6;
    }
  }

  else
  {
    memset(v25, 0, 28);
  }

  uint64_t v5 = 0LL;
  memset(v24, 0, 28);
LABEL_6:
  [v5 primaryNetworkSignature];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(v7 + 240);
  char v9 = 1;
  int v10 = SockAddrCompareAddrEx(v25, v7 + 244, 1);
  BOOL v11 = (SockAddrCompareAddrEx(v24, *(void *)(a1 + 32) + 272LL, 1) | v10) != 0;
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 304LL);
  id v13 = v6;
  id v14 = v12;
  id v15 = v14;
  if (v13 != v14)
  {
    if ((v13 == 0LL) == (v14 != 0LL)) {
      char v9 = 0;
    }
    else {
      char v9 = [v13 isEqual:v14];
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 240LL) = v2;
  uint64_t v16 = *(void *)(a1 + 32);
  *(_OWORD *)(v16 + 244) = v25[0];
  *(_OWORD *)(v16 + 256) = *(_OWORD *)((char *)v25 + 12);
  uint64_t v17 = (_OWORD *)(*(void *)(a1 + 32) + 272LL);
  *uint64_t v17 = v24[0];
  *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)((char *)v24 + 12);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 304LL), v6);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  logger_8068();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v23 = &unk_186B4ABE3;
    NSPrintF();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v24;
    NSPrintF();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    __int128 v27 = v19;
    __int16 v28 = 2112;
    __int128 v29 = v20;
    __int16 v30 = 2112;
    uint64_t v31 = v21;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_impl( &dword_186A3B000,  v18,  OS_LOG_TYPE_DEFAULT,  "NetInterface initial: Flags %@, IPv4 %@, IPv6 %@, Sig %@",  buf,  0x2Au);
  }

  if (v2 == v8)
  {
    if (!v11) {
      goto LABEL_14;
    }
LABEL_18:
    objc_msgSend( *(id *)(a1 + 32),  "_invokeBlock:passingTest:",  &__block_literal_global_175,  &__block_literal_global_176,  v22,  v23);
    if ((v9 & 1) != 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_171 passingTest:&__block_literal_global_173];
  if (v11) {
    goto LABEL_18;
  }
LABEL_14:
  if ((v9 & 1) == 0) {
LABEL_15:
  }
    objc_msgSend( *(id *)(a1 + 32),  "_invokeBlock:passingTest:",  &__block_literal_global_177,  &__block_literal_global_178,  v22);
LABEL_16:
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_6(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_5(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 primaryNetworkChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_4(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_174(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 primaryIPChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_172(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_170(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 netFlagsChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_167(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_165(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 primaryNetworkChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_162(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_160(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 primaryIPChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_157(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 netFlagsChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __55__CUSystemMonitorImp__motionMonitorOrientationChanged___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __55__CUSystemMonitorImp__motionMonitorOrientationChanged___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 motionHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

BOOL __51__CUSystemMonitorImp__motionMonitorHandleActivity___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __51__CUSystemMonitorImp__motionMonitorHandleActivity___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 motionHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

void *__41__CUSystemMonitorImp__motionMonitorStart__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[24]) {
    return (void *)[result _motionMonitorHandleActivity:a2];
  }
  return result;
}

void __41__CUSystemMonitorImp__motionMonitorStart__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 224LL))
  {
    id v6 = v12;
    if (v6)
    {
      [*(id *)(a1 + 40) _motionMonitorOrientationChanged:v6];
    }

    else if (gLogCategory_CUSystemMonitor <= 90 {
           && (gLogCategory_CUSystemMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      NSPrintF();
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _motionMonitorStart]_block_invoke_2",  0x5Au,  (uint64_t)"### Motion orientation failed: %@",  v8,  v9,  v10,  v11,  (char)v7);
    }
  }
}

BOOL __38__CUSystemMonitorImp__meDeviceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __38__CUSystemMonitorImp__meDeviceUpdate___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 meDeviceChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

uint64_t __48__CUSystemMonitorImp__meDeviceRetryTimerUpdate___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]_block_invoke",  0x1Eu,  (uint64_t)"MeDevice retry timer fired",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _meDeviceCheckStart:0];
}

BOOL __64__CUSystemMonitorImp__meDeviceCheckCompletion_error_firstCheck___block_invoke_2( uint64_t a1,  void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __64__CUSystemMonitorImp__meDeviceCheckCompletion_error_firstCheck___block_invoke( uint64_t a1,  _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 meDeviceChangedHandler];
    int v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }

uint64_t __42__CUSystemMonitorImp__meDeviceCheckStart___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) setDelegate:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _meDeviceUpdate:a2];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_3",  0x1Eu,  (uint64_t)"MeDevice me device changed\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _meDeviceCheckStart:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_4",  0x1Eu,  (uint64_t)"MeDevice device list changed\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _meDeviceCheckStart:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_5",  0x1Eu,  (uint64_t)"MeDevice device retry notification\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _meDeviceCheckStart:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  return [a2 meDeviceUseFindMyLocate];
}

uint64_t __48__CUSystemMonitorImp__manatreeUpdateRetryTimer___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]_block_invoke",  0x1Eu,  (uint64_t)"Manatee retry timer fired",  a5,  a6,  a7,  a8,  v14);
  }

  uint64_t result = *(void *)(a1 + 32);
  char v10 = *(void **)(result + 112);
  if (v10)
  {
    uint64_t v11 = v10;
    dispatch_source_cancel(v11);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 112);
    *(void *)(v12 + 112) = 0LL;

    uint64_t result = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(result + 108)) {
    return [(id)result _manateeRead];
  }
  return result;
}

_BYTE *__47__CUSystemMonitorImp__forceManateeStateRefresh__block_invoke(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (result[108]) {
    return (_BYTE *)[result _manateeRead];
  }
  return result;
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(getCDPStateControllerClass());
  [(Class)getCDPContextClass[0]() contextForPrimaryAccount];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = (void *)[v2 initWithContext:v3];

  id v12 = 0LL;
  LOBYTE(v3) = [v4 isManateeAvailable:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(dispatch_queue_s **)(v6 + 8);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_3;
  v9[3] = &unk_189F320C8;
  v9[4] = v6;
  id v10 = v5;
  char v11 = (char)v3;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_3(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_4;
  aBlock[3] = &unk_189F33088;
  id v2 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v24 = v2;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v4 + 108))
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 48)) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
    if (*(_DWORD *)(v4 + 104) == v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        int v8 = 30;
      }
      else {
        int v8 = 10;
      }
      if (v8 >= gLogCategory_CUSystemMonitor)
      {
        if (gLogCategory_CUSystemMonitor == -1)
        {
          uint64_t v7 = *(void *)(a1 + 40);
        }

        NSPrintF();
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        char v14 = "Available";
        if (!v5) {
          char v14 = "Unavailable";
        }
        if (v7) {
          unsigned int v15 = 30;
        }
        else {
          unsigned int v15 = 10;
        }
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _manateeRead]_block_invoke_3",  v15,  (uint64_t)"Manatee State unchanged: %s, error=%@",  v9,  v10,  v11,  v12,  (char)v14);
      }
    }

    else
    {
      pthread_mutex_lock(&gCUSystemMonitorLock);
      *(_BYTE *)(*(void *)(a1 + 32) + 100LL) = *(_BYTE *)(a1 + 48);
      if (*(_BYTE *)(a1 + 48)) {
        int v16 = 2;
      }
      else {
        int v16 = 1;
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 104LL) = v16;
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        uint64_t v21 = *(unsigned int *)(*(void *)(a1 + 32) + 104LL);
        else {
          uint64_t v22 = off_189F32AC0[v21];
        }
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _manateeRead]_block_invoke_3",  0x1Eu,  (uint64_t)"Manatee read: %s, %{error}\n",  v17,  v18,  v19,  v20,  (char)v22);
      }

      [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_107 passingTest:&__block_literal_global_108];
    }
  }

uint64_t __34__CUSystemMonitorImp__manateeRead__block_invoke_4(uint64_t a1)
{
  id v2 = *(_BYTE **)(a1 + 32);
  if (v2[108]) {
    BOOL v3 = *(void *)(a1 + 40) != 0LL;
  }
  else {
    BOOL v3 = 0LL;
  }
  return [v2 _manatreeUpdateRetryTimer:v3];
}

BOOL __34__CUSystemMonitorImp__manateeRead__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_5(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 manateeChangedHandler];
    id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      id v2 = v3;
    }
  }

void __34__CUSystemMonitorImp__manateeRead__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("CUSystemMonitor-CDP", 0LL);
  v1 = (void *)_manateeRead_cdpQueue;
  _manateeRead_cdpQueue = (uint64_t)v0;
}

BOOL __51__CUSystemMonitorImp__locationVisitUpdate_arrived___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __51__CUSystemMonitorImp__locationVisitUpdate_arrived___block_invoke(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 locationVisitsChangedHandler];
    id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      id v2 = v3;
    }
  }

uint64_t __37__CUSystemMonitorImp__familyUpdated___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (*(_BYTE *)(*(void *)(result + 32) + 64LL))
  {
    uint64_t v8 = result;
    if (*(void *)(result + 40)
      && gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyUpdated:]_block_invoke",  0x1Eu,  (uint64_t)"Family updated\n",  a5,  a6,  a7,  a8,  v9);
    }

    return [*(id *)(v8 + 32) _familyGetMembers:0];
  }

  return result;
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(dispatch_queue_s **)(v7 + 8);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __40__CUSystemMonitorImp__familyGetMembers___block_invoke_2;
  v11[3] = &unk_189F32CB0;
  v11[4] = v7;
  id v12 = v6;
  id v13 = v5;
  char v14 = *(_BYTE *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v8 + 80) == -1) {
    return;
  }
  *(_BYTE *)(v8 + 52) = *(void *)(a1 + 40) != 0LL;
  uint64_t v10 = *(void *)(a1 + 40);
  if (!v10)
  {
    [*(id *)(a1 + 48) members];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v11 copy];

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          getFAFamilyMemberClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (gLogCategory_CUSystemMonitor <= 90
              && (gLogCategory_CUSystemMonitor != -1
               || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
            {
              LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2",  0x5Au,  (uint64_t)"### Family bad member type: %@\n",  v19,  v20,  v21,  v22,  v18);
            }

            goto LABEL_33;
          }
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (*(_BYTE *)(a1 + 56))
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        __int128 v23 = "Family initial: %d family member(s)\n";
LABEL_26:
        char v24 = [v13 count];
        LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2",  0x1Eu,  (uint64_t)v23,  v25,  v26,  v27,  v28,  v24);
      }
    }

    else if (gLogCategory_CUSystemMonitor <= 30 {
           && (gLogCategory_CUSystemMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      __int128 v23 = "Family updated: %d family member(s)\n";
      goto LABEL_26;
    }

    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), v12);
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_79 passingTest:&__block_literal_global_80];
LABEL_33:

    return;
  }

  if (gLogCategory_CUSystemMonitor > 90) {
    return;
  }
  if (gLogCategory_CUSystemMonitor != -1) {
    goto LABEL_5;
  }
  if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au))
  {
    uint64_t v10 = *(void *)(a1 + 40);
LABEL_5:
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2",  0x5Au,  (uint64_t)"### Family get members failed: %{error}\n",  a5,  a6,  a7,  a8,  v10);
  }

BOOL __40__CUSystemMonitorImp__familyGetMembers___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke_3(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 familyUpdatedHandler];
    id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      id v2 = v3;
    }
  }

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _familyNetworkChanged];
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _familyNetworkChanged];
}

void *__41__CUSystemMonitorImp__familyMonitorStart__block_invoke_3(uint64_t a1, int token)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    uint64_t state64 = 0LL;
    notify_get_state(token, &state64);
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]_block_invoke_3",  0x1Eu,  (uint64_t)"Family setup state changed: %llu\n",  v4,  v5,  v6,  v7,  state64);
  }

  uint64_t result = *(void **)(a1 + 32);
  if (!result[7]) {
    return (void *)[result _familyGetMembers:0];
  }
  return result;
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]_block_invoke_4",  0x1Eu,  (uint64_t)"Family updated\n",  a5,  a6,  a7,  a8,  v10);
  }

  return [*(id *)(a1 + 32) _familyGetMembers:0];
}

void __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (*(void *)(*(void *)(a1 + 32) + 40LL))
  {
    uint64_t v25 = v4;
    uint64_t v6 = [v4 length];
    uint64_t v5 = v25;
    if (v6 == 6)
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 32LL);
      id v8 = v25;
      id v9 = v7;
      if (v9 == v8)
      {
      }

      else
      {
        char v10 = v9;
        if ((v8 == 0LL) == (v9 != 0LL))
        {

          goto LABEL_12;
        }

        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
LABEL_12:
          if (gLogCategory_CUSystemMonitor <= 30
            && (gLogCategory_CUSystemMonitor != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
          {
            char v17 = [*(id *)(*(void *)(a1 + 32) + 32) bytes];
            [v8 bytes];
            LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]_block_invoke",  0x1Eu,  (uint64_t)"Bluetooth address changed: %.6a -> %.6a\n",  v18,  v19,  v20,  v21,  v17);
          }

          objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), a2);
          __int128 v23 = (void *)(*(void *)(a1 + 32) + 24LL);
          id v24 = v8;
          memcpy(v23, (const void *)[v24 bytes], objc_msgSend(v24, "length"));
          [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_59 passingTest:&__block_literal_global_60];
          goto LABEL_19;
        }
      }

      uint64_t v5 = v25;
      if (gLogCategory_CUSystemMonitor <= 10)
      {
        if (gLogCategory_CUSystemMonitor != -1
          || (BOOL v22 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), v5 = v25, v22))
        {
          char v12 = [v8 bytes];
          LogPrintF( (uint64_t)&gLogCategory_CUSystemMonitor,  (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]_block_invoke",  0xAu,  (uint64_t)"Bluetooth address unchanged: %.6a\n",  v13,  v14,  v15,  v16,  v12);
LABEL_19:
          uint64_t v5 = v25;
        }
      }
    }
  }
}

BOOL __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  if (!a2[24])
  {
    [a2 bluetoothAddressChangedHandler];
    id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      id v2 = v3;
    }
  }

BOOL __29__CUSystemMonitorImp__update__block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

CFStringRef __29__CUSystemMonitorImp__update__block_invoke_23()
{
  return (id)SCDynamicStoreKeyCreateComputerName(0LL);
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

CFStringRef __29__CUSystemMonitorImp__update__block_invoke_9()
{
  return (id)SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  (CFStringRef)*MEMORY[0x18960C548],  (CFStringRef)*MEMORY[0x18960C538],  (CFStringRef)*MEMORY[0x18960C590]);
}

CFStringRef __29__CUSystemMonitorImp__update__block_invoke_8()
{
  return (id)SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  (CFStringRef)*MEMORY[0x18960C548],  (CFStringRef)*MEMORY[0x18960C538],  (CFStringRef)*MEMORY[0x18960C588]);
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

void __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  if (v2)
  {
    BOOL v3 = *(dispatch_queue_s **)(a1 + 40);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke_2;
    block[3] = &unk_189F34300;
    id v5 = v2;
    dispatch_async(v3, block);
  }

uint64_t __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __47__CUSystemMonitorImp__invokeBlock_passingTest___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 24LL)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16LL))();
  }
  return result;
}

uint64_t __36__CUSystemMonitorImp_removeMonitor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void __44__CUSystemMonitorImp_addMonitor_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  if (v2)
  {
    BOOL v3 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 16LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __44__CUSystemMonitorImp_addMonitor_completion___block_invoke_2;
    block[3] = &unk_189F34300;
    id v5 = v2;
    dispatch_async(v3, block);
  }

uint64_t __44__CUSystemMonitorImp_addMonitor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end