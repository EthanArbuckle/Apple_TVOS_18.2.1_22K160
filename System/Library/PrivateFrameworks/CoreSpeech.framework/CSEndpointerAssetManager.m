@interface CSEndpointerAssetManager
+ (id)_getFakeEndpointAsset;
+ (id)_getOEPAssetWithLanguage:(id)a3;
+ (id)_getOEPVersionFromPath:(id)a3;
+ (id)sharedManager;
- (BOOL)_isOSDIncludedInAsset:(id)a3;
- (CSAsset)currentHEPAsset;
- (CSAsset)currentOEPAsset;
- (CSEndpointerAssetManager)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (id)_fetchEndpointMobileAssetWithLanguage:(id)a3;
- (id)_getCurrentHEPAsset;
- (id)_getModelPathFromInstallationStatusString:(id)a3;
- (id)getCurrentEndpointerAsset;
- (id)getCurrentOSDAsset;
- (void)CSAssetManagerDidDownloadNewAsset:(id)a3;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)_notifyAssetsUpdate;
- (void)_notifyAssetsUpdateForObserver:(id)a3;
- (void)_registerForAssetUpdateNotifications;
- (void)_updateAssetWithCurrentLanguageForAssetType:(unint64_t)a3;
- (void)_updateAssetWithLanguage:(id)a3 assetType:(unint64_t)a4;
- (void)_updateEndpointerAssetsIfNeeded;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCurrentHEPAsset:(id)a3;
- (void)setCurrentOEPAsset:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSEndpointerAssetManager

- (CSEndpointerAssetManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSEndpointerAssetManager;
  v2 = -[CSEndpointerAssetManager init](&v13, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSEndpointerAssetManager queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    -[CSEndpointerAssetManager _registerForAssetUpdateNotifications](v2, "_registerForAssetUpdateNotifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSLanguageCodeUpdateMonitor sharedInstance]( &OBJC_CLASS___CSLanguageCodeUpdateMonitor,  "sharedInstance"));
    [v7 addObserver:v2];

    v8 = objc_alloc_init(&OBJC_CLASS___CSAssetDownloadingOption);
    -[CSAssetDownloadingOption setAllowEndpointAssetDownloading:](v8, "setAllowEndpointAssetDownloading:", 1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
    [v9 setAssetDownloadingOption:v8];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
    [v10 addObserver:v2 forAssetType:1];

    v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSEndpointerAssetManager init]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AD1B8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AD178;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)getCurrentOSDAsset
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000AD058;
  v10 = sub_1000AD068;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AD10C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getCurrentEndpointerAsset
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000AD058;
  v10 = sub_1000AD068;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AD070;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSEndpointerAssetManager;
  -[CSEndpointerAssetManager dealloc](&v3, "dealloc");
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000ACE94;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)CSAssetManagerDidDownloadNewAsset:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ACDE0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_registerForAssetUpdateNotifications
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[CSEndpointerAssetManager _registerForAssetUpdateNotifications]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Registering for asset update notifications...",  buf,  0xCu);
  }

  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000ACD78;
  v26[3] = &unk_10022C258;
  objc_copyWeak(&v27, &location);
  id v4 = objc_retainBlock(v26);
  id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  tokenForAssetUpdateNotification = self->_tokenForAssetUpdateNotification;
  self->_tokenForAssetUpdateNotification = v5;

  v36[0] = @"com.apple.siri.uaf.com.apple.siri.understanding";
  v36[1] = @"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED";
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint32_t v12 = notify_register_dispatch( (const char *)[v11 UTF8String],  &out_token,  (dispatch_queue_t)self->_queue,  v4);
        if (v12)
        {
          objc_super v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v30 = "-[CSEndpointerAssetManager _registerForAssetUpdateNotifications]";
            __int16 v31 = 2112;
            id v32 = v11;
            __int16 v33 = 1024;
            uint32_t v34 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Failed to register for notification (%@), status: %u",  buf,  0x1Cu);
          }

          int v14 = -1;
          int out_token = -1;
        }

        else
        {
          int v14 = out_token;
        }

        v15 = self->_tokenForAssetUpdateNotification;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v11);
      }

      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v35 count:16];
    }

    while (v8);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ACDD0;
  block[3] = &unk_10022C280;
  id v20 = v4;
  v18 = v4;
  dispatch_async_and_wait(queue, block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (id)_getCurrentHEPAsset
{
  currentHEPAsset = self->_currentHEPAsset;
  if (currentHEPAsset) {
    return currentHEPAsset;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  id v5 = (CSAsset *)objc_claimAutoreleasedReturnValue( -[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:]( self,  "_fetchEndpointMobileAssetWithLanguage:",  v4));
  uint64_t v6 = self->_currentHEPAsset;
  self->_currentHEPAsset = v5;

  id v7 = self->_currentHEPAsset;
  id v8 = (void *)CSLogContextFacilityCoreSpeech;
  BOOL v9 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](v7, "path"));
      int v13 = 136315650;
      int v14 = "-[CSEndpointerAssetManager _getCurrentHEPAsset]";
      __int16 v15 = 2114;
      v16 = v7;
      __int16 v17 = 2114;
      v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s HEP Asset: %{public}@, path: %{public}@",  (uint8_t *)&v13,  0x20u);
    }

    -[CSEndpointerAssetManager _notifyAssetsUpdate](self, "_notifyAssetsUpdate");
    currentHEPAsset = self->_currentHEPAsset;
    return currentHEPAsset;
  }

  if (v9)
  {
    int v13 = 136315138;
    int v14 = "-[CSEndpointerAssetManager _getCurrentHEPAsset]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "%s Failed to get HEP asset",  (uint8_t *)&v13,  0xCu);
  }

  return 0LL;
}

- (void)_updateEndpointerAssetsIfNeeded
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSEndpointerAssetManager _updateEndpointerAssetsIfNeeded]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Updating endpointer assets if needed...",  (uint8_t *)&v4,  0xCu);
  }

  -[CSEndpointerAssetManager _updateAssetWithCurrentLanguageForAssetType:]( self,  "_updateAssetWithCurrentLanguageForAssetType:",  1LL);
  -[CSEndpointerAssetManager _updateAssetWithCurrentLanguageForAssetType:]( self,  "_updateAssetWithCurrentLanguageForAssetType:",  0LL);
}

- (void)_updateAssetWithCurrentLanguageForAssetType:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  -[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:](self, "_updateAssetWithLanguage:assetType:", v5, a3);
}

- (void)_updateAssetWithLanguage:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = @"Invalid CSEndpointerAssetType";
    if (a4 == 1) {
      BOOL v9 = @"HEP";
    }
    if (!a4) {
      BOOL v9 = @"OEP";
    }
    v10 = v9;
    int v17 = 136315650;
    v18 = "-[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:]";
    __int16 v19 = 2112;
    unint64_t v20 = (unint64_t)v10;
    __int16 v21 = 2112;
    id v22 = v6;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Updating %@ asset with language: %@",  (uint8_t *)&v17,  0x20u);
  }

  if (a4 == 1)
  {
    __int16 v15 = (CSAsset *)objc_claimAutoreleasedReturnValue( -[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:]( self,  "_fetchEndpointMobileAssetWithLanguage:",  v6));
    currentHEPAsset = self->_currentHEPAsset;
    self->_currentHEPAsset = v15;
    goto LABEL_11;
  }

  if (!a4)
  {
    id v12 = objc_msgSend((id)objc_opt_class(self, v8), "_getOEPAssetWithLanguage:", v6);
    int v13 = (CSAsset *)objc_claimAutoreleasedReturnValue(v12);
    currentHEPAsset = self->_currentOEPAsset;
    self->_currentOEPAsset = v13;
LABEL_11:

    -[CSEndpointerAssetManager _notifyAssetsUpdate](self, "_notifyAssetsUpdate");
    goto LABEL_14;
  }

  v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v17 = 136315394;
    v18 = "-[CSEndpointerAssetManager _updateAssetWithLanguage:assetType:]";
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Invalid CSEndpointerAssetType: %lu",  (uint8_t *)&v17,  0x16u);
  }

- (void)_notifyAssetsUpdate
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));
  if (v3
    && (int v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset")),
        unsigned int v6 = -[CSEndpointerAssetManager _isOSDIncludedInAsset:](self, "_isOSDIncludedInAsset:", v5),
        v5,
        v4,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset"));
    if (v7)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));

      if (v9)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));

        id v7 = (void *)v10;
      }
    }
  }

  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v33 = "-[CSEndpointerAssetManager _notifyAssetsUpdate]";
    __int16 v34 = 2114;
    v35 = v7;
    __int16 v36 = 2114;
    v37 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s endpointAsset: %{public}@, osdAsset: %{public}@",  buf,  0x20u);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager observers](self, "observers"));
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)v16) endpointerAssetManagerDidUpdateAsset:v7];
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v14);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager observers](self, "observers", 0LL));
  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      __int16 v21 = 0LL;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v21) endpointerAssetManagerDidUpdateOSDAsset:v8];
        __int16 v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v19);
  }
}

- (void)_notifyAssetsUpdateForObserver:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));
  if (v6
    && (id v7 = (void *)v6,
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset")),
        unsigned int v9 = -[CSEndpointerAssetManager _isOSDIncludedInAsset:](self, "_isOSDIncludedInAsset:", v8),
        v8,
        v7,
        v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentHEPAsset](self, "currentHEPAsset"));
    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));

      if (v12)
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSEndpointerAssetManager currentOEPAsset](self, "currentOEPAsset"));

        uint64_t v10 = (void *)v13;
      }
    }
  }

  id v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    v16 = "-[CSEndpointerAssetManager _notifyAssetsUpdateForObserver:]";
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s endpointAsset: %{public}@, osdAsset: %{public}@",  (uint8_t *)&v15,  0x20u);
  }

  [v5 endpointerAssetManagerDidUpdateAsset:v10];
  [v5 endpointerAssetManagerDidUpdateOSDAsset:v11];
}

- (id)_fetchEndpointMobileAssetWithLanguage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v6 = [v5 isEndpointAssetOverridingEnabled];

  if (v6)
  {
    id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_getFakeEndpointAsset");
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v11 assetOfType:1 language:v4]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v13 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      [v12 timeIntervalSinceDate:v10];
      int v17 = 136315394;
      id v18 = "-[CSEndpointerAssetManager _fetchEndpointMobileAssetWithLanguage:]";
      __int16 v19 = 2050;
      uint64_t v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s elapsed time to get HEP mobile assets: %{public}lf",  (uint8_t *)&v17,  0x16u);
    }
  }

  return v9;
}

- (id)_getModelPathFromInstallationStatusString:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"ModelInfo="]);
    if ([v5 count] == (id)2)
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@":"]);

      else {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)_isOSDIncludedInAsset:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 resourcePath]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"SPG.nnet"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (CSAsset)currentHEPAsset
{
  return self->_currentHEPAsset;
}

- (void)setCurrentHEPAsset:(id)a3
{
}

- (CSAsset)currentOEPAsset
{
  return self->_currentOEPAsset;
}

- (void)setCurrentOEPAsset:(id)a3
{
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

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_10027FF08 != -1) {
    dispatch_once(&qword_10027FF08, &stru_10022C1F0);
  }
  return (id)qword_10027FF00;
}

+ (id)_getOEPAssetWithLanguage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v6 = [v5 isEndpointAssetBypassTrialEnabled];

  if (v6)
  {
    uint64_t v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      __int128 v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Bypass Trial Asset", (uint8_t *)&v25, 0xCu);
    }

    id v8 = 0LL;
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v10 = [v9 isEndpointAssetOverridingEnabled];

    if (v10)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _getFakeEndpointAsset]);
    }

    else
    {
      id v11 = [[SFEntitledAssetConfig alloc] initWithAssetType:3 language:v4 regionId:0];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installedAssetWithConfig:v11]);

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:@"OEP"]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned __int8 v16 = [v15 fileExistsAtPath:v14];

        int v17 = (void *)CSLogContextFacilityCoreSpeech;
        if ((v16 & 1) != 0)
        {
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = v17;
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 language]);
            int v25 = 136315650;
            __int128 v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
            __int16 v27 = 2112;
            __int128 v28 = v19;
            __int16 v29 = 2114;
            v30 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Found OEP asset for %@ at path: %{public}@",  (uint8_t *)&v25,  0x20u);
          }

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _getOEPVersionFromPath:v14]);
          id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  1LL,  v14,  v20,  1LL));
        }

        else
        {
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            int v25 = 136315394;
            __int128 v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
            __int16 v27 = 2114;
            __int128 v28 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "%s File does not exist: %{public}@",  (uint8_t *)&v25,  0x16u);
          }

          id v8 = 0LL;
        }
      }

      else
      {
        __int16 v21 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          __int128 v23 = v21;
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v11 language]);
          int v25 = 136315394;
          __int128 v26 = "+[CSEndpointerAssetManager _getOEPAssetWithLanguage:]";
          __int16 v27 = 2112;
          __int128 v28 = v24;
          _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s No OEP asset for %@ was found.",  (uint8_t *)&v25,  0x16u);
        }

        id v8 = 0LL;
      }
    }
  }

  return v8;
}

+ (id)_getOEPVersionFromPath:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"cs_hep.json"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
    if (!v6)
    {
      id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
        __int16 v18 = 2114;
        __int16 v19 = v3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }

      id v11 = @"0.0";
      goto LABEL_17;
    }

    id v15 = 0LL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v15));
    id v8 = v15;
    if (v8)
    {
      unsigned int v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
        __int16 v18 = 2114;
        __int16 v19 = v3;
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Could not decode contents of: %{public}@: err: %{public}@",  buf,  0x20u);
      }
    }

    else if (v7)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"version"]);

      if (v13)
      {
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"version"]);
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
    }

    id v11 = @"0.0";
    goto LABEL_16;
  }

  unsigned int v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "+[CSEndpointerAssetManager _getOEPVersionFromPath:]";
    __int16 v18 = 2114;
    __int16 v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s File does not exist: %{public}@",  buf,  0x16u);
  }

  id v11 = @"0.0";
LABEL_18:

  return v11;
}

+ (id)_getFakeEndpointAsset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fakeEndpointAssetPath]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  1LL,  v3,  @"0.0",  1LL));
  unsigned __int8 v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[CSEndpointerAssetManager _getFakeEndpointAsset]";
    __int16 v9 = 2112;
    unsigned int v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Fake endpoint asset: %@",  (uint8_t *)&v7,  0x16u);
  }

  return v4;
}

@end