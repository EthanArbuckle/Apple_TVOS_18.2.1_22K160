@interface UARPUploaderEndpoint
- (BOOL)handlePersonalizationResponse:(id)a3;
- (BOOL)hasFullPersonality:(id)a3;
- (BOOL)im4mAssetReceived:(id)a3;
- (BOOL)isDownstreamEndpoint;
- (NSArray)rxDynamicAssets;
- (NSArray)txDynamicAssets;
- (NSArray)txFirmwareAssets;
- (NSSet)applePropertiesToQuery;
- (NSSet)infoPropertiesToQuery;
- (NSString)appleModelNumber;
- (NSString)friendlyName;
- (NSString)hardwareVersion;
- (NSString)hwFusingType;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)serialNumber;
- (UARPAccessory)accessory;
- (UARPAssetVersion)firmwareVersion;
- (UARPAssetVersion)stagedFirmwareVersion;
- (UARPUploaderEndpoint)directEndpoint;
- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 layer2Context:(uarpPlatformRemoteEndpoint *)a4 uploader:(id)a5;
- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 uploader:(id)a4;
- (UARPUploaderUARP)uploader;
- (id)downstreamEndpoint:(unint64_t)a3;
- (id)findMatch:(id)a3;
- (id)idealTxFirmwareAsset;
- (id)initDownstreamWithDirectEndpoint:(id)a3 layer2Context:(void *)a4 uploader:(id)a5;
- (uarpPlatformOptionsObj)uarpOptions;
- (uarpPlatformRemoteEndpoint)uarpEndpoint;
- (unint64_t)uarpVersion;
- (unsigned)downstreamID;
- (void)abandonRxDynamicAsset:(id)a3;
- (void)abandonTxDynamicAsset:(id)a3;
- (void)addDownstreamEndpoint:(id)a3;
- (void)addRxDynamicAsset:(id)a3;
- (void)addTxDynamicAsset:(id)a3;
- (void)addTxFirmwareAsset:(id)a3;
- (void)cancelLayer2WatchdogTimer;
- (void)clearQueuedAppleProperties;
- (void)clearQueuedInfoProperties;
- (void)dealloc;
- (void)dumpRxUARPMsg:(id)a3;
- (void)dumpTxUARPMsg:(id)a3;
- (void)handleLayer2WatchdogTimer:(id)a3;
- (void)handlePersonalizationRequest;
- (void)handlePersonalizationRequest:(id)a3 tatsuSigningServer:(id)a4;
- (void)qcancelLayer2WatchdogTimer;
- (void)queueAppleProperty:(unsigned int)a3;
- (void)queueInfoProperty:(unsigned int)a3;
- (void)removeAsset:(id)a3;
- (void)removeDownstreamEndpoint:(id)a3;
- (void)respondIM4M:(id)a3;
- (void)setAppleModelNumber:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHwFusingType:(id)a3;
- (void)setLayer2WatchdogTimer:(id)a3 timeoutMS:(unint64_t)a4;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setUarpVersion:(unint64_t)a3;
@end

@implementation UARPUploaderEndpoint

- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 layer2Context:(uarpPlatformRemoteEndpoint *)a4 uploader:(id)a5
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___UARPUploaderEndpoint;
  v11 = -[UARPUploaderEndpoint init](&v45, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessory, a3);
    objc_storeWeak((id *)&v12->_uploader, v10);
    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    log = v12->_log;
    v12->_log = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.UARPUploaderUARP.accessory", 0LL);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.UARPUploaderEndpoint.personalization", 0LL);
    personalizationQueue = v12->_personalizationQueue;
    v12->_personalizationQueue = (OS_dispatch_queue *)v17;

    if (a4)
    {
      *(_WORD *)buf = 0;
      uarpDownstreamEndpointGetID((uint64_t)a4, buf);
      unsigned __int16 v19 = *(_WORD *)buf;
    }

    else
    {
      a4 = (uarpPlatformRemoteEndpoint *)calloc(1uLL, 0xB8uLL);
      unsigned __int16 v19 = 0;
    }

    v12->_downstreamID = v19;
    v12->_uarpEndpoint = a4;
    [v9 modelNumber];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v20);
    *(_DWORD *)&v12->_uarpOptions.upgradeOnly = 0;
    *(_OWORD *)&v12->_uarpOptions.maxTxPayloadLength = 0u;
    *(_OWORD *)&v12->_uarpOptions.responseTimeout = 0u;
    *(void *)&v12->_uarpOptions.maxTxPayloadLength = 0x800000008000LL;
    v12->_uarpOptions.payloadWindowLength = 0x8000;
    v12->_uarpOptions.protocolVersion = 4;
    v12->_uarpOptions.reofferFirmwareOnSync = 0;
    v12->_uarpOptions.responseTimeout = [v21 uploaderResponseTimeout];
    v12->_uarpOptions.retryLimit = [v21 uploaderRetryLimit];
    uint64_t v22 = [v9 productGroup];
    BOOL v25 = 0;
    if (v22)
    {
      v23 = (void *)v22;
      [v9 productNumber];
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24) {
        BOOL v25 = 1;
      }
    }

    v12->_uarpOptions.endpointType = v25;
    v12->_uarpVersion = 0LL;
    v12->_uarpOptions.upgradeOnly = 1;
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    txFirmwareAssets = v12->_txFirmwareAssets;
    v12->_txFirmwareAssets = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    txDynamicAssets = v12->_txDynamicAssets;
    v12->_txDynamicAssets = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    rxDynamicAssets = v12->_rxDynamicAssets;
    v12->_rxDynamicAssets = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    downstreamEndpoints = v12->_downstreamEndpoints;
    v12->_downstreamEndpoints = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    infoPropertiesToQuery = v12->_infoPropertiesToQuery;
    v12->_infoPropertiesToQuery = v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    applePropertiesToQuery = v12->_applePropertiesToQuery;
    v12->_applePropertiesToQuery = v36;

    uint64_t v38 = [MEMORY[0x189607AB8] UUID];
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v38;

    v40 = v12->_log;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = v12->_uuid;
      v42 = v40;
      v43 = -[NSUUID UUIDString](v41, "UUIDString");
      *(_DWORD *)buf = 138412290;
      v47 = v43;
      _os_log_impl(&dword_187DC0000, v42, OS_LOG_TYPE_INFO, "New Remote Endpoint: UUID <%@>", buf, 0xCu);
    }
  }

  return v12;
}

- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 uploader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[UARPUploaderEndpoint initWithUARPAccessory:layer2Context:uploader:]( self,  "initWithUARPAccessory:layer2Context:uploader:",  v6,  0LL,  v7);
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1895B7E8C]();
    UARPStringPcapFilesFilepath();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v10, 259200.0);

    UARPStringLogsDirectoryFilePath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v11, 259200.0);

    UARPStringCrashAnalyticsDirectoryFilePath();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v12, 604800.0);

    [v7 ageOutUnprocessedDynamicAssets];
    UARPStringSysdiagnoseDirectoryFilePath();
    os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v13, 604800.0);

    objc_autoreleasePoolPop(v9);
    v14 = -[UARPAccessory getID](v8->_accessory, "getID");
    [v14 modelIdentifier];
    dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    UARPStringPcapFilesFilepath();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UARPUniqueFilename(v15, 0LL, v16, 0LL, @".pcap");
    dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    log = v8->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[UARPUploaderEndpoint initWithUARPAccessory:uploader:].cold.1((uint64_t)v17, log, v19, v20, v21, v22, v23, v24);
    }
    BOOL v25 = -[UARPPacketDumper initWithFileName:](objc_alloc(&OBJC_CLASS___UARPPacketDumper), "initWithFileName:", v17);
    packetDumper = v8->_packetDumper;
    v8->_packetDumper = v25;
  }

  return v8;
}

- (void)dealloc
{
  packetDumper = self->_packetDumper;
  self->_packetDumper = 0LL;

  if (!self->_downstreamID) {
    free(self->_uarpEndpoint);
  }
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  if (layer2WatchdogTimer)
  {
    dispatch_source_cancel((dispatch_source_t)layer2WatchdogTimer);
    v5 = self->_layer2WatchdogTimer;
    self->_layer2WatchdogTimer = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPUploaderEndpoint;
  -[UARPUploaderEndpoint dealloc](&v6, sel_dealloc);
}

- (uarpPlatformRemoteEndpoint)uarpEndpoint
{
  return self->_uarpEndpoint;
}

- (uarpPlatformOptionsObj)uarpOptions
{
  return &self->_uarpOptions;
}

- (UARPUploaderEndpoint)directEndpoint
{
  return self->_directEndpoint;
}

- (NSArray)txFirmwareAssets
{
  v2 = self;
  objc_sync_enter(v2);
  [MEMORY[0x189603F18] arrayWithArray:v2->_txFirmwareAssets];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)txDynamicAssets
{
  v2 = self;
  objc_sync_enter(v2);
  [MEMORY[0x189603F18] arrayWithArray:v2->_txDynamicAssets];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)rxDynamicAssets
{
  v2 = self;
  objc_sync_enter(v2);
  [MEMORY[0x189603F18] arrayWithArray:v2->_rxDynamicAssets];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addTxFirmwareAsset:(id)a3
{
}

- (void)addTxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Add Tx Dynamic Asset %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NSMutableArray addObject:](self->_txDynamicAssets, "addObject:", v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderEndpoint addTxDynamicAsset:].cold.1();
  }
}

- (void)addRxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Add Rx Dynamic Asset %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NSMutableArray addObject:](self->_rxDynamicAssets, "addObject:", v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderEndpoint addRxDynamicAsset:].cold.1();
  }
}

- (void)removeAsset:(id)a3
{
  txFirmwareAssets = self->_txFirmwareAssets;
  id v5 = a3;
  -[NSMutableArray removeObject:](txFirmwareAssets, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_txDynamicAssets, "removeObject:", v5);
}

- (id)findMatch:(id)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = self->_txFirmwareAssets;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
      [v10 asset];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v4 isEqual:v11];

      if ((v12 & 1) != 0) {
        goto LABEL_26;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v5 = self->_txDynamicAssets;
  uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
LABEL_11:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
      [v10 asset];
      dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      char v18 = [v4 isEqual:v17];

      if ((v18 & 1) != 0) {
        goto LABEL_26;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
        if (v14) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = self->_rxDynamicAssets;
  id v19 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
  if (v19)
  {
    uint64_t v20 = *(void *)v26;
LABEL_19:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v20) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
      objc_msgSend(v10, "asset", (void)v25);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      char v23 = [v4 isEqual:v22];

      if ((v23 & 1) != 0) {
        break;
      }
      if (v19 == (id)++v21)
      {
        id v19 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
        if (v19) {
          goto LABEL_19;
        }
        goto LABEL_27;
      }
    }

- (void)handleLayer2WatchdogTimer:(id)a3
{
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  self->_layer2WatchdogTimer = 0LL;
  id v5 = a3;

  [v5 watchdogExpireLayer2:self];
}

- (void)cancelLayer2WatchdogTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__UARPUploaderEndpoint_cancelLayer2WatchdogTimer__block_invoke;
  block[3] = &unk_18A143168;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

uint64_t __49__UARPUploaderEndpoint_cancelLayer2WatchdogTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) qcancelLayer2WatchdogTimer];
}

- (void)qcancelLayer2WatchdogTimer
{
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  if (layer2WatchdogTimer)
  {
    dispatch_source_cancel((dispatch_source_t)layer2WatchdogTimer);
    id v4 = self->_layer2WatchdogTimer;
    self->_layer2WatchdogTimer = 0LL;
  }

- (void)setLayer2WatchdogTimer:(id)a3 timeoutMS:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke;
  block[3] = &unk_18A1431B8;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

void __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  else {
    int64_t v5 = 1000000LL * *(void *)(a1 + 48);
  }
  dispatch_time_t v6 = dispatch_time(0LL, v5);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 32LL), v6, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 32LL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke_2;
  handler[3] = &unk_18A143190;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 40);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32LL));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleLayer2WatchdogTimer:*(void *)(a1 + 32)];
}

- (id)initDownstreamWithDirectEndpoint:(id)a3 layer2Context:(void *)a4 uploader:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [v9 accessory];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = -[UARPUploaderEndpoint initWithUARPAccessory:layer2Context:uploader:]( self,  "initWithUARPAccessory:layer2Context:uploader:",  v11,  a4,  v10);

  if (v12)
  {
    v12->_isDownstreamEndpoint = 1;
    objc_storeStrong((id *)&v12->_directEndpoint, a3);
  }

  return v12;
}

- (BOOL)isDownstreamEndpoint
{
  return self->_isDownstreamEndpoint;
}

- (void)addDownstreamEndpoint:(id)a3
{
}

- (void)removeDownstreamEndpoint:(id)a3
{
}

- (id)downstreamEndpoint:(unint64_t)a3
{
  unsigned __int16 v3 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_downstreamEndpoints;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "downstreamID", (void)v12) == v3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (BOOL)hasFullPersonality:(id)a3
{
  id v4 = a3;
  -[UARPUploaderEndpoint serialNumber](self, "serialNumber");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_10;
  }
  -[UARPUploaderEndpoint appleModelNumber](self, "appleModelNumber");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    goto LABEL_10;
  }
  -[UARPUploaderEndpoint hwFusingType](self, "hwFusingType");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (-[UARPUploaderEndpoint firmwareVersion](self, "firmwareVersion"),
        id v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    BOOL v9 = 1;
  }

  else
  {
LABEL_10:
    BOOL v9 = 0;
  }

  return v9;
}

- (void)dumpTxUARPMsg:(id)a3
{
  packetDumper = self->_packetDumper;
  if (packetDumper)
  {
    accessory = self->_accessory;
    id v5 = a3;
    -[UARPAccessory getID](accessory, "getID");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UARPPacketDumper dump:accessoryID:uarpStatus:direction:]( packetDumper,  "dump:accessoryID:uarpStatus:direction:",  v5,  v6,  0LL,  0LL);
  }

- (void)dumpRxUARPMsg:(id)a3
{
  packetDumper = self->_packetDumper;
  if (packetDumper)
  {
    accessory = self->_accessory;
    id v5 = a3;
    -[UARPAccessory getID](accessory, "getID");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UARPPacketDumper dump:accessoryID:uarpStatus:direction:]( packetDumper,  "dump:accessoryID:uarpStatus:direction:",  v5,  v6,  0LL,  1LL);
  }

- (void)abandonRxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Remove Rx Dynamic Asset %@",  (uint8_t *)&v5,  0xCu);
  }

  if ([v4 internalSolicit])
  {
    -[NSMutableArray removeObject:](self->_rxDynamicAssets, "removeObject:", v4);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[UARPUploaderEndpoint addRxDynamicAsset:].cold.1();
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Do not abandon internally solicited Rx Dynamic Asset %@",  (uint8_t *)&v5,  0xCu);
    }

    [v4 setUarpSuperBinary:0];
    [v4 setUarpPlatformAsset:0];
  }
}

- (void)abandonTxDynamicAsset:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Remove Tx Dynamic Asset %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NSMutableArray removeObject:](self->_txDynamicAssets, "removeObject:", v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderEndpoint addTxDynamicAsset:].cold.1();
  }
}

- (void)queueInfoProperty:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](obj->_infoPropertiesToQuery, "addObject:", v4);

  objc_sync_exit(obj);
}

- (void)queueAppleProperty:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](obj->_applePropertiesToQuery, "addObject:", v4);

  objc_sync_exit(obj);
}

- (NSSet)infoPropertiesToQuery
{
  return (NSSet *)[MEMORY[0x189604010] setWithSet:self->_infoPropertiesToQuery];
}

- (NSSet)applePropertiesToQuery
{
  return (NSSet *)[MEMORY[0x189604010] setWithSet:self->_applePropertiesToQuery];
}

- (void)clearQueuedInfoProperties
{
}

- (void)clearQueuedAppleProperties
{
}

- (id)idealTxFirmwareAsset
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  dispatch_source_t v2 = self->_txFirmwareAssets;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v5)
        {
          [*(id *)(*((void *)&v21 + 1) + 8 * i) assetVersion];
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = [v9 majorVersion];

          [v8 assetVersion];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20[1] = [v10 minorVersion];

          [v8 assetVersion];
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20[3] = [v11 buildVersion];

          [v8 assetVersion];
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20[2] = [v12 releaseVersion];

          [v5 assetVersion];
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = [v13 majorVersion];

          [v5 assetVersion];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19[1] = [v14 minorVersion];

          [v5 assetVersion];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[3] = [v15 buildVersion];

          [v5 assetVersion];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2] = [v16 releaseVersion];

          if (uarpVersionCompare(v19, v20) == 1)
          {
            id v17 = v8;

            id v5 = v17;
          }
        }

        else
        {
          id v5 = v8;
        }
      }

      uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)im4mAssetReceived:(id)a3
{
  id v4 = a3;
  [v4 asset];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 id];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 tag];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = (char *)uarpAssetTagStructPersonalization();
  BOOL v9 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v8,  v8[1],  v8[2],  v8[3]);
  int v10 = [v7 isEqual:v9];
  if (v10)
  {
    [v4 asset];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 id];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localURL];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v14 = (void *)[v13 copy];

    [MEMORY[0x189604030] URLWithString:@"https://gs.apple.com:443"];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[UARPDynamicAssetPersonalization initWithEndpoint:url:tatsuServerURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetPersonalization),  "initWithEndpoint:url:tatsuServerURL:",  self,  v14,  v15);
    id v34 = 0LL;
    LODWORD(v13) = -[UARPDynamicAssetPersonalization processDynamicAsset:](v16, "processDynamicAsset:", &v34);
    id v17 = v34;
    char v18 = v17;
    if ((_DWORD)v13)
    {
      __int128 v32 = v14;
      id v33 = v17;
      [v4 setPendingTssRequest:v16];
      id v19 = (const char *)[@"com.apple.uarp.internal.personalization" UTF8String];
      -[UARPAccessory modelNumber](self->_accessory, "modelNumber");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v20);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();

      [v21 personalizationNotification];
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        id v23 = [v21 personalizationNotification];
        id v19 = (const char *)[v23 UTF8String];
      }

      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        -[UARPUploaderEndpoint im4mAssetReceived:].cold.1((uint64_t)v19, log, v25, v26, v27, v28, v29, v30);
      }
      notify_post(v19);

      __int128 v14 = v32;
      char v18 = v33;
    }
  }

  return v10;
}

- (void)handlePersonalizationRequest
{
}

void __52__UARPUploaderEndpoint_handlePersonalizationRequest__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189604030] URLWithString:@"https://gs.apple.com:443"];
  dispatch_source_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 104LL);
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&__int128 v4 = 136315138LL;
    __int128 v13 = v4;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v9 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
          __int16 v21 = 2112;
          __int128 v22 = v8;
          _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "%s: Check asset for pending tss request, %@",  buf,  0x16u);
        }

        objc_msgSend(v8, "pendingTssRequest", v13);
        int v10 = (void *)objc_claimAutoreleasedReturnValue();

        unint64_t v11 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v12)
          {
            *(_DWORD *)buf = v13;
            uint64_t v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
            _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "%s: Check asset; pending tss request", buf, 0xCu);
          }

          [*(id *)(a1 + 32) handlePersonalizationRequest:v8 tatsuSigningServer:v2];
        }

        else if (v12)
        {
          *(_DWORD *)buf = v13;
          uint64_t v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
          _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "%s: Check asset; no pending tss request", buf, 0xCu);
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v5);
  }
}

- (void)handlePersonalizationRequest:(id)a3 tatsuSigningServer:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "-[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:]";
    __int16 v25 = 2112;
    uint64_t v26 = self;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: Handling TSS request for %@", buf, 0x16u);
  }

  [v6 pendingTssRequest];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = 0LL;
  char v10 = [v9 tssRequest:v7 error:&v22];
  id v11 = v22;

  if ((v10 & 1) == 0)
  {
    BOOL v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
    [WeakRetained rescindAssets:self];
  }

  __int16 v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "-[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:]";
    __int16 v25 = 2112;
    uint64_t v26 = self;
    _os_log_impl(&dword_187DC0000, v21, OS_LOG_TYPE_INFO, "%s: Respond with IM4M %@", buf, 0x16u);
  }

  -[UARPUploaderEndpoint respondIM4M:](self, "respondIM4M:", v6);
}

- (BOOL)handlePersonalizationResponse:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  __int128 v32 = (UARPUploaderEndpoint *)a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
    __int16 v40 = 2112;
    v41 = self;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: Checking pending TSS requests for %@", buf, 0x16u);
  }

  if (v32)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = self->_rxDynamicAssets;
    uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(obj);
          }
          BOOL v9 = *(UARPUploaderEndpoint **)(*((void *)&v33 + 1) + 8 * i);
          -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
          char v10 = (void *)objc_claimAutoreleasedReturnValue();

          id v11 = self->_log;
          BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
          if (v10)
          {
            if (v12)
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              __int16 v40 = 2112;
              v41 = self;
              _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }

            uint64_t v13 = self->_log;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              __int16 v40 = 2112;
              v41 = v32;
              _os_log_impl(&dword_187DC0000, v13, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }

            uint64_t v14 = self->_log;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              uint64_t v15 = v14;
              -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
              uint64_t v16 = (UARPUploaderEndpoint *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              __int16 v40 = 2112;
              v41 = v16;
              _os_log_impl(&dword_187DC0000, v15, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }

            -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            int v18 = [v17 compareTssResponse:v32];

            if (v18)
            {
              id v23 = self->_log;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                __int16 v40 = 2112;
                v41 = self;
                _os_log_impl(&dword_187DC0000, v23, OS_LOG_TYPE_INFO, "%s: Matched TSS response for %@", buf, 0x16u);
              }

              -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
              __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
              char v26 = [v25 processTssResponse:v32];

              if ((v26 & 1) == 0)
              {
                uint64_t v27 = self->_log;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                  __int16 v40 = 2112;
                  v41 = self;
                  _os_log_impl(&dword_187DC0000, v27, OS_LOG_TYPE_INFO, "%s: Failed TSS query for %@", buf, 0x16u);
                }

                id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
                [WeakRetained rescindAssets:self];
              }

              uint64_t v29 = self->_log;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                __int16 v40 = 2112;
                v41 = self;
                _os_log_impl(&dword_187DC0000, v29, OS_LOG_TYPE_INFO, "%s: Respond with IM4M %@", buf, 0x16u);
              }

              -[UARPUploaderEndpoint respondIM4M:](self, "respondIM4M:", v9);

              BOOL v22 = 1;
              goto LABEL_37;
            }
          }

          else if (v12)
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
            __int16 v40 = 2112;
            v41 = v9;
            _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "%s: No pending TSS requests for %@", buf, 0x16u);
          }
        }

        uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
      __int16 v40 = 2112;
      v41 = self;
      _os_log_impl(&dword_187DC0000, v19, OS_LOG_TYPE_INFO, "%s: No pending/matching TSS requests for %@", buf, 0x16u);
    }
  }

  else
  {
    uint64_t v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderEndpoint handlePersonalizationResponse:].cold.1((uint64_t)self, v20);
    }
    id v21 = objc_loadWeakRetained((id *)&self->_uploader);
    [v21 rescindAssets:self];
  }

  BOOL v22 = 0;
LABEL_37:

  return v22;
}

- (void)respondIM4M:(id)a3
{
  id v4 = a3;
  [v4 pendingTssRequest];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 tagIM4M];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uarpDynamicAssetURL(v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 pendingTssRequest];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = 0LL;
  char v9 = [v8 prepareDynamicAsset:v7 error:&v27];
  id v10 = v27;

  if ((v9 & 1) != 0)
  {
    id v11 = objc_alloc(&OBJC_CLASS___UARPAssetID);
    [v4 pendingTssRequest];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 tagIM4M];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[UARPAssetID initWithLocationType:assetTag:url:](v11, "initWithLocationType:assetTag:url:", 0LL, v13, v7);

    uint64_t v15 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", v14);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
    [v4 pendingTssRequest];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 tagIM4M];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained offerDynamicAssetToAccessory:self asset:v15 internalOffer:1 tag:v18];
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderEndpoint respondIM4M:].cold.1(log, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v14 = (UARPAssetID *)objc_loadWeakRetained((id *)&self->_uploader);
    -[UARPAssetID rescindAssets:](v14, "rescindAssets:", self);
  }
}

- (UARPUploaderUARP)uploader
{
  return (UARPUploaderUARP *)objc_loadWeakRetained((id *)&self->_uploader);
}

- (UARPAccessory)accessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 192LL, 1);
}

- (unint64_t)uarpVersion
{
  return self->_uarpVersion;
}

- (void)setUarpVersion:(unint64_t)a3
{
  self->_uarpVersion = a3;
}

- (unsigned)downstreamID
{
  return self->_downstreamID;
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setFriendlyName:(id)a3
{
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setAppleModelNumber:(id)a3
{
}

- (NSString)hwFusingType
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setHwFusingType:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (UARPAssetVersion)firmwareVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (UARPAssetVersion)stagedFirmwareVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithUARPAccessory:(uint64_t)a3 uploader:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)addTxDynamicAsset:.cold.1()
{
}

- (void)addRxDynamicAsset:.cold.1()
{
}

- (void)im4mAssetReceived:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePersonalizationRequest:(uint64_t)a3 tatsuSigningServer:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)handlePersonalizationResponse:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  uint64_t v3 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_187DC0000, a2, OS_LOG_TYPE_ERROR, "%s: TSS response is nil for %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)respondIM4M:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end