@interface UARPUploaderUARP
- (BOOL)accessoryReachable:(id)a3 error:(id *)a4;
- (BOOL)accessoryReachable:(id)a3 remoteEndpoint:(id)a4 error:(id *)a5;
- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4;
- (BOOL)accessoryUnreachable:(id)a3 remoteEndpoint:(id)a4 error:(id *)a5;
- (BOOL)addAccessory:(id)a3 error:(id *)a4;
- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4;
- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4;
- (BOOL)genericNotification:(id)a3 notificationName:(id)a4 error:(id *)a5;
- (BOOL)handlePowerSource:(id)a3 currentCapacity:(unint64_t)a4 maxCapacity:(unint64_t)a5;
- (BOOL)isTapToRadarMode;
- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 downstreamID:(unint64_t)a5 error:(id *)a6;
- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5;
- (BOOL)offerDynamicAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5;
- (BOOL)offerFirmwareAssetToDownstreamEndpoint:(id)a3 error:(id *)a4;
- (BOOL)pauseAssetTransfersForAccessory:(id)a3;
- (BOOL)qProcessCrshDynamicAsset:(id)a3;
- (BOOL)qProcessMticDynamicAsset:(id)a3;
- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)recvDataFromEndpoint:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)removeAccessory:(id)a3 error:(id *)a4;
- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4;
- (BOOL)resumeAssetTransfersForAccessory:(id)a3;
- (BOOL)setController:(id)a3;
- (BOOL)shouldSendFirmwareStagingProgressForAccessory:(id)a3 asset:(id)a4;
- (BOOL)solicitDynamicAssetForAccessory:(id)a3 asset:(id)a4 error:(id *)a5;
- (BOOL)solicitDynamicAssetForAccessory:(id)a3 asset:(id)a4 internalSolicit:(BOOL)a5 error:(id *)a6;
- (BOOL)solicitDynamicAssetForAccessory:(id)a3 assetTag:(id)a4 error:(id *)a5;
- (BOOL)solicitDynamicAssetForRemoteEndpoint:(id)a3 assetTag:(id)a4 internalSolicit:(BOOL)a5 error:(id *)a6;
- (BOOL)startTapToRadar:(id)a3;
- (BOOL)supplementalAssetUpdated:(id)a3 assetName:(id)a4 error:(id *)a5;
- (BOOL)tssResponseForEndpoint:(id)a3 tssResponse:(id)a4;
- (BOOL)unsolicitedDynamicAssetForAccessory:(id)a3 assetTag:(id)a4 error:(id *)a5;
- (NSURL)ttrDirectory;
- (UARPUploaderUARP)init;
- (id)firmwareAssetIDForDownstreamEndpoint:(id)a3 error:(id *)a4;
- (id)logTokenForCategory:(int)a3;
- (id)pendingTssRequestForEndpoint:(id)a3;
- (id)pendingTssRequests;
- (id)qFindRemoteEndpointForAccessory:(id)a3;
- (int64_t)_queryProperty:(unint64_t)a3 endpoint:(id)a4;
- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4;
- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4 downstreamID:(unint64_t)a5;
- (uarpPlatformEndpoint)uarpEndpoint;
- (uarpPlatformEndpointApple)uarpVendorExtension;
- (unsigned)requestBytesInRangeForAccessory:(id)a3 asset:(id)a4 bytes:(void *)a5 length:(unsigned int)a6 offset:(unsigned int)a7 bytesCopied:(unsigned int *)a8 offsetUsed:(unsigned int *)a9;
- (void)addMappingDatabaseFromAsset:(id)a3;
- (void)addUnprocessedDynamicAsset:(id)a3 withAssetTag:(id)a4;
- (void)ageOutUnprocessedDynamicAssets;
- (void)applyStagedAssetStatus:(id)a3 status:(unint64_t)a4;
- (void)applyStagedAssetsForoDownstreamEndpoint:(id)a3;
- (void)assetRelease:(id)a3 asset:(id)a4;
- (void)assetSolicitationComplete:(id)a3 asset:(id)a4 status:(unint64_t)a5;
- (void)assetSolicitationProgress:(id)a3 asset:(id)a4 offset:(unint64_t)a5 assetLength:(unint64_t)a6;
- (void)assetStagingComplete:(id)a3 asset:(id)a4 status:(unint64_t)a5;
- (void)assetStagingPause:(id)a3;
- (void)assetStagingResume:(id)a3;
- (void)copyDynamicAssetsForTapToRadar;
- (void)discoverDownstreamEndpoints:(id)a3;
- (void)handlePersonalizationRequest:(id)a3;
- (void)handlePowerSourcePercentChange:(id)a3;
- (void)offerDynamicAssetToAccessory:(id)a3 asset:(id)a4 internalOffer:(BOOL)a5 tag:(id)a6;
- (void)processDynamicAssetHeySiriCompact:(id)a3;
- (void)processDynamicAssetVersions:(id)a3 partnerSerialNumbers:(id)a4;
- (void)processDynamicAssetVoiceAssist:(id)a3;
- (void)protocolVersionSelected:(id)a3 protocolVersion:(unsigned __int16)a4;
- (void)qHandlePowerSourcePercentChange:(id)a3;
- (void)qProcessDynamicAssets;
- (void)queryFirmwareUpdateResultForAccessory:(id)a3;
- (void)rescindAssets:(id)a3;
- (void)rescindStagedAssetsAck:(id)a3 asset:(id)a4;
- (void)rescindedRxDynamicAsset:(id)a3 asset:(id)a4;
- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4;
- (void)solicitDynamicAssetsForTapToRadar:(id)a3;
- (void)solicitExpectedDynamicAssets:(id)a3;
- (void)stopTapToRadar;
- (void)transferPauseAck:(id)a3;
- (void)transferResumeAck:(id)a3;
- (void)tssResponse:(id)a3;
- (void)updateActiveFirmwareVersion:(id)a3 remoteEndpoint:(id)a4;
- (void)updateAppleModelNumber:(id)a3 remoteEndpoint:(id)a4;
- (void)updateBoardID:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateChipEpoch:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateChipID:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateChipRevision:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateECID:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateEnableMixMatch:(BOOL)a3 remoteEndpoint:(id)a4;
- (void)updateFriendlyName:(id)a3 remoteEndpoint:(id)a4;
- (void)updateHardwareFusingType:(id)a3 remoteEndpoint:(id)a4;
- (void)updateHardwareVersion:(id)a3 remoteEndpoint:(id)a4;
- (void)updateLastError:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateManifestPrefix:(id)a3 remoteEndpoint:(id)a4;
- (void)updateManufacturerName:(id)a3 remoteEndpoint:(id)a4;
- (void)updateModelName:(id)a3 remoteEndpoint:(id)a4;
- (void)updatePrefixNeedsLogicalUnitNumber:(BOOL)a3 remoteEndpoint:(id)a4;
- (void)updateProductionMode:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateSecurityDomain:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateSecurityMode:(unint64_t)a3 remoteEndpoint:(id)a4;
- (void)updateSerialNumber:(id)a3 remoteEndpoint:(id)a4;
- (void)updateSocLiveNonce:(BOOL)a3 remoteEndpoint:(id)a4;
- (void)updateStagedFirmwareVersion:(id)a3 remoteEndpoint:(id)a4;
- (void)updateStatistics:(id)a3 remoteEndpoint:(id)a4;
- (void)updateSuffixNeedsLogicalUnitNumber:(BOOL)a3 remoteEndpoint:(id)a4;
- (void)watchdogExpireLayer2:(id)a3;
@end

@implementation UARPUploaderUARP

- (UARPUploaderUARP)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___UARPUploaderUARP;
  v2 = -[UARPUploader init](&v19, sel_init);
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.UARPUploaderUARP.Internal", 0LL);
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    v8 = (void *)*((void *)v2 + 140);
    *((void *)v2 + 140) = v7;

    bzero(v2 + 40, 0x260uLL);
    uint64_t v9 = 0LL;
    *(_OWORD *)(v2 + 648) = 0u;
    *(_OWORD *)(v2 + 664) = 0u;
    *(_OWORD *)(v2 + 680) = 0u;
    *(_OWORD *)(v2 + 696) = 0u;
    *(_OWORD *)(v2 + 712) = 0u;
    *(_OWORD *)(v2 + 728) = 0u;
    *(_OWORD *)(v2 + 744) = 0u;
    *(_OWORD *)(v2 + 760) = 0u;
    *(_OWORD *)(v2 + 776) = 0u;
    *(_OWORD *)(v2 + 792) = 0u;
    *(_OWORD *)(v2 + 808) = 0u;
    *(_OWORD *)(v2 + 824) = 0u;
    *(_OWORD *)(v2 + 840) = 0u;
    *(_OWORD *)(v2 + 856) = 0u;
    *(_OWORD *)(v2 + 872) = 0u;
    *(_OWORD *)(v2 + 888) = 0u;
    *(_OWORD *)(v2 + 904) = 0u;
    *(_OWORD *)(v2 + 920) = 0u;
    *(_OWORD *)(v2 + 936) = 0u;
    *(_OWORD *)(v2 + 952) = 0u;
    *(_OWORD *)(v2 + 968) = 0u;
    *(_OWORD *)(v2 + 984) = 0u;
    *(_OWORD *)(v2 + 1000) = 0u;
    *(_OWORD *)(v2 + 1016) = 0u;
    *(_OWORD *)(v2 + 1032) = 0u;
    *(_OWORD *)(v2 + 1048) = 0u;
    *(_OWORD *)(v2 + 1064) = 0u;
    *(_OWORD *)(v2 + 1080) = 0u;
    *(_OWORD *)(v2 + 1096) = 0u;
    *((void *)v2 + 139) = 0LL;
    do
    {
      v10 = uarpLoggingCategoryToString(v9);
      os_log_t v11 = os_log_create("com.apple.uarp.layer3.au", v10);
      v12 = *(void **)&v2[8 * v9 + 1128];
      *(void *)&v2[8 * v9 + 1128] = v11;

      ++v9;
    }

    while (v9 != 9);
    v2[1200] = MGGetBoolAnswer();
    uint64_t v13 = [MEMORY[0x189603FC8] dictionary];
    v14 = (void *)*((void *)v2 + 151);
    *((void *)v2 + 151) = v13;

    v15 = (void *)*((void *)v2 + 152);
    *((void *)v2 + 152) = 0LL;

    v2[1224] = 0;
    id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
    v17 = (void *)*((void *)v2 + 154);
    *((void *)v2 + 154) = v16;
  }

  return (UARPUploaderUARP *)v2;
}

- (uarpPlatformEndpoint)uarpEndpoint
{
  return &self->_uarpEndpoint;
}

- (uarpPlatformEndpointApple)uarpVendorExtension
{
  return &self->_uarpVendorExtension;
}

- (id)logTokenForCategory:(int)a3
{
  if (a3 < 0xA)
  {
    os_log_t v3 = self->_tokens[a3];
  }

  else
  {
    os_log_t v3 = (OS_os_log *)MEMORY[0x1895F8DA0];
    id v4 = MEMORY[0x1895F8DA0];
  }

  return v3;
}

- (BOOL)setController:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPUploaderUARP;
  if (!-[UARPUploader setController:](&v11, sel_setController_, a3)) {
    return 0;
  }
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __34__UARPUploaderUARP_setController___block_invoke;
  v7[3] = &unk_18A143550;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)queue, v7);
  BOOL v5 = *((_DWORD *)v9 + 6) == 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__UARPUploaderUARP_setController___block_invoke(uint64_t a1)
{
  uint64_t result = UARPPlatformControllerInit(*(void **)(a1 + 32));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)addAccessory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP addAccessory:error:].cold.1();
  }
  BOOL v7 = -[UARPUploaderUARP accessoryReachable:error:](self, "accessoryReachable:error:", v6, a4);

  return v7;
}

- (BOOL)accessoryReachable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP accessoryReachable:error:].cold.1();
  }
  BOOL v7 = -[UARPUploaderEndpoint initWithUARPAccessory:uploader:]( objc_alloc(&OBJC_CLASS___UARPUploaderEndpoint),  "initWithUARPAccessory:uploader:",  v6,  self);
  queue = self->_queue;
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = __45__UARPUploaderUARP_accessoryReachable_error___block_invoke;
  v14 = &unk_18A141D18;
  v15 = self;
  id v16 = v7;
  uint64_t v9 = v7;
  dispatch_sync((dispatch_queue_t)queue, &v11);
  -[UARPUploaderUARP accessoryReachable:remoteEndpoint:error:]( self,  "accessoryReachable:remoteEndpoint:error:",  v6,  v9,  a4,  v11,  v12,  v13,  v14,  v15);

  return 1;
}

uint64_t __45__UARPUploaderUARP_accessoryReachable_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1120) addObject:*(void *)(a1 + 40)];
}

- (BOOL)accessoryReachable:(id)a3 remoteEndpoint:(id)a4 error:(id *)a5
{
  id v6 = a4;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP accessoryReachable:remoteEndpoint:error:].cold.1();
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __60__UARPUploaderUARP_accessoryReachable_remoteEndpoint_error___block_invoke;
  v10[3] = &unk_18A141D18;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, v10);

  return 1;
}

uint64_t __60__UARPUploaderUARP_accessoryReachable_remoteEndpoint_error___block_invoke(uint64_t a1)
{
  return UARPPlatformControllerAddAccessory(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)removeAccessory:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Remove accessory %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = -[UARPUploaderUARP accessoryUnreachable:error:](self, "accessoryUnreachable:error:", v6, a4);

  return v8;
}

- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Unreachable accessory %@", buf, 0xCu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __47__UARPUploaderUARP_accessoryUnreachable_error___block_invoke;
  v10[3] = &unk_18A141D18;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, v10);

  return 1;
}

void __47__UARPUploaderUARP_accessoryUnreachable_error___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    os_log_t v3 = v2;
    [*(id *)(*(void *)(a1 + 32) + 1120) removeObject:v2];
    [*(id *)(a1 + 32) accessoryUnreachable:*(void *)(a1 + 40) remoteEndpoint:v3 error:0];
    v2 = v3;
  }
}

- (BOOL)accessoryUnreachable:(id)a3 remoteEndpoint:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Unreachable remoteEndpoint %@", buf, 0xCu);
  }

  queue = self->_queue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __62__UARPUploaderUARP_accessoryUnreachable_remoteEndpoint_error___block_invoke;
  v11[3] = &unk_18A141D18;
  v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)queue, v11);

  return 1;
}

uint64_t __62__UARPUploaderUARP_accessoryUnreachable_remoteEndpoint_error___block_invoke(uint64_t a1)
{
  return UARPPlatformControllerRemoveAccessory(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP recvDataFromAccessory:data:error:].cold.1();
  }
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  [MEMORY[0x189603F48] dataWithData:v8];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke;
  block[3] = &unk_18A143100;
  block[4] = self;
  id v13 = v7;
  id v14 = v15;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v15, 8);
  return 1;
}

void __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 recvDataFromEndpoint:v2 data:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:0];
  }

  else
  {
    id v4 = (os_log_s *)v3[3];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke_cold_1(v4, v5, v6);
    }
  }
}

- (BOOL)recvDataFromEndpoint:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP recvDataFromEndpoint:data:error:].cold.1();
  }
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = __Block_byref_object_copy__4;
  v16[4] = __Block_byref_object_dispose__4;
  [MEMORY[0x189603FB8] dataWithData:v8];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke;
  block[3] = &unk_18A143820;
  id v14 = self;
  uint64_t v15 = v16;
  id v13 = v7;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v16, 8);
  return 1;
}

void __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke(uint64_t a1)
{
  unsigned int v2 = UARPPlatformControllerRecvMessage( *(void **)(a1 + 40),  *(void **)(a1 + 32),  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  if (v2)
  {
    unsigned int v3 = v2;
    id v4 = *(void **)(*(void *)(a1 + 40) + 24LL);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG)) {
      __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke_cold_1(v4, v3);
    }
  }

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v10 = log;
    [v8 id];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 assetVersion];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 getID];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 modelIdentifier];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 serialNumber];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 uuid];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_impl( &dword_187DC0000,  v10,  OS_LOG_TYPE_INFO,  "UARP.OFFER asset version %@ to %@ <SN=%@> <UUID=%@>",  buf,  0x2Au);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  queue = self->_queue;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke;
  v22[3] = &unk_18A143668;
  v22[4] = self;
  id v23 = v7;
  id v24 = v8;
  v25 = buf;
  id v18 = v8;
  id v19 = v7;
  dispatch_sync((dispatch_queue_t)queue, v22);
  BOOL v20 = *(_DWORD *)(*(void *)&buf[8] + 24LL) == 0;

  _Block_object_dispose(buf, 8);
  return v20;
}

void __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke(uint64_t a1)
{
  unsigned int v2 = (uint64_t *)(a1 + 40);
  [*(id *)(a1 + 32) qFindRemoteEndpointForAccessory:*(void *)(a1 + 40)];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(v2 - 1);
  if (v3)
  {
    uint64_t v5 = *(void **)(v4 + 1208);
    [*(id *)(a1 + 40) uuid];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:0 forKeyedSubscript:v6];

    [*(id *)(a1 + 32) addMappingDatabaseFromAsset:*(void *)(a1 + 48)];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = UARPPlatformControllerOfferFirmwareAsset( *(void **)(a1 + 32),  v3,  *(void **)(a1 + 48));
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      id v7 = *(void **)(*(void *)(a1 + 32) + 24LL);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_2(a1 + 56, v7, v2);
      }
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      [*(id *)(a1 + 48) id];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 firmwareStagingComplete:v9 assetID:v10 withStatus:4];
    }

    [*(id *)(a1 + 32) qHandlePowerSourcePercentChange:v3];
  }

  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 24), OS_LOG_TYPE_ERROR)) {
      __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_1();
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 27;
  }
}

- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__UARPUploaderUARP_applyStagedAssetsForAccessory_error___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v10 = v5;
  id v11 = &v12;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_DWORD *)v13 + 6) == 0;

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

void __56__UARPUploaderUARP_applyStagedAssetsForAccessory_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) qFindRemoteEndpointForAccessory:*(void *)(a1 + 40)];
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    unsigned int v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void **)(a1 + 40);
      id v5 = v3;
      [v4 getID];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 modelIdentifier];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) serialNumber];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) uuid];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl( &dword_187DC0000,  v5,  OS_LOG_TYPE_INFO,  "UARP.APPLY assets for %@ <SN=%@> <UUID=%@>",  (uint8_t *)&v11,  0x20u);
    }

    int v10 = UARPPlatformControllerApplyStagedAssets(*(void **)(a1 + 32), v2);
  }

  else
  {
    int v10 = 27;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v10;
}

- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __58__UARPUploaderUARP_rescindStagedAssetsForAccessory_error___block_invoke;
  v9[3] = &unk_18A141D18;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v9);

  return 1;
}

void __58__UARPUploaderUARP_rescindStagedAssetsForAccessory_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) qFindRemoteEndpointForAccessory:*(void *)(a1 + 40)];
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    unsigned int v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void **)(a1 + 40);
      id v5 = v3;
      [v4 getID];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 modelIdentifier];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) serialNumber];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) uuid];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = 138412802;
      int v11 = v7;
      __int16 v12 = 2112;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      _os_log_impl( &dword_187DC0000,  v5,  OS_LOG_TYPE_INFO,  "UARP.RESCIND assets for %@ <SN=%@> <UUID=%@>",  (uint8_t *)&v10,  0x20u);
    }

    UARPPlatformControllerResindAllAssets(*(void **)(a1 + 32), v2);
  }
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP pauseAssetTransfersForAccessory:].cold.1();
  }
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__UARPUploaderUARP_pauseAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v9 = v4;
  int v10 = v11;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v11, 8);
  return 1;
}

void __52__UARPUploaderUARP_pauseAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    int v3 = UARPPlatformControllerPauseAssetTransfers(*(void **)(a1 + 32), v2);
    unsigned int v2 = v4;
  }

  else
  {
    int v3 = 27;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP resumeAssetTransfersForAccessory:].cold.1();
  }
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__UARPUploaderUARP_resumeAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_18A143100;
  void block[4] = self;
  id v9 = v4;
  int v10 = v11;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v11, 8);
  return 1;
}

void __53__UARPUploaderUARP_resumeAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    int v3 = UARPPlatformControllerResumeAssetTransfers(*(void **)(a1 + 32), v2);
    unsigned int v2 = v4;
  }

  else
  {
    int v3 = 27;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP cancelAssetStagingForAccessory:asset:].cold.1();
  }
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  queue = self->_queue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __57__UARPUploaderUARP_cancelAssetStagingForAccessory_asset___block_invoke;
  v13[3] = &unk_18A143668;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, v13);
  BOOL v11 = *((_DWORD *)v18 + 6) == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __57__UARPUploaderUARP_cancelAssetStagingForAccessory_asset___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    int v3 = UARPPlatformControllerRescindAsset(*(void **)(a1 + 32), v2, *(void *)(a1 + 48));
    unsigned int v2 = v4;
  }

  else
  {
    int v3 = 27;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v3;
}

- (BOOL)supplementalAssetUpdated:(id)a3 assetName:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  [v8 modelNumber];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v10);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.1();
    }
    goto LABEL_23;
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  [v11 supplementalAssets];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (!v13)
  {

LABEL_21:
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.2();
    }
LABEL_23:
    char appended = 0;
    goto LABEL_24;
  }

  uint64_t v14 = v13;
  v27 = a5;
  __int16 v28 = self;
  int v15 = 0;
  char v16 = 0;
  uint64_t v17 = *(void *)v30;
  do
  {
    for (uint64_t i = 0LL; i != v14; ++i)
    {
      if (*(void *)v30 != v17) {
        objc_enumerationMutation(v12);
      }
      if ([*(id *)(*((void *)&v29 + 1) + 8 * i) isEqualToString:v9])
      {
        v15 |= [v9 containsString:@"VoiceAssist"];
        char v16 = 1;
      }
    }

    uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
  }

  while (v14);

  self = v28;
  if ((v16 & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v19 = (void *)MEMORY[0x189607940];
  UARPStringSupplementalAssetsFilepath();
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stringWithFormat:@"%@/%@", v20, v9];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  char appended = appendFirstUarpFilenameToFilepath(v21, (uint64_t)v27);
  log = v28->_log;
  if ((appended & 1) != 0)
  {
    if (os_log_type_enabled(v28->_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v8;
      __int16 v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_DEFAULT, "Supplemental asset for %@, located at %@", buf, 0x16u);
    }

    if ([v8 suppressAutomaticDynamicAssets])
    {
      id v24 = v28->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v8;
        _os_log_impl( &dword_187DC0000,  v24,  OS_LOG_TYPE_INFO,  "Supplemental Asset Updated: Suppressed Automatic Dynamic Asset Solicitation for %@",  buf,  0xCu);
      }
    }

    else if (([v11 supportsVoiceAssist] & v15) == 1)
    {
      v26 = +[UARPHeySiriModelVoiceAssist tag](&OBJC_CLASS___UARPHeySiriModelVoiceAssist, "tag");
      -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:]( v28,  "solicitDynamicAssetForAccessory:assetTag:error:",  v8,  v26,  v27);
    }
  }

  else if (os_log_type_enabled(v28->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.3();
  }

LABEL_24:
  return appended;
}

- (BOOL)genericNotification:(id)a3 notificationName:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "NSD Notification %@ for accessory %@",  (uint8_t *)&v17,  0x16u);
  }

  [v8 modelNumber];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v11);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ([v9 isEqualToString:@"com.apple.system.powersources.percent"])
    {
      -[UARPUploaderUARP handlePowerSourcePercentChange:](self, "handlePowerSourcePercentChange:", v8);
    }

    else if ([v9 isEqualToString:@"com.apple.uarp.internal.personalization"])
    {
      -[UARPUploaderUARP handlePersonalizationRequest:](self, "handlePersonalizationRequest:", v8);
    }

    else if ([v8 suppressAutomaticDynamicAssets])
    {
      uint64_t v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v8;
        _os_log_impl( &dword_187DC0000,  v14,  OS_LOG_TYPE_INFO,  "BSD Notification: Suppressed Automatic Dynamic Asset Solicitation for %@",  (uint8_t *)&v17,  0xCu);
      }
    }

    else if ([v9 isEqualToString:@"com.apple.corespeech.voicetriggerassetchange"])
    {
      if ([v12 supportsVoiceAssist])
      {
        +[UARPHeySiriModelVoiceAssist tag](&OBJC_CLASS___UARPHeySiriModelVoiceAssist, "tag");
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:]( self,  "solicitDynamicAssetForAccessory:assetTag:error:",  v8,  v15,  a5);
      }

      if ([v12 supportsHeySiriCompact])
      {
        +[UARPHeySiriModelCompact tag](&OBJC_CLASS___UARPHeySiriModelCompact, "tag");
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:]( self,  "solicitDynamicAssetForAccessory:assetTag:error:",  v8,  v16,  a5);
      }
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.1();
  }

  return v12 != 0LL;
}

- (void)queryFirmwareUpdateResultForAccessory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke;
  v7[3] = &unk_18A141D18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke_cold_1(a1, v2, v3);
  }
}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__UARPUploaderUARP_queryProperty_forAccessory___block_invoke;
  block[3] = &unk_18A1431B8;
  void block[4] = self;
  id v11 = v6;
  unint64_t v12 = a3;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

  return 0LL;
}

void __47__UARPUploaderUARP_queryProperty_forAccessory___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = v2;
    [*(id *)(a1 + 32) _queryProperty:*(void *)(a1 + 48) endpoint:v2];
    unsigned int v2 = v3;
  }
}

- (int64_t)_queryProperty:(unint64_t)a3 endpoint:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v8 = log;
    [v6 accessory];
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 getID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 modelIdentifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 accessory];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 serialNumber];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 accessory];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 uuid];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    v22 = v14;
    __int16 v23 = 2080;
    id v24 = UARPAccessoryPropertyToString(a3);
    _os_log_impl( &dword_187DC0000,  v8,  OS_LOG_TYPE_INFO,  "UARP.QUERY.INFO %@ <SN=%@> <UUID=%@>; property is <%s>",
      buf,
      0x2Au);
  }

  UARPPlatformControllerQueryProperty(self, v6, a3);

  return 0LL;
}

- (BOOL)solicitDynamicAssetForAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "Solicit Dynamic Asset from accessory\n%@%@",  (uint8_t *)&v13,  0x16u);
  }

  BOOL v11 = -[UARPUploaderUARP solicitDynamicAssetForAccessory:asset:internalSolicit:error:]( self,  "solicitDynamicAssetForAccessory:asset:internalSolicit:error:",  v8,  v9,  0LL,  a5);

  return v11;
}

- (BOOL)solicitDynamicAssetForAccessory:(id)a3 assetTag:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uarpDynamicAssetURL(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    BOOL v11 = -[UARPAssetID initWithLocationType:assetTag:url:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:assetTag:url:",  10LL,  v9,  v10);
    unint64_t v12 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", v11);
    BOOL v13 = -[UARPUploaderUARP solicitDynamicAssetForAccessory:asset:internalSolicit:error:]( self,  "solicitDynamicAssetForAccessory:asset:internalSolicit:error:",  v8,  v12,  1LL,  a5);
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:].cold.1();
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)solicitDynamicAssetForAccessory:(id)a3 asset:(id)a4 internalSolicit:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke;
  v15[3] = &unk_18A1436B8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  BOOL v18 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async((dispatch_queue_t)queue, v15);

  return 1;
}

void __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke( uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1 + 40;
  [*(id *)(a1 + 32) qFindRemoteEndpointForAccessory:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(v2 - 8);
  id v5 = *(void **)(v4 + 24);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 24), OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 48);
      log = v5;
      [v6 id];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 tag];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 56)) {
        id v9 = @"Internal";
      }
      else {
        id v9 = @"External";
      }
      [*(id *)(a1 + 40) getID];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 modelIdentifier];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) serialNumber];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) uuid];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      id v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.SOLICIT %@ <%@> from %@ <SN=%@> <UUID=%@>",  buf,  0x34u);
    }

    UARPPlatformControllerPrepareSolicitedDynamicAsset( *(void *)(a1 + 32),  v3,  *(void **)(a1 + 48),  *(unsigned __int8 *)(a1 + 56));
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (UARPPlatformControllerSolicitDynamicAsset(*(void **)(a1 + 32), v3, v14)
      && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24LL), OS_LOG_TYPE_ERROR))
    {
      __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(*(os_log_t *)(v4 + 24), OS_LOG_TYPE_ERROR))
  {
    __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_1();
  }
}

- (BOOL)solicitDynamicAssetForRemoteEndpoint:(id)a3 assetTag:(id)a4 internalSolicit:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  uarpDynamicAssetURL(v10);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v12 = -[UARPAssetID initWithLocationType:assetTag:url:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:assetTag:url:",  10LL,  v10,  v11);
    id v13 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", v12);
    id v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      log = v14;
      __int16 v15 = v12;
      BOOL v16 = v6;
      int v17 = [v9 downstreamID];
      -[UARPAsset id](v13, "id");
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 tag];
      __int16 v20 = (void *)v19;
      __int16 v21 = @"External";
      *(_DWORD *)buf = 67109634;
      int v31 = v17;
      BOOL v6 = v16;
      id v12 = v15;
      __int16 v32 = 2112;
      if (v6) {
        __int16 v21 = @"Internal";
      }
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      __int16 v35 = v21;
      _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "UARP.SOLICIT <DS.ID=%u> %@ <%@>", buf, 0x1Cu);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke;
    block[3] = &unk_18A1436B8;
    void block[4] = self;
    id v27 = v9;
    __int16 v28 = v13;
    BOOL v29 = v6;
    __int16 v23 = v13;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:].cold.1();
  }

  return v11 != 0LL;
}

void __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 40);
  UARPPlatformControllerPrepareSolicitedDynamicAsset( *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void **)(a1 + 48),  *(unsigned __int8 *)(a1 + 56));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UARPPlatformControllerSolicitDynamicAsset(*(v2 - 1), *v2, v3)
    && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24LL), OS_LOG_TYPE_ERROR))
  {
    __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke_cold_1();
  }
}

- (BOOL)offerDynamicAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke;
  block[3] = &unk_18A143690;
  void block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)queue, block);

  return 1;
}

void __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "Offer dynamic asset %@ to accessory %@", buf, 0x16u);
  }

  [*(id *)(a1 + 32) qFindRemoteEndpointForAccessory:*(void *)(a1 + 48)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    BOOL v16 = objc_alloc(&OBJC_CLASS___UARPAssetTag);
    [*(id *)(a1 + 40) id];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 tag];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v15 = [v17 char1];
    [*(id *)(a1 + 40) id];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 tag];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 char2];
    [*(id *)(a1 + 40) id];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 tag];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 char3];
    [*(id *)(a1 + 40) id];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 tag];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( v16,  "initWithChar1:char2:char3:char4:",  v15,  v8,  v11,  [v13 char4]);

    [*(id *)(a1 + 32) offerDynamicAssetToAccessory:v5 asset:*(void *)(a1 + 40) internalOffer:0 tag:v14];
  }

  else if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24LL), OS_LOG_TYPE_ERROR))
  {
    __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke_cold_1();
  }
}

- (BOOL)unsolicitedDynamicAssetForAccessory:(id)a3 assetTag:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke;
  block[3] = &unk_18A143690;
  void block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)queue, block);

  return 1;
}

uint64_t __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24LL), OS_LOG_TYPE_DEBUG)) {
    __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke_cold_1();
  }
  [*(id *)(a1 + 40) char1];
  [*(id *)(a1 + 40) char2];
  [*(id *)(a1 + 40) char3];
  return [*(id *)(a1 + 40) char4];
}

- (BOOL)handlePowerSource:(id)a3 currentCapacity:(unint64_t)a4 maxCapacity:(unint64_t)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v35 = a4;
    __int16 v36 = 2048;
    unint64_t v37 = a5;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "Power Source Current Capacity is %lu. Max Power is %lu.",  buf,  0x16u);
  }

  unint64_t v10 = a5 | a4;
  if (a5 | a4)
  {
    -[UARPUploaderUARP qFindRemoteEndpointForAccessory:](self, "qFindRemoteEndpointForAccessory:", v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v11;
    if (v11)
    {
      if (a5) {
        float v13 = (float)((float)a4 / (float)a5) * 100.0;
      }
      else {
        float v13 = 0.0;
      }
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      objc_msgSend(v11, "txFirmwareAssets", a5 | a4, v8);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(obj);
            }
            __int16 v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (![v18 minimumHostBatteryLevel] && !objc_msgSend(v18, "triggerHostBatteryLevel"))
            {
              uint64_t v25 = self->_log;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
                -[UARPUploaderUARP handlePowerSource:currentCapacity:maxCapacity:].cold.1(v25);
              }
              goto LABEL_28;
            }

            if (v13 < (float)(unint64_t)[v18 minimumHostBatteryLevel])
            {
              uint64_t v19 = self->_log;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                uint64_t v20 = v19;
                uint64_t v21 = [v18 minimumHostBatteryLevel];
                *(_DWORD *)buf = 138412802;
                unint64_t v35 = (unint64_t)v18;
                __int16 v36 = 2048;
                unint64_t v37 = (unint64_t)v13;
                __int16 v38 = 2048;
                uint64_t v39 = v21;
                _os_log_impl( &dword_187DC0000,  v20,  OS_LOG_TYPE_INFO,  "Power Source: Asset <%@> pausing due to minimum host battery level of %lu, tlv says %lu",  buf,  0x20u);
              }

              UARPPlatformControllerPauseAssetTransfers(self, v12);
            }

            if (v13 > (float)(unint64_t)[v18 triggerHostBatteryLevel])
            {
              uint64_t v22 = self->_log;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                uint64_t v23 = v22;
                uint64_t v24 = [v18 triggerHostBatteryLevel];
                *(_DWORD *)buf = 138412802;
                unint64_t v35 = (unint64_t)v18;
                __int16 v36 = 2048;
                unint64_t v37 = (unint64_t)v13;
                __int16 v38 = 2048;
                uint64_t v39 = v24;
                _os_log_impl( &dword_187DC0000,  v23,  OS_LOG_TYPE_INFO,  "Power Source: Asset <%@> resuming due to trigger host battery level of %lu, tlv says %lu",  buf,  0x20u);
              }

              UARPPlatformControllerResumeAssetTransfers(self, v12);
            }
          }

          uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

- (void)handlePowerSourcePercentChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __51__UARPUploaderUARP_handlePowerSourcePercentChange___block_invoke;
  v7[3] = &unk_18A141D18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __51__UARPUploaderUARP_handlePowerSourcePercentChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = v2;
    [*(id *)(a1 + 32) qHandlePowerSourcePercentChange:v2];
    uint64_t v2 = v3;
  }
}

- (void)qHandlePowerSourcePercentChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CFTypeRef v5 = IOPSCopyPowerSourcesInfo();
  if (v5)
  {
    id v6 = v5;
    id v7 = IOPSCopyPowerSourcesList(v5);
    if (v7)
    {
      id v8 = v7;
      if (CFArrayGetCount(v7) >= 1)
      {
        CFIndex v10 = 0LL;
        *(void *)&__int128 v9 = 134218242LL;
        __int128 v19 = v9;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v10);
          IOPSGetPowerSourceDescription(v6, ValueAtIndex);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 objectForKey:@"Current Capacity"];
          float v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 objectForKey:@"Max Capacity"];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            CFIndex v21 = v10;
            __int16 v22 = 2112;
            uint64_t v23 = v12;
            _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "Power Source Description for index %ld is %@",  buf,  0x16u);
          }

          objc_msgSend(v4, "accessory", v19);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v17 = -[UARPUploaderUARP handlePowerSource:currentCapacity:maxCapacity:]( self,  "handlePowerSource:currentCapacity:maxCapacity:",  v16,  [v13 unsignedIntegerValue],  objc_msgSend(v14, "unsignedIntegerValue"));

          if (v17) {
            break;
          }
          ++v10;
        }

        while (v10 < CFArrayGetCount(v8));
      }

      CFRelease(v6);
      __int16 v18 = v8;
    }

    else
    {
      __int16 v18 = (const __CFArray *)v6;
    }

    CFRelease(v18);
  }
}

- (void)handlePersonalizationRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[UARPUploaderUARP handlePersonalizationRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke;
  v8[3] = &unk_18A141D18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);
}

void __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v10 = 136315394;
    id v11 = "-[UARPUploaderUARP handlePersonalizationRequest:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "%s: on queue %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = a1 + 40;
  [*(id *)(v4 - 8) qFindRemoteEndpointForAccessory:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = *(os_log_s **)(*(void *)(v4 - 8) + 24LL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_2((uint64_t)v6, v7, v9);
    }
    [v6 handlePersonalizationRequest];
  }

  else if (v8)
  {
    __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_1();
  }
}

- (void)discoverDownstreamEndpoints:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke;
  v7[3] = &unk_18A141D18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  [*(id *)(a1 + 32) qFindRemoteEndpointForAccessory:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(os_log_t **)(v1 - 8);
  if (v2)
  {
    UarpLayer4DiscoverDownstreamEndpoints(v3, v2);
  }

  else if (os_log_type_enabled(v3[3], OS_LOG_TYPE_ERROR))
  {
    __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke_cold_1();
  }
}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4 downstreamID:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __60__UARPUploaderUARP_queryProperty_forAccessory_downstreamID___block_invoke;
  v12[3] = &unk_18A1437D0;
  v12[4] = self;
  id v13 = v8;
  unint64_t v14 = a5;
  unint64_t v15 = a3;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)queue, v12);

  return 0LL;
}

void __60__UARPUploaderUARP_queryProperty_forAccessory_downstreamID___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    [v2 downstreamEndpoint:*(void *)(a1 + 48)];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      [*(id *)(a1 + 32) _queryProperty:*(void *)(a1 + 56) endpoint:v3];
    }

    uint64_t v2 = v4;
  }
}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 downstreamID:(unint64_t)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = log;
    [v10 id];
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 assetVersion];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 getID];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 modelIdentifier];
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 serialNumber];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 uuid];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2112;
    BOOL v29 = v15;
    __int16 v30 = 2112;
    __int128 v31 = v16;
    __int16 v32 = 2112;
    __int128 v33 = v17;
    _os_log_impl( &dword_187DC0000,  v12,  OS_LOG_TYPE_INFO,  "UARP.OFFER asset version %@ to <DSID=%lu> %@ <SN=%@> <UUID=%@>",  buf,  0x34u);
  }

  -[UARPUploaderUARP addMappingDatabaseFromAsset:](self, "addMappingDatabaseFromAsset:", v10);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  queue = self->_queue;
  *(void *)&buf[16] = 0x2020000000LL;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__UARPUploaderUARP_offerAssetToAccessory_asset_downstreamID_error___block_invoke;
  block[3] = &unk_18A143918;
  void block[4] = self;
  id v24 = v9;
  uint64_t v26 = buf;
  unint64_t v27 = a5;
  id v25 = v10;
  id v19 = v10;
  id v20 = v9;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(buf, 8);
  return 1;
}

void __67__UARPUploaderUARP_offerAssetToAccessory_asset_downstreamID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v7 = v2;
    [v2 downstreamEndpoint:*(void *)(a1 + 64)];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = UARPPlatformControllerOfferFirmwareAsset( *(void **)(a1 + 32),  v3,  *(void **)(a1 + 48));
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
      {
        id v4 = *(void **)(a1 + 32);
        uint64_t v5 = *(void *)(a1 + 40);
        [*(id *)(a1 + 48) id];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 firmwareStagingComplete:v5 assetID:v6 withStatus:4];
      }
    }

    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 27;
    }

    uint64_t v2 = v7;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 27;
  }
}

- (id)firmwareAssetIDForDownstreamEndpoint:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 accessory];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUploaderUARP qFindRemoteEndpointForAccessory:](self, "qFindRemoteEndpointForAccessory:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v7 idealTxFirmwareAsset];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (!v8)
    {
      __int128 v31 = self->_log;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        logb = v31;
        int v32 = [v5 downstreamID];
        [v5 accessory];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        [v54 getID];
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 modelIdentifier];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 accessory];
        unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 serialNumber];
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 accessory];
        unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 uuid];
        __int16 v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        int v57 = v32;
        __int16 v58 = 2112;
        v59 = v34;
        __int16 v60 = 2112;
        v61 = v36;
        __int16 v62 = 2112;
        v63 = v38;
        _os_log_impl( &dword_187DC0000,  logb,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No pending asset",  buf,  0x26u);
      }

      BOOL v29 = 0LL;
      goto LABEL_21;
    }

    [v8 asset];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 id];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 downstreamAssetIDs];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v9 asset];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 id];
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 downstreamAssetIDs];
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 count];

      BOOL v17 = self->_log;
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v16)
      {
        if (v18)
        {
          loga = v17;
          int v19 = [v5 downstreamID];
          [v5 accessory];
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          [v53 getID];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 modelIdentifier];
          CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 accessory];
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 serialNumber];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 accessory];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 uuid];
          id v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109890;
          int v57 = v19;
          __int16 v58 = 2112;
          v59 = v21;
          __int16 v60 = 2112;
          v61 = v23;
          __int16 v62 = 2112;
          v63 = v25;
          _os_log_impl( &dword_187DC0000,  loga,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - downstreamAssetIDs' first object",  buf,  0x26u);
        }

        [v9 asset];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 id];
        unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 downstreamAssetIDs];
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 firstObject];
        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }

      if (v18)
      {
        log = v17;
        int v48 = [v5 downstreamID];
        [v5 accessory];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 getID];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 modelIdentifier];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 accessory];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 serialNumber];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 accessory];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v45 uuid];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        int v57 = v48;
        __int16 v58 = 2112;
        v59 = v42;
        __int16 v60 = 2112;
        v61 = v44;
        __int16 v62 = 2112;
        v63 = v46;
        v47 = "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - downstreamAssetIDs array has no entries";
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v39 = self->_log;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        log = v39;
        int v40 = [v5 downstreamID];
        [v5 accessory];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 getID];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 modelIdentifier];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 accessory];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 serialNumber];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 accessory];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v45 uuid];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        int v57 = v40;
        __int16 v58 = 2112;
        v59 = v42;
        __int16 v60 = 2112;
        v61 = v44;
        __int16 v62 = 2112;
        v63 = v46;
        v47 = "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No downstreamAssetIDs array";
LABEL_18:
        _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, v47, buf, 0x26u);
      }
    }

    [v9 asset];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 id];
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }

  __int16 v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[UARPUploaderUARP firmwareAssetIDForDownstreamEndpoint:error:].cold.1(v30, v5);
  }
  BOOL v29 = 0LL;
LABEL_22:

  return v29;
}

- (BOOL)offerFirmwareAssetToDownstreamEndpoint:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    log = v6;
    int v7 = [v5 downstreamID];
    [v5 accessory];
    os_log_t v27 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[os_log_s getID](v27, "getID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 modelIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 accessory];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 serialNumber];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 accessory];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 uuid];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    int v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v9;
    __int16 v35 = 2112;
    __int16 v36 = v11;
    __int16 v37 = 2112;
    __int16 v38 = v13;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@>",  buf,  0x26u);
  }

  char v14 = [v5 isDownstreamEndpoint];
  if ((v14 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __65__UARPUploaderUARP_offerFirmwareAssetToDownstreamEndpoint_error___block_invoke;
    block[3] = &unk_18A141D18;
    void block[4] = self;
    id v30 = v5;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else
  {
    uint64_t v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v28 = v16;
      int v17 = [v5 downstreamID];
      [v5 accessory];
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 getID];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 modelIdentifier];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 accessory];
      CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 serialNumber];
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 accessory];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 uuid];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      int v32 = v17;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2112;
      __int16 v36 = v22;
      __int16 v37 = 2112;
      __int16 v38 = v24;
      _os_log_impl( &dword_187DC0000,  v28,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - not downstream endpoint. No OFFER",  buf,  0x26u);
    }
  }

  return v14;
}

void __65__UARPUploaderUARP_offerFirmwareAssetToDownstreamEndpoint_error___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) firmwareAssetIDForDownstreamEndpoint:*(void *)(a1 + 40) error:0];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", v2);
    id v4 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
    {
      id v5 = *(void **)(a1 + 40);
      log = v4;
      int v6 = [v5 downstreamID];
      [*(id *)(a1 + 40) accessory];
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 getID];
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 modelIdentifier];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) accessory];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 serialNumber];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) accessory];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 uuid];
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      int v38 = v6;
      __int16 v39 = 2112;
      int v40 = v8;
      __int16 v41 = 2112;
      v42 = v10;
      __int16 v43 = 2112;
      v44 = v12;
      __int16 v45 = 2112;
      v46 = v2;
      _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - Offer asset %@",  buf,  0x30u);
    }

    UARPPlatformControllerOfferFirmwareAsset(*(void **)(a1 + 32), *(void **)(a1 + 40), v3);
  }

  else
  {
    id v13 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      char v14 = *(void **)(a1 + 40);
      loga = v13;
      int v15 = [v14 downstreamID];
      [*(id *)(a1 + 40) accessory];
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 getID];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 modelIdentifier];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) accessory];
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 serialNumber];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) accessory];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 uuid];
      CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      int v38 = v15;
      __int16 v39 = 2112;
      int v40 = v17;
      __int16 v41 = 2112;
      v42 = v19;
      __int16 v43 = 2112;
      v44 = v21;
      _os_log_impl( &dword_187DC0000,  loga,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No asset available",  buf,  0x26u);
    }

    if (UARPPlatformControllerNoFirmwareAssetAvailable(*(void **)(a1 + 32), *(void **)(a1 + 40)))
    {
      __int16 v22 = *(void **)(*(void *)(a1 + 32) + 24LL);
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = *(void **)(a1 + 40);
        id v24 = v22;
        int v25 = [v23 downstreamID];
        [*(id *)(a1 + 40) accessory];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 getID];
        os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 modelIdentifier];
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) accessory];
        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 serialNumber];
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) accessory];
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 uuid];
        int v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        int v38 = v25;
        __int16 v39 = 2112;
        int v40 = v28;
        __int16 v41 = 2112;
        v42 = v30;
        __int16 v43 = 2112;
        v44 = v32;
        _os_log_impl( &dword_187DC0000,  v24,  OS_LOG_TYPE_INFO,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - failed",  buf,  0x26u);
      }
    }
  }
}

- (void)applyStagedAssetsForoDownstreamEndpoint:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v6 = log;
    uint64_t v7 = [v4 downstreamID];
    [v4 accessory];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 uuid];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    int v17 = v9;
    _os_log_impl(&dword_187DC0000, v6, OS_LOG_TYPE_INFO, "UARP.APPLY assets <DSID=%lu> <UUID=%@>", buf, 0x16u);
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __60__UARPUploaderUARP_applyStagedAssetsForoDownstreamEndpoint___block_invoke;
  v12[3] = &unk_18A141D18;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async((dispatch_queue_t)queue, v12);
}

void __60__UARPUploaderUARP_applyStagedAssetsForoDownstreamEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  unsigned int v2 = UARPPlatformControllerApplyStagedAssets(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v2)
  {
    unsigned int v3 = v2;
    id v4 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
    {
      id v5 = *(void **)(a1 + 40);
      int v6 = v4;
      uint64_t v7 = [v5 downstreamID];
      [*(id *)(a1 + 40) accessory];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 uuid];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = 134218498;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = uarpStatusCodeToString(v3);
      _os_log_impl( &dword_187DC0000,  v6,  OS_LOG_TYPE_INFO,  "UARP.APPLY assets <DSID=%lu> <UUID=%@> - FAILED <%s>",  (uint8_t *)&v10,  0x20u);
    }
  }

- (id)qFindRemoteEndpointForAccessory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_accessories;
  id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "accessory", (void)v13);
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v4 isEqual:v10];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[UARPUploaderUARP sendMessageToAccessory:uarpMsg:].cold.1(log, v7);
  }
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  [MEMORY[0x189603F48] dataWithData:v7];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__UARPUploaderUARP_sendMessageToAccessory_uarpMsg___block_invoke;
  block[3] = &unk_18A143820;
  __int128 v13 = self;
  __int128 v14 = v15;
  id v12 = v6;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v15, 8);
}

void __51__UARPUploaderUARP_sendMessageToAccessory_uarpMsg___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) accessory];
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 sendMessageToAccessory:v2 uarpMsg:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)watchdogExpireLayer2:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke;
  v7[3] = &unk_18A141D18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  if (UARPPlatformControllerLayer3WatchDogExpired(*(void **)(a1 + 32), *(void **)(a1 + 40)))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
      __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke_cold_1(v2, v3);
    }
  }

- (void)updateManufacturerName:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(0LL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 manufacturer:v6 error:0];
  }
}

- (void)updateModelName:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(1uLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 modelName:v6 error:0];
  }
}

- (void)updateSerialNumber:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(2uLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  [v7 hasFullPersonality:self];
  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 serialNumber:v6 error:0];
  }
}

- (void)updateHardwareVersion:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(3uLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 hardwareVersion:v6 error:0];
  }
}

- (void)updateActiveFirmwareVersion:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(4uLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  [v7 hasFullPersonality:self];
  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 firmwareVersion:v6 error:0];
  }
}

- (void)updateStagedFirmwareVersion:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(5uLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 stagedFirmwareVersion:v6 error:0];
  }
}

- (void)updateLastError:(unint64_t)a3 remoteEndpoint:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v8 = log;
    v11[0] = 67109120;
    v11[1] = [v6 downstreamID];
    _os_log_impl( &dword_187DC0000,  v8,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <Last Error>",  (uint8_t *)v11,  8u);
  }

  if (([v6 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 accessory];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 firmwareUpdateResult:v10 vendorSpecificStatus:a3 error:0];
  }
}

- (void)updateStatistics:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109378;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(6uLL);
    _os_log_impl(&dword_187DC0000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s>", (uint8_t *)v12, 0x12u);
  }

  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 stats:v6 error:0];
  }
}

- (void)updateAppleModelNumber:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(0xBuLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  [v7 hasFullPersonality:self];
  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 appleModelNumber:v6 error:0];
  }
}

- (void)updateHardwareFusingType:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(0xCuLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  [v7 hasFullPersonality:self];
  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 hwFusingType:v6 error:0];
  }
}

- (void)updateFriendlyName:(id)a3 remoteEndpoint:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v12[0] = 67109634;
    v12[1] = [v7 downstreamID];
    __int16 v13 = 2080;
    __int128 v14 = UARPAccessoryPropertyToString(0xDuLL);
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>",  (uint8_t *)v12,  0x1Cu);
  }

  if (([v7 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 accessory];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 queryCompleteForAccessory:v11 friendlyName:v6 error:0];
  }
}

- (void)updateManifestPrefix:(id)a3 remoteEndpoint:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (([v6 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 accessory];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 queryCompleteForAccessory:v8 manifestPrefix:v9 error:0];
  }
}

- (void)updateBoardID:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 boardID:a3 error:0];
  }
}

- (void)updateChipID:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 chipID:a3 error:0];
  }
}

- (void)updateChipRevision:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 chipRevision:a3 error:0];
  }
}

- (void)updateECID:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 ecid:a3 error:0];
  }
}

- (void)updateSecurityDomain:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 securityDomain:a3 error:0];
  }
}

- (void)updateSecurityMode:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 securityMode:a3 error:0];
  }
}

- (void)updateProductionMode:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 productionMode:a3 error:0];
  }
}

- (void)updateChipEpoch:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 epoch:a3 error:0];
  }
}

- (void)updateEnableMixMatch:(BOOL)a3 remoteEndpoint:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 enableMixMatch:v4 error:0];
  }
}

- (void)updateSocLiveNonce:(BOOL)a3 remoteEndpoint:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 liveNonce:v4 error:0];
  }
}

- (void)updatePrefixNeedsLogicalUnitNumber:(BOOL)a3 remoteEndpoint:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 prefixNeedsLUN:v4 error:0];
  }
}

- (void)updateSuffixNeedsLogicalUnitNumber:(BOOL)a3 remoteEndpoint:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (([v8 isDownstreamEndpoint] & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 queryCompleteForAccessory:v7 suffixNeedsLUN:v4 error:0];
  }
}

- (BOOL)shouldSendFirmwareStagingProgressForAccessory:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_isInternalBuild
    && ([v7 id],
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isDynamicAsset],
        v9,
        (v10 & 1) == 0))
  {
    [v6 modelNumber];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v12);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v13 supportsInternalSettings])
    {
      lastReportedProgressTime = self->_lastReportedProgressTime;
      [v6 uuid];
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](lastReportedProgressTime, "objectForKeyedSubscript:", v15);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189603F50] date];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = v17;
      if (v16 && ([v17 timeIntervalSinceDate:v16], v19 < 1.0))
      {
        BOOL v11 = 0;
      }

      else
      {
        id v20 = self->_lastReportedProgressTime;
        [v6 uuid];
        CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v18, v21);

        BOOL v11 = 1;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unsigned)requestBytesInRangeForAccessory:(id)a3 asset:(id)a4 bytes:(void *)a5 length:(unsigned int)a6 offset:(unsigned int)a7 bytesCopied:(unsigned int *)a8 offsetUsed:(unsigned int *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v49 = a3;
  id v14 = a4;
  __int16 v15 = self->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    log = v15;
    [v14 id];
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 tag];
    uint64_t v39 = v10;
    int v40 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v45 = self;
    uint64_t v16 = a6;
    [v49 accessory];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 getID];
    id v47 = v14;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 modelIdentifier];
    v46 = a8;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 accessory];
    unsigned int v44 = a6;
    double v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 serialNumber];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 accessory];
    CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 uuid];
    uint64_t v22 = v10;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    *(void *)v51 = v40;
    *(_WORD *)&v51[8] = 2048;
    *(void *)&v51[10] = v39;
    *(_WORD *)&v51[18] = 2048;
    uint64_t v52 = v16;
    self = v45;
    __int16 v53 = 2112;
    v54 = v18;
    __int16 v55 = 2112;
    v56 = v20;
    __int16 v57 = 2112;
    __int16 v58 = v23;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.DATA.REQ <%@> <offset=%lu> <length=%lu> from %@ <SN=%@> <UUID=%@>",  buf,  0x3Eu);

    uint64_t v10 = v22;
    a6 = v44;

    a8 = v46;
    id v14 = v47;
  }

  unint64_t v24 = [v14 fileLength];
  if (!v24)
  {
    __int16 v36 = self->_log;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v51 = v10;
      *(_WORD *)&v51[4] = 2112;
      *(void *)&v51[6] = v14;
      *(_WORD *)&v51[14] = 1024;
      *(_DWORD *)&v51[16] = a6;
      _os_log_error_impl( &dword_187DC0000,  v36,  OS_LOG_TYPE_ERROR,  "Requested offset (%d) invalid for asset %@ with length (%d)",  buf,  0x18u);
    }

    *a8 = 0;
    goto LABEL_15;
  }

  unint64_t v25 = v24;
  if (v24 > v10)
  {
    if (v24 < v10 + a6)
    {
      a6 = v24 - v10;
      uint64_t v26 = self->_log;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v51 = a6;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v10;
        *(_WORD *)&v51[10] = 2112;
        *(void *)&v51[12] = v14;
        _os_log_debug_impl( &dword_187DC0000,  v26,  OS_LOG_TYPE_DEBUG,  "Can only provide %d bytes from offset %d of asset %@",  buf,  0x18u);
      }
    }

    uint64_t v27 = a6;
    *a8 = a6;
    if (a9) {
      *a9 = v10;
    }
    if (a6)
    {
      objc_msgSend(v14, "getDataInRange:error:", v10, a6, 0);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "getBytes:range:", a5, 0, v27);
      [v49 accessory];
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v29,  "setFirmwareUpdateBytesTransferred:",  *a8 + objc_msgSend(v29, "firmwareUpdateBytesTransferred"));

      [v49 accessory];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 id];
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPUploader firmwareStagingDataBlockTransferred:assetID:offset:blockSize:]( self,  "firmwareStagingDataBlockTransferred:assetID:offset:blockSize:",  v30,  v31,  v10,  v27);

      [v49 accessory];
      int v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = -[UARPUploaderUARP shouldSendFirmwareStagingProgressForAccessory:asset:]( self,  "shouldSendFirmwareStagingProgressForAccessory:asset:",  v32,  v14);

      [v49 accessory];
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 id];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPUploader firmwareStagingProgress:assetID:bytesSent:bytesTotal:filterProgress:]( self,  "firmwareStagingProgress:assetID:bytesSent:bytesTotal:filterProgress:",  v33,  v34,  (v27 + v10),  v25,  v31 ^ 1);

      unsigned int v35 = 0;
      goto LABEL_19;
    }

- (void)assetStagingComplete:(id)a3 asset:(id)a4 status:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    log = v10;
    [v9 id];
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 tag];
    CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = [v8 downstreamID];
    [v8 accessory];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 getID];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 modelIdentifier];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 serialNumber];
    unint64_t v25 = self;
    unint64_t v14 = a5;
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 uuid];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    uint64_t v27 = v21;
    __int16 v28 = 1024;
    int v29 = v20;
    __int16 v30 = 2112;
    __int128 v31 = v12;
    __int16 v32 = 2112;
    __int16 v33 = v15;
    __int16 v34 = 2112;
    unsigned int v35 = v17;
    __int16 v36 = 2080;
    __int16 v37 = UARPFirmwareStagingCompletionStatusToString(v14);
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.STAGE.COMPLETE <%@> from <DSID=%u> %@ <SN=%@> <UUID=%@>; status is <%s>",
      buf,
      0x3Au);

    a5 = v14;
    self = v25;
  }

  if ([v8 isDownstreamEndpoint])
  {
    if (!a5) {
      -[UARPUploaderUARP applyStagedAssetsForoDownstreamEndpoint:](self, "applyStagedAssetsForoDownstreamEndpoint:", v8);
    }
  }

  else
  {
    [v8 accessory];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 id];
    double v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPUploader firmwareStagingComplete:assetID:withStatus:]( self,  "firmwareStagingComplete:assetID:withStatus:",  v18,  v19,  a5);
  }
}

- (void)assetStagingPause:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    log = v5;
    int v6 = [v4 downstreamID];
    [v4 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 getID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 modelIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 accessory];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 serialNumber];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 accessory];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 uuid];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    int v18 = v6;
    __int16 v19 = 2112;
    int v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    unint64_t v24 = v13;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.STAGE.PAUSE from <DSID=%u> %@ <SN=%@> <UUID=%@>",  buf,  0x26u);
  }

  -[UARPUploader controller](self, "controller");
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 accessory];
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 assetStagingPause:v15];
}

- (void)assetStagingResume:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    log = v5;
    int v6 = [v4 downstreamID];
    [v4 accessory];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 getID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 modelIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 accessory];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 serialNumber];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 accessory];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 uuid];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    int v18 = v6;
    __int16 v19 = 2112;
    int v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    unint64_t v24 = v13;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.STAGE.RESUME from <DSID=%u> %@ <SN=%@> <UUID=%@>",  buf,  0x26u);
  }

  -[UARPUploader controller](self, "controller");
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 accessory];
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 assetStagingResume:v15];
}

- (void)rescindStagedAssetsAck:(id)a3 asset:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    v11[0] = 67109120;
    v11[1] = [v6 downstreamID];
    _os_log_impl(&dword_187DC0000, v9, OS_LOG_TYPE_INFO, "UARP.RESCIND.ACK <DSID=%u>", (uint8_t *)v11, 8u);
  }

  if (([v6 isDownstreamEndpoint] & 1) == 0)
  {
    [v6 accessory];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPUploader stagedFirmwareRescindComplete:withStatus:]( self,  "stagedFirmwareRescindComplete:withStatus:",  v10,  6LL);
  }
}

- (void)assetRelease:(id)a3 asset:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Release asset %@", buf, 0xCu);
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  _DWORD v12[2] = __39__UARPUploaderUARP_assetRelease_asset___block_invoke;
  v12[3] = &unk_18A141D18;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)queue, v12);
}

uint64_t __39__UARPUploaderUARP_assetRelease_asset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAsset:*(void *)(a1 + 40)];
}

- (void)applyStagedAssetStatus:(id)a3 status:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    log = v6;
    int v7 = [v5 downstreamID];
    [v5 accessory];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 getID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 modelIdentifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 accessory];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 serialNumber];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 accessory];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 uuid];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    int v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 2080;
    uint64_t v27 = UARPFirmwareApplicationStatusToString(a4);
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.APPLY.COMPLETE from <DSID=%u> %@ <SN=%@> <UUID=%@>; status is <%s>",
      buf,
      0x30u);
  }

  if (([v5 isDownstreamEndpoint] & 1) == 0)
  {
    [v5 accessory];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPUploader stagedFirmwareApplicationComplete:withStatus:]( self,  "stagedFirmwareApplicationComplete:withStatus:",  v15,  a4);
  }
}

- (void)transferPauseAck:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v6 = log;
    int v7 = [v4 downstreamID];
    [v4 accessory];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2112;
    id v11 = v8;
    _os_log_impl(&dword_187DC0000, v6, OS_LOG_TYPE_INFO, "UARP.PAUSE.ACK <DSID=%hu> %@", (uint8_t *)v9, 0x12u);
  }

  [v4 isDownstreamEndpoint];
}

- (void)transferResumeAck:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v6 = log;
    int v7 = [v4 downstreamID];
    [v4 accessory];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2112;
    id v11 = v8;
    _os_log_impl(&dword_187DC0000, v6, OS_LOG_TYPE_INFO, "UARP.RESUME.ACK <DSID=%hu> %@", (uint8_t *)v9, 0x12u);
  }

  [v4 isDownstreamEndpoint];
}

- (void)protocolVersionSelected:(id)a3 protocolVersion:(unsigned __int16)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__UARPUploaderUARP_protocolVersionSelected_protocolVersion___block_invoke;
  block[3] = &unk_18A143940;
  unsigned __int16 v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

void __60__UARPUploaderUARP_protocolVersionSelected_protocolVersion___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) accessory];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 modelNumber];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](&OBJC_CLASS___UARPSupportedAccessory, "findByAppleModelNumber:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setUarpVersion:*(unsigned __int16 *)(a1 + 48)];
  uint64_t v5 = [*(id *)(a1 + 32) uarpVersion];
  [*(id *)(a1 + 32) accessory];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setUarpVersion:v5];

  int v7 = *(void **)(*(void *)(a1 + 40) + 24LL);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    id v8 = *(void **)(a1 + 32);
    log = v7;
    uint64_t v9 = [v8 uarpVersion];
    id v10 = v4;
    int v11 = [*(id *)(a1 + 32) downstreamID];
    [*(id *)(a1 + 32) accessory];
    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 getID];
    unsigned __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 modelIdentifier];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) accessory];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 serialNumber];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) accessory];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 uuid];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    uint64_t v57 = v9;
    __int16 v58 = 1024;
    int v59 = v11;
    id v4 = v10;
    __int16 v60 = 2112;
    v61 = v13;
    __int16 v62 = 2112;
    v63 = v15;
    __int16 v64 = 2112;
    v65 = v17;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.PROTOCOL.VERSION (%lu) <DSID=%hu> for %@ <SN=%@> <UUID=%@>",  buf,  0x30u);
  }

  if ([*(id *)(a1 + 32) uarpVersion])
  {
    [*(id *)(a1 + 32) accessory];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v18 suppressInfoQueries];

    if ((v19 & 1) != 0)
    {
      __int16 v20 = *(void **)(*(void *)(a1 + 40) + 24LL);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = *(void **)(a1 + 32);
        __int16 v22 = v20;
        [v21 accessory];
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = (uint64_t)v23;
        _os_log_impl( &dword_187DC0000,  v22,  OS_LOG_TYPE_INFO,  "Protocol Version Selected: Suppressed Info Queries for %@",  buf,  0xCu);
      }
    }

    else
    {
      [*(id *)(a1 + 40) _queryProperty:2 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:4 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:5 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:12 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:11 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:3 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:0 endpoint:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _queryProperty:1 endpoint:*(void *)(a1 + 32)];
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      [*(id *)(a1 + 32) infoPropertiesToQuery];
      int v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v51;
        do
        {
          for (uint64_t i = 0LL; i != v31; ++i)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v29);
            }
            uarpPlatformEndpointRequestInfoProperty( [*(id *)(a1 + 40) uarpEndpoint],  objc_msgSend(*(id *)(a1 + 32), "uarpEndpoint"),  objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "unsignedLongValue"));
          }

          uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }

        while (v31);
      }

      [*(id *)(a1 + 32) clearQueuedInfoProperties];
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      [*(id *)(a1 + 32) applePropertiesToQuery];
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v47;
        do
        {
          for (uint64_t j = 0LL; j != v36; ++j)
          {
            if (*(void *)v47 != v37) {
              objc_enumerationMutation(v34);
            }
            UARPPlatformEndpointRequestAppleInfoProperty( *(void **)(a1 + 40),  *(void **)(a1 + 32),  [*(id *)(*((void *)&v46 + 1) + 8 * j) unsignedLongValue]);
          }

          uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }

        while (v36);
      }

      [*(id *)(a1 + 32) clearQueuedAppleProperties];
    }

    [*(id *)(a1 + 32) accessory];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    char v40 = [v39 suppressAutomaticDynamicAssets];

    __int16 v41 = *(void **)(a1 + 40);
    if ((v40 & 1) == 0)
    {
      [v41 solicitExpectedDynamicAssets:*(void *)(a1 + 32)];
      goto LABEL_31;
    }

    v42 = (void *)v41[3];
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO))
    {
      __int16 v43 = *(void **)(a1 + 32);
      __int16 v26 = v42;
      [v43 accessory];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = (uint64_t)v27;
      uint64_t v28 = "Protocol Version Selected: Suppressed Automatic Dynamic Asset Solicitation for %@";
      goto LABEL_29;
    }
  }

  else
  {
    __int16 v24 = *(void **)(*(void *)(a1 + 40) + 24LL);
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void **)(a1 + 32);
      __int16 v26 = v24;
      [v25 accessory];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = (uint64_t)v27;
      uint64_t v28 = "Protocol Version Invalid, no further action until a new SYNC occurs %@";
LABEL_29:
      _os_log_impl(&dword_187DC0000, v26, OS_LOG_TYPE_INFO, v28, buf, 0xCu);
    }
  }

- (void)assetSolicitationComplete:(id)a3 asset:(id)a4 status:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    log = v10;
    [v9 id];
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 tag];
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 getID];
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 modelIdentifier];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    unsigned __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 serialNumber];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 accessory];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 uuid];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    uint64_t v25 = v19;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    int v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    __int16 v32 = 2080;
    __int16 v33 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.SOLICIT.COMPLETE <%@> from %@ <SN=%@> <UUID=%@>; status is <%s>",
      buf,
      0x34u);
  }

  -[UARPUploader controller](self, "controller");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 accessory];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 id];
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 assetSolicitationComplete:v17 assetID:v18 withStatus:a5];
}

- (void)assetSolicitationProgress:(id)a3 asset:(id)a4 offset:(unint64_t)a5 assetLength:(unint64_t)a6
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  unsigned __int16 v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v23 = v12;
    [v10 accessory];
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    id v32 = v11;
    __int16 v33 = 2112;
    unint64_t v34 = (unint64_t)v24;
    __int16 v35 = 2048;
    unint64_t v36 = a5;
    __int16 v37 = 2048;
    unint64_t v38 = a6;
    _os_log_debug_impl( &dword_187DC0000,  v23,  OS_LOG_TYPE_DEBUG,  "Asset <%@> Solicitation progress for accessory <%@> offset=<%lu> of total=<%lu>",  buf,  0x2Au);
  }

  id v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    log = v13;
    [v11 id];
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 tag];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 accessory];
    int v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 getID];
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 modelIdentifier];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 accessory];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 serialNumber];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 accessory];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 uuid];
    id v26 = v11;
    unint64_t v18 = a5;
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    id v32 = v25;
    __int16 v33 = 2048;
    unint64_t v34 = v18;
    __int16 v35 = 2048;
    unint64_t v36 = a6;
    __int16 v37 = 2112;
    unint64_t v38 = (unint64_t)v14;
    __int16 v39 = 2112;
    char v40 = v16;
    __int16 v41 = 2112;
    v42 = v19;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "UARP.SOLICIT.PROGRESS <%@> <offset=%lu> <asset length=%lu> from %@ <SN=%@> <UUID=%@>",  buf,  0x3Eu);

    a5 = v18;
    id v11 = v26;
  }

  -[UARPUploader controller](self, "controller");
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 accessory];
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 id];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 assetSolicitationProgress:v21 assetID:v22 bytesReceived:a5 bytesTotal:a6];
}

- (void)offerDynamicAssetToAccessory:(id)a3 asset:(id)a4 internalOffer:(BOOL)a5 tag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke;
  block[3] = &unk_18A143968;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a5;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)queue, block);
}

void __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 40);
    log = v2;
    [v3 id];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 tag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64)) {
      uint64_t v5 = @"Internal";
    }
    else {
      uint64_t v5 = @"External";
    }
    [*(id *)(a1 + 48) accessory];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 getID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 modelIdentifier];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) accessory];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 serialNumber];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) accessory];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 uuid];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    __int16 v22 = v7;
    __int16 v23 = 2112;
    __int16 v24 = v9;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "UARP.OFFER.DA %@ <%@> from %@ <SN=%@> <UUID=%@>", buf, 0x34u);
  }

  id v12 = (void **)(a1 + 48);
  if (UARPPlatformControllerOfferDynamicAsset( *(void **)(a1 + 32),  *(void **)(a1 + 48),  *(void **)(a1 + 40),  *(void **)(a1 + 56),  *(unsigned __int8 *)(a1 + 64)))
  {
    id v13 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke_cold_1(v12, v13);
    }
  }

- (void)processDynamicAssetVoiceAssist:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__UARPUploaderUARP_processDynamicAssetVoiceAssist___block_invoke;
  block[3] = &unk_18A143168;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);
}

uint64_t __51__UARPUploaderUARP_processDynamicAssetVoiceAssist___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = 0LL;
  return [v1 processDynamicAsset:&v3];
}

- (void)processDynamicAssetHeySiriCompact:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__UARPUploaderUARP_processDynamicAssetHeySiriCompact___block_invoke;
  block[3] = &unk_18A143168;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);
}

uint64_t __54__UARPUploaderUARP_processDynamicAssetHeySiriCompact___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = 0LL;
  return [v1 processDynamicAsset:&v3];
}

- (void)solicitExpectedDynamicAssets:(id)a3
{
  id v4 = a3;
  if ([v4 isDownstreamEndpoint])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "Protocol Version Selected: Do not query expected dynamic assets for downstream endpoints",  buf,  2u);
    }
  }

  else
  {
    [v4 accessory];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 modelNumber];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ([v8 supportsHeySiriCompact])
      {
        id v9 = self->_log;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[UARPUploaderUARP solicitExpectedDynamicAssets:].cold.3(v9);
        }
        +[UARPHeySiriModelCompact tag](&OBJC_CLASS___UARPHeySiriModelCompact, "tag");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = 0LL;
        -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:]( self,  "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:",  v4,  v10,  1LL,  &v19);
      }

      if ([v8 supportsAnalytics])
      {
        [v8 hardwareID];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v11 transport];

        if (v12 == 3)
        {
          id v13 = self->_log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[UARPUploaderUARP solicitExpectedDynamicAssets:].cold.2(v13);
          }
          +[UARPDynamicAssetAnalyticsEvent tag](&OBJC_CLASS___UARPDynamicAssetAnalyticsEvent, "tag");
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = 0LL;
          -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:]( self,  "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:",  v4,  v14,  1LL,  &v18);
        }
      }

      if ([v8 supportsVersions])
      {
        id v15 = self->_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[UARPUploaderUARP solicitExpectedDynamicAssets:].cold.1(v15);
        }
        +[UARPDynamicAssetVersions tag](&OBJC_CLASS___UARPDynamicAssetVersions, "tag");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = 0LL;
        -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:]( self,  "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:",  v4,  v16,  1LL,  &v17);
      }
    }
  }
}

- (void)processDynamicAssetVersions:(id)a3 partnerSerialNumbers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke;
    block[3] = &unk_18A143690;
    id v11 = v7;
    uint64_t v12 = self;
    id v13 = v6;
    dispatch_async((dispatch_queue_t)queue, block);
  }
}

void __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) controller];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 updateProperty:35 value:v2 forAccessory:*(void *)(a1 + 48)];

  if ((v4 & 1) == 0 && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 40) + 24LL), OS_LOG_TYPE_ERROR)) {
    __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke_cold_1((uint64_t)v2);
  }
}

- (void)rescindAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __34__UARPUploaderUARP_rescindAssets___block_invoke;
  v7[3] = &unk_18A141D18;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __34__UARPUploaderUARP_rescindAssets___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x189603F18];
  [*(id *)(a1 + 32) accessory];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 arrayWithObject:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) controller];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 rescindStagedFirmwareOnAccessoryList:v5 withUserIntent:0];
}

- (void)rescindedRxDynamicAsset:(id)a3 asset:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Rescinded Dynamic Asset %@", buf, 0xCu);
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  _DWORD v12[2] = __50__UARPUploaderUARP_rescindedRxDynamicAsset_asset___block_invoke;
  v12[3] = &unk_18A141D18;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)queue, v12);
}

uint64_t __50__UARPUploaderUARP_rescindedRxDynamicAsset_asset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) abandonRxDynamicAsset:*(void *)(a1 + 40)];
}

- (void)addMappingDatabaseFromAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__UARPUploaderUARP_addMappingDatabaseFromAsset___block_invoke;
  v7[3] = &unk_18A141D18;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __48__UARPUploaderUARP_addMappingDatabaseFromAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1895B7E8C]();
  uint64_t v3 = objc_alloc(&OBJC_CLASS___UARPDynamicAssetTmapDatabase);
  [*(id *)(a1 + 32) id];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 localURL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = -[UARPDynamicAssetTmapDatabase initTmapDatabase:](v3, "initTmapDatabase:", v5);

  [v6 decomposeUARP];
  id v7 = objc_alloc(&OBJC_CLASS___UARPDynamicAssetCmapDatabase);
  [*(id *)(a1 + 32) id];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 localURL];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[UARPDynamicAssetCmapDatabase initCmapDatabase:](v7, "initCmapDatabase:", v9);

  [v10 decomposeUARP];
  [*(id *)(a1 + 40) qProcessDynamicAssets];

  objc_autoreleasePoolPop(v2);
}

- (void)addUnprocessedDynamicAsset:(id)a3 withAssetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__UARPUploaderUARP_addUnprocessedDynamicAsset_withAssetTag___block_invoke;
  block[3] = &unk_18A143690;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

void __60__UARPUploaderUARP_addUnprocessedDynamicAsset_withAssetTag___block_invoke(void *a1)
{
  uint64_t v2 = -[UARPSuperBinaryAsset initWithURL:assetTag:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset),  "initWithURL:assetTag:",  a1[4],  a1[5]);
  [*(id *)(a1[6] + 1232) addObject:v2];
}

- (void)qProcessDynamicAssets
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "UARP Processing Dynamic Assets.", buf, 2u);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
  id obj = self->_unprocessedDynamicAssets;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v8 assetTag];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[UARPDynamicAssetMappedAnalyticsEvent tag](&OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent, "tag");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          BOOL v11 = 0;
        }
        +[UARPDynamicAssetCrashLogEvent tag](&OBJC_CLASS___UARPDynamicAssetCrashLogEvent, "tag");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v9 isEqual:v12])
        {
          if (!v11) {
            goto LABEL_16;
          }
LABEL_15:
          [v13 addObject:v8];
          goto LABEL_16;
        }

        if (-[UARPUploaderUARP qProcessCrshDynamicAsset:](self, "qProcessCrshDynamicAsset:", v8)) {
          goto LABEL_15;
        }
LABEL_16:
      }

      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeObjectsInArray:](self->_unprocessedDynamicAssets, "removeObjectsInArray:", v13);
}

- (void)ageOutUnprocessedDynamicAssets
{
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__UARPUploaderUARP_ageOutUnprocessedDynamicAssets__block_invoke;
  block[3] = &unk_18A143168;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

void __50__UARPUploaderUARP_ageOutUnprocessedDynamicAssets__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "UARP Aging out old Dynamic Assets.", buf, 2u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 1232LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "timeCreated", (void)v12);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 timeIntervalSinceNow];
        double v11 = v10;

        if (v11 >= 604800.0) {
          [*(id *)(*(void *)(a1 + 32) + 1232) removeObject:v8];
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v5);
  }
}

- (BOOL)qProcessMticDynamicAsset:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "Processing Existing MTIC Dynamic Asset with new TMAP",  v10,  2u);
  }

  [v4 url];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[UARPDynamicAssetMappedAnalyticsEvent initWithURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent),  "initWithURL:",  v6);
  if (-[UARPDynamicAssetMappedAnalyticsEvent decomposeUARP](v7, "decomposeUARP"))
  {
    if (!-[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP](v7, "findMatchingTMAP"))
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }

    if (-[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads](v7, "expandMTICPayloads")) {
      -[UARPDynamicAssetMappedAnalyticsEvent send](v7, "send");
    }
  }

  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (BOOL)qProcessCrshDynamicAsset:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "Processing Existing CRSH Dynamic Asset with new CMAP",  v10,  2u);
  }

  [v4 url];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[UARPDynamicAssetCrashLogEvent initWithURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetCrashLogEvent),  "initWithURL:",  v6);
  if (-[UARPDynamicAssetCrashLogEvent decomposeUARP](v7, "decomposeUARP"))
  {
    if (!-[UARPDynamicAssetCrashLogEvent findMatchingCMAP](v7, "findMatchingCMAP"))
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }

    if (-[UARPDynamicAssetCrashLogEvent processCrashInstance](v7, "processCrashInstance")) {
      -[UARPDynamicAssetCrashLogEvent sendSpeedTracer](v7, "sendSpeedTracer");
    }
  }

  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (BOOL)startTapToRadar:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self->_isTapToRadarMode)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Already in Tap To Radar Mode.", buf, 2u);
    }
  }

  else
  {
    self->_isTapToRadarMode = 1;
    objc_storeStrong((id *)&self->_ttrDirectory, a3);
    -[UARPUploaderUARP copyDynamicAssetsForTapToRadar](self, "copyDynamicAssetsForTapToRadar");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = self->_accessories;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          -[UARPUploaderUARP solicitDynamicAssetsForTapToRadar:]( self,  "solicitDynamicAssetsForTapToRadar:",  *(void *)(*((void *)&v13 + 1) + 8 * v11++),  (void)v13);
        }

        while (v9 != v11);
        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v9);
    }
  }

  return 1;
}

- (void)stopTapToRadar
{
  self->_isTapToRadarMode = 0;
  ttrDirectory = self->_ttrDirectory;
  self->_ttrDirectory = 0LL;
}

- (void)solicitDynamicAssetsForTapToRadar:(id)a3
{
  id v4 = a3;
  [v4 appleModelNumber];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](&OBJC_CLASS___UARPSupportedAccessory, "findByAppleModelNumber:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "UARP.TTR.Solicit Dynamic Assets for Radar.", v9, 2u);
  }

  if ([v6 ttrSolicitLogs])
  {
    uint64_t v8 = -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"LOGS");
    -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:]( self,  "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:",  v4,  v8,  1LL,  0LL);
  }
}

- (void)copyDynamicAssetsForTapToRadar
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896078A8] defaultManager];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringLogsDirectoryFilePath();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 contentsOfDirectoryAtPath:v4 error:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        UARPStringLogsDirectoryFilePath();
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](self->_ttrDirectory, "path");
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        UARPCopyFile((uint64_t)v12, v13, v11);

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v8);
  }

  [MEMORY[0x1896078A8] defaultManager];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringCrashAnalyticsDirectoryFilePath();
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 contentsOfDirectoryAtPath:v15 error:0];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
        UARPStringCrashAnalyticsDirectoryFilePath();
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](self->_ttrDirectory, "path", (void)v25);
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
        UARPCopyFile((uint64_t)v23, v24, v22);

        ++v21;
      }

      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v19);
  }
}

- (id)pendingTssRequests
{
  id v3 = (void *)objc_opt_new();
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = __38__UARPUploaderUARP_pendingTssRequests__block_invoke;
  uint64_t v11 = &unk_18A141D18;
  __int128 v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync((dispatch_queue_t)queue, &v8);
  objc_msgSend(MEMORY[0x189603F18], "arrayWithArray:", v5, v8, v9, v10, v11, v12);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __38__UARPUploaderUARP_pendingTssRequests__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 1120LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 32),  "pendingTssRequestForEndpoint:",  *(void *)(*((void *)&v8 + 1) + 8 * v6),  (void)v8);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7) {
          [*(id *)(a1 + 40) addObjectsFromArray:v7];
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

- (id)pendingTssRequestForEndpoint:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_new();
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v29 = v4;
  [v4 rxDynamicAssets];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v32)
  {
    uint64_t v6 = *(void *)v34;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v32; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        __int128 v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v8 pendingTssRequest];
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            __int128 v11 = log;
            [v8 pendingTssRequest];
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 tatsuServerURL];
            uint64_t v13 = self;
            __int128 v14 = v5;
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 pendingTssRequest];
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 options];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            unint64_t v38 = "-[UARPUploaderUARP pendingTssRequestForEndpoint:]";
            __int16 v39 = 2112;
            char v40 = v15;
            __int16 v41 = 2112;
            v42 = v17;
            _os_log_impl( &dword_187DC0000,  v11,  OS_LOG_TYPE_INFO,  "%s: Pending TSS request for Signing Server %@ is %@",  buf,  0x20u);

            uint64_t v5 = v14;
            self = v13;
            uint64_t v6 = v30;
          }

          uint64_t v18 = (void *)MEMORY[0x189603FC8];
          [v8 pendingTssRequest];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 options];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 dictionaryWithDictionary:v20];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

          [v8 pendingTssRequest];
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 tatsuServerURL];
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 absoluteString];
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 setObject:v24 forKeyedSubscript:@"tatsuSigningServer"];

          __int128 v25 = self->_log;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            unint64_t v38 = "-[UARPUploaderUARP pendingTssRequestForEndpoint:]";
            __int16 v39 = 2112;
            char v40 = v21;
            _os_log_impl(&dword_187DC0000, v25, OS_LOG_TYPE_INFO, "%s: Modified Pending TSS request is %@", buf, 0x16u);
          }

          [MEMORY[0x189603F68] dictionaryWithDictionary:v21];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v26];
        }
      }

      uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v32);
  }

  [MEMORY[0x189603F18] arrayWithArray:v5];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)tssResponse:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__UARPUploaderUARP_tssResponse___block_invoke;
  block[3] = &unk_18A141D18;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __32__UARPUploaderUARP_tssResponse___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v2 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    id v17 = "-[UARPUploaderUARP tssResponse:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    _os_log_impl( &dword_187DC0000,  v2,  OS_LOG_TYPE_INFO,  "%s: Checking pending TSS requests for response %@",  buf,  0x16u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 1120LL);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend( *(id *)(a1 + 32),  "tssResponseForEndpoint:tssResponse:",  *(void *)(*((void *)&v11 + 1) + 8 * i),  *(void *)(a1 + 40),  (void)v11))
        {
          __int128 v9 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            uint64_t v10 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 136315394;
            id v17 = "-[UARPUploaderUARP tssResponse:]_block_invoke";
            __int16 v18 = 2112;
            uint64_t v19 = v10;
            _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "%s: Matched TSS requests with response %@",  buf,  0x16u);
          }

          goto LABEL_14;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)tssResponseForEndpoint:(id)a3 tssResponse:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    __int128 v15 = "-[UARPUploaderUARP tssResponseForEndpoint:tssResponse:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_INFO,  "%s: Check matching TSS requests for %@",  (uint8_t *)&v14,  0x16u);
  }

  int v9 = [v6 handlePersonalizationResponse:v7];
  uint64_t v10 = self->_log;
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      int v14 = 136315394;
      __int128 v15 = "-[UARPUploaderUARP tssResponseForEndpoint:tssResponse:]";
      __int16 v16 = 2112;
      id v17 = v6;
      __int128 v12 = "%s: matching TSS request for %@";
LABEL_8:
      _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0x16u);
    }
  }

  else if (v11)
  {
    int v14 = 136315394;
    __int128 v15 = "-[UARPUploaderUARP tssResponseForEndpoint:tssResponse:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int128 v12 = "%s: No matching TSS requests for %@";
    goto LABEL_8;
  }

  return 0;
}

- (BOOL)isTapToRadarMode
{
  return self->_isTapToRadarMode;
}

- (NSURL)ttrDirectory
{
  return (NSURL *)objc_getProperty(self, a2, 1216LL, 1);
}

- (void).cxx_destruct
{
  for (uint64_t i = 8LL; i != -1; --i)
    objc_storeStrong((id *)&self->_tokens[i], 0LL);
  objc_storeStrong((id *)&self->_accessories, 0LL);
  objc_storeStrong((id *)&self->_queue, 0LL);
  objc_storeStrong((id *)&self->_log, 0LL);
}

  ;
}

- (void)addAccessory:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Add accessory %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryReachable:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Reachable accessory %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryReachable:remoteEndpoint:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Reachable remoteEndpoint %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)recvDataFromAccessory:data:error:.cold.1()
{
}

void __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  id v4 = "-[UARPUploaderUARP recvDataFromAccessory:data:error:]_block_invoke";
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, a1, a3, "%s: could not find remote endpoint", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)recvDataFromEndpoint:data:error:.cold.1()
{
}

void __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke_cold_1(void *a1, unsigned int a2)
{
  int v3 = (os_log_s *)OUTLINED_FUNCTION_12_0(a1);
  uarpStatusCodeToString(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v3, v4, "UARPPlatformControllerRecvMessage() returned %s", v5);

  OUTLINED_FUNCTION_2_3();
}

void __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_1()
{
  int v2 = 136315394;
  int v3 = "-[UARPUploaderUARP offerAssetToAccessory:asset:error:]_block_invoke";
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%s: could not find remote endpoint for accessory %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_2( uint64_t a1,  void *a2,  uint64_t *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unsigned int v4 = *(_DWORD *)(*(void *)(*(void *)a1 + 8LL) + 24LL);
  uint64_t v5 = a2;
  id v6 = uarpStatusCodeToString(v4);
  uint64_t v7 = *a3;
  int v8 = 136315650;
  int v9 = "-[UARPUploaderUARP offerAssetToAccessory:asset:error:]_block_invoke";
  __int16 v10 = 2080;
  BOOL v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_error_impl( &dword_187DC0000,  v5,  OS_LOG_TYPE_ERROR,  "%s: failed to offer firmware <%s> for accessory %@",  (uint8_t *)&v8,  0x20u);
}

- (void)pauseAssetTransfersForAccessory:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Pause asset transfers %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)resumeAssetTransfersForAccessory:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Resume asset transfers %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)cancelAssetStagingForAccessory:asset:.cold.1()
{
}

- (void)supplementalAssetUpdated:assetName:error:.cold.1()
{
}

- (void)supplementalAssetUpdated:assetName:error:.cold.2()
{
}

- (void)supplementalAssetUpdated:assetName:error:.cold.3()
{
}

void __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, a2, a3, "Query last action/status for accessory %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)solicitDynamicAssetForAccessory:assetTag:error:.cold.1()
{
}

void __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_1()
{
}

void __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_2()
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = v1;
  OUTLINED_FUNCTION_3( &dword_187DC0000,  v1,  v2,  "Could not solicit Dynamic Asset from accessory\n%@%@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke_cold_1()
{
}

void __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke_cold_1()
{
}

void __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl( &dword_187DC0000,  v0,  OS_LOG_TYPE_DEBUG,  "Unsolicited Dynamic Asset %@\nfrom accessory %@",  v1,  0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePowerSource:(os_log_t)log currentCapacity:maxCapacity:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_DEBUG,  "Power Source: Asset not using host battery level",  v1,  2u);
}

void __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_1()
{
  int v2 = 136315394;
  uint64_t v3 = "-[UARPUploaderUARP handlePersonalizationRequest:]_block_invoke";
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%s: no matching remote endpoint %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136315394;
  uint64_t v4 = "-[UARPUploaderUARP handlePersonalizationRequest:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5(&dword_187DC0000, a2, a3, "%s: remote endpoint %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke_cold_1()
{
}

- (void)firmwareAssetIDForDownstreamEndpoint:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1;
  int v4 = [a2 downstreamID];
  [a2 accessory];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 getID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 modelIdentifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 accessory];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 serialNumber];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 accessory];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 uuid];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 67109890;
  v12[1] = v4;
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  __int16 v16 = v9;
  __int16 v17 = 2112;
  uint64_t v18 = v11;
  _os_log_error_impl( &dword_187DC0000,  v3,  OS_LOG_TYPE_ERROR,  "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No direct endpoint",  (uint8_t *)v12,  0x26u);
}

- (void)sendMessageToAccessory:(void *)a1 uarpMsg:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)OUTLINED_FUNCTION_12_0(a1);
  [a2 length];
  [(id)OUTLINED_FUNCTION_16() accessory];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109378;
  v5[1] = (_DWORD)a2;
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_187DC0000, v3, OS_LOG_TYPE_DEBUG, "Send %d bytes to accessory %@", (uint8_t *)v5, 0x12u);

  OUTLINED_FUNCTION_13_1();
}

void __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [(id)OUTLINED_FUNCTION_16() accessory];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_187DC0000, v2, OS_LOG_TYPE_ERROR, "Failed to service TX Queue %@", v5, 0xCu);

  OUTLINED_FUNCTION_2_3();
}

void __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke_cold_1( void **a1,  void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  id v3 = a2;
  [v2 accessory];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138412546;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5( &dword_187DC0000,  v3,  v5,  "Failed to offering dynamic asset; accessory is %@ asset is %@",
    (uint8_t *)&v6);

  OUTLINED_FUNCTION_13_1();
}

- (void)solicitExpectedDynamicAssets:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v1, v3, "Solicit VERS from accessory %@", v4);

  OUTLINED_FUNCTION_2_3();
}

- (void)solicitExpectedDynamicAssets:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v1, v3, "Solicit TICS (expected Dynamic Assets) from accessory %@", v4);

  OUTLINED_FUNCTION_2_3();
}

- (void)solicitExpectedDynamicAssets:(void *)a1 .cold.3(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v1, v3, "Solicit HSML from accessory %@", v4);

  OUTLINED_FUNCTION_2_3();
}

void __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke_cold_1( uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_3( &dword_187DC0000,  v1,  v2,  "Failed to send partnerSerialNumbers %@ for accessory %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end