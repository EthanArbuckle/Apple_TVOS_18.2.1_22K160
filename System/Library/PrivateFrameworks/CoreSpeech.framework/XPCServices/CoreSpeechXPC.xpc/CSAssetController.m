@interface CSAssetController
+ (id)filteredAssetsForAssets:(id)a3 assetType:(unint64_t)a4 language:(id)a5;
+ (id)filteredAssetsForFetchRemoteMetaDataForAssets:(id)a3 assetType:(unint64_t)a4;
+ (id)getAdBlockerAssetTypeString;
+ (id)getAssetTypeStringForType:(unint64_t)a3;
+ (id)getEndpointAssetTypeString;
+ (id)getLanguageDetectorAssetTypeString;
+ (id)getSpeakerRecognitionAssetTypeString;
+ (id)getVoiceTriggerAssetTypeString;
+ (id)sharedController;
+ (unint64_t)getAdBlockerCurrentCompatibilityVersion;
+ (unint64_t)getEndpointAssetCurrentCompatibilityVersion;
+ (unint64_t)getLanguageDetectorCurrentCompatibilityVersion;
+ (unint64_t)getSpeakerRecognitionCurrentCompatibilityVersion;
+ (unint64_t)getVoiceTriggerAssetCurrentCompatibilityVersion;
+ (void)addKeyValuePairForQuery:(id *)a3 assetType:(unint64_t)a4;
- (BOOL)_isRetryRecommendedWithResult:(int64_t)a3;
- (CSAssetController)init;
- (NSDictionary)csAssetsDictionary;
- (NSMutableDictionary)observers;
- (OS_dispatch_queue)assetsMigrationQueue;
- (OS_dispatch_queue)queue;
- (id)_assetQueryForAssetType:(unint64_t)a3;
- (id)_defaultDownloadOptions;
- (id)_findLatestInstalledAsset:(id)a3;
- (id)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4;
- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4;
- (id)assetOfType:(unint64_t)a3 language:(id)a4;
- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4;
- (id)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4;
- (void)_cleanUpMobileAssetV1Directory;
- (void)_downloadAsset:(id)a3 withComplete:(id)a4;
- (void)_downloadAssetCatalogForAssetType:(unint64_t)a3 complete:(id)a4;
- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5;
- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 query:(id)a5 completion:(id)a6;
- (void)_installedAssetOfType:(unint64_t)a3 query:(id)a4 withLanguage:(id)a5 completion:(id)a6;
- (void)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5;
- (void)_runAssetQuery:(id)a3 completion:(id)a4;
- (void)_setAssetQueryParameters:(id)a3;
- (void)_startDownloadingAsset:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)_updateFromRemoteToLocalAssets:(id)a3 forAssetType:(unint64_t)a4 completion:(id)a5;
- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)fetchRemoteMetaOfType:(unint64_t)a3;
- (void)fetchRemoteMetaOfType:(unint64_t)a3 allowRetry:(BOOL)a4;
- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)setAssetsMigrationQueue:(id)a3;
- (void)setCsAssetsDictionary:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAssetController

- (CSAssetController)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSAssetController;
  v2 = -[CSAssetController init](&v22, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getVoiceTriggerAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getVoiceTriggerAssetTypeString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getEndpointAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getEndpointAssetTypeString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getLanguageDetectorAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getLanguageDetectorAssetTypeString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getAdBlockerAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getAdBlockerAssetTypeString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getSpeakerRecognitionAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getSpeakerRecognitionAssetTypeString"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v8;

    v27[0] = &off_10001E170;
    v27[1] = &off_10001E188;
    v28[0] = v3;
    v28[1] = v4;
    v27[2] = &off_10001E1A0;
    v27[3] = &off_10001E1B8;
    v28[2] = v5;
    v28[3] = v7;
    v27[4] = &off_10001E1D0;
    v27[5] = &off_10001E1E8;
    v28[4] = v6;
    v28[5] = @"com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay";
    v27[6] = &off_10001E200;
    v28[6] = @"com.apple.MobileAsset.VoiceTriggerAssetsMac";
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  7LL));
    csAssetsDictionary = v2->_csAssetsDictionary;
    v2->_csAssetsDictionary = (NSDictionary *)v10;

    v12 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_csAssetsDictionary;
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSAssetController init]";
      __int16 v25 = 2114;
      v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s _csAssetsDictionary = %{public}@",  buf,  0x16u);
    }

    dispatch_queue_t v14 = dispatch_queue_create("Serial CSAssetController queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("V1 Assets Clean-up queue", 0LL);
    assetsMigrationQueue = v2->_assetsMigrationQueue;
    v2->_assetsMigrationQueue = (OS_dispatch_queue *)v16;

    v18 = (dispatch_queue_s *)v2->_assetsMigrationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E164;
    block[3] = &unk_10001C6C8;
    v21 = v2;
    dispatch_async(v18, block);
  }

  return v2;
}

- (void)_cleanUpMobileAssetV1Directory
{
  v2 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSAssetController _cleanUpMobileAssetV1Directory]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getVoiceTriggerAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getVoiceTriggerAssetTypeString"));
  _MACleanV1Repository();

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getEndpointAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getEndpointAssetTypeString"));
  _MACleanV1Repository();

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getLanguageDetectorAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getLanguageDetectorAssetTypeString"));
  _MACleanV1Repository();

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getAdBlockerAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getAdBlockerAssetTypeString"));
  _MACleanV1Repository();
}

- (id)assetOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAssetController installedAssetOfType:withLanguage:]( self,  "installedAssetOfType:withLanguage:",  a3,  v6));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E150;
    block[3] = &unk_10001C6F0;
    void block[4] = self;
    unint64_t v13 = a3;
    id v12 = v6;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else
  {
    v9 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAssetController assetOfType:language:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s CSAssetController cannot query for nil language",  buf,  0xCu);
    }

    int v7 = 0LL;
  }

  return v7;
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3));
    [v7 returnTypes:2];
    unint64_t v8 = (unint64_t)[v7 queryMetaDataSync];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController filteredAssetsForAssets:assetType:language:]( &OBJC_CLASS___CSAssetController,  "filteredAssetsForAssets:assetType:language:",  v9,  a3,  v6));

    v11 = (os_log_s *)CSLogCategoryAsset;
    if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v28 = "-[CSAssetController allInstalledAssetsOfType:language:]";
        __int16 v29 = 2050;
        unint64_t v30 = a3;
        __int16 v31 = 2114;
        unint64_t v32 = (unint64_t)v7;
        __int16 v33 = 2050;
        unint64_t v34 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu",  buf,  0x2Au);
      }

      id v12 = 0LL;
    }

    else
    {
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v14 = v11;
        id v15 = [v10 count];
        dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 queryParams]);
        *(_DWORD *)buf = 136315906;
        v28 = "-[CSAssetController allInstalledAssetsOfType:language:]";
        __int16 v29 = 2050;
        unint64_t v30 = (unint64_t)v15;
        __int16 v31 = 2050;
        unint64_t v32 = a3;
        __int16 v33 = 2114;
        unint64_t v34 = (unint64_t)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s ::: found %{public}lu installed assets for assetType=%{public}lu, matching query: %{public}@",  buf,  0x2Au);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingComparator:&stru_10001C730]);
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472LL;
      v23 = sub_10000E09C;
      v24 = &unk_10001C758;
      id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      unint64_t v26 = a3;
      id v18 = v25;
      [v17 enumerateObjectsUsingBlock:&v21];
      if (objc_msgSend(v18, "count", v21, v22, v23, v24)) {
        v19 = v18;
      }
      else {
        v19 = 0LL;
      }
      id v12 = v19;
    }
  }

  else
  {
    unint64_t v13 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[CSAssetController allInstalledAssetsOfType:language:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s CSAssetController cannot query for nil language",  buf,  0xCu);
    }

    id v12 = 0LL;
  }

  return v12;
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (!v8)
  {
    v11 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSAssetController assetOfType:language:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s CSAssetController cannot query for nil language",  buf,  0xCu);
      if (!v9) {
        goto LABEL_6;
      }
    }

    else if (!v9)
    {
      goto LABEL_6;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    v9[2](v9, 0LL, v12);

    goto LABEL_6;
  }

  -[CSAssetController installedAssetOfType:withLanguage:completion:]( self,  "installedAssetOfType:withLanguage:completion:",  a3,  v8,  v9);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E088;
  block[3] = &unk_10001C6F0;
  void block[4] = self;
  unint64_t v15 = a3;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_6:
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  v11 = (void (**)(id, void, void *))a6;
  if (!v10)
  {
    unint64_t v13 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSAssetController assetOfType:language:compatibilityVersion:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s CSAssetController cannot query for nil language",  buf,  0xCu);
      if (!v11) {
        goto LABEL_6;
      }
    }

    else if (!v11)
    {
      goto LABEL_6;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    v11[2](v11, 0LL, v14);

    goto LABEL_6;
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DE80;
  block[3] = &unk_10001C7A8;
  void block[4] = self;
  unint64_t v18 = a3;
  unint64_t v19 = a5;
  id v16 = v10;
  v17 = v11;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_6:
}

- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAssetController installedAssetOfType:withLanguage:]( self,  "installedAssetOfType:withLanguage:",  a3,  v6));
  }

  else
  {
    id v8 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[CSAssetController installedAssetOfType:language:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s CSAssetController cannot query for nil language",  (uint8_t *)&v10,  0xCu);
    }

    int v7 = 0LL;
  }

  return v7;
}

- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (!v8)
  {
    int v10 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      unint64_t v13 = "-[CSAssetController installedAssetOfType:language:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s CSAssetController cannot query for nil language",  (uint8_t *)&v12,  0xCu);
      if (!v9) {
        goto LABEL_6;
      }
    }

    else if (!v9)
    {
      goto LABEL_6;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    v9[2](v9, 0LL, v11);

    goto LABEL_6;
  }

  -[CSAssetController installedAssetOfType:withLanguage:completion:]( self,  "installedAssetOfType:withLanguage:completion:",  a3,  v8,  v9);
LABEL_6:
}

- (id)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4
{
  id v6 = a4;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_10000DE28;
  v23 = sub_10000DE38;
  id v24 = 0LL;
  queue = self->_queue;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  unint64_t v13 = sub_10000DE40;
  id v14 = &unk_10001C7D0;
  v17 = &v19;
  unint64_t v18 = a3;
  unint64_t v15 = self;
  id v8 = v6;
  id v16 = v8;
  dispatch_sync((dispatch_queue_t)queue, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "getCSAssetOfType:", a3, v11, v12, v13, v14, v15));

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000DD1C;
  v13[3] = &unk_10001C7F8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (id)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4
{
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3));
  [v7 returnTypes:2];
  unint64_t v8 = (unint64_t)[v7 queryMetaDataSync];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController filteredAssetsForAssets:assetType:language:]( &OBJC_CLASS___CSAssetController,  "filteredAssetsForAssets:assetType:language:",  v9,  a3,  v6));

  id v11 = (os_log_s *)CSLogCategoryAsset;
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      unint64_t v18 = "-[CSAssetController _installedAssetOfType:withLanguage:]";
      __int16 v19 = 2050;
      unint64_t v20 = a3;
      __int16 v21 = 2114;
      unint64_t v22 = (unint64_t)v7;
      __int16 v23 = 2050;
      unint64_t v24 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu",  (uint8_t *)&v17,  0x2Au);
    }

    id v12 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = v11;
      id v14 = [v10 count];
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 queryParams]);
      int v17 = 136315906;
      unint64_t v18 = "-[CSAssetController _installedAssetOfType:withLanguage:]";
      __int16 v19 = 2050;
      unint64_t v20 = (unint64_t)v14;
      __int16 v21 = 2050;
      unint64_t v22 = a3;
      __int16 v23 = 2114;
      unint64_t v24 = (unint64_t)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s ::: found %{public}lu assets for assetType=%{public}lu, matching query: %{public}@",  (uint8_t *)&v17,  0x2Au);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAssetController _findLatestInstalledAsset:](self, "_findLatestInstalledAsset:", v10));
  }

  return v12;
}

- (void)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3));
  -[CSAssetController _installedAssetOfType:query:withLanguage:completion:]( self,  "_installedAssetOfType:query:withLanguage:completion:",  a3,  v10,  v9,  v8);
}

- (void)_installedAssetOfType:(unint64_t)a3 query:(id)a4 withLanguage:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v10 returnTypes:2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000DA80;
  v16[3] = &unk_10001C820;
  id v20 = v12;
  unint64_t v21 = a3;
  id v17 = v10;
  id v18 = v11;
  __int16 v19 = self;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [v15 queryMetaData:v16];
}

- (id)_findLatestInstalledAsset:(id)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v3)
  {
    id v5 = v3;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v21;
    *(void *)&__int128 v4 = 136315394LL;
    __int128 v18 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        unint64_t v10 = (unint64_t)objc_msgSend(v9, "state", v18);
        id v11 = (os_log_s *)CSLogCategoryAsset;
        if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          id v25 = "-[CSAssetController _findLatestInstalledAsset:]";
          __int16 v26 = 2050;
          unint64_t v27 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Asset state : %{public}ld",  buf,  0x16u);
        }

        if (v10 <= 6 && ((1LL << v10) & 0x6C) != 0)
        {
          if (v6)
          {
            if ([v9 isLatestCompareTo:v6])
            {
              id v13 = v9;

              id v6 = v13;
            }
          }

          else
          {
            id v6 = v9;
          }
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  id v14 = (void *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
    *(_DWORD *)buf = 136315394;
    id v25 = "-[CSAssetController _findLatestInstalledAsset:]";
    __int16 v26 = 2114;
    unint64_t v27 = (unint64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  return v6;
}

- (id)_assetQueryForAssetType:(unint64_t)a3
{
  id v5 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CSAssetController _assetQueryForAssetType:]";
    __int16 v16 = 2050;
    unint64_t v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ::: assetType: %{public}lu", buf, 0x16u);
  }

  id v6 = objc_alloc(&OBJC_CLASS___MAAssetQuery);
  csAssetsDictionary = self->_csAssetsDictionary;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](csAssetsDictionary, "objectForKeyedSubscript:", v8));
  id v10 = [v6 initWithType:v9];

  id v13 = v10;
  +[CSAssetController addKeyValuePairForQuery:assetType:]( &OBJC_CLASS___CSAssetController,  "addKeyValuePairForQuery:assetType:",  &v13,  a3);
  id v11 = v13;

  -[CSAssetController _setAssetQueryParameters:](self, "_setAssetQueryParameters:", v11);
  return v11;
}

- (void)_setAssetQueryParameters:(id)a3
{
  id v3 = a3;
  __int128 v4 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSAssetController _setAssetQueryParameters:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s setDoNotBlockBeforeFirstUnlock: YES",  (uint8_t *)&v5,  0xCu);
  }

  [v3 setDoNotBlockBeforeFirstUnlock:1];
}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[CSAssetController _runAssetQuery:completion:]";
    __int16 v15 = 2082;
    __int16 v16 = "-[CSAssetController _runAssetQuery:completion:]";
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ::: %{public}s; query: %{public}@", buf, 0x20u);
  }

  kdebug_trace(722472320LL, 0LL, 0LL, 0LL, 0LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000D898;
  v10[3] = &unk_10001C848;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v9 queryMetaData:v10];
}

- (void)fetchRemoteMetaOfType:(unint64_t)a3
{
}

- (void)fetchRemoteMetaOfType:(unint64_t)a3 allowRetry:(BOOL)a4
{
  uint64_t v7 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSAssetController fetchRemoteMetaOfType:allowRetry:]";
    __int16 v12 = 1026;
    int v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s ::: Request Fetching RemoteMetaData : assetType : %{public}d",  buf,  0x12u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000D6AC;
  v8[3] = &unk_10001C898;
  v8[4] = self;
  v8[5] = a3;
  BOOL v9 = a4;
  -[CSAssetController _downloadAssetCatalogForAssetType:complete:]( self,  "_downloadAssetCatalogForAssetType:complete:",  a3,  v8);
}

- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v11 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s ::: Request fetching remote asset",  (uint8_t *)&v13,  0xCu);
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3));
  -[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]( self,  "_fetchRemoteAssetOfType:withLanguage:query:completion:",  a3,  v10,  v12,  v9);
}

- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 query:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v11 returnTypes:2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000D3FC;
  v16[3] = &unk_10001C820;
  void v16[4] = self;
  id v17 = v11;
  id v19 = v12;
  unint64_t v20 = a3;
  id v18 = v10;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  [v15 queryMetaData:v16];
}

- (void)_downloadAssetCatalogForAssetType:(unint64_t)a3 complete:(id)a4
{
  id v6 = a4;
  csAssetsDictionary = self->_csAssetsDictionary;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](csAssetsDictionary, "objectForKeyedSubscript:", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAssetController _defaultDownloadOptions](self, "_defaultDownloadOptions"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000D278;
  v12[3] = &unk_10001C8E8;
  id v13 = v6;
  unint64_t v14 = a3;
  v12[4] = self;
  id v11 = v6;
  +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  v9,  v10,  v12);
}

- (BOOL)_isRetryRecommendedWithResult:(int64_t)a3
{
  BOOL result = 1;
  return result;
}

- (void)_updateFromRemoteToLocalAssets:(id)a3 forAssetType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  v38 = self;
  id v39 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ::: Fetching remote asset", buf, 0xCu);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v49 = 0u;
  __int128 v48 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (!v10)
  {
    id v12 = 0LL;
    id v13 = 0LL;
    id v14 = 0LL;
    goto LABEL_24;
  }

  id v11 = v10;
  id v12 = 0LL;
  id v13 = 0LL;
  id v14 = 0LL;
  uint64_t v15 = *(void *)v49;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v49 != v15) {
        objc_enumerationMutation(v9);
      }
      id v17 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
      if (v14)
      {
        if ([*(id *)(*((void *)&v48 + 1) + 8 * (void)i) isLatestCompareTo:v14])
        {
          id v18 = v17;

          id v14 = v18;
        }
      }

      else
      {
        id v14 = v17;
      }

      if ([v17 isCSAssetInstalled])
      {
        if (!v13)
        {
          id v13 = v17;
          continue;
        }

        if ([v17 isLatestCompareTo:v13])
        {
          id v19 = v13;

          id v13 = v17;
        }

        else
        {
          id v19 = v17;
        }

        id v12 = v19;
      }
    }

    id v11 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
  }

  while (v11);
LABEL_24:

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v45;
    id v40 = v20;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(id *)(*((void *)&v44 + 1) + 8LL * (void)j);
        if (v25 != v14 && v25 != v13 && v25 != v12)
        {
          if ([*(id *)(*((void *)&v44 + 1) + 8 * (void)j) isDownloading])
          {
            [v25 cancelDownloadSync];
          }

          else if ([v25 canBePurged])
          {
            v28 = (void *)CSLogCategoryAsset;
            if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v29 = v28;
              unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
              *(_DWORD *)buf = 136315394;
              v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
              __int16 v54 = 2114;
              unint64_t v55 = (unint64_t)v30;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s ::: Purging installed asset : %{public}@",  buf,  0x16u);
            }

            [v25 purgeSync];
            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
            unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 getOnDeviceCompilationCacheDirectory]);
            id v33 =  +[CSOnDeviceMAAssetCachedIrPurger purgeCachedIrForMAAsset:cachedIrDir:]( &OBJC_CLASS___CSOnDeviceMAAssetCachedIrPurger,  "purgeCachedIrForMAAsset:cachedIrDir:",  v25,  v32);

            id v20 = v40;
          }
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }

    while (v22);
  }

  if (!v14 || v14 == v13)
  {
    v35 = v39;
    if (v13)
    {
      if (v39) {
        (*((void (**)(id, void))v39 + 2))(v39, 0LL);
      }
    }

    else if (v39)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  802LL,  0LL));
      (*((void (**)(id, void *))v39 + 2))(v39, v36);
    }
  }

  else
  {
    unint64_t v34 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
      __int16 v54 = 2050;
      unint64_t v55 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s ::: Request downloading remote asset for assetType %{public}lu",  buf,  0x16u);
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10000D030;
    v41[3] = &unk_10001C910;
    v35 = v39;
    v41[4] = v38;
    id v42 = v39;
    unint64_t v43 = a4;
    -[CSAssetController _downloadAsset:withComplete:](v38, "_downloadAsset:withComplete:", v14, v41);
  }
}

- (id)_defaultDownloadOptions
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___MADownloadOptions, a2);
  [v2 setAllowsCellularAccess:0];
  [v2 setCanUseLocalCacheServer:0];
  [v2 setDiscretionary:0];
  return v2;
}

- (void)_downloadAsset:(id)a3 withComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[CSAssetController _downloadAsset:withComplete:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ::: Start downloading asset", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000CDCC;
  v11[3] = &unk_10001C978;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[CSAssetController _startDownloadingAsset:progress:completion:]( self,  "_startDownloadingAsset:progress:completion:",  v10,  &stru_10001C950,  v11);
}

- (void)_startDownloadingAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSAssetController _startDownloadingAsset:progress:completion:]";
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2050;
    id v31 = [v8 state];
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Attempting to download asset %{public}@, asset state : %{public}ld",  buf,  0x20u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000CCA8;
  v24[3] = &unk_10001C9A0;
  id v13 = v9;
  id v26 = v13;
  id v14 = v8;
  id v25 = v14;
  uint64_t v15 = objc_retainBlock(v24);
  switch((unint64_t)[v14 state])
  {
    case 0uLL:
      uint64_t v16 = CSErrorDomain;
      uint64_t v17 = 808LL;
      goto LABEL_5;
    case 1uLL:
      *(void *)buf = 0LL;
      unsigned int v20 = [v14 spaceCheck:buf];
      if (v20)
      {
        [v14 attachProgressCallBack:v15];
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSAssetController _defaultDownloadOptions](self, "_defaultDownloadOptions"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10000CD34;
        v22[3] = &unk_10001C9C8;
        id v23 = v10;
        [v14 startDownload:v21 then:v22];

        id v18 = 0LL;
      }

      else
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  807LL,  0LL));
      }

      int v19 = v20 ^ 1;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
      uint64_t v16 = CSErrorDomain;
      uint64_t v17 = 806LL;
      goto LABEL_5;
    case 4uLL:
      uint64_t v16 = CSErrorDomain;
      uint64_t v17 = 805LL;
LABEL_5:
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  v17,  0LL));
      break;
    default:
      id v18 = 0LL;
      break;
  }

  int v19 = 1;
  if (v10)
  {
LABEL_7:
    if (v19) {
      (*((void (**)(id, void *))v10 + 2))(v10, v18);
    }
  }

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CB88;
  block[3] = &unk_10001C6F0;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CAA4;
  block[3] = &unk_10001C6F0;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)assetsMigrationQueue
{
  return self->_assetsMigrationQueue;
}

- (void)setAssetsMigrationQueue:(id)a3
{
}

- (NSDictionary)csAssetsDictionary
{
  return self->_csAssetsDictionary;
}

- (void)setCsAssetsDictionary:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedController
{
  if (qword_100022D00 != -1) {
    dispatch_once(&qword_100022D00, &stru_10001C6A0);
  }
  return (id)qword_100022CF8;
}

+ (id)getAssetTypeStringForType:(unint64_t)a3
{
  id v3 = 0LL;
  switch(a3)
  {
    case 0uLL:
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getVoiceTriggerAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getVoiceTriggerAssetTypeString"));
      return v3;
    case 1uLL:
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getEndpointAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getEndpointAssetTypeString"));
      return v3;
    case 2uLL:
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getLanguageDetectorAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getLanguageDetectorAssetTypeString"));
      return v3;
    case 3uLL:
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getSpeakerRecognitionAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getSpeakerRecognitionAssetTypeString"));
      return v3;
    case 4uLL:
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetController getAdBlockerAssetTypeString]( &OBJC_CLASS___CSAssetController,  "getAdBlockerAssetTypeString"));
      return v3;
    case 5uLL:
      return @"com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay";
    case 7uLL:
      return @"com.apple.MobileAsset.VoiceTriggerAssetsMac";
    default:
      return v3;
  }

+ (id)filteredAssetsForFetchRemoteMetaDataForAssets:(id)a3 assetType:(unint64_t)a4
{
  return +[CSAssetController filteredAssetsForAssets:assetType:language:]( &OBJC_CLASS___CSAssetController,  "filteredAssetsForAssets:assetType:language:",  a3,  a4,  kCSAssetValueLanguageAny);
}

+ (id)filteredAssetsForAssets:(id)a3 assetType:(unint64_t)a4 language:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int16 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    uint64_t v13 = kCSAssetLanguageKey;
    uint64_t v28 = kCSAssetFootprintKey;
    uint64_t v27 = kCSAssetPremiumKey;
    id v29 = v8;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attributes", v27));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForKey:v13]);
        id v18 = v17;
        if (!v8 || [v17 containsObject:v8])
        {
          if (a4 <= 7
            && ((1LL << a4) & 0xA1) != 0
            && (+[CSUtils supportPremiumAssets](&OBJC_CLASS___CSUtils, "supportPremiumAssets") & 1) == 0)
          {
            id v19 = v11;
            uint64_t v20 = v13;
            unint64_t v21 = a4;
            uint64_t v22 = v12;
            id v23 = v9;
            unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v28]);
            id v25 = v24;

            id v9 = v23;
            uint64_t v12 = v22;
            a4 = v21;
            uint64_t v13 = v20;
            id v11 = v19;
            id v8 = v29;
          }

          else
          {
            -[NSMutableArray addObject:](v30, "addObject:", v15);
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v11);
  }

  return v30;
}

+ (void)addKeyValuePairForQuery:(id *)a3 assetType:(unint64_t)a4
{
  id v5 = *a3;
  unint64_t v6 = 15LL;
  switch(a4)
  {
    case 0uLL:
      unint64_t v6 = +[CSAssetController getVoiceTriggerAssetCurrentCompatibilityVersion]( &OBJC_CLASS___CSAssetController,  "getVoiceTriggerAssetCurrentCompatibilityVersion");
      break;
    case 1uLL:
      unint64_t v6 = +[CSAssetController getEndpointAssetCurrentCompatibilityVersion]( &OBJC_CLASS___CSAssetController,  "getEndpointAssetCurrentCompatibilityVersion");
      break;
    case 2uLL:
      unint64_t v6 = +[CSAssetController getLanguageDetectorCurrentCompatibilityVersion]( &OBJC_CLASS___CSAssetController,  "getLanguageDetectorCurrentCompatibilityVersion");
      break;
    case 3uLL:
      unint64_t v6 = +[CSAssetController getSpeakerRecognitionCurrentCompatibilityVersion]( &OBJC_CLASS___CSAssetController,  "getSpeakerRecognitionCurrentCompatibilityVersion");
      break;
    case 4uLL:
      unint64_t v6 = +[CSAssetController getAdBlockerCurrentCompatibilityVersion]( &OBJC_CLASS___CSAssetController,  "getAdBlockerCurrentCompatibilityVersion");
      break;
    case 5uLL:
      unint64_t v6 = 14LL;
      break;
    case 7uLL:
      break;
    default:
      id v7 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "+[CSAssetController(Utils) addKeyValuePairForQuery:assetType:]";
        __int16 v12 = 2050;
        unint64_t v13 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s ERR: Unknown AssetType: %{public}lu",  buf,  0x16u);
      }

      unint64_t v6 = 0LL;
      break;
  }

  uint64_t v8 = ASAttributeCompatibilityVersion;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v6));
  [v5 addKeyValuePair:v8 with:v9];
}

+ (id)getVoiceTriggerAssetTypeString
{
  return +[CSMobileAssetVersions getVoiceTriggerAssetTypeString]( &OBJC_CLASS___CSMobileAssetVersions,  "getVoiceTriggerAssetTypeString");
}

+ (unint64_t)getVoiceTriggerAssetCurrentCompatibilityVersion
{
  return (unint64_t)+[CSMobileAssetVersions getVoiceTriggerCurrentCompatibilityVersion]( &OBJC_CLASS___CSMobileAssetVersions,  "getVoiceTriggerCurrentCompatibilityVersion");
}

+ (id)getEndpointAssetTypeString
{
  if ((CSIsWatch(a1, a2) & 1) != 0) {
    return @"com.apple.MobileAsset.SpeechEndpointAssetsWatch";
  }
  if ((CSIsTV() & 1) != 0) {
    return @"com.apple.MobileAsset.SpeechEndpointAssetsTV";
  }
  if ((+[CSUtils shouldUseHorsemanSpeechEndpointAssets]( &OBJC_CLASS___CSUtils,  "shouldUseHorsemanSpeechEndpointAssets") & 1) != 0) {
    return @"com.apple.MobileAsset.SpeechEndpointMarshAssets";
  }
  return @"com.apple.MobileAsset.SpeechEndpointAssets";
}

+ (unint64_t)getEndpointAssetCurrentCompatibilityVersion
{
  if ((CSIsWatch(a1, a2) & 1) != 0) {
    return 3LL;
  }
  if ((CSIsTV() & 1) != 0) {
    return 5LL;
  }
  if ((+[CSUtils shouldUseHorsemanSpeechEndpointAssets]( &OBJC_CLASS___CSUtils,  "shouldUseHorsemanSpeechEndpointAssets") & 1) != 0) {
    return 2LL;
  }
  return 3LL;
}

+ (id)getLanguageDetectorAssetTypeString
{
  return @"com.apple.MobileAsset.LanguageDetectorAssets";
}

+ (unint64_t)getLanguageDetectorCurrentCompatibilityVersion
{
  return 4LL;
}

+ (id)getAdBlockerAssetTypeString
{
  return @"com.apple.MobileAsset.AdBlockerAssets";
}

+ (unint64_t)getAdBlockerCurrentCompatibilityVersion
{
  return 1LL;
}

+ (id)getSpeakerRecognitionAssetTypeString
{
  else {
    return @"com.apple.MobileAsset.SpeakerRecognitionAssets";
  }
}

+ (unint64_t)getSpeakerRecognitionCurrentCompatibilityVersion
{
  return 1LL;
}

@end