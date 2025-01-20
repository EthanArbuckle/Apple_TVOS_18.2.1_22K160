@interface PCCBridgeEndpoint
+ (BOOL)isSupportedRemoteDeviceType:(unsigned int)a3;
+ (id)UDIDForRemoteDevice:(id)a3;
+ (id)identifierForRemoteDevice:(id)a3;
+ (id)remoteDeviceForIdentifier:(id)a3;
+ (void)addSenderToMessage:(id)a3;
- (BOOL)isDeviceNearby:(id)a3;
- (PCCBridgeEndpoint)init;
- (id)connectionForIdentifier:(id)a3;
- (id)deviceIds;
- (id)identifierForTarget:(id)a3;
- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)send:(id)a3 message:(id)a4 error:(id *)a5;
- (id)synchronize:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)enterInterruptedStateFrom:(id)a3;
- (void)exitInterruptedStateFrom:(id)a3;
- (void)init;
- (void)runWithDelegate:(id)a3;
- (void)setupDeviceStateChangeHandler;
- (void)setupIncomingEventListener;
- (void)setupOutgoingConnection:(id)a3;
- (void)stashCrashReporterKeyForIdentifier:(id)a3;
@end

@implementation PCCBridgeEndpoint

- (PCCBridgeEndpoint)init
{
  v2 = self;
  if (MEMORY[0x189611E98]) {
    BOOL v3 = MEMORY[0x189611EA8] == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    || MEMORY[0x189611ED8] == 0LL
    || MEMORY[0x189611F00] == 0LL
    || MEMORY[0x189611F20] == 0LL
    || MEMORY[0x189611F38] == 0LL
    || MEMORY[0x189611F58] == 0LL
    || MEMORY[0x189611F60] == 0LL
    || MEMORY[0x189611F78] == 0LL
    || MEMORY[0x189611F88] == 0LL
    || MEMORY[0x189611F90] == 0LL
    || MEMORY[0x189612010] == 0LL
    || MEMORY[0x189612018] == 0LL
    || MEMORY[0x189612038] == 0LL
    || MEMORY[0x189612050] == 0LL
    || MEMORY[0x189612080] == 0LL
    || MEMORY[0x189612090] == 0LL
    || MEMORY[0x1896120A0] == 0LL)
  {
    BOOL v20 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v20) {
      -[PCCBridgeEndpoint init].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_62;
  }

  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___PCCBridgeEndpoint;
  v28 = -[PCCBridgeEndpoint init]( &v50,  sel_init,  MEMORY[0x189611F38],  MEMORY[0x189611F20],  MEMORY[0x189611F00],  MEMORY[0x189611ED8]);
  v2 = v28;
  if (v28)
  {
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.osanalytics.endpoint.remoteXPC.initialization", 0LL);
    initializationQueue = v2->_initializationQueue;
    v2->_initializationQueue = (OS_dispatch_queue *)v29;

    dispatch_queue_t v31 = dispatch_queue_create("com.apple.osanalytics.endpoint.remoteXPC.events", 0LL);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v31;

    uint64_t v33 = [MEMORY[0x189603FC8] dictionary];
    remoteDevices = v2->_remoteDevices;
    v2->_remoteDevices = (NSMutableDictionary *)v33;

    uint64_t v35 = [MEMORY[0x189603FC8] dictionary];
    remoteCRKeys = v2->_remoteCRKeys;
    v2->_remoteCRKeys = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x189603FC8] dictionary];
    outgoingConnections = v2->_outgoingConnections;
    v2->_outgoingConnections = (NSMutableDictionary *)v37;

    uint64_t v39 = [MEMORY[0x189603FE0] set];
    interruptedDevices = v2->_interruptedDevices;
    v2->_interruptedDevices = (NSMutableSet *)v39;
  }

  if ((OSAIsRSDHost() & 1) == 0 && (OSAIsRSDDevice() & 1) == 0)
  {
    BOOL v41 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v41) {
      -[PCCBridgeEndpoint init].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_62:

    return 0LL;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v3 = self->_outgoingConnections;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v20,  16LL);
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v12 = v5;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          uint64_t v19 = v10;
          _os_log_impl(&dword_187E6F000, v8, OS_LOG_TYPE_DEFAULT, "canceling remote connection with %@", buf, 0xCu);
        }
        v11 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_outgoingConnections,  "objectForKeyedSubscript:",  v10,  v12);
        xpc_remote_connection_cancel();

        ++v9;
      }

      while (v6 != v9);
      uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v20,  16LL);
    }

    while (v6);
  }

  if (self->_listeningConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "canceling listening connection",  buf,  2u);
    }

    xpc_remote_connection_cancel();
  }

  if (self->_device_browser) {
    remote_device_browser_cancel();
  }
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PCCBridgeEndpoint;
  -[PCCBridgeEndpoint dealloc](&v13, sel_dealloc);
}

