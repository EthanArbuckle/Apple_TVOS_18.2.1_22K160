@interface ASAsset
+ (BOOL)nonUserInitiatedDownloadsAllowed;
- (ASAsset)initWithAssetType:(id)a3 attributes:(id)a4;
- (ASAsset)initWithMAAsset:(id)a3;
- (BOOL)cancelDownloadAndReturnError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPresentOnDisk;
- (BOOL)pauseDownloadAndReturnError:(id *)a3;
- (BOOL)purgeAndReturnError:(id *)a3;
- (BOOL)requiredDiskSpaceIsAvailable:(int64_t *)a3 error:(id *)a4;
- (BOOL)requiredDiskSpaceIsAvailableForDownloadOptions:(id)a3 requiredBytes:(int64_t *)a4 error:(id *)a5;
- (BOOL)resumeDownloadAndReturnError:(id *)a3;
- (BOOL)userInitiatedDownload;
- (MAAsset)maAsset;
- (NSDate)installDate;
- (NSDictionary)attributes;
- (NSDictionary)downloadOptions;
- (NSDictionary)fullAttributes;
- (NSString)assetType;
- (NSString)clientName;
- (NSURL)localURL;
- (id)_getLocalAttribute:(id)a3;
- (id)assetServerUrl;
- (id)description;
- (id)identifier;
- (id)progressHandler;
- (int64_t)assetStateForStateString:(id)a3;
- (int64_t)garbageCollectionBehavior;
- (int64_t)state;
- (unint64_t)hash;
- (void)_downloadWithOptions:(id)a3 shouldFireCallback:(BOOL)a4;
- (void)adjustDownloadOptions:(id)a3 completion:(id)a4;
- (void)beginDownloadWithOptions:(id)a3;
- (void)cancelDownload:(id)a3;
- (void)pauseDownload:(id)a3;
- (void)purge:(id)a3;
- (void)resumeDownload:(id)a3;
- (void)setClientName:(id)a3;
- (void)setGarbageCollectionBehavior:(int64_t)a3;
- (void)setMaAsset:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setUserInitiatedDownload:(BOOL)a3;
@end

@implementation ASAsset

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASAsset *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ASAsset maAsset](self, "maAsset");
      uint64_t v6 = -[ASAsset maAsset](v4, "maAsset");
      v7 = (void *)v6;
      LOBYTE(v8) = 0;
      if (self->maAsset)
      {
        if (v6)
        {
          [v5 assetType];
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            [v7 assetType];
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 assetType];
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            int v11 = [v9 isEqualToString:v10];

            if (!v11) {
              goto LABEL_12;
            }
            uint64_t v12 = [v5 assetId];
            if (!v12) {
              goto LABEL_12;
            }
            v13 = (void *)v12;
            [v7 assetId];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 assetId];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            char v16 = [v14 isEqualToString:v15];

            if ((v16 & 1) != 0) {
              LOBYTE(v8) = 1;
            }
            else {
LABEL_12:
            }
              LOBYTE(v8) = 0;
          }
        }
      }
    }

    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Asset type: %@\nAsset attributes: %@", self->_assetType, self->_attributes];
}

- (id)assetServerUrl
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v4 = 0LL;
LABEL_6:
    v7 = 0LL;
    goto LABEL_7;
  }

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"__BaseURL");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    assetType = self->_assetType;
    id v10 = 0LL;
    MAGetServerUrl(assetType, &v10);
    id v4 = v10;
    if (!v4) {
      goto LABEL_6;
    }
  }

  [MEMORY[0x189604030] URLWithString:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v3];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  id v8 = v7;

  return v8;
}

- (NSURL)localURL
{
  return (NSURL *)-[ASAsset _getLocalAttribute:](self, "_getLocalAttribute:", @"LocalURL");
}

- (NSDictionary)attributes
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  -[NSDictionary allKeys](self->_attributes, "allKeys", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 hasPrefix:@"__"] & 1) == 0)
        {
          -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", v9);
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 setObject:v10 forKey:v9];
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return (NSDictionary *)v3;
}

- (int64_t)assetStateForStateString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isEqualToString:@"NotDownloaded"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"Downloaded"])
    {
      int64_t v5 = 1LL;
    }

    else if ([v4 isEqualToString:@"Paused"])
    {
      int64_t v5 = 3LL;
    }

    else if ([v4 isEqualToString:@"Stalled"])
    {
      int64_t v5 = 4LL;
    }

    else if (([v4 isEqualToString:@"Downloading"] & 1) != 0 {
           || ([v4 isEqualToString:@"Verifying"] & 1) != 0
    }
           || ([v4 isEqualToString:@"Unarchiving"] & 1) != 0
           || ([v4 isEqualToString:@"Backgrounded"] & 1) != 0)
    {
      int64_t v5 = 2LL;
    }

    else if ([v4 isEqualToString:@"Queued"])
    {
      int64_t v5 = 5LL;
    }

    else
    {
      int64_t v5 = 0LL;
    }
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

+ (BOOL)nonUserInitiatedDownloadsAllowed
{
  return 1;
}

- (int64_t)state
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v4 = -[ASAsset assetStateForStateString:](self, "assetStateForStateString:", v3);

  return v4;
}

- (int64_t)garbageCollectionBehavior
{
  return 1LL;
}

- (void)setGarbageCollectionBehavior:(int64_t)a3
{
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ASAsset setGarbageCollectionBehavior:]",  @"Could not send garbage collection behavior message: %@",  v7,  v8,  v9,  v10,  (uint64_t)v11);
}

- (NSDate)installDate
{
  return (NSDate *)(id)objc_opt_new();
}

- (BOOL)requiredDiskSpaceIsAvailable:(int64_t *)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 spaceCheck:a3];

  if (a4) {
    *a4 = 0LL;
  }
  return v7;
}

- (BOOL)requiredDiskSpaceIsAvailableForDownloadOptions:(id)a3 requiredBytes:(int64_t *)a4 error:(id *)a5
{
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ASAsset requiredDiskSpaceIsAvailableForDownloadOptions:requiredBytes:error:]",  @"Could not get space available for downloading as downloading an ASAsset is deprecated, use MAAsset: %@",  v10,  v11,  v12,  v13,  (uint64_t)v9);

  if (a5)
  {
    _ASErrorForV1Deprecation(@"requiredDiskSpaceIsAvailableForDownloadOptions");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (void)adjustDownloadOptions:(id)a3 completion:(id)a4
{
  uint64_t v9 = (void (**)(id, void *))a4;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset adjustDownloadOptions:completion:]",  @"Deprecated ASAsset API is no longer supported: %s",  v4,  v5,  v6,  v7,  (uint64_t)"-[ASAsset adjustDownloadOptions:completion:]");
  if (v9)
  {
    _ASErrorForV1Deprecation(@"adjustDownloadOptions");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);
  }
}

- (void)_downloadWithOptions:(id)a3 shouldFireCallback:(BOOL)a4
{
  if (self->_maAsset)
  {
    uint64_t v9 = (void *)objc_opt_new();
    objc_msgSend( v9,  "setDiscretionary:",  -[ASAsset userInitiatedDownload](self, "userInitiatedDownload") ^ 1);
    -[ASAsset identifier](self, "identifier");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    maAsset = self->_maAsset;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __51__ASAsset__downloadWithOptions_shouldFireCallback___block_invoke;
    v13[3] = &unk_189FFA6C8;
    v13[4] = self;
    id v14 = v10;
    id v12 = v10;
    -[MAAsset startDownload:completionWithError:](maAsset, "startDownload:completionWithError:", v9, v13);
  }

void __51__ASAsset__downloadWithOptions_shouldFireCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  uint64_t v8 = (void (**)(void, void, void))MEMORY[0x1895A2018](*(void *)(*(void *)(a1 + 32) + 40LL));
  if (v8)
  {
    if (v12)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset _downloadWithOptions:shouldFireCallback:]_block_invoke",  @"Deprecated V1 download failed",  v4,  v5,  v6,  v7,  v11);
      progressDictionaryForAssetIdAndState( *(void **)(a1 + 40),  [*(id *)(*(void *)(a1 + 32) + 48) state]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ASErrorForMAError(v12);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void *))v8)[2](v8, v9, v10);
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset _downloadWithOptions:shouldFireCallback:]_block_invoke",  @"Deprecated V1 download succeeded using V2",  v4,  v5,  v6,  v7,  v11);
      progressDictionaryForAssetIdAndState(*(void **)(a1 + 40), 2uLL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void))v8)[2](v8, v9, 0LL);
    }
  }
}

- (void)beginDownloadWithOptions:(id)a3
{
}

- (void)pauseDownload:(id)a3
{
  id v3 = a3;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset pauseDownload:]",  @"Deprecated ASAsset API is no longer supported: %s",  v4,  v5,  v6,  v7,  (uint64_t)"-[ASAsset pauseDownload:]");
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__ASAsset_pauseDownload___block_invoke;
  block[3] = &unk_189FFA550;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, block);
}

void __25__ASAsset_pauseDownload___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    _ASErrorForV1Deprecation(@"pauseDownload");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

- (BOOL)pauseDownloadAndReturnError:(id *)a3
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  4,  (uint64_t)"-[ASAsset pauseDownloadAndReturnError:]",  @"Could not pause asset download: %@",  v9,  v10,  v11,  v12,  (uint64_t)v8);
  if (a3) {
    *a3 = v8;
  }

  return 0;
}

- (void)resumeDownload:(id)a3
{
  id v3 = a3;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset resumeDownload:]",  @"Deprecated ASAsset API is no longer supported: %s",  v4,  v5,  v6,  v7,  (uint64_t)"-[ASAsset resumeDownload:]");
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__ASAsset_resumeDownload___block_invoke;
  block[3] = &unk_189FFA550;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, block);
}

void __26__ASAsset_resumeDownload___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    _ASErrorForV1Deprecation(@"resumeDownload");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

- (BOOL)resumeDownloadAndReturnError:(id *)a3
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v8;
  if (a3) {
    *a3 = v8;
  }
  _MobileAssetLog( 0LL,  4,  (uint64_t)"-[ASAsset resumeDownloadAndReturnError:]",  @"Could not resume asset download: %@",  v9,  v10,  v11,  v12,  (uint64_t)v13);

  return 0;
}

- (void)cancelDownload:(id)a3
{
  id v4 = a3;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset cancelDownload:]",  @"Deprecated ASAsset API is no longer supported: %s",  v5,  v6,  v7,  v8,  (uint64_t)"-[ASAsset cancelDownload:]");
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__ASAsset_cancelDownload___block_invoke;
  block[3] = &unk_189FF9600;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

void __26__ASAsset_cancelDownload___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 64LL);
  if (v1)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __26__ASAsset_cancelDownload___block_invoke_2;
    v4[3] = &unk_189FFA6F0;
    id v5 = *(id *)(a1 + 40);
    [v1 cancelDownload:v4];
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      _ASErrorForV1Deprecation(@"cancelDownload");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
    }
  }

void __26__ASAsset_cancelDownload___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4 = MAIsCancelDownloadResultFailure(a2);
  MAStringForMACancelDownloadResult(a2);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    _MobileAssetLog( 0LL,  4,  (uint64_t)"-[ASAsset cancelDownload:]_block_invoke_2",  @"Could not cancel v1 download: %lld %@",  v5,  v6,  v7,  v8,  a2);
  }
  else {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ASAsset cancelDownload:]_block_invoke_2",  @"Successful cancel v1 download: %lld %@",  v5,  v6,  v7,  v8,  a2);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    _ASErrorForV1Deprecation(@"cancelDownload");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }

- (BOOL)cancelDownloadAndReturnError:(id *)a3
{
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  maAsset = self->maAsset;
  if (maAsset)
  {
    uint64_t v11 = -[MAAsset cancelDownloadSync](maAsset, "cancelDownloadSync");
    int v12 = MAIsCancelDownloadResultFailure(v11);
    MAStringForMACancelDownloadResult(v11);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12) {
      _MobileAssetLog( 0LL,  4,  (uint64_t)"-[ASAsset cancelDownloadAndReturnError:]",  @"Could not cancel v1 download: %lld %@",  v13,  v14,  v15,  v16,  v11);
    }
    else {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[ASAsset cancelDownloadAndReturnError:]",  @"Successful cancel v1 download: %lld %@",  v13,  v14,  v15,  v16,  v11);
    }
  }

  if (a3) {
    *a3 = v9;
  }

  return 0;
}

- (void)purge:(id)a3
{
  id v3 = a3;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[ASAsset purge:]",  @"Deprecated ASAsset API is no longer supported: %s",  v4,  v5,  v6,  v7,  (uint64_t)"-[ASAsset purge:]");
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __17__ASAsset_purge___block_invoke;
  block[3] = &unk_189FFA550;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, block);
}

void __17__ASAsset_purge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    _ASErrorForV1Deprecation(@"purge");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

- (BOOL)purgeAndReturnError:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  4,  (uint64_t)"-[ASAsset purgeAndReturnError:]",  @"Could not purge asset: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  if (a3) {
    *a3 = v4;
  }

  return 0;
}

- (id)_getLocalAttribute:(id)a3
{
  id v4 = a3;
  -[ASAsset maAsset](self, "maAsset");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASAsset maAsset](self, "maAsset");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 attributes];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v4];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ([v4 isEqualToString:@"LocalURL"])
  {
    -[ASAsset maAsset](self, "maAsset");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 getLocalFileUrl];

    uint64_t v5 = (void *)v9;
  }

  if (!v5 && ([v4 isEqualToString:@"__DownloadState"] & 1) == 0) {
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ASAsset _getLocalAttribute:]",  @"Could not get attribute '%@': %@",  v10,  v11,  v12,  v13,  (uint64_t)v4);
  }

  return v5;
}

- (MAAsset)maAsset
{
  return self->maAsset;
}

- (void)setMaAsset:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (NSDictionary)downloadOptions
{
  return self->_downloadOptions;
}

- (BOOL)userInitiatedDownload
{
  return self->_userInitiatedDownload;
}

- (void)setUserInitiatedDownload:(BOOL)a3
{
  self->_userInitiatedDownload = a3;
}

- (void).cxx_destruct
{
}

- (ASAsset)initWithAssetType:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ASAsset;
  uint64_t v9 = -[ASAsset init](&v13, sel_init);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetType, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
    uint64_t v11 = -[MAAsset initWithAttributes:](objc_alloc(&OBJC_CLASS___MAAsset), "initWithAttributes:", v8);
    -[ASAsset setMaAsset:](v10, "setMaAsset:", v11);
  }

  return v10;
}

- (ASAsset)initWithMAAsset:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ASAsset;
  uint64_t v5 = -[ASAsset init](&v15, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    -[ASAsset setMaAsset:](v5, "setMaAsset:", v4);
    uint64_t v7 = [v4 assetType];
    assetType = v6->_assetType;
    v6->_assetType = (NSString *)v7;

    uint64_t v9 = (void *)MEMORY[0x189603FC8];
    -[MAAsset attributes](v6->maAsset, "attributes");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 dictionaryWithDictionary:v10];
    uint64_t v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if ([v4 wasLocal])
    {
      uint64_t v12 = @"Downloaded";
    }

    else if ([v4 state] == 4)
    {
      uint64_t v12 = @"Downloading";
    }

    else
    {
      uint64_t v12 = @"NotDownloaded";
    }

    -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"__DownloadState");
    attributes = v6->_attributes;
    v6->_attributes = v11;
  }

  return v6;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  clientName = self->_clientName;
  p_clientName = &self->_clientName;
  if (clientName != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_clientName, a3);
    uint64_t v5 = v8;
  }
}

- (NSDictionary)fullAttributes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASAsset maAsset](self, "maAsset");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 attributes];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[ASAsset(ASAssetInternal) fullAttributes]",  @"Could not get asset attributes: %@",  v4,  v5,  v6,  v7,  0LL);
    uint64_t v9 = 0LL;
  }

  return (NSDictionary *)v9;
}

- (id)identifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 assetId];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPresentOnDisk
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 wasLocal];

  return v3;
}

@end