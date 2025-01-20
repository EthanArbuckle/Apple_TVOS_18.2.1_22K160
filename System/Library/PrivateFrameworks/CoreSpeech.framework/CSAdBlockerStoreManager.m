@interface CSAdBlockerStoreManager
- (CSAdBlockerStoreManager)init;
- (CSAsset)assetForAdBlockerFile;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)CSAdBlockerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5;
- (void)_populateAdBlockerWithSignaturesWithAsset:(id)a3;
- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4;
- (void)registerObserver:(id)a3;
- (void)setAssetForAdBlockerFile:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAdBlockerStoreManager

- (CSAdBlockerStoreManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAdBlockerStoreManager;
  v2 = -[CSAdBlockerStoreManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("AdBlockerStoreManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100068BAC;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100068B2C;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)start
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSUAFDownloadMonitor sharedInstance](&OBJC_CLASS___CSUAFDownloadMonitor, "sharedInstance"));
  [v3 addObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100068454;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_populateAdBlockerWithSignaturesWithAsset:(id)a3
{
  id v4 = a3;
  v27 = -[CSAdBlockerAssetDecoder initWithAssetPath:]( objc_alloc(&OBJC_CLASS___CSAdBlockerAssetDecoder),  "initWithAssetPath:",  v4);
  if (v27)
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[CSAdBlockerStoreManager observers](self, "observers"));
    id v5 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v5)
    {
      uint64_t v29 = *(void *)v31;
      *(void *)&__int128 v6 = 136315906LL;
      __int128 v26 = v6;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v26));
          unsigned int v10 = [v9 fileExistsAtPath:v4];

          v11 = (os_log_s *)CSLogCategoryAdBlocker;
          if (v10)
          {
            v12 = (os_log_s *)CSLogCategoryAdBlocker;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueAdBlockerStoreManagerObserverIdentifier]);
              *(_DWORD *)buf = 136315394;
              v35 = "-[CSAdBlockerStoreManager _populateAdBlockerWithSignaturesWithAsset:]";
              __int16 v36 = 2112;
              v37 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s AdBlocker store has update for observer %@",  buf,  0x16u);
            }

            if ((objc_opt_respondsToSelector(v8, "adBlockerStoreHasUpdateWithAssetPath:") & 1) != 0) {
              [v8 adBlockerStoreHasUpdateWithAssetPath:v4];
            }
            if ((objc_opt_respondsToSelector( v8,  "adBlockerStoreHasUpdateWithCatalog:withResetDictionary:withMaxFingerprintBufferSize:withAssetVersion:") & 1) != 0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAdBlockerAssetDecoder decodeAdblockerAsset](v27, "decodeAdblockerAsset"));
              v15 = v14;
              if (!v14)
              {
                v25 = (os_log_s *)CSLogCategoryAdBlocker;
                if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  v35 = "-[CSAdBlockerStoreManager _populateAdBlockerWithSignaturesWithAsset:]";
                  _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s AssetConfig decoding failed! Setting adBlocker database to nil",  buf,  0xCu);
                }

                goto LABEL_28;
              }

              v16 = (void *)objc_claimAutoreleasedReturnValue([v14 shazamCatalog]);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v15 shouldResetAdsDictionary]);
              [v15 maxFingerprintBufferSize];
              int v19 = v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue([v15 assetVersion]);
              if (v16)
              {
                v21 = (os_log_s *)CSLogCategoryAdBlocker;
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueAdBlockerStoreManagerObserverIdentifier]);
                  *(_DWORD *)buf = 136315650;
                  v35 = "-[CSAdBlockerStoreManager _populateAdBlockerWithSignaturesWithAsset:]";
                  __int16 v36 = 2112;
                  v37 = v20;
                  __int16 v38 = 2112;
                  v39 = v22;
                  _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s AdBlocker store has update with asset version: %@ for observer %@",  buf,  0x20u);
                }

                LODWORD(v23) = v19;
                [v8 adBlockerStoreHasUpdateWithCatalog:v16 withResetDictionary:v17 withMaxFingerprintBufferSize:v20 withAssetVersion:v23];
              }
            }
          }

          else if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[CSAdBlockerStoreManager _populateAdBlockerWithSignaturesWithAsset:]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s shazamCataLog is nil. Setting adBlocker database to nil",  buf,  0xCu);
          }
        }

        id v5 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 4)
  {
    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSAdBlockerStoreManager assetDownloadMonitorDelegate:assetType:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s AdBlocker got new asset", buf, 0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSUAFAssetManager sharedInstance](&OBJC_CLASS___CSUAFAssetManager, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100068010;
    v9[3] = &unk_10022E340;
    v9[4] = self;
    [v8 getInstalledAssetofType:4 forLocale:@"generic" completion:v9];
  }
}

- (void)CSAdBlockerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSAdBlockerStoreManager CSAdBlockerAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s AdBlocker got new asset", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100067DCC;
  v10[3] = &unk_10022E340;
  v10[4] = self;
  [v8 assetOfType:4 providerType:a5 language:v9 completion:v10];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CSAsset)assetForAdBlockerFile
{
  return self->_assetForAdBlockerFile;
}

- (void)setAssetForAdBlockerFile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end