- (void)runWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PCCBridgeEndpoint;
  -[PCCEndpoint runWithDelegate:](&v4, sel_runWithDelegate_, a3);
  -[PCCBridgeEndpoint setupDeviceStateChangeHandler](self, "setupDeviceStateChangeHandler");
  -[PCCBridgeEndpoint setupIncomingEventListener](self, "setupIncomingEventListener");
}

- (void)setupIncomingEventListener
{
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (id)MEMORY[0x1895F91A0];
  BOOL v5 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v7;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "incoming connection from %s is DOWN",  buf,  0xCu);
    }
  }

  else
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v6;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "incoming connection from %s is UP",  buf,  0xCu);
    }

    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
  }
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1895B88F0]();
  if (v4 != MEMORY[0x1895F9268])
  {
    if (v4 != MEMORY[0x1895F9250])
    {
LABEL_32:
      uint64_t v25 = (void *)MEMORY[0x1895B8860](v3);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_1();
      }
      if (v25) {
        free(v25);
      }
      goto LABEL_36;
    }

    uint64_t v7 = (void *)MEMORY[0x1895B84F4]();
    xpc2ns();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"kOSASender"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    id v35 = 0LL;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)dispatch_queue_t v31 = 0;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Registering new sender from incoming message.",  v31,  2u);
      }

      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 56LL);
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_15;
      v28[3] = &unk_18A161260;
      id v29 = v9;
      v30 = buf;
      [v10 enumerateKeysAndObjectsUsingBlock:v28];
      if (!*(void *)(*(void *)&buf[8] + 40LL)
        || (objc_msgSend(*(id *)(a1 + 32), "exitInterruptedStateFrom:"), !*(void *)(*(void *)&buf[8] + 40))
        || (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKeyedSubscript:"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            BOOL v12 = v11 == 0LL,
            v11,
            v12))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)dispatch_queue_t v31 = 0;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "UNEXPECTED: incoming msg BEFORE outgoing connection established! *** consider deferring listener initialization ***",  v31,  2u);
        }
      }
    }

    [v8 objectForKeyedSubscript:@"messageType"];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 isEqualToString:@"<file>"])
    {
      NSTemporaryDirectory();
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 stringByAppendingPathComponent:@"bridge-xfer.XXXXXX"];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_object_t reply = v15;
      __int128 v17 = (const char *)[reply fileSystemRepresentation];
      size_t v18 = strlen(v17);
      uint64_t v19 = (char *)malloc(v18 + 1);
      BOOL v20 = strcpy(v19, v17);
      if (mkstemp(v20) < 0)
      {
        free(v19);
      }

      else
      {
        xpc_dictionary_get_value(v3, "<file_xfer>");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        id v26 = v8;
        id v27 = v3;
        xpc_file_transfer_write_to_fd();
      }

      goto LABEL_29;
    }

    if ([v13 isEqualToString:@"kOSAFetchCrashReporterKey"])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)dispatch_queue_t v31 = 0;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Handling request to fetch crash reporter key",  v31,  2u);
      }

      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      if (!reply)
      {
        uint64_t v24 = "failed to create reply message to fetch crash reporter key";
        goto LABEL_30;
      }

      [MEMORY[0x189611B08] sharedInstance];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = [v22 crashReporterKey];
      xpc_dictionary_set_string(reply, "crashReporterKey", (const char *)[v23 UTF8String]);

      xpc_dictionary_send_reply();
