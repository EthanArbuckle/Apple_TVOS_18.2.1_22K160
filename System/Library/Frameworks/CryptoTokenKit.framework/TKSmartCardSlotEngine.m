@interface TKSmartCardSlotEngine
+ (NSNumber)_testing_stateDelay;
+ (void)set_testing_stateDelay:(id)a3;
- (BOOL)_setupWithName:(id)a3 delegate:(id)a4;
- (BOOL)apduSentSinceLastReset;
- (BOOL)connectCardSessionWithParameters:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)reset;
- (BOOL)setProtocol:(unint64_t)a3;
- (BOOL)setupWithName:(id)a3 delegate:(id)a4;
- (NSString)name;
- (NSXPCListenerEndpoint)serverEndpoint;
- (OS_dispatch_queue)powerRequestsQueue;
- (OS_dispatch_queue)queue;
- (TKSlotParameters)slotParameters;
- (TKSmartCardSessionEngine)session;
- (TKSmartCardSlotEngine)initWithSlotParameters:(id)a3;
- (TKSmartCardSlotEngineDelegate)delegate;
- (double)powerDownIdleTimeout;
- (id)_findReservation:(id)a3 connection:(id)a4;
- (id)_getReservationId;
- (id)dictionaryForState:(int64_t)a3;
- (id)slotRegistryWithErrorHandler:(id)a3;
- (void)_changeStateTo:(id)a3 forClient:(id)a4;
- (void)cardPresent:(BOOL)a3;
- (void)changeStateTo:(int64_t)a3 powerState:(int64_t)a4;
- (void)dealloc;
- (void)getAttrib:(unsigned int)a3 reply:(id)a4;
- (void)leaveSession:(id)a3;
- (void)logWithBytes:(id)a3 handler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)powerDownWithEject:(BOOL)a3;
- (void)reserveProtocols:(id)a3 reservationId:(id)a4 exclusive:(BOOL)a5 reply:(id)a6;
- (void)reset;
- (void)runUserInteraction:(id)a3 reply:(id)a4;
- (void)scheduleIdlePowerDown;
- (void)sendControl:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6;
- (void)sessionWithParameters:(id)a3 reply:(id)a4;
- (void)setApduSentSinceLastReset:(BOOL)a3;
- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPowerDownIdleTimeout:(double)a3;
- (void)setPowerRequestsQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerEndpoint:(id)a3;
- (void)setSession:(id)a3;
- (void)setupSlotWithReply:(id)a3;
- (void)terminate;
- (void)waitForNextState:(int64_t)a3 reply:(id)a4;
- (void)waitForStateFlushedWithReply:(id)a3;
@end

@implementation TKSmartCardSlotEngine

+ (void)set_testing_stateDelay:(id)a3
{
}

+ (NSNumber)_testing_stateDelay
{
  return (NSNumber *)(id)_stateDelay;
}

- (TKSmartCardSlotEngine)initWithSlotParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKSmartCardSlotEngine;
  v6 = -[TKSmartCardSlotEngine init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lastId = 0LL;
    v6->_powerDownIdleTimeout = 5.0;
    objc_storeStrong((id *)&v6->_slotParameters, a3);
  }

  return v7;
}

- (void)logWithBytes:(id)a3 handler:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, OS_os_log *, uint64_t))a4;
  if (self->_log)
  {
    [MEMORY[0x189607940] string];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v13;
    uint64_t v9 = [v8 bytes];
    if ([v8 length])
    {
      unint64_t v10 = 0LL;
      do
        objc_msgSend(v7, "appendFormat:", @" %02x", *(unsigned __int8 *)(v9 + v10++));
      while (v10 < [v8 length]);
    }

    log = self->_log;
    id v12 = v7;
    v6[2](v6, log, [v12 UTF8String]);
  }
}

- (BOOL)setupWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  TK_LOG_token_0();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine setupWithName:delegate:].cold.1();
  }

  -[TKSlotParameters setDelegateWithEscapeMethod:]( self->_slotParameters,  "setDelegateWithEscapeMethod:",  objc_opt_respondsToSelector() & 1);
  -[TKSlotParameters setDelegateWithControlMethod:]( self->_slotParameters,  "setDelegateWithControlMethod:",  objc_opt_respondsToSelector() & 1);
  BOOL v9 = -[TKSmartCardSlotEngine _setupWithName:delegate:](self, "_setupWithName:delegate:", v6, v7);

  return v9;
}

- (id)slotRegistryWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_registrationConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  a3);
}

- (BOOL)_setupWithName:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [MEMORY[0x1896078A8] defaultManager];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectoryForUser(@"root");
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v9 fileExistsAtPath:v10 isDirectory:0];

  if ((v11 & 1) == 0)
  {
    TK_LOG_token_0();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186E58000,  v12,  OS_LOG_TYPE_INFO,  "Call 'setupWithName' was postponed, because root's home directory does not exist",  buf,  2u);
    }

    [MEMORY[0x1896078A8] defaultManager];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectoryForUser(@"root");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = [v13 fileExistsAtPath:v14 isDirectory:0];

    if ((v15 & 1) == 0)
    {
      do
      {
        sleep(1u);
        [MEMORY[0x1896078A8] defaultManager];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSHomeDirectoryForUser(@"root");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = [v16 fileExistsAtPath:v17 isDirectory:0];
      }

      while (!v18);
    }

    TK_LOG_token_0();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_186E58000, v19, OS_LOG_TYPE_INFO, "Method 'setupWithName' continues", buf, 2u);
    }
  }

  objc_storeWeak((id *)&self->_delegate, v8);
  objc_storeStrong((id *)&self->_name, a3);
  self->_previousState = 1LL;
  *(_OWORD *)&self->_state = xmmword_186E98AB0;
  [MEMORY[0x189603FA8] array];
  v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  sessionRequests = self->_sessionRequests;
  self->_sessionRequests = v20;

  [MEMORY[0x189607920] mapTableWithKeyOptions:5 valueOptions:0];
  v22 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  stateRequests = self->_stateRequests;
  self->_stateRequests = v22;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  qos_class_t v25 = qos_class_main();
  dispatch_queue_attr_make_with_qos_class(v24, v25, 0);
  v26 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

  id v27 = [NSString stringWithFormat:@"com.apple.scslot:%@", v7];
  v28 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v27 UTF8String], v26);
  queue = self->_queue;
  self->_queue = v28;

  id v30 = [NSString stringWithFormat:@"com.apple.scpwr:%@", v7];
  v31 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v30 UTF8String], v26);
  powerRequestsQueue = self->_powerRequestsQueue;
  self->_powerRequestsQueue = v31;

  [MEMORY[0x1896078B8] hashTableWithOptions:5];
  v33 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  clients = self->_clients;
  self->_clients = v33;

  [MEMORY[0x189607920] mapTableWithKeyOptions:5 valueOptions:0];
  v35 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  reservations = self->_reservations;
  self->_reservations = v35;

  +[TKPowerMonitor defaultMonitor](&OBJC_CLASS___TKPowerMonitor, "defaultMonitor");
  v37 = (TKPowerMonitor *)objc_claimAutoreleasedReturnValue();
  powerMonitor = self->_powerMonitor;
  self->_powerMonitor = v37;

  v39 = self->_powerMonitor;
  NSStringFromSelector(sel_awaken);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKPowerMonitor addObserver:forKeyPath:options:context:]( v39,  "addObserver:forKeyPath:options:context:",  self,  v40,  5LL,  0LL);

  [MEMORY[0x189607B50] anonymousListener];
  v41 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  self->_listener = v41;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", self->_queue);
  -[NSXPCListener resume](self->_listener, "resume");
  v43 = -[TKSmartCardSlotEngine serverEndpoint](self, "serverEndpoint");
  id v44 = objc_alloc(MEMORY[0x189607B30]);
  v45 = v44;
  if (v43)
  {
    v46 = -[TKSmartCardSlotEngine serverEndpoint](self, "serverEndpoint");
    v47 = (NSXPCConnection *)[v45 initWithListenerEndpoint:v46];
    registrationConnection = self->_registrationConnection;
    self->_registrationConnection = v47;
  }

  else
  {
    v49 = (NSXPCConnection *)[v44 initWithMachServiceName:@"com.apple.ctkd.slot-registry" options:4096];
    v46 = self->_registrationConnection;
    self->_registrationConnection = v49;
  }

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B7720];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_registrationConnection, "setRemoteObjectInterface:", v50);

  -[NSXPCConnection resume](self->_registrationConnection, "resume");
  *(void *)buf = 0LL;
  v62 = buf;
  uint64_t v63 = 0x2020000000LL;
  char v64 = 0;
  uint64_t v51 = MEMORY[0x1895F87A8];
  v58[0] = MEMORY[0x1895F87A8];
  v58[1] = 3221225472LL;
  v58[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke;
  v58[3] = &unk_189F8ABA8;
  id v52 = v7;
  id v59 = v52;
  v60 = self;
  v53 = -[TKSmartCardSlotEngine slotRegistryWithErrorHandler:](self, "slotRegistryWithErrorHandler:", v58);
  v54 = -[NSXPCListener endpoint](self->_listener, "endpoint");
  v57[0] = v51;
  v57[1] = 3221225472LL;
  v57[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118;
  v57[3] = &unk_189F8ABF8;
  v57[4] = self;
  v57[5] = buf;
  [v53 addSlotWithEndpoint:v54 name:v52 type:@"smartcard" reply:v57];

  uint8_t v55 = v62[24];
  _Block_object_dispose(buf, 8);

  return v55;
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_token_0();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_cold_1();
  }

  [*(id *)(a1 + 40) terminate];
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168LL), a2);
  TK_LOG_token_0();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118_cold_1();
  }

  os_log_t v6 = os_log_create("com.apple.CryptoTokenKit.APDU", "APDULog");
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 120);
  *(void *)(v7 + 120) = v6;

  BOOL v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121;
  v10[3] = &unk_189F8ABD0;
  v10[4] = v9;
  [v9 logWithBytes:0 handler:v10];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121(uint64_t a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121_cold_1(a1, oslog);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B2DA8];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B31F8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setInterface:v9 forSelector:sel_sessionWithParameters_reply_ argumentIndex:0 ofReply:1];

  [v7 setExportedInterface:v8];
  [v7 setExportedObject:self];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B0908];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setRemoteObjectInterface:v10];

  char v11 = self->_clients;
  objc_sync_enter(v11);
  -[NSHashTable addObject:](self->_clients, "addObject:", v7);
  objc_sync_exit(v11);

  [v7 _setQueue:self->_queue];
  TK_LOG_token_0();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine listener:shouldAcceptNewConnection:].cold.1();
  }

  [v7 resume];
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  id v9 = a3;
  NSStringFromSelector(sel_awaken);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    [v8 objectForKey:*MEMORY[0x1896075B8]];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      if (self->_listener)
      {
        TK_LOG_token_0();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[TKSmartCardSlotEngine observeValueForKeyPath:ofObject:change:context:].cold.1();
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          id v17 = objc_loadWeakRetained((id *)&self->_delegate);
          [v17 didWakeUpOnEngine:self];
LABEL_12:
        }
      }
    }

    else
    {
      TK_LOG_token_0();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[TKSmartCardSlotEngine observeValueForKeyPath:ofObject:change:context:].cold.2();
      }

      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      char v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 willSleepOnEngine:self];
        goto LABEL_12;
      }
    }
  }
}

- (id)dictionaryForState:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKey:@"state"];

  [MEMORY[0x189607968] numberWithInteger:self->_previousState];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v7 forKey:@"prevstate"];

  if (a3 == 4 || a3 == 2)
  {
    atr = self->_atr;
    if (atr)
    {
      -[TKSmartCardATR bytes](atr, "bytes");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v9 forKey:@"atr"];
    }

    -[NSMapTable objectEnumerator](self->_reservations, "objectEnumerator");
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 nextObject];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectEnumerator];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 nextObject];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      else {
        uint64_t v14 = 1LL;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    [MEMORY[0x189607968] numberWithInteger:v14];
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v15 forKey:@"share"];

    [MEMORY[0x189607968] numberWithInteger:self->_powerState];
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v16 forKey:@"power"];
  }

  return v5;
}

- (void)_changeStateTo:(id)a3 forClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v8 remoteObjectProxy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke;
  v12[3] = &unk_189F8AC20;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  [v9 notifyWithParameters:v10 reply:v12];
}

void __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 96LL);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:*(void *)(a1 + 40)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    if (![v3 activeStateNotifications])
    {
      if (![v4 activeStateNotifications])
      {
        [MEMORY[0x1896077D8] currentHandler];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"TKSmartCardSlotEngine.m" lineNumber:382 description:@"Mismatch in active state notifications count"];
      }

      TK_LOG_token_0();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke_cold_1();
      }
    }

    objc_msgSend(v4, "setActiveStateNotifications:", objc_msgSend(v4, "activeStateNotifications") - 1);
    [v4 replyNextState];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [v4 replyNextState];
      id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) objectForKeyedSubscript:@"state"];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, [v8 integerValue]);

      [v4 setReplyNextState:0];
    }

    [v4 replyFlushedState];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = [v4 activeStateNotifications];

      if (!v10)
      {
        [v4 replyFlushedState];
        id v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v11[2]();

        [v4 setReplyFlushedState:0];
      }
    }
  }

  objc_sync_exit(v2);
}

- (void)changeStateTo:(int64_t)a3 powerState:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  int64_t state = self->_state;
  self->_powerState = a4;
  self->_previousState = state;
  -[TKSmartCardSlotEngine dictionaryForState:](self, "dictionaryForState:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  TK_LOG_token_0();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine changeStateTo:powerState:].cold.1((uint64_t)self, v6, v7);
  }

  v22 = self->_clients;
  objc_sync_enter(v22);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  obj = self->_clients;
  uint64_t v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
        id v12 = self->_stateRequests;
        objc_sync_enter(v12);
        -[NSMapTable objectForKey:](self->_stateRequests, "objectForKey:", v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          id v13 = (void *)objc_opt_new();
          -[NSMapTable setObject:forKey:](self->_stateRequests, "setObject:forKey:", v13, v11);
        }

        objc_msgSend(v13, "setActiveStateNotifications:", objc_msgSend(v13, "activeStateNotifications") + 1);

        objc_sync_exit(v12);
        +[TKSmartCardSlotEngine _testing_stateDelay](&OBJC_CLASS___TKSmartCardSlotEngine, "_testing_stateDelay");
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v15 = v14 == 0LL;

        if (v15)
        {
          -[TKSmartCardSlotEngine _changeStateTo:forClient:](self, "_changeStateTo:forClient:", v6, v11);
        }

        else
        {
          +[TKSmartCardSlotEngine _testing_stateDelay](&OBJC_CLASS___TKSmartCardSlotEngine, "_testing_stateDelay");
          char v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 floatValue];
          dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(float)(v17 * 1000000000.0));
          powerRequestsQueue = self->_powerRequestsQueue;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __50__TKSmartCardSlotEngine_changeStateTo_powerState___block_invoke;
          block[3] = &unk_189F8A638;
          block[4] = self;
          id v25 = v6;
          uint64_t v26 = v11;
          dispatch_after(v18, (dispatch_queue_t)powerRequestsQueue, block);
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    }

    while (v8);
  }

  objc_sync_exit(v22);
  char v20 = self->_stateRequests;
  objc_sync_enter(v20);
  self->_int64_t state = a3;
  objc_sync_exit(v20);
}

uint64_t __50__TKSmartCardSlotEngine_changeStateTo_powerState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeStateTo:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
}

- (void)waitForNextState:(int64_t)a3 reply:(id)a4
{
  uint64_t v10 = (void (**)(void))a4;
  id v6 = self->_stateRequests;
  objc_sync_enter(v6);
  if (self->_state == a3)
  {
    [MEMORY[0x189607B30] currentConnection];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_stateRequests, "objectForKey:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      uint64_t v9 = (void *)objc_opt_new();

      -[NSMapTable setObject:forKey:](self->_stateRequests, "setObject:forKey:", v9, v7);
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    [v9 setStateWhenRequested:a3];
    [v9 setReplyNextState:v10];
  }

  else
  {
    v10[2]();
  }

  objc_sync_exit(v6);
}

- (void)waitForStateFlushedWithReply:(id)a3
{
  uint64_t v8 = (void (**)(void))a3;
  id v4 = self->_stateRequests;
  objc_sync_enter(v4);
  [MEMORY[0x189607B30] currentConnection];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_stateRequests, "objectForKey:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6 && [v6 activeStateNotifications]) {
    [v7 setReplyFlushedState:v8];
  }
  else {
    v8[2]();
  }

  objc_sync_exit(v4);
}

- (BOOL)reset
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    TK_LOG_token_0();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine reset].cold.2();
    }

    -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 2LL, 0LL);
    [WeakRetained engineResetCard:self];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    TK_LOG_token_0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine reset].cold.1();
    }

    if (self->_state == 2)
    {
      objc_storeStrong((id *)&self->_atr, v5);
      if (v5)
      {
        [v5 bytes];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", v7, &__block_literal_global_178);

        BOOL v8 = 1;
        -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 4LL, 1LL);
        self->_apduSentSinceLastReset = 0;
        self->_protocol = 0LL;
LABEL_14:

        goto LABEL_15;
      }

      -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0LL, &__block_literal_global_180);
      TK_LOG_token_0();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        int v12 = 138543362;
        id v13 = name;
        _os_log_impl( &dword_186E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: failed to reset the card",  (uint8_t *)&v12,  0xCu);
      }

      -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 3LL, 0LL);
    }

    BOOL v8 = 0;
    goto LABEL_14;
  }

  BOOL v8 = 0;
LABEL_15:

  return v8;
}

void __30__TKSmartCardSlotEngine_reset__block_invoke(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __30__TKSmartCardSlotEngine_reset__block_invoke_cold_1();
  }
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_179(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __30__TKSmartCardSlotEngine_reset__block_invoke_179_cold_1();
  }
}

- (BOOL)setProtocol:(unint64_t)a3
{
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine setProtocol:].cold.3();
  }

  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      unint64_t v8 = [v7 engine:self setProtocol:a3];

      if (self->_state == 4)
      {
        TK_LOG_token_0();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[TKSmartCardSlotEngine setProtocol:].cold.2();
        }

        self->_protocol = v8;
        if (v8)
        {
          v13[0] = MEMORY[0x1895F87A8];
          v13[1] = 3221225472LL;
          v13[2] = __37__TKSmartCardSlotEngine_setProtocol___block_invoke;
          v13[3] = &__block_descriptor_40_e33_v24__0__NSObject_OS_os_log__8r_16l;
          v13[4] = v8;
          -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0LL, v13);
          -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", 4LL, 2LL);
          BOOL v10 = 1;
LABEL_15:

          return v10;
        }

        -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0LL, &__block_literal_global_183);
        TK_LOG_token_0();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[TKSmartCardSlotEngine setProtocol:].cold.1();
        }
      }
    }

    BOOL v10 = 0;
    goto LABEL_15;
  }

  return 1;
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke(uint64_t a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_setProtocol___block_invoke_cold_1(a1, oslog);
  }
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_182(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_setProtocol___block_invoke_182_cold_1();
  }
}

- (void)powerDownWithEject:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    TK_LOG_token_0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine powerDownWithEject:].cold.2();
    }

    char v7 = [WeakRetained engine:self powerDownWithEject:v3];
    TK_LOG_token_0();
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine powerDownWithEject:].cold.1();
    }

    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke;
    v9[3] = &__block_descriptor_33_e33_v24__0__NSObject_OS_os_log__8r_16l;
    char v10 = v7;
    -[TKSmartCardSlotEngine logWithBytes:handler:](self, "logWithBytes:handler:", 0LL, v9);
    -[TKSmartCardSlotEngine changeStateTo:powerState:](self, "changeStateTo:powerState:", self->_state, 0LL);
  }
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)a1)
  {
    if (v4) {
      __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_2();
    }
  }

  else if (v4)
  {
    __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_1();
  }
}

- (void)scheduleIdlePowerDown
{
  if (!-[NSMapTable count](self->_reservations, "count"))
  {
    -[TKSmartCardSlotEngine powerDownIdleTimeout](self, "powerDownIdleTimeout");
    if (v3 > 0.0)
    {
      BOOL v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_queue);
      idlePowerDownSource = self->_idlePowerDownSource;
      self->_idlePowerDownSource = v4;

      -[TKSmartCardSlotEngine powerDownIdleTimeout](self, "powerDownIdleTimeout");
      uint64_t v7 = (uint64_t)(v6 * 1000000000.0);
      unint64_t v8 = self->_idlePowerDownSource;
      dispatch_time_t v9 = dispatch_time(0LL, v7);
      dispatch_source_set_timer((dispatch_source_t)v8, v9, v7, v7);
      char v10 = self->_idlePowerDownSource;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke;
      handler[3] = &unk_189F8A290;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
      dispatch_resume((dispatch_object_t)self->_idlePowerDownSource);
    }
  }

void __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_cold_1();
  }

  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56LL));
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0LL;

  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(dispatch_queue_s **)(v5 + 184);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_185;
  block[3] = &unk_189F8A290;
  block[4] = v5;
  dispatch_sync(v6, block);
}

uint64_t __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_185(uint64_t a1)
{
  return [*(id *)(a1 + 32) powerDownWithEject:0];
}

- (void)cardPresent:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke;
  v4[3] = &unk_189F8AD48;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)queue, v4);
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v2 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 56LL);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0LL;
  }

  int v5 = *(unsigned __int8 *)(a1 + 40);
  TK_LOG_token_0();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 168LL);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v8;
      _os_log_impl(&dword_186E58000, v6, OS_LOG_TYPE_INFO, "%{public}@: card inserted", buf, 0xCu);
    }

    [*(id *)(a1 + 32) logWithBytes:0 handler:&__block_literal_global_187];
    uint64_t v9 = *(void *)(a1 + 32);
    char v10 = *(dispatch_queue_s **)(v9 + 184);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke_188;
    block[3] = &unk_189F8A290;
    block[4] = v9;
    dispatch_async(v10, block);
  }

  else
  {
    if (v7)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 168LL);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v11;
      _os_log_impl(&dword_186E58000, v6, OS_LOG_TYPE_INFO, "%{public}@: card removed", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0LL;

    [*(id *)(a1 + 32) logWithBytes:0 handler:&__block_literal_global_190];
    [*(id *)(a1 + 32) changeStateTo:1 powerState:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192LL));
    [WeakRetained setValid:0];

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v15 = *(id *)(*(void *)(a1 + 32) + 88LL);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v19), "reply", (void)v22);
          char v20 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void, void, void *))v20)[2](v20, 0LL, 0LL, v21);

          ++v19;
        }

        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v17);
    }

    [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  }

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_186(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_cardPresent___block_invoke_186_cold_1();
  }
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_188(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reset])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(dispatch_queue_s **)(v2 + 176);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke_2;
    block[3] = &unk_189F8A290;
    block[4] = v2;
    dispatch_async(v3, block);
  }

uint64_t __37__TKSmartCardSlotEngine_cardPresent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleIdlePowerDown];
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_189(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_cardPresent___block_invoke_189_cold_1();
  }
}

- (void)setupSlotWithReply:(id)a3
{
  int64_t state = self->_state;
  int v5 = (void (**)(id, void *))a3;
  -[TKSmartCardSlotEngine dictionaryForState:](self, "dictionaryForState:", state);
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:self->_name forKey:@"name"];
  -[TKSmartCardSlotEngine slotParameters](self, "slotParameters");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 getDictionaryParameters];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v8 forKey:@"params"];

  TK_LOG_token_0();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine setupSlotWithReply:].cold.1();
  }

  v5[2](v5, v6);
}

- (BOOL)connectCardSessionWithParameters:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"sensitive"];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"protocol"];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 0xFFFFLL;
  }
  TK_LOG_token_0();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = name;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v5;
    _os_log_debug_impl( &dword_186E58000,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}@: connectCardSession:proto=%04x, sensitive=%@",  buf,  0x1Cu);
  }

  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1895F87A8];
  powerRequestsQueue = self->_powerRequestsQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke;
  block[3] = &unk_189F8A290;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)powerRequestsQueue, block);
  TK_LOG_token_0();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine connectCardSessionWithParameters:].cold.2();
  }

  if (!self->_powerState || [v5 BOOLValue] && self->_apduSentSinceLastReset)
  {
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
LABEL_12:
    id v13 = self->_powerRequestsQueue;
    v24[0] = v10;
    v24[1] = 3221225472LL;
    v24[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192;
    v24[3] = &unk_189F8AD70;
    v24[4] = self;
    v24[5] = buf;
    v25[1] = (id)v8;
    objc_copyWeak(v25, &location);
    dispatch_sync((dispatch_queue_t)v13, v24);
    objc_destroyWeak(v25);
    goto LABEL_19;
  }

  if (self->_powerState != 2)
  {
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    uint64_t v18 = self->_powerRequestsQueue;
    v22[0] = v10;
    v22[1] = 3221225472LL;
    v22[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193;
    v22[3] = &unk_189F8AD98;
    v22[4] = self;
    v22[5] = buf;
    v23[1] = (id)v8;
    objc_copyWeak(v23, &location);
    dispatch_sync((dispatch_queue_t)v18, v22);
    objc_destroyWeak(v23);
    goto LABEL_19;
  }

  unint64_t protocol = self->_protocol;
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  if ((protocol & ~v8) != 0) {
    goto LABEL_12;
  }
  TK_LOG_token_0();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = objc_loadWeakRetained(&location);
    [v16 name];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardSlotEngine connectCardSessionWithParameters:].cold.1(v17, (uint64_t)v28, v15, v16);
  }

  *(_BYTE *)(*(void *)&buf[8] + 24LL) = 1;
LABEL_19:
  BOOL v19 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v19;
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 56LL);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0LL;
  }

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reset])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) setProtocol:*(void *)(a1 + 56)];
    TK_LOG_token_0();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_1(a1, v2);
    }
  }

  else
  {
    TK_LOG_token_0();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_2(a1, v3);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) setProtocol:*(void *)(a1 + 56)];
  TK_LOG_token_0();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193_cold_1(a1, v2);
  }
}

- (void)leaveSession:(id)a3
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int v5 = v4;
  if (!v4)
  {
    int v8 = 0;
    goto LABEL_18;
  }

  uint64_t v6 = [v4 endPolicy];
  if ((unint64_t)(v6 - 2) < 2)
  {
    TK_LOG_token_0();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine leaveSession:].cold.3();
    }

    BOOL v10 = [v5 endPolicy] == 3;
    powerRequestsQueue = self->_powerRequestsQueue;
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __38__TKSmartCardSlotEngine_leaveSession___block_invoke_194;
    v30[3] = &unk_189F8AD48;
    v30[4] = self;
    BOOL v31 = v10;
    dispatch_sync((dispatch_queue_t)powerRequestsQueue, v30);
  }

  else
  {
    if (v6 == 1)
    {
      TK_LOG_token_0();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[TKSmartCardSlotEngine leaveSession:].cold.2();
      }

      id v13 = self->_powerRequestsQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __38__TKSmartCardSlotEngine_leaveSession___block_invoke;
      block[3] = &unk_189F8A290;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)v13, block);
      goto LABEL_16;
    }

    if (!v6)
    {
      TK_LOG_token_0();
      BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[TKSmartCardSlotEngine leaveSession:].cold.1();
      }

LABEL_16:
      int v8 = 1;
      goto LABEL_17;
    }
  }

  int v8 = 0;
LABEL_17:
  [v5 setActive:0];
LABEL_18:
  objc_storeWeak((id *)&self->_session, 0LL);
  if (-[NSMutableArray count](self->_sessionRequests, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sessionRequests, "objectAtIndexedSubscript:", 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_sessionRequests, "removeObjectAtIndex:", 0LL);
    id v15 = objc_alloc(&OBJC_CLASS___TKSmartCardSessionEngine);
    [v14 connection];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = -[TKSmartCardSessionEngine initWithSlot:connection:](v15, "initWithSlot:connection:", self, v16);

    objc_storeWeak((id *)&self->_session, v17);
    [v14 parameters];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 objectForKeyedSubscript:@"endpolicy"];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19) {
      uint64_t v20 = [v19 unsignedIntegerValue];
    }
    else {
      uint64_t v20 = 0LL;
    }
    -[TKSmartCardSessionEngine setEndPolicy:](v17, "setEndPolicy:", v20);
    [v14 parameters];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v22 = -[TKSmartCardSlotEngine connectCardSessionWithParameters:](self, "connectCardSessionWithParameters:", v21);

    if (v22)
    {
      -[TKSmartCardSessionEngine setActive:](v17, "setActive:", 1LL);
      [v14 reply];
      __int128 v23 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v33 = @"protocol";
      [MEMORY[0x189607968] numberWithUnsignedInteger:self->_protocol];
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v24;
      [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, TKSmartCardSessionEngine *, void *, void))v23)[2](v23, v17, v25, 0LL);

      if (-[NSMutableArray count](self->_sessionRequests, "count"))
      {
        -[TKSmartCardSessionEngine connection](v17, "connection");
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 remoteObjectProxy];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();

        [v27 cardSessionRequested];
      }
    }

    else
    {
      [v14 reply];
      __int128 v28 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, void, void *))v28)[2](v28, 0LL, 0LL, v29);

      -[TKSmartCardSlotEngine leaveSession:](self, "leaveSession:", 0LL);
    }
  }

  else if (v8 && self->_atr)
  {
    -[TKSmartCardSlotEngine scheduleIdlePowerDown](self, "scheduleIdlePowerDown");
  }
}

uint64_t __38__TKSmartCardSlotEngine_leaveSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __38__TKSmartCardSlotEngine_leaveSession___block_invoke_194(uint64_t a1)
{
  return [*(id *)(a1 + 32) powerDownWithEject:*(unsigned __int8 *)(a1 + 40)];
}

- (void)sessionWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___TKSmartCardSessionRequest);
  -[TKSmartCardSessionRequest setParameters:](v13, "setParameters:", v7);

  -[TKSmartCardSessionRequest setReply:](v13, "setReply:", v6);
  [MEMORY[0x189607B30] currentConnection];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSessionRequest setConnection:](v13, "setConnection:", v8);

  -[NSMutableArray addObject:](self->_sessionRequests, "addObject:", v13);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  BOOL v10 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained connection];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 remoteObjectProxy];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v12 cardSessionRequested];
  }

  else
  {
    -[TKSmartCardSlotEngine leaveSession:](self, "leaveSession:", 0LL);
  }
}

- (id)_findReservation:(id)a3 connection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = v7;
    -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKey:v6];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v11 = self->_reservations;
    uint64_t v12 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v12)
    {
      uint64_t v13 = v12;
      id v8 = 0LL;
      uint64_t v14 = *(void *)v20;
LABEL_5:
      uint64_t v15 = 0LL;
      id v16 = v8;
      while (1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v8 = *(id *)(*((void *)&v19 + 1) + 8 * v15);

        -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v8, (void)v19);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 objectForKey:v6];
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10) {
          break;
        }
        ++v15;
        id v16 = v8;
        if (v13 == v15)
        {
          uint64_t v13 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
          if (v13) {
            goto LABEL_5;
          }

          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:
      id v8 = 0LL;
      BOOL v10 = 0LL;
    }
  }

  return v10;
}

- (id)_getReservationId
{
  do
  {
    uint64_t v3 = (void *)MEMORY[0x189607968];
    ++self->_lastId;
    objc_msgSend(v3, "numberWithUnsignedInteger:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardSlotEngine _findReservation:connection:](self, "_findReservation:connection:", v4, 0LL);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  while (v5);
  return (id)[MEMORY[0x189607968] numberWithUnsignedInteger:self->_lastId];
}

- (void)reserveProtocols:(id)a3 reservationId:(id)a4 exclusive:(BOOL)a5 reply:(id)a6
{
  BOOL v26 = a5;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v29 = a3;
  id v33 = a4;
  id v28 = a6;
  [MEMORY[0x189607B30] currentConnection];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[TKSmartCardSlotEngine _findReservation:connection:](self, "_findReservation:connection:", v33, v27);
    uint64_t v30 = (_TKSmartCardSlotReservation *)objc_claimAutoreleasedReturnValue();
    id v8 = v30;
    if (!v30)
    {
      (*((void (**)(id, void, void, uint64_t))v28 + 2))(v28, 0LL, 0LL, 3LL);
      uint64_t v30 = 0LL;
      goto LABEL_38;
    }

    if (!v29)
    {
      -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v27);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 removeObjectForKey:v33];
      if (![v9 count]) {
        -[NSMapTable removeObjectForKey:](self->_reservations, "removeObjectForKey:", v27);
      }

      (*((void (**)(id, void, void, void))v28 + 2))(v28, 0LL, 0LL, 0LL);
      goto LABEL_37;
    }
  }

  else
  {
    if (!v29)
    {
      (*((void (**)(id, void, void, void))v28 + 2))(v28, 0LL, 0LL, 0LL);
      uint64_t v30 = 0LL;
      id v33 = 0LL;
      goto LABEL_38;
    }

    id v8 = 0LL;
  }

  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x2020000000LL;
  char v55 = 0;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  uint64_t v47 = 0xFFFFLL;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  obj = self->_reservations;
  uint64_t v10 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v56,  16LL);
  uint64_t v30 = v8;
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    uint64_t v12 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", *(void *)(*((void *)&v40 + 1) + 8 * i));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v12;
        v35[1] = 3221225472LL;
        v35[2] = __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke;
        v35[3] = &unk_189F8ADC0;
        id v36 = v33;
        v37 = &v44;
        v38 = &v48;
        v39 = &v52;
        [v14 enumerateKeysAndObjectsUsingBlock:v35];
      }

      uint64_t v10 = -[NSMapTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v56,  16LL);
    }

    while (v10);
  }

  if (!v26)
  {
    if (!*((_BYTE *)v49 + 24))
    {
      uint64_t v17 = v45[3];
      if (([v29 unsignedIntegerValue] & v17) != 0) {
        goto LABEL_25;
      }
      if (!*((_BYTE *)v49 + 24))
      {
        uint64_t v25 = v45[3];
        if (([v29 unsignedIntegerValue] & v25) != 0) {
          uint64_t v15 = 3LL;
        }
        else {
          uint64_t v15 = 1LL;
        }
        goto LABEL_21;
      }
    }

void __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  if (a1[4] != a2)
  {
    id v4 = a3;
    [v4 protocols];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(*(void *)(a1[5] + 8) + 24) &= [v5 unsignedIntegerValue];

    LOBYTE(v5) = [v4 exclusive];
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = (_BYTE)v5;
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
  }

uint64_t __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) changeStateTo:*(void *)(*(void *)(a1 + 32) + 16) powerState:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (void)sendControl:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v16 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 engine:self control:v16 data:v10 expectedLength:v7];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  v11[2](v11, v15);
}

- (void)getAttrib:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void (**)(id, void *, uint64_t))a4;
  uint64_t v7 = 600LL;
  uint64_t v12 = 600LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 engine:self getAttrib:v4 error:&v12];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v7 = v12;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  v6[2](v6, v11, v7);
}

- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  char v9 = (void (**)(id, uint64_t, BOOL))a5;
  BOOL v10 = 1LL;
  char v15 = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v14 = [v13 engine:self setAttrib:v6 data:v8 attribNotSupported:&v15];

    BOOL v10 = v15 != 0;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  v9[2](v9, v14, v10);
}

- (void)runUserInteraction:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    id v13 = 0LL;
    [v10 engine:self runUserInteraction:v6 error:&v13];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v13;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0LL;
  }

  v7[2](v7, v11, v12);
}

- (void)terminate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__TKSmartCardSlotEngine_terminate__block_invoke;
  block[3] = &unk_189F8A290;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

uint64_t __34__TKSmartCardSlotEngine_terminate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  TK_LOG_token_0();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__TKSmartCardSlotEngine_terminate__block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7++), "invalidate", (void)v12);
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 80);
  *(void *)(v8 + 80) = 0LL;

  id v10 = *(dispatch_source_t **)(a1 + 32);
  if (v10[7])
  {
    dispatch_source_cancel(v10[7]);
    id v10 = *(dispatch_source_t **)(a1 + 32);
  }

  return -[dispatch_source_t logWithBytes:handler:]( v10,  "logWithBytes:handler:",  0LL,  &__block_literal_global_207,  (void)v12);
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_206(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __34__TKSmartCardSlotEngine_terminate__block_invoke_206_cold_1();
  }
}

- (void)dealloc
{
}

- (double)powerDownIdleTimeout
{
  return self->_powerDownIdleTimeout;
}

- (void)setPowerDownIdleTimeout:(double)a3
{
  self->_powerDownIdleTimeout = a3;
}

- (TKSlotParameters)slotParameters
{
  return (TKSlotParameters *)objc_getProperty(self, a2, 144LL, 1);
}

- (NSXPCListenerEndpoint)serverEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setServerEndpoint:(id)a3
{
}

- (TKSmartCardSlotEngineDelegate)delegate
{
  return (TKSmartCardSlotEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)powerRequestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setPowerRequestsQueue:(id)a3
{
}

- (BOOL)apduSentSinceLastReset
{
  return self->_apduSentSinceLastReset;
}

- (void)setApduSentSinceLastReset:(BOOL)a3
{
  self->_apduSentSinceLastReset = a3;
}

- (TKSmartCardSessionEngine)session
{
  return (TKSmartCardSessionEngine *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setupWithName:delegate:.cold.1()
{
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_16_0();
  _os_log_error_impl( &dword_186E58000,  v0,  OS_LOG_TYPE_ERROR,  "%{public}@: failed to register, error:%{public}@",  v1,  0x16u);
  OUTLINED_FUNCTION_4();
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_118_cold_1()
{
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_121_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168LL);
  uint64_t v3 = a2;
  [v2 UTF8String];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, v3, v4, "logging slot %{public}s", v5);

  OUTLINED_FUNCTION_12_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
}

void __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke_cold_1()
{
}

- (void)changeStateTo:(os_log_s *)a3 powerState:.cold.1(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 168);
  [a2 description];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_189F8C1A8];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = 138543618;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  OUTLINED_FUNCTION_6(&dword_186E58000, a3, v7, "%{public}@: broadcasting state change %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)reset
{
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_cold_1()
{
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_179_cold_1()
{
}

- (void)setProtocol:.cold.1()
{
}

- (void)setProtocol:.cold.2()
{
}

- (void)setProtocol:.cold.3()
{
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a1 + 32) - 1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_186E58000, a2, OS_LOG_TYPE_DEBUG, "T=%d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_8();
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_182_cold_1()
{
}

- (void)powerDownWithEject:.cold.1()
{
}

- (void)powerDownWithEject:.cold.2()
{
  OUTLINED_FUNCTION_5_0(&dword_186E58000, v0, v1, "%{public}@: unpowerCard(eject=%d)");
  OUTLINED_FUNCTION_4();
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_1()
{
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_2()
{
}

void __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_cold_1()
{
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_186_cold_1()
{
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_189_cold_1()
{
}

- (void)setupSlotWithReply:.cold.1()
{
}

- (void)connectCardSessionWithParameters:(os_log_s *)a3 .cold.1( void *a1,  uint64_t a2,  os_log_s *a3,  void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1( &dword_186E58000,  a3,  (uint64_t)a3,  "%{public}@: connectCardSession already in nego state",  (uint8_t *)a2);
}

- (void)connectCardSessionWithParameters:.cold.2()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[6];
  int v6 = 138544130;
  uint64_t v7 = v4;
  __int16 v8 = 1024;
  int v9 = v1;
  __int16 v10 = 1024;
  int v11 = v2;
  __int16 v12 = 1024;
  int v13 = v3;
  _os_log_debug_impl( &dword_186E58000,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}@: connect:_state=%d,_power=%d,_proto=%d",  (uint8_t *)&v6,  0x1Eu);
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_1( uint64_t a1,  os_log_s *a2)
{
  id v3 = OUTLINED_FUNCTION_13_0(a1);
  [v3 name];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, a2, v5, "%{public}@: connectCardSession did RESET & PPS", v6);

  OUTLINED_FUNCTION_2();
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_192_cold_2( uint64_t a1,  os_log_s *a2)
{
  id v3 = OUTLINED_FUNCTION_13_0(a1);
  [v3 name];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, a2, v5, "%{public}@: connectCardSession RESET failed", v6);

  OUTLINED_FUNCTION_2();
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_193_cold_1( uint64_t a1,  os_log_s *a2)
{
  id v3 = OUTLINED_FUNCTION_13_0(a1);
  [v3 name];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, a2, v5, "%{public}@: connectCardSession did only PPS", v6);

  OUTLINED_FUNCTION_2();
}

- (void)leaveSession:.cold.1()
{
}

- (void)leaveSession:.cold.2()
{
}

- (void)leaveSession:.cold.3()
{
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_cold_1()
{
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_206_cold_1()
{
}

@end