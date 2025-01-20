@interface CBCentralManager
+ (BOOL)supportsFeatures:(CBCentralManagerFeature)features;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)isScanning;
- (CBCentralManager)init;
- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options;
- (NSArray)retrieveConnectedPeripheralsWithServices:(NSArray *)serviceUUIDs;
- (NSArray)retrievePeripheralsWithIdentifiers:(NSArray *)identifiers;
- (NSMapTable)peripherals;
- (NSMutableArray)discoveredPeripherals;
- (OS_dispatch_source)updateTimer;
- (id)createCBPeripheralsFromIDs:(id)a3;
- (id)createPeripheralWithAddress:(id)a3 andIdentifier:(id)a4;
- (id)dataArrayToUUIDArray:(id)a3;
- (id)delegate;
- (id)getLPEMData:(id)a3;
- (id)isApplicationConnectedToAnyPeripherals:(id)a3;
- (id)peripheralWithIdentifier:(id)a3;
- (id)peripheralWithInfo:(id)a3;
- (id)retrieveAddressForPeripheral:(id)a3;
- (id)retrieveConnectedPeripheralsWithServices:(id)a3 allowAll:(BOOL)a4;
- (id)retrieveConnectingPeripherals;
- (id)retrievePairingInfoForPeripheral:(id)a3;
- (id)retrievePeripheralWithAddress:(id)a3;
- (id)retrieveState;
- (id)retrieveWhbCBPeripheralWithInfo:(id)a3;
- (id)scanCompletion;
- (id)startConnectionEventCounterForPeripheral:(id)a3;
- (id)stopConnectionEventCounterForPeripheral:(id)a3;
- (unsigned)getRemainingAdvancedMatchingRule;
- (unsigned)getTotalSupportedAdvancedMatchingRules;
- (unsigned)retrieveMaxConnectionForUsecase:(unsigned int)a3;
- (void)HandleBluetoothPhyStatisticEventMsg:(id)a3;
- (void)HandleBluetoothUsageEventMsg:(id)a3;
- (void)HandleCSProcedureEventMsg:(id)a3;
- (void)HandleControllerBTClockUpdateMsg:(id)a3;
- (void)HandleRssiDetectionUpdateMsg:(id)a3;
- (void)_scanForPeripheralsWithServices:(id)a3 options:(id)a4;
- (void)activateWhbCnxForCBPeripheral:(id)a3 infoDict:(id)a4;
- (void)addAdvancedMatchingRule:(id)a3;
- (void)addIRKwithBTAddress:(id)a3 irk:(id)a4;
- (void)cancelPeripheralConnection:(CBPeripheral *)peripheral;
- (void)cancelPeripheralConnection:(id)a3 force:(BOOL)a4;
- (void)cancelPeripheralConnection:(id)a3 options:(id)a4;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options;
- (void)connectWhbCBPeripheral:(id)a3 withCompletion:(id)a4;
- (void)createOfflineLEPairing:(unsigned __int16)a3;
- (void)createPeripheralFromIdentifier:(id)a3 completion:(id)a4;
- (void)csCreateConfig:(id)a3 options:(id)a4;
- (void)csProcedureEnable:(id)a3 options:(id)a4;
- (void)csReadLocalFAETable;
- (void)csReadLocalSupportedCapabilities;
- (void)csReadRemoteFAETable:(id)a3;
- (void)csReadRemoteSupportedCapabilities:(id)a3;
- (void)csRemoveConfig:(id)a3 options:(id)a4;
- (void)csSecurityEnable:(id)a3;
- (void)csSetAfh:(id)a3;
- (void)csSetDefaultSettings:(id)a3 options:(id)a4;
- (void)csSetProcedureParams:(id)a3 options:(id)a4;
- (void)csTest:(id)a3;
- (void)csWriteCachedRemoteSupportedCapabilities:(id)a3 options:(id)a4;
- (void)csWriteRemoteFAETable:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)deleteDevice:(id)a3;
- (void)enableMrc:(id)a3 options:(id)a4;
- (void)enablePrivateModeForPeripheral:(id)a3 forDuration:(unsigned __int16)a4;
- (void)enablePrivateModeForSessionWithIdentifier:(id)a3 forDuration:(unsigned __int16)a4;
- (void)forEachPeripheral:(id)a3;
- (void)handleAncsAuthChanged:(id)a3;
- (void)handleApplicationActivityEvent:(id)a3;
- (void)handleApplicationConnectionEventDidOccur:(id)a3;
- (void)handleConnectionParametersUpdated:(id)a3;
- (void)handleDidReceiveDataFromPeripheral:(id)a3;
- (void)handleDidSendBytesToPeripheralwithError:(id)a3;
- (void)handleFindMyDevicesUpdated:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePeerMTUChanged:(id)a3;
- (void)handlePeripheralCLReady:(id)a3;
- (void)handlePeripheralConnectionCompleted:(id)a3;
- (void)handlePeripheralConnectionStateUpdated:(id)a3;
- (void)handlePeripheralDisconnectionCompleted:(id)a3;
- (void)handlePeripheralDiscovered:(id)a3;
- (void)handlePeripheralInvalidated:(id)a3;
- (void)handlePeripheralTrackingUpdated:(id)a3;
- (void)handleReadyForUpdates:(id)a3;
- (void)handleRestoringState:(id)a3;
- (void)handleScanComplete:(id)a3;
- (void)handleScanFailedToStartWithError:(id)a3;
- (void)handleScanParamsUpdated:(id)a3;
- (void)handleSupportedFeatures:(id)a3;
- (void)handleZoneLost:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orphanPeripherals;
- (void)pauseLeConnectionManager;
- (void)pauseScans;
- (void)powerAssertionNearCompletion;
- (void)randomizeAFHMapForPeripheral:(id)a3;
- (void)readLocalFastLeConnectionCachedControllerInfoWithcompletion:(id)a3;
- (void)registerForConnectionEventsWithOptions:(NSDictionary *)options;
- (void)removeAdvancedMatchingRule:(id)a3;
- (void)removeIRKwithBTAddress:(id)a3;
- (void)removeMultipleEntriesDuplicateFilter:(id)a3;
- (void)removeSingleEntryDuplicateFilter:(id)a3;
- (void)resumeLeConnectionManager;
- (void)resumeScans;
- (void)retrieveBTDeviceCacheInfo:(id)a3 withCompletion:(id)a4;
- (void)retrieveConnectedPeripherals;
- (void)retrieveConnectedPeripheralsWithServices:(id)a3 completion:(id)a4;
- (void)retrieveConnectionHandleWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrievePeripherals:(id)a3;
- (void)retrievePeripheralsWithCustomProperties:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithFindMyIds:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithFindMySerialNumberStrings:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithFindMySerialNumbers:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)retrievePeripheralsWithTags:(id)a3 completion:(id)a4;
- (void)scanForPeripheralsWithServices:(NSArray *)serviceUUIDs options:(NSDictionary *)options;
- (void)scanForPeripheralsWithServices:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sendData:(id)a3 toPeripheral:(id)a4;
- (void)setBluetoothPhyStatisticsNotifications:(id)a3 options:(id)a4;
- (void)setBluetoothUsageNotifications:(id)a3 options:(id)a4;
- (void)setConnectionEventOptions:(id)a3;
- (void)setDataLengthChange:(id)a3 options:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4;
- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4 completion:(id)a5;
- (void)setDiscoveredPeripherals:(id)a3;
- (void)setEnhancedScanEnable:(id)a3;
- (void)setEnhancedSetScanParamtersMultiCore:(id)a3;
- (void)setHostState:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setLESetPhy:(id)a3 options:(id)a4;
- (void)setLeAFHMap:(id)a3;
- (void)setLePowerControl:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setMatchActionRules:(id)a3;
- (void)setRSSIStatisticsDetection:(id)a3 options:(id)a4;
- (void)setScanCompletion:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)startTrackingPeripheral:(id)a3 options:(id)a4;
- (void)stopScan;
- (void)stopTrackingPeripheral:(id)a3 options:(id)a4;
- (void)updatePeripheral:(id)a3 options:(id)a4;
- (void)wipeDuplicateFilterList:(id)a3;
@end

@implementation CBCentralManager

- (id)peripheralWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_peripherals, "objectForKey:", a3);
}

- (id)peripheralWithInfo:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  v5 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    peripherals = self->_peripherals;
    [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](peripherals, "objectForKey:", v7);
    v5 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[CBPeripheral name](v5, "name");
        char v10 = [v9 isEqualToString:v8];

        if ((v10 & 1) == 0) {
          -[CBPeripheral setName:](v5, "setName:", v8);
        }
      }

      -[CBPeripheral updateFindMyInfo:](v5, "updateFindMyInfo:", v4);
      [v4 objectForKey:@"kCBMsgArgVisibleInSettings"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        [v4 objectForKeyedSubscript:@"kCBMsgArgVisibleInSettings"];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBPeripheral setVisibleInSettings:](v5, "setVisibleInSettings:", [v12 BOOLValue]);
      }

      else
      {
        -[CBPeripheral setVisibleInSettings:](v5, "setVisibleInSettings:", 1LL);
      }
    }

    else
    {
      v5 = -[CBPeripheral initWithCentralManager:info:]( objc_alloc(&OBJC_CLASS___CBPeripheral),  "initWithCentralManager:info:",  self,  v4);
      v13 = self->_peripherals;
      [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v13, "setObject:forKey:", v5, v8);
    }
  }

  return v5;
}

- (void)forEachPeripheral:(id)a3
{
  v8 = (void (**)(id, void *))a3;
  -[NSMapTable objectEnumerator](self->_peripherals, "objectEnumerator");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v8[2](v8, v6);
      uint64_t v7 = [v4 nextObject];

      v6 = (void *)v7;
    }

    while (v7);
  }
}

- (void)powerAssertionNearCompletion
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"com.apple.bluetooth.powerAssertion.end" object:self];
}

- (void)orphanPeripherals
{
}

void __37__CBCentralManager_orphanPeripherals__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    __37__CBCentralManager_orphanPeripherals__block_invoke_cold_1();
  }
  [v2 handleDisconnection];
  [v2 setOrphan];
}

- (id)dataArrayToUUIDArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        +[CBUUID UUIDWithData:]( &OBJC_CLASS___CBUUID,  "UUIDWithData:",  *(void *)(*((void *)&v12 + 1) + 8 * v9),  (void)v12);
        char v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)dealloc
{
  if (self->_observingKeyPaths)
  {
    -[CBCentralManager removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  self,  @"delegate",  objc_opt_class());
    -[CBCentralManager removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  self,  @"state",  objc_opt_class());
    -[CBCentralManager removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  self,  @"localName",  objc_opt_class());
    self->_observingKeyPaths = 0;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBCentralManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if ([v10 isEqualToString:@"state"])
    {
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn && -[CBManager state](self, "state") != 10)
      {
        -[CBCentralManager setIsScanning:](self, "setIsScanning:", 0LL);
        -[CBCentralManager forEachPeripheral:](self, "forEachPeripheral:", &__block_literal_global_18);
        if (-[CBManager state](self, "state") == CBManagerStateResetting) {
          -[CBCentralManager orphanPeripherals](self, "orphanPeripherals");
        }
      }

      -[CBCentralManager delegate](self, "delegate");
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 centralManagerDidUpdateState:self];
    }

    else
    {
      -[CBCentralManager delegate](self, "delegate");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

      -[CBCentralManager delegate](self, "delegate");
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v16 = 2;
      }
      else {
        int v16 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFD | v16);

      -[CBCentralManager delegate](self, "delegate");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v18 = 4;
      }
      else {
        int v18 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFB | v18);
      v19 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v20 = 8;
      }
      else {
        int v20 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFF7 | v20);
      v21 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFEF | v22);
      v23 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFDF | v24);
      v25 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v26 = 64;
      }
      else {
        int v26 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFBF | v26);
      v27 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v28 = 128;
      }
      else {
        int v28 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFF7F | v28);
      v29 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v30 = 256;
      }
      else {
        int v30 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFEFF | v30);
      v31 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v32 = 512;
      }
      else {
        int v32 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFDFF | v32);
      v33 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v34 = 1024;
      }
      else {
        int v34 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFBFF | v34);
      v35 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v36 = 2048;
      }
      else {
        int v36 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFF7FF | v36);
      v37 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v38 = 4096;
      }
      else {
        int v38 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFEFFF | v38);
      v39 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v40 = 0x2000;
      }
      else {
        int v40 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFDFFF | v40);
      v41 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v42 = 0x4000;
      }
      else {
        int v42 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFBFFF | v42);
      v43 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v44 = 0x8000;
      }
      else {
        int v44 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFF7FFF | v44);
      v45 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v46 = 0x10000;
      }
      else {
        int v46 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFEFFFF | v46);
      v47 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v48 = 0x20000;
      }
      else {
        int v48 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFDFFFF | v48);
      v49 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v50 = 0x40000;
      }
      else {
        int v50 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFBFFFF | v50);
      v51 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v52 = 0x80000;
      }
      else {
        int v52 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFF7FFFF | v52);
      v53 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v54 = 0x100000;
      }
      else {
        int v54 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFEFFFFF | v54);
      v55 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v56 = 0x200000;
      }
      else {
        int v56 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFDFFFFF | v56);
      v57 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v58 = 0x400000;
      }
      else {
        int v58 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFBFFFFF | v58);
      v59 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v60 = 0x800000;
      }
      else {
        int v60 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFF7FFFFF | v60);
      v61 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v62 = 0x1000000;
      }
      else {
        int v62 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFEFFFFFF | v62);
      v63 = -[CBCentralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v64 = 0x2000000;
      }
      else {
        int v64 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFDFFFFFF | v64);

      -[CBCentralManager delegate](self, "delegate");
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v65 = 0x4000000;
      }
      else {
        int v65 = 0;
      }
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFBFFFFFF | v65);
    }

    goto LABEL_90;
  }

  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___CBCentralManager;
  -[CBCentralManager observeValueForKeyPath:ofObject:change:context:]( &v66,  sel_observeValueForKeyPath_ofObject_change_context_,  v10,  v11,  v12,  a6);
LABEL_90:
}

uint64_t __67__CBCentralManager_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 handleDisconnection];
}

- (CBCentralManager)init
{
  return -[CBCentralManager initWithDelegate:queue:](self, "initWithDelegate:queue:", 0LL, 0LL);
}

- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v12 = @"kCBInitOptionShowPowerAlert";
  v13[0] = MEMORY[0x189604A88];
  uint64_t v6 = (void *)MEMORY[0x189603F68];
  uint64_t v7 = queue;
  id v8 = delegate;
  [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[CBCentralManager initWithDelegate:queue:options:](self, "initWithDelegate:queue:options:", v8, v7, v9);

  return v10;
}

- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options
{
  id v9 = delegate;
  id v10 = queue;
  id v11 = options;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CBCentralManager;
  id v12 = -[CBManager initInternal](&v25, sel_initInternal);
  if (v12)
  {
    -[CBCentralManager addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"state",  0LL,  objc_opt_class());
    -[CBCentralManager addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"delegate",  0LL,  objc_opt_class());
    -[CBCentralManager addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"localName",  0LL,  objc_opt_class());
    v12->_observingKeyPaths = 1;
    -[CBCentralManager setDelegate:](v12, "setDelegate:", v9);
    v12->_isScanning = 0;
    uint64_t v13 = [objc_alloc(MEMORY[0x189607920]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    peripherals = v12->_peripherals;
    v12->_peripherals = (NSMapTable *)v13;

    __int128 v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    discoveredPeripherals = v12->_discoveredPeripherals;
    v12->_discoveredPeripherals = v15;

    -[CBManager setTccComplete:](v12, "setTccComplete:", 0LL);
    -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", @"kCBInitOptionRestoreIdentifier");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = v12->_delegateFlags;
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v11];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = -[CBManager getCBPrivacySupported](v12, "getCBPrivacySupported");
    [MEMORY[0x189607968] numberWithBool:v20];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setObject:v21 forKey:@"kCBManagerPrivacySupported"];

    if (v17)
    {
      if ((*(_BYTE *)&delegateFlags & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        int v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 handleFailureInMethod:a2, v12, @"CBCentralManager.m", 358, @"%@ has provided a restore identifier but the delegate doesn't implement the centralManager:willRestoreState: method", v12 object file lineNumber description];
      }
    }

    else if ((*(_BYTE *)&delegateFlags & 1) != 0)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBCentralManager initWithDelegate:queue:options:].cold.1();
      }
    }

    v23 = (void *)[v19 copy];
    -[CBManager startWithQueue:options:sessionType:](v12, "startWithQueue:options:sessionType:", v10, v23, 0LL);
  }

  return v12;
}

- (void)retrievePeripherals:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CBCentralManager retrievePeripheralsWithIdentifiers:](self, "retrievePeripheralsWithIdentifiers:", v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager getCurrentQueue](self, "getCurrentQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __40__CBCentralManager_retrievePeripherals___block_invoke;
    v10[3] = &unk_189FB1900;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(v8, v10);
  }
}

void __40__CBCentralManager_retrievePeripherals___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 centralManager:*(void *)(a1 + 32) didRetrievePeripherals:*(void *)(a1 + 40)];
}

- (id)retrievePairingInfoForPeripheral:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"CBCentralManager.m", 418, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  id v11 = @"kCBMsgArgDeviceUUID";
  [v5 identifier];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 111LL, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createCBPeripheralsFromIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (void *)objc_opt_new();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CBCentralManager peripheralWithInfo:]( self,  "peripheralWithInfo:",  *(void *)(*((void *)&v13 + 1) + 8 * v10),  (void)v13);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (NSArray)retrievePeripheralsWithIdentifiers:(NSArray *)identifiers
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = identifiers;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 handleFailureInMethod:a2, self, @"CBCentralManager.m", 437, @"Invalid parameter not satisfying: %@", @"identifiers != nil" object file lineNumber description];
  }

  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v8 = v5;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        while (1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v13);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14) {
            break;
          }
          [v7 addObject:v13];

          if (v10 == ++i) {
            goto LABEL_5;
          }
        }

        [v6 addObject:v14];
      }

- (void)retrievePeripheralsWithIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 handleFailureInMethod:a2, self, @"CBCentralManager.m", 463, @"Invalid parameter not satisfying: %@", @"identifiers != nil" object file lineNumber description];
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        while (1)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v16);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            break;
          }
          [v10 addObject:v16];

          if (v13 == ++i) {
            goto LABEL_5;
          }
        }

        [v9 addObject:v17];
      }

uint64_t __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(a1 + 32);
          [*(id *)(a1 + 40) peripheralWithInfo:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 addObject:v10];

          ++v8;
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)retrieveConnectionHandleWithIdentifier:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 498, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }

  __int128 v14 = @"kCBMsgArgUUID";
  v15[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __70__CBCentralManager_retrieveConnectionHandleWithIdentifier_completion___block_invoke;
  v12[3] = &unk_189FB1978;
  id v13 = v8;
  id v10 = v8;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 64LL, v9, v12);
}

void __70__CBCentralManager_retrieveConnectionHandleWithIdentifier_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v14 = a2;
  id v5 = a3;
  [v14 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v14 objectForKeyedSubscript:@"kCBMsgArgConnectionHandle"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 unsignedShortValue];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = [v5 userInfo];
    id v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = MEMORY[0x189604A60];
    }
    [v9 errorWithInfo:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v13);
  }
}

- (void)retrievePeripheralsWithTags:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 516, @"Invalid parameter not satisfying: %@", @"tags != nil" object file lineNumber description];
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v18 = @"kCBMsgArgTags";
  v19[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __59__CBCentralManager_retrievePeripheralsWithTags_completion___block_invoke;
  v14[3] = &unk_189FB1928;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 65LL, v10, v14);
}

void __59__CBCentralManager_retrievePeripheralsWithTags_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        [*(id *)(a1 + 40) peripheralWithInfo:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v9];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)retrievePeripheralsWithCustomProperties:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 534, @"Invalid parameter not satisfying: %@", @"properties != nil" object file lineNumber description];
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v18 = @"kCBMsgArgCustomProperties";
  v19[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __71__CBCentralManager_retrievePeripheralsWithCustomProperties_completion___block_invoke;
  v14[3] = &unk_189FB1928;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 66LL, v10, v14);
}

void __71__CBCentralManager_retrievePeripheralsWithCustomProperties_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        [*(id *)(a1 + 40) peripheralWithInfo:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v9];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (id)retrieveState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"kCBMsgArgs"];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)retrieveConnectedPeripherals
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CBCentralManager retrieveConnectedPeripheralsWithServices:]( self,  "retrieveConnectedPeripheralsWithServices:",  MEMORY[0x189604A58]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager getCurrentQueue](self, "getCurrentQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __48__CBCentralManager_retrieveConnectedPeripherals__block_invoke;
    v8[3] = &unk_189FB1900;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(v6, v8);
  }

void __48__CBCentralManager_retrieveConnectedPeripherals__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 centralManager:*(void *)(a1 + 32) didRetrieveConnectedPeripherals:*(void *)(a1 + 40)];
}

- (NSArray)retrieveConnectedPeripheralsWithServices:(NSArray *)serviceUUIDs
{
  uint64_t v5 = serviceUUIDs;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 567, @"Invalid parameter not satisfying: %@", @"serviceUUIDs != nil" object file lineNumber description];
  }

  -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:]( self,  "retrieveConnectedPeripheralsWithServices:allowAll:",  v5,  0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)retrieveConnectedPeripheralsWithServices:(id)a3 allowAll:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = (id)MEMORY[0x189604A58];
  }
  v15[0] = @"kCBMsgArgUUIDs";
  v15[1] = @"kCBMsgArgState";
  v16[0] = v6;
  id v7 = (void *)MEMORY[0x189607968];
  id v8 = a3;
  [v7 numberWithBool:v4];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 67LL, v10);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager createCBPeripheralsFromIDs:](self, "createCBPeripheralsFromIDs:", v12);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)retrieveConnectedPeripheralsWithServices:(id)a3 completion:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = (id)MEMORY[0x189604A58];
  if (a3) {
    id v7 = a3;
  }
  v14[0] = @"kCBMsgArgUUIDs";
  v14[1] = @"kCBMsgArgState";
  v15[0] = v7;
  v15[1] = MEMORY[0x189604A88];
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a3;
  [v8 dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __72__CBCentralManager_retrieveConnectedPeripheralsWithServices_completion___block_invoke;
  v12[3] = &unk_189FB19A0;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 67LL, v10, v12);
}

void __72__CBCentralManager_retrieveConnectedPeripheralsWithServices_completion___block_invoke( uint64_t a1,  void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 createCBPeripheralsFromIDs:v5];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)retrievePeripheralsWithFindMySerialNumbers:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_opt_new();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = objc_alloc(NSString);
        uint64_t v16 = (void *)objc_msgSend(v15, "initWithData:encoding:", v14, 4, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  -[CBCentralManager retrievePeripheralsWithFindMySerialNumberStrings:completion:]( self,  "retrievePeripheralsWithFindMySerialNumberStrings:completion:",  v8,  v7);
}

- (void)retrievePeripheralsWithFindMySerialNumberStrings:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  uint64_t v14 = @"kCBMsgArgFindMySerialNumberString";
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = (id)MEMORY[0x189604A58];
  }
  v15[0] = v7;
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a3;
  [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __80__CBCentralManager_retrievePeripheralsWithFindMySerialNumberStrings_completion___block_invoke;
  v12[3] = &unk_189FB19A0;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 69LL, v10, v12);
}

void __80__CBCentralManager_retrievePeripheralsWithFindMySerialNumberStrings_completion___block_invoke( uint64_t a1,  void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 createCBPeripheralsFromIDs:v5];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)retrievePeripheralsWithFindMyIds:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  uint64_t v14 = @"kCBMsgArgUUIDs";
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = (id)MEMORY[0x189604A58];
  }
  v15[0] = v7;
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a3;
  [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __64__CBCentralManager_retrievePeripheralsWithFindMyIds_completion___block_invoke;
  v12[3] = &unk_189FB19A0;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 70LL, v10, v12);
}

void __64__CBCentralManager_retrievePeripheralsWithFindMyIds_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 createCBPeripheralsFromIDs:v5];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (id)retrieveConnectingPeripherals
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager createCBPeripheralsFromIDs:](self, "createCBPeripheralsFromIDs:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_scanForPeripheralsWithServices:(id)a3 options:(id)a4
{
  void v13[2] = *MEMORY[0x1895F89C0];
  id v6 = (id)MEMORY[0x189604A58];
  if (a3) {
    id v6 = a3;
  }
  v12[0] = @"kCBMsgArgUUIDs";
  v12[1] = @"kCBMsgArgOptions";
  id v7 = (id)MEMORY[0x189604A60];
  if (a4) {
    id v7 = a4;
  }
  v13[0] = v6;
  v13[1] = v7;
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a4;
  id v10 = a3;
  [v8 dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = -[CBManager sendMsg:args:](self, "sendMsg:args:", 71LL, v11);
  if ((_DWORD)v10) {
    -[CBCentralManager setIsScanning:](self, "setIsScanning:", 1LL);
  }
}

- (void)scanForPeripheralsWithServices:(NSArray *)serviceUUIDs options:(NSDictionary *)options
{
  id scanCompletion = self->_scanCompletion;
  self->_id scanCompletion = 0LL;
  id v7 = options;
  id v8 = serviceUUIDs;

  [MEMORY[0x189603FC8] dictionaryWithDictionary:v7];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"kCBMsgArgHasCompletionBlock"];
  -[CBCentralManager _scanForPeripheralsWithServices:options:](self, "_scanForPeripheralsWithServices:options:", v8, v9);
}

- (void)scanForPeripheralsWithServices:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)MEMORY[0x18959F890](a5);
  id scanCompletion = self->_scanCompletion;
  self->_id scanCompletion = v10;

  [MEMORY[0x189603FC8] dictionaryWithDictionary:v8];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v12 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"kCBMsgArgHasCompletionBlock"];
  -[CBCentralManager _scanForPeripheralsWithServices:options:]( self,  "_scanForPeripheralsWithServices:options:",  v9,  v12);
}

- (void)stopScan
{
  if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 72LL, 0LL)) {
    -[CBCentralManager setIsScanning:](self, "setIsScanning:", 0LL);
  }
}

- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options
{
  id v7 = peripheral;
  id v8 = options;
  -[NSDictionary valueForKey:](v8, "valueForKey:", @"kCBConnectOptionAutoReconnect");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || ($07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags, (*(_BYTE *)&delegateFlags & 0x20) != 0))
  {
    if (!v7)
    {
      [MEMORY[0x1896077D8] currentHandler];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 handleFailureInMethod:a2, self, @"CBCentralManager.m", 673, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
    }

    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __46__CBCentralManager_connectPeripheral_options___block_invoke;
    v18[3] = &unk_189FB19C8;
    v18[4] = self;
    id v13 = v7;
    __int128 v19 = v13;
    uint64_t v14 = v8;
    __int128 v20 = v14;
    id v15 = (void (**)(void))MEMORY[0x18959F890](v18);
    -[NSDictionary valueForKey:](v14, "valueForKey:", @"kCBConnectOptionUseWHB");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16) {
      -[CBCentralManager connectWhbCBPeripheral:withCompletion:]( self,  "connectWhbCBPeripheral:withCompletion:",  v13,  v15);
    }
    else {
      v15[2](v15);
    }
  }

  else if ((*(_BYTE *)&delegateFlags & 8) != 0)
  {
    [MEMORY[0x189607870] errorWithInfo:&unk_189FD6410];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained centralManager:self didFailToConnectPeripheral:v7 error:v11];
  }
}

void __46__CBCentralManager_connectPeripheral_options___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1895F89C0];
  v9[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  BOOL v4 = (void *)v3;
  v9[1] = @"kCBMsgArgOptions";
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5) {
    uint64_t v5 = MEMORY[0x189604A60];
  }
  v10[0] = v3;
  v10[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v2 sendMsg:73 args:v6];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) state];
    if (v8 == 3 || !v8) {
      [*(id *)(a1 + 40) setState:1];
    }
  }

- (void)enableMrc:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 702, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 220LL, v12);
}

- (id)retrieveWhbCBPeripheralWithInfo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgWhbStableIdentifier"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v8 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v5;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl( &dword_186F9B000,  v8,  OS_LOG_TYPE_DEFAULT,  "Retrieving peripheral for device:%@ with info %@",  buf,  0x16u);
    }

    id v24 = @"kCBMsgArgWhbStableIdentifier";
    id v25 = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 146LL, v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      [v13 setStableIdentifier:v6];
      [v13 setRemoteControllerId:v7];
      if (CBLogInitOnce == -1)
      {
        uint64_t v19 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
      }

      else
      {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        uint64_t v19 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
      }

      *(_DWORD *)buf = 138412290;
      v27 = v5;
      id v15 = "Retrieved non local peripheral successfully for device:%@";
      uint64_t v16 = (os_log_s *)v19;
      uint32_t v17 = 12;
      goto LABEL_21;
    }

    -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      id v13 = v12;
      [v12 setStableIdentifier:v6];
      if (CBLogInitOnce != -1)
      {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        uint64_t v14 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        goto LABEL_10;
      }

      uint64_t v14 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:
        *(_DWORD *)buf = 138412546;
        v27 = v11;
        __int16 v28 = 2112;
        id v29 = v5;
        id v15 = "Retrieved local peripheral:%@ successfully for device:%@";
        uint64_t v16 = (os_log_s *)v14;
        uint32_t v17 = 22;
LABEL_21:
        _os_log_impl(&dword_186F9B000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }

- (void)activateWhbCnxForCBPeripheral:(id)a3 infoDict:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBCentralManager activateWhbCnxForCBPeripheral:infoDict:].cold.1();
    }
  }

  else
  {
    -[CBManager createCnxWithInfo:](self, "createCnxWithInfo:", v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v10 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v7;
      _os_log_impl(&dword_186F9B000, v10, OS_LOG_TYPE_DEFAULT, "Setup WHB cnx: infoDict %@", buf, 0xCu);
    }

    [v6 identifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 peerDevice];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 identifier];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager setWhbLocalId:forRemoteId:](self, "setWhbLocalId:forRemoteId:", v11, v13);
  }

  [v9 peerDevice];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 identifier];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
  int v17 = (*(unsigned int *)&delegateFlags >> 3) & 1;
  uint64_t v18 = MEMORY[0x1895F87A8];
  int v19 = (*(unsigned int *)&delegateFlags >> 4) & 1;
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke;
  v28[3] = &unk_189FB19F0;
  v28[4] = self;
  id v20 = v6;
  id v29 = v20;
  id v21 = v15;
  id v30 = v21;
  int v31 = v19;
  [v9 setInterruptionHandler:v28];
  v24[0] = v18;
  v24[1] = 3221225472LL;
  v24[2] = __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_146;
  v24[3] = &unk_189FB1A18;
  v24[4] = self;
  id v25 = v20;
  id v26 = v21;
  int v27 = v17;
  id v22 = v21;
  id v23 = v20;
  [v9 activateWithCompletion:v24];
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke(uint64_t a1)
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) identifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 removeCnxInstanceForIdentifier:v3];

  [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
  if (*(_DWORD *)(a1 + 56))
  {
    [MEMORY[0x189607870] errorWithInfo:&unk_189FD6438];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) delegate];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 centralManager:*(void *)(a1 + 32) didDisconnectPeripheral:*(void *)(a1 + 40) error:v4];
  }

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_146(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v4 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl( &dword_186F9B000,  v4,  OS_LOG_TYPE_DEFAULT,  "Got WHB CBConnection completed with error %@",  (uint8_t *)&v8,  0xCu);
  }

  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) identifier];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 removeCnxInstanceForIdentifier:v6];

    [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
    if (*(_DWORD *)(a1 + 56))
    {
      [*(id *)(a1 + 32) delegate];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 centralManager:*(void *)(a1 + 32) didFailToConnectPeripheral:*(void *)(a1 + 40) error:v3];
    }
  }
}

- (void)connectWhbCBPeripheral:(id)a3 withCompletion:(id)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 remoteControllerId];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
  }

  else
  {
    [v6 stableIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
        -[CBCentralManager connectWhbCBPeripheral:withCompletion:].cold.1();
        if ((*(_BYTE *)&self->_delegateFlags & 8) == 0) {
          goto LABEL_13;
        }
      }

      else if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
      {
        goto LABEL_13;
      }

      [MEMORY[0x189607870] errorWithInfo:&unk_189FD6460];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager delegate](self, "delegate");
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 centralManager:self didFailToConnectPeripheral:v6 error:v13];
      goto LABEL_11;
    }
  }

  uint64_t v10 = (void *)MEMORY[0x189603FC8];
  id v32 = @"kCBMsgArgDeviceUUID";
  [v6 identifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 dictionaryWithDictionary:v12];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [v6 remoteControllerId];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v15 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      [v6 remoteControllerId];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      int v31 = v17;
      _os_log_impl( &dword_186F9B000,  v16,  OS_LOG_TYPE_DEFAULT,  "Setting up WhbCnx using manually entered remoteControllerId %@",  buf,  0xCu);
    }

    [v6 remoteControllerId];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setValue:v18 forKey:@"kCBMsgArgWhbRemoteControllerId"];

    -[CBCentralManager activateWhbCnxForCBPeripheral:infoDict:]( self,  "activateWhbCnxForCBPeripheral:infoDict:",  v6,  v13);
    goto LABEL_12;
  }

  [v6 stableIdentifier];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = (*(_DWORD *)&self->_delegateFlags >> 3) & 1;
  __int16 v28 = @"kCBMsgArgWhbStableIdentifier";
  id v29 = v19;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __58__CBCentralManager_connectWhbCBPeripheral_withCompletion___block_invoke;
  v22[3] = &unk_189FB1A40;
  int v27 = v20;
  id v23 = v6;
  id v24 = self;
  id v26 = v7;
  id v13 = v13;
  id v25 = v13;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 145LL, v21, v22);

LABEL_11:
LABEL_12:

LABEL_13:
}

void __58__CBCentralManager_connectWhbCBPeripheral_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteDeviceUUID"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v6 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl( &dword_186F9B000,  v6,  OS_LOG_TYPE_DEFAULT,  "Whb connect request to p %@, routing via %@",  (uint8_t *)&v10,  0x16u);
  }

  if (v4)
  {
    if ([v4 isEqualToString:@"CBLocalHostID"])
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }

    else
    {
      [*(id *)(a1 + 48) setValue:v4 forKey:@"kCBMsgArgWhbRemoteControllerId"];
      if (v5) {
        [*(id *)(a1 + 48) setValue:v5 forKey:@"kCBMsgArgWhbRemoteDeviceUUID"];
      }
      [*(id *)(a1 + 40) activateWhbCnxForCBPeripheral:*(void *)(a1 + 32) infoDict:*(void *)(a1 + 48)];
    }
  }

  else if (*(_DWORD *)(a1 + 64))
  {
    [MEMORY[0x189607870] errorWithInfo:v3];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) delegate];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 centralManager:*(void *)(a1 + 40) didFailToConnectPeripheral:*(void *)(a1 + 32) error:v8];
  }
}

- (void)randomizeAFHMapForPeripheral:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 854, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  id v9 = @"kCBMsgArgDeviceUUID";
  [v5 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 99LL, v7);
}

- (void)setLeAFHMap:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2, self, @"CBCentralManager.m", 861, @"Invalid parameter not satisfying: %@", @"map != nil" object file lineNumber description];
  }

  int v8 = @"kCBMsgArgLeAFHMap";
  v9[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 100LL, v6);
}

- (void)setHostState:(BOOL)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  id v6 = @"kCBMsgArgState";
  [MEMORY[0x189607968] numberWithBool:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendDebugMsg:args:](self, "sendDebugMsg:args:", 1LL, v5);
}

- (void)setLePowerControl:(id)a3 options:(id)a4 completion:(id)a5
{
  v17[2] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (a4) {
    id v9 = a4;
  }
  else {
    id v9 = (id)MEMORY[0x189604A60];
  }
  v16[0] = @"kCBMsgArgOptions";
  v16[1] = @"kCBMsgArgDeviceUUID";
  v17[0] = v9;
  id v10 = a4;
  [a3 identifier];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  void v14[2] = __57__CBCentralManager_setLePowerControl_options_completion___block_invoke;
  v14[3] = &unk_189FB1978;
  id v15 = v8;
  id v13 = v8;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 219LL, v12, v14);
}

uint64_t __57__CBCentralManager_setLePowerControl_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)wipeDuplicateFilterList:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 101LL, v7);
}

- (void)addAdvancedMatchingRule:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 108LL, v7);
}

- (void)removeAdvancedMatchingRule:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 109LL, v7);
}

- (void)setEnhancedScanEnable:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 106LL, v7);
}

- (void)setEnhancedSetScanParamtersMultiCore:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 107LL, v7);
}

- (void)removeSingleEntryDuplicateFilter:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = @"kCBMsgArgOptions";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 102LL, v6);
}

- (void)removeMultipleEntriesDuplicateFilter:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = @"kCBMsgArgOptions";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 103LL, v6);
}

- (void)clearDuplicateFilterCache:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = @"kCBMsgArgOptions";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 104LL, v6);
}

- (unsigned)getTotalSupportedAdvancedMatchingRules
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 valueForKey:@"kCBScanOptionTotalAdvMatchingRules"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v4 = [v3 intValue];

  return v4;
}

- (unsigned)getRemainingAdvancedMatchingRule
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 valueForKey:@"kCBScanOptionRemainingAdvMatchingRules"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v4 = [v3 intValue];

  return v4;
}

- (void)setDataLengthChange:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 954, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 113LL, v12);
}

- (void)csReadLocalSupportedCapabilities
{
  id v2 = -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 114LL, 0LL);
}

- (void)csReadRemoteSupportedCapabilities:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 968, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  uint64_t v9 = @"kCBMsgArgDeviceUUID";
  [v5 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 115LL, v7);
}

- (void)csWriteCachedRemoteSupportedCapabilities:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 974, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 116LL, v12);
}

- (void)csSecurityEnable:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 981, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  uint64_t v9 = @"kCBMsgArgDeviceUUID";
  [v5 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 117LL, v7);
}

- (void)csTest:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBCentralManager.m", 987, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  uint64_t v9 = @"kCBMsgArgDeviceUUID";
  [v5 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 118LL, v7);
}

- (void)csCreateConfig:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 993, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 119LL, v12);
}

- (void)csRemoveConfig:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1000, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 120LL, v12);
}

- (void)csProcedureEnable:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1007, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 121LL, v12);
}

- (void)csSetProcedureParams:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1014, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 122LL, v12);
}

- (void)csSetAfh:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 123LL, v7);
}

- (void)csSetDefaultSettings:(id)a3 options:(id)a4
{
  void v12[2] = *MEMORY[0x1895F89C0];
  v11[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = (void *)v7;
  v11[1] = @"kCBMsgArgOptions";
  id v9 = (id)MEMORY[0x189604A60];
  if (v6) {
    id v9 = v6;
  }
  v12[0] = v7;
  v12[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 124LL, v10);
}

- (void)csReadLocalFAETable
{
  id v2 = -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 125LL, 0LL);
}

- (void)csReadRemoteFAETable:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  id v6 = @"kCBMsgArgDeviceUUID";
  [a3 identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 126LL, v5);
}

- (void)csWriteRemoteFAETable:(id)a3 options:(id)a4
{
  void v12[2] = *MEMORY[0x1895F89C0];
  v11[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = (void *)v7;
  v11[1] = @"kCBMsgArgOptions";
  id v9 = (id)MEMORY[0x189604A60];
  if (v6) {
    id v9 = v6;
  }
  v12[0] = v7;
  v12[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 127LL, v10);
}

- (void)setLESetPhy:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1048, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 128LL, v12);
}

- (void)setRSSIStatisticsDetection:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1057, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 142LL, v12);
}

- (void)setBluetoothUsageNotifications:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1066, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 143LL, v12);
}

- (void)setBluetoothPhyStatisticsNotifications:(id)a3 options:(id)a4
{
  void v15[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1075, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v14[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v14[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v15[0] = v9;
  v15[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 144LL, v12);
}

- (void)cancelPeripheralConnection:(id)a3 options:(id)a4
{
  void v16[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1084, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v15[0] = @"kCBMsgArgDeviceUUID";
  uint64_t v9 = [v7 identifier];
  id v10 = (void *)v9;
  v15[1] = @"kCBMsgArgOptions";
  id v11 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v11 = v8;
  }
  v16[0] = v9;
  v16[1] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 74LL, v12);
}

- (void)cancelPeripheralConnection:(CBPeripheral *)peripheral
{
  id v4 = (void *)MEMORY[0x189603FC8];
  id v5 = peripheral;
  [v4 dictionary];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x189604A80];
  [v7 setObject:MEMORY[0x189604A80] forKey:@"kCBCancelConnectOptionForce"];
  [v7 setObject:v6 forKey:@"kCBCancelConnectOptionDoNotAutoConnectBuiltInServices"];
  -[CBCentralManager cancelPeripheralConnection:options:](self, "cancelPeripheralConnection:options:", v5, v7);
}

- (void)cancelPeripheralConnection:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (!v12)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1115, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  [MEMORY[0x189603FC8] dictionary];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  uint64_t v9 = MEMORY[0x189604A80];
  if (v4) {
    uint64_t v10 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v10 = MEMORY[0x189604A80];
  }
  [v7 setObject:v10 forKey:@"kCBCancelConnectOptionForce"];
  [v8 setObject:v9 forKey:@"kCBCancelConnectOptionDoNotAutoConnectBuiltInServices"];
  -[CBCentralManager cancelPeripheralConnection:options:](self, "cancelPeripheralConnection:options:", v12, v8);
}

- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  void v13[3] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1127, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v12[0] = @"kCBMsgArgDeviceUUID";
  [v7 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = MEMORY[0x189604A80];
  v12[1] = @"kCBMsgArgHasCompletionBlock";
  void v12[2] = @"kCBMsgArgConnectionLatency";
  [MEMORY[0x189607968] numberWithInteger:a3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  void v13[2] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 163LL, v10);
}

- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4 completion:(id)a5
{
  v19[3] = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1137, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  v18[0] = @"kCBMsgArgDeviceUUID";
  [v9 identifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = MEMORY[0x189604A88];
  v18[1] = @"kCBMsgArgHasCompletionBlock";
  v18[2] = @"kCBMsgArgConnectionLatency";
  [MEMORY[0x189607968] numberWithInteger:a3];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  void v19[2] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:3];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  void v16[2] = __73__CBCentralManager_setDesiredConnectionLatency_forPeripheral_completion___block_invoke;
  void v16[3] = &unk_189FB1978;
  id v17 = v10;
  id v14 = v10;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 163LL, v13, v16);
}

void __73__CBCentralManager_setDesiredConnectionLatency_forPeripheral_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithInfo:a2];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)startTrackingPeripheral:(id)a3 options:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  if (!v14)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1150, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];

    id v8 = 0LL;
  }

  id v9 = (void *)MEMORY[0x189603FC8];
  [v8 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v7;
  if (!v7)
  {
    [MEMORY[0x189603F68] dictionary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend( v9,  "dictionaryWithObjectsAndKeys:",  v10,  @"kCBMsgArgDeviceUUID",  v11,  @"kCBMsgArgOptions",  0);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 205LL, v12);

  if (!v7) {
}
  }

- (void)stopTrackingPeripheral:(id)a3 options:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  if (!v14)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1161, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];

    id v8 = 0LL;
  }

  id v9 = (void *)MEMORY[0x189603FC8];
  [v8 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v7;
  if (!v7)
  {
    [MEMORY[0x189603F68] dictionary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend( v9,  "dictionaryWithObjectsAndKeys:",  v10,  @"kCBMsgArgDeviceUUID",  v11,  @"kCBMsgArgOptions",  0);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 206LL, v12);

  if (!v7) {
}
  }

- (void)enablePrivateModeForPeripheral:(id)a3 forDuration:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  void v12[2] = *MEMORY[0x1895F89C0];
  v11[0] = @"kCBMsgArgPrivateModeTimeout";
  uint64_t v6 = (void *)MEMORY[0x189607968];
  id v7 = a3;
  [v6 numberWithUnsignedShort:v4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = @"kCBMsgArgDeviceUUID";
  v12[0] = v8;
  [v7 identifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 42LL, v10);
}

- (void)enablePrivateModeForSessionWithIdentifier:(id)a3 forDuration:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  void v11[2] = *MEMORY[0x1895F89C0];
  v10[0] = @"kCBMsgArgPrivateModeTimeout";
  uint64_t v6 = (void *)MEMORY[0x189607968];
  id v7 = a3;
  [v6 numberWithUnsignedShort:v4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = @"kCBMsgArgPrivateModeSessionIdentifier";
  v11[0] = v8;
  v11[1] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 42LL, v9);
}

- (void)registerForConnectionEventsWithOptions:(NSDictionary *)options
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (options) {
    uint64_t v4 = options;
  }
  else {
    uint64_t v4 = (NSDictionary *)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  uint64_t v6 = options;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 93LL, v7);
}

- (void)pauseLeConnectionManager
{
}

- (void)resumeLeConnectionManager
{
}

- (void)pauseScans
{
}

- (void)resumeScans
{
}

- (void)sendData:(id)a3 toPeripheral:(id)a4
{
  void v10[2] = *MEMORY[0x1895F89C0];
  v9[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a3;
  [a4 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = @"kCBMsgArgObjectDiscoveryData";
  v10[0] = v7;
  v10[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 137LL, v8);
}

- (void)setConnectionEventOptions:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgOptions";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 93LL, v7);
}

- (void)setMatchActionRules:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A60];
  }
  id v8 = @"kCBMsgArgRules";
  v9[0] = v4;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 112LL, v7);
}

+ (BOOL)supportsFeatures:(CBCentralManagerFeature)features
{
  return (features & ~(unint64_t)gSupportedFeatures) == 0;
}

- (id)startConnectionEventCounterForPeripheral:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x189607870];
  id v10 = @"kCBMsgArgDeviceUUID";
  [a3 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 140LL, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 errorWithInfo:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)stopConnectionEventCounterForPeripheral:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x189607870];
  id v10 = @"kCBMsgArgDeviceUUID";
  [a3 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 141LL, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 errorWithInfo:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)isApplicationConnectedToAnyPeripherals:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v9 = @"kCBMsgArgAnyConnectedPeripheralsPerApp";
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 78LL, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createOfflineLEPairing:(unsigned __int16)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  id v6 = @"kCBMsgArgDevices";
  [MEMORY[0x189607968] numberWithUnsignedShort:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 79LL, v5);
}

- (id)getLPEMData:(id)a3
{
  id v4 = a3;
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 211LL, MEMORY[0x189604A60]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"kCBMsgArgLPEMData"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setData:v6];

  [MEMORY[0x189607870] errorWithInfo:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)retrieveMaxConnectionForUsecase:(unsigned int)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v9 = @"kCBMsgArgUseCase";
  [MEMORY[0x189607968] numberWithUnsignedInt:*(void *)&a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 80LL, v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 objectForKeyedSubscript:@"kCBMsgArgUsecaseCount"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(self) = [v7 intValue];

  return (unsigned __int16)self;
}

- (id)retrieveAddressForPeripheral:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"CBCentralManager.m", 1264, @"Invalid parameter not satisfying: %@", @"peripheral != nil" object file lineNumber description];
  }

  id v12 = @"kCBMsgArgDeviceUUID";
  [v5 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 217LL, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 objectForKeyedSubscript:@"kCBMsgArgAddressString"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updatePeripheral:(id)a3 options:(id)a4
{
  void v12[2] = *MEMORY[0x1895F89C0];
  v11[0] = @"kCBMsgArgDeviceUUID";
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  id v8 = (void *)v7;
  v11[1] = @"kCBMsgArgOptions";
  id v9 = (id)MEMORY[0x189604A60];
  if (v6) {
    id v9 = v6;
  }
  v12[0] = v7;
  v12[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 81LL, v10);
}

- (void)retrieveBTDeviceCacheInfo:(id)a3 withCompletion:(id)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  BOOL v13 = @"kCBMsgArgOptions";
  v14[0] = a3;
  uint64_t v7 = (void *)MEMORY[0x189603F68];
  id v8 = a3;
  [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __61__CBCentralManager_retrieveBTDeviceCacheInfo_withCompletion___block_invoke;
  void v11[3] = &unk_189FB1978;
  id v12 = v6;
  id v10 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 83LL, v9, v11);
}

uint64_t __61__CBCentralManager_retrieveBTDeviceCacheInfo_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)handleSupportedFeatures:(id)a3
{
  gSupportedFeatures = 0;
  [a3 objectForKeyedSubscript:@"kCBMsgArgSupportedFeatures"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:@"kCBMsgArgSupportsExtendedScanAndConnect"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    gSupportedFeatures = 1;
  }
}

- (void)handleRestoringState:(id)a3
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 handleFailureInMethod:a2 object:self file:@"CBCentralManager.m" lineNumber:1307 description:@"Registered delegate no longer supports restoring"];
  }

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v5 objectForKeyedSubscript:@"kCBMsgArgOptions"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CBCentralManager setIsScanning:](self, "setIsScanning:", 1LL);
    [v7 objectForKeyedSubscript:@"kCBMsgArgUUIDs"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 count])
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v8);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v9 forKeyedSubscript:@"kCBRestoredScanServices"];
    }

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v7 objectForKeyedSubscript:@"kCBScanOptionSolicitedServiceUUIDs"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 count])
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v12 forKeyedSubscript:@"kCBScanOptionSolicitedServiceUUIDs"];
    }

    [v7 objectForKeyedSubscript:@"kCBScanOptionAllowDuplicates"];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v13 BOOLValue];

    if (v14) {
      [v10 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"kCBScanOptionAllowDuplicates"];
    }
    if ([v10 count]) {
      [v6 setObject:v10 forKeyedSubscript:@"kCBRestoredScanOptions"];
    }
  }

  v61 = v7;
  id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  v63 = v5;
  [v5 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v68 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
  if (v68)
  {
    uint64_t v65 = *(void *)v109;
    objc_super v66 = v15;
    v67 = self;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v109 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v16;
        id v17 = *(void **)(*((void *)&v108 + 1) + 8 * v16);
        -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v17, v61);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 objectForKeyedSubscript:@"kCBMsgArgState"];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          uint64_t v20 = 1LL;
        }
        [v18 setState:v20];

        objc_msgSend(v18, "setCanSendWriteWithoutResponse:", objc_msgSend(v18, "state") == 2);
        id v74 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v76 = objc_alloc_init(MEMORY[0x189603FA8]);
        [v17 objectForKeyedSubscript:@"kCBMsgArgSubscribedHandles"];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        [v17 objectForKeyedSubscript:@"kCBMsgArgServices"];
        id v70 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v72 = [v70 countByEnumeratingWithState:&v104 objects:v118 count:16];
        if (v72)
        {
          uint64_t v71 = *(void *)v105;
          do
          {
            uint64_t v21 = 0LL;
            do
            {
              if (*(void *)v105 != v71) {
                objc_enumerationMutation(v70);
              }
              uint64_t v73 = v21;
              id v23 = *(void **)(*((void *)&v104 + 1) + 8 * v21);
              id v24 = -[CBService initWithPeripheral:dictionary:]( objc_alloc(&OBJC_CLASS___CBService),  "initWithPeripheral:dictionary:",  v18,  v23);
              id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
              __int128 v100 = 0u;
              __int128 v101 = 0u;
              __int128 v102 = 0u;
              __int128 v103 = 0u;
              [v23 objectForKeyedSubscript:@"kCBMsgArgIncludedServices"];
              id v26 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v27 = [v26 countByEnumeratingWithState:&v100 objects:v117 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v101;
                do
                {
                  for (uint64_t i = 0LL; i != v28; ++i)
                  {
                    if (*(void *)v101 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v100 + 1) + 8 * i);
                    v115[0] = @"service";
                    v115[1] = @"incInfo";
                    v116[0] = v24;
                    v116[1] = v31;
                    [MEMORY[0x189603F68] dictionaryWithObjects:v116 forKeys:v115 count:2];
                    id v32 = (void *)objc_claimAutoreleasedReturnValue();
                    [v76 addObject:v32];
                  }

                  uint64_t v28 = [v26 countByEnumeratingWithState:&v100 objects:v117 count:16];
                }

                while (v28);
              }

              __int128 v98 = 0u;
              __int128 v99 = 0u;
              __int128 v96 = 0u;
              __int128 v97 = 0u;
              [v23 objectForKeyedSubscript:@"kCBMsgArgCharacteristics"];
              id v75 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v81 = [v75 countByEnumeratingWithState:&v96 objects:v114 count:16];
              if (v81)
              {
                uint64_t v78 = *(void *)v97;
                v79 = v25;
                v80 = v24;
                do
                {
                  uint64_t v33 = 0LL;
                  do
                  {
                    if (*(void *)v97 != v78) {
                      objc_enumerationMutation(v75);
                    }
                    uint64_t v82 = v33;
                    __int128 v36 = *(void **)(*((void *)&v96 + 1) + 8 * v33);
                    v37 = -[CBCharacteristic initWithService:dictionary:]( objc_alloc(&OBJC_CLASS___CBCharacteristic),  "initWithService:dictionary:",  v24,  v36);
                    id v38 = objc_alloc_init(MEMORY[0x189603FA8]);
                    v94[0] = MEMORY[0x1895F87A8];
                    v94[1] = 3221225472LL;
                    v94[2] = __41__CBCentralManager_handleRestoringState___block_invoke;
                    v94[3] = &unk_189FB1A68;
                    v39 = v37;
                    v95 = v39;
                    [v77 enumerateObjectsUsingBlock:v94];
                    __int128 v92 = 0u;
                    __int128 v93 = 0u;
                    __int128 v90 = 0u;
                    __int128 v91 = 0u;
                    [v36 objectForKeyedSubscript:@"kCBMsgArgDescriptors"];
                    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v41 = [v40 countByEnumeratingWithState:&v90 objects:v113 count:16];
                    if (v41)
                    {
                      uint64_t v42 = v41;
                      uint64_t v43 = *(void *)v91;
                      do
                      {
                        for (uint64_t j = 0LL; j != v42; ++j)
                        {
                          if (*(void *)v91 != v43) {
                            objc_enumerationMutation(v40);
                          }
                          v45 = -[CBDescriptor initWithCharacteristic:dictionary:]( objc_alloc(&OBJC_CLASS___CBDescriptor),  "initWithCharacteristic:dictionary:",  v39,  *(void *)(*((void *)&v90 + 1) + 8 * j));
                          [v38 addObject:v45];
                          -[CBDescriptor handle](v45, "handle");
                          int v46 = (void *)objc_claimAutoreleasedReturnValue();
                          [v18 setAttribute:v45 forHandle:v46];
                        }

                        uint64_t v42 = [v40 countByEnumeratingWithState:&v90 objects:v113 count:16];
                      }

                      while (v42);
                    }

                    if ([v38 count]) {
                      -[CBCharacteristic setDescriptors:](v39, "setDescriptors:", v38);
                    }
                    id v25 = v79;
                    [v79 addObject:v39];
                    -[CBCharacteristic handle](v39, "handle");
                    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                    [v18 setAttribute:v39 forHandle:v34];

                    -[CBCharacteristic valueHandle](v39, "valueHandle");
                    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
                    [v18 setAttribute:v39 forHandle:v35];

                    uint64_t v33 = v82 + 1;
                    id v24 = v80;
                  }

                  while (v82 + 1 != v81);
                  uint64_t v81 = [v75 countByEnumeratingWithState:&v96 objects:v114 count:16];
                }

                while (v81);
              }

              if ([v25 count]) {
                -[CBService setCharacteristics:](v24, "setCharacteristics:", v25);
              }
              [v74 addObject:v24];
              -[CBService startHandle](v24, "startHandle");
              id v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 setAttribute:v24 forHandle:v22];

              uint64_t v21 = v73 + 1;
            }

            while (v73 + 1 != v72);
            uint64_t v72 = [v70 countByEnumeratingWithState:&v104 objects:v118 count:16];
          }

          while (v72);
        }

        __int128 v88 = 0u;
        __int128 v89 = 0u;
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        id v47 = v76;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v86 objects:v112 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v87;
          do
          {
            for (uint64_t k = 0LL; k != v49; ++k)
            {
              if (*(void *)v87 != v50) {
                objc_enumerationMutation(v47);
              }
              int v52 = *(void **)(*((void *)&v86 + 1) + 8 * k);
              [v52 objectForKeyedSubscript:@"service"];
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              int v54 = objc_alloc(&OBJC_CLASS___CBService);
              [v52 objectForKeyedSubscript:@"incInfo"];
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              int v56 = -[CBService initWithPeripheral:dictionary:](v54, "initWithPeripheral:dictionary:", 0LL, v55);

              v83[0] = MEMORY[0x1895F87A8];
              v83[1] = 3221225472LL;
              v83[2] = __41__CBCentralManager_handleRestoringState___block_invoke_2;
              v83[3] = &unk_189FB1A90;
              v84 = v56;
              id v85 = v53;
              id v57 = v53;
              int v58 = v56;
              [v74 enumerateObjectsUsingBlock:v83];
            }

            uint64_t v49 = [v47 countByEnumeratingWithState:&v86 objects:v112 count:16];
          }

          while (v49);
        }

        if ([v74 count]) {
          [v18 setServices:v74];
        }
        id v15 = v66;
        [v66 addObject:v18];

        uint64_t v16 = v69 + 1;
        self = v67;
      }

      while (v69 + 1 != v68);
      uint64_t v68 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
    }

    while (v68);
  }

  if ([v15 count]) {
    [v6 setObject:v15 forKeyedSubscript:@"kCBRestoredPeripherals"];
  }
  v59 = -[CBCentralManager delegate](self, "delegate", v61);
  [v59 centralManager:self willRestoreState:v6];
}

void __41__CBCentralManager_handleRestoringState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 handle];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v7 isEqualToNumber:v8];

  if (v9)
  {
    [*(id *)(a1 + 32) setIsNotifying:1];
    *a4 = 1;
  }

void __41__CBCentralManager_handleRestoringState___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v15 = a2;
  [v15 UUID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) UUID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v6 isEqual:v7] & 1) == 0) {
    goto LABEL_7;
  }
  [v15 startHandle];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) startHandle];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v8 isEqualToNumber:v9])
  {

LABEL_7:
LABEL_8:

    goto LABEL_9;
  }

  [v15 endHandle];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endHandle];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v10 isEqualToNumber:v11];

  if (v12)
  {
    [*(id *)(a1 + 40) includedServices];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      [*(id *)(a1 + 40) includedServices];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = (id)[v14 mutableCopy];
    }

    else
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    }

    [v6 addObject:v15];
    [*(id *)(a1 + 40) setIncludedServices:v6];
    *a4 = 1;
    goto LABEL_8;
  }

- (void)handlePeripheralDiscovered:(id)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_isScanning && (*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBMsgArgAdvertisingMoreAvailable"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 integerValue];

    [v4 objectForKeyedSubscript:@"kCBMsgArgAdvertisingIsFromADVBuff"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 integerValue];

    if (!v5)
    {
      if (!v7 && v9 && (*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0)
      {
        -[CBCentralManager delegate](self, "delegate");
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSMutableArray count](self->_discoveredPeripherals, "count")) {
          discoveredPeripherals = self->_discoveredPeripherals;
        }
        else {
          discoveredPeripherals = 0LL;
        }
        [v33 centralManager:self didDiscoverMultiplePeripherals:discoveredPeripherals];

        -[NSMutableArray removeAllObjects](self->_discoveredPeripherals, "removeAllObjects");
      }

      goto LABEL_40;
    }

    uint64_t v44 = v9;
    [v4 objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = (void *)[v10 mutableCopy];

    uint64_t v46 = [v4 objectForKeyedSubscript:@"kCBMsgArgRssi"];
    [v11 objectForKeyedSubscript:@"kCBAdvDataServiceUUIDs"];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v12);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setObject:v13 forKeyedSubscript:@"kCBAdvDataServiceUUIDs"];
    }

    uint64_t v14 = [v11 objectForKeyedSubscript:@"kCBAdvDataSolicitedServiceUUIDs"];
    if (v14)
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v14);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setObject:v15 forKeyedSubscript:@"kCBAdvDataSolicitedServiceUUIDs"];
    }

    v45 = (void *)v14;
    [v11 objectForKeyedSubscript:@"kCBAdvDataHashedServiceUUIDs"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v16);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setObject:v17 forKeyedSubscript:@"kCBAdvDataHashedServiceUUIDs"];
    }

    [v4 objectForKey:@"kCBScanOptionFilterIdentifier"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      int v19 = (void *)MEMORY[0x189607968];
      [v4 objectForKeyedSubscript:@"kCBScanOptionFilterIdentifier"];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedLongLong:", objc_msgSend(v20, "unsignedLongLongValue"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setObject:v21 forKeyedSubscript:@"kCBScanOptionFilterIdentifier"];
    }

    [v4 objectForKey:@"kCBScanOptionFilterIdentifierString"];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      [v4 objectForKeyedSubscript:@"kCBScanOptionFilterIdentifierString"];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setObject:v23 forKeyedSubscript:@"kCBScanOptionFilterIdentifierString"];
    }

    id v24 = @"kCBAdvDataServiceData";
    [v11 objectForKeyedSubscript:@"kCBAdvDataServiceData"];
    id v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      uint64_t v42 = v7;
      uint64_t v43 = v12;
      id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      id v26 = v47;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        v39 = @"kCBAdvDataServiceData";
        uint64_t v40 = v16;
        uint64_t v41 = v5;
        uint64_t v29 = 0LL;
        uint64_t v30 = *(void *)v49;
        do
        {
          for (uint64_t i = 0LL; i != v28; ++i)
          {
            while (1)
            {
              if (*(void *)v49 != v30) {
                objc_enumerationMutation(v26);
              }
              uint64_t v32 = *(void *)(*((void *)&v48 + 1) + 8 * i);
              if (v29) {
                break;
              }
              +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v32);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28 == ++i) {
                goto LABEL_17;
              }
            }

            [v25 setObject:v32 forKeyedSubscript:v29];

            uint64_t v29 = 0LL;
          }

- (void)handlePeripheralInvalidated:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v6 = v4;
    -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      -[NSMapTable removeObjectForKey:](self->_peripherals, "removeObjectForKey:", v6);
    }

    id v4 = v6;
  }
}

- (void)handleScanComplete:(id)a3
{
  id v4 = a3;
  if (self->_scanCompletion)
  {
    uint64_t v9 = v4;
    [MEMORY[0x189607870] errorWithInfo:v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id scanCompletion = (void (**)(id, void *, void *))self->_scanCompletion;
    if (v5)
    {
      [v9 objectForKeyedSubscript:@"kCBScanOptionTotalRXTimeMS"];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      scanCompletion[2](scanCompletion, v5, v7);
    }

    else
    {
      scanCompletion[2](self->_scanCompletion, 0LL, 0LL);
    }

    id v8 = self->_scanCompletion;
    self->_id scanCompletion = 0LL;

    id v4 = v9;
  }
}

- (void)handleScanParamsUpdated:(id)a3
{
  if ((*((_BYTE *)&self->_delegateFlags + 3) & 2) != 0)
  {
    id v4 = a3;
    -[CBCentralManager delegate](self, "delegate");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 centralManager:self didUpdateScanParams:v4];
  }

- (void)handleFindMyDevicesUpdated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((*((_BYTE *)&self->_delegateFlags + 3) & 4) != 0)
  {
    id v5 = (void *)objc_opt_new();
    [v4 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[CBCentralManager peripheralWithInfo:]( self,  "peripheralWithInfo:",  *(void *)(*((void *)&v13 + 1) + 8 * v10));
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v11];

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    -[CBCentralManager delegate](self, "delegate");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 centralManager:self didUpdateFindMyPeripherals:v5];
  }
}

- (void)handlePeripheralConnectionCompleted:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [MEMORY[0x189607870] errorWithInfo:v4];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      [v6 handleFailedConnection];
      [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithInt:341];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v8 isEqualToNumber:v9];

      if (v10)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
        {
          -[CBCentralManager handlePeripheralConnectionCompleted:].cold.1();
          if ((*(_BYTE *)&self->_delegateFlags & 8) == 0) {
            goto LABEL_22;
          }
          goto LABEL_20;
        }
      }

      else
      {
        [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithInt:348];
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = [v13 isEqualToNumber:v14];

        if (v15)
        {
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          }
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
          {
            -[CBCentralManager handlePeripheralConnectionCompleted:].cold.2();
            if ((*(_BYTE *)&self->_delegateFlags & 8) == 0) {
              goto LABEL_22;
            }
            goto LABEL_20;
          }
        }
      }

      if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
      {
LABEL_20:
        -[CBCentralManager delegate](self, "delegate");
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 centralManager:self didFailToConnectPeripheral:v6 error:v7];
        goto LABEL_21;
      }
    }

    else
    {
      [v6 handleSuccessfulConnection:v4];
      if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
      {
        -[CBCentralManager delegate](self, "delegate");
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 centralManager:self didConnectPeripheral:v6];
LABEL_21:
      }
    }

- (void)handlePeripheralCLReady:(id)a3
{
  id v8 = a3;
  [v8 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [MEMORY[0x189607870] errorWithInfo:v8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && (*((_BYTE *)&self->_delegateFlags + 2) & 1) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 centralManager:self canSendDataToPeripheral:v5];
    }
  }
}

- (void)handlePeripheralDisconnectionCompleted:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [MEMORY[0x189607870] errorWithInfo:v4];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBDisconnectInfoTimestamp"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 doubleValue];
    double v10 = v9;

    [v4 objectForKeyedSubscript:@"kCBDisconnectInfoIsReconnecting"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 BOOLValue];

    [v6 handleDisconnection];
    if ((_DWORD)v12) {
      [v6 setState:1];
    }
    [v6 identifier];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v13);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      int v15 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_186F9B000, v15, OS_LOG_TYPE_DEFAULT, "WHB device %@ disconnected", (uint8_t *)&v21, 0xCu);
      }

      [v14 peerDevice];
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 identifier];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBManager removeWhbRemoteId:](self, "removeWhbRemoteId:", v17);

      [v6 identifier];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBManager removeCnxInstanceForIdentifier:](self, "removeCnxInstanceForIdentifier:", v18);
    }

    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    if ((*(_BYTE *)&delegateFlags & 0x10) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 centralManager:self didDisconnectPeripheral:v6 error:v7];
    }

    else
    {
      if ((*(_BYTE *)&delegateFlags & 0x20) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }

      -[CBCentralManager delegate](self, "delegate");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 centralManager:self didDisconnectPeripheral:v6 timestamp:v12 isReconnecting:v7 error:v10];
    }

    goto LABEL_15;
  }

- (void)handleApplicationConnectionEventDidOccur:(id)a3
{
  id v4 = a3;
  -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionEvent"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 intValue];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBCentralManager handleApplicationConnectionEventDidOccur:].cold.1();
    if (!v5) {
      goto LABEL_7;
    }
  }

  else if (!v5)
  {
    goto LABEL_7;
  }

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 8) != 0)
  {
    [v5 handleConnectionStateUpdated:v7 != 0];
    -[CBCentralManager delegate](self, "delegate");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 centralManager:self connectionEventDidOccur:v7 forPeripheral:v5];
  }

- (void)handleScanFailedToStartWithError:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBCentralManager handleScanFailedToStartWithError:].cold.3();
  }
  [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:341];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v5 isEqualToNumber:v6];

  if (v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }

    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
LABEL_8:
    }
      -[CBCentralManager handleScanFailedToStartWithError:].cold.1();
  }

  else
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInt:348];
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v8 isEqualToNumber:v9];

    if (!v10) {
      goto LABEL_12;
    }
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
    }

    -[CBCentralManager handleScanFailedToStartWithError:].cold.2();
  }

- (void)handlePeripheralConnectionStateUpdated:(id)a3
{
  id v7 = a3;
  -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v7 objectForKeyedSubscript:@"kCBMsgArgConnectionState"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleConnectionStateUpdated:", objc_msgSend(v5, "BOOLValue"));
    if ((*(_BYTE *)&self->_delegateFlags & 0x40) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 centralManager:self didUpdatePeripheralConnectionState:v4];
    }
  }
}

- (void)handlePeripheralTrackingUpdated:(id)a3
{
  id v4 = a3;
  -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBTrackingOptionType"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBTrackingOptionState"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v5 && v6)
  {
    int v7 = [v6 isEqual:&unk_189FD5AA0];
    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    if (v7)
    {
      if ((*(_WORD *)&delegateFlags & 0x100) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained centralManager:self didLosePeripheral:v10 forType:v5];
LABEL_9:
      }
    }

    else if ((*(_BYTE *)&delegateFlags & 0x80) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained centralManager:self didFindPeripheral:v10 forType:v5];
      goto LABEL_9;
    }
  }
}

- (void)handleApplicationActivityEvent:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgState"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 BOOLValue];
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        [v11 centralManager:self application:v12 isActive:v6];
      }
    }
  }
}

- (void)handleZoneLost:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgLeZone"];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgLeZoneMask"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 2) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 centralManager:self didLoseZone:v7 mask:v5];
  }
}

- (void)HandleControllerBTClockUpdateMsg:(id)a3
{
  id v14 = a3;
  [v14 objectForKeyedSubscript:@"kCBGetControllerBTClockSeconds"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBGetControllerBTClockMicroSeconds"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBGetControllerBTClockEventType"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBGetControllerBTLocalClock"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBGetControllerBTRemoteClock"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    if ((*(_DWORD *)&delegateFlags & 0x40000) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 centralManager:self didUpdateControllerBTClockForPeripheral:v10 eventType:v6 seconds:v4 microseconds:v5 localClock:v7 remoteClock:v8];

      $07E581FC71E438F638AFE4D881A2E6BE delegateFlags = self->_delegateFlags;
    }

    if ((*(_DWORD *)&delegateFlags & 0x80000) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 centralManager:self didUpdateControllerBTClockDictForPeripheral:v10 results:v14];
    }
  }
}

- (void)HandleRssiDetectionUpdateMsg:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithInfo:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x20) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 centralManager:self didUpdateRSSIStatisticsDetectionForPeripheral:v6 results:v4 error:v7];
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v9 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( &dword_186F9B000,  v9,  OS_LOG_TYPE_DEFAULT,  "No peripheral found in HandleRssiDetectionUpdateMsg for args %@",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)HandleBluetoothUsageEventMsg:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithInfo:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x40) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 centralManager:self didUpdateUsageStatisticEvent:v6 results:v4 error:v7];
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v9 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( &dword_186F9B000,  v9,  OS_LOG_TYPE_DEFAULT,  "No peripheral found in HandleBluetoothUsageEventMsg for args %@",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)HandleBluetoothPhyStatisticEventMsg:(id)a3
{
  id v8 = a3;
  [v8 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithInfo:v8];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (*((_BYTE *)&self->_delegateFlags + 2) & 0x80) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 centralManager:self didUpdatePhyStatisticEvent:v5 results:v8 error:v6];
  }
}

- (void)HandleCSProcedureEventMsg:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithInfo:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((*((_BYTE *)&self->_delegateFlags + 3) & 1) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 centralManager:self didChannelSoundingProcedureEvent:v6 results:v4 error:v7];
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v9 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( &dword_186F9B000,  v9,  OS_LOG_TYPE_DEFAULT,  "No peripheral found in HandleCSProcedureEventMsg for args %@",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)handleConnectionParametersUpdated:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionInterval"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionLatency"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgSupervisionTimeout"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (*((_BYTE *)&self->_delegateFlags + 1) & 4) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 centralManager:self didUpdateConnectionParameters:v10 interval:v6 latency:v7 supervisionTimeout:v8];
  }
}

- (void)handleReadyForUpdates:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  -[NSMapTable objectEnumerator](self->_peripherals, "objectEnumerator", a3, 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) isReadyForUpdates];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (id)retrievePeripheralWithAddress:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v12 = @"kCBMsgArgAddressString";
    [MEMORY[0x189607810] whitespaceCharacterSet];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringByTrimmingCharactersInSet:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 75LL, v7);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v8 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v9);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setBDAddress:v4];
    }

    else
    {
      __int128 v10 = 0LL;
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBCentralManager retrievePeripheralWithAddress:].cold.1();
    }
    __int128 v10 = 0LL;
  }

  return v10;
}

- (void)addIRKwithBTAddress:(id)a3 irk:(id)a4
{
  void v13[2] = *MEMORY[0x1895F89C0];
  id v6 = (id)MEMORY[0x189604A58];
  if (a3) {
    id v6 = a3;
  }
  v12[0] = @"kCBSetIRKForAddressPublicAddress";
  v12[1] = @"kCBSetIRKForAddressIRK";
  id v7 = (id)MEMORY[0x189604A60];
  if (a4) {
    id v7 = a4;
  }
  v13[0] = v6;
  v13[1] = v7;
  __int128 v8 = (void *)MEMORY[0x189603F68];
  id v9 = a4;
  id v10 = a3;
  [v8 dictionaryWithObjects:v13 forKeys:v12 count:2];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 130LL, v11);
}

- (void)removeIRKwithBTAddress:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x189604A58];
  }
  __int128 v8 = @"kCBSetIRKForAddressPublicAddress";
  v9[0] = v4;
  uint64_t v5 = (void *)MEMORY[0x189603F68];
  id v6 = a3;
  [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 131LL, v7);
}

- (void)deleteDevice:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v7 = @"kCBMsgArgDeviceUUID";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 132LL, v6);

  -[NSMapTable removeObjectForKey:](self->_peripherals, "removeObjectForKey:", v5);
}

- (id)createPeripheralWithAddress:(id)a3 andIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x189603FC8];
  id v8 = a3;
  [v7 dictionary];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v8 forKeyedSubscript:@"kCBAdvOptionInstanceRandomAddressBytes"];

  if (v6) {
    [v9 setObject:v6 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  }
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 76LL, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (void)createPeripheralFromIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x189603FC8];
  id v8 = a3;
  [v7 dictionary];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v8 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __62__CBCentralManager_createPeripheralFromIdentifier_completion___block_invoke;
  void v11[3] = &unk_189FB1AB8;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 77LL, v9, v11);
}

void __62__CBCentralManager_createPeripheralFromIdentifier_completion___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v4 = [a2 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    id v6 = (id)v4;
    if (v4)
    {
      [*(id *)(a1 + 32) peripheralWithInfo:v4];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v5 = 0LL;
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

- (void)readLocalFastLeConnectionCachedControllerInfoWithcompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __80__CBCentralManager_readLocalFastLeConnectionCachedControllerInfoWithcompletion___block_invoke;
  v6[3] = &unk_189FB1978;
  id v7 = v4;
  id v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 82LL, MEMORY[0x189604A60], v6);
}

void __80__CBCentralManager_readLocalFastLeConnectionCachedControllerInfoWithcompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v5, v7);
  }

  else
  {
    [MEMORY[0x189607870] errorWithInfo:v9];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:@"kCBFastLeConnectionInfoData"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
}

- (void)handleDidSendBytesToPeripheralwithError:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v4 objectForKeyedSubscript:@"kCBMsgArgBytesSent"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607870] errorWithInfo:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (*((_BYTE *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 centralManager:self didSendBytes:v6 toPeripheral:v9 withError:v7];
  }
}

- (void)handleDidReceiveDataFromPeripheral:(id)a3
{
  id v12 = a3;
  [v12 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = v12;
  if (!v5)
  {
    [v12 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v7, 0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralsWithIdentifiers:](self, "retrievePeripheralsWithIdentifiers:", v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v9 count])
    {

      uint64_t v6 = v12;
      goto LABEL_4;
    }

    [v9 objectAtIndexedSubscript:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = v12;
    if (!v5)
    {
LABEL_4:

      return;
    }
  }

  [v6 objectForKeyedSubscript:@"kCBMsgArgObjectDiscoveryData"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 centralManager:self didReceiveData:v10 fromPeripheral:v5];
  }
}

- (void)handleAncsAuthChanged:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v4 objectForKey:@"kCBMsgArgAncsAuthorization"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 BOOLValue];
  if (v9)
  {
    [v9 setAncsAuthorized:v7];
    if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x80) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 centralManager:self didUpdateANCSAuthorizationForPeripheral:v9];
    }
  }
}

- (void)handlePeerMTUChanged:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBCentralManager handlePeerMTUChanged:].cold.1();
  }
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (*((_BYTE *)&self->_delegateFlags + 2) & 0x10) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 centralManager:self didUpdateMTUForPeripheral:v6];
  }
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return (a3 & 0xFFFFFFFB) == 10;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  BOOL result = 1;
  if ((a3 - 8) >= 2 && a3 != 206)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CBCentralManager;
    return -[CBManager isMsgAllowedAlways:](&v7, sel_isMsgAllowedAlways_);
  }

  return result;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  uint64_t v8 = 0LL;
  switch((int)v4)
  {
    case 16:
    case 17:
    case 18:
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 handlePairingMessage:v4 args:v7];

      return;
    case 23:
    case 24:
    case 165:
    case 166:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 185:
    case 189:
    case 190:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 203:
    case 204:
      goto LABEL_2;
    case 29:
      -[CBCentralManager handleSupportedFeatures:](self, "handleSupportedFeatures:", v6);

      return;
    case 56:
      int v11 = 0;
      uint64_t v8 = sel_handleReadyForUpdates_;
      goto LABEL_4;
    case 59:
      uint64_t v8 = sel_handleAdvertisingAddressChanged_;
      goto LABEL_29;
    case 84:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralDiscovered_;
      goto LABEL_4;
    case 85:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralConnectionCompleted_;
      goto LABEL_4;
    case 86:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralCLReady_;
      goto LABEL_4;
    case 87:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralDisconnectionCompleted_;
      goto LABEL_4;
    case 88:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralConnectionStateUpdated_;
      goto LABEL_4;
    case 89:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralTrackingUpdated_;
      goto LABEL_4;
    case 90:
      int v11 = 0;
      uint64_t v8 = sel_handleZoneLost_;
      goto LABEL_4;
    case 91:
      int v11 = 0;
      uint64_t v8 = sel_handleApplicationActivityEvent_;
      goto LABEL_4;
    case 92:
      uint64_t v8 = sel_handleRestoringState_;
LABEL_29:
      int v11 = 1;
      goto LABEL_4;
    case 94:
      int v11 = 0;
      uint64_t v8 = sel_handleApplicationConnectionEventDidOccur_;
      goto LABEL_4;
    case 110:
      -[CBCentralManager handleAncsAuthChanged:](self, "handleAncsAuthChanged:", v6);

      return;
    case 129:
      int v11 = 0;
      uint64_t v8 = sel_handleScanFailedToStartWithError_;
      goto LABEL_4;
    case 133:
      -[CBCentralManager handleScanComplete:](self, "handleScanComplete:", v6);

      return;
    case 134:
      -[CBCentralManager handleScanParamsUpdated:](self, "handleScanParamsUpdated:", v6);

      return;
    case 135:
      -[CBCentralManager handleFindMyDevicesUpdated:](self, "handleFindMyDevicesUpdated:", v6);

      return;
    case 136:
      int v11 = 0;
      uint64_t v8 = sel_handlePeripheralInvalidated_;
      goto LABEL_4;
    case 138:
      int v11 = 0;
      uint64_t v8 = sel_handleDidSendBytesToPeripheralwithError_;
      goto LABEL_4;
    case 139:
      int v11 = 0;
      uint64_t v8 = sel_handleDidReceiveDataFromPeripheral_;
      goto LABEL_4;
    case 164:
      uint64_t v8 = sel_handlePeerMTUChanged_;
LABEL_2:
      [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v9);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      [v10 handleMsg:v4 args:v7];
      if ((_DWORD)v4 != 164) {
        goto LABEL_7;
      }
      int v11 = 0;
LABEL_4:
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn
        || ((-[CBManager state](self, "state") != 10) & ~v11) == 0)
      {
        objc_msgSend(self, v8, v7);
LABEL_7:

        return;
      }

      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      -[CBCentralManager handleMsg:args:].cold.2();

      return;
    case 167:
      int v11 = 0;
      uint64_t v8 = sel_handleConnectionParametersUpdated_;
      goto LABEL_4;
    case 210:
      int v11 = 0;
      uint64_t v8 = sel_HandleControllerBTClockUpdateMsg_;
      goto LABEL_4;
    case 213:
      int v11 = 0;
      uint64_t v8 = sel_handleUpdateUsageNotificationForPeripheral_;
      goto LABEL_4;
    case 214:
      int v11 = 0;
      uint64_t v8 = sel_HandleRssiDetectionUpdateMsg_;
      goto LABEL_4;
    case 215:
      int v11 = 0;
      uint64_t v8 = sel_HandleBluetoothUsageEventMsg_;
      goto LABEL_4;
    case 216:
      int v11 = 0;
      uint64_t v8 = sel_HandleBluetoothPhyStatisticEventMsg_;
      goto LABEL_4;
    case 221:
      int v11 = 0;
      uint64_t v8 = sel_HandleCSProcedureEventMsg_;
      goto LABEL_4;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      uint64_t v13 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      -[CBCentralManager handleMsg:args:].cold.1(v4, v13);

      return;
  }

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (NSMapTable)peripherals
{
  return self->_peripherals;
}

- (id)scanCompletion
{
  return self->_scanCompletion;
}

- (void)setScanCompletion:(id)a3
{
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (NSMutableArray)discoveredPeripherals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setDiscoveredPeripherals:(id)a3
{
}

- (void).cxx_destruct
{
}

void __37__CBCentralManager_orphanPeripherals__block_invoke_cold_1()
{
}

- (void)initWithDelegate:queue:options:.cold.1()
{
}

- (void)retrieveWhbCBPeripheralWithInfo:.cold.1()
{
}

- (void)activateWhbCnxForCBPeripheral:infoDict:.cold.1()
{
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1()
{
}

- (void)connectWhbCBPeripheral:withCompletion:.cold.1()
{
}

- (void)handlePeripheralConnectionCompleted:.cold.1()
{
}

- (void)handlePeripheralConnectionCompleted:.cold.2()
{
}

- (void)handleApplicationConnectionEventDidOccur:.cold.1()
{
}

- (void)handleScanFailedToStartWithError:.cold.1()
{
}

- (void)handleScanFailedToStartWithError:.cold.2()
{
}

- (void)handleScanFailedToStartWithError:.cold.3()
{
}

- (void)retrievePeripheralWithAddress:.cold.1()
{
}

- (void)handlePeerMTUChanged:.cold.1()
{
}

- (void)handleMsg:(int)a1 args:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_186F9B000, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5_0();
}

- (void)handleMsg:args:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_186F9B000, v1, OS_LOG_TYPE_DEBUG, "%@ is not powered on, ignoring message: %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

@end