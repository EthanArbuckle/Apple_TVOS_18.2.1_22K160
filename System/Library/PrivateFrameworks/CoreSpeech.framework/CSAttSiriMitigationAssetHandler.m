@interface CSAttSiriMitigationAssetHandler
+ (id)sharedHandler;
+ (id)sharedHandlerDisabledOnDeviceCompilation;
- (BOOL)overrideEnabled;
- (CSAsset)cachedAsset;
- (CSAssetManager)assetManager;
- (CSAttSiriMitigationAssetHandler)init;
- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8;
- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8 disableOnDeviceCompilation:(BOOL)a9;
- (CSAttSiriMitigationAssetHandler)initWithDisableOnDeviceCompilation;
- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor;
- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler;
- (CSUAFAssetManager)uafAssetManager;
- (CSUAFDownloadMonitor)uafDownloadMonitor;
- (NSHashTable)observers;
- (NSString)overridePath;
- (OS_dispatch_queue)queue;
- (id)getNeuralCombinerConfigFile;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)_getPreinstalledMitigationAssetForCurrentLocale:(id)a3;
- (void)_receivedNewAssetUpdate:(id)a3;
- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4;
- (void)getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)notifyObservers:(id)a3 endpointId:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setCachedAsset:(id)a3;
- (void)setCachedAssetWithOverride:(id)a3;
- (void)setLanguageCodeUpdateMonitor:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOnDeviceCompilationHandler:(id)a3;
- (void)setOverrideEnabled:(BOOL)a3;
- (void)setOverridePath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUafAssetManager:(id)a3;
- (void)setUafDownloadMonitor:(id)a3;
- (void)start;
- (void)triggerAssetRefresh;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAttSiriMitigationAssetHandler

- (CSAttSiriMitigationAssetHandler)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = [v3 isMitigationAssetOverridingEnabled];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fakeMitigationAssetPath]);
  v7 = -[CSAttSiriMitigationAssetHandler initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:]( self,  "initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverride Flag:withOverrideAssetPath:",  0LL,  0LL,  0LL,  0LL,  v4,  v6);

  return v7;
}

- (CSAttSiriMitigationAssetHandler)initWithDisableOnDeviceCompilation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = [v3 isMitigationAssetOverridingEnabled];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fakeMitigationAssetPath]);
  LOBYTE(v9) = 1;
  v7 = -[CSAttSiriMitigationAssetHandler initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:disableOnDeviceCompilation:]( self,  "initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverride Flag:withOverrideAssetPath:disableOnDeviceCompilation:",  0LL,  0LL,  0LL,  0LL,  v4,  v6,  v9);

  return v7;
}

- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8 disableOnDeviceCompilation:(BOOL)a9
{
  BOOL v10 = a7;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v16 = a6;
  id v17 = a8;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___CSAttSiriMitigationAssetHandler;
  v18 = -[CSAttSiriMitigationAssetHandler init](&v41, "init");
  if (v18)
  {
    dispatch_queue_t v19 = dispatch_queue_create("CSAttSiriMitigationAssetHandler", 0LL);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    p_assetManager = (void **)&v18->_assetManager;
    objc_storeStrong((id *)&v18->_assetManager, a3);
    if (!v18->_assetManager)
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
      v23 = *p_assetManager;
      *p_assetManager = (void *)v22;
    }

    p_uafDownloadMonitor = (void **)&v18->_uafDownloadMonitor;
    objc_storeStrong((id *)&v18->_uafDownloadMonitor, a5);
    if (!v18->_uafDownloadMonitor)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[CSUAFDownloadMonitor sharedInstance](&OBJC_CLASS___CSUAFDownloadMonitor, "sharedInstance"));
      v26 = *p_uafDownloadMonitor;
      *p_uafDownloadMonitor = (void *)v25;
    }

    p_uafAssetManager = (void **)&v18->_uafAssetManager;
    objc_storeStrong((id *)&v18->_uafAssetManager, a4);
    if (!v18->_uafAssetManager)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue(+[CSUAFAssetManager sharedInstance](&OBJC_CLASS___CSUAFAssetManager, "sharedInstance"));
      v29 = *p_uafAssetManager;
      *p_uafAssetManager = (void *)v28;
    }

    v18->_overrideEnabled = v10;
    if (v10) {
      objc_storeStrong((id *)&v18->_overridePath, a8);
    }
    p_languageCodeUpdateMonitor = (void **)&v18->_languageCodeUpdateMonitor;
    objc_storeStrong((id *)&v18->_languageCodeUpdateMonitor, a6);
    if (v18->_languageCodeUpdateMonitor)
    {
      if (a9) {
        goto LABEL_16;
      }
    }

    else
    {
      uint64_t v31 = objc_claimAutoreleasedReturnValue(+[CSLanguageCodeUpdateMonitor sharedInstance](&OBJC_CLASS___CSLanguageCodeUpdateMonitor, "sharedInstance"));
      v32 = *p_languageCodeUpdateMonitor;
      *p_languageCodeUpdateMonitor = (void *)v31;

      if (a9)
      {
LABEL_16:
        -[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:](v18, "setCachedAssetWithOverride:", 0LL);
        -[CSAttSiriMitigationAssetHandler start](v18, "start");
        uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
        observers = v18->_observers;
        v18->_observers = (NSHashTable *)v35;

        goto LABEL_17;
      }
    }

    if (!v18->_onDeviceCompilationHandler)
    {
      uint64_t v33 = objc_claimAutoreleasedReturnValue(+[CSOnDeviceCompilationHandler sharedHandler](&OBJC_CLASS___CSOnDeviceCompilationHandler, "sharedHandler"));
      onDeviceCompilationHandler = v18->_onDeviceCompilationHandler;
      v18->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v33;
    }

    goto LABEL_16;
  }

- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8
{
  LOBYTE(v9) = 0;
  return -[CSAttSiriMitigationAssetHandler initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:disableOnDeviceCompilation:]( self,  "initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverri deFlag:withOverrideAssetPath:disableOnDeviceCompilation:",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
}

- (void)start
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  [v3 addObserver:self];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100042848;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004283C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyObservers:(id)a3 endpointId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100042718;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)setCachedAssetWithOverride:(id)a3
{
  id v4 = a3;
  if (self->_overrideEnabled)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v6 = [v5 fileExistsAtPath:self->_overridePath];

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByDeletingLastPathComponent]( self->_overridePath,  "stringByDeletingLastPathComponent"));
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  6LL,  v7,  @"override-asset",  2LL));
      id v9 = (void *)qword_10027FD48;
      qword_10027FD48 = v8;

      id v10 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:]";
        __int16 v21 = 2112;
        uint64_t v22 = qword_10027FD48;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Using override asset: %@", buf, 0x16u);
      }
    }
  }

  v11 = (void *)qword_10027FD48;
  if (!qword_10027FD48) {
    v11 = v4;
  }
  id v12 = v11;
  cachedAsset = self->_cachedAsset;
  self->_cachedAsset = v12;

  onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
  if (onDeviceCompilationHandler)
  {
    v15 = self->_cachedAsset;
    id v18 = 0LL;
    -[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:]( onDeviceCompilationHandler,  "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:",  v15,  6LL,  0LL,  &v18);
    id v16 = v18;
    id v17 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:]";
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Compile override Mitigation asset to onDevice CacheIr with error: %@",  buf,  0x16u);
    }
  }
}

- (void)getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100042708;
  block[3] = &unk_10022E7D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100042654;
  v16[3] = &unk_10022E1A8;
  id v6 = v5;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  uint64_t v8 = (void (**)(void, void, void))v7;
  cachedAsset = self->_cachedAsset;
  if (cachedAsset)
  {
    ((void (*)(void *, CSAsset *, void))v7[2])(v7, cachedAsset, 0LL);
  }

  else
  {
    uafAssetManager = self->_uafAssetManager;
    if (uafAssetManager)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100042668;
      v14[3] = &unk_10022D908;
      v14[4] = self;
      v15 = v8;
      -[CSUAFAssetManager getInstalledAssetofType:forLocale:completion:]( uafAssetManager,  "getInstalledAssetofType:forLocale:completion:",  6LL,  v11,  v14);
    }

    else
    {
      id v12 = objc_alloc(&OBJC_CLASS___NSError);
      id v13 = -[NSError initWithDomain:code:userInfo:](v12, "initWithDomain:code:userInfo:", CSErrorDomain, 1601LL, 0LL);
      ((void (**)(void, void, NSError *))v8)[2](v8, 0LL, v13);
    }
  }
}

- (void)triggerAssetRefresh
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000423A4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_receivedNewAssetUpdate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 assetProvider] != (id)2)
  {
    id v10 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[CSAttSiriMitigationAssetHandler _receivedNewAssetUpdate:]";
      id v7 = "%s Ignore MA asset update";
      uint64_t v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }

  else
  {
    -[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:](self, "setCachedAssetWithOverride:", v5);
    -[CSAttSiriMitigationAssetHandler notifyObservers:endpointId:](self, "notifyObservers:endpointId:", v5, 0LL);
    id v6 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[CSAttSiriMitigationAssetHandler _receivedNewAssetUpdate:]";
      __int16 v13 = 2112;
      v14 = v5;
      id v7 = "%s Updated cache with new UAF asset %@";
      uint64_t v8 = v6;
      uint32_t v9 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
}

- (id)getNeuralCombinerConfigFile
{
  return 0LL;
}

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100042224;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }

  else
  {
    uint64_t v8 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v11 = "-[CSAttSiriMitigationAssetHandler assetDownloadMonitorDelegate:assetType:]";
      __int16 v12 = 2048;
      unint64_t v13 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Ignore Trial asset update for type: %lu",  buf,  0x16u);
    }
  }
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  uafAssetManager = self->_uafAssetManager;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100042140;
  v7[3] = &unk_10022E340;
  v7[4] = self;
  -[CSUAFAssetManager getInstalledAssetofType:forLocale:completion:]( uafAssetManager,  "getInstalledAssetofType:forLocale:completion:",  6LL,  v6,  v7);
}

- (void)_getPreinstalledMitigationAssetForCurrentLocale:(id)a3
{
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10004212C;
  v24[3] = &unk_10022E1A8;
  id v3 = a3;
  id v25 = v3;
  id v4 = objc_retainBlock(v24);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSAsset fallBackAssetResourcePath](&OBJC_CLASS___CSAsset, "fallBackAssetResourcePath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"/PreinstalledAssets/preinstalledMeta.json"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

  if ((v9 & 1) != 0)
  {
    id v10 = (NSError *)objc_claimAutoreleasedReturnValue(+[CSAsset decodeJson:](&OBJC_CLASS___CSAsset, "decodeJson:", v7));
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v5));
    if (v11)
    {
      uint64_t v12 = CSSystemRootDirectory();
      v23 = v5;
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v26[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"resourcePath"]);
      v26[1] = v14;
      v26[2] = @"mitigation";
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
      id v16 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v15));

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"configVersion"]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:]( &OBJC_CLASS___CSAsset,  "assetForAssetType:resourcePath:configVersion:assetProvider:",  6LL,  v16,  v17,  0LL));
      ((void (*)(void *, void *, void))v4[2])(v4, v18, 0LL);

      id v5 = v23;
    }

    else
    {
      __int16 v21 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = "-[CSAttSiriMitigationAssetHandler _getPreinstalledMitigationAssetForCurrentLocale:]";
        __int16 v29 = 2112;
        v30 = v5;
        __int16 v31 = 2112;
        v32 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Could not find AssetMeta for current locale: %@, preinstalledAssetMeta: %@. No mitigation functionality",  buf,  0x20u);
      }

      uint64_t v22 = objc_alloc(&OBJC_CLASS___NSError);
      id v16 = -[NSError initWithDomain:code:userInfo:](v22, "initWithDomain:code:userInfo:", CSErrorDomain, 1601LL, 0LL);
      ((void (*)(void *, void, NSError *))v4[2])(v4, 0LL, v16);
    }
  }

  else
  {
    dispatch_queue_t v19 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[CSAttSiriMitigationAssetHandler _getPreinstalledMitigationAssetForCurrentLocale:]";
      __int16 v29 = 2114;
      v30 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Preinstalled model meta not found: %{public}@. No mitigation functionality.",  buf,  0x16u);
    }

    v20 = objc_alloc(&OBJC_CLASS___NSError);
    id v10 = -[NSError initWithDomain:code:userInfo:](v20, "initWithDomain:code:userInfo:", CSErrorDomain, 1601LL, 0LL);
    ((void (*)(void *, void, NSError *))v4[2])(v4, 0LL, v10);
  }
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && self->_onDeviceCompilationHandler)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100041FEC;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCachedAsset:(id)a3
{
}

- (CSAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (CSUAFAssetManager)uafAssetManager
{
  return self->_uafAssetManager;
}

- (void)setUafAssetManager:(id)a3
{
}

- (CSUAFDownloadMonitor)uafDownloadMonitor
{
  return self->_uafDownloadMonitor;
}

- (void)setUafDownloadMonitor:(id)a3
{
}

- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor
{
  return self->_languageCodeUpdateMonitor;
}

- (void)setLanguageCodeUpdateMonitor:(id)a3
{
}

- (BOOL)overrideEnabled
{
  return self->_overrideEnabled;
}

- (void)setOverrideEnabled:(BOOL)a3
{
  self->_overrideEnabled = a3;
}

- (NSString)overridePath
{
  return self->_overridePath;
}

- (void)setOverridePath:(id)a3
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

- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler
{
  return self->_onDeviceCompilationHandler;
}

- (void)setOnDeviceCompilationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedHandler
{
  if (qword_10027FD30 != -1) {
    dispatch_once(&qword_10027FD30, &stru_10022AF70);
  }
  return (id)qword_10027FD28;
}

+ (id)sharedHandlerDisabledOnDeviceCompilation
{
  if (qword_10027FD40 != -1) {
    dispatch_once(&qword_10027FD40, &stru_10022AF90);
  }
  return (id)qword_10027FD38;
}

@end