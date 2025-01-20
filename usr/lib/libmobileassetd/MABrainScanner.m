@interface MABrainScanner
- (MABrainScanner)init;
- (NSNumber)compatibilityVersion;
- (void)locateAvailableUpdateBrain:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setCompatibilityVersion:(id)a3;
@end

@implementation MABrainScanner

- (MABrainScanner)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MABrainScanner;
  v2 = -[MABrainScanner init](&v15, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileAssetBrain-scanner", v4);
    scanQueue = v2->_scanQueue;
    v2->_scanQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileAssetBrain-scanner-callback", v8);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    lastCheck = v2->_lastCheck;
    v2->_lastCheck = 0LL;

    lastAsset = v2->_lastAsset;
    v2->_lastAsset = 0LL;

    compatibilityVersion = v2->_compatibilityVersion;
    v2->_compatibilityVersion = 0LL;
  }

  return v2;
}

- (void)locateAvailableUpdateBrain:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"restoreVersion"]);
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 info]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MobileAssetProperties"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"RestoreVersion"]);

    if (!v11)
    {
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v15 restoreVersion]);
    }
  }

  scanQueue = (dispatch_queue_s *)self->_scanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke;
  block[3] = &unk_34E190;
  block[4] = self;
  id v22 = v11;
  id v24 = v8;
  id v25 = v10;
  id v23 = v9;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  dispatch_async(scanQueue, block);
}

void __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke(uint64_t a1)
{
  v2 = *(_UNKNOWN ***)(*(void *)(a1 + 32) + 40LL);
  if (!v2) {
    v2 = &off_38EE60;
  }
  dispatch_queue_attr_t v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 productType]);

  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v29[0] = v7;
  id v8 = v6;
  if (!v6) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v29[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  id v10 = [v9 mutableCopy];

  if (!v6) {
  v23[0] = _NSConcreteStackBlock;
  }
  v23[1] = 3221225472LL;
  v23[2] = __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_193;
  v23[3] = &unk_34EAA0;
  v23[4] = *(void *)(a1 + 32);
  id v11 = v4;
  id v24 = v11;
  id v12 = v10;
  id v25 = v12;
  id v26 = *(id *)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 64);
  v13 = objc_retainBlock(v23);
  uint64_t v14 = *(void *)(a1 + 32);
  objc_super v15 = *(void **)(v14 + 24);
  if (v15 && *(void *)(v14 + 32) && ([v15 timeIntervalSinceNow], v16 > -30.0))
  {
    ((void (*)(void *, void, void))v13[2])(v13, 0LL, 0LL);
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_5;
    v17[3] = &unk_34EAC8;
    id v18 = *(id *)(a1 + 56);
    id v19 = v11;
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v22 = v13;
    +[MAAsset cancelCatalogDownload:then:]( &OBJC_CLASS___MAAsset,  "cancelCatalogDownload:then:",  @"com.apple.MobileAsset.MobileAssetBrain",  v17);
  }
}

void __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_193( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = v4;
    v29[0] = NSDebugDescriptionErrorKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAssetBrain catalog download failed"));
    v29[1] = NSUnderlyingErrorKey;
    v30[0] = v6;
    v30[1] = v5;
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  121LL,  v7));

    id v9 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_4;
    v20[3] = &unk_34E208;
    id v10 = &v22;
    id v11 = *(id *)(a1 + 72);
    id v12 = &v21;
    id v21 = v8;
    id v22 = v11;
    id v13 = v8;
    dispatch_async(v9, v20);
LABEL_5:

    goto LABEL_6;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v15 = *(void *)(a1 + 32);
  double v16 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v14;

  id v17 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.MobileAssetBrain" andPurpose:0];
  id v13 = v17;
  if (v17)
  {
    [v17 addKeyValuePair:@"_CompatibilityVersion" with:*(void *)(a1 + 40)];
    [v13 addKeyValueArray:@"SupportedDevices" with:*(void *)(a1 + 48)];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_2;
    v23[3] = &unk_34EA78;
    id v10 = &v24;
    id v13 = v13;
    id v24 = v13;
    id v12 = &v25;
    id v25 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    uint64_t v19 = *(void *)(a1 + 32);
    id v26 = v18;
    uint64_t v27 = v19;
    id v28 = *(id *)(a1 + 72);
    [v13 queryMetaDataWithError:v23];

    goto LABEL_5;
  }

void __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
    id v15 = [v14 count];

    if (!v15) {
      goto LABEL_36;
    }
    double v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);

    id v17 = *(id *)(a1 + 40);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"RestoreVersion"]);

    if (v17)
    {
      id v20 = [[SUCoreRestoreVersion alloc] initWithRestoreVersion:v17];
      if (v19)
      {
LABEL_9:
        id v21 = [[SUCoreRestoreVersion alloc] initWithRestoreVersion:v19];
        id v22 = v21;
        if (v20 && v21)
        {
          if ([v20 isComparable:v21])
          {
            id v23 = (char *)[v20 compare:v22];
            if (v23 == (_BYTE *)&dword_0 + 1 || !v23 && !MABrainUtilityAllowSameVersionBrain()) {
              goto LABEL_26;
            }
          }

          else if ((MABrainUtilityAllowCrossBuildGroupBrain() & 1) == 0)
          {
LABEL_26:

            v6 = 0LL;
            goto LABEL_27;
          }
        }

uint64_t __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void __64__MABrainScanner_locateAvailableUpdateBrain_options_completion___block_invoke_5(uint64_t a1)
{
  BOOL v2 = MABrainUtilityAllowSameVersionBrain();
  id v12 = objc_alloc_init(&OBJC_CLASS___MAMsuDownloadOptions);
  dispatch_queue_attr_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MAMsuDownloadOptions setAdditionalServerParams:](v12, "setAdditionalServerParams:", v3);

  -[MAMsuDownloadOptions setSessionId:](v12, "setSessionId:", *(void *)(a1 + 32));
  -[MAMsuDownloadOptions setDiscretionary:](v12, "setDiscretionary:", 0LL);
  -[MAMsuDownloadOptions setAllowsCellularAccess:](v12, "setAllowsCellularAccess:", 1LL);
  -[MAMsuDownloadOptions setAllowsExpensiveAccess:](v12, "setAllowsExpensiveAccess:", 1LL);
  -[MAMsuDownloadOptions setRequiresPowerPluggedIn:](v12, "setRequiresPowerPluggedIn:", 0LL);
  -[MAMsuDownloadOptions setCanUseLocalCacheServer:](v12, "setCanUseLocalCacheServer:", 0LL);
  -[MAMsuDownloadOptions setPrefersInfraWiFi:](v12, "setPrefersInfraWiFi:", 1LL);
  -[MAMsuDownloadOptions setLiveServerCatalogOnly:](v12, "setLiveServerCatalogOnly:", 0LL);
  -[MAMsuDownloadOptions setTimeoutIntervalForResource:](v12, "setTimeoutIntervalForResource:", 90LL);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v12, "additionalServerParams"));
  [v5 setObject:v4 forKeyedSubscript:@"CompatibilityVersion"];

  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v12, "additionalServerParams"));
  [v7 setObject:v6 forKeyedSubscript:@"RestoreVersion"];

  id v8 = @"false";
  if (v2) {
    id v8 = @"true";
  }
  id v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v12, "additionalServerParams"));
  [v10 setObject:v9 forKeyedSubscript:@"AllowSameRestoreVersion"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"dawHeader"]);
  -[MAMsuDownloadOptions setDownloadAuthorizationHeader:](v12, "setDownloadAuthorizationHeader:", v11);

  +[MAAsset startCatalogDownload:options:completionWithError:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:completionWithError:",  @"com.apple.MobileAsset.MobileAssetBrain",  v12,  *(void *)(a1 + 64));
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end