@interface MABrainDownloader
- (MABrainDownloader)initWithMAAsset:(id)a3;
- (void)download:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation MABrainDownloader

- (MABrainDownloader)initWithMAAsset:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MABrainDownloader;
  v6 = -[MABrainDownloader init](&v12, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileAssetBrain-downloader-callback", v8);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_asset, a3);
  }

  return v6;
}

- (void)download:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"nonDiscetionary"]);
  unsigned int v12 = [v11 BOOLValue];

  -[MAAsset cancelDownloadSync](self->_asset, "cancelDownloadSync");
  v13 = objc_alloc_init(&OBJC_CLASS___MAMsuDownloadOptions);
  -[MAMsuDownloadOptions setSessionId:](v13, "setSessionId:", v10);

  -[MAMsuDownloadOptions setDiscretionary:](v13, "setDiscretionary:", v12 ^ 1);
  -[MAMsuDownloadOptions setAllowsCellularAccess:](v13, "setAllowsCellularAccess:", 1LL);
  -[MAMsuDownloadOptions setAllowsExpensiveAccess:](v13, "setAllowsExpensiveAccess:", 0LL);
  -[MAMsuDownloadOptions setRequiresPowerPluggedIn:](v13, "setRequiresPowerPluggedIn:", 0LL);
  -[MAMsuDownloadOptions setCanUseLocalCacheServer:](v13, "setCanUseLocalCacheServer:", 0LL);
  -[MAMsuDownloadOptions setPrefersInfraWiFi:](v13, "setPrefersInfraWiFi:", 1LL);
  -[MAMsuDownloadOptions setLiveServerCatalogOnly:](v13, "setLiveServerCatalogOnly:", 0LL);
  -[MAMsuDownloadOptions setTimeoutIntervalForResource:](v13, "setTimeoutIntervalForResource:", 900LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"dawHeader"]);

  -[MAMsuDownloadOptions setDownloadAuthorizationHeader:](v13, "setDownloadAuthorizationHeader:", v14);
  asset = self->_asset;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = __49__MABrainDownloader_download_options_completion___block_invoke;
  v27 = &unk_34EB10;
  v28 = self;
  id v29 = v8;
  id v16 = v8;
  -[MAAsset startDownload:completionWithError:](asset, "startDownload:completionWithError:", v13, &v24);
  v17 = "non-discretionary";
  if (!v12) {
    v17 = "discretionary";
  }
  id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MobileAssetBrain %s download initiated: %@", v17, self->_asset, v24, v25, v26, v27, v28));
  id v19 = [v18 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainDownloader download:options:completion:]",  @"[MAB] %s",  v20,  v21,  v22,  v23,  (uint64_t)v19);
}

void __49__MABrainDownloader_download_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v15[0] = NSDebugDescriptionErrorKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to download the MobileAssetBrain asset"));
    v15[1] = NSUnderlyingErrorKey;
    v16[0] = v6;
    v16[1] = v5;
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  140LL,  v7));
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = *(void **)(a1 + 40);
  id v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __49__MABrainDownloader_download_options_completion___block_invoke_2;
  block[3] = &unk_34E208;
  id v13 = v8;
  id v14 = v9;
  id v11 = v8;
  dispatch_async(v10, block);
}

uint64_t __49__MABrainDownloader_download_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end