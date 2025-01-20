@interface DCAssetFetcher
+ (id)sharedFetcher;
- (id)_assetQuery;
- (id)_validateAsset:(id)a3 error:(id *)a4;
- (void)_fetchAssetWithContext:(id)a3 completionHandler:(id)a4;
- (void)_handleMissingMetadataWithContext:(id)a3 completion:(id)a4;
- (void)_handleSuccessForQuery:(id)a3 completion:(id)a4;
- (void)_queryMetadataWithContext:(id)a3 completion:(id)a4;
- (void)fetchPublicKeyAssetWithCompletion:(id)a3;
- (void)initiateMetadataFetchIgnoringCachesWithCompletion:(id)a3;
@end

@implementation DCAssetFetcher

+ (id)sharedFetcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003944;
  block[3] = &unk_100008260;
  block[4] = a1;
  if (qword_10000D010 != -1) {
    dispatch_once(&qword_10000D010, block);
  }
  return (id)qword_10000D008;
}

- (void)fetchPublicKeyAssetWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___DCAssetFetcherContext);
  -[DCAssetFetcherContext setAllowCatalogRefresh:](v5, "setAllowCatalogRefresh:", 0LL);
  -[DCAssetFetcher _fetchAssetWithContext:completionHandler:](self, "_fetchAssetWithContext:completionHandler:", v5, v4);
}

- (void)initiateMetadataFetchIgnoringCachesWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = sub_1000043BC();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Initiating an out of band catalog download",  v6,  2u);
  }

  +[MAAsset startCatalogDownload:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:then:",  @"com.apple.MobileAsset.DeviceCheck",  &stru_1000082A0);
  v3[2](v3, 1LL, 0LL);
}

- (void)_fetchAssetWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1000043BC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Querying...", v10, 2u);
  }

  -[DCAssetFetcher _queryMetadataWithContext:completion:](self, "_queryMetadataWithContext:completion:", v7, v6);
}

- (void)_queryMetadataWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = sub_1000043BC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting to fetch asset with context: %@",  (uint8_t *)&v15,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DCAssetFetcher _assetQuery](self, "_assetQuery"));
  id v11 = [v10 queryMetaDataSync];
  if (([v6 ignoreCachedMetadata] & 1) != 0 || v11 == (id)2)
  {
    -[DCAssetFetcher _handleMissingMetadataWithContext:completion:]( self,  "_handleMissingMetadataWithContext:completion:",  v6,  v7);
  }

  else if (v11)
  {
    id v12 = sub_1000043BC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100005998((uint64_t)v11, v13);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.twobit.fetcherror",  -3000LL,  0LL));
    v7[2](v7, 0LL, v14);
  }

  else
  {
    -[DCAssetFetcher _handleSuccessForQuery:completion:](self, "_handleSuccessForQuery:completion:", v10, v7);
  }
}

- (id)_assetQuery
{
  return  [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.DeviceCheck"];
}

- (void)_handleMissingMetadataWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000043BC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Query sync result indicated missing asset catalog",  buf,  2u);
  }

  if ([v6 allowCatalogRefresh])
  {
    [v6 setAllowCatalogRefresh:0];
    [v6 setIgnoreCachedMetadata:0];
    id v10 = sub_1000043BC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to download catalog, waiting for result...",  buf,  2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100003F28;
    v22[3] = &unk_1000082C8;
    id v24 = v7;
    v22[4] = self;
    id v23 = v6;
    +[MAAsset startCatalogDownload:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:then:",  @"com.apple.MobileAsset.DeviceCheck",  v22);

    id v12 = v24;
  }

  else
  {
    id v13 = sub_1000043BC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100005A0C(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.twobit.fetcherror",  -3001LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v12);
  }
}

- (void)_handleSuccessForQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = sub_1000043BC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
    *(_DWORD *)buf = 134217984;
    id v30 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Query success, results count: %lu", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
  id v12 = [v11 count];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
    id v14 = [v13 count];

    if ((unint64_t)v14 >= 2)
    {
      id v15 = sub_1000043BC();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100005A40(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 results]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);

    id v28 = 0LL;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DCAssetFetcher _validateAsset:error:](self, "_validateAsset:error:", v25, &v28));
    id v27 = v28;
    v7[2](v7, v26, v27);
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.twobit.fetcherror",  -3100LL,  0LL));
    v7[2](v7, 0LL, v25);
  }
}

- (id)_validateAsset:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = sub_1000043BC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 state];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
    int v14 = 138412802;
    id v15 = v5;
    __int16 v16 = 2048;
    id v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attempting to validate asset: <%@ - %ld> - %@",  (uint8_t *)&v14,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[DCAsset assetWithMobileAsset:](&OBJC_CLASS___DCAsset, "assetWithMobileAsset:", v5));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[DCBGSTaskController sharedInstance](&OBJC_CLASS___DCBGSTaskController, "sharedInstance"));
    uint64_t v12 = kBGSRefreshTaskID;
    [v10 publicKeyRefreshInterval];
    objc_msgSend(v11, "updateTaskWithIdentifier:withRefreshInterval:", v12);
  }

  else if (a4)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.twobit.fetcherror",  -3200LL,  0LL));
  }

  return v10;
}

@end