@interface UARPiCloudAssetManager
- (BOOL)checkLocalUARPCacheForAccessory:(id)a3 versionAvailable:(id *)a4 firmwarePath:(id *)a5 releaseNotesPath:(id *)a6;
- (BOOL)isFirmwareHash:(id)a3 equalToHash:(id)a4;
- (BOOL)moveFileAtURL:(id)a3 toTempURL:(id)a4;
- (BOOL)uarpDownloadOnCellularAllowed;
- (OS_dispatch_queue)delegateQueue;
- (UARPiCloudAssetManager)initWithManager:(id)a3;
- (id)moveToUARPCacheFromRemoteURL:(id)a3 assetType:(int64_t)a4 forAcessory:(id)a5;
- (id)pathToSuperBinaryInAccessoryVersionDirectory:(id)a3 uarpVersion:(id *)a4;
- (int64_t)downloadFirmwareForAccessory:(id)a3;
- (int64_t)downloadReleaseNotesForAccessory:(id)a3;
- (int64_t)getAttestationCertificates:(id)a3 inContainer:(id)a4;
- (int64_t)getSupportedAccessories:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5;
- (int64_t)handleReleaseNotesDownloadRequestForAccessory:(id)a3;
- (int64_t)handleRemoteFirmwareDownloadRequestForAccessory:(id)a3;
- (int64_t)handleRemoteQueryRequestForAccessories:(id)a3 inContainer:(id)a4;
- (int64_t)performRemoteUpdateCheckForAccessories:(id)a3 inContainer:(id)a4;
- (unsigned)_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:(unint64_t)a3;
- (void)cleanupAssetCache;
- (void)handleFirmwareDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4;
- (void)handleReleaseNotesDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4;
- (void)handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:(id)a3 inContainer:(id)a4;
- (void)handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5;
- (void)handleRemoteDownloadResponseForAttestationCertificates:(id)a3 forSubKeyIdentifier:(id)a4;
- (void)handleRemoteDownloadResponseForSupportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
- (void)handleRemoteFetchCompletion:(id)a3 error:(id)a4;
- (void)remoteFetchCompletion:(id)a3 error:(id)a4;
- (void)remoteFetchCompletionForAttestationCertificates:(id)a3 subjectKeyIdentifier:(id)a4 error:(id)a5;
- (void)setFirmwareDownloadFailureStatusForAccessory:(id)a3;
- (void)setFirmwareDownloadSuccessStatusForAccessory:(id)a3;
- (void)setReleaseNotesDownloadFailureStatusForAccessory:(id)a3;
- (void)setReleaseNotesDownloadSuccessStatusForAccessory:(id)a3;
- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3;
@end

@implementation UARPiCloudAssetManager

- (UARPiCloudAssetManager)initWithManager:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UARPiCloudAssetManager;
  v6 = -[UARPiCloudAssetManager init](&v16, sel_init);
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = v6->_log;
    v6->_log = v7;

    objc_storeStrong((id *)&v6->_assetManager, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager", 0LL);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager.queue", 0LL);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager.batched", 0LL);
    batchedProcessingQueue = v6->_batchedProcessingQueue;
    v6->_batchedProcessingQueue = (OS_dispatch_queue *)v13;
  }

  return v6;
}

- (void)cleanupAssetCache
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  InternalStorageDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UARPArrayOfExpiredFiles(v4, 0LL, 2592000.0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)NSString;
  os_log_t v7 = (void *)MEMORY[0x189607A00];
  InternalStorageDirectoryPath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 escapedPatternForString:v8];
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v6 stringWithFormat:@"^%@\\S+\\/\\S+\\/(%@|%@)\\/.+$", v9, *MEMORY[0x18960E7C0], *MEMORY[0x18960E7C8]];

  v37 = (void *)v10;
  [MEMORY[0x189607A00] regularExpressionWithPattern:v10 options:1 error:0];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
  obuint64_t j = v11;
  if (!v12)
  {
LABEL_14:

    goto LABEL_15;
  }

  uint64_t v13 = v12;
  uint64_t v14 = 0LL;
  uint64_t v15 = *(void *)v48;
  do
  {
    for (uint64_t i = 0LL; i != v13; ++i)
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      [v17 pathExtension];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      char v19 = [@"urlasset" isEqualToString:v18];

      if ((v19 & 1) != 0)
      {
        uint64_t v20 = v14;
      }

      else
      {
        uint64_t v20 = 1LL;
        if (objc_msgSend(v38, "rangeOfFirstMatchInString:options:range:", v17, 1, 0, objc_msgSend(v17, "length")) == 0x7FFFFFFFFFFFFFFFLL) {
          continue;
        }
      }

      [v3 addObject:v17];
      uint64_t v14 = v20;
    }

    uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
  }

  while (v13);

  if ((v14 & 1) != 0)
  {
    v21 = (void *)NSString;
    InternalStorageDirectoryPath();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 stringWithFormat:@"%@%@", v22, @"icloudTokens.plist"];
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [v3 addObject:v11];
    goto LABEL_14;
  }

- (int64_t)performRemoteUpdateCheckForAccessories:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __77__UARPiCloudAssetManager_performRemoteUpdateCheckForAccessories_inContainer___block_invoke;
  v13[3] = &unk_18A28BB70;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  objc_super v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)workQueue, v13);
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __77__UARPiCloudAssetManager_performRemoteUpdateCheckForAccessories_inContainer___block_invoke( uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleRemoteQueryRequestForAccessories:*(void *)(a1 + 40) inContainer:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = result;
  return result;
}

- (int64_t)downloadFirmwareForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__UARPiCloudAssetManager_downloadFirmwareForAccessory___block_invoke;
  block[3] = &unk_18A28BB98;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __55__UARPiCloudAssetManager_downloadFirmwareForAccessory___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleRemoteFirmwareDownloadRequestForAccessory:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (int64_t)downloadReleaseNotesForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__UARPiCloudAssetManager_downloadReleaseNotesForAccessory___block_invoke;
  block[3] = &unk_18A28BB98;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__UARPiCloudAssetManager_downloadReleaseNotesForAccessory___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleReleaseNotesDownloadRequestForAccessory:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (int64_t)getSupportedAccessories:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __75__UARPiCloudAssetManager_getSupportedAccessories_batchRequest_inContainer___block_invoke;
  v14[3] = &unk_18A28BBC0;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)workQueue, v14);

  return 0LL;
}

uint64_t __75__UARPiCloudAssetManager_getSupportedAccessories_batchRequest_inContainer___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:*(void *)(a1 + 40) batchRequest:*(unsigned __int8 *)(a1 + 56) inContainer:*(void *)(a1 + 48)];
}

- (int64_t)handleRemoteQueryRequestForAccessories:(id)a3 inContainer:(id)a4
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v6 = (NSMutableDictionary *)a3;
  int64_t v7 = (char *)a4;
  [MEMORY[0x189603FA8] array];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v7;
    __int16 v53 = 2112;
    v54 = v6;
    _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_DEFAULT,  "Performing Remote Check on iCloud ContainerID:%@ for accessories: %@",  buf,  0x16u);
  }

  id v10 = -[UARPiCloudManager initWithDelegate:containerID:]( objc_alloc(&OBJC_CLASS___UARPiCloudManager),  "initWithDelegate:containerID:",  self,  v7);
  id cloudManager = self->_cloudManager;
  self->_id cloudManager = v10;

  if (self->_cloudManager)
  {
    if (!self->_accessories)
    {
      id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      accessories = self->_accessories;
      self->_accessories = v12;
    }

    v40 = v7;
    uint64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_accessories;
      *(_DWORD *)buf = 136315394;
      v52 = "-[UARPiCloudAssetManager handleRemoteQueryRequestForAccessories:inContainer:]";
      __int16 v53 = 2112;
      v54 = v15;
      _os_log_impl(&dword_1887DD000, v14, OS_LOG_TYPE_DEFAULT, "%s: Current _accessories %@", buf, 0x16u);
    }

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    uint64_t v41 = v6;
    obuint64_t j = v6;
    uint64_t v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v47,  v57,  16LL);
    if (v45)
    {
      uint64_t v43 = *(void *)v48;
      __int128 v44 = v8;
      do
      {
        for (uint64_t i = 0LL; i != v45; ++i)
        {
          if (*(void *)v48 != v43) {
            objc_enumerationMutation(obj);
          }
          BOOL v17 = *(NSMutableDictionary **)(*((void *)&v47 + 1) + 8 * i);
          v18 = -[NSMutableDictionary accessoryID](v17, "accessoryID", v40);
          [v18 firmwareVersion];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary accessoryID](v17, "accessoryID");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 stagedFirmwareVersion];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[NSMutableDictionary assetID](v17, "assetID");
          if ([v22 type] == 15)
          {

LABEL_16:
            if (v21 && ([v21 isEqualToString:v19] & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
          v23 = -[NSMutableDictionary assetID](v17, "assetID");
          uint64_t v24 = [v23 type];

          if (v24 == 16) {
            goto LABEL_16;
          }
          v25 = (void *)MEMORY[0x18960E7B0];
          v26 = -[NSMutableDictionary accessoryID](v17, "accessoryID");
          [v26 firmwareVersion];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 versionFromString:v27 version:buf];

          if (v21)
          {
            [MEMORY[0x18960E7B0] versionFromString:v21 version:v46];
            if (uarpVersionCompare(buf, v46) == 1)
            {
LABEL_21:
              id v28 = v21;

              uint64_t v19 = v28;
            }
          }

- (int64_t)getAttestationCertificates:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__UARPiCloudAssetManager_getAttestationCertificates_inContainer___block_invoke;
  block[3] = &unk_18A28BBE8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)workQueue, block);

  return 0LL;
}

uint64_t __65__UARPiCloudAssetManager_getAttestationCertificates_inContainer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:*(void *)(a1 + 40) inContainer:*(void *)(a1 + 48)];
}

- (void)remoteFetchCompletion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__UARPiCloudAssetManager_remoteFetchCompletion_error___block_invoke;
  block[3] = &unk_18A28BBE8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

uint64_t __54__UARPiCloudAssetManager_remoteFetchCompletion_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteFetchCompletion:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)handleRemoteFetchCompletion:(id)a3 error:(id)a4
{
  uint64_t v131 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x189607978]);
  [v6 setNumberStyle:1];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessories, "objectForKeyedSubscript:", v5);
  id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    accessories = self->_accessories;
    *(_DWORD *)buf = 136315650;
    v126 = "-[UARPiCloudAssetManager handleRemoteFetchCompletion:error:]";
    __int16 v127 = 2112;
    v128 = v7;
    __int16 v129 = 2112;
    v130 = accessories;
    _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Found internalAccessory %@, from _accessories %@",  buf,  0x20u);
  }

  if (v7)
  {
    [v5 chipFirmwareRecord];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      id v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        [v5 chipFirmwareRecord];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 firmwareURL];
        id v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v126 = v14;
        __int16 v127 = 2112;
        v128 = v7;
        _os_log_impl( &dword_1887DD000,  v12,  OS_LOG_TYPE_DEFAULT,  "Found an update on %@ from iCloud for accessory %@",  buf,  0x16u);
      }

      [v5 chipFirmwareRecord];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setRecord:](v7, "setRecord:", v15);

      [v5 chipFirmwareRecord];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 firmwareVersion];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSMutableDictionary assetID](v7, "assetID");
      [v18 setAssetVersion:v17];

      [v5 chipFirmwareRecord];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 firmwareVersionNumber];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[NSMutableDictionary assetID](v7, "assetID");
      [v21 setAssetVersionNumber:v20];

      v22 = (void *)MEMORY[0x189604030];
      [v5 chipFirmwareRecord];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 firmwareURL];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 URLWithString:v24];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[NSMutableDictionary assetID](v7, "assetID");
      [v26 setRemoteURL:v25];
      v27 = -[NSMutableDictionary assetID](v7, "assetID");
      [v27 setDownloadStatus:0];

      -[NSMutableDictionary assetID](v7, "assetID");
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 setUpdateAvailabilityStatus:1];

      char v29 = (void *)MEMORY[0x189604030];
      [v5 chipFirmwareRecord];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 releaseNotesURL];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 URLWithString:v31];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[NSMutableDictionary assetID](v7, "assetID");
      [v33 setReleaseNotesRemoteURL:v32];
      v34 = -[NSMutableDictionary assetID](v7, "assetID");
      [v34 setReleaseNotesDownloadStatus:0];
      v35 = -[NSMutableDictionary assetID](v7, "assetID");
      [v35 setReleaseNotesAvailabilityStatus:1];

      [v5 chipFirmwareRecord];
      int v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 firmwareFileSize];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 numberFromString:v37];
      int64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      id v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 setFirmwareFileSize:v38];

      [v5 chipFirmwareRecord];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 releaseDate];
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 setAssetReleaseDate:v41];

      -[NSMutableDictionary assetID](v7, "assetID");
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadAvailableForAssetID:]( v7,  "analyticsSetDownloadAvailableForAssetID:",  v43);

      -[NSMutableDictionary assetID](v7, "assetID");
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadConsentRequestedForAssetID:]( v7,  "analyticsSetDownloadConsentRequestedForAssetID:",  v44);

      -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
      uint64_t v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke;
      block[3] = &unk_18A28BC10;
      block[4] = self;
      v124 = v7;
      dispatch_async(v45, block);

      __int128 v46 = v124;
LABEL_16:

      goto LABEL_17;
    }

    [v5 record];
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v48 = self->_log;
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if (v47)
    {
      if (v49)
      {
        __int128 v50 = v48;
        [v5 record];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 firmwareURL];
        v52 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v126 = v52;
        __int16 v127 = 2112;
        v128 = v7;
        _os_log_impl( &dword_1887DD000,  v50,  OS_LOG_TYPE_DEFAULT,  "Found an update on %@ from iCloud for accessory %@",  buf,  0x16u);
      }

      [v5 record];
      __int16 v53 = (void *)objc_claimAutoreleasedReturnValue();
      [v53 deploymentList];
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        -[NSMutableDictionary assetID](v7, "assetID");
        __int16 v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 record];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 deploymentList];
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 processUARPDeploymentRules:v57];
      }

      [v5 record];
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
      [v58 releaseDate];
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        id v60 = objc_alloc_init(MEMORY[0x189607848]);
        [v60 setDateFormat:@"MM/dd/yyyy"];
        [v5 record];
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 releaseDate];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v60 dateFromString:v62];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[NSMutableDictionary assetID](v7, "assetID");
        [v64 setAssetReleaseDate:v63];
      }
      v65 = -[NSMutableDictionary assetID](v7, "assetID");
      unsigned int v66 = [v65 signatureValidationNeeded];
      v67 = -[NSMutableDictionary assetID](v7, "assetID");
      [v67 setValidationStatus:v66];

      [v5 record];
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setRecord:](v7, "setRecord:", v68);

      [v5 record];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      [v69 firmwareVersion];
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[NSMutableDictionary assetID](v7, "assetID");
      [v71 setAssetVersion:v70];

      v72 = (void *)MEMORY[0x189604030];
      [v5 record];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      [v73 firmwareURL];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      [v72 URLWithString:v74];
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[NSMutableDictionary assetID](v7, "assetID");
      [v76 setRemoteURL:v75];
      v77 = -[NSMutableDictionary assetID](v7, "assetID");
      [v77 setDownloadStatus:0];
      v78 = -[NSMutableDictionary assetID](v7, "assetID");
      [v78 setUpdateAvailabilityStatus:1];

      v79 = (void *)MEMORY[0x189604030];
      [v5 record];
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      [v80 releaseNotesURL];
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      [v79 URLWithString:v81];
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[NSMutableDictionary assetID](v7, "assetID");
      [v83 setReleaseNotesRemoteURL:v82];
      v84 = -[NSMutableDictionary assetID](v7, "assetID");
      [v84 setReleaseNotesDownloadStatus:0];
      v85 = -[NSMutableDictionary assetID](v7, "assetID");
      [v85 setReleaseNotesAvailabilityStatus:1];

      [v5 record];
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      [v86 releaseNotesFileSize];
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 numberFromString:v87];
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[NSMutableDictionary assetID](v7, "assetID");
      [v89 setReleaseNotesFileSize:v88];

      [v5 record];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      [v90 firmwareFileSize];
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 numberFromString:v91];
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[NSMutableDictionary assetID](v7, "assetID");
      [v93 setFirmwareFileSize:v92];
      v94 = -[NSMutableDictionary assetID](v7, "assetID");
      -[NSMutableDictionary analyticsSetDownloadAvailableForAssetID:]( v7,  "analyticsSetDownloadAvailableForAssetID:",  v94);
      v95 = -[NSMutableDictionary assetID](v7, "assetID");
      -[NSMutableDictionary analyticsSetDownloadConsentRequestedForAssetID:]( v7,  "analyticsSetDownloadConsentRequestedForAssetID:",  v95);

      -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
      v96 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v121[0] = MEMORY[0x1895F87A8];
      v121[1] = 3221225472LL;
      v121[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_203;
      v121[3] = &unk_18A28BC10;
      v121[4] = self;
      v122 = v7;
      dispatch_async(v96, v121);

      __int128 v46 = v122;
      goto LABEL_16;
    }

    if (v49)
    {
      *(_DWORD *)buf = 138412290;
      v126 = (const char *)v7;
      _os_log_impl( &dword_1887DD000,  v48,  OS_LOG_TYPE_DEFAULT,  "No new update found on iCloud since last check for %@, checking in local UARP cache ",  buf,  0xCu);
    }

    id v119 = 0LL;
    id v120 = 0LL;
    id v118 = 0LL;
    BOOL v97 = -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:]( self,  "checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:",  v7,  &v120,  &v119,  &v118);
    v98 = (char *)v120;
    v99 = (NSMutableDictionary *)v119;
    v100 = (char *)v118;
    v101 = self->_log;
    BOOL v102 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
    if (v97 && v98 && v99)
    {
      if (v102)
      {
        *(_DWORD *)buf = 138412802;
        v126 = v98;
        __int16 v127 = 2112;
        v128 = v99;
        __int16 v129 = 2112;
        v130 = v7;
        _os_log_impl( &dword_1887DD000,  v101,  OS_LOG_TYPE_DEFAULT,  "Found update %@ in local UARP cache %@ path for accessory %@",  buf,  0x20u);
      }
      v103 = -[NSMutableDictionary assetID](v7, "assetID");
      -[NSMutableDictionary analyticsSetDownloadCompleteForAssetID:status:]( v7,  "analyticsSetDownloadCompleteForAssetID:status:",  v103,  2LL);
      v104 = -[NSMutableDictionary assetID](v7, "assetID");
      [v104 setAssetVersion:v98];
      v105 = -[NSMutableDictionary assetID](v7, "assetID");
      [v105 setRemoteURL:v99];
      v106 = -[NSMutableDictionary assetID](v7, "assetID");
      [v106 setLocalURL:v99];
      v107 = -[NSMutableDictionary assetID](v7, "assetID");
      [v107 setDownloadStatus:1];
      v108 = -[NSMutableDictionary assetID](v7, "assetID");
      [v108 setUpdateAvailabilityStatus:3];

      if (v100)
      {
        v109 = self->_log;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          v110 = v109;
          -[NSMutableDictionary accessoryID](v7, "accessoryID");
          v111 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v126 = v100;
          __int16 v127 = 2112;
          v128 = v111;
          _os_log_impl( &dword_1887DD000,  v110,  OS_LOG_TYPE_DEFAULT,  "Found releaseNotes in local UARP cache %@ path for accessory %@",  buf,  0x16u);
        }
        v112 = -[NSMutableDictionary assetID](v7, "assetID");
        [v112 setReleaseNotesLocalURL:v100];
        v113 = -[NSMutableDictionary assetID](v7, "assetID");
        [v113 setReleaseNotesDownloadStatus:1];
        v114 = -[NSMutableDictionary assetID](v7, "assetID");
        [v114 setReleaseNotesAvailabilityStatus:3];
      }

      -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
      v115 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v116[0] = MEMORY[0x1895F87A8];
      v116[1] = 3221225472LL;
      v116[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_204;
      v116[3] = &unk_18A28BC10;
      v116[4] = self;
      v117 = v7;
      dispatch_async(v115, v116);
    }

    else if (v102)
    {
      *(_DWORD *)buf = 138412290;
      v126 = (const char *)v7;
      _os_log_impl( &dword_1887DD000,  v101,  OS_LOG_TYPE_DEFAULT,  "No new update found in local UARP cache for accessory: %@",  buf,  0xCu);
    }
  }

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_DEFAULT,  "Updated internalAccessory.assetID state, notifying client for accessory %@",  (uint8_t *)&v7,  0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_203(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_DEFAULT,  "Updated internalAccessory.assetID state, notifying client for accessory %@",  (uint8_t *)&v7,  0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_204(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_DEFAULT,  "Updated internalAccessory.assetID state, notifying client for accessory %@",  (uint8_t *)&v7,  0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

- (BOOL)moveFileAtURL:(id)a3 toTempURL:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = 0LL;
  if ([v7 checkResourceIsReachableAndReturnError:0])
  {
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    [v9 removeItemAtURL:v7 error:&v16];
    id v8 = v16;
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  char v11 = [v10 moveItemAtURL:v6 toURL:v7 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_error_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_ERROR,  "Failed to moved file from %@ to temporary location %@ for validation: %@",  buf,  0x20u);
    }
  }

  return v11;
}

- (int64_t)handleRemoteFirmwareDownloadRequestForAccessory:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v6 = log;
    [v4 assetID];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 remoteURL];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 accessoryID];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl( &dword_1887DD000,  v6,  OS_LOG_TYPE_INFO,  "Downloading asset from remote url %@ for accessory %@",  buf,  0x16u);
  }

  [v4 assetID];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 remoteURL];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607AA0] sharedSession];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke;
  v17[3] = &unk_18A28BC38;
  v17[4] = self;
  id v18 = v4;
  id v19 = v11;
  id v13 = v11;
  id v14 = v4;
  [v12 downloadTaskWithURL:v13 completionHandler:v17];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  [v15 resume];
  return 0LL;
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke( id *a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)*((void *)a1[4] + 1);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
  {
    id v11 = a1[5];
    id v12 = v10;
    [v11 assetID];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 remoteURL];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[5] accessoryID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    uint64_t v43 = v14;
    __int16 v44 = 2112;
    uint64_t v45 = v15;
    __int16 v46 = 2112;
    id v47 = v7;
    _os_log_impl( &dword_1887DD000,  v12,  OS_LOG_TYPE_INFO,  "Download result: %@ error:%@ from remote url %@ for accessory %@ %@",  buf,  0x34u);
  }

  if (!v7 || v9)
  {
    [a1[4] setFirmwareDownloadFailureStatusForAccessory:a1[5]];
    [a1[4] delegateQueue];
    id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_206;
    v36[3] = &unk_18A28BC10;
    id v29 = a1[5];
    v36[4] = a1[4];
    id v37 = v29;
    dispatch_async(v28, v36);
  }

  else
  {
    id v16 = (void *)NSString;
    InternalStorageDirectoryPath();
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[6] lastPathComponent];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringWithFormat:@"%@/%@.%@", v17, v18, @"urlasset"];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    id v20 = (void *)MEMORY[0x189604030];
    id v21 = v19;
    objc_msgSend( v20,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  objc_msgSend(v21, "UTF8String"),  0,  0);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    char v23 = [a1[4] moveFileAtURL:v7 toTempURL:v22];
    uint64_t v24 = a1[4];
    if ((v23 & 1) != 0)
    {
      v25 = (dispatch_queue_s *)v24[5];
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_3;
      block[3] = &unk_18A28BBE8;
      block[4] = v24;
      v26 = &v32;
      id v32 = v22;
      v33 = (dispatch_queue_s *)a1[5];
      dispatch_sync(v25, block);
      v27 = v33;
    }

    else
    {
      [v24 setFirmwareDownloadFailureStatusForAccessory:a1[5]];
      [a1[4] delegateQueue];
      v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_2;
      v34[3] = &unk_18A28BC10;
      id v30 = a1[5];
      v34[4] = a1[4];
      v26 = &v35;
      id v35 = v30;
      dispatch_async(v27, v34);
    }
  }
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_206( uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_2( uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

uint64_t __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_3( uint64_t a1)
{
  return [*(id *)(a1 + 32) handleFirmwareDownloadResponseFromLocation:*(void *)(a1 + 40) forAccessory:*(void *)(a1 + 48)];
}

- (BOOL)isFirmwareHash:(id)a3 equalToHash:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a4, "caseInsensitiveCompare:") == 0;
    }
  }

  return result;
}

- (void)handleFirmwareDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v7 assetID];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 signatureValidationNeeded];

  if (v9)
  {
    [v7 record];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      [v7 record];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        [v7 record];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 hashAlgorithmType];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v15 unsignedLongValue];
      }

      else
      {
        uint64_t v16 = 1LL;
      }

      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = log;
        [v7 record];
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        uint64_t v45 = "-[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:]";
        __int16 v46 = 2112;
        id v47 = v7;
        __int16 v48 = 2112;
        id v49 = v22;
        _os_log_impl(&dword_1887DD000, v21, OS_LOG_TYPE_DEFAULT, "%s: UARPAccessoryInternal %@, record %@", buf, 0x20u);
      }

      int v23 = -[UARPiCloudAssetManager _getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:]( self,  "_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:",  v16);
      [v7 record];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 firmwareBinaryHash];
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      id v43 = 0LL;
      generateHashForDataAtLocation(v6, v23, (uint64_t)&v43);
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      id v27 = v43;
      id v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v26;
        __int16 v46 = 2114;
        id v47 = v25;
        __int16 v48 = 2114;
        id v49 = v27;
        _os_log_impl( &dword_1887DD000,  v28,  OS_LOG_TYPE_DEFAULT,  "calculatedHash: %{public}@, expectedHash:%{public}@, error:%{public}@",  buf,  0x20u);
      }

      [v7 assetID];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 setFirmwareHash:v26];

      if (-[UARPiCloudAssetManager isFirmwareHash:equalToHash:](self, "isFirmwareHash:equalToHash:", v25, v26)) {
        goto LABEL_17;
      }
      [v7 record];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0) {
        goto LABEL_18;
      }
      id v42 = v27;
      uint64_t v32 = generateBase64HashForDataAtLocation(v6, v23, (uint64_t)&v42);
      id v33 = v42;

      [v7 assetID];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 setFirmwareHash:v32];

      v26 = (char *)v32;
      id v27 = v33;
      if (-[UARPiCloudAssetManager isFirmwareHash:equalToHash:](self, "isFirmwareHash:equalToHash:", v25, v32))
      {
LABEL_17:
        [v7 assetID];
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 setValidationStatus:1];

        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]( self,  "moveToUARPCacheFromRemoteURL:assetType:forAcessory:",  v6,  0LL,  v7);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
LABEL_18:
        [v7 assetID];
        int v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 setValidationStatus:2];

        id v18 = 0LL;
      }

      if (v18) {
        goto LABEL_20;
      }
    }

    else
    {
      id v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:].cold.1(v19, v7);
      }
    }

void __82__UARPiCloudAssetManager_handleFirmwareDownloadResponseFromLocation_forAccessory___block_invoke( uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 136315394;
    id v8 = "-[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl( &dword_1887DD000,  v2,  OS_LOG_TYPE_DEFAULT,  "%s: Updated assetID state %@, notifying client",  (uint8_t *)&v7,  0x16u);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

- (void)setFirmwareDownloadFailureStatusForAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 assetID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setLocalURL:0];

  [v4 assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setDownloadStatus:2];

  [v4 assetID];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setUpdateAvailabilityStatus:0];

  [v4 assetID];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 analyticsSetDownloadCompleteForAssetID:v8 status:3];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[UARPiCloudAssetManager setFirmwareDownloadFailureStatusForAccessory:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Set Download Failure Status for accessory %@",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)setFirmwareDownloadSuccessStatusForAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 assetID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setDownloadStatus:1];

  [v4 assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setUpdateAvailabilityStatus:3];

  [v4 assetID];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 analyticsSetDownloadCompleteForAssetID:v7 status:1];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[UARPiCloudAssetManager setFirmwareDownloadSuccessStatusForAccessory:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Set Download Success Status for accessory %@",  (uint8_t *)&v9,  0x16u);
  }
}

- (int64_t)handleReleaseNotesDownloadRequestForAccessory:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v6 = log;
    [v4 assetID];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 releaseNotesRemoteURL];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 accessoryID];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl( &dword_1887DD000,  v6,  OS_LOG_TYPE_INFO,  "Downloading Release Notes from remote url %@ for accessory %@",  buf,  0x16u);
  }

  [v4 assetID];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 releaseNotesRemoteURL];
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607AA0] sharedSession];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke;
  v17[3] = &unk_18A28BC38;
  v17[4] = self;
  id v18 = v4;
  id v19 = v11;
  id v13 = v11;
  id v14 = v4;
  [v12 downloadTaskWithURL:v13 completionHandler:v17];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  [v15 resume];
  return 0LL;
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke( id *a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)*((void *)a1[4] + 1);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
  {
    id v11 = a1[5];
    id v12 = v10;
    [v11 assetID];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 remoteURL];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[5] accessoryID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    uint64_t v45 = v15;
    _os_log_impl( &dword_1887DD000,  v12,  OS_LOG_TYPE_INFO,  "Download result: %@ error:%@ from remote url %@ for accessory %@",  buf,  0x2Au);
  }

  if (!v7 || v9)
  {
    [a1[4] setReleaseNotesDownloadFailureStatusForAccessory:a1[5]];
    [a1[4] delegateQueue];
    id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_213;
    v36[3] = &unk_18A28BC10;
    id v29 = a1[5];
    v36[4] = a1[4];
    id v37 = v29;
    dispatch_async(v28, v36);
  }

  else
  {
    uint64_t v16 = (void *)NSString;
    InternalStorageDirectoryPath();
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[6] lastPathComponent];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringWithFormat:@"%@/%@.%@", v17, v18, @"urlasset"];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    id v20 = (void *)MEMORY[0x189604030];
    id v21 = v19;
    objc_msgSend( v20,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  objc_msgSend(v21, "UTF8String"),  0,  0);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    char v23 = [a1[4] moveFileAtURL:v7 toTempURL:v22];
    uint64_t v24 = a1[4];
    if ((v23 & 1) != 0)
    {
      v25 = (dispatch_queue_s *)v24[5];
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_3;
      block[3] = &unk_18A28BBE8;
      block[4] = v24;
      v26 = &v32;
      id v32 = v22;
      id v33 = (dispatch_queue_s *)a1[5];
      dispatch_sync(v25, block);
      id v27 = v33;
    }

    else
    {
      [v24 setReleaseNotesDownloadFailureStatusForAccessory:a1[5]];
      [a1[4] delegateQueue];
      id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_2;
      v34[3] = &unk_18A28BC10;
      id v30 = a1[5];
      v34[4] = a1[4];
      v26 = &v35;
      id v35 = v30;
      dispatch_async(v27, v34);
    }
  }
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_213( uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

uint64_t __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_3( uint64_t a1)
{
  return [*(id *)(a1 + 32) handleReleaseNotesDownloadResponseFromLocation:*(void *)(a1 + 40) forAccessory:*(void *)(a1 + 48)];
}

- (void)setReleaseNotesDownloadFailureStatusForAccessory:(id)a3
{
  id v3 = a3;
  [v3 assetID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setReleaseNotesLocalURL:0];

  [v3 assetID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setReleaseNotesDownloadStatus:2];

  [v3 assetID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setReleaseNotesAvailabilityStatus:0];

  [v3 assetID];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v3 analyticsSetDownloadCompleteForAssetID:v7 status:3];
}

- (void)setReleaseNotesDownloadSuccessStatusForAccessory:(id)a3
{
  id v3 = a3;
  [v3 assetID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setReleaseNotesDownloadStatus:1];

  [v3 assetID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setReleaseNotesAvailabilityStatus:3];

  [v3 assetID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 analyticsSetDownloadCompleteForAssetID:v6 status:1];
}

- (void)handleReleaseNotesDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v7 assetID];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 signatureValidationNeeded];

  if (v9)
  {
    [v7 record];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      [v7 record];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        [v7 record];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 hashAlgorithmType];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v15 unsignedLongValue];
      }

      else
      {
        uint64_t v16 = 1LL;
      }

      int v20 = -[UARPiCloudAssetManager _getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:]( self,  "_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:",  v16);
      [v7 record];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 releaseNotesHash];
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();

      id v33 = 0LL;
      generateHashForDataAtLocation(v6, v20, (uint64_t)&v33);
      char v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v24 = v33;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v35 = v23;
        __int16 v36 = 2114;
        id v37 = v22;
        __int16 v38 = 2114;
        id v39 = v24;
        _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_DEFAULT,  "calculatedHash: %{public}@, expectedHash:%{public}@, error:%{public}@",  buf,  0x20u);
      }

      if (v22 && [v23 isEqualToString:v22])
      {
        [v7 assetID];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 setValidationStatus:1];

        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]( self,  "moveToUARPCacheFromRemoteURL:assetType:forAcessory:",  v6,  1LL,  v7);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [v7 assetID];
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 setValidationStatus:2];

        id v18 = 0LL;
      }

      if (v18) {
        goto LABEL_17;
      }
    }

    else
    {
      id v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudAssetManager handleReleaseNotesDownloadResponseFromLocation:forAccessory:].cold.1(v19, v7);
      }
    }

void __86__UARPiCloudAssetManager_handleReleaseNotesDownloadResponseFromLocation_forAccessory___block_invoke( uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  [*(id *)(a1 + 40) accessoryID];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) assetID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

- (BOOL)checkLocalUARPCacheForAccessory:(id)a3 versionAvailable:(id *)a4 firmwarePath:(id *)a5 releaseNotesPath:(id *)a6
{
  id v10 = a3;
  [v10 assetID];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 type] != 15)
  {
    [v10 assetID];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 type];

    if (v13 == 16) {
      goto LABEL_4;
    }
    uint64_t v16 = (void *)MEMORY[0x189607940];
    InternalStorageDirectoryPath();
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringWithFormat:@"%@/%@", v17, v18];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189604030] fileURLWithPath:v19];
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 contentsOfDirectoryAtURL:v20 includingPropertiesForKeys:0 options:4 error:0];
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    char v23 = (void *)[v22 mutableCopy];

    if ([v23 count])
    {
      if ([v23 count] == 1) {
        goto LABEL_11;
      }
      if ((unint64_t)[v23 count] >= 2)
      {
        v55[0] = MEMORY[0x1895F87A8];
        v55[1] = 3221225472LL;
        v55[2] = __105__UARPiCloudAssetManager_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath___block_invoke;
        v55[3] = &unk_18A28BC60;
        v55[4] = self;
        [v23 sortUsingComparator:v55];
LABEL_11:
        [v23 firstObject];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v54 = v19;
          uint64_t v26 = [v24 URLByAppendingPathComponent:*MEMORY[0x18960E7C0]];
          [MEMORY[0x1896078A8] defaultManager];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          __int16 v53 = (void *)v26;
          [v27 contentsOfDirectoryAtURL:v26 includingPropertiesForKeys:0 options:4 error:0];
          id v28 = (void *)objc_claimAutoreleasedReturnValue();

          id v29 = v28;
          if ([v28 count] == 1)
          {
            id v49 = v20;
            uint64_t v50 = v28;
            [v28 firstObject];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            [v51 path];
            id v30 = (void *)objc_claimAutoreleasedReturnValue();
            getSuperBinaryVersionForAsset((uint64_t)v30);
            char v31 = (void *)objc_claimAutoreleasedReturnValue();

            [v25 lastPathComponent];
            id v32 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v31;
            int v33 = [v31 isEqualToString:v32];

            id v19 = v54;
            int v48 = v33;
            if ((v33 & 1) != 0)
            {
              [v10 accessoryID];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v34 firmwareVersion];
              id v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v46 = uarpVersionCompareStrings();

              BOOL v15 = v46 == 1;
              if (v46 == 1)
              {
                *a4 = (id)[v52 copy];
                *a5 = (id)[v51 copy];
              }

              uint64_t v36 = [v25 URLByAppendingPathComponent:*MEMORY[0x18960E7C8]];
              [MEMORY[0x1896078A8] defaultManager];
              id v37 = (void *)objc_claimAutoreleasedReturnValue();
              id v47 = (void *)v36;
              [v37 contentsOfDirectoryAtURL:v36 includingPropertiesForKeys:0 options:4 error:0];
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue();

              if ([v38 count] == 1)
              {
                [v38 firstObject];
                id v39 = (void *)objc_claimAutoreleasedReturnValue();
                *a6 = (id)[v39 copy];

                uint64_t v40 = v52;
                int v41 = v48;
                __int16 v42 = v47;
              }

              else
              {
                BOOL v45 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
                uint64_t v40 = v52;
                int v41 = v48;
                __int16 v42 = v47;
                if (v45) {
                  -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.2();
                }
              }

              __int16 v44 = v53;
            }

            else
            {
              uint64_t v40 = v52;
              if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
              {
                __int16 v44 = v53;
                -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.3();
                BOOL v15 = 0;
              }

              else
              {
                BOOL v15 = 0;
                __int16 v44 = v53;
              }

              int v41 = v48;
            }

            if (!v41) {
              BOOL v15 = 0;
            }
            int v20 = v49;
            goto LABEL_23;
          }

          id v19 = v54;
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.2();
          }
        }

uint64_t __105__UARPiCloudAssetManager_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v17 = 0LL;
  id v6 = a3;
  [v5 pathToSuperBinaryInAccessoryVersionDirectory:a2 uarpVersion:&v17];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v17;
  [v7 path];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = *(void **)(a1 + 32);
  id v16 = 0LL;
  [v10 pathToSuperBinaryInAccessoryVersionDirectory:v6 uarpVersion:&v16];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  id v12 = v16;
  [v11 path];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = -1LL;
  if (v9 && v13) {
    uint64_t v14 = uarpVersionCompareStrings();
  }

  return v14;
}

- (id)pathToSuperBinaryInAccessoryVersionDirectory:(id)a3 uarpVersion:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x1896078A8] defaultManager];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 URLByAppendingPathComponent:*MEMORY[0x18960E7C0]];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:4 error:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "path", (void)v19);
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
        getSuperBinaryVersionForAsset((uint64_t)v15);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          *a4 = (id)[v16 copy];
          id v17 = (void *)[v14 copy];

          goto LABEL_11;
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = 0LL;
LABEL_11:

  return v17;
}

- (id)moveToUARPCacheFromRemoteURL:(id)a3 assetType:(int64_t)a4 forAcessory:(id)a5
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x189607940];
    InternalStorageDirectoryPath();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 identifier];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 assetID];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 assetVersion];
    BOOL v15 = (void *)v14;
    id v16 = (void *)MEMORY[0x18960E7C8];
  }

  else
  {
    if (a4)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:].cold.1();
      }
      goto LABEL_32;
    }

    uint64_t v10 = (void *)MEMORY[0x189607940];
    InternalStorageDirectoryPath();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 identifier];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 assetID];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 assetVersion];
    BOOL v15 = (void *)v14;
    id v16 = (void *)MEMORY[0x18960E7C0];
  }

  [v10 stringWithFormat:@"%@/%@/%@/%@", v11, v12, v14, *v16];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v19 = [v18 fileExistsAtPath:v17];

  if ((v19 & 1) != 0)
  {
    id v20 = 0LL;
  }

  else
  {
    [MEMORY[0x1896078A8] defaultManager];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v47 = 0LL;
    char v22 = [v21 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v47];
    id v23 = v47;

    log = self->_log;
    BOOL v25 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if ((v22 & 1) == 0)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v23;
        _os_log_impl( &dword_1887DD000,  log,  OS_LOG_TYPE_INFO,  "Failed to create UARP Firmware directory error: %@",  buf,  0xCu);
      }

- (void)handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = -[UARPiCloudManager initWithDelegate:containerID:]( objc_alloc(&OBJC_CLASS___UARPiCloudManager),  "initWithDelegate:containerID:",  self,  v9);

  batchedProcessingQueue = self->_batchedProcessingQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __117__UARPiCloudAssetManager_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer___block_invoke;
  block[3] = &unk_18A28BC88;
  BOOL v15 = v10;
  id v16 = v8;
  BOOL v17 = a4;
  id v12 = v8;
  uint64_t v13 = v10;
  dispatch_async((dispatch_queue_t)batchedProcessingQueue, block);
}

uint64_t __117__UARPiCloudAssetManager_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) performRemoteFetchForSupportedAccessoriesMetadata:*(void *)(a1 + 40) batchRequest:*(unsigned __int8 *)(a1 + 48)];
}

- (void)handleRemoteDownloadResponseForSupportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __105__UARPiCloudAssetManager_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete___block_invoke;
  v13[3] = &unk_18A28BBC0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __105__UARPiCloudAssetManager_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete___block_invoke( uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) supportedAccessories:*(void *)(a1 + 40) forProductGroup:*(void *)(a1 + 48) isComplete:*(unsigned __int8 *)(a1 + 56)];
}

- (void)handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[UARPiCloudManager initWithDelegate:containerID:]( objc_alloc(&OBJC_CLASS___UARPiCloudManager),  "initWithDelegate:containerID:",  self,  v6);

  -[UARPiCloudManager performRemoteFetchForAttestationCertificates:]( v8,  "performRemoteFetchForAttestationCertificates:",  v7);
}

- (void)remoteFetchCompletionForAttestationCertificates:(id)a3 subjectKeyIdentifier:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __101__UARPiCloudAssetManager_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error___block_invoke;
  block[3] = &unk_18A28BBE8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)workQueue, block);
}

uint64_t __101__UARPiCloudAssetManager_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteDownloadResponseForAttestationCertificates:*(void *)(a1 + 40) forSubKeyIdentifier:*(void *)(a1 + 48)];
}

- (void)handleRemoteDownloadResponseForAttestationCertificates:(id)a3 forSubKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __101__UARPiCloudAssetManager_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier___block_invoke;
  block[3] = &unk_18A28BBE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __101__UARPiCloudAssetManager_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier___block_invoke( void *a1)
{
  return [*(id *)(a1[4] + 16) attestationCertificates:a1[5] forSubjectKeyIdentifier:a1[6]];
}

- (unsigned)_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:(unint64_t)a3
{
  if (a3 - 1 > 0xB) {
    return 0;
  }
  else {
    return dword_1887F8BC0[a3 - 1];
  }
}

- (BOOL)uarpDownloadOnCellularAllowed
{
  return self->_uarpDownloadOnCellularAllowed;
}

- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3
{
  self->_uarpDownloadOnCellularAllowed = a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

- (void)handleFirmwareDownloadResponseFromLocation:(void *)a1 forAccessory:(void *)a2 .cold.1( void *a1,  void *a2)
{
  id v3 = OUTLINED_FUNCTION_5(a1);
  [a2 record];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1( &dword_1887DD000,  v5,  v6,  "Downloaded firmware record %@ missing 'firmwareBinaryHash' property",  v7,  v8,  v9,  v10,  v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)handleReleaseNotesDownloadResponseFromLocation:(void *)a1 forAccessory:(void *)a2 .cold.1( void *a1,  void *a2)
{
  id v3 = OUTLINED_FUNCTION_5(a1);
  [a2 record];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1( &dword_1887DD000,  v5,  v6,  "Downloaded firmware record %@ missing 'releaseNotesHash' property",  v7,  v8,  v9,  v10,  v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)checkLocalUARPCacheForAccessory:(void *)a1 versionAvailable:(void *)a2 firmwarePath:releaseNotesPath:.cold.1( void *a1,  void *a2)
{
  id v3 = OUTLINED_FUNCTION_5(a1);
  [a2 assetID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1( &dword_1887DD000,  v5,  v6,  "Asset with CHIP iCloud asset type not supported for cache %@",  v7,  v8,  v9,  v10,  v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:.cold.2()
{
}

- (void)checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:.cold.3()
{
}

- (void)moveToUARPCacheFromRemoteURL:assetType:forAcessory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1887DD000, v0, OS_LOG_TYPE_ERROR, "Invalid assetType %ld", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)moveToUARPCacheFromRemoteURL:assetType:forAcessory:.cold.2()
{
}

@end