LABEL_29:
      uint64_t v24 = 0LL;
LABEL_30:

      goto LABEL_31;
    }

    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_2();
      }
      if (*(void *)(*(void *)&buf[8] + 40LL))
      {
        xpc_object_t reply = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
        [reply handleMessage:v8 from:*(void *)(*(void *)&buf[8] + 40)];
        goto LABEL_29;
      }

      uint64_t v24 = "received message with missing/unknown sender";
    }

    else
    {
      uint64_t v24 = "received unknown dictionary";
    }

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_15( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24(uint64_t a1, int a2)
{
  if (!a2)
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:*(void *)(a1 + 64) isDirectory:0 relativeToURL:0];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) objectForKeyedSubscript:@"fileMetadata"];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_2(v3);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
      [WeakRetained handleFile:v3 from:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) metadata:v4];

      goto LABEL_12;
    }

    uint64_t v6 = (void *)MEMORY[0x1895B8860](*(void *)(a1 + 48));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
    {
      __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_1((uint64_t)v4);
      if (!v6) {
        goto LABEL_12;
      }
    }

    else if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }

    free(v6);
    goto LABEL_12;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "failed to write tmp remote file", v7, 2u);
  }

- (void)setupDeviceStateChangeHandler
{
  if (self->_device_browser)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Browser is already up; skipping setup",
        buf,
        2u);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Browser is down; proceeding with setup",
        buf,
        2u);
    }

    started = (OS_remote_device_browser *)remote_device_start_browsing();
    device_browser = self->_device_browser;
    self->_device_browser = started;
  }

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a3)
  {
    if (v5)
    {
      uint64_t type = remote_device_get_type();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t description = remote_device_type_get_description();
        uint64_t name = remote_device_get_name();
        remote_device_get_state();
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = description;
        __int16 v20 = 2080;
        uint64_t v21 = name;
        __int16 v22 = 2080;
        uint64_t v23 = remote_device_state_get_description();
        _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Browser found %s-%s: %s", buf, 0x20u);
      }

      if (+[PCCBridgeEndpoint isSupportedRemoteDeviceType:]( &OBJC_CLASS___PCCBridgeEndpoint,  "isSupportedRemoteDeviceType:",  type))
      {
        remote_device_set_connected_callback();
        dispatch_get_global_queue(0LL, 0LL);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        remote_device_set_disconnected_callback();

        goto LABEL_15;
      }

      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      uint64_t v17 = remote_device_type_get_description();
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = v17;
      objc_super v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      __int128 v14 = "Ignoring device of type %s";
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 12;
    }

    else
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      objc_super v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      __int128 v14 = "Got a NULL device from the remote device browser";
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 2;
    }

    _os_log_impl(&dword_187E6F000, v13, v15, v14, buf, v16);
    goto LABEL_15;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Browser was canceled", buf, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0LL;

LABEL_15:
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  remote_device_get_type();
  uint64_t description = remote_device_type_get_description();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = description;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Device '%s' in connected state; attempting to establish service",
      (uint8_t *)&v5,
      0xCu);
  }

  [*(id *)(a1 + 32) setupOutgoingConnection:v3];
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t name = remote_device_get_name();
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Device %s is disconnected", buf, 0xCu);
  }

  +[PCCBridgeEndpoint identifierForRemoteDevice:](&OBJC_CLASS___PCCBridgeEndpoint, "identifierForRemoteDevice:", v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t name = (uint64_t)v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Tearing down connections for disconnected device %@.",  buf,  0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v4];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "removing registered device", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 56) setObject:0 forKeyedSubscript:v4];
    }

    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t name = (uint64_t)v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Device %@ disconnected before registration.",  buf,  0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v4];
    os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t name = (uint64_t)v4;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "canceling remote connection for %@.",  buf,  0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v4];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_remote_connection_cancel();

      [*(id *)(*(void *)(a1 + 32) + 72) setObject:0 forKeyedSubscript:v4];
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(dispatch_queue_s **)(v18 + 40);
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_43;
      v20[3] = &unk_18A161300;
      v20[4] = v18;
      id v21 = v4;
      dispatch_async(v19, v20);
    }

    else if (v16)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t name = (uint64_t)v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Device %@ disconnected before outgoing connections were set up.",  buf,  0xCu);
    }
  }

  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v7) {
      __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_42_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_43(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained handleConnection:0 from:*(void *)(a1 + 40)];
}

- (id)deviceIds
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  obj = self->_remoteDevices;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * v7);
        v24[0] = @"uuid";
        v24[1] = @"nearby";
        v25[0] = v8;
        objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PCCBridgeEndpoint isDeviceNearby:](self, "isDeviceNearby:", v8));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v9;
        [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = (void *)[v10 mutableCopy];

        -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:](self, "stashCrashReporterKeyForIdentifier:", v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteCRKeys, "objectForKeyedSubscript:", v8);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 setObject:v12 forKeyedSubscript:@"crashreporter_key"];

        +[PCCBridgeEndpoint remoteDeviceForIdentifier:]( &OBJC_CLASS___PCCBridgeEndpoint,  "remoteDeviceForIdentifier:",  v8);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          uint64_t name = remote_device_get_name();
          if (name)
          {
            [NSString stringWithUTF8String:name];
            os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 setObject:v15 forKeyedSubscript:@"name"];
          }
        }

        [MEMORY[0x189603F68] dictionaryWithDictionary:v11];
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v16];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
    }

    while (v5);
  }

  [MEMORY[0x189603F18] arrayWithArray:v3];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isDeviceNearby:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)synchronize:(id)a3 withOptions:(id)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[PCCBridgeEndpoint identifierForTarget:](self, "identifierForTarget:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[PCCBridgeEndpoint synchronize:withOptions:].cold.1();
    }
    goto LABEL_7;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_7:
    uint64_t v13 = 0LL;
    goto LABEL_10;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteDevices, "objectForKeyedSubscript:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = (void *)MEMORY[0x189607870];
  if (v8)
  {
    uint64_t v15 = *MEMORY[0x1896075E0];
    BOOL v16 = @"No remote device found";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = v9;
    uint64_t v12 = 4LL;
  }

  else
  {
    uint64_t v17 = *MEMORY[0x1896075E0];
    v18[0] = @"No remote connection to target device";
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = v9;
    uint64_t v12 = 1LL;
  }

  [v11 errorWithDomain:@"ProxyBridgeErrorDomain" code:v12 userInfo:v10];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

- (void)enterInterruptedStateFrom:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_interruptedDevices, "containsObject:", v4) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%@ is already in interruped state; passing",
        buf,
        0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%@ is entering interrupted state; disconnecting",
        buf,
        0xCu);
    }

    -[NSMutableSet addObject:](self->_interruptedDevices, "addObject:", v4);
    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __47__PCCBridgeEndpoint_enterInterruptedStateFrom___block_invoke;
    v6[3] = &unk_18A161300;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(eventQueue, v6);
  }
}

void __47__PCCBridgeEndpoint_enterInterruptedStateFrom___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained handleConnection:0 from:*(void *)(a1 + 40)];
}

- (void)exitInterruptedStateFrom:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_interruptedDevices, "containsObject:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%@ is exiting interruped state; reconnecting",
        buf,
        0xCu);
    }

    -[NSMutableSet removeObject:](self->_interruptedDevices, "removeObject:", v4);
    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __46__PCCBridgeEndpoint_exitInterruptedStateFrom___block_invoke;
    v6[3] = &unk_18A161300;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(eventQueue, v6);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%@ is not in interruped state; passing",
      buf,
      0xCu);
  }
}

void __46__PCCBridgeEndpoint_exitInterruptedStateFrom___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained handleConnection:1 from:*(void *)(a1 + 40)];
}

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[PCCBridgeEndpoint identifierForTarget:](self, "identifierForTarget:", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PCCBridgeEndpoint connectionForIdentifier:](self, "connectionForIdentifier:", v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ns2xpc();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PCCBridgeEndpoint addSenderToMessage:](&OBJC_CLASS___PCCBridgeEndpoint, "addSenderToMessage:", v12);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v10);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_remote_connection_send_message();

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        [v9 objectForKeyedSubscript:@"messageType"];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v14;
        _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "sent %@", buf, 0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [v9 objectForKeyedSubscript:@"messageType"];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v10;
        __int16 v28 = 2112;
        id v29 = v15;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "No connection to %@ on which to send message of type %@",  buf,  0x16u);
      }

      if (a5)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteDevices, "objectForKeyedSubscript:", v10);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v17 = (void *)MEMORY[0x189607870];
        if (v16)
        {
          uint64_t v24 = *MEMORY[0x1896075E0];
          uint64_t v25 = @"No remote connection to target device";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = v17;
          uint64_t v20 = 1LL;
        }

        else
        {
          uint64_t v22 = *MEMORY[0x1896075E0];
          __int128 v23 = @"No remote device found";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = v17;
          uint64_t v20 = 4LL;
        }

        [v19 errorWithDomain:@"ProxyBridgeErrorDomain" code:v20 userInfo:v18];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[PCCBridgeEndpoint synchronize:withOptions:].cold.1();
  }

  return 0LL;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  v50[2] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[PCCBridgeEndpoint identifierForTarget:](self, "identifierForTarget:", v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[PCCBridgeEndpoint synchronize:withOptions:].cold.1();
    }
    goto LABEL_27;
  }

  -[PCCBridgeEndpoint connectionForIdentifier:](self, "connectionForIdentifier:", v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v13;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "No connection to %@ on which to send file",  buf,  0xCu);
    }

    if (a6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteDevices, "objectForKeyedSubscript:", v13);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v18 = (void *)MEMORY[0x189607870];
      if (v17)
      {
        uint64_t v41 = *MEMORY[0x1896075E0];
        uint64_t v42 = @"No remote connection to target device";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = v18;
        uint64_t v21 = 1LL;
      }

      else
      {
        uint64_t v39 = *MEMORY[0x1896075E0];
        v40 = @"No remote device found";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = v18;
        uint64_t v21 = 4LL;
      }

      [v20 errorWithDomain:@"ProxyBridgeErrorDomain" code:v21 userInfo:v19];
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

void __46__PCCBridgeEndpoint_send_file_metadata_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      BOOL v16 = strerror(a2);
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to transfer log file at %@, error: %s",  buf,  0x16u);
    }

    id v5 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896075E0];
    objc_msgSend(NSString, "stringWithUTF8String:", strerror(a2), v11);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 errorWithDomain:@"ProxyBridgeErrorDomain" code:2 userInfo:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
    [WeakRetained ack:*(void *)(a1 + 48) result:0 error:v8];
  }

  else
  {
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
    [v10 ack:*(void *)(a1 + 48) result:1 error:0];

    [*(id *)(a1 + 40) exitInterruptedStateFrom:*(void *)(a1 + 56)];
  }

+ (BOOL)isSupportedRemoteDeviceType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithObjects:", &unk_18A166978, 0);
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  [v4 addObject:&unk_18A166990];
  [v5 addObject:&unk_18A1669A8];
  if (OSAIsDebugEnabledForRSD())
  {
    [v4 addObject:&unk_18A1669C0];
    [v5 addObject:&unk_18A1669D8];
  }

  if (OSAIsRSDHost())
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v4;
  }

  else
  {
    if (!OSAIsRSDDevice())
    {
      char v8 = 0;
      goto LABEL_9;
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:v3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v5;
  }

  char v8 = [v7 containsObject:v6];

LABEL_9:
  return v8;
}

+ (id)remoteDeviceForIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if ([v3 isEqualToString:@"Bridge"])
  {
    uint64_t v4 = (void *)remote_device_copy_unique_of_type();
  }

  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v3];
    [v5 getUUIDBytes:v7];
    uint64_t v4 = (void *)remote_device_copy_device_with_uuid();
  }

  return v4;
}

+ (id)identifierForRemoteDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      uint64_t v4 = 0LL;
      goto LABEL_11;
    }

    *(_WORD *)uu = 0;
    id v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v6 = "Remote device was NULL";
    id v7 = uu;
LABEL_9:
    _os_log_impl(&dword_187E6F000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_10;
  }

  if (remote_device_get_type() != 3)
  {
    remote_device_copy_uuid();
    if (!uuid_is_null(uu))
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
      [v9 UUIDString];
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }

    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v10 = 0;
    id v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v6 = "Got a NULL UUID; remote device may not be connected.";
    id v7 = (unsigned __int8 *)&v10;
    goto LABEL_9;
  }

  uint64_t v4 = @"Bridge";
LABEL_11:

  return v4;
}

+ (id)UDIDForRemoteDevice:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)remote_device_copy_property();
    id v5 = v4;
    if (v4)
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (string_ptr)
      {
        [NSString stringWithUTF8String:string_ptr];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v9 = "UDID string was not available in property";
        __int16 v10 = buf;
        goto LABEL_12;
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v9 = "Failed to copy UDID property from remote device.";
      __int16 v10 = (uint8_t *)&v13;
LABEL_12:
      _os_log_impl(&dword_187E6F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }

    id v7 = 0LL;
    goto LABEL_14;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to fetch UDID: remote device was NULL.",  v12,  2u);
  }

  id v7 = 0LL;
LABEL_15:

  return v7;
}

- (id)identifierForTarget:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    if (OSAIsRSDHost())
    {
      id v7 = (void *)remote_device_copy_unique_of_type();
      if (!v7)
      {
        BOOL v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v26) {
          -[PCCBridgeEndpoint identifierForTarget:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
        }
        id v6 = 0LL;
        goto LABEL_18;
      }

      uint64_t v8 = +[PCCBridgeEndpoint identifierForRemoteDevice:](&OBJC_CLASS___PCCBridgeEndpoint, "identifierForRemoteDevice:", v7);
LABEL_17:
      id v6 = (id)v8;
LABEL_18:

      goto LABEL_22;
    }

    if (OSAIsRSDDevice())
    {
      uint64_t v9 = -[NSMutableDictionary count](self->_outgoingConnections, "count");
      if (v9 == 1)
      {
        -[NSMutableDictionary allKeys](self->_outgoingConnections, "allKeys");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v7 firstObject];
        goto LABEL_17;
      }

      if (v9)
      {
        BOOL v34 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v34) {
          -[PCCBridgeEndpoint identifierForTarget:].cold.2(v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }

      else
      {
        BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v10) {
          -[PCCBridgeEndpoint identifierForTarget:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
        }
      }
    }

    else
    {
      BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v18) {
        -[PCCBridgeEndpoint identifierForTarget:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    id v6 = 0LL;
    goto LABEL_22;
  }

  id v6 = v4;
LABEL_22:

  return v6;
}

- (void)setupOutgoingConnection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  +[PCCBridgeEndpoint identifierForRemoteDevice:](&OBJC_CLASS___PCCBridgeEndpoint, "identifierForRemoteDevice:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = +[PCCBridgeEndpoint UDIDForRemoteDevice:](&OBJC_CLASS___PCCBridgeEndpoint, "UDIDForRemoteDevice:", v4);
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9) {
        -[PCCBridgeEndpoint setupOutgoingConnection:].cold.3(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    else if (v9)
    {
      -[PCCBridgeEndpoint setupOutgoingConnection:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v5);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v34 = v5;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Outgoing connection to %@ is already valid",  buf,  0xCu);
      }
    }

    else
    {
      else {
        BOOL v18 = "com.apple.osanalytics.logRelay";
      }
      uint64_t v19 = (void *)remote_device_copy_service();
      if (v19)
      {
        uint64_t v20 = (void *)xpc_remote_connection_create_with_remote_service();
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v34 = v5;
            _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Registering connection to remote device: %@",  buf,  0xCu);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_outgoingConnections,  "setObject:forKeyedSubscript:",  v20,  v5);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteDevices,  "setObject:forKeyedSubscript:",  v7,  v5);
          uint64_t v21 = MEMORY[0x1895F87A8];
          uint64_t v26 = MEMORY[0x1895F87A8];
          uint64_t v27 = 3221225472LL;
          uint64_t v28 = __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke;
          uint64_t v29 = &unk_18A161378;
          uint64_t v32 = v18;
          uint64_t v30 = self;
          id v22 = v5;
          id v31 = v22;
          xpc_remote_connection_set_event_handler();
          xpc_remote_connection_activate();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "remote connection active",  buf,  2u);
          }

          eventQueue = (dispatch_queue_s *)self->_eventQueue;
          block[0] = v21;
          block[1] = 3221225472LL;
          block[2] = __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke_76;
          block[3] = &unk_18A161300;
          block[4] = self;
          id v25 = v22;
          dispatch_async(eventQueue, block);
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          -[PCCBridgeEndpoint setupOutgoingConnection:].cold.2();
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        -[PCCBridgeEndpoint setupOutgoingConnection:].cold.1();
      }
    }
  }
}

void __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3 != (id)MEMORY[0x1895F9198])
  {
    if (v3 == (id)MEMORY[0x1895F91A0])
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v8 = *(void *)(a1 + 48);
      int v14 = 136315138;
      uint64_t v15 = v8;
      BOOL v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v10 = "Got XPC_ERROR_CONNECTION_INVALID from %s\n";
      uint32_t v11 = 12;
    }

    else
    {
      if (MEMORY[0x1895B88F0](v3) != MEMORY[0x1895F9268])
      {
        id v5 = (char *)MEMORY[0x1895B8860](v4);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 48);
          int v14 = 136315394;
          uint64_t v15 = v6;
          __int16 v16 = 2080;
          uint64_t v17 = v5;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Got unexpected xpc message from %s: %s\n",  (uint8_t *)&v14,  0x16u);
        }

        if (v5) {
          free(v5);
        }
        goto LABEL_16;
      }

      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v12 = *(void *)(a1 + 48);
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1895F91B0]);
      int v14 = 136315394;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      uint64_t v17 = string;
      BOOL v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v10 = "Got xpc error message from %s: %s\n";
      uint32_t v11 = 22;
    }

    _os_log_impl(&dword_187E6F000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v11);
    goto LABEL_16;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v14 = 136315138;
    uint64_t v15 = v7;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Got XPC_ERROR_CONNECTION_INTERRUPTED from %s\n",  (uint8_t *)&v14,  0xCu);
  }

  [*(id *)(a1 + 32) enterInterruptedStateFrom:*(void *)(a1 + 40)];
LABEL_16:
}

void __45__PCCBridgeEndpoint_setupOutgoingConnection___block_invoke_76(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained handleConnection:1 from:*(void *)(a1 + 40)];
}

- (id)connectionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  __int16 v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  initializationQueue = (dispatch_queue_s *)self->_initializationQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke;
  block[3] = &unk_18A1613A0;
  id v10 = v4;
  uint32_t v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(initializationQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "objectForKeyedSubscript:");
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      +[PCCBridgeEndpoint remoteDeviceForIdentifier:]( &OBJC_CLASS___PCCBridgeEndpoint,  "remoteDeviceForIdentifier:",  *(void *)(a1 + 32));
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3) {
        [*(id *)(a1 + 40) setupOutgoingConnection:v3];
      }
    }

    uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 72) objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v7) {
      __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

+ (void)addSenderToMessage:(id)a3
{
  xpc_object_t xdict = a3;
  id v3 = (id) MGCopyAnswer();
  uint64_t v4 = (const char *)[v3 UTF8String];

  xpc_dictionary_set_string(xdict, "kOSASender", v4);
}

- (void)stashCrashReporterKeyForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteCRKeys, "objectForKeyedSubscript:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[PCCBridgeEndpoint remoteDeviceForIdentifier:](&OBJC_CLASS___PCCBridgeEndpoint, "remoteDeviceForIdentifier:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && remote_device_get_type() == 3)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteCRKeys,  "setObject:forKeyedSubscript:",  @"Bridge",  v4);
    }

    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v4);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
        xpc_object_t empty = xpc_dictionary_create_empty();
        xpc_dictionary_set_string( empty,  (const char *)[@"messageType" UTF8String],  "kOSAFetchCrashReporterKey");
        +[PCCBridgeEndpoint addSenderToMessage:](&OBJC_CLASS___PCCBridgeEndpoint, "addSenderToMessage:", empty);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v4;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Sending request to stash crash reporter key for %@",  buf,  0xCu);
        }

        -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v4);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = v4;
        uint64_t v11 = v8;
        xpc_remote_connection_send_message_with_reply();

        dispatch_time_t v12 = dispatch_time(0LL, 30000000000LL);
        if (dispatch_semaphore_wait(v11, v12) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
          -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:].cold.2();
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        -[PCCBridgeEndpoint stashCrashReporterKeyForIdentifier:].cold.1();
      }
    }
  }
}

uint64_t __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1895B88F0]() == MEMORY[0x1895F9250])
  {
    string = xpc_dictionary_get_string(v3, "crashReporterKey");

    if (string)
    {
      [NSString stringWithUTF8String:string];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(*(void *)(a1 + 32) + 64) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_1( a1,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
    }
  }

  else
  {
    id v4 = (void *)MEMORY[0x1895B8860](v3);

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_2();
      if (!v4) {
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      }
      goto LABEL_4;
    }

    if (v4) {
LABEL_4:
    }
      free(v4);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

- (void)init
{
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_1()
{
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_12_cold_2()
{
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412546;
  uint64_t v2 = a1;
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Unexpected metadata from RemoteXPC: '%@'\nOriginal xpc message %s",  (uint8_t *)&v1,  0x16u);
  OUTLINED_FUNCTION_3();
}

void __47__PCCBridgeEndpoint_setupIncomingEventListener__block_invoke_24_cold_2(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_187E6F000, MEMORY[0x1895F8DA0], v2, "received file '%@'", v3, v4, v5, v6, v7);
}

void __50__PCCBridgeEndpoint_setupDeviceStateChangeHandler__block_invoke_42_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)synchronize:withOptions:.cold.1()
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)identifierForTarget:(uint64_t)a3 .cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setupOutgoingConnection:.cold.1()
{
}

- (void)setupOutgoingConnection:.cold.2()
{
}

- (void)setupOutgoingConnection:(uint64_t)a3 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setupOutgoingConnection:(uint64_t)a3 .cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __45__PCCBridgeEndpoint_connectionForIdentifier___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)stashCrashReporterKeyForIdentifier:.cold.1()
{
}

- (void)stashCrashReporterKeyForIdentifier:.cold.2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Timed out waiting for remote device CR key.",  v0,  2u);
  OUTLINED_FUNCTION_2();
}

void __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__PCCBridgeEndpoint_stashCrashReporterKeyForIdentifier___block_invoke_cold_2()
{
}

@end