@interface CBPeripheralManager
+ (BOOL)supportsFeatures:(unint64_t)a3;
+ (CBPeripheralManagerAuthorizationStatus)authorizationStatus;
+ (void)authorizationStatus;
- (BOOL)isAdvertising;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)readyForUpdates;
- (BOOL)supportsMultipleAdvertising;
- (BOOL)updateValue:(NSData *)value forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:(NSArray *)centrals;
- (BOOL)waitingForReady;
- (CBPeripheralManager)init;
- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options;
- (NSHashTable)l2capChannels;
- (NSLock)updateLock;
- (NSMapTable)centrals;
- (NSMutableArray)services;
- (NSMutableDictionary)characteristicIDs;
- (NSNumber)multipleAdvertisingSupported;
- (id)addXPCDelayTiming:(id)a3 args:(id)a4;
- (id)centralWithIdentifier:(id)a3;
- (id)centralWithInfo:(id)a3;
- (id)delegate;
- (id)getNonConnectableIdentity;
- (id)incomingConnectionRequestCompletion;
- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4;
- (unint64_t)attributeIDGenerator;
- (void)HandleControllerPeripheralBTClockUpdateMsg:(id)a3;
- (void)HandleOfflineAdvPayloadRequestedWithReason:(id)a3;
- (void)addService:(CBMutableService *)service;
- (void)addressRotationState:(id)a3;
- (void)dealloc;
- (void)forEachCentral:(id)a3;
- (void)handleAdvertisingStarted:(id)a3;
- (void)handleAdvertisingStopped:(id)a3;
- (void)handleCentralDidUpdateANCSAuthorization:(id)a3;
- (void)handleConnectionParametersUpdated:(id)a3;
- (void)handleGetAttributeValue:(id)a3;
- (void)handleIncomingCISConnectionRequest:(id)a3;
- (void)handleL2CAPChannelClosed:(id)a3;
- (void)handleL2CAPChannelOpened:(id)a3;
- (void)handleL2CAPChannelPublished:(id)a3;
- (void)handleL2CAPChannelUnpublished:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handleNotificationAdded:(id)a3;
- (void)handleNotificationRemoved:(id)a3;
- (void)handlePeriodicAdvertisingStarted:(id)a3;
- (void)handlePeriodicAdvertisingStopped:(id)a3;
- (void)handleReadyForUpdates:(id)a3;
- (void)handleRestoringState:(id)a3;
- (void)handleServiceAdded:(id)a3;
- (void)handleSetAttributeValues:(id)a3;
- (void)handleSolicitedServicesFound:(id)a3;
- (void)handleSupportedFeatures:(id)a3;
- (void)incomingAddress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideLocalLeAddress:(id)a3;
- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4;
- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 options:(id)a5;
- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 priority:(int64_t)a5;
- (void)publishL2CAPChannelWithEncryption:(BOOL)a3 priority:(int64_t)a4;
- (void)publishL2CAPChannelWithEncryption:(BOOL)encryptionRequired;
- (void)refreshNonConnectableIdentity;
- (void)removeAllL2CAPChannels;
- (void)removeAllServices;
- (void)removeService:(CBMutableService *)service;
- (void)requestStableAddress:(id)a3;
- (void)respondToRequest:(CBATTRequest *)request withResult:(CBATTError)result;
- (void)respondToTransaction:(id)a3 value:(id)a4 attributeID:(id)a5 result:(int64_t)a6;
- (void)retrieveBluetoothUsageStatistics:(id)a3 completion:(id)a4;
- (void)setAttributeIDGenerator:(unint64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setDesiredConnectionLatency:(CBPeripheralManagerConnectionLatency)latency forCentral:(CBCentral *)central;
- (void)setIncomingConnectionRequestCompletion:(id)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setMultipleAdvertisingSupported:(id)a3;
- (void)setOfflineAdvertisingParamsAndData:(id)a3;
- (void)startAdvertising:(NSDictionary *)advertisementData;
- (void)startPeriodicAdvertising:(id)a3;
- (void)stopAdvertising;
- (void)stopPeriodicAdvertising:(id)a3;
- (void)supportsMultipleAdvertising;
- (void)unpublishL2CAPChannel:(CBL2CAPPSM)PSM;
@end

@implementation CBPeripheralManager

- (id)centralWithInfo:(id)a3
{
  id v4 = a3;
  centrals = self->_centrals;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](centrals, "objectForKey:", v6);
  v7 = (CBCentral *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[CBPeer initWithInfo:manager:](objc_alloc(&OBJC_CLASS___CBCentral), "initWithInfo:manager:", v4, self);
    v8 = self->_centrals;
    [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v7, v9);
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgATTMTU"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10) {
    -[CBPeer setMtuLength:](v7, "setMtuLength:", [v10 unsignedIntegerValue]);
  }

  return v7;
}

- (void)forEachCentral:(id)a3
{
  v8 = (void (**)(id, void *))a3;
  -[NSMapTable objectEnumerator](self->_centrals, "objectEnumerator");
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

- (void)dealloc
{
  l2capChannels = self->_l2capChannels;
  if (l2capChannels) {
    -[NSHashTable removeAllObjects](l2capChannels, "removeAllObjects");
  }
  if (self->_observingKeyPaths)
  {
    -[CBPeripheralManager removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  self,  @"delegate",  objc_opt_class());
    -[CBPeripheralManager removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  self,  @"state",  objc_opt_class());
    -[CBPeripheralManager removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  self,  @"localName",  objc_opt_class());
    self->_observingKeyPaths = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CBPeripheralManager;
  -[CBManager dealloc](&v4, sel_dealloc);
}

- (id)centralWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_centrals, "objectForKey:", a3);
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 priority:(int64_t)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  v11[1] = *MEMORY[0x1895F89C0];
  v10 = @"kCBL2CAPChannelPriority";
  [MEMORY[0x189607968] numberWithInteger:a5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:]( self,  "publishL2CAPChannel:requiresEncryption:options:",  v6,  v5,  v9);
}

- (void)publishL2CAPChannelWithEncryption:(BOOL)a3 priority:(int64_t)a4
{
  BOOL v4 = a3;
  v9[1] = *MEMORY[0x1895F89C0];
  v8 = @"kCBL2CAPChannelPriority";
  [MEMORY[0x189607968] numberWithInteger:a4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:]( self,  "publishL2CAPChannel:requiresEncryption:options:",  0LL,  v4,  v7);
}

- (void)publishL2CAPChannelWithEncryption:(BOOL)encryptionRequired
{
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4
{
}

- (void)publishL2CAPChannel:(unsigned __int16)a3 requiresEncryption:(BOOL)a4 options:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  v16[3] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v9 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:options:].cold.1(v6, v5, v9);
  }
  v15[0] = @"kCBMsgArgPSM";
  [MEMORY[0x189607968] numberWithUnsignedShort:v6];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = @"kCBMsgArgRequiresEncryption";
  uint64_t v11 = [MEMORY[0x189607968] numberWithBool:v5];
  v12 = (void *)v11;
  v15[2] = @"kCBMsgArgOptions";
  id v13 = (id)MEMORY[0x189604A60];
  if (v8) {
    id v13 = v8;
  }
  v16[1] = v11;
  v16[2] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 19LL, v14);
}

- (void)unpublishL2CAPChannel:(CBL2CAPPSM)PSM
{
  uint64_t v3 = PSM;
  v11[1] = *MEMORY[0x1895F89C0];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v6 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBPeripheralManager unpublishL2CAPChannel:].cold.1(v3, v6);
    if ((_DWORD)v3) {
      goto LABEL_5;
    }
LABEL_7:
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 165, @"Invalid parameter not satisfying: %@", @"psm > 0" object file lineNumber description];

    goto LABEL_5;
  }

  if (!(_DWORD)v3) {
    goto LABEL_7;
  }
LABEL_5:
  v10 = @"kCBMsgArgPSM";
  [MEMORY[0x189607968] numberWithUnsignedShort:v3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 20LL, v8);
}

- (void)overrideLocalLeAddress:(id)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  BOOL v5 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager overrideLocalLeAddress:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v15 = @"kCBMsgArgAddressString";
  [MEMORY[0x189607810] whitespaceCharacterSet];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByTrimmingCharactersInSet:v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 60LL, v14);
}

- (void)addressRotationState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __44__CBPeripheralManager_addressRotationState___block_invoke;
  v6[3] = &unk_189FB1978;
  id v7 = v4;
  id v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 46LL, MEMORY[0x189604A60], v6);
}

void __44__CBPeripheralManager_addressRotationState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (a3)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a3, 0LL);
  }

  else
  {
    [MEMORY[0x189607870] errorWithInfo:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v8);
  }
}

- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = self->_l2capChannels;
  uint64_t v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_4:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      objc_msgSend(v12, "peer", (void)v17);
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v13 isEqual:v6])
      {
        int v14 = [v12 PSM];

        if (v14 == v4)
        {
          id v15 = v12;

          goto LABEL_17;
        }
      }

      else
      {
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
        if (!v9) {
          break;
        }
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBPeripheralManager l2capChannelForPeer:withPsm:].cold.1();
  }
  id v15 = 0LL;
LABEL_17:

  return v15;
}

- (void)removeAllL2CAPChannels
{
}

- (void)refreshNonConnectableIdentity
{
}

- (void)requestStableAddress:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __44__CBPeripheralManager_requestStableAddress___block_invoke;
  v6[3] = &unk_189FB1978;
  id v7 = v4;
  id v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 45LL, MEMORY[0x189604A60], v6);
}

void __44__CBPeripheralManager_requestStableAddress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void, uint64_t))(v3 + 16))(*(void *)(a1 + 32), a3);
  }

  else
  {
    [MEMORY[0x189607870] errorWithInfo:a2];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }

- (id)getNonConnectableIdentity
{
  void v9[2] = *MEMORY[0x1895F89C0];
  v2 = -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 162LL, 0LL);
  [v2 objectForKeyedSubscript:@"kCBMsgArgIdentityIRK"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 objectForKeyedSubscript:@"kCBMsgArgIdentityAddress"];
  id v5 = (void *)v4;
  id v6 = 0LL;
  if (v4 && v3)
  {
    v8[0] = @"kCBMsgArgIdentityAddress";
    v8[1] = @"kCBMsgArgIdentityIRK";
    v9[0] = v4;
    v9[1] = v3;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:v8 count:2];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (CBPeripheralManagerAuthorizationStatus)authorizationStatus
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    +[CBPeripheralManager authorizationStatus].cold.1();
  }
  return 3LL;
}

- (CBPeripheralManager)init
{
  return -[CBPeripheralManager initWithDelegate:queue:](self, "initWithDelegate:queue:", 0LL, 0LL);
}

- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  v13[1] = *MEMORY[0x1895F89C0];
  v12 = @"kCBInitOptionShowPowerAlert";
  v13[0] = MEMORY[0x189604A88];
  id v6 = (void *)MEMORY[0x189603F68];
  id v7 = queue;
  id v8 = delegate;
  [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[CBPeripheralManager initWithDelegate:queue:options:](self, "initWithDelegate:queue:options:", v8, v7, v9);

  return v10;
}

- (CBPeripheralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options
{
  id v9 = delegate;
  uint64_t v10 = queue;
  uint64_t v11 = options;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CBPeripheralManager;
  v12 = -[CBManager initInternal](&v32, sel_initInternal);
  if (v12)
  {
    -[CBPeripheralManager addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"state",  0LL,  objc_opt_class());
    -[CBPeripheralManager addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"delegate",  0LL,  objc_opt_class());
    -[CBPeripheralManager addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"localName",  0LL,  objc_opt_class());
    v12->_observingKeyPaths = 1;
    -[CBPeripheralManager setDelegate:](v12, "setDelegate:", v9);
    uint64_t v13 = [objc_alloc(MEMORY[0x189607920]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    centrals = v12->_centrals;
    v12->_centrals = (NSMapTable *)v13;

    id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    services = v12->_services;
    v12->_services = v15;

    __int128 v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    characteristicIDs = v12->_characteristicIDs;
    v12->_characteristicIDs = v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1896078B8]) initWithOptions:5 capacity:0];
    l2capChannels = v12->_l2capChannels;
    v12->_l2capChannels = (NSHashTable *)v19;

    v21 = (NSLock *)objc_alloc_init(MEMORY[0x189607910]);
    updateLock = v12->_updateLock;
    v12->_updateLock = v21;

    *(_WORD *)&v12->_readyForUpdates = 1;
    v12->_attributeIDGenerator = 1LL;
    -[CBManager setTccComplete:](v12, "setTccComplete:", 0LL);
    v23 = -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", @"kCBInitOptionRestoreIdentifier");
    $43C94FEDEB33BD172F576B255845D8E8 delegateFlags = v12->_delegateFlags;
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v11];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = -[CBManager getCBPrivacySupported](v12, "getCBPrivacySupported");
    [MEMORY[0x189607968] numberWithBool:v26];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 setObject:v27 forKey:@"kCBManagerPrivacySupported"];

    if (v23)
    {
      if ((*(_BYTE *)&delegateFlags & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 handleFailureInMethod:a2, v12, @"CBPeripheralManager.m", 329, @"%@ has provided a restore identifier but the delegate doesn't implement the peripheralManager:willRestoreState: method", v12 object file lineNumber description];
      }
    }

    else if ((*(_BYTE *)&delegateFlags & 1) != 0)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      v29 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBPeripheralManager initWithDelegate:queue:options:].cold.1((uint64_t)v12, v29);
      }
    }

    v30 = (void *)[v25 copy];
    -[CBManager startWithQueue:options:sessionType:](v12, "startWithQueue:options:sessionType:", v10, v30, 1LL);
  }

  return v12;
}

- (void)incomingAddress:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v7 = @"kCBMsgArgAddressBytes";
  v8[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 44LL, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if ([v10 isEqualToString:@"state"])
    {
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn || -[CBManager state](self, "state") == 10)
      {
        -[NSLock lock](self->_updateLock, "lock");
        self->_readyForUpdates = 1;
        self->_waitingForReady = 0;
        -[NSLock unlock](self->_updateLock, "unlock");
      }

      else
      {
        v54 = self->_services;
        objc_sync_enter(v54);
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        v55 = self->_services;
        uint64_t v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
        if (v56)
        {
          uint64_t v57 = *(void *)v62;
          do
          {
            for (uint64_t i = 0LL; i != v56; ++i)
            {
              if (*(void *)v62 != v57) {
                objc_enumerationMutation(v55);
              }
              [*(id *)(*((void *)&v61 + 1) + 8 * i) handlePowerNotOn];
            }

            uint64_t v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
          }

          while (v56);
        }

        objc_sync_exit(v54);
        -[CBPeripheralManager forEachCentral:](self, "forEachCentral:", &__block_literal_global_6);
        -[NSMapTable removeAllObjects](self->_centrals, "removeAllObjects");
        -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 0LL);
        if (-[CBManager state](self, "state") == CBManagerStateResetting)
        {
          v59 = self->_services;
          objc_sync_enter(v59);
          -[NSMutableArray removeAllObjects](self->_services, "removeAllObjects");
          -[NSMutableDictionary removeAllObjects](self->_characteristicIDs, "removeAllObjects");
          objc_sync_exit(v59);
        }
      }

      -[CBPeripheralManager delegate](self, "delegate");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 peripheralManagerDidUpdateState:self];
    }

    else if ([v10 isEqualToString:@"delegate"])
    {
      -[CBPeripheralManager delegate](self, "delegate");
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = &self->_delegateFlags;
      self->_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
      v16 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v17 = 2;
      }
      else {
        int v17 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFD | v17);

      -[CBPeripheralManager delegate](self, "delegate");
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v19 = 4;
      }
      else {
        int v19 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFFB | v19);

      -[CBPeripheralManager delegate](self, "delegate");
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v21 = 8;
      }
      else {
        int v21 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFF7 | v21);

      -[CBPeripheralManager delegate](self, "delegate");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v23 = 16;
      }
      else {
        int v23 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFEF | v23);
      v24 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v25 = 32;
      }
      else {
        int v25 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFDF | v25);

      -[CBPeripheralManager delegate](self, "delegate");
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v27 = 64;
      }
      else {
        int v27 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFFBF | v27);
      v28 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v29 = 128;
      }
      else {
        int v29 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFF7F | v29);
      v30 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v31 = 256;
      }
      else {
        int v31 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFEFF | v31);

      -[CBPeripheralManager delegate](self, "delegate");
      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v33 = 512;
      }
      else {
        int v33 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFDFF | v33);
      v34 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v35 = 1024;
      }
      else {
        int v35 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFFBFF | v35);
      v36 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v37 = 2048;
      }
      else {
        int v37 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFF7FF | v37);
      v38 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v39 = 4096;
      }
      else {
        int v39 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFEFFF | v39);
      v40 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v41 = 0x2000;
      }
      else {
        int v41 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFDFFF | v41);
      v42 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v43 = 0x4000;
      }
      else {
        int v43 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFFBFFF | v43);
      v44 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v45 = 0x8000;
      }
      else {
        int v45 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFF7FFF | v45);
      v46 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v47 = 0x10000;
      }
      else {
        int v47 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFEFFFF | v47);
      v48 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v49 = 0x20000;
      }
      else {
        int v49 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFDFFFF | v49);
      v50 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v51 = 0x40000;
      }
      else {
        int v51 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFFBFFFF | v51);
      v52 = -[CBPeripheralManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        int v53 = 0x80000;
      }
      else {
        int v53 = 0;
      }
      *p_$43C94FEDEB33BD172F576B255845D8E8 delegateFlags = ($43C94FEDEB33BD172F576B255845D8E8)(*(_DWORD *)p_delegateFlags & 0xFFF7FFFF | v53);
    }
  }

  else
  {
    v60.receiver = self;
    v60.super_class = (Class)&OBJC_CLASS___CBPeripheralManager;
    -[CBPeripheralManager observeValueForKeyPath:ofObject:change:context:]( &v60,  sel_observeValueForKeyPath_ofObject_change_context_,  v10,  v11,  v12,  a6);
  }
}

uint64_t __70__CBPeripheralManager_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 setMtuLength:23];
}

- (void)setDesiredConnectionLatency:(CBPeripheralManagerConnectionLatency)latency forCentral:(CBCentral *)central
{
  void v13[2] = *MEMORY[0x1895F89C0];
  id v7 = central;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 411, @"Invalid parameter not satisfying: %@", @"central != nil" object file lineNumber description];
  }

  v12[0] = @"kCBMsgArgDeviceUUID";
  -[CBPeer identifier](v7, "identifier");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = @"kCBMsgArgConnectionLatency";
  v13[0] = v8;
  [MEMORY[0x189607968] numberWithInteger:latency];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 163LL, v10);
}

- (void)startAdvertising:(NSDictionary *)advertisementData
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  int v29 = advertisementData;
  -[NSDictionary allKeys](v29, "allKeys");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v53;
    int v27 = @"kCBAdvDataHashedServiceUUIDs";
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v53 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", @"kCBAdvDataTxPowerLevel", v27))
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_11:
            -[CBPeripheralManager startAdvertising:].cold.1(&v50, v51);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_11;
          }
        }

        else if ([v8 isEqualToString:@"kCBAdvDataManufacturerData"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_15:
            -[CBPeripheralManager startAdvertising:].cold.2(&v48, v49);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
        }

        else if ([v8 isEqualToString:@"kCBAdvDataTDSData"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
              continue;
            }
LABEL_19:
            -[CBPeripheralManager startAdvertising:].cold.3(&v46, v47);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_19;
          }
        }

        else if ([v8 isEqualToString:@"kCBAdvDataIsContact"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
              continue;
            }
LABEL_23:
            -[CBPeripheralManager startAdvertising:].cold.4(&v44, v45);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
        }

        else if ([v8 isEqualToString:@"kCBAdvDataServiceData"])
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_27:
            -[CBPeripheralManager startAdvertising:].cold.5(&v42, v43);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
        }

        else if ([v8 isEqualToString:@"kCBAdvDataIsConnectable"])
        {
          -[NSDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  @"kCBMsgArgIsPrivilegedDaemon");
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          char v10 = [v9 BOOLValue];

          if ((v10 & 1) != 0) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_32:
            -[CBPeripheralManager startAdvertising:].cold.6(&v40, v41);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_32;
          }
        }

        else if (([v8 isEqualToString:@"kCBAdvDataIsExtended"] & 1) != 0 {
               || [v8 isEqualToString:@"kCBAdvDataIsExtendedConnectable"])
        }
        {
          -[NSDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  @"kCBMsgArgIsPrivilegedDaemon");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          char v12 = [v11 BOOLValue];

          if ((v12 & 1) != 0) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_38:
            -[CBPeripheralManager startAdvertising:].cold.7(&v38, v39);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
        }

        else if ([v8 isEqualToString:@"kCBAdvDataIsTDS"])
        {
          -[NSDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  @"kCBMsgArgIsPrivilegedDaemon");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          char v14 = [v13 BOOLValue];

          if ((v14 & 1) != 0) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_43:
            -[CBPeripheralManager startAdvertising:].cold.8(&v36, v37);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_43;
          }
        }

        else if (([v8 isEqualToString:@"kCBAdvDataTDSData"] & 1) != 0 {
               || [v8 isEqualToString:@"kCBAdvertisementTDSTypeKey"])
        }
        {
          -[NSDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  @"kCBMsgArgIsPrivilegedDaemon");
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          char v16 = [v15 BOOLValue];

          if ((v16 & 1) != 0) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_49:
            -[CBPeripheralManager startAdvertising:].cold.9(&v34, v35);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_49;
          }
        }

        else if (([v8 isEqualToString:@"kCBAdvDataRawBytesData"] & 1) != 0 {
               || ([v8 isEqualToString:@"kCBAdvDataRawBytesDataAdvInd"] & 1) != 0
        }
               || [v8 isEqualToString:@"kCBAdvDataRawBytesDataScanRsp"])
        {
          -[NSDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  @"kCBMsgArgIsPrivilegedDaemon");
          int v17 = (void *)objc_claimAutoreleasedReturnValue();
          char v18 = [v17 BOOLValue];

          if ((v18 & 1) != 0) {
            continue;
          }
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_56:
            -[CBPeripheralManager startAdvertising:].cold.10(&v32, v33);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_56;
          }
        }

        else
        {
          if (CBLogInitOnce == -1)
          {
            if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
              continue;
            }
LABEL_66:
            -[CBPeripheralManager startAdvertising:].cold.11(&v30, v31);
            continue;
          }

          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            goto LABEL_66;
          }
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }

    while (v5);
  }

  int has_internal_content = os_variant_has_internal_content();
  __int128 v20 = v29;
  if (v29)
  {
    int v21 = self;
    if (has_internal_content)
    {
      uint64_t v22 = -[CBPeripheralManager addXPCDelayTiming:args:]( self,  "addXPCDelayTiming:args:",  v29,  @"kCBMsgArgTimeXpcCbPManagerStartAdv");

      __int128 v20 = (void *)v22;
    }
  }

  else
  {
    int v21 = self;
  }

  [v20 objectForKey:@"kCBOptionUseCase"];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 unsignedLongValue];

  if (v24 == 22)
  {
    id v25 = -[CBManager sendSyncMsg:args:](v21, "sendSyncMsg:args:", 32LL, v20);
    goto LABEL_95;
  }

- (void)stopAdvertising
{
}

- (void)startPeriodicAdvertising:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = (id)MEMORY[0x189604A60];
  }
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 34LL, v3);
}

- (void)stopPeriodicAdvertising:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = (id)MEMORY[0x189604A60];
  }
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 35LL, v3);
}

- (void)addService:(CBMutableService *)service
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v3 = service;
  __int128 v61 = v3;
  if (!v3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 509, @"Invalid parameter not satisfying: %@", @"service != nil" object file lineNumber description];

    id v3 = 0LL;
  }

  -[CBAttribute UUID](v3, "UUID");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 data];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 length] == 2)
  {
  }

  else
  {
    -[CBAttribute UUID](v61, "UUID");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 data];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 length];

    if (v8 == 16) {
      goto LABEL_8;
    }
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 510, @"Invalid parameter not satisfying: %@", @"service.UUID.data.length == 2 || service.UUID.data.length == 16" object file lineNumber description];
  }

LABEL_8:
  v59 = self->_services;
  objc_sync_enter(v59);
  if (-[NSMutableArray indexOfObject:](self->_services, "indexOfObject:", v61) != 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v58 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:514 description:@"Services cannot be added more than once"];
  }

  id v9 = (void *)MEMORY[0x189607968];
  ++self->_attributeIDGenerator;
  objc_msgSend(v9, "numberWithUnsignedInteger:");
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBMutableService setID:](v61, "setID:", v10);

  id v11 = objc_alloc(MEMORY[0x189603FC8]);
  -[CBMutableService ID](v61, "ID");
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBAttribute UUID](v61, "UUID");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[CBService isPrimary](v61, "isPrimary"));
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v60 = (void *)objc_msgSend( v11,  "initWithObjectsAndKeys:",  v12,  @"kCBMsgArgAttributeID",  v13,  @"kCBMsgArgUUID",  v14,  @"kCBMsgArgType",  0);

  id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v60 setObject:v15 forKeyedSubscript:@"kCBMsgArgAttributeIDs"];
  v70 = v15;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  -[CBService includedServices](v61, "includedServices");
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v85;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v85 != v18) {
          objc_enumerationMutation(v16);
        }
        __int128 v20 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if (-[NSMutableArray indexOfObject:](self->_services, "indexOfObject:", v20) == 0x7FFFFFFFFFFFFFFFLL)
        {
          [MEMORY[0x1896077D8] currentHandler];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 529, @"Included services must be published before the service(s) that reference them (%@)", v20 object file lineNumber description];
        }

        [v20 ID];
        int v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v70 addObject:v21];
      }

      uint64_t v17 = [v16 countByEnumeratingWithState:&v84 objects:v91 count:16];
    }

    while (v17);
  }

  id v65 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v60 setObject:v65 forKeyedSubscript:@"kCBMsgArgCharacteristics"];
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  -[CBService characteristics](v61, "characteristics");
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v66 = [v23 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v66)
  {
    uint64_t v64 = *(void *)v81;
    id obj = v23;
    do
    {
      for (uint64_t j = 0LL; j != v66; ++j)
      {
        if (*(void *)v81 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v80 + 1) + 8 * j);
        [v24 value];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          if ([v24 properties] != 2 || (objc_msgSend(v24, "permissions") & 2) != 0)
          {

LABEL_30:
            [MEMORY[0x1896077D8] currentHandler];
            int v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:539 description:@"Characteristics with cached values must be read-only"];

            goto LABEL_31;
          }

          BOOL v26 = ([v24 permissions] & 8) == 0;

          if (!v26) {
            goto LABEL_30;
          }
        }

- (void)removeService:(CBMutableService *)service
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t v4 = service;
  if (!v4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 579, @"Invalid parameter not satisfying: %@", @"service != nil" object file lineNumber description];
  }

  int v35 = self->_services;
  objc_sync_enter(v35);
  services = self->_services;
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = __37__CBPeripheralManager_removeService___block_invoke;
  v48[3] = &unk_189FB4C98;
  uint64_t v6 = v4;
  int v49 = v6;
  uint64_t v7 = -[NSMutableArray indexOfObjectPassingTest:](services, "indexOfObjectPassingTest:", v48);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
  }

  else
  {
    uint64_t v32 = v7;
    -[NSMutableArray objectAtIndexedSubscript:](self->_services, "objectAtIndexedSubscript:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id obj = self->_services;
    uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
    if (v9)
    {
      uint64_t v31 = *(void *)v45;
      do
      {
        uint64_t v30 = v9;
        for (uint64_t i = 0LL; i != v30; ++i)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          [v11 includedServices];
          char v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v53 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v41;
            while (2)
            {
              for (uint64_t j = 0LL; j != v13; ++j)
              {
                if (*(void *)v41 != v14) {
                  objc_enumerationMutation(v12);
                }
                [*(id *)(*((void *)&v40 + 1) + 8 * j) ID];
                char v16 = (void *)objc_claimAutoreleasedReturnValue();
                [v8 ID];
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                int v18 = [v16 isEqualToNumber:v17];

                if (v18)
                {

                  [MEMORY[0x1896077D8] currentHandler];
                  int v19 = (void *)objc_claimAutoreleasedReturnValue();
                  [v19 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:607 description:@"Cannot remove a service that is still included by one or more published services"];
                  goto LABEL_22;
                }
              }

              uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v53 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }

        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
      }

      while (v9);
    }

    int v19 = obj;
LABEL_22:

    uint64_t v51 = @"kCBMsgArgAttributeID";
    [v8 ID];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = v20;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v22 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 37LL, v21);

    if (v22)
    {
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      [v8 characteristics];
      int v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v50 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v37;
        do
        {
          for (uint64_t k = 0LL; k != v24; ++k)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v23);
            }
            characteristicIDs = self->_characteristicIDs;
            [*(id *)(*((void *)&v36 + 1) + 8 * k) ID];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](characteristicIDs, "removeObjectForKey:", v28);
          }

          uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v50 count:16];
        }

        while (v24);
      }

      -[NSMutableArray removeObjectAtIndex:](self->_services, "removeObjectAtIndex:", v32);
    }
  }

  objc_sync_exit(v35);
}

uint64_t __37__CBPeripheralManager_removeService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) ID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

- (void)removeAllServices
{
  id obj = self->_services;
  objc_sync_enter(obj);
  if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 38LL, 0LL))
  {
    -[NSMutableDictionary removeAllObjects](self->_characteristicIDs, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_services, "removeAllObjects");
  }

  objc_sync_exit(obj);
}

- (void)respondToRequest:(CBATTRequest *)request withResult:(CBATTError)result
{
  uint64_t v7 = request;
  uint64_t v13 = v7;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 630, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

    if ([0 ignoreResponse]) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (!-[CBATTRequest ignoreResponse](v7, "ignoreResponse"))
  {
LABEL_3:
    -[CBATTRequest transactionID](v13, "transactionID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBATTRequest value](v13, "value");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBATTRequest characteristic](v13, "characteristic");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 ID];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheralManager respondToTransaction:value:attributeID:result:]( self,  "respondToTransaction:value:attributeID:result:",  v8,  v9,  v11,  result);
  }

- (void)respondToTransaction:(id)a3 value:(id)a4 attributeID:(id)a5 result:(int64_t)a6
{
  char v10 = (objc_class *)MEMORY[0x189603FC8];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc(v10);
  id v15 = v12;
  if (!v12)
  {
    [MEMORY[0x189603FE8] null];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [MEMORY[0x189607968] numberWithInteger:a6];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = (id)objc_msgSend( v14,  "initWithObjectsAndKeys:",  v13,  @"kCBMsgArgTransactionID",  v15,  @"kCBMsgArgData",  v11,  @"kCBMsgArgAttributeID",  v16,  @"kCBMsgArgResult",  0);

  if (!v12) {
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 39LL, v17);
  }
}

- (BOOL)updateValue:(NSData *)value forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:(NSArray *)centrals
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v9 = value;
  char v10 = characteristic;
  id v11 = centrals;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 652, @"Invalid parameter not satisfying: %@", @"value != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 handleFailureInMethod:a2, self, @"CBPeripheralManager.m", 653, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];

LABEL_3:
  -[NSLock lock](self->_updateLock, "lock");
  BOOL readyForUpdates = self->_readyForUpdates;
  if (self->_readyForUpdates)
  {
    self->_BOOL readyForUpdates = 0;
    -[NSLock unlock](self->_updateLock, "unlock");
    id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    BOOL v26 = v11;
    id v14 = v11;
    uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) identifier];
          int v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObject:v19];
        }

        uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
      }

      while (v16);
    }

    id v20 = objc_alloc(MEMORY[0x189603FC8]);
    -[CBMutableCharacteristic ID](v10, "ID");
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v22 = (void *)objc_msgSend( v20,  "initWithObjectsAndKeys:",  v13,  @"kCBMsgArgUUIDs",  v9,  @"kCBMsgArgData",  v21,  @"kCBMsgArgAttributeID",  0);

    -[CBManager sendMsg:args:](self, "sendMsg:args:", 40LL, v22);
    id v11 = v26;
  }

  else
  {
    self->_waitingForReady = 1;
    -[NSLock unlock](self->_updateLock, "unlock");
  }

  return readyForUpdates;
}

- (BOOL)supportsMultipleAdvertising
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 41LL, 0LL);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBMsgArgData"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 BOOLValue];

    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint64_t v7 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      -[CBPeripheralManager supportsMultipleAdvertising].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    [MEMORY[0x189607968] numberWithBool:v6];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheralManager setMultipleAdvertisingSupported:](self, "setMultipleAdvertisingSupported:", v14);
  }

  -[CBPeripheralManager multipleAdvertisingSupported](self, "multipleAdvertisingSupported");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  char v16 = [v15 BOOLValue];

  return v16;
}

+ (BOOL)supportsFeatures:(unint64_t)a3
{
  return (a3 & ~(unint64_t)gSupportedFeatures_0) == 0;
}

- (void)setOfflineAdvertisingParamsAndData:(id)a3
{
}

- (void)retrieveBluetoothUsageStatistics:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __67__CBPeripheralManager_retrieveBluetoothUsageStatistics_completion___block_invoke;
  v7[3] = &unk_189FB1978;
  id v8 = v5;
  id v6 = v5;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 218LL, &unk_189FD6488, v7);
}

void __67__CBPeripheralManager_retrieveBluetoothUsageStatistics_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = (objc_class *)MEMORY[0x189603FC8];
  id v6 = a3;
  id v7 = a2;
  id v12 = objc_alloc_init(v5);
  [v7 objectForKeyedSubscript:@"kCBUsageStatsLePercent"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v8 forKeyedSubscript:@"kCBUsageStatsLePercent"];

  [v7 objectForKeyedSubscript:@"kCBUsageStatsClPercent"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v9 forKeyedSubscript:@"kCBUsageStatsClPercent"];

  [v7 objectForKeyedSubscript:@"kCBUsageStatsIsAudioStreaming"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v10 forKeyedSubscript:@"kCBUsageStatsIsAudioStreaming"];

  [v7 objectForKeyedSubscript:@"kCBUsageStatsTimeStampNsMonotonic"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 setObject:v11 forKeyedSubscript:@"kCBUsageStatsTimeStampNsMonotonic"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)handleRestoringState:(id)a3
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 handleFailureInMethod:a2 object:self file:@"CBPeripheralManager.m" lineNumber:724 description:@"Registered delegate no longer supports restoring"];
  }

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v5 objectForKeyedSubscript:@"kCBMsgArgSubscribedHandles"];
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v63 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v8 = [v5 objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"];
  if (v8)
  {
    [v6 setObject:v8 forKeyedSubscript:@"kCBRestoredAdvertisement"];
    -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 1LL);
  }

  uint64_t v55 = v6;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v56 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", @"kCBMsgArgServices", v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v65 = self;
  __int128 v61 = v7;
  uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v91;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v91 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v9;
        uint64_t v10 = *(void **)(*((void *)&v90 + 1) + 8 * v9);
        id v67 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v11 = -[CBMutableService initWithDictionary:]( objc_alloc(&OBJC_CLASS___CBMutableService),  "initWithDictionary:",  v10);
        -[NSMutableArray addObject:](self->_services, "addObject:", v11);
        -[CBMutableService ID](v11, "ID");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v13 = [v12 unsignedIntegerValue];
        unint64_t attributeIDGenerator = self->_attributeIDGenerator;

        if (v13 > attributeIDGenerator)
        {
          -[CBMutableService ID](v11, "ID");
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          self->_unint64_t attributeIDGenerator = [v15 unsignedIntegerValue];
        }

        __int128 v88 = 0u;
        __int128 v89 = 0u;
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        [v10 objectForKeyedSubscript:@"kCBMsgArgIncludedServices"];
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v87;
          do
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v87 != v19) {
                objc_enumerationMutation(v16);
              }
              int v21 = *(void **)(*((void *)&v86 + 1) + 8 * i);
              v98[0] = v11;
              v97[0] = @"service";
              v97[1] = @"incID";
              [v21 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
              BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
              v98[1] = v22;
              [MEMORY[0x189603F68] dictionaryWithObjects:v98 forKeys:v97 count:2];
              int v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v63 addObject:v23];
            }

            uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v99 count:16];
          }

          while (v18);
        }

        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        [v10 objectForKeyedSubscript:@"kCBMsgArgCharacteristics"];
        id v62 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = v67;
        uint64_t v68 = [v62 countByEnumeratingWithState:&v82 objects:v96 count:16];
        if (v68)
        {
          uint64_t v66 = *(void *)v83;
          do
          {
            for (uint64_t j = 0LL; j != v68; ++j)
            {
              if (*(void *)v83 != v66) {
                objc_enumerationMutation(v62);
              }
              BOOL v26 = *(void **)(*((void *)&v82 + 1) + 8 * j);
              id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
              __int128 v28 = -[CBMutableCharacteristic initWithService:dictionary:]( objc_alloc(&OBJC_CLASS___CBMutableCharacteristic),  "initWithService:dictionary:",  v11,  v26);
              characteristicIDs = self->_characteristicIDs;
              -[CBMutableCharacteristic ID](v28, "ID");
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:]( characteristicIDs,  "setObject:forKeyedSubscript:",  v28,  v30);

              -[CBMutableCharacteristic ID](v28, "ID");
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              unint64_t v32 = [v31 unsignedIntegerValue];
              unint64_t v33 = self->_attributeIDGenerator;

              if (v32 > v33)
              {
                -[CBMutableCharacteristic ID](v28, "ID");
                char v34 = (void *)objc_claimAutoreleasedReturnValue();
                self->_unint64_t attributeIDGenerator = [v34 unsignedIntegerValue];
              }

              v80[0] = MEMORY[0x1895F87A8];
              v80[1] = 3221225472LL;
              v80[2] = __44__CBPeripheralManager_handleRestoringState___block_invoke;
              v80[3] = &unk_189FB4CC0;
              v80[4] = self;
              int v35 = v28;
              __int128 v81 = v35;
              [v64 enumerateObjectsUsingBlock:v80];
              __int128 v78 = 0u;
              __int128 v79 = 0u;
              __int128 v76 = 0u;
              __int128 v77 = 0u;
              [v26 objectForKeyedSubscript:@"kCBMsgArgDescriptors"];
              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v37 = [v36 countByEnumeratingWithState:&v76 objects:v95 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v77;
                do
                {
                  for (uint64_t k = 0LL; k != v38; ++k)
                  {
                    if (*(void *)v77 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    __int128 v41 = -[CBMutableDescriptor initWithCharacteristic:dictionary:]( objc_alloc(&OBJC_CLASS___CBMutableDescriptor),  "initWithCharacteristic:dictionary:",  v35,  *(void *)(*((void *)&v76 + 1) + 8 * k));
                    [v27 addObject:v41];
                  }

                  uint64_t v38 = [v36 countByEnumeratingWithState:&v76 objects:v95 count:16];
                }

                while (v38);
              }

              if ([v27 count]) {
                -[CBCharacteristic setDescriptors:](v35, "setDescriptors:", v27);
              }
              uint64_t v24 = v67;
              [v67 addObject:v35];

              self = v65;
            }

            uint64_t v68 = [v62 countByEnumeratingWithState:&v82 objects:v96 count:16];
          }

          while (v68);
        }

        if ([v24 count]) {
          -[CBService setCharacteristics:](v11, "setCharacteristics:", v24);
        }
        [v61 addObject:v11];

        uint64_t v9 = v60 + 1;
      }

      while (v60 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
    }

    while (v59);
  }

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v42 = v63;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v72 objects:v94 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v73;
    do
    {
      for (uint64_t m = 0LL; m != v44; ++m)
      {
        if (*(void *)v73 != v45) {
          objc_enumerationMutation(v42);
        }
        __int128 v47 = *(void **)(*((void *)&v72 + 1) + 8 * m);
        [v47 objectForKeyedSubscript:@"service"];
        char v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v47 objectForKeyedSubscript:@"incID"];
        int v49 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = MEMORY[0x1895F87A8];
        v69[1] = 3221225472LL;
        v69[2] = __44__CBPeripheralManager_handleRestoringState___block_invoke_2;
        v69[3] = &unk_189FB4CC0;
        id v70 = v49;
        id v71 = v48;
        id v50 = v48;
        id v51 = v49;
        [v61 enumerateObjectsUsingBlock:v69];
      }

      uint64_t v44 = [v42 countByEnumeratingWithState:&v72 objects:v94 count:16];
    }

    while (v44);
  }

  if ([v61 count])
  {
    [v55 setObject:v61 forKeyedSubscript:@"kCBRestoredServices"];
    v65->_attributeIDGenerator += 16LL;
  }

  -[CBPeripheralManager delegate](v65, "delegate");
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 peripheralManager:v65 willRestoreState:v55];
}

void __44__CBPeripheralManager_handleRestoringState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) centralWithInfo:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [*(id *)(a1 + 40) ID];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v7 isEqualToNumber:v5];

    if (v6) {
      [*(id *)(a1 + 40) handleCentralSubscribed:v4];
    }
  }
}

void __44__CBPeripheralManager_handleRestoringState___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v11 = a2;
  [v11 ID];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToNumber:*(void *)(a1 + 32)];

  if (v7)
  {
    [*(id *)(a1 + 40) includedServices];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      [*(id *)(a1 + 40) includedServices];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = (id)[v9 mutableCopy];
    }

    else
    {
      id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    }

    [v10 addObject:v11];
    [*(id *)(a1 + 40) setIncludedServices:v10];
    *a4 = 1;
  }
}

- (void)handleServiceAdded:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607870] errorWithInfo:v4];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = self->_services;
  objc_sync_enter(v6);
  services = self->_services;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __42__CBPeripheralManager_handleServiceAdded___block_invoke;
  v23[3] = &unk_189FB4C98;
  id v17 = v5;
  id v24 = v17;
  uint64_t v8 = -[NSMutableArray indexOfObjectPassingTest:](services, "indexOfObjectPassingTest:", v23);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_services, "objectAtIndexedSubscript:", v8);
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_services, "removeObjectAtIndex:", v8);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      [v16 characteristics];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v9);
            }
            characteristicIDs = self->_characteristicIDs;
            [*(id *)(*((void *)&v19 + 1) + 8 * i) ID];
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](characteristicIDs, "removeObjectForKey:", v14);
          }

          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }

        while (v10);
      }
    }

    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
    {
      -[CBPeripheralManager delegate](self, "delegate");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 peripheralManager:self didAddService:v16 error:v18];
    }
  }

  objc_sync_exit(v6);
}

uint64_t __42__CBPeripheralManager_handleServiceAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (void)handleGetAttributeValue:(id)a3
{
  id v14 = a3;
  [v14 objectForKeyedSubscript:@"kCBMsgArgTransactionID"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"kCBMsgArgOffset"];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = self->_services;
  objc_sync_enter(v7);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___CBATTRequest);
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v14);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = -[CBATTRequest initWithCentral:characteristic:offset:transactionID:]( v8,  "initWithCentral:characteristic:offset:transactionID:",  v9,  v10,  [v6 unsignedIntegerValue],  v4);

  -[CBATTRequest characteristic](v11, "characteristic");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
    {
      -[CBPeripheralManager delegate](self, "delegate");
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 peripheralManager:self didReceiveReadRequest:v11];
    }

    else
    {
      -[CBPeripheralManager respondToRequest:withResult:](self, "respondToRequest:withResult:", v11, 6LL);
    }
  }

  else
  {
    -[CBPeripheralManager respondToTransaction:value:attributeID:result:]( self,  "respondToTransaction:value:attributeID:result:",  v4,  0LL,  v5,  10LL);
  }

  objc_sync_exit(v7);
}

- (void)handleSetAttributeValues:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v22 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:@"kCBMsgArgTransactionID"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:@"kCBMsgArgATTWrites"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v21 = self->_services;
  objc_sync_enter(v21);
  uint64_t v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v4;
  id v5 = 0LL;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      objc_msgSend(v9, "objectForKeyedSubscript:", @"kCBMsgArgAttributeID", v21);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v10);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:@"kCBMsgArgOffset"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 unsignedIntegerValue];

      -[CBATTRequest characteristic](v5, "characteristic");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v14)
      {
        BOOL v15 = v13 == -[CBATTRequest endOffset](v5, "endOffset");

        if (v15) {
          goto LABEL_10;
        }
      }

      else
      {
      }

      char v16 = -[CBATTRequest initWithCentral:characteristic:offset:transactionID:]( objc_alloc(&OBJC_CLASS___CBATTRequest),  "initWithCentral:characteristic:offset:transactionID:",  v24,  v11,  v13,  v25);

      [v26 addObject:v16];
      id v5 = v16;
LABEL_10:
      [v9 objectForKeyedSubscript:@"kCBMsgArgData"];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBATTRequest appendValueData:](v5, "appendValueData:", v17);

      [v9 objectForKeyedSubscript:@"kCBMsgArgIgnoreResponse"];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBATTRequest setIgnoreResponse:](v5, "setIgnoreResponse:", [v18 BOOLValue]);

      -[CBATTRequest characteristic](v5, "characteristic");
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = v19 == 0LL;

      if ((_DWORD)v18)
      {
        if (!-[CBATTRequest ignoreResponse](v5, "ignoreResponse")) {
          -[CBPeripheralManager respondToTransaction:value:attributeID:result:]( self,  "respondToTransaction:value:attributeID:result:",  v25,  0LL,  v10,  10LL);
        }
        goto LABEL_18;
      }

      if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
      {
        -[CBPeripheralManager respondToRequest:withResult:](self, "respondToRequest:withResult:", v5, 6LL);
LABEL_18:

        __int128 v20 = obj;
        goto LABEL_19;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[CBPeripheralManager delegate](self, "delegate");
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 peripheralManager:self didReceiveWriteRequests:v26];
LABEL_19:

  objc_sync_exit(v21);
}

- (void)handleNotificationAdded:(id)a3
{
  id v9 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v9);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = self->_services;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 handleCentralSubscribed:v4] && (*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 peripheralManager:self central:v4 didSubscribeToCharacteristic:v7];
  }

  objc_sync_exit(v6);
}

- (void)handleNotificationRemoved:(id)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v25 = a3;
  uint64_t v26 = self;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v25);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = self->_services;
  objc_sync_enter(v23);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicIDs, "objectForKeyedSubscript:", v24);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5) {
    int v7 = [v5 handleCentralUnsubscribed:v4] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  char v21 = v7;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = self->_services;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v39,  v45,  16LL);
  id v22 = v6;
  if (!v8)
  {

LABEL_31:
    [v4 setMtuLength:23];
    goto LABEL_32;
  }

  uint64_t v28 = *(void *)v40;
  uint64_t v29 = v8;
  char v9 = 1;
  do
  {
    for (uint64_t i = 0LL; i != v29; ++i)
    {
      if (*(void *)v40 != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      [v10 characteristics];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t j = 0LL; j != v12; ++j)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v11);
            }
            BOOL v15 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            [v15 subscribedCentrals];
            char v16 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v32;
              while (2)
              {
                for (uint64_t k = 0LL; k != v17; ++k)
                {
                  if (*(void *)v32 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  if ([*(id *)(*((void *)&v31 + 1) + 8 * k) isEqual:v4])
                  {
                    char v9 = 0;
                    goto LABEL_24;
                  }
                }

                uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }

- (void)handleAdvertisingStarted:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189607870] errorWithInfo:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int has_internal_content = os_variant_has_internal_content();
  if (v4 && has_internal_content)
  {
    uint64_t v7 = -[CBPeripheralManager addXPCDelayTiming:args:]( self,  "addXPCDelayTiming:args:",  v4,  @"kCBMsgArgTimeXpcCbPManagerHandleAdvStarted");

    id v4 = (id)v7;
  }

  if (!v5) {
    -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 1LL);
  }
  [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:341];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v8 isEqualToNumber:v9];

  if (v10)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
    {
      -[CBPeripheralManager handleAdvertisingStarted:].cold.1();
      if ((*(_BYTE *)&self->_delegateFlags & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  else
  {
    [v4 objectForKeyedSubscript:@"kCBMsgArgResult"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInt:348];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v11 isEqualToNumber:v12];

    if (v13)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
      {
        -[CBPeripheralManager handleAdvertisingStarted:].cold.2();
        if ((*(_BYTE *)&self->_delegateFlags & 0x40) == 0) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
  }

  if ((*(_BYTE *)&self->_delegateFlags & 0x40) != 0)
  {
LABEL_17:
    -[CBPeripheralManager delegate](self, "delegate");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 peripheralManagerDidStartAdvertising:self error:v5];
  }

- (void)handleAdvertisingStopped:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeripheralManager setIsAdvertising:](self, "setIsAdvertising:", 0LL);
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x80) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 peripheralManager:self didStopAdvertisingWithError:v5];
  }
}

- (void)handlePeriodicAdvertisingStarted:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_delegateFlags & 0x80) != 0)
  {
    id v6 = v4;
    -[CBPeripheralManager delegate](self, "delegate");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 peripheralManager:self didStartPeriodicAdvertising:v6];

    id v4 = v6;
  }
}

- (void)handlePeriodicAdvertisingStopped:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 1) != 0)
  {
    id v6 = v4;
    -[CBPeripheralManager delegate](self, "delegate");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 peripheralManager:self didStopPeriodicAdvertising:v6];

    id v4 = v6;
  }
}

- (void)handleReadyForUpdates:(id)a3
{
  self->_BOOL readyForUpdates = 1;
  BOOL waitingForReady = self->_waitingForReady;
  self->_BOOL waitingForReady = 0;
  -[NSLock unlock](self->_updateLock, "unlock");
  if (waitingForReady && (*((_BYTE *)&self->_delegateFlags + 1) & 2) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 peripheralManagerIsReadyToUpdateSubscribers:self];
  }

- (void)handleSolicitedServicesFound:(id)a3
{
  id v4 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgUUIDs"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 4) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 peripheralManager:self central:v7 didConnectWithServiceUUIDs:v5];
  }
}

- (void)handleConnectionParametersUpdated:(id)a3
{
  id v4 = a3;
  -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionInterval"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionLatency"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgSupervisionTimeout"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (*((_BYTE *)&self->_delegateFlags + 1) & 8) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 peripheralManager:self didUpdateConnectionParameters:v9 interval:v5 latency:v6 supervisionTimeout:v7];
  }
}

- (void)handleSupportedFeatures:(id)a3
{
  gSupportedFeatures_0 = 0;
  [a3 objectForKeyedSubscript:@"kCBMsgArgSupportedFeatures"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:@"kCBMsgArgSupportsExtendedAdvertising"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    gSupportedFeatures_0 = 1;
  }
}

- (void)handleL2CAPChannelOpened:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelOpened:].cold.3();
  }
  [MEMORY[0x189607870] errorWithInfo:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        id v6 = 0LL;
        if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }

    -[CBPeripheralManager handleL2CAPChannelOpened:].cold.2();
    id v6 = 0LL;
    if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_15:
    -[CBPeripheralManager delegate](self, "delegate");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 peripheralManager:self didOpenL2CAPChannel:v6 error:v5];

    goto LABEL_16;
  }

  centrals = self->_centrals;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](centrals, "objectForKey:", v8);
  id v9 = (CBCentral *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        id v9 = -[CBPeer initWithInfo:manager:](objc_alloc(&OBJC_CLASS___CBCentral), "initWithInfo:manager:", v4, self);
        int v10 = self->_centrals;
        [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v9, v11);

        goto LABEL_14;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
    }

    -[CBPeripheralManager handleL2CAPChannelOpened:].cold.1();
    goto LABEL_13;
  }

- (void)handleL2CAPChannelClosed:(id)a3
{
  id v4 = (void *)MEMORY[0x189607870];
  id v5 = a3;
  [v4 errorWithInfo:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"kCBMsgArgPSM"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v8 = [v7 intValue];

  centrals = self->_centrals;
  [v5 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](centrals, "objectForKey:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v12 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelClosed:].cold.1(v8, (uint64_t)v6, v12);
  }
  -[CBPeripheralManager l2capChannelForPeer:withPsm:](self, "l2capChannelForPeer:withPsm:", v11, v8);
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable removeObject:](self->_l2capChannels, "removeObject:", v13);
}

- (void)handleL2CAPChannelPublished:(id)a3
{
  id v4 = a3;
  [v4 objectForKey:@"kCBMsgArgPSM"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v6 = [v5 intValue];

  [v4 objectForKey:@"kCBMsgArgResult"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 intValue];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelPublished:].cold.1();
  }
  [MEMORY[0x189607870] errorWithInfo:v4];
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 peripheralManager:self didPublishL2CAPChannel:v6 error:v8];
  }
}

- (void)handleL2CAPChannelUnpublished:(id)a3
{
  id v4 = a3;
  [v4 objectForKey:@"kCBMsgArgPSM"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v6 = [v5 intValue];

  [v4 objectForKey:@"kCBMsgArgResult"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 intValue];

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheralManager handleL2CAPChannelUnpublished:].cold.1();
  }
  [MEMORY[0x189607870] errorWithInfo:v4];
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 peripheralManager:self didUnpublishL2CAPChannel:v6 error:v8];
  }
}

- (void)handleCentralDidUpdateANCSAuthorization:(id)a3
{
  id v4 = a3;
  centrals = self->_centrals;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](centrals, "objectForKey:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheralManager handleCentralDidUpdateANCSAuthorization:].cold.1();
    }
    -[CBPeripheralManager centralWithInfo:](self, "centralWithInfo:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKey:@"kCBMsgArgAncsAuthorization"];
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 BOOLValue];

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 1) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 peripheralManager:self central:v7 didUpdateANCSAuthorization:v9];
  }
}

- (void)HandleControllerPeripheralBTClockUpdateMsg:(id)a3
{
  id v12 = a3;
  [v12 objectForKeyedSubscript:@"kCBGetControllerBTClockSeconds"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:@"kCBGetControllerBTClockMicroSeconds"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:@"kCBGetControllerBTClockEventType"];
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:@"kCBGetControllerBTLocalClock"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:@"kCBGetControllerBTRemoteClock"];
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  $43C94FEDEB33BD172F576B255845D8E8 delegateFlags = self->_delegateFlags;
  if ((*(_DWORD *)&delegateFlags & 0x20000) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 peripheralManager:self didUpdateControllerBTClock:v6 seconds:v4 microseconds:v5 localClock:v7 remoteClock:v8];

    $43C94FEDEB33BD172F576B255845D8E8 delegateFlags = self->_delegateFlags;
  }

  if ((*(_DWORD *)&delegateFlags & 0x40000) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 peripheralManager:self didUpdateControllerBTClockDict:v12];
  }
}

- (void)HandleOfflineAdvPayloadRequestedWithReason:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 intValue];

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 8) != 0)
  {
    -[CBPeripheralManager delegate](self, "delegate");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 peripheralManager:self offlineAdvPayloadRequestedWithReason:v5];
  }

- (void)handleIncomingCISConnectionRequest:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBPeripheralManager handleIncomingCISConnectionRequest:].cold.1();
    if (!self->_incomingConnectionRequestCompletion) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (self->_incomingConnectionRequestCompletion)
  {
LABEL_5:
    [v4 objectForKeyedSubscript:@"kCBLEAudioArgCigId"];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBLEAudioArgCisId"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_incomingConnectionRequestCompletion + 2))();
  }

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return a3 == 10 || a3 == 43;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  if (a3 <= 0x29u && ((1LL << a3) & 0x20000000300LL) != 0) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBPeripheralManager;
  return -[CBManager isMsgAllowedAlways:](&v6, sel_isMsgAllowedAlways_);
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  switch((int)v4)
  {
    case 16:
    case 17:
    case 18:
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 handlePairingMessage:v4 args:v7];

      goto LABEL_3;
    case 21:
      -[CBPeripheralManager handleL2CAPChannelPublished:](self, "handleL2CAPChannelPublished:", v6);

      break;
    case 22:
      -[CBPeripheralManager handleL2CAPChannelUnpublished:](self, "handleL2CAPChannelUnpublished:", v6);

      break;
    case 23:
      -[CBPeripheralManager handleL2CAPChannelOpened:](self, "handleL2CAPChannelOpened:", v6);

      break;
    case 24:
      -[CBPeripheralManager handleL2CAPChannelClosed:](self, "handleL2CAPChannelClosed:", v6);

      break;
    case 29:
      -[CBPeripheralManager handleSupportedFeatures:](self, "handleSupportedFeatures:", v6);

      break;
    case 47:
      -[CBPeripheralManager handleAdvertisingStarted:](self, "handleAdvertisingStarted:", v6);

      break;
    case 48:
      -[CBPeripheralManager handleAdvertisingStopped:](self, "handleAdvertisingStopped:", v6);

      break;
    case 49:
      -[CBPeripheralManager handlePeriodicAdvertisingStarted:](self, "handlePeriodicAdvertisingStarted:", v6);

      break;
    case 50:
      -[CBPeripheralManager handlePeriodicAdvertisingStopped:](self, "handlePeriodicAdvertisingStopped:", v6);

      break;
    case 51:
      -[CBPeripheralManager handleServiceAdded:](self, "handleServiceAdded:", v6);

      break;
    case 52:
      -[CBPeripheralManager handleGetAttributeValue:](self, "handleGetAttributeValue:", v6);

      break;
    case 53:
      -[CBPeripheralManager handleSetAttributeValues:](self, "handleSetAttributeValues:", v6);

      break;
    case 54:
      -[CBPeripheralManager handleNotificationAdded:](self, "handleNotificationAdded:", v6);

      break;
    case 55:
      -[CBPeripheralManager handleNotificationRemoved:](self, "handleNotificationRemoved:", v6);

      break;
    case 56:
      -[CBPeripheralManager handleReadyForUpdates:](self, "handleReadyForUpdates:", v6);

      break;
    case 57:
      -[CBPeripheralManager handleRestoringState:](self, "handleRestoringState:", v6);

      break;
    case 58:
      -[CBPeripheralManager handleSolicitedServicesFound:](self, "handleSolicitedServicesFound:", v6);

      break;
    case 59:
      -[CBPeripheralManager handleAdvertisingAddressChanged:](self, "handleAdvertisingAddressChanged:", v6);

      break;
    case 61:
      -[CBPeripheralManager handleCentralDidUpdateANCSAuthorization:]( self,  "handleCentralDidUpdateANCSAuthorization:",  v6);

      break;
    case 62:
      -[CBPeripheralManager HandleOfflineAdvPayloadRequestedWithReason:]( self,  "HandleOfflineAdvPayloadRequestedWithReason:",  v6);

      break;
    case 157:
      -[CBPeripheralManager handleIncomingCISConnectionRequest:](self, "handleIncomingCISConnectionRequest:", v6);

      break;
    case 164:
    case 165:
    case 166:
      centrals = self->_centrals;
      [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](centrals, "objectForKey:", v10);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      [v11 handleMsg:v4 args:v7];
      break;
    case 167:
      -[CBPeripheralManager handleConnectionParametersUpdated:](self, "handleConnectionParametersUpdated:", v6);

      break;
    case 210:
      -[CBPeripheralManager HandleControllerPeripheralBTClockUpdateMsg:]( self,  "HandleControllerPeripheralBTClockUpdateMsg:",  v6);

      break;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      id v12 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
        -[CBCentralManager handleMsg:args:].cold.1(v4, v12);
      }

      else
      {
LABEL_3:
      }

      break;
  }

- (id)addXPCDelayTiming:(id)a3 args:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kCBOptionUseCase"];
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)v7;
  [v5 objectForKeyedSubscript:@"kCBOptionUseCase"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v9 unsignedLongValue] != 22)
  {

    goto LABEL_9;
  }

  [v5 objectForKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    id v11 = v5;
    goto LABEL_10;
  }

  if (!v6) {
    id v6 = @"Unknown Timestamp";
  }
  [MEMORY[0x189603FC8] dictionaryWithDictionary:v5];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = (void *)MEMORY[0x189603FC8];
  [v11 objectForKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 dictionaryWithDictionary:v13];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v15 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithLongLong:clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240];
  [v14 setObject:v15 forKeyedSubscript:v6];

  [MEMORY[0x189603F68] dictionaryWithDictionary:v14];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v16 forKeyedSubscript:@"kCBMsgArgTimeXpcTimestampsTracking"];

LABEL_10:
  return v11;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (NSMapTable)centrals
{
  return self->_centrals;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (NSMutableDictionary)characteristicIDs
{
  return self->_characteristicIDs;
}

- (NSLock)updateLock
{
  return self->_updateLock;
}

- (BOOL)readyForUpdates
{
  return self->_readyForUpdates;
}

- (BOOL)waitingForReady
{
  return self->_waitingForReady;
}

- (NSNumber)multipleAdvertisingSupported
{
  return self->_multipleAdvertisingSupported;
}

- (void)setMultipleAdvertisingSupported:(id)a3
{
}

- (NSHashTable)l2capChannels
{
  return self->_l2capChannels;
}

- (id)incomingConnectionRequestCompletion
{
  return self->_incomingConnectionRequestCompletion;
}

- (void)setIncomingConnectionRequestCompletion:(id)a3
{
}

- (unint64_t)attributeIDGenerator
{
  return self->_attributeIDGenerator;
}

- (void)setAttributeIDGenerator:(unint64_t)a3
{
  self->_unint64_t attributeIDGenerator = a3;
}

- (void).cxx_destruct
{
}

- (void)publishL2CAPChannel:(uint64_t)a1 requiresEncryption:(uint64_t)a2 options:(os_log_s *)a3 .cold.1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2 & 1;
  OUTLINED_FUNCTION_3_1( &dword_186F9B000,  a2,  a3,  "Publish L2CAP channel with psm : %u and encryptionRequirement:%d",  67109376,  v3);
  OUTLINED_FUNCTION_1();
}

- (void)unpublishL2CAPChannel:(unsigned __int16)a1 .cold.1(unsigned __int16 a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( &dword_186F9B000,  a2,  OS_LOG_TYPE_DEBUG,  "Unpublish L2CAP channel with psm : %u ",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_5_0();
}

- (void)overrideLocalLeAddress:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)l2capChannelForPeer:withPsm:.cold.1()
{
}

+ (void)authorizationStatus
{
}

- (void)initWithDelegate:(uint64_t)a1 queue:(os_log_s *)a2 options:.cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_186F9B000,  a2,  OS_LOG_TYPE_ERROR,  "WARNING: %@ has no restore identifier but the delegate implements the peripheralManager:willRestoreState: method. Re storing will not be supported",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)startAdvertising:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.4(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.6(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.7(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.8(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.9(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.10(_BYTE *a1, _BYTE *a2)
{
}

- (void)startAdvertising:(_BYTE *)a1 .cold.11(_BYTE *a1, _BYTE *a2)
{
}

- (void)supportsMultipleAdvertising
{
}

- (void)handleAdvertisingStarted:.cold.1()
{
}

- (void)handleAdvertisingStarted:.cold.2()
{
}

- (void)handleL2CAPChannelOpened:.cold.1()
{
}

- (void)handleL2CAPChannelOpened:.cold.2()
{
}

- (void)handleL2CAPChannelOpened:.cold.3()
{
}

- (void)handleL2CAPChannelClosed:(os_log_t)log .cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl( &dword_186F9B000,  log,  OS_LOG_TYPE_DEBUG,  "l2CAP channel closed with psm : %u and result : %@",  (uint8_t *)v3,  0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handleL2CAPChannelPublished:.cold.1()
{
}

- (void)handleL2CAPChannelUnpublished:.cold.1()
{
}

- (void)handleCentralDidUpdateANCSAuthorization:.cold.1()
{
}

- (void)handleIncomingCISConnectionRequest:.cold.1()
{
}

@end