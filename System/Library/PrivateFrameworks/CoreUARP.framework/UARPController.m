@interface UARPController
- (BOOL)accessoryIDKnown:(id)a3;
- (BOOL)accessoryKnown:(id)a3;
- (BOOL)accessoryReachable:(id)a3;
- (BOOL)accessoryReachableInternal:(id)a3;
- (BOOL)accessoryUnreachable:(id)a3;
- (BOOL)accessoryUnreachableInternal:(id)a3;
- (BOOL)addAccessory:(id)a3 assetID:(id)a4;
- (BOOL)applyStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4;
- (BOOL)cancelFirmwareStagingForAccessory:(id)a3 assetID:(id)a4;
- (BOOL)cancelFirmwareUpdateOnAccessoryList:(id)a3;
- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4;
- (BOOL)checkForUpdate:(id)a3;
- (BOOL)createUploader;
- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5;
- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4;
- (BOOL)dynamicAssetAvailableForAccessory:(id)a3 assetID:(id)a4 error:(id *)a5;
- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)getAttestationCertificates:(id)a3 assetLocationType:(int64_t)a4;
- (BOOL)getAttestationCertificatesInternal:(id)a3 assetID:(id)a4;
- (BOOL)getBatchedSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4;
- (BOOL)getSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4;
- (BOOL)getSupportedAccessoriesInternal:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (BOOL)pauseAssetTransfersForAccessory:(id)a3;
- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)registerForAssetAvailabilityNotification:(id)a3;
- (BOOL)registerForAttestationCertificatesAvailability:(id)a3;
- (BOOL)registerForGenericNotification:(id)a3 notificationName:(id)a4;
- (BOOL)registerForSupplementalAssetAvailabilityNotification:(id)a3;
- (BOOL)registerForSupportedAccessoriesAvailability:(id)a3;
- (BOOL)removeAccessory:(id)a3;
- (BOOL)requestConsent:(id)a3;
- (BOOL)rescindStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4;
- (BOOL)resumeAssetTransfersForAccessory:(id)a3;
- (BOOL)revokeConsentRequest:(id)a3;
- (BOOL)solicitDynamicAsset:(id)a3 assetID:(id)a4;
- (BOOL)stageFirmwareUpdateOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4;
- (BOOL)startPacketCapture:(id)a3;
- (BOOL)startTapToRadar:(id)a3;
- (BOOL)triggerUnsolicitedDynamicAsset:(id)a3 assetTag:(id)a4;
- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (NSArray)accessoryList;
- (UARPController)init;
- (UARPControllerDelegateProtocol)delegate;
- (id)assetAvailabilityTokenForAccessory:(id)a3;
- (id)createSupportedAccessory:(id)a3 accessoryMetadata:(id)a4;
- (id)pendingAssetForAccessory:(id)a3 assetID:(id)a4;
- (id)pendingTatsuRequests;
- (id)supplementalAssetAvailabilityTokenForAccessory:(id)a3;
- (id)unsolicitedDynamicAssetOffered:(id)a3 assetID:(id)a4;
- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4;
- (int64_t)queryPropertyInternal:(unint64_t)a3 forAccessory:(id)a4;
- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4;
- (void)assetAvailabilityNotificationPosted:(int)a3;
- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)assetStagingPause:(id)a3;
- (void)assetStagingResume:(id)a3;
- (void)availabilityNotificationForAttestationCertificatesPosted:(int)a3;
- (void)availabilityNotificationForSupportedAccessoriesPosted:(int)a3;
- (void)createUploader;
- (void)dealloc;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7;
- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5;
- (void)genericNotificationPosted:(int)a3;
- (void)handleReceivedAttestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4;
- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryFirmwareUpdateResultForAccessory:(id)a3;
- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)setChipInfoDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPowerLogStagingWindowPeriodSeconds:(unsigned int)a3;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)startPersonalizationHelperService:(id)a3 entitlement:(id)a4;
- (void)stopPacketCapture;
- (void)stopTapToRadar;
- (void)supplementalAssetAvailabilityNotificationPosted:(int)a3;
- (void)supplementalAssetAvailablityUpdateForAccessory:(id)a3 assetName:(id)a4;
- (void)supplementalAssetAvailablityUpdateForAccessoryID:(id)a3 assetName:(id)a4;
- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
- (void)tssResponse:(id)a3;
- (void)unregisterForAllAssetAvailabilityNotifications;
- (void)unregisterForAllAttestationCertificatesAvailabilityNotifications;
- (void)unregisterForAllGenericNotifications;
- (void)unregisterForAllSupplementalAssetAvailabilityNotifications;
- (void)unregisterForAssetAvailabilityNotification:(id)a3;
- (void)unregisterForAttestationCertificatesAvailability:(int)a3;
- (void)unregisterForSupplementalAssetAvailabilityNotification:(id)a3;
- (void)unregisterForSupportedAccessoriesAvailability:(int)a3;
- (void)updatePendingAssetsForAccessory:(id)a3 assetID:(id)a4;
@end

@implementation UARPController

- (UARPController)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___UARPController;
  v2 = -[UARPController init](&v32, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FC8] dictionary];
    accessories = v2->_accessories;
    v2->_accessories = (NSMutableDictionary *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x189603F30]);
    assetCache = v2->_assetCache;
    v2->_assetCache = v5;

    dispatch_queue_t v7 = dispatch_queue_create("UARPController internal", 0LL);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("UARPController delegate", 0LL);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v9;

    os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    xpcLog = v2->_xpcLog;
    v2->_xpcLog = v11;

    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "uarpController");
    controllerLog = v2->_controllerLog;
    v2->_controllerLog = v13;

    v15 = -[UARPControllerXPC initWithController:]( objc_alloc(&OBJC_CLASS___UARPControllerXPC),  "initWithController:",  v2);
    internalDelegate = v2->_internalDelegate;
    v2->_internalDelegate = (UARPControllerInternalDelegate *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___UARPPowerLogManager);
    powerLogManager = v2->_powerLogManager;
    v2->_powerLogManager = v17;

    v19 = -[UARPAnalyticsUpdateFirmwareManager initWithController:queue:]( objc_alloc(&OBJC_CLASS___UARPAnalyticsUpdateFirmwareManager),  "initWithController:queue:",  v2,  v2->_internalQueue);
    updateFirmwareAnalytics = v2->_updateFirmwareAnalytics;
    v2->_updateFirmwareAnalytics = v19;

    uint64_t v21 = [MEMORY[0x189603FC8] dictionary];
    assetAvailabilityNotificationTokenDict = v2->_assetAvailabilityNotificationTokenDict;
    v2->_assetAvailabilityNotificationTokenDict = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x189603FC8] dictionary];
    supplementalAssetAvailabilityNotificationTokenDict = v2->_supplementalAssetAvailabilityNotificationTokenDict;
    v2->_supplementalAssetAvailabilityNotificationTokenDict = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x189603FC8] dictionary];
    assetAvailabilityUARPProductGroupNotificationTokenDict = v2->_assetAvailabilityUARPProductGroupNotificationTokenDict;
    v2->_assetAvailabilityUARPProductGroupNotificationTokenDict = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x189603FC8] dictionary];
    attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = v2->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
    v2->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = (NSMutableDictionary *)v27;

    uint64_t v29 = [MEMORY[0x189603FC8] dictionary];
    generalNotificationTokenDict = v2->_generalNotificationTokenDict;
    v2->_generalNotificationTokenDict = (NSMutableDictionary *)v29;

    v2->_isInternalBuild = MGGetBoolAnswer();
  }

  return v2;
}

- (void)setChipInfoDelegate:(id)a3
{
  v4 = (UARPControllerChipInfoDelegate *)a3;
  obj = self;
  objc_sync_enter(obj);
  chipInfoDelegate = obj->_chipInfoDelegate;
  obj->_chipInfoDelegate = v4;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPController;
  -[UARPController dealloc](&v3, sel_dealloc);
}

- (BOOL)accessoryReachableInternal:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  accessories = self->_accessories;
  [v4 getID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessories, "objectForKeyedSubscript:", v6);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSuppressAutomaticDynamicAssets:", objc_msgSend(v4, "suppressAutomaticDynamicAssets"));
  objc_msgSend(v7, "setSuppressInfoQueries:", objc_msgSend(v4, "suppressInfoQueries"));
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_INFO,  "Accessory reported as reachable %@",  (uint8_t *)&v16,  0xCu);
  }

  if (!-[UARPController createUploader](self, "createUploader")) {
    goto LABEL_12;
  }
  if (v7)
  {
    char v9 = [v7 reachable];
    v10 = self->_controllerLog;
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        int v16 = 138412290;
        id v17 = v7;
        _os_log_impl( &dword_187DC0000,  v10,  OS_LOG_TYPE_INFO,  "Accessory is already reachable %@",  (uint8_t *)&v16,  0xCu);
      }

      goto LABEL_11;
    }

    if (v11)
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Accessory is newly reachable %@", (uint8_t *)&v16, 0xCu);
    }

    [v7 setReachable:1];
    if (-[UARPUploader accessoryReachable:error:](self->_uploader, "accessoryReachable:error:", v4, 0LL)) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }

- (BOOL)accessoryReachable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__UARPController_accessoryReachable___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __37__UARPController_accessoryReachable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessoryReachableInternal:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)accessoryUnreachableInternal:(id)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  accessories = self->_accessories;
  [v4 getID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessories, "objectForKeyedSubscript:", v6);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v4;
    _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "Accessory reported as unreachable %@", buf, 0xCu);
  }

  if (!v7) {
    goto LABEL_20;
  }
  int v9 = [v7 reachable];
  v10 = self->_controllerLog;
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v7;
      BOOL v24 = 1;
      _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Accessory is already unreachable %@", buf, 0xCu);
    }

    else
    {
      BOOL v24 = 1;
    }

    goto LABEL_24;
  }

  if (v11)
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v7;
    _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Accessory is newly unreachable %@", buf, 0xCu);
  }

  if (!-[UARPUploader accessoryUnreachable:error:](self->_uploader, "accessoryUnreachable:error:", v4, 0LL))
  {
LABEL_20:
    BOOL v24 = 0;
    goto LABEL_24;
  }

  id v30 = v4;
  [v7 setReachable:0];
  [v7 pendingAssets];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v17 id];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 getID];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = [v18 isStagingInProgressOnAccessoryID:v19];

        if (v20)
        {
          uint64_t v21 = self->_controllerLog;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v36 = v17;
            __int16 v37 = 2112;
            v38 = v7;
            _os_log_impl( &dword_187DC0000,  v21,  OS_LOG_TYPE_DEFAULT,  "Asset %@ not being staged anymore on %@",  buf,  0x16u);
          }

          [v17 id];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 getID];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 stagingCompleteOnAccessoryID:v23];
        }
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v14);
  }

  BOOL v24 = 1;
  id v4 = v30;
LABEL_24:
  updateFirmwareAnalytics = self->_updateFirmwareAnalytics;
  [v4 getID];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAnalyticsUpdateFirmwareManager setAccessoryIDUnreachable:]( updateFirmwareAnalytics,  "setAccessoryIDUnreachable:",  v26);

  powerLogManager = self->_powerLogManager;
  [v4 getID];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager setAccessoryIDUnreachable:](powerLogManager, "setAccessoryIDUnreachable:", v28);

  return v24;
}

- (BOOL)accessoryUnreachable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__UARPController_accessoryUnreachable___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __39__UARPController_accessoryUnreachable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessoryUnreachableInternal:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (NSArray)accessoryList
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  id v11 = 0LL;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31__UARPController_accessoryList__block_invoke;
  v5[3] = &unk_18A143550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__UARPController_accessoryList__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)stageFirmwareUpdateOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__UARPController_stageFirmwareUpdateOnAccessoryList_withUserIntent___block_invoke;
  block[3] = &unk_18A143578;
  id v11 = v6;
  v12 = self;
  BOOL v13 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);

  return 1;
}

void __68__UARPController_stageFirmwareUpdateOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v28; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v4 = *(os_log_s **)(*(void *)(a1 + 40) + 32LL);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v3;
          _os_log_impl(&dword_187DC0000, v4, OS_LOG_TYPE_INFO, "stage assets for accessory %@", buf, 0xCu);
        }

        [v3 pendingAssets];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v5 count])
        {
          uint64_t v29 = v5;
          uint64_t v30 = i;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v32 = v5;
          uint64_t v6 = [v32 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v34;
            do
            {
              uint64_t v9 = 0LL;
              uint64_t v31 = v7;
              do
              {
                if (*(void *)v34 != v8) {
                  objc_enumerationMutation(v32);
                }
                v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
                [v10 id];
                id v11 = (void *)objc_claimAutoreleasedReturnValue();
                [v3 getID];
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                int v13 = [v11 isStagingInProgressOnAccessoryID:v12];

                char v14 = *(os_log_s **)(*(void *)(a1 + 40) + 32LL);
                if (v13)
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v42 = v10;
                    __int16 v43 = 2112;
                    v44 = v3;
                    _os_log_impl( &dword_187DC0000,  v14,  OS_LOG_TYPE_DEFAULT,  "Asset %@ already being staged on accessory %@",  buf,  0x16u);
                  }
                }

                else
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v42 = v10;
                    __int16 v43 = 2112;
                    v44 = v3;
                    _os_log_impl(&dword_187DC0000, v14, OS_LOG_TYPE_INFO, "staging %@ for accessory %@", buf, 0x16u);
                  }

                  objc_msgSend(v3, "setFirmwareUpdateBytesTotal:", objc_msgSend(v10, "fileLength"));
                  [v10 id];
                  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
                  [v3 getID];
                  int v16 = (void *)objc_claimAutoreleasedReturnValue();
                  [v15 stagingStartedOnAccessoryID:v16];

                  id v17 = *(void **)(*(void *)(a1 + 40) + 88LL);
                  [v3 getID];
                  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                  [v10 id];
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  [v17 stagingStartedForAccessoryID:v18 assetID:v19 userIntent:*(unsigned __int8 *)(a1 + 48)];

                  int v20 = *(void **)(*(void *)(a1 + 40) + 144LL);
                  [v3 getID];
                  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                  [v10 id];
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  [v22 assetVersion];
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                  [v3 firmwareVersion];
                  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
                  [v20 setAssetOfferedForAccessoryID:v21 offeredFirmwareVersion:v23 activeFirmwareVersion:v24];

                  [*(id *)(*(void *)(a1 + 40) + 64) offerAssetToAccessory:v3 asset:v10 error:0];
                  uint64_t v7 = v31;
                }

                ++v9;
              }

              while (v7 != v9);
              uint64_t v7 = [v32 countByEnumeratingWithState:&v33 objects:v45 count:16];
            }

            while (v7);
          }

          id v5 = v29;
          uint64_t i = v30;
        }

        else
        {
          uint64_t v25 = *(os_log_s **)(*(void *)(a1 + 40) + 32LL);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v3;
            _os_log_impl(&dword_187DC0000, v25, OS_LOG_TYPE_INFO, "no assets to stage for accessory %@", buf, 0xCu);
          }
        }
      }

      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }

    while (v28);
  }
}

- (BOOL)applyStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v5 = a3;
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __68__UARPController_applyStagedFirmwareOnAccessoryList_withUserIntent___block_invoke;
  v9[3] = &unk_18A141D18;
  id v10 = v5;
  id v11 = self;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)internalQueue, v9);

  return 1;
}

void __68__UARPController_applyStagedFirmwareOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 40) + 64),  "applyStagedAssetsForAccessory:error:",  *(void *)(*((void *)&v7 + 1) + 8 * v6++),  0,  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (BOOL)rescindStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v5 = a3;
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __70__UARPController_rescindStagedFirmwareOnAccessoryList_withUserIntent___block_invoke;
  v9[3] = &unk_18A141D18;
  id v10 = v5;
  id v11 = self;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)internalQueue, v9);

  return 1;
}

void __70__UARPController_rescindStagedFirmwareOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 40) + 64),  "rescindStagedAssetsForAccessory:error:",  *(void *)(*((void *)&v7 + 1) + 8 * v6++),  0,  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (BOOL)cancelFirmwareUpdateOnAccessoryList:(id)a3
{
  return a3 != 0LL;
}

- (BOOL)cancelFirmwareStagingForAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke;
  v12[3] = &unk_18A1435A0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  [*(id *)(a1 + 32) pendingAssetForAccessory:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(v2 - 8);
  if (v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(v4 + 64) cancelAssetStagingForAccessory:*(void *)(a1 + 40) asset:v3];
  }

  else if (os_log_type_enabled(*(os_log_t *)(v4 + 32), OS_LOG_TYPE_ERROR))
  {
    __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke_cold_1();
  }
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 length])
  {
    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000LL;
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    BOOL v24 = __Block_byref_object_copy__3;
    uint64_t v25 = __Block_byref_object_dispose__3;
    id v26 = 0LL;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __51__UARPController_recvDataFromAccessory_data_error___block_invoke;
    block[3] = &unk_18A1435C8;
    char v19 = &v27;
    void block[4] = self;
    id v17 = v8;
    id v18 = v9;
    int v20 = &v21;
    dispatch_sync((dispatch_queue_t)internalQueue, block);
    if (a5) {
      *a5 = (id) v22[5];
    }
    BOOL v11 = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }

  else
  {
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController recvDataFromAccessory:data:error:].cold.1(controllerLog, v13, v14);
    }
    BOOL v11 = 0;
  }

  return v11;
}

void __51__UARPController_recvDataFromAccessory_data_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 64LL);
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v5 + 40);
  char v6 = [v3 recvDataFromAccessory:v2 data:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v6;
  uint64_t v7 = a1[6];
  if (*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL)) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = 11LL;
  }
  id v9 = (void *)a1[5];
  id v10 = *(void **)(a1[4] + 96LL);
  [v9 getID];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 dump:v7 accessoryID:v11 uarpStatus:v8 direction:1];
}

- (BOOL)accessoryKnown:(id)a3
{
  accessories = self->_accessories;
  [a3 getID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessories, "objectForKeyedSubscript:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(accessories) = v5 != 0LL;

  return (char)accessories;
}

- (BOOL)accessoryIDKnown:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)updatePendingAssetsForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v7 localURL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || [v7 downloadStatus] != 1) {
    goto LABEL_21;
  }
  uint64_t v9 = [v7 updateAvailabilityStatus];

  if (v9 == 3)
  {
    -[UARPController pendingAssetForAccessory:assetID:](self, "pendingAssetForAccessory:assetID:", v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      xpcLog = self->_xpcLog;
      if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315394;
        BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v7;
        _os_log_impl( &dword_187DC0000,  xpcLog,  OS_LOG_TYPE_DEFAULT,  "%s: AssetID %@ already present in accessory's pending list",  (uint8_t *)&v23,  0x16u);
      }

      goto LABEL_21;
    }

    uint64_t v11 = -[NSCache objectForKey:](self->_assetCache, "objectForKey:", v7);
    if (!v11)
    {
      -[UARPControllerInternalDelegate getSandboxExtensionTokenForAssetID:]( self->_internalDelegate,  "getSandboxExtensionTokenForAssetID:",  v7);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = objc_alloc(&OBJC_CLASS___UARPAsset);
      if (v12) {
        uint64_t v14 = -[UARPAsset initWithID:sandboxToken:](v13, "initWithID:sandboxToken:", v7, v12);
      }
      else {
        uint64_t v14 = -[UARPAsset initWithID:](v13, "initWithID:", v7);
      }
      uint64_t v11 = v14;
      if (!v14)
      {
        v22 = self->_xpcLog;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[UARPController updatePendingAssetsForAccessory:assetID:].cold.1(v22);
        }
        goto LABEL_20;
      }

      -[NSCache setObject:forKey:](self->_assetCache, "setObject:forKey:", v14, v7);
    }

    uint64_t v15 = self->_xpcLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      [v6 pendingAssets];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 136315650;
      BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v6;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_impl( &dword_187DC0000,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: Current PendingAssetList for %@: %@",  (uint8_t *)&v23,  0x20u);
    }

    id v18 = self->_xpcLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_187DC0000, v18, OS_LOG_TYPE_DEFAULT, "%s: Adding Asset %@", (uint8_t *)&v23, 0x16u);
    }

    [v6 addPendingAsset:v11];
    char v19 = self->_xpcLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = v19;
      [v6 pendingAssets];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 136315650;
      BOOL v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v6;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      _os_log_impl( &dword_187DC0000,  v20,  OS_LOG_TYPE_DEFAULT,  "%s: Updated PendingAssetList for %@: %@",  (uint8_t *)&v23,  0x20u);
    }

    uint64_t v12 = (void *)v11;
LABEL_20:

LABEL_21:
  }
}

- (id)pendingAssetForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl( &dword_187DC0000,  xpcLog,  OS_LOG_TYPE_DEFAULT,  "%s: Looking for matching asset on pending queue for asset %@",  buf,  0x16u);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  [v6 pendingAssets];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v26 = v6;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v13 id];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 firmwareHash];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 firmwareHash];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v15 isEqualToString:v16];

        id v18 = self->_xpcLog;
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            int v23 = v18;
            [v13 id];
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            __int128 v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
            __int16 v34 = 2112;
            id v35 = v24;
            __int16 v36 = 2112;
            id v37 = v7;
            _os_log_impl(&dword_187DC0000, v23, OS_LOG_TYPE_DEFAULT, "%s: Assets matched %@ and %@", buf, 0x20u);
          }

          id v22 = v13;
          goto LABEL_17;
        }

        if (v19)
        {
          int v20 = v18;
          [v13 id];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          __int128 v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
          __int16 v34 = 2112;
          id v35 = v21;
          __int16 v36 = 2112;
          id v37 = v7;
          _os_log_impl(&dword_187DC0000, v20, OS_LOG_TYPE_DEFAULT, "%s: Assets NOT matched %@ and %@", buf, 0x20u);
        }
      }

      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    id v22 = 0LL;
LABEL_17:
    id v6 = v26;
  }

  else
  {
    id v22 = 0LL;
  }

  return v22;
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 getID];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stagingCompleteOnAccessoryID:v10];

  -[UARPController pendingAssetForAccessory:assetID:](self, "pendingAssetForAccessory:assetID:", v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    [v8 removePendingAsset:v11];
  }
  if (([v9 isDynamicAsset] & 1) == 0)
  {
    updateFirmwareAnalytics = self->_updateFirmwareAnalytics;
    [v8 getID];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:]( updateFirmwareAnalytics,  "stagingCompleteForAccessoryID:assetID:status:",  v13,  v9,  a5);

    powerLogManager = self->_powerLogManager;
    [v8 getID];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 assetVersion];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 firmwareVersion];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:]( powerLogManager,  "setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:",  v15,  v16,  v17,  a5);

    if (self->_isInternalBuild)
    {
      internalDelegate = self->_internalDelegate;
      [v8 getID];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPControllerInternalDelegate stagingCompleteForAccessoryID:assetID:status:]( internalDelegate,  "stagingCompleteForAccessoryID:assetID:status:",  v19,  v9,  a5);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    int v21 = [v9 reportProgressToDelegates];

    if (v21)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke;
      block[3] = &unk_18A1435F0;
      void block[4] = self;
      id v31 = v8;
      id v32 = v9;
      unint64_t v33 = a5;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }
  }

  else
  {
  }

  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    int v24 = [v9 reportProgressToDelegates];

    if (v24)
    {
      __int16 v25 = self->_delegateQueue;
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke_2;
      v26[3] = &unk_18A1435F0;
      v26[4] = self;
      id v27 = v8;
      id v28 = v9;
      unint64_t v29 = a5;
      dispatch_async((dispatch_queue_t)v25, v26);
    }
  }

  else
  {
  }
}

void __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained firmwareUpdateComplete:a1[5] assetID:a1[6] withStatus:a1[7]];
}

void __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained firmwareStagingComplete:a1[5] assetID:a1[6] withStatus:a1[7]];
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __63__UARPController_stagedFirmwareApplicationComplete_withStatus___block_invoke;
    block[3] = &unk_18A1431B8;
    void block[4] = self;
    id v11 = v6;
    unint64_t v12 = a4;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
}

void __63__UARPController_stagedFirmwareApplicationComplete_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained stagedFirmwareApplicationComplete:a1[5] withStatus:a1[6]];
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __59__UARPController_stagedFirmwareRescindComplete_withStatus___block_invoke;
    block[3] = &unk_18A1431B8;
    void block[4] = self;
    id v11 = v6;
    unint64_t v12 = a4;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
}

void __59__UARPController_stagedFirmwareRescindComplete_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained stagedFirmwareRescindComplete:a1[5] withStatus:a1[6]];
}

- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  return -[UARPControllerInternalDelegate personalizationVectorForAccessory:assetTag:outVector:]( self->_internalDelegate,  "personalizationVectorForAccessory:assetTag:outVector:",  a3,  *(void *)&a4,  a5);
}

- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
}

- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  char v11 = 0;
  switch(a3)
  {
    case 0uLL:
      [v9 setManufacturer:v8];
      goto LABEL_15;
    case 1uLL:
      [v9 setModelName:v8];
      goto LABEL_15;
    case 2uLL:
      [v9 setSerialNumber:v8];
      goto LABEL_15;
    case 3uLL:
      [v9 setHwRevision:v8];
      goto LABEL_15;
    case 4uLL:
      [v9 setFirmwareVersion:v8];
      powerLogManager = self->_powerLogManager;
      [v10 getID];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPPowerLogManager setActiveFirmwareVersionForAccessoryID:activeFirmwareVersion:]( powerLogManager,  "setActiveFirmwareVersionForAccessoryID:activeFirmwareVersion:",  v13,  v8);
      goto LABEL_10;
    case 5uLL:
      [v9 setStagedFirmwareVersion:v8];
      uint64_t v14 = self->_powerLogManager;
      [v10 getID];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPPowerLogManager setStagedFirmwareVersionForAccessoryID:stagedFirmwareVersion:]( v14,  "setStagedFirmwareVersionForAccessoryID:stagedFirmwareVersion:",  v13,  v8);
LABEL_10:

      goto LABEL_15;
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      goto LABEL_16;
    case 7uLL:
      [v9 setProductGroup:v8];
      goto LABEL_15;
    case 8uLL:
      [v9 setProductNumber:v8];
      goto LABEL_15;
    case 0xCuLL:
      [v9 setHwFusingType:v8];
      goto LABEL_15;
    case 0xDuLL:
      [v9 setFriendlyName:v8];
      goto LABEL_15;
    default:
      if (a3 != 35) {
        goto LABEL_16;
      }
LABEL_15:
      char v11 = -[UARPControllerInternalDelegate updateProperty:value:forAccessory:]( self->_internalDelegate,  "updateProperty:value:forAccessory:",  a3,  v8,  v10);
LABEL_16:

      return v11;
  }

- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4
{
  id v6 = a3;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = __Block_byref_object_copy__3;
  v12[4] = __Block_byref_object_dispose__3;
  [MEMORY[0x189603F48] dataWithData:a4];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v10 = v6;
  char v11 = v12;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)delegateQueue, block);

  _Block_object_dispose(v12, 8);
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  id v15 = 0LL;
  char v5 = [WeakRetained sendMessageToAccessory:v3 uarpMsg:v4 error:&v15];
  id v6 = v15;

  if ((v5 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_cold_1();
    }
  }

  uint64_t v8 = a1[4];
  id v9 = *(dispatch_queue_s **)(v8 + 40);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_24;
  block[3] = &unk_18A143618;
  char v14 = v5;
  void block[4] = v8;
  __int128 v11 = *(_OWORD *)(a1 + 5);
  id v10 = (id)v11;
  __int128 v13 = v11;
  dispatch_async(v9, block);
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_24(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56)) {
    uint64_t v1 = 0LL;
  }
  else {
    uint64_t v1 = 11LL;
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 96LL);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  [*(id *)(a1 + 40) getID];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 dump:v3 accessoryID:v4 uarpStatus:v1 direction:0];
}

- (BOOL)startPacketCapture:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__UARPController_startPacketCapture___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __37__UARPController_startPacketCapture___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 96LL))
  {
    uint64_t v2 = -[UARPPacketDumper initWithFileName:](objc_alloc(&OBJC_CLASS___UARPPacketDumper), "initWithFileName:", a1[5]);
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = *(void *)(a1[4] + 96LL) != 0LL;
  }

- (void)stopPacketCapture
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__UARPController_stopPacketCapture__block_invoke;
  block[3] = &unk_18A143168;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

void __35__UARPController_stopPacketCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = 0LL;
}

- (BOOL)solicitDynamicAsset:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  [v7 localURL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __46__UARPController_solicitDynamicAsset_assetID___block_invoke;
    v12[3] = &unk_18A1435A0;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    id v15 = &v16;
    dispatch_sync((dispatch_queue_t)internalQueue, v12);
    BOOL v10 = *((_BYTE *)v17 + 24) != 0;
  }

  else
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController solicitDynamicAsset:assetID:].cold.1();
    }
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __46__UARPController_solicitDynamicAsset_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    char v5 = (void *)(a1 + 48);
    [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 48)];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) solicitDynamicAssetForAccessory:*(void *)(a1 + 40) asset:v6 error:0];

      goto LABEL_6;
    }

    id v7 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", *(void *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      id v6 = v7;
      [*(id *)(v8 + 16) setObject:v7 forKey:*v5];
      goto LABEL_5;
    }

    id v9 = *(void **)(v8 + 24);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1((uint64_t)v5, v9);
    }
  }

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  -[UARPController pendingAssetForAccessory:assetID:](self, "pendingAssetForAccessory:assetID:", v8, v9);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    [v8 removePendingAsset:v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    int v12 = [v9 reportProgressToDelegates];

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __63__UARPController_assetSolicitationComplete_assetID_withStatus___block_invoke;
      v14[3] = &unk_18A1435F0;
      v14[4] = self;
      id v15 = v8;
      id v16 = v9;
      unint64_t v17 = a5;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
  }

  else
  {
  }
}

void __63__UARPController_assetSolicitationComplete_assetID_withStatus___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained assetSolicitationComplete:a1[5] assetID:a1[6] withStatus:a1[7]];
}

- (BOOL)dynamicAssetAvailableForAccessory:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = __Block_byref_object_copy__3;
  int v24 = __Block_byref_object_dispose__3;
  id v25 = 0LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke;
  block[3] = &unk_18A143640;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  uint64_t v18 = &v26;
  char v19 = &v20;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    char v5 = (void *)(a1 + 48);
    [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 48)];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      uint64_t v9 = *(void *)(a1 + 40);
      BOOL v10 = *(void **)(*(void *)(a1 + 32) + 64LL);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id obj = *(id *)(v11 + 40);
      char v12 = [v10 offerDynamicAssetToAccessory:v9 asset:v6 error:&obj];
      objc_storeStrong((id *)(v11 + 40), obj);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v12;

      goto LABEL_6;
    }

    id v7 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", *(void *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      id v6 = v7;
      [*(id *)(v8 + 16) setObject:v7 forKey:*v5];
      goto LABEL_5;
    }

    char v13 = *(void **)(v8 + 24);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke_cold_1((uint64_t)v5, v13);
    }
  }

- (BOOL)triggerUnsolicitedDynamicAsset:(id)a3 assetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __58__UARPController_triggerUnsolicitedDynamicAsset_assetTag___block_invoke;
  v12[3] = &unk_18A143668;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __58__UARPController_triggerUnsolicitedDynamicAsset_assetTag___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) unsolicitedDynamicAssetForAccessory:*(void *)(a1 + 40) assetTag:*(void *)(a1 + 48) error:0];
  }
}

- (void)setPowerLogStagingWindowPeriodSeconds:(unsigned int)a3
{
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v34 = "-[UARPController assetAvailablityUpdateForAccessory:assetID:]";
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_187DC0000, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }

  uint64_t v9 = [v7 assetVersion];
  if (!v9) {
    goto LABEL_6;
  }
  id v10 = (void *)v9;
  [v6 stagedFirmwareVersion];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_6;
  }
  [v6 stagedFirmwareVersion];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 assetVersion];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = uarpVersionCompareStrings((uint64_t)v12, v13);

  if (v14 != 1)
  {
    id v23 = self->_xpcLog;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = v23;
      [v7 assetVersion];
      id v25 = (char *)objc_claimAutoreleasedReturnValue();
      [v6 stagedFirmwareVersion];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      __int16 v34 = v25;
      __int16 v35 = 2112;
      id v36 = v26;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl( &dword_187DC0000,  v24,  OS_LOG_TYPE_DEFAULT,  "assetID assetVersion %@ is not greater than staged version %@ for accessory %@",  buf,  0x20u);
    }
  }

  else
  {
LABEL_6:
    [v7 assetVersion];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setAvailableFirmwareVersion:v15];

    -[UARPController updatePendingAssetsForAccessory:assetID:](self, "updatePendingAssetsForAccessory:assetID:", v6, v7);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    uint64_t v18 = MEMORY[0x1895F87A8];
    if ((v17 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke;
      block[3] = &unk_18A143690;
      void block[4] = self;
      id v31 = v6;
      id v32 = v7;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }

    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      uint64_t v22 = self->_delegateQueue;
      v27[0] = v18;
      v27[1] = 3221225472LL;
      v27[2] = __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke_2;
      v27[3] = &unk_18A143690;
      v27[4] = self;
      id v28 = v6;
      id v29 = v7;
      dispatch_async((dispatch_queue_t)v22, v27);
    }
  }
}

void __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained assetAvailablityUpdateForAccessory:a1[5] assetID:a1[6]];
}

void __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained assetAvailablityUpdateForAccessoryID:a1[5] assetID:a1[6]];
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke;
  block[3] = &unk_18A143690;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

void __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 5;
  [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (os_log_t *)*(v2 - 1);
  if (v3)
  {
    -[os_log_t assetAvailablityUpdateForAccessory:assetID:]( v4,  "assetAvailablityUpdateForAccessory:assetID:",  v3,  a1[6]);
  }

  else if (os_log_type_enabled(v4[3], OS_LOG_TYPE_ERROR))
  {
    __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke_cold_1();
  }
}

- (void)supplementalAssetAvailablityUpdateForAccessory:(id)a3 assetName:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[UARPController supplementalAssetAvailablityUpdateForAccessory:assetName:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_187DC0000, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75__UARPController_supplementalAssetAvailablityUpdateForAccessory_assetName___block_invoke;
  block[3] = &unk_18A143690;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)internalQueue, block);
}

uint64_t __75__UARPController_supplementalAssetAvailablityUpdateForAccessory_assetName___block_invoke( void *a1)
{
  return [*(id *)(a1[4] + 64) supplementalAssetUpdated:a1[5] assetName:a1[6] error:0];
}

- (void)supplementalAssetAvailablityUpdateForAccessoryID:(id)a3 assetName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke;
  block[3] = &unk_18A143690;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

void __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke( void *a1)
{
  uint64_t v2 = a1 + 5;
  [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (os_log_t *)*(v2 - 1);
  if (v3)
  {
    -[os_log_t supplementalAssetAvailablityUpdateForAccessory:assetName:]( v4,  "supplementalAssetAvailablityUpdateForAccessory:assetName:",  v3,  a1[6]);
  }

  else if (os_log_type_enabled(v4[3], OS_LOG_TYPE_ERROR))
  {
    __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke_cold_1();
  }
}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        -[UARPController createSupportedAccessory:accessoryMetadata:]( self,  "createSupportedAccessory:accessoryMetadata:",  v9,  *(void *)(*((void *)&v24 + 1) + 8 * v15));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16) {
          [v10 addObject:v16];
        }

        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }

  if (![v10 count])
  {

    id v10 = 0LL;
  }

  delegateQueue = self->_delegateQueue;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke;
  v20[3] = &unk_18A1436B8;
  v20[4] = self;
  id v21 = v10;
  id v22 = v9;
  BOOL v23 = a5;
  id v18 = v9;
  id v19 = v10;
  dispatch_async((dispatch_queue_t)delegateQueue, v20);
}

void __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
  char v3 = objc_opt_respondsToSelector();

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
  id v10 = v4;
  if ((v3 & 1) != 0)
  {
    [v4 supportedAccessories:*(void *)(a1 + 40) forProductGroup:*(void *)(a1 + 48) isComplete:*(unsigned __int8 *)(a1 + 56)];
LABEL_5:

    return;
  }

  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = *(void *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    id v10 = objc_loadWeakRetained((id *)(v6 + 168));
    [v10 supportedAccessories:*(void *)(a1 + 40) forProductGroup:*(void *)(a1 + 48)];
    goto LABEL_5;
  }

  id v7 = *(os_log_s **)(v6 + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke_cold_1(v7, v8, v9);
  }
}

- (void)handleReceivedAttestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __80__UARPController_handleReceivedAttestationCertificates_forSubjectKeyIdentifier___block_invoke;
  block[3] = &unk_18A143690;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)delegateQueue, block);
}

void __80__UARPController_handleReceivedAttestationCertificates_forSubjectKeyIdentifier___block_invoke( void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained attestationCertificates:a1[5] forSubjectKeyIdentifier:a1[6]];
}

- (id)createSupportedAccessory:(id)a3 accessoryMetadata:(id)a4
{
  id v4 = a4;
  if ([v4 accessoryCapability] == 16)
  {
    char v5 = objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareCHIP);
    [v4 productGroup];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int16 v7 = [v6 integerValue];
    [v4 productNumber];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[UARPAccessoryHardwareCHIP initWithVendorID:productID:hardwareID:metadata:]( v5,  "initWithVendorID:productID:hardwareID:metadata:",  v7,  (unsigned __int16)[v8 integerValue],  0,  v4);

    id v10 = objc_alloc(&OBJC_CLASS___UARPSupportedAccessory);
    [v4 productGroup];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 productNumber];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[UARPSupportedAccessory initWithHardwareID:productGroup:productNumber:capabilities:]( v10,  "initWithHardwareID:productGroup:productNumber:capabilities:",  v9,  v11,  v12,  [v4 accessoryCapability]);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (void)queryFirmwareUpdateResultForAccessory:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__UARPController_queryFirmwareUpdateResultForAccessory___block_invoke;
  v7[3] = &unk_18A141D18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)internalQueue, v7);
}

uint64_t __56__UARPController_queryFirmwareUpdateResultForAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) queryFirmwareUpdateResultForAccessory:*(void *)(a1 + 40)];
}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __45__UARPController_queryProperty_forAccessory___block_invoke;
  v11[3] = &unk_18A1436E0;
  id v13 = &v15;
  unint64_t v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v11);
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __45__UARPController_queryProperty_forAccessory___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) queryPropertyInternal:*(void *)(a1 + 56) forAccessory:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    return [*(id *)(a1 + 40) addPendingClientPropertyQuery:*(void *)(a1 + 56)];
  }
  return result;
}

- (int64_t)queryPropertyInternal:(unint64_t)a3 forAccessory:(id)a4
{
  return -[UARPUploader queryProperty:forAccessory:](self->_uploader, "queryProperty:forAccessory:", a3, a4);
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __66__UARPController_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke;
  v13[3] = &unk_18A143708;
  v13[4] = self;
  id v14 = v8;
  unsigned int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)delegateQueue, v13);
}

void __66__UARPController_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
    [v4 firmwareUpdateResult:*(void *)(a1 + 40) vendorSpecificStatus:*(unsigned int *)(a1 + 56) error:*(void *)(a1 + 48)];
  }

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 0LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __63__UARPController_queryCompleteForAccessory_manufacturer_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 0, v15, v16, v17, v18, v19);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_manufacturer_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] manufacturer:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 1LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:1])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __60__UARPController_queryCompleteForAccessory_modelName_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 1, v15, v16, v17, v18, v19);
    }
  }
}

void __60__UARPController_queryCompleteForAccessory_modelName_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] modelName:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 4LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __66__UARPController_queryCompleteForAccessory_firmwareVersion_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 4, v15, v16, v17, v18, v19);
    }
  }
}

void __66__UARPController_queryCompleteForAccessory_firmwareVersion_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] firmwareVersion:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 5LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:5])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __72__UARPController_queryCompleteForAccessory_stagedFirmwareVersion_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 5, v15, v16, v17, v18, v19);
    }
  }
}

void __72__UARPController_queryCompleteForAccessory_stagedFirmwareVersion_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] stagedFirmwareVersion:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 clientQueryPendingForProperty:6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __56__UARPController_queryCompleteForAccessory_stats_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 6, v15, v16, v17, v18, v19);
    }
  }
}

void __56__UARPController_queryCompleteForAccessory_stats_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] stats:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 3LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __66__UARPController_queryCompleteForAccessory_hardwareVersion_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 3, v15, v16, v17, v18, v19);
    }
  }
}

void __66__UARPController_queryCompleteForAccessory_hardwareVersion_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] hardwareVersion:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 2LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:2])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __63__UARPController_queryCompleteForAccessory_serialNumber_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 2, v15, v16, v17, v18, v19);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_serialNumber_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] serialNumber:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 11LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:11])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __67__UARPController_queryCompleteForAccessory_appleModelNumber_error___block_invoke;
      id v18 = &unk_18A143730;
      id v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 11, v15, v16, v17, v18, v19);
    }
  }
}

void __67__UARPController_queryCompleteForAccessory_appleModelNumber_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] appleModelNumber:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  [v8 modelNumber];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v11);
  char v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_isInternalBuild
    && -[__CFString isEqualToString:](v9, "isEqualToString:", @"unfused")
    && ([v12 fusingOverrideUnfused],
        id v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    [v12 fusingOverrideUnfused];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 isEqualToString:@"dev"];

    if (v15) {
      uint64_t v16 = @"dev";
    }
    else {
      uint64_t v16 = @"prod";
    }
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = v9;
      __int16 v34 = 2114;
      __int16 v35 = v16;
      _os_log_error_impl( &dword_187DC0000,  xpcLog,  OS_LOG_TYPE_ERROR,  "Overriding hw fusing for %{public}@, from %{public}@ to %{public}@",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v16 = v9;
  }

  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 12LL, v16, v8);
  if ([v8 clientQueryPendingForProperty:12])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v22 = MEMORY[0x1895F87A8];
      uint64_t v23 = 3221225472LL;
      __int128 v24 = __63__UARPController_queryCompleteForAccessory_hwFusingType_error___block_invoke;
      __int128 v25 = &unk_18A143730;
      __int128 v26 = self;
      id v21 = v8;
      id v27 = v21;
      id v28 = v16;
      id v29 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v22);
      objc_msgSend(v21, "removePendingClientPropertyQuery:", 12, v22, v23, v24, v25, v26);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_hwFusingType_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] hwFusingType:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 13LL, v9, v8);
  if ([v8 clientQueryPendingForProperty:13])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __63__UARPController_queryCompleteForAccessory_friendlyName_error___block_invoke;
      id v18 = &unk_18A143730;
      char v19 = self;
      id v14 = v8;
      id v20 = v14;
      id v21 = v9;
      id v22 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 13, v15, v16, v17, v18, v19);
    }
  }
}

void __63__UARPController_queryCompleteForAccessory_friendlyName_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained queryCompleteForAccessory:a1[5] friendlyName:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 clientQueryPendingForProperty:14]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v13 = MEMORY[0x1895F87A8];
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = __65__UARPController_queryCompleteForAccessory_manifestPrefix_error___block_invoke;
    uint64_t v16 = &unk_18A143730;
    uint64_t v17 = self;
    id v12 = v8;
    id v18 = v12;
    id v19 = v9;
    id v20 = v10;
    dispatch_async((dispatch_queue_t)delegateQueue, &v13);
    objc_msgSend(v12, "removePendingClientPropertyQuery:", 14, v13, v14, v15, v16, v17);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_manifestPrefix_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] manifestPrefix:a1[6] error:a1[7]];
}

- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:15]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __58__UARPController_queryCompleteForAccessory_boardID_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 15, v12, v13, v14, v15, v16);
  }
}

uint64_t __58__UARPController_queryCompleteForAccessory_boardID_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] boardID:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:16]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __57__UARPController_queryCompleteForAccessory_chipID_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 16, v12, v13, v14, v15, v16);
  }
}

uint64_t __57__UARPController_queryCompleteForAccessory_chipID_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] chipID:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:17]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __63__UARPController_queryCompleteForAccessory_chipRevision_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 17, v12, v13, v14, v15, v16);
  }
}

uint64_t __63__UARPController_queryCompleteForAccessory_chipRevision_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] chipRevision:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:18]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __55__UARPController_queryCompleteForAccessory_ecid_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 18, v12, v13, v14, v15, v16);
  }
}

uint64_t __55__UARPController_queryCompleteForAccessory_ecid_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] ecid:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:19]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_securityDomain_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 19, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_securityDomain_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] securityDomain:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:20]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __63__UARPController_queryCompleteForAccessory_securityMode_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 20, v12, v13, v14, v15, v16);
  }
}

uint64_t __63__UARPController_queryCompleteForAccessory_securityMode_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] securityMode:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:21]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_productionMode_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 21, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_productionMode_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] productionMode:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:22]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __56__UARPController_queryCompleteForAccessory_epoch_error___block_invoke;
    uint64_t v15 = &unk_18A1435F0;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    unint64_t v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 22, v12, v13, v14, v15, v16);
  }
}

uint64_t __56__UARPController_queryCompleteForAccessory_epoch_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 80) queryCompleteForAccessory:a1[5] epoch:a1[7] error:a1[6]];
}

- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:23]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_enableMixMatch_error___block_invoke;
    uint64_t v15 = &unk_18A1436B8;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 23, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_enableMixMatch_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) enableMixMatch:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:24]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __60__UARPController_queryCompleteForAccessory_liveNonce_error___block_invoke;
    uint64_t v15 = &unk_18A1436B8;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 24, v12, v13, v14, v15, v16);
  }
}

uint64_t __60__UARPController_queryCompleteForAccessory_liveNonce_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) liveNonce:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:25]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_prefixNeedsLUN_error___block_invoke;
    uint64_t v15 = &unk_18A1436B8;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 25, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_prefixNeedsLUN_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) prefixNeedsLUN:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 clientQueryPendingForProperty:26]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __65__UARPController_queryCompleteForAccessory_suffixNeedsLUN_error___block_invoke;
    uint64_t v15 = &unk_18A1436B8;
    uint64_t v16 = self;
    id v11 = v8;
    id v17 = v11;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 26, v12, v13, v14, v15, v16);
  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_suffixNeedsLUN_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) queryCompleteForAccessory:*(void *)(a1 + 40) suffixNeedsLUN:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    int v15 = [v13 reportProgressToDelegates];

    if (v15)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __86__UARPController_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress___block_invoke;
      block[3] = &unk_18A143758;
      void block[4] = self;
      id v18 = v12;
      id v19 = v13;
      unint64_t v20 = a5;
      unint64_t v21 = a6;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }
  }

  else
  {
  }

  if (!a7) {
    -[UARPControllerInternalDelegate sendFirmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:]( self->_internalDelegate,  "sendFirmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:",  v12,  v13,  a5,  a6);
  }
}

void __86__UARPController_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress___block_invoke( void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained firmwareStagingProgress:a1[5] assetID:a1[6] bytesSent:a1[7] bytesTotal:a1[8]];
}

- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  powerLogManager = self->_powerLogManager;
  [a3 getID];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager updateStagingProgressForAccessoryID:requestedOffset:requestedLength:]( powerLogManager,  "updateStagingProgressForAccessoryID:requestedOffset:requestedLength:",  v9,  v7,  v6);
}

- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    int v13 = [v11 reportProgressToDelegates];

    if (v13)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __77__UARPController_assetSolicitationProgress_assetID_bytesReceived_bytesTotal___block_invoke;
      block[3] = &unk_18A143758;
      void block[4] = self;
      id v16 = v10;
      id v17 = v11;
      unint64_t v18 = a5;
      unint64_t v19 = a6;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }
  }

  else
  {
  }
}

void __77__UARPController_assetSolicitationProgress_assetID_bytesReceived_bytesTotal___block_invoke( void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168LL));
  [WeakRetained assetSolicitationProgress:a1[5] assetID:a1[6] bytesReceived:a1[7] bytesTotal:a1[8]];
}

- (id)unsolicitedDynamicAssetOffered:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  unint64_t v20 = __Block_byref_object_copy__3;
  unint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0LL;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __57__UARPController_unsolicitedDynamicAssetOffered_assetID___block_invoke;
  v13[3] = &unk_18A143668;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __57__UARPController_unsolicitedDynamicAssetOffered_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    char v5 = (void *)(a1 + 48);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
      id v9 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", *(void *)(a1 + 48));
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      uint64_t v13 = *(void *)(a1 + 32);
      if (v12)
      {
        [*(id *)(v13 + 16) setObject:v12 forKey:*v5];
      }

      else
      {
        id v14 = *(void **)(v13 + 24);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
          __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1((uint64_t)v5, v14);
        }
      }
    }
  }
}

- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  id v6 = a3;
  if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
    -[UARPController accessoryTransportNeeded:isNeeded:].cold.1();
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke;
  block[3] = &unk_18A143578;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

void __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      id v9 = *(dispatch_queue_s **)(v7 + 48);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke_2;
      block[3] = &unk_18A143578;
      void block[4] = v7;
      id v11 = v8;
      char v12 = *(_BYTE *)(a1 + 48);
      dispatch_async(v9, block);
    }
  }
}

void __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
  [WeakRetained accessoryTransportNeeded:*(void *)(a1 + 40) isNeeded:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)addAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __39__UARPController_addAccessory_assetID___block_invoke;
  v12[3] = &unk_18A143780;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __39__UARPController_addAccessory_assetID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) addAccessory:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    char v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
    [v2 getID];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v2 forKeyedSubscript:v4];

    if ([*(id *)(*(void *)(a1 + 32) + 72) useAssetAvailabilityNotifications])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForAssetAvailabilityNotification:*(void *)(a1 + 40)];
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
        [*(id *)(a1 + 32) removeAccessory:*(void *)(a1 + 40)];
      }
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForSupplementalAssetAvailabilityNotification:*(void *)(a1 + 40)];
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
        [*(id *)(a1 + 32) removeAccessory:*(void *)(a1 + 40)];
      }
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    [*(id *)(a1 + 40) bsdNotifications];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v18;
      *(void *)&__int128 v7 = 138412290LL;
      __int128 v16 = v7;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          char v12 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_debug_impl(&dword_187DC0000, v12, OS_LOG_TYPE_DEBUG, "registering bsd notification; %@", buf, 0xCu);
          }

          objc_msgSend( *(id *)(a1 + 32),  "registerForGenericNotification:notificationName:",  *(void *)(a1 + 40),  v11,  v16);
        }

        uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v8);
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      id v13 = *(void **)(a1 + 40);
      id v14 = *(void **)(*(void *)(a1 + 32) + 144LL);
      [v13 getID];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 addAccessoryID:v15];
    }
  }

- (BOOL)removeAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__UARPController_removeAccessory___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __34__UARPController_removeAccessory___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) removeAccessory:*(void *)(a1 + 40)];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 32) accessoryUnreachableInternal:*(void *)(a1 + 40)];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
    [*(id *)(a1 + 40) getID];
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 removeObjectForKey:v3];

    [*(id *)(a1 + 32) unregisterForAssetAvailabilityNotification:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) unregisterForSupplementalAssetAvailabilityNotification:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 40);
    char v5 = *(void **)(*(void *)(a1 + 32) + 144LL);
    [v4 getID];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v5 removeAccessoryID:v6];
  }

- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  __int128 v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __46__UARPController_changeAssetLocation_assetID___block_invoke;
  v12[3] = &unk_18A143780;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

uint64_t __46__UARPController_changeAssetLocation_assetID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) changeAssetLocation:a1[5] assetID:a1[6]];
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)requestConsent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__UARPController_requestConsent___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __33__UARPController_requestConsent___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) requestConsent:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)revokeConsentRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__UARPController_revokeConsentRequest___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __39__UARPController_revokeConsentRequest___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) revokeConsentRequest:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__UARPController_pauseAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __50__UARPController_pauseAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v5;
  if (v5)
  {
    if ([v5 assetTransfersPaused])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
LABEL_6:
      id v4 = v5;
      goto LABEL_7;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) pauseAssetTransfersForAccessory:*(void *)(a1 + 40)];
    id v4 = v5;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      [v5 setAssetTransfersPaused:1];
      goto LABEL_6;
    }
  }

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__UARPController_resumeAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __51__UARPController_resumeAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) getID];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v5;
  if (v5)
  {
    if (![v5 assetTransfersPaused])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      goto LABEL_6;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 64) resumeAssetTransfersForAccessory:*(void *)(a1 + 40)];
    id v4 = v5;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      [v5 setAssetTransfersPaused:0];
LABEL_6:
      id v4 = v5;
    }
  }
}

- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73__UARPController_downloadAvailableFirmwareUpdate_assetID_withUserIntent___block_invoke;
  block[3] = &unk_18A1437A8;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  __int128 v17 = &v19;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)internalQueue;
}

uint64_t __73__UARPController_downloadAvailableFirmwareUpdate_assetID_withUserIntent___block_invoke( uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) downloadAvailableFirmwareUpdate:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) withUserIntent:*(unsigned __int8 *)(a1 + 64)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  __int128 v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __47__UARPController_downloadReleaseNotes_assetID___block_invoke;
  v12[3] = &unk_18A143780;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

uint64_t __47__UARPController_downloadReleaseNotes_assetID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) downloadReleaseNotes:a1[5] assetID:a1[6]];
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = result;
  return result;
}

- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__UARPController_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_18A143758;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

uint64_t __86__UARPController_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal___block_invoke( void *a1)
{
  return [*(id *)(a1[4] + 72) sendFirmwareUpdateProgressForAccessory:a1[5] assetID:a1[6] bytesSent:a1[7] bytesTotal:a1[8]];
}

- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __80__UARPController_sendFirmwareUpdateProgressForUARPConsent_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_18A1437D0;
  void block[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

uint64_t __80__UARPController_sendFirmwareUpdateProgressForUARPConsent_bytesSent_bytesTotal___block_invoke( void *a1)
{
  return [*(id *)(a1[4] + 72) sendFirmwareUpdateProgressForUARPConsent:a1[5] bytesSent:a1[6] bytesTotal:a1[7]];
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__UARPController_progressForUARPConsent_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_18A1437D0;
  void block[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

uint64_t __62__UARPController_progressForUARPConsent_bytesSent_bytesTotal___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 72) progressForUARPConsent:a1[5] bytesSent:a1[6] bytesTotal:a1[7]];
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __74__UARPController_progressForUARPConsentInPostLogout_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_18A1437D0;
  void block[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

uint64_t __74__UARPController_progressForUARPConsentInPostLogout_bytesSent_bytesTotal___block_invoke( void *a1)
{
  return [*(id *)(a1[4] + 72) progressForUARPConsentInPostLogout:a1[5] bytesSent:a1[6] bytesTotal:a1[7]];
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__UARPController_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __66__UARPController_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) enableTRMSystemAuthenticationForRegistryEntryID:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__UARPController_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __67__UARPController_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) disableTRMSystemAuthenticationForRegistryEntryID:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)checkForUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__UARPController_checkForUpdate___block_invoke;
  block[3] = &unk_18A143528;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __33__UARPController_checkForUpdate___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) checkForUpdate:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
}

- (BOOL)getSupportedAccessoriesInternal:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke;
  block[3] = &unk_18A1437A8;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = &v19;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)internalQueue;
}

void __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72LL);
  [*(id *)(a1 + 40) identifier];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 getSupportedAccessories:v3 assetID:*(void *)(a1 + 48) batchRequest:*(unsigned __int8 *)(a1 + 64)];

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 72) useAssetAvailabilityNotifications])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForSupportedAccessoriesAvailability:*(void *)(a1 + 40)];
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)
        && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 32LL), OS_LOG_TYPE_ERROR))
      {
        __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke_cold_1();
      }
    }
  }

- (BOOL)getSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = -[UARPAssetID initWithLocationType:remoteURL:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:remoteURL:",  a4,  0LL);
  LOBYTE(self) = -[UARPController getSupportedAccessoriesInternal:assetID:batchRequest:]( self,  "getSupportedAccessoriesInternal:assetID:batchRequest:",  v6,  v7,  0LL);

  return (char)self;
}

- (BOOL)getBatchedSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = -[UARPAssetID initWithLocationType:remoteURL:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:remoteURL:",  a4,  0LL);
  LOBYTE(self) = -[UARPController getSupportedAccessoriesInternal:assetID:batchRequest:]( self,  "getSupportedAccessoriesInternal:assetID:batchRequest:",  v6,  v7,  1LL);

  return (char)self;
}

- (BOOL)getAttestationCertificatesInternal:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke;
  v12[3] = &unk_18A143780;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  *(_BYTE *)(*(void *)(*(void *)(v2 + 16) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) getAttestationCertificates:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
  if (*(_BYTE *)(*(void *)(*(void *)(v2 + 16) + 8LL) + 24LL))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 72) useAssetAvailabilityNotifications])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) registerForAttestationCertificatesAvailability:*(void *)(a1 + 40)];
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)
        && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 32LL), OS_LOG_TYPE_ERROR))
      {
        __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke_cold_1();
      }
    }
  }

- (BOOL)getAttestationCertificates:(id)a3 assetLocationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = -[UARPAssetID initWithLocationType:remoteURL:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:remoteURL:",  a4,  0LL);
  LOBYTE(self) = -[UARPController getAttestationCertificatesInternal:assetID:]( self,  "getAttestationCertificatesInternal:assetID:",  v6,  v7);

  return (char)self;
}

- (void)assetAvailabilityNotificationPosted:(int)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  assetAvailabilityNotificationTokenDict = self->_assetAvailabilityNotificationTokenDict;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:]( assetAvailabilityNotificationTokenDict,  "objectForKeyedSubscript:",  v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[UARPController assetAvailabilityNotificationPosted:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_INFO,  "%s: Asset availability notification for %@",  (uint8_t *)&v11,  0x16u);
    }

    internalDelegate = self->_internalDelegate;
    [v6 getID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPControllerInternalDelegate getAssetIDForAccessoryID:](internalDelegate, "getAssetIDForAccessoryID:", v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UARPController assetAvailablityUpdateForAccessory:assetID:]( self,  "assetAvailablityUpdateForAccessory:assetID:",  v6,  v10);
    }

    else if (os_log_type_enabled(self->_controllerLog, OS_LOG_TYPE_ERROR))
    {
      -[UARPController assetAvailabilityNotificationPosted:].cold.2();
    }
  }

  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController assetAvailabilityNotificationPosted:].cold.1();
  }
}

- (BOOL)registerForAssetAvailabilityNotification:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  [v4 getID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (const char *)[v5 assetAvailabilityUpdateNotification];

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __59__UARPController_registerForAssetAvailabilityNotification___block_invoke;
  handler[3] = &unk_18A1437F8;
  objc_copyWeak(&v13, &location);
  uint32_t v8 = notify_register_dispatch(v6, &out_token, (dispatch_queue_t)internalQueue, handler);
  if (v8)
  {
    if (os_log_type_enabled(self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForAssetAvailabilityNotification:].cold.1();
    }
  }

  else
  {
    assetAvailabilityNotificationTokenDict = self->_assetAvailabilityNotificationTokenDict;
    [MEMORY[0x189607968] numberWithInt:out_token];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( assetAvailabilityNotificationTokenDict,  "setObject:forKeyedSubscript:",  v4,  v10);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8 == 0;
}

void __59__UARPController_registerForAssetAvailabilityNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained assetAvailabilityNotificationPosted:a2];
}

- (void)availabilityNotificationForSupportedAccessoriesPosted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:]( assetAvailabilityUARPProductGroupNotificationTokenDict,  "objectForKeyedSubscript:",  v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[UARPController availabilityNotificationForSupportedAccessoriesPosted:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_INFO,  "%s: availability notification for supported accessories for productGroup %@",  (uint8_t *)&v13,  0x16u);
  }

  [MEMORY[0x189603FE0] set];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  internalDelegate = self->_internalDelegate;
  [v7 identifier];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[UARPControllerInternalDelegate getSupportedAccessories:forProductGroup:]( internalDelegate,  "getSupportedAccessories:forProductGroup:",  v9,  v11);

  -[UARPController supportedAccessories:forProductGroup:isComplete:]( self,  "supportedAccessories:forProductGroup:isComplete:",  v9,  v7,  v12);
  if ((_DWORD)v12) {
    -[UARPController unregisterForSupportedAccessoriesAvailability:]( self,  "unregisterForSupportedAccessoriesAvailability:",  v3);
  }
}

- (BOOL)registerForSupportedAccessoriesAvailability:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  [v4 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = (void *)NSString;
  if (v5)
  {
    [v4 identifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"%@-%@", @"com.apple.accessoryUpdater.uarp.supportedAccessoriesMetadataAvailable", v7];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [NSString stringWithFormat:@"%@", @"com.apple.accessoryUpdater.uarp.supportedAccessoriesMetadataAvailable"];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_initWeak(&location, self);
  id v9 = v8;
  id v10 = (const char *)[v9 UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __62__UARPController_registerForSupportedAccessoriesAvailability___block_invoke;
  handler[3] = &unk_18A1437F8;
  objc_copyWeak(&v17, &location);
  uint32_t v12 = notify_register_dispatch(v10, &out_token, (dispatch_queue_t)internalQueue, handler);
  if (v12)
  {
    if (os_log_type_enabled(self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForSupportedAccessoriesAvailability:].cold.1();
    }
  }

  else if (v4)
  {
    assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
    [MEMORY[0x189607968] numberWithInt:out_token];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( assetAvailabilityUARPProductGroupNotificationTokenDict,  "setObject:forKeyedSubscript:",  v4,  v14);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12 == 0;
}

void __62__UARPController_registerForSupportedAccessoriesAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained availabilityNotificationForSupportedAccessoriesPosted:a2];
}

- (id)assetAvailabilityTokenForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = self->_assetAvailabilityNotificationTokenDict;
  uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint32_t v8 = 0LL;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:]( self->_assetAvailabilityNotificationTokenDict,  "objectForKeyedSubscript:",  v11,  (void)v15);
        uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v4 isEqual:v12])
        {
          id v13 = v11;

          uint32_t v8 = v13;
        }
      }

      uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  else
  {
    uint32_t v8 = 0LL;
  }

  return v8;
}

- (void)unregisterForAssetAvailabilityNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[UARPController assetAvailabilityTokenForAccessory:](self, "assetAvailabilityTokenForAccessory:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    notify_cancel([v5 intValue]);
    -[NSMutableDictionary removeObjectForKey:](self->_assetAvailabilityNotificationTokenDict, "removeObjectForKey:", v6);
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[UARPController unregisterForAssetAvailabilityNotification:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "%s: unregistered %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)unregisterForSupportedAccessoriesAvailability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  notify_cancel(a3);
  assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  [MEMORY[0x189607968] numberWithInt:v3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:]( assetAvailabilityUARPProductGroupNotificationTokenDict,  "removeObjectForKey:",  v6);

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[UARPController unregisterForSupportedAccessoriesAvailability:]";
    _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_DEFAULT,  "%s: unregistered for SupportedAccessoriesAvailability",  (uint8_t *)&v8,  0xCu);
  }

- (void)unregisterForAllAssetAvailabilityNotifications
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v3 = self->_assetAvailabilityNotificationTokenDict;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        notify_cancel([*(id *)(*((void *)&v17 + 1) + 8 * v7++) intValue]);
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_assetAvailabilityNotificationTokenDict, "removeAllObjects");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v8 = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "intValue", (void)v13));
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    }

    while (v10);
  }

  -[NSMutableDictionary removeAllObjects]( self->_assetAvailabilityUARPProductGroupNotificationTokenDict,  "removeAllObjects");
}

- (void)supplementalAssetAvailabilityNotificationPosted:(int)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  supplementalAssetAvailabilityNotificationTokenDict = self->_supplementalAssetAvailabilityNotificationTokenDict;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:]( supplementalAssetAvailabilityNotificationTokenDict,  "objectForKeyedSubscript:",  v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[UARPController supplementalAssetAvailabilityNotificationPosted:]";
      __int16 v13 = 2112;
      __int128 v14 = v6;
      _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_INFO,  "%s: Supplemental Asset availability notification for %@",  (uint8_t *)&v11,  0x16u);
    }

    internalDelegate = self->_internalDelegate;
    [v6 getID];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPControllerInternalDelegate getSupplementalAssetNameForAccessoryID:]( internalDelegate,  "getSupplementalAssetNameForAccessoryID:",  v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UARPController supplementalAssetAvailablityUpdateForAccessory:assetName:]( self,  "supplementalAssetAvailablityUpdateForAccessory:assetName:",  v6,  v10);
    }

    else if (os_log_type_enabled(self->_controllerLog, OS_LOG_TYPE_ERROR))
    {
      -[UARPController supplementalAssetAvailabilityNotificationPosted:].cold.2();
    }
  }

  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController supplementalAssetAvailabilityNotificationPosted:].cold.1();
  }
}

- (BOOL)registerForSupplementalAssetAvailabilityNotification:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  [v4 getID];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (const char *)[v5 supplementalAssetAvailabilityUpdateNotification];

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __71__UARPController_registerForSupplementalAssetAvailabilityNotification___block_invoke;
  handler[3] = &unk_18A1437F8;
  objc_copyWeak(&v13, &location);
  uint32_t v8 = notify_register_dispatch(v6, &out_token, (dispatch_queue_t)internalQueue, handler);
  if (v8)
  {
    if (os_log_type_enabled(self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForAssetAvailabilityNotification:].cold.1();
    }
  }

  else
  {
    supplementalAssetAvailabilityNotificationTokenDict = self->_supplementalAssetAvailabilityNotificationTokenDict;
    [MEMORY[0x189607968] numberWithInt:out_token];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( supplementalAssetAvailabilityNotificationTokenDict,  "setObject:forKeyedSubscript:",  v4,  v10);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8 == 0;
}

void __71__UARPController_registerForSupplementalAssetAvailabilityNotification___block_invoke( uint64_t a1,  uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained supplementalAssetAvailabilityNotificationPosted:a2];
}

- (id)supplementalAssetAvailabilityTokenForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = self->_supplementalAssetAvailabilityNotificationTokenDict;
  uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint32_t v8 = 0LL;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:]( self->_supplementalAssetAvailabilityNotificationTokenDict,  "objectForKeyedSubscript:",  v11,  (void)v15);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v4 isEqual:v12])
        {
          id v13 = v11;

          uint32_t v8 = v13;
        }
      }

      uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  else
  {
    uint32_t v8 = 0LL;
  }

  return v8;
}

- (void)unregisterForSupplementalAssetAvailabilityNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[UARPController supplementalAssetAvailabilityTokenForAccessory:]( self,  "supplementalAssetAvailabilityTokenForAccessory:",  v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    notify_cancel([v5 intValue]);
    -[NSMutableDictionary removeObjectForKey:]( self->_supplementalAssetAvailabilityNotificationTokenDict,  "removeObjectForKey:",  v6);
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[UARPController unregisterForSupplementalAssetAvailabilityNotification:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "%s: unregistered %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)unregisterForAllSupplementalAssetAvailabilityNotifications
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = self->_supplementalAssetAvailabilityNotificationTokenDict;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
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
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "intValue", (void)v8));
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_supplementalAssetAvailabilityNotificationTokenDict, "removeAllObjects");
}

- (void)availabilityNotificationForAttestationCertificatesPosted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:]( attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict,  "objectForKeyedSubscript:",  v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    __int128 v11 = "-[UARPController availabilityNotificationForAttestationCertificatesPosted:]";
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_INFO,  "%s: availability notification for attestation certificates for subjectKeyIdentifier %@",  (uint8_t *)&v10,  0x16u);
  }

  -[UARPControllerInternalDelegate getAttestationCertificates:]( self->_internalDelegate,  "getAttestationCertificates:",  v7);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPController handleReceivedAttestationCertificates:forSubjectKeyIdentifier:]( self,  "handleReceivedAttestationCertificates:forSubjectKeyIdentifier:",  v9,  v7);
  -[UARPController unregisterForAttestationCertificatesAvailability:]( self,  "unregisterForAttestationCertificatesAvailability:",  v3);
}

- (BOOL)registerForAttestationCertificatesAvailability:(id)a3
{
  id v4 = a3;
  int out_token = -1;
  if (v4) {
    [NSString stringWithFormat:@"%@-%@", @"com.apple.accessoryUpdater.uarp.attestationCertificatesAvailable", v4];
  }
  else {
    [NSString stringWithFormat:@"%@", @"com.apple.accessoryUpdater.uarp.attestationCertificatesAvailable", v13];
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  id v6 = v5;
  uint64_t v7 = (const char *)[v6 UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __65__UARPController_registerForAttestationCertificatesAvailability___block_invoke;
  handler[3] = &unk_18A1437F8;
  objc_copyWeak(&v15, &location);
  uint32_t v9 = notify_register_dispatch(v7, &out_token, (dispatch_queue_t)internalQueue, handler);
  if (v9)
  {
    if (os_log_type_enabled(self->_controllerLog, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForSupportedAccessoriesAvailability:].cold.1();
    }
  }

  else if (v4)
  {
    attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
    [MEMORY[0x189607968] numberWithInt:out_token];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict,  "setObject:forKeyedSubscript:",  v4,  v11);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9 == 0;
}

void __65__UARPController_registerForAttestationCertificatesAvailability___block_invoke( uint64_t a1,  uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained availabilityNotificationForAttestationCertificatesPosted:a2];
}

- (void)unregisterForAttestationCertificatesAvailability:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  notify_cancel(a3);
  attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  [MEMORY[0x189607968] numberWithInt:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:]( attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict,  "removeObjectForKey:",  v6);

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint32_t v9 = "-[UARPController unregisterForAttestationCertificatesAvailability:]";
    _os_log_impl( &dword_187DC0000,  controllerLog,  OS_LOG_TYPE_DEFAULT,  "%s: unregistered for AttestationCertificatesAvailability",  (uint8_t *)&v8,  0xCu);
  }

- (void)unregisterForAllAttestationCertificatesAvailabilityNotifications
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
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
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "intValue", (void)v8));
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects]( self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict,  "removeAllObjects");
}

- (BOOL)registerForGenericNotification:(id)a3 notificationName:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v7;
    _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "Registering for BSD notification %@", buf, 0xCu);
  }

  -[NSMutableDictionary allValues](self->_generalNotificationTokenDict, "allValues");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v27 + 1) + 8 * i) isEqualToString:v7])
        {
          __int128 v19 = self->_controllerLog;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v7;
            _os_log_impl(&dword_187DC0000, v19, OS_LOG_TYPE_INFO, "Already registered for notification %@", buf, 0xCu);
          }

          BOOL v17 = 1;
          goto LABEL_21;
        }
      }

      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int out_token = -1;
  objc_initWeak(&location, self);
  id v13 = v7;
  uint64_t v14 = (const char *)[v13 UTF8String];
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __66__UARPController_registerForGenericNotification_notificationName___block_invoke;
  handler[3] = &unk_18A1437F8;
  objc_copyWeak(&v24, &location);
  uint32_t v16 = notify_register_dispatch(v14, &out_token, (dispatch_queue_t)internalQueue, handler);
  BOOL v17 = v16 == 0;
  __int128 v18 = self->_controllerLog;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[UARPController registerForSupportedAccessoriesAvailability:].cold.1();
    }
  }

  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl(&dword_187DC0000, v18, OS_LOG_TYPE_INFO, "Registered for BSD notification %@", buf, 0xCu);
    }

    generalNotificationTokenDict = self->_generalNotificationTokenDict;
    [MEMORY[0x189607968] numberWithInt:out_token];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( generalNotificationTokenDict,  "setObject:forKeyedSubscript:",  v13,  v21);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_21:

  return v17;
}

void __66__UARPController_registerForGenericNotification_notificationName___block_invoke( uint64_t a1,  uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained genericNotificationPosted:a2];
}

- (void)genericNotificationPosted:(int)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  generalNotificationTokenDict = self->_generalNotificationTokenDict;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](generalNotificationTokenDict, "objectForKeyedSubscript:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[UARPController genericNotificationPosted:]";
      __int16 v25 = 2112;
      __int128 v26 = v6;
      _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "%s: Notification posted %@", buf, 0x16u);
    }

    -[NSMutableDictionary allValues](self->_accessories, "allValues");
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (void *)[v8 copy];

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "bsdNotifications", (void)v18);
          uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          int v17 = [v16 containsObject:v6];

          if (v17) {
            -[UARPUploader genericNotification:notificationName:error:]( self->_uploader,  "genericNotification:notificationName:error:",  v15,  v6,  0LL);
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v12);
    }
  }

  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController genericNotificationPosted:].cold.1();
  }
}

- (void)unregisterForAllGenericNotifications
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = self->_generalNotificationTokenDict;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
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
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "intValue", (void)v8));
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_generalNotificationTokenDict, "removeAllObjects");
}

- (BOOL)createUploader
{
  if (self->_uploader) {
    goto LABEL_6;
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v7 = (UARPUploader *)[v6 newUploader];
    uploader = self->_uploader;
    self->_uploader = v7;
  }

  else
  {
    __int128 v9 = objc_alloc_init(&OBJC_CLASS___UARPUploaderUARP);
    uint64_t v6 = self->_uploader;
    self->_uploader = &v9->super;
  }

  if (-[UARPUploader setController:](self->_uploader, "setController:", self))
  {
LABEL_6:
    LOBYTE(v10) = 1;
  }

  else
  {
    controllerLog = self->_controllerLog;
    BOOL v10 = os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      -[UARPController createUploader].cold.1(controllerLog, v12, v13, v14, v15, v16, v17, v18);
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)startTapToRadar:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 1;
  if (-[UARPController createUploader](self, "createUploader"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34__UARPController_startTapToRadar___block_invoke;
    block[3] = &unk_18A143820;
    void block[4] = self;
    BOOL v10 = &v11;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)internalQueue, block);
    BOOL v6 = *((_BYTE *)v12 + 24) != 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__UARPController_startTapToRadar___block_invoke(void *a1)
{
  uint64_t v2 = *(os_log_s **)(a1[4] + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "start TTR called.", v13, 2u);
  }

  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 64);
  if (v4)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v4 startTapToRadar:a1[5]];
  }

  else
  {
    char v5 = *(os_log_s **)(v3 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __34__UARPController_startTapToRadar___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }

- (void)stopTapToRadar
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__UARPController_stopTapToRadar__block_invoke;
  block[3] = &unk_18A143168;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)internalQueue, block);
}

uint64_t __32__UARPController_stopTapToRadar__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "stop TTR called.", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) stopTapToRadar];
}

- (void)startPersonalizationHelperService:(id)a3 entitlement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("UARPController personalization", 0LL);
  personalizationQueue = self->_personalizationQueue;
  self->_personalizationQueue = v8;

  uint64_t v10 = -[UARPPersonalizationManager initWithMachServiceName:entitlement:delegate:queue:]( objc_alloc(&OBJC_CLASS___UARPPersonalizationManager),  "initWithMachServiceName:entitlement:delegate:queue:",  v7,  v6,  self,  self->_personalizationQueue);
  personalizationManager = self->_personalizationManager;
  self->_personalizationManager = v10;
}

- (id)pendingTatsuRequests
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy__3;
  char v14 = __Block_byref_object_dispose__3;
  id v15 = (id)objc_opt_new();
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[UARPController pendingTatsuRequests]";
    _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __38__UARPController_pendingTatsuRequests__block_invoke;
  v9[3] = &unk_18A143088;
  void v9[4] = self;
  v9[5] = &v10;
  dispatch_sync((dispatch_queue_t)internalQueue, v9);
  char v5 = self->_controllerLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[UARPController pendingTatsuRequests]";
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_187DC0000, v5, OS_LOG_TYPE_INFO, "%s: Pending Tatsu Requests %@", buf, 0x16u);
  }

  [MEMORY[0x189603F18] arrayWithArray:v11[5]];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __38__UARPController_pendingTatsuRequests__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[UARPController pendingTatsuRequests]_block_invoke";
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "%s: on queue", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) pendingTssRequests];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v3];
}

- (void)tssResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[UARPController tssResponse:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_187DC0000, controllerLog, OS_LOG_TYPE_INFO, "%s: Tatsu Response, %@", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __30__UARPController_tssResponse___block_invoke;
  v8[3] = &unk_18A141D18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, v8);
}

uint64_t __30__UARPController_tssResponse___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[UARPController tssResponse:]_block_invoke";
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "%s: on queue", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) tssResponse:*(void *)(a1 + 40)];
}

- (void)assetStagingPause:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __36__UARPController_assetStagingPause___block_invoke;
    v8[3] = &unk_18A141D18;
    v8[4] = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)delegateQueue, v8);
  }
}

void __36__UARPController_assetStagingPause___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
  [WeakRetained assetStagingPause:*(void *)(a1 + 40)];
}

- (void)assetStagingResume:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __37__UARPController_assetStagingResume___block_invoke;
    v8[3] = &unk_18A141D18;
    v8[4] = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)delegateQueue, v8);
  }
}

void __37__UARPController_assetStagingResume___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168LL));
  [WeakRetained assetStagingResume:*(void *)(a1 + 40)];
}

- (UARPControllerDelegateProtocol)delegate
{
  return (UARPControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_187DC0000, v0, v1, "%s: Unable to find pending asset for %@ with ID %@", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)recvDataFromAccessory:(os_log_s *)a1 data:(uint64_t)a2 error:(uint64_t)a3 .cold.1(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  id v4 = "-[UARPController recvDataFromAccessory:data:error:]";
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, a1, a3, "%s: Zero Length Message from Transport", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)updatePendingAssetsForAccessory:(void *)a1 assetID:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_16() localURL];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, v1, v4, "Unable to initialize asset at %@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, (uint64_t)v0, "Failed to send message to %@ (%@)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)solicitDynamicAsset:assetID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, v0, v1, "Attempting to solicit a dynamic asset without a valid URL; %@", v2);
  OUTLINED_FUNCTION_1();
}

void __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, v2, v4, "Unable to initialize asset at %@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke_cold_1( uint64_t a1,  void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_187DC0000, v2, v4, "Unable to initialize dynamic asset at %@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%{public}s: Unrecognized accessory %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%{public}s: Unrecognized accessory %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136446210;
  uint64_t v4 = "-[UARPController supportedAccessories:forProductGroup:isComplete:]_block_invoke";
  OUTLINED_FUNCTION_1_3( &dword_187DC0000,  a1,  a3,  "%{public}s: Delegate doesn't implement a supportedAccessories:forProductGroup:(isComplete:) callback",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryTransportNeeded:isNeeded:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, (uint64_t)v0, "Accessory busy state %@ for %@", v1);
  OUTLINED_FUNCTION_1();
}

void __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2( &dword_187DC0000,  v0,  v1,  "%s: Unable to register for Supported Accessories Availability for productGroup %@, assetID %@",  v2);
  OUTLINED_FUNCTION_3_1();
}

void __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2( &dword_187DC0000,  v0,  v1,  "%s: Unable to register for Attestation Certificates Availability for subjectKeyIdentifier %@, assetID %@",  v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)assetAvailabilityNotificationPosted:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_3(&dword_187DC0000, v0, v1, "%s: Unable to locate accessory for token %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)assetAvailabilityNotificationPosted:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%s: Unable to retrieve asset ID for %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)registerForAssetAvailabilityNotification:.cold.1()
{
}

- (void)registerForSupportedAccessoriesAvailability:.cold.1()
{
}

- (void)supplementalAssetAvailabilityNotificationPosted:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_3(&dword_187DC0000, v0, v1, "%s: Unable to locate accessory for token %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)supplementalAssetAvailabilityNotificationPosted:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%s: Unable to retrieve asset Name for %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)genericNotificationPosted:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_3(&dword_187DC0000, v0, v1, "%s: Unable to locate notification name for token %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)createUploader
{
}

void __34__UARPController_startTapToRadar___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end