@interface CBClassicManager
- (BOOL)connectable;
- (BOOL)discoverable;
- (BOOL)inquiryState;
- (BOOL)isInquiryRunning;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)secureBluetooth:(BOOL)a3 withAuthData:(id)a4;
- (BOOL)setBTPowerState:(BOOL)a3;
- (BOOL)testMode;
- (CBClassicManager)initWithQueue:(id)a3 options:(id)a4;
- (NSMapTable)peers;
- (id)classicPeerDiscovered;
- (id)classicPeerWithInfo:(id)a3;
- (id)connectCallback;
- (id)connectionStatusHandler;
- (id)disconnectCallback;
- (id)getLocalSDPDatabase;
- (id)inquiryServiceAddedHandler;
- (id)pairingStatusHandler;
- (id)peerWithIdentifier:(id)a3;
- (id)peerWithInfo:(id)a3;
- (id)retrievePairedPeersWithOptions:(id)a3;
- (id)retrievePeerWithAddress:(id)a3;
- (id)sdpRecordAddedHandler;
- (id)serviceAddedHandler;
- (int64_t)powerState;
- (unsigned)addServiceWithData:(id)a3;
- (void)addService:(id)a3;
- (void)addService:(id)a3 sdpRecord:(id)a4 sdpRecordAddedHandler:(id)a5;
- (void)addServiceToInquiryList:(id)a3;
- (void)alertUserNotificationIsReady:(id)a3;
- (void)cancelPeerConnection:(id)a3;
- (void)cancelPeerConnection:(id)a3 force:(BOOL)a4;
- (void)cancelPeerConnection:(id)a3 options:(id)a4;
- (void)connectPeer:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)forEachClassicPeer:(id)a3;
- (void)handleLocalDeviceStateUpdatedMsg:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePeerConnectionCompleted:(id)a3;
- (void)handlePeerConnectionStateUpdated:(id)a3;
- (void)handlePeerDisconnectionCompleted:(id)a3;
- (void)handlePeerDiscovered:(id)a3;
- (void)handleSDPRecordAdded:(id)a3;
- (void)handleServiceAddedToInquiryList:(id)a3;
- (void)handleServiceAddedToSDP:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orphanClassicPeers;
- (void)removeAllServices;
- (void)removeAllServicesFromInquiryList;
- (void)removeService:(id)a3;
- (void)removeServiceFromInquiryList:(id)a3;
- (void)removeServiceHandle:(unsigned int)a3;
- (void)setBTConnectable:(BOOL)a3;
- (void)setBTDiscoverable:(BOOL)a3;
- (void)setClassicPeerDiscovered:(id)a3;
- (void)setConnectCallback:(id)a3;
- (void)setConnectionStatusHandler:(id)a3;
- (void)setDisconnectCallback:(id)a3;
- (void)setInquiryServiceAddedHandler:(id)a3;
- (void)setPairingStatusHandler:(id)a3;
- (void)setSdpRecordAddedHandler:(id)a3;
- (void)setServiceAddedHandler:(id)a3;
- (void)setTestMode:(BOOL)a3;
- (void)startInquiryWithOptions:(id)a3 classicPeerDiscovered:(id)a4;
- (void)stopInquiry;
@end

@implementation CBClassicManager

- (CBClassicManager)initWithQueue:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CBClassicManager;
  v8 = -[CBManager initInternal](&v13, sel_initInternal);
  if (v8)
  {
    -[CBClassicManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"state",  0LL,  objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"powerState",  0LL,  objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"localName",  0LL,  objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"inquiryState",  0LL,  objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"discoverable",  0LL,  objc_opt_class());
    -[CBClassicManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"connectable",  0LL,  objc_opt_class());
    uint64_t v9 = [objc_alloc(MEMORY[0x189607920]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    peers = v8->_peers;
    v8->_peers = (NSMapTable *)v9;

    v8->_testMode = 0;
    v8->_connectable = 0;
    v8->_discoverable = 0;
    v8->_powerState = 1LL;
    [v7 valueForKey:@"kCBManagerIsIOBluetoothShim"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager setTccApproved:](v8, "setTccApproved:", [v11 BOOLValue]);

    -[CBManager startWithQueue:options:sessionType:](v8, "startWithQueue:options:sessionType:", v6, v7, 3LL);
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBClassicManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if ((void *)objc_opt_class() == a6)
  {
    int v13 = [v12 isEqualToString:@"state"];

    if (v13)
    {
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn && -[CBManager state](self, "state") != 10)
      {
        -[CBClassicManager forEachClassicPeer:](self, "forEachClassicPeer:", &__block_literal_global_3);
        if (-[CBManager state](self, "state") == CBManagerStateResetting) {
          -[CBClassicManager orphanClassicPeers](self, "orphanClassicPeers");
        }
      }
    }
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___CBClassicManager;
    -[CBClassicManager observeValueForKeyPath:ofObject:change:context:]( &v14,  sel_observeValueForKeyPath_ofObject_change_context_,  v12,  v10,  v11,  a6);
  }
}

uint64_t __67__CBClassicManager_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 handleDisconnection];
}

- (id)peerWithIdentifier:(id)a3
{
  id v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    v5 = self->_peers;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](self->_peers, "objectForKey:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

    return v6;
  }

  else
  {

    return 0LL;
  }

- (id)classicPeerWithInfo:(id)a3
{
  id v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    v5 = self->_peers;
    objc_sync_enter(v5);
    peers = self->_peers;
    [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](peers, "objectForKey:", v7);
    v8 = (CBClassicPeer *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v8 = -[CBClassicPeer initWithInfo:manager:]( objc_alloc(&OBJC_CLASS___CBClassicPeer),  "initWithInfo:manager:",  v4,  self);
      -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 41LL, v4);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBClassicPeer handleMsg:args:](v8, "handleMsg:args:", 41LL, v9);
      id v10 = self->_peers;
      [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v8, v11);
    }

    objc_sync_exit(v5);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)peerWithInfo:(id)a3
{
  id v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    v5 = -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v4);
    return v5;
  }

  else
  {

    return 0LL;
  }

- (void)forEachClassicPeer:(id)a3
{
  v8 = (void (**)(id, uint64_t))a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    id v4 = self->_peers;
    objc_sync_enter(v4);
    v5 = -[NSMapTable objectEnumerator](self->_peers, "objectEnumerator");
    for (i = 0LL; ; i = (void *)v7)
    {
      uint64_t v7 = [v5 nextObject];

      if (!v7) {
        break;
      }
      v8[2](v8, v7);
    }

    objc_sync_exit(v4);
  }
}

- (void)orphanClassicPeers
{
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    -[CBClassicManager forEachClassicPeer:](self, "forEachClassicPeer:", &__block_literal_global_42);
    obj = self->_peers;
    objc_sync_enter(obj);
    -[NSMapTable removeAllObjects](self->_peers, "removeAllObjects");
    objc_sync_exit(obj);
  }

void __38__CBClassicManager_orphanClassicPeers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    __38__CBClassicManager_orphanClassicPeers__block_invoke_cold_1();
  }
  [v2 handleDisconnection];
  [v2 setOrphan];
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return a3 == 27 || a3 == 52;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  if (a3 <= 0x3Cu && ((1LL << a3) & 0x1000000000000300LL) != 0) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBClassicManager;
  return -[CBManager isMsgAllowedAlways:](&v6, sel_isMsgAllowedAlways_);
}

- (void)setBTConnectable:(BOOL)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (self->_connectable != a3)
  {
    objc_super v6 = @"kCBMsgArgConnectableState";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendMsg:args:](self, "sendMsg:args:", 28LL, v5);
  }

- (void)setBTDiscoverable:(BOOL)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (self->_discoverable != a3)
  {
    objc_super v6 = @"kCBMsgArgDiscoverableState";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendMsg:args:](self, "sendMsg:args:", 29LL, v5);
  }

- (BOOL)setBTPowerState:(BOOL)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  int64_t powerState = self->_powerState;
  if (!a3)
  {
    if (powerState != 2) {
      return 0;
    }
LABEL_6:
    uint64_t v9 = @"kCBMsgArgBTPowerState";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 27LL, v8);

    return v5;
  }

  if (powerState != 2) {
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)secureBluetooth:(BOOL)a3 withAuthData:(id)a4
{
  BOOL v4 = a3;
  v14[2] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"CBClassicManager.m", 203, @"Invalid parameter not satisfying: %@", @"authData != nil" object file lineNumber description];
  }

  v13[0] = @"kCBMsgArgSecureBluetoothMode";
  [MEMORY[0x189607968] numberWithBool:v4];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = @"kCBMsgArgSecureBluetoothData";
  v14[0] = v8;
  v14[1] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 60LL, v9);

  return v10;
}

- (void)handleLocalDeviceStateUpdatedMsg:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgInquiryState"];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgConnectableState"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgDiscoverableState"];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgBTPowerState"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", @"inquiryState");
    self->_inquiryState = [v14 BOOLValue];
    -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", @"inquiryState");
  }

  if (v5)
  {
    int v8 = [v5 BOOLValue];
    if (self->_connectable != v8)
    {
      BOOL v9 = v8;
      -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", @"connectable");
      self->_connectable = v9;
      -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", @"connectable");
    }
  }

  if (v6)
  {
    int v10 = [v6 BOOLValue];
    if (self->_discoverable != v10)
    {
      BOOL v11 = v10;
      -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", @"discoverable");
      self->_discoverable = v11;
      -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", @"discoverable");
    }
  }

  if (v7)
  {
    int v12 = [v7 intValue];
    -[CBClassicManager willChangeValueForKey:](self, "willChangeValueForKey:", @"powerState");
    int64_t v13 = v12 == 2;
    if (v12 == 1) {
      int64_t v13 = 2LL;
    }
    self->_int64_t powerState = v13;
    -[CBClassicManager didChangeValueForKey:](self, "didChangeValueForKey:", @"powerState");
  }
}

- (void)startInquiryWithOptions:(id)a3 classicPeerDiscovered:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  int v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:].cold.1(v8, self, (uint64_t)v6);
  }
  -[CBClassicManager setClassicPeerDiscovered:](self, "setClassicPeerDiscovered:", v7);
  if (-[CBManager state](self, "state") == CBManagerStatePoweredOn)
  {
    [MEMORY[0x189603FC8] dictionary];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"kCBMsgArgInquiryState"];
    if (![v6 count])
    {
LABEL_21:
      if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 30LL, v9)) {
        self->_isInquiryRunning = 1;
      }

      goto LABEL_24;
    }

    [v6 objectForKeyedSubscript:@"kCBInquiryLength"];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      [v9 setObject:v10 forKeyedSubscript:@"kCBMsgArgInquiryLength"];
    }
    [v6 objectForKeyedSubscript:@"kCBInquiryInfinite"];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11) {
      [v9 setObject:v11 forKeyedSubscript:@"kCBMsgArgInquiryInfinite"];
    }
    [v6 objectForKeyedSubscript:@"kCBInquiryServices"];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12) {
      [v9 setObject:v12 forKeyedSubscript:@"kCBMsgArgServiceUUIDs"];
    }
    [v6 objectForKeyedSubscript:@"kCBInquiryRSSIThreshold"];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      [v9 setObject:v13 forKeyedSubscript:@"kCBMsgArgRssi"];
    }
    [v6 objectForKeyedSubscript:@"kCBInquiryReportDuplicates"];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }

    if (CBLogInitOnce == -1)
    {
      v15 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        [v9 setObject:v14 forKeyedSubscript:@"kCBMsgArgInquiryReportDuplicates"];
        goto LABEL_20;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      v15 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
    }

    int v16 = 136315394;
    v17 = "-[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:]";
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_186F9B000, v15, OS_LOG_TYPE_DEFAULT, "%s reportDuplicates set to %@", (uint8_t *)&v16, 0x16u);
    goto LABEL_19;
  }

- (void)stopInquiry
{
  if (self->_isInquiryRunning)
  {
    -[CBManager sendMsg:args:](self, "sendMsg:args:", 52LL, 0LL);
    self->_isInquiryRunning = 0;
  }

- (id)retrievePairedPeersWithOptions:(id)a3
{
  id v4 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
  {
    id v14 = 0LL;
    goto LABEL_16;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager retrievePairedPeersWithOptions:].cold.1();
  }
  [v4 objectForKeyedSubscript:@"kCBOptionConnectedKey"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBOptionServicesKey"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBOptionIdentifiersKey"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = v8;
  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:@"kCBMsgArgConnectionState"];
  }
  if ([v6 count]) {
    [v9 setObject:v6 forKeyedSubscript:@"kCBMsgArgServiceUUIDs"];
  }
  if ([v7 count]) {
    [v9 setObject:v7 forKeyedSubscript:@"kCBMsgArgUUIDs"];
  }
  [MEMORY[0x189603FA8] array];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
LABEL_18:
    -[CBClassicManager retrievePairedPeersWithOptions:].cold.1();
    goto LABEL_14;
  }

  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_18;
  }
LABEL_14:
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 37LL, v9);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __51__CBClassicManager_retrievePairedPeersWithOptions___block_invoke;
  v16[3] = &unk_189FB45F0;
  id v13 = v10;
  id v17 = v13;
  __int16 v18 = self;
  [v12 enumerateObjectsUsingBlock:v16];
  id v14 = v13;

LABEL_16:
  return v14;
}

void __51__CBClassicManager_retrievePairedPeersWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) peerWithInfo:a2];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (id)getLocalSDPDatabase
{
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    return 0LL;
  }
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 59LL, MEMORY[0x189604A60]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"kCBMsgArgSDPRecordData"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addService:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    goto LABEL_15;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"CBClassicManager.m", 333, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
LABEL_4:
  id v6 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager addService:].cold.2(v5, v6);
  }
  [v5 data];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 length] != 2)
  {
    [v5 data];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 length] == 4)
    {
    }

    else
    {
      [v5 data];
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 length];

      if (v10 == 16) {
        goto LABEL_12;
      }
      [MEMORY[0x1896077D8] currentHandler];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 handleFailureInMethod:a2, self, @"CBClassicManager.m", 336, @"Invalid parameter not satisfying: %@", @"serviceUUID.data.length == 2 || serviceUUID.data.length == 4 || serviceUUID.data.length == 16" object file lineNumber description];
    }
  }

LABEL_12:
  id v14 = @"kCBMsgArgServiceUUID";
  v15[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 31LL, v11);

  if (!v12)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }

    -[CBClassicManager addService:].cold.1();
  }

- (void)removeService:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    goto LABEL_9;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBClassicManager.m", 346, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager removeService:].cold.2();
  }
  BOOL v9 = @"kCBMsgArgServiceUUID";
  v10[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 32LL, v6);

  if (!v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    -[CBClassicManager removeService:].cold.1();
  }

- (void)removeServiceHandle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v19[1] = *MEMORY[0x1895F89C0];
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    return;
  }
  if ((_DWORD)v3)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"CBClassicManager.m", 356, @"Invalid parameter not satisfying: %@", @"serviceHandle != 0" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
LABEL_4:
  id v6 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager removeServiceHandle:].cold.2(v3, v6);
  }
  __int16 v18 = @"kCBMsgArgServiceHandle";
  [MEMORY[0x189607968] numberWithUnsignedInt:v3];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 32LL, v8);

  if (!v9)
  {
    if (CBLogInitOnce == -1)
    {
      uint64_t v10 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        return;
      }
LABEL_13:
      -[CBClassicManager removeServiceHandle:].cold.1(v3, v10, v11, v12, v13, v14, v15, v16);
      return;
    }

    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    uint64_t v10 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
  }

- (void)removeAllServices
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  id v2 = "-[CBClassicManager removeAllServices]";
  _os_log_debug_impl(&dword_186F9B000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)addServiceToInquiryList:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    goto LABEL_15;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"CBClassicManager.m", 376, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager addServiceToInquiryList:].cold.2();
  }
  [v5 data];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 length] != 2)
  {
    [v5 data];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 length] == 4)
    {
    }

    else
    {
      [v5 data];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 length];

      if (v9 == 16) {
        goto LABEL_12;
      }
      [MEMORY[0x1896077D8] currentHandler];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 handleFailureInMethod:a2, self, @"CBClassicManager.m", 379, @"Invalid parameter not satisfying: %@", @"serviceUUID.data.length == 2 || serviceUUID.data.length == 4 || serviceUUID.data.length == 16" object file lineNumber description];
    }
  }

LABEL_12:
  uint64_t v13 = @"kCBMsgArgServiceUUID";
  v14[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 34LL, v10);

  if (!v11)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }

    -[CBClassicManager addServiceToInquiryList:].cold.1();
  }

- (void)removeServiceFromInquiryList:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    goto LABEL_9;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBClassicManager.m", 389, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager removeServiceFromInquiryList:].cold.2();
  }
  uint64_t v9 = @"kCBMsgArgServiceUUID";
  v10[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 35LL, v6);

  if (!v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    -[CBClassicManager removeServiceFromInquiryList:].cold.1();
  }

- (void)removeAllServicesFromInquiryList
{
}

- (void)addService:(id)a3 sdpRecord:(id)a4 sdpRecordAddedHandler:(id)a5
{
  v16[2] = *MEMORY[0x1895F89C0];
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (!-[CBManager tccApproved](self, "tccApproved")) {
    goto LABEL_9;
  }
  if (v9 | v10)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"CBClassicManager.m", 410, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil || sdpRecord != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager addService:sdpRecord:sdpRecordAddedHandler:].cold.2();
  }
  -[CBClassicManager setSdpRecordAddedHandler:](self, "setSdpRecordAddedHandler:", v11);
  v15[0] = @"kCBMsgArgUUID";
  v15[1] = @"kCBMsgArgOptions";
  v16[0] = v9;
  v16[1] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 31LL, v12);

  if (!v13)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }

    -[CBClassicManager addService:sdpRecord:sdpRecordAddedHandler:].cold.1();
  }

- (unsigned)addServiceWithData:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v5)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 handleFailureInMethod:a2, self, @"CBClassicManager.m", 423, @"Invalid parameter not satisfying: %@", @"serviceData != nil" object file lineNumber description];
    }

    uint64_t v12 = @"kCBMsgArgSDPRecordData";
    v13[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 31LL, v6);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v7 objectForKeyedSubscript:@"kCBMsgArgServiceHandle"];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v9 = [v8 unsignedIntValue];
  }

  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (void)connectPeer:(id)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v7)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 handleFailureInMethod:a2, self, @"CBClassicManager.m", 433, @"Invalid parameter not satisfying: %@", @"peer != nil" object file lineNumber description];
    }

    [v8 objectForKeyedSubscript:@"kCBOptionServicesKey"];
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    unint64_t v10 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      [v7 name];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v21 = "-[CBClassicManager connectPeer:options:]";
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_186F9B000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ uuids: %@", buf, 0x20u);
    }

    v18[0] = @"kCBMsgArgDeviceUUID";
    [v7 identifier];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = @"kCBMsgArgOptions";
    v19[0] = v13;
    v19[1] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 39LL, v14);

    if (v15)
    {
      uint64_t v16 = [v7 state];
      if (v16 == 3 || !v16) {
        [v7 setState:1];
      }
    }
  }
}

- (void)cancelPeerConnection:(id)a3
{
  id v4 = a3;
  if (-[CBManager tccApproved](self, "tccApproved")) {
    -[CBClassicManager cancelPeerConnection:force:](self, "cancelPeerConnection:force:", v4, 0LL);
  }
}

- (void)cancelPeerConnection:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v11)
    {
      [MEMORY[0x1896077D8] currentHandler];
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 handleFailureInMethod:a2, self, @"CBClassicManager.m", 464, @"Invalid parameter not satisfying: %@", @"peer != nil" object file lineNumber description];
    }

    [MEMORY[0x189603FC8] dictionary];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (v4) {
      uint64_t v9 = MEMORY[0x189604A88];
    }
    else {
      uint64_t v9 = MEMORY[0x189604A80];
    }
    [v7 setObject:v9 forKey:@"kCBCancelConnectOptionForce"];
    -[CBClassicManager cancelPeerConnection:options:](self, "cancelPeerConnection:options:", v11, v8);
  }
}

- (void)cancelPeerConnection:(id)a3 options:(id)a4
{
  v16[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (-[CBManager tccApproved](self, "tccApproved"))
  {
    if (!v7)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 handleFailureInMethod:a2, self, @"CBClassicManager.m", 476, @"Invalid parameter not satisfying: %@", @"peer != nil" object file lineNumber description];
    }

    v15[0] = @"kCBMsgArgDeviceUUID";
    uint64_t v9 = [v7 identifier];
    unint64_t v10 = (void *)v9;
    v15[1] = @"kCBMsgArgOptions";
    id v11 = (id)MEMORY[0x189604A60];
    if (v8) {
      id v11 = v8;
    }
    v16[0] = v9;
    v16[1] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 40LL, v12);
  }
}

- (void)setTestMode:(BOOL)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (self->_testMode != a3)
  {
    id v8 = @"kCBMsgArgState";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 43LL, v6);

    if (v7) {
      self->_testMode = a3;
    }
  }

- (id)retrievePeerWithAddress:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[CBManager tccApproved](self, "tccApproved"))
  {
LABEL_9:
    unint64_t v10 = 0LL;
    goto LABEL_12;
  }

  if (![v4 length])
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicManager retrievePeerWithAddress:].cold.1();
    }
    goto LABEL_9;
  }

  uint64_t v12 = @"kCBMsgArgAddressString";
  [MEMORY[0x189607810] whitespaceCharacterSet];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByTrimmingCharactersInSet:v5];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 38LL, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 objectForKeyedSubscript:@"kCBMsgArgDevices"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v9);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setAddressString:v4];
  }

  else
  {
    unint64_t v10 = 0LL;
  }

LABEL_12:
  return v10;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  int v7 = 0;
  id v8 = &selRef_handlePeerDiscovered_;
  switch((int)v4)
  {
    case 16:
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 handlePairingMessage:16 args:v6];

      return;
    case 17:
    case 18:
      -[CBClassicManager pairingStatusHandler](self, "pairingStatusHandler");
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v6);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607870] errorWithInfo:v6];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBClassicManager pairingStatusHandler](self, "pairingStatusHandler");
        BOOL v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *, uint64_t))v13)[2](v13, v11, [v12 code]);
      }

      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 handlePairingMessage:v4 args:v6];

      return;
    case 23:
    case 24:
    case 45:
    case 56:
    case 57:
      -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v6);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 handleMsg:v4 args:v6];

      goto LABEL_3;
    case 44:
      goto LABEL_21;
    case 46:
      int v7 = 0;
      v23 = sel_handleServiceAddedToSDP_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 47:
      int v7 = 0;
      v23 = sel_handleSDPRecordAdded_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 48:
      int v7 = 0;
      v23 = sel_handleServiceAddedToInquiryList_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 49:
      int v7 = 0;
      v23 = sel_handlePeerConnectionCompleted_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 50:
      int v7 = 0;
      id v8 = &selRef_handlePeerDisconnectionCompleted_;
LABEL_21:
      v23 = *v8;
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn) {
        goto LABEL_22;
      }
      goto LABEL_28;
    case 51:
      int v7 = 1;
      v23 = sel_handlePeerConnectionStateUpdated_;
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
LABEL_22:
      if (((-[CBManager state](self, "state") != 10) & ~v7) != 0)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        {
          -[CBClassicManager handleMsg:args:].cold.2();
        }

        else
        {
LABEL_3:
        }
      }

      else
      {
LABEL_28:
        objc_msgSend(self, v23, v6);
      }

      break;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      uint64_t v16 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      -[CBClassicManager handleMsg:args:].cold.1(v4, v16, v17, v18, v19, v20, v21, v22);

      break;
  }

- (void)handlePeerDiscovered:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_isInquiryRunning)
  {
    -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      id v6 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = v6;
        [v5 name];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = 136315650;
        id v11 = "-[CBClassicManager handlePeerDiscovered:]";
        __int16 v12 = 2112;
        BOOL v13 = v8;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_186F9B000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ - %@", (uint8_t *)&v10, 0x20u);
      }

      -[CBClassicManager classicPeerDiscovered](self, "classicPeerDiscovered");
      uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, CBClassicManager *, void *, id))v9)[2](v9, self, v5, v4);
    }

    else
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBClassicManager handlePeerDiscovered:].cold.2();
      }
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicManager handlePeerDiscovered:].cold.1();
    }
  }
}

- (void)handlePeerConnectionStateUpdated:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager handlePeerConnectionStateUpdated:].cold.1();
  }
  -[CBClassicManager classicPeerWithInfo:](self, "classicPeerWithInfo:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 handlePeerUpdated:v4];
  -[CBClassicManager connectionStatusHandler](self, "connectionStatusHandler");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || [v5 state] == 1) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 state];

  if (v7 != 3)
  {
    [MEMORY[0x189607870] errorWithInfo:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager connectionStatusHandler](self, "connectionStatusHandler");
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v5, [v6 code]);

LABEL_9:
  }
}

- (void)handleServiceAddedToSDP:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleServiceAddedToSDP:].cold.1();
    -[CBClassicManager serviceAddedHandler](self, "serviceAddedHandler");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  -[CBClassicManager serviceAddedHandler](self, "serviceAddedHandler");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    [MEMORY[0x189607870] errorWithInfo:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager serviceAddedHandler](self, "serviceAddedHandler");
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v7, [v6 code]);
  }

- (void)handleServiceAddedToInquiryList:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleServiceAddedToInquiryList:].cold.1();
    -[CBClassicManager inquiryServiceAddedHandler](self, "inquiryServiceAddedHandler");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  -[CBClassicManager inquiryServiceAddedHandler](self, "inquiryServiceAddedHandler");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    [MEMORY[0x189607870] errorWithInfo:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager inquiryServiceAddedHandler](self, "inquiryServiceAddedHandler");
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v7, [v6 code]);
  }

- (void)handleSDPRecordAdded:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleSDPRecordAdded:].cold.1();
    -[CBClassicManager sdpRecordAddedHandler](self, "sdpRecordAddedHandler");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  -[CBClassicManager sdpRecordAddedHandler](self, "sdpRecordAddedHandler");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_5:
    [MEMORY[0x189607870] errorWithInfo:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBClassicManager sdpRecordAddedHandler](self, "sdpRecordAddedHandler");
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v7, [v6 code]);
  }

- (void)handlePeerConnectionCompleted:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicManager peerWithIdentifier:](self, "peerWithIdentifier:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint64_t v7 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = "-[CBClassicManager handlePeerConnectionCompleted:]";
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_186F9B000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v15, 0x20u);
    }

    [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8) {
      objc_msgSend(v6, "setInternalState:", (int)objc_msgSend(v8, "intValue"));
    }
    [MEMORY[0x189607870] errorWithInfo:v4];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      [v6 handleFailedConnection];
      -[CBClassicManager connectCallback](self, "connectCallback");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_11:

        goto LABEL_16;
      }
    }

    else
    {
      [v6 handleSuccessfulConnection:v4];
      -[CBClassicManager connectCallback](self, "connectCallback");
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14) {
        goto LABEL_11;
      }
    }

    -[CBClassicManager connectCallback](self, "connectCallback");
    __int16 v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v6, [v10 code]);

    goto LABEL_11;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  BOOL v13 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBClassicManager handlePeerConnectionCompleted:].cold.1(v13, v4);
  }
LABEL_16:
}

- (void)handlePeerDisconnectionCompleted:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBClassicManager peerWithIdentifier:](self, "peerWithIdentifier:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint64_t v7 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      int v15 = "-[CBClassicManager handlePeerDisconnectionCompleted:]";
      __int16 v16 = 2112;
      __int16 v17 = v6;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_186F9B000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v14, 0x20u);
    }

    [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8) {
      objc_msgSend(v6, "setInternalState:", (int)objc_msgSend(v8, "intValue"));
    }
    [MEMORY[0x189607870] errorWithInfo:v4];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleDisconnection];
    -[CBClassicManager disconnectCallback](self, "disconnectCallback");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CBClassicManager disconnectCallback](self, "disconnectCallback");
      __int16 v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, uint64_t))v12)[2](v12, v6, [v10 code]);
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    BOOL v13 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicManager handlePeerDisconnectionCompleted:].cold.1(v13, v4);
    }
  }
}

- (void)alertUserNotificationIsReady:(id)a3
{
}

- (BOOL)inquiryState
{
  return self->_inquiryState;
}

- (BOOL)discoverable
{
  return self->_discoverable;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (id)connectCallback
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setConnectCallback:(id)a3
{
}

- (id)disconnectCallback
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDisconnectCallback:(id)a3
{
}

- (id)serviceAddedHandler
{
  return objc_getProperty(self, a2, 160LL, 1);
}

- (void)setServiceAddedHandler:(id)a3
{
}

- (id)inquiryServiceAddedHandler
{
  return objc_getProperty(self, a2, 168LL, 1);
}

- (void)setInquiryServiceAddedHandler:(id)a3
{
}

- (NSMapTable)peers
{
  return self->_peers;
}

- (BOOL)isInquiryRunning
{
  return self->_isInquiryRunning;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (id)classicPeerDiscovered
{
  return objc_getProperty(self, a2, 192LL, 1);
}

- (void)setClassicPeerDiscovered:(id)a3
{
}

- (id)sdpRecordAddedHandler
{
  return objc_getProperty(self, a2, 200LL, 1);
}

- (void)setSdpRecordAddedHandler:(id)a3
{
}

- (id)pairingStatusHandler
{
  return objc_getProperty(self, a2, 208LL, 1);
}

- (void)setPairingStatusHandler:(id)a3
{
}

- (id)connectionStatusHandler
{
  return objc_getProperty(self, a2, 216LL, 1);
}

- (void)setConnectionStatusHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

void __38__CBClassicManager_orphanClassicPeers__block_invoke_cold_1()
{
}

- (void)startInquiryWithOptions:(uint64_t)a3 classicPeerDiscovered:.cold.1( void *a1,  void *a2,  uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1;
  int v7 = 136315650;
  id v8 = "-[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:]";
  __int16 v9 = 2048;
  uint64_t v10 = [a2 state];
  __int16 v11 = 2112;
  uint64_t v12 = a3;
  OUTLINED_FUNCTION_7(&dword_186F9B000, v5, v6, "%s block with state %ld and options: %@ ", (uint8_t *)&v7);

  OUTLINED_FUNCTION_10();
}

- (void)retrievePairedPeersWithOptions:.cold.1()
{
}

- (void)addService:.cold.1()
{
}

- (void)addService:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  [a1 data];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 136315650;
  int v7 = "-[CBClassicManager addService:]";
  __int16 v8 = 2112;
  __int16 v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = [v4 length];
  OUTLINED_FUNCTION_7(&dword_186F9B000, v3, v5, "%s %@, len: %lu", (uint8_t *)&v6);

  OUTLINED_FUNCTION_10();
}

- (void)removeService:.cold.1()
{
}

- (void)removeService:.cold.2()
{
}

- (void)removeServiceHandle:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)removeServiceHandle:(int)a1 .cold.2(int a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  uint64_t v3 = "-[CBClassicManager removeServiceHandle:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_186F9B000, a2, OS_LOG_TYPE_DEBUG, "%s %X", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)addServiceToInquiryList:.cold.1()
{
}

- (void)addServiceToInquiryList:.cold.2()
{
}

- (void)removeServiceFromInquiryList:.cold.1()
{
}

- (void)removeServiceFromInquiryList:.cold.2()
{
}

- (void)addService:sdpRecord:sdpRecordAddedHandler:.cold.1()
{
}

- (void)addService:sdpRecord:sdpRecordAddedHandler:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_7(&dword_186F9B000, v2, (uint64_t)v2, "%s %@ sdp: %@", (uint8_t *)v3);
}

- (void)retrievePeerWithAddress:.cold.1()
{
}

- (void)handleMsg:(uint64_t)a3 args:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handleMsg:args:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_186F9B000, v1, OS_LOG_TYPE_ERROR, "%@ is not powered on, ignoring message: %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePeerDiscovered:.cold.1()
{
}

- (void)handlePeerDiscovered:.cold.2()
{
}

- (void)handlePeerConnectionStateUpdated:.cold.1()
{
}

- (void)handleServiceAddedToSDP:.cold.1()
{
}

- (void)handleServiceAddedToInquiryList:.cold.1()
{
}

- (void)handleSDPRecordAdded:.cold.1()
{
}

- (void)handlePeerConnectionCompleted:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1;
  [a2 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_186F9B000, v3, OS_LOG_TYPE_ERROR, "%s %@ not found", (uint8_t *)v5, 0x16u);

  OUTLINED_FUNCTION_11();
}

- (void)handlePeerDisconnectionCompleted:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1;
  [a2 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl( &dword_186F9B000,  v3,  OS_LOG_TYPE_ERROR,  "handlePeerDisconnectionCompleted: %@ not found",  v5,  0xCu);

  OUTLINED_FUNCTION_11();
}

@end