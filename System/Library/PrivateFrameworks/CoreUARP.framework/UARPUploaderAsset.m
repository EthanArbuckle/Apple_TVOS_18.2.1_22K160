@interface UARPUploaderAsset
- (BOOL)internalSolicit;
- (BOOL)invalidHwRevision;
- (UARPAsset)asset;
- (UARPAssetVersion)assetVersion;
- (UARPDynamicAssetPersonalization)pendingTssRequest;
- (UARPSuperBinaryAsset)uarpSuperBinary;
- (UARPUploaderAsset)initWithUARPAsset:(id)a3 remoteEndpoint:(id)a4 callbacks:(uarpPlatformAssetCallbacks *)a5 internalSolicit:(BOOL)a6;
- (UARPUploaderEndpoint)remoteEndpoint;
- (id)description;
- (uarpPlatformAsset)uarpAsset;
- (uarpPlatformAssetCallbacks)uarpCallbacks;
- (unint64_t)assetLength;
- (unint64_t)formatVersion;
- (unint64_t)minimumHostBatteryLevel;
- (unint64_t)numPayloads;
- (unint64_t)selectedPayload;
- (unint64_t)triggerHostBatteryLevel;
- (void)processHostTLVs;
- (void)setAssetLength:(unint64_t)a3;
- (void)setAssetVersion:(id)a3;
- (void)setFormatVersion:(unint64_t)a3;
- (void)setNumPayloads:(unint64_t)a3;
- (void)setPendingTssRequest:(id)a3;
- (void)setSelectedPayload:(unint64_t)a3;
- (void)setUarpPlatformAsset:(uarpPlatformAsset *)a3;
- (void)setUarpSuperBinary:(id)a3;
@end

@implementation UARPUploaderAsset

- (UARPUploaderAsset)initWithUARPAsset:(id)a3 remoteEndpoint:(id)a4 callbacks:(uarpPlatformAssetCallbacks *)a5 internalSolicit:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___UARPUploaderAsset;
  v13 = -[UARPUploaderAsset init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    objc_storeWeak((id *)&v14->_remoteEndpoint, v12);
    __int128 v15 = *(_OWORD *)&a5->fAssetMetaDataComplete;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetReady = *(_OWORD *)&a5->fAssetReady;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetMetaDataComplete = v15;
    __int128 v16 = *(_OWORD *)&a5->fPayloadReady;
    __int128 v17 = *(_OWORD *)&a5->fPayloadMetaDataComplete;
    __int128 v18 = *(_OWORD *)&a5->fPayloadDataComplete2;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadData = *(_OWORD *)&a5->fPayloadData;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadDataComplete2 = v18;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadReady = v16;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadMetaDataComplete = v17;
    __int128 v19 = *(_OWORD *)&a5->fAssetSetBytesAtOffset2;
    __int128 v20 = *(_OWORD *)&a5->fAssetRescindedAck;
    __int128 v21 = *(_OWORD *)&a5->fAssetProcessingNotification2;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetOrphaned = *(_OWORD *)&a5->fAssetOrphaned;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetProcessingNotification2 = v21;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetSetBytesAtOffset2 = v19;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetRescindedAck = v20;
    __int128 v22 = *(_OWORD *)&a5->fAssetPreProcessingNotification;
    __int128 v23 = *(_OWORD *)&a5->fAssetAllHeadersAndMetaDataComplete;
    __int128 v24 = *(_OWORD *)&a5->fAssetReleased;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetGetBytesAtOffset = *(_OWORD *)&a5->fAssetGetBytesAtOffset;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetReleased = v24;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetPreProcessingNotification = v22;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetAllHeadersAndMetaDataComplete = v23;
    v14->_internalSolicit = a6;
    os_log_t v25 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    log = v14->_log;
    v14->_log = v25;
  }

  return v14;
}

- (void)setUarpPlatformAsset:(uarpPlatformAsset *)a3
{
  self->_uarpAsset = a3;
}

- (uarpPlatformAssetCallbacks)uarpCallbacks
{
  return &self->_uarpCallbacks;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UARPAsset id](self->_asset, "id");
  [v6 tag];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %@>", v5, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)processHostTLVs
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset);
  v4 = -[UARPUploaderAsset asset](self, "asset");
  [v4 id];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 localURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPSuperBinaryAsset initWithURL:](v3, "initWithURL:", v6);

  id v49 = 0LL;
  LODWORD(v5) = -[UARPSuperBinaryAsset expandHeadersAndTLVs:](v7, "expandHeadersAndTLVs:", &v49);
  id v8 = v49;
  if ((_DWORD)v5)
  {
    id v42 = v8;
    v9 = -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    v10 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347652LL,  v9);
    v41 = v10;
    [v10 valueAsNumber];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v40 BOOLValue])
    {
      -[UARPUploaderAsset asset](self, "asset");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 id];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setIsUrgentUpdate:1];
    }
    v13 = -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    v14 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3291140096LL,  v13);
    v39 = v14;
    [v14 valueAsNumber];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v16 = v15;
    if (v15) {
      self->_minimumHostBatteryLevel = [v15 unsignedIntegerValue];
    }
    v38 = v16;
    -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3291140105LL,  v17);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v18;
    [v18 valueAsNumber];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v20 = v19;
    if (v19) {
      self->_triggerHostBatteryLevel = [v19 unsignedIntegerValue];
    }
    v36 = v20;
    v43 = v7;
    -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVsWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVsWithType:tlvs:",  3291140106LL,  v21);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id obj = v22;
    uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      p_remoteEndpoint = &self->_remoteEndpoint;
      v35 = self;
      while (2)
      {
        for (uint64_t i = 0LL; i != v24; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(obj);
          }
          objc_super v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)p_remoteEndpoint);
          [WeakRetained accessory];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 getID];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 hwRevision];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 valueAsString];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          int v34 = [v32 isEqualToString:v33];

          if (v34)
          {
            v35->_invalidHwRevision = 1;
            goto LABEL_18;
          }
        }

        uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

- (unint64_t)numPayloads
{
  return self->_numPayloads;
}

- (void)setNumPayloads:(unint64_t)a3
{
  self->_numPayloads = a3;
}

- (unint64_t)selectedPayload
{
  return self->_selectedPayload;
}

- (void)setSelectedPayload:(unint64_t)a3
{
  self->_selectedPayload = a3;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(unint64_t)a3
{
  self->_formatVersion = a3;
}

- (unint64_t)assetLength
{
  return self->_assetLength;
}

- (void)setAssetLength:(unint64_t)a3
{
  self->_assetLength = a3;
}

- (UARPAssetVersion)assetVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setAssetVersion:(id)a3
{
}

- (UARPSuperBinaryAsset)uarpSuperBinary
{
  return (UARPSuperBinaryAsset *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setUarpSuperBinary:(id)a3
{
}

- (UARPAsset)asset
{
  return (UARPAsset *)objc_getProperty(self, a2, 296LL, 1);
}

- (uarpPlatformAsset)uarpAsset
{
  return self->_uarpAsset;
}

- (UARPUploaderEndpoint)remoteEndpoint
{
  return (UARPUploaderEndpoint *)objc_loadWeakRetained((id *)&self->_remoteEndpoint);
}

- (BOOL)internalSolicit
{
  return self->_internalSolicit;
}

- (BOOL)invalidHwRevision
{
  return self->_invalidHwRevision;
}

- (unint64_t)minimumHostBatteryLevel
{
  return self->_minimumHostBatteryLevel;
}

- (unint64_t)triggerHostBatteryLevel
{
  return self->_triggerHostBatteryLevel;
}

- (UARPDynamicAssetPersonalization)pendingTssRequest
{
  return (UARPDynamicAssetPersonalization *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setPendingTssRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end