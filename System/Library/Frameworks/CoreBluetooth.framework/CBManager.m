@interface CBManager
+ (BOOL)tccAvailable;
+ (CBManagerAuthorization)authorization;
+ (int)preflightCheckForTCC;
+ (unsigned)retrieveCurrentProcessSessionCount;
+ (void)authorization;
- (BOOL)getCBPrivacySupported;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)sendDebugMsg:(unsigned __int16)a3 args:(id)a4;
- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4;
- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4 withReply:(id)a5;
- (BOOL)sendRawCommand:(unsigned __int16)a3 data:(id)a4 completionHandler:(id)a5;
- (BOOL)tccApproved;
- (BOOL)tccComplete;
- (BOOL)tccRequired;
- (CBManagerAuthorization)authorization;
- (CBManagerState)state;
- (CBPairingAgent)sharedPairingAgent;
- (NSData)advertisingAddress;
- (NSData)nonConnectableAdvertisingAddress;
- (NSData)nonConnectableSecondaryAdvertisingAddress;
- (NSString)localAddressString;
- (NSString)localName;
- (id)createCnxWithInfo:(id)a3;
- (id)getCnxInstanceForIdentifier:(id)a3;
- (id)getCurrentQueue;
- (id)getWhbLocalIdForRemoteId:(id)a3;
- (id)initInternal;
- (id)peerWithInfo:(id)a3;
- (id)sendDebugSyncMsg:(unsigned __int16)a3 args:(id)a4;
- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4;
- (int64_t)advertisingAddressType;
- (int64_t)nonConnectableAdvertisingAddressType;
- (int64_t)nonConnectableSecondaryAdvertisingAddressType;
- (void)_handleAdvertisingAddressChanged:(id)a3;
- (void)checkForTCCWithDeviceCount;
- (void)closeL2CAPChannelForPeerUUID:(id)a3 withPsm:(unsigned __int16)a4;
- (void)dealloc;
- (void)didReceiveForwardedMessageForCBManager:(id)a3;
- (void)doneWithTCC;
- (void)extractLocalDeviceStatesDictionary:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePairingAgentMsg:(unsigned __int16)a3 args:(id)a4;
- (void)performTCCCheck:(id)a3;
- (void)queryBluetoothStatus:(id)a3 completion:(id)a4;
- (void)removeCnxInstanceForIdentifier:(id)a3;
- (void)removeWhbRemoteId:(id)a3;
- (void)retrieveBundle:(id)a3 sessionCountWithCompletion:(id)a4;
- (void)retrieveSupportedResources:(id)a3 subKey:(id)a4 completion:(id)a5;
- (void)setAdvertisingAddress:(id)a3;
- (void)setConnectionTargetQueue:(id)a3;
- (void)setNonConnectableAdvertisingAddress:(id)a3;
- (void)setNonConnectableSecondaryAdvertisingAddress:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTccApproved:(BOOL)a3;
- (void)setTccComplete:(BOOL)a3;
- (void)setTccRequired:(BOOL)a3;
- (void)setWHBMsgReplyHandler:(id)a3;
- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4;
- (void)startWithQueue:(id)a3 options:(id)a4 sessionType:(int)a5;
- (void)triggerBTErrorReport:(int64_t)a3;
- (void)xpcConnectionDidReceiveMsg:(unsigned __int16)a3 args:(id)a4;
- (void)xpcConnectionDidReset;
- (void)xpcConnectionIsInvalid;
@end

@implementation CBManager

+ (BOOL)tccAvailable
{
  return MEMORY[0x189612AC0] != 0LL;
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CBManager;
  v2 = -[CBManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0LL;
    localAddressString = v2->_localAddressString;
    v2->_localAddressString = 0LL;

    localName = v3->_localName;
    v3->_localName = 0LL;

    pthread_mutex_lock(&_sessionCounterLock);
    ++_sessionCounter;
    pthread_mutex_unlock(&_sessionCounterLock);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (CBPairingAgent)sharedPairingAgent
{
  pairingAgent = self->_pairingAgent;
  if (!pairingAgent)
  {
    v4 = -[CBPairingAgent initWithParentManager:]( objc_alloc(&OBJC_CLASS___CBPairingAgent),  "initWithParentManager:",  self);
    v5 = self->_pairingAgent;
    self->_pairingAgent = v4;

    pairingAgent = self->_pairingAgent;
  }

  return pairingAgent;
}

- (void)setConnectionTargetQueue:(id)a3
{
}

- (void)extractLocalDeviceStatesDictionary:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgAddressString"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgState"];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    objc_storeStrong((id *)&self->_localAddressString, v5);
  }
  if (v6)
  {
    -[CBManager willChangeValueForKey:](self, "willChangeValueForKey:", @"localName");
    objc_storeStrong((id *)&self->_localName, v6);
    -[CBManager didChangeValueForKey:](self, "didChangeValueForKey:", @"localName");
  }

  if (+[CBManager authorization](&OBJC_CLASS___CBManager, "authorization") == CBManagerAuthorizationNotDetermined)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    v8 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    {
      -[CBManager extractLocalDeviceStatesDictionary:].cold.1(v8);
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }

  if (v7) {
LABEL_10:
  }
    -[CBManager setState:](self, "setState:", [v7 integerValue]);
LABEL_11:
  -[CBManager handleLocalDeviceStateUpdatedMsg:](self, "handleLocalDeviceStateUpdatedMsg:", v4);
}

- (void)startWithQueue:(id)a3 options:(id)a4 sessionType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v16 = v8;
  if (v8)
  {
    v9 = (OS_dispatch_queue *)v8;
    queue = self->_queue;
    self->_queue = v9;
  }

  else
  {
    v11 = (OS_dispatch_queue *)MEMORY[0x1895F8AE0];
    id v12 = MEMORY[0x1895F8AE0];
    queue = self->_queue;
    self->_queue = v11;
  }

  id v13 = a4;

  v14 = -[CBXpcConnection initWithDelegate:queue:options:sessionType:]( objc_alloc(&OBJC_CLASS___CBXpcConnection),  "initWithDelegate:queue:options:sessionType:",  self,  self->_queue,  v13,  v5);
  connection = self->_connection;
  self->_connection = v14;

  -[CBXpcConnection connect](self->_connection, "connect");
}

- (id)getCurrentQueue
{
  queue = self->_queue;
  if (queue) {
    return queue;
  }
  objc_super v3 = (void *)MEMORY[0x1895F8AE0];
  id v4 = MEMORY[0x1895F8AE0];
  return v3;
}

- (BOOL)sendRawCommand:(unsigned __int16)a3 data:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (BOOL)sendDebugMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  v14[2] = *MEMORY[0x1895F89C0];
  connection = self->_connection;
  v13[0] = @"kCBMsgId";
  v6 = (void *)MEMORY[0x189607968];
  id v7 = a4;
  uint64_t v8 = [v6 numberWithUnsignedShort:v4];
  v9 = (void *)v8;
  v13[1] = @"kCBMsgArgs";
  id v10 = (id)MEMORY[0x189604A60];
  if (v7) {
    id v10 = v7;
  }
  v14[0] = v8;
  v14[1] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBXpcConnection sendMsg:args:](connection, "sendMsg:args:", 208LL, v11);

  return 1;
}

- (id)sendDebugSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  v15[2] = *MEMORY[0x1895F89C0];
  connection = self->_connection;
  v14[0] = @"kCBMsgId";
  v6 = (void *)MEMORY[0x189607968];
  id v7 = a4;
  uint64_t v8 = [v6 numberWithUnsignedShort:v4];
  v9 = (void *)v8;
  v14[1] = @"kCBMsgArgs";
  id v10 = (id)MEMORY[0x189604A60];
  if (v7) {
    id v10 = v7;
  }
  v15[0] = v8;
  v15[1] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBXpcConnection sendSyncMsg:args:](connection, "sendSyncMsg:args:", 208LL, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v8 = -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v7);
    if (v8)
    {
      v9 = (void *)v8;
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      id v10 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl( &dword_186F9B000,  v10,  OS_LOG_TYPE_DEFAULT,  "CBManager fwdMsg %@ through WHB for peripheral %@ ",  (uint8_t *)&v15,  0x16u);
      }

      -[CBXpcConnection forwardWhbMsg:args:cnx:](self->_connection, "forwardWhbMsg:args:cnx:", v4, v6, v9);

      goto LABEL_16;
    }
  }

  int64_t state = self->_state;
  BOOL v12 = state == 10 || state == 5;
  if (v12
    || state == 4 && -[CBManager isMsgAllowedWhenOff:](self, "isMsgAllowedWhenOff:", v4)
    || -[CBManager isMsgAllowedAlways:](self, "isMsgAllowedAlways:", v4))
  {
    -[CBXpcConnection sendMsg:args:](self->_connection, "sendMsg:args:", v4, v6);
LABEL_16:
    BOOL v13 = 1;
    goto LABEL_17;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBManager sendMsg:args:].cold.1();
  }
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  return -[CBXpcConnection sendSyncMsg:args:](self->_connection, "sendSyncMsg:args:", a3, a4);
}

- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4 withReply:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  int64_t state = self->_state;
  BOOL v11 = state == 10 || state == 5;
  if (v11
    || state == 4 && -[CBManager isMsgAllowedWhenOff:](self, "isMsgAllowedWhenOff:", v6)
    || -[CBManager isMsgAllowedAlways:](self, "isMsgAllowedAlways:", v6))
  {
    -[CBXpcConnection sendMsgWithReply:args:replyBlock:]( self->_connection,  "sendMsgWithReply:args:replyBlock:",  v6,  v8,  v9);
    BOOL v12 = 1;
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBManager sendMsg:args:].cold.1();
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setWHBMsgReplyHandler:(id)a3
{
}

- (void)closeL2CAPChannelForPeerUUID:(id)a3 withPsm:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBManager closeL2CAPChannelForPeerUUID:withPsm:].cold.1();
  }
  id v7 = (void *)MEMORY[0x189603FC8];
  [MEMORY[0x189607968] numberWithUnsignedShort:v4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgPSM", v6, @"kCBMsgArgDeviceUUID", 0);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 26LL, v9);
}

- (void)_handleAdvertisingAddressChanged:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBConnectableAdvertisingAddress"];
  uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBConnectableAdvertisingAddressType"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = [v6 integerValue];

  [v4 objectForKeyedSubscript:@"kCBNonConnectableAdvertisingAddress"];
  id v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBNonConnectableAdvertisingAddressType"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v10 = [v9 integerValue];

  [v4 objectForKeyedSubscript:@"kCBNonConnectableSecondaryAdvertisingAddress"];
  BOOL v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBNonConnectableSecondaryAdvertisingAddressType"];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v13 = [v12 integerValue];
  -[CBManager willChangeValueForKey:](self, "willChangeValueForKey:", @"advertisingAddress");
  advertisingAddress = self->_advertisingAddress;
  self->_advertisingAddress = v5;
  int v15 = v5;

  nonConnectableAdvertisingAddress = self->_nonConnectableAdvertisingAddress;
  self->_advertisingAddressType = v7;
  self->_nonConnectableAdvertisingAddress = v8;
  __int16 v17 = v8;

  nonConnectableSecondaryAdvertisingAddress = self->_nonConnectableSecondaryAdvertisingAddress;
  self->_nonConnectableAdvertisingAddressType = v10;
  self->_nonConnectableSecondaryAdvertisingAddress = v11;

  self->_nonConnectableSecondaryAdvertisingAddressType = v13;
  -[CBManager didChangeValueForKey:](self, "didChangeValueForKey:", @"advertisingAddress");
}

- (id)createCnxWithInfo:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteDeviceUUID"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v5);
  id v8 = (CBConnection *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___CBConnection);
    -[CBConnection setDispatchQueue:](v8, "setDispatchQueue:", self->_queue);
    id v9 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    int64_t v10 = v9;
    if (v6)
    {
      -[CBDevice setIdentifier:](v9, "setIdentifier:", v6);
    }

    else
    {
      [v5 UUIDString];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBDevice setIdentifier:](v10, "setIdentifier:", v11);
    }

    -[CBConnection setPeerDevice:](v8, "setPeerDevice:", v10);
    -[CBConnection peerDevice](v8, "peerDevice");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 identifier];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    -[CBDevice setIdentifier:](v14, "setIdentifier:", v7);
    -[CBConnection setRemoteDevice:](v8, "setRemoteDevice:", v14);
    -[NSMutableDictionary setObject:forKey:](self->_cnxDict, "setObject:forKey:", v8, v5);
    uint64_t v15 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __31__CBManager_createCnxWithInfo___block_invoke;
    v28[3] = &unk_189FB1AE0;
    id v16 = v5;
    id v29 = v16;
    -[CBConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v28);
    v25[0] = v15;
    v25[1] = 3221225472LL;
    v25[2] = __31__CBManager_createCnxWithInfo___block_invoke_43;
    v25[3] = &unk_189FB4CE8;
    v25[4] = self;
    id v17 = v16;
    id v26 = v17;
    id v18 = v13;
    id v27 = v18;
    -[CBConnection setErrorHandler:](v8, "setErrorHandler:", v25);
    v22[0] = v15;
    v22[1] = 3221225472LL;
    v22[2] = __31__CBManager_createCnxWithInfo___block_invoke_45;
    v22[3] = &unk_189FB19C8;
    v22[4] = self;
    id v23 = v17;
    id v24 = v18;
    id v19 = v18;
    -[CBConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v22);
    v21[0] = v15;
    v21[1] = 3221225472LL;
    v21[2] = __31__CBManager_createCnxWithInfo___block_invoke_46;
    v21[3] = &unk_189FB1EA0;
    v21[4] = self;
    -[CBConnection setXpcForwardMessageReceiveHandler:](v8, "setXpcForwardMessageReceiveHandler:", v21);
  }

  return v8;
}

void __31__CBManager_createCnxWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v2 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl( &dword_186F9B000,  v2,  OS_LOG_TYPE_DEFAULT,  "WHB cnx instance for localId %@ invalidated",  (uint8_t *)&v4,  0xCu);
  }

void __31__CBManager_createCnxWithInfo___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    __31__CBManager_createCnxWithInfo___block_invoke_43_cold_1();
  }
  [*(id *)(a1 + 32) removeCnxInstanceForIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
}

uint64_t __31__CBManager_createCnxWithInfo___block_invoke_45(uint64_t a1)
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    __31__CBManager_createCnxWithInfo___block_invoke_45_cold_1();
  }
  [*(id *)(a1 + 32) removeCnxInstanceForIdentifier:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) removeWhbRemoteId:*(void *)(a1 + 48)];
}

uint64_t __31__CBManager_createCnxWithInfo___block_invoke_46(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) didReceiveForwardedDelegateCallbackMessage:a2];
}

- (id)getCnxInstanceForIdentifier:(id)a3
{
  id v4 = a3;
  cnxDict = self->_cnxDict;
  if (!cnxDict)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    int64_t v7 = self->_cnxDict;
    self->_cnxDict = v6;

    cnxDict = self->_cnxDict;
  }

  -[NSMutableDictionary objectForKey:](cnxDict, "objectForKey:", v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)removeCnxInstanceForIdentifier:(id)a3
{
  id v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_cnxDict, "objectForKey:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_cnxDict, "removeObjectForKey:", v6);
  }
}

- (void)didReceiveForwardedMessageForCBManager:(id)a3
{
}

- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4
{
}

- (id)getWhbLocalIdForRemoteId:(id)a3
{
  return -[CBXpcConnection getWhbLocalIdForRemoteId:](self->_connection, "getWhbLocalIdForRemoteId:", a3);
}

- (void)removeWhbRemoteId:(id)a3
{
}

- (void)retrieveSupportedResources:(id)a3 subKey:(id)a4 completion:(id)a5
{
  v27[2] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  int64_t v10 = (__CFString *)a4;
  id v11 = a5;
  if (v9)
  {
    if ([v9 length]) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"CBManager.m", 335, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

    if ([0 length])
    {
LABEL_3:
      if (v11) {
        goto LABEL_4;
      }
LABEL_14:
      [MEMORY[0x1896077D8] currentHandler];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 handleFailureInMethod:a2, self, @"CBManager.m", 337, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

      uint64_t v12 = MEMORY[0x1895F87A8];
      int64_t v13 = &off_18702A000;
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_7;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 handleFailureInMethod:a2, self, @"CBManager.m", 336, @"Invalid parameter not satisfying: %@", @"[key length] > 0" object file lineNumber description];

  if (!v11) {
    goto LABEL_14;
  }
LABEL_4:
  uint64_t v12 = MEMORY[0x1895F87A8];
  int64_t v13 = &off_18702A000;
  if (v9)
  {
LABEL_5:
    uint64_t v14 = [v9 length];
    if (v11 && v14) {
      goto LABEL_8;
    }
  }

void __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithInfo:&unk_189FD64B0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0LL, 0LL, v2);
}

void __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke_70( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 objectForKeyedSubscript:@"kCBMsgArgResourceTotalCount"];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"kCBMsgArgResourceRemainingCount"];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)retrieveBundle:(id)a3 sessionCountWithCompletion:(id)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  int64_t v13 = @"kCBMsgArgApplicationID";
  v14[0] = a3;
  int64_t v7 = (void *)MEMORY[0x189603F68];
  id v8 = a3;
  [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke;
  v11[3] = &unk_189FB1978;
  id v12 = v6;
  id v10 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 31LL, v9, v11);
}

void __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke_cold_1();
    }
    int64_t v7 = &unk_189FD62B0;
  }

  else
  {
    [v5 objectForKeyedSubscript:@"kCBMsgArgCount"];
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  (unsigned __int16)[v7 unsignedIntValue]);
}

+ (unsigned)retrieveCurrentProcessSessionCount
{
  unsigned __int16 v2 = _sessionCounter;
  pthread_mutex_unlock(&_sessionCounterLock);
  return v2;
}

+ (int)preflightCheckForTCC
{
  return TCCAccessPreflight();
}

- (CBManagerAuthorization)authorization
{
  return +[CBManager authorization](&OBJC_CLASS___CBManager, "authorization");
}

+ (CBManagerAuthorization)authorization
{
  if (!+[CBManager tccAvailable](&OBJC_CLASS___CBManager, "tccAvailable")) {
    return 0LL;
  }
  int v2 = +[CBManager preflightCheckForTCC](&OBJC_CLASS___CBManager, "preflightCheckForTCC");
  switch(v2)
  {
    case 2:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization].cold.3();
      }
      return (unint64_t)(TCCAccessRestricted() != 0);
    case 1:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization].cold.2();
      }
      else {
        return 2LL;
      }
    case 0:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        +[CBManager authorization].cold.1();
      }
      return 3LL;
    default:
      return 0LL;
  }

- (void)handlePairingAgentMsg:(unsigned __int16)a3 args:(id)a4
{
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return 0;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  return a3 == 4 || a3 == 31;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
}

- (void)xpcConnectionDidReset
{
}

- (void)xpcConnectionIsInvalid
{
}

- (void)xpcConnectionDidReceiveMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if ((_DWORD)v4 == 3)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    int64_t v7 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_186F9B000, v7, OS_LOG_TYPE_DEFAULT, "Received CBMsgIdReadyForTCC", v8, 2u);
    }

    -[CBManager performTCCCheck:](self, "performTCCCheck:", v6);
  }

  else
  {
    if ((_DWORD)v4 == 6) {
      -[CBManager handleStateUpdatedMsg:](self, "handleStateUpdatedMsg:", v6);
    }
    else {
      -[CBManager handleMsg:args:](self, "handleMsg:args:", v4, v6);
    }
  }

- (void)triggerBTErrorReport:(int64_t)a3
{
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBManager triggerBTErrorReport:].cold.1();
  }
  id v5 = (void *)MEMORY[0x189603FC8];
  [MEMORY[0x189607968] numberWithInteger:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"kCBMsgArgReasonEnum", 0);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 27LL, v7);
}

- (id)peerWithInfo:(id)a3
{
  return 0LL;
}

- (void)doneWithTCC
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 4LL, v3);
}

- (void)checkForTCCWithDeviceCount
{
  int v2 = (const void *)*MEMORY[0x189612AD0];
  TCCAccessRequest();
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t __39__CBManager_checkForTCCWithDeviceCount__block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setTccApproved:a2 != 0];
  return [*(id *)(a1 + 32) doneWithTCC];
}

- (void)performTCCCheck:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!+[CBManager tccAvailable](&OBJC_CLASS___CBManager, "tccAvailable"))
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    id v12 = (os_log_s *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    LOWORD(v18) = 0;
    int64_t v13 = "TCC not available, calling doneWithTCC without setting tccComplete.";
    goto LABEL_14;
  }

  [v4 objectForKeyedSubscript:@"kCBMsgArgRequiresTCC"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager setTccRequired:](self, "setTccRequired:", [v5 BOOLValue]);

  [v4 objectForKeyedSubscript:@"kCBMsgArgTCCLEDevicesAroundDetails"];
  id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  devicesAroundUsDetails = self->devicesAroundUsDetails;
  self->devicesAroundUsDetails = v6;

  [v4 objectForKeyedSubscript:@"kCBMsgArgTCCLELocalizedCenterLabel"];
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  btGlobalTCCCenterLabel = self->btGlobalTCCCenterLabel;
  self->btGlobalTCCCenterLabel = v8;

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v10 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    LODWORD(v18) = 67109376;
    HIDWORD(v18) = +[CBManager tccAvailable](&OBJC_CLASS___CBManager, "tccAvailable");
    __int16 v19 = 1024;
    BOOL v20 = -[CBManager tccRequired](self, "tccRequired");
    _os_log_impl( &dword_186F9B000,  v11,  OS_LOG_TYPE_DEFAULT,  "Running performTccCheck CBManager tccAvail %d, tccRequired %d",  (uint8_t *)&v18,  0xEu);
  }

  if (-[CBManager tccComplete](self, "tccComplete"))
  {
    if (CBLogInitOnce == -1)
    {
      id v12 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        -[CBManager doneWithTCC](self, "doneWithTCC", v18);
        goto LABEL_27;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      id v12 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
    }

    LOWORD(v18) = 0;
    int64_t v13 = "TCC is already complete";
LABEL_14:
    _os_log_impl(&dword_186F9B000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 2u);
    goto LABEL_26;
  }

  if (!-[CBManager tccRequired](self, "tccRequired"))
  {
    if (CBLogInitOnce == -1)
    {
      id v16 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        -[CBManager setTccApproved:](self, "setTccApproved:", 1LL);
        goto LABEL_26;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      id v16 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
    }

    LOWORD(v18) = 0;
    _os_log_impl(&dword_186F9B000, v16, OS_LOG_TYPE_DEFAULT, "TCC not required", (uint8_t *)&v18, 2u);
    goto LABEL_25;
  }

  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    uint64_t v14 = (os_log_s *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  uint64_t v14 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_19:
    LOWORD(v18) = 0;
    _os_log_impl(&dword_186F9B000, v14, OS_LOG_TYPE_DEFAULT, "TCC required", (uint8_t *)&v18, 2u);
  }

- (BOOL)getCBPrivacySupported
{
  return dyld_program_sdk_at_least();
}

- (void)queryBluetoothStatus:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = (id)MEMORY[0x189604A60];
  }
  uint64_t v14 = @"kCBMsgArgOptions";
  v15[0] = v7;
  id v8 = (void *)MEMORY[0x189603F68];
  id v9 = a3;
  [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __45__CBManager_queryBluetoothStatus_completion___block_invoke;
  v12[3] = &unk_189FB1978;
  id v13 = v6;
  id v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 30LL, v10, v12);
}

void __45__CBManager_queryBluetoothStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_opt_new();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v13, (void)v15);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setObject:v14 forKeyedSubscript:v13];
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (CBManagerState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (BOOL)tccComplete
{
  return self->_tccComplete;
}

- (void)setTccComplete:(BOOL)a3
{
  self->_tccComplete = a3;
}

- (BOOL)tccApproved
{
  return self->_tccApproved;
}

- (void)setTccApproved:(BOOL)a3
{
  self->_tccApproved = a3;
}

- (BOOL)tccRequired
{
  return self->_tccRequired;
}

- (void)setTccRequired:(BOOL)a3
{
  self->_tccRequired = a3;
}

- (NSData)advertisingAddress
{
  return self->_advertisingAddress;
}

- (void)setAdvertisingAddress:(id)a3
{
}

- (int64_t)advertisingAddressType
{
  return self->_advertisingAddressType;
}

- (NSData)nonConnectableAdvertisingAddress
{
  return self->_nonConnectableAdvertisingAddress;
}

- (void)setNonConnectableAdvertisingAddress:(id)a3
{
}

- (int64_t)nonConnectableAdvertisingAddressType
{
  return self->_nonConnectableAdvertisingAddressType;
}

- (NSData)nonConnectableSecondaryAdvertisingAddress
{
  return self->_nonConnectableSecondaryAdvertisingAddress;
}

- (void)setNonConnectableSecondaryAdvertisingAddress:(id)a3
{
}

- (int64_t)nonConnectableSecondaryAdvertisingAddressType
{
  return self->_nonConnectableSecondaryAdvertisingAddressType;
}

- (NSString)localAddressString
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)localName
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void).cxx_destruct
{
}

- (void)extractLocalDeviceStatesDictionary:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1;
  +[CBManager authorization](&OBJC_CLASS___CBManager, "authorization");
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_186F9B000, v1, OS_LOG_TYPE_DEBUG, "Authorization state is %ld", v2, 0xCu);
}

- (void)sendMsg:args:.cold.1()
{
}

- (void)closeL2CAPChannelForPeerUUID:withPsm:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( &dword_186F9B000,  v1,  OS_LOG_TYPE_DEBUG,  "Close L2CAP channel for peerUUID %@ with psm :%u",  v2,  0x12u);
  OUTLINED_FUNCTION_1();
}

void __31__CBManager_createCnxWithInfo___block_invoke_43_cold_1()
{
}

void __31__CBManager_createCnxWithInfo___block_invoke_45_cold_1()
{
}

void __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke_cold_1()
{
}

+ (void)authorization
{
}

- (void)triggerBTErrorReport:.cold.1()
{
}

@end