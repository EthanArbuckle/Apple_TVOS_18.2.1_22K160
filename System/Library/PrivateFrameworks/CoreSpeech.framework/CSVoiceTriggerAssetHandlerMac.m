@interface CSVoiceTriggerAssetHandlerMac
- (CSAsset)cachedAsset;
- (CSAsset)cachedAssistantAsset;
- (CSAssetManager)assetManager;
- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor;
- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler;
- (CSUAFAssetManager)uafAssetManager;
- (CSUAFDownloadMonitor)uafAssetDownloadMonitor;
- (CSVoiceTriggerAssetDownloadMonitor)voiceTriggerAssetDownloadMonitor;
- (CSVoiceTriggerAssetHandlerMac)init;
- (CSVoiceTriggerAssetHandlerMac)initWithDisableOnDeviceCompilation:(BOOL)a3;
- (CSVoiceTriggerAssetHandlerMac)initWithVoiceTriggerAssetDownloadMonitor:(id)a3 languageCodeUpdateMonitor:(id)a4 uafAssetDownloadMonitor:(id)a5 assetManager:(id)a6 uafAssetManager:(id)a7 disableOnDeviceCompilation:(BOOL)a8;
- (NSMutableDictionary)cachedEndpointAssets;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_checkNewAssetAvailability;
- (void)_checkNewAssetAvailabilityForEndpoint;
- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3;
- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 completion:(id)a4;
- (void)_handleEndpointVoiceTriggerAsset:(id)a3 completion:(id)a4;
- (void)_handleVoiceTriggerAssetWithCompletion:(id)a3;
- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4;
- (void)setAssetManager:(id)a3;
- (void)setCachedAsset:(id)a3;
- (void)setCachedAssistantAsset:(id)a3;
- (void)setCachedEndpointAssets:(id)a3;
- (void)setLanguageCodeUpdateMonitor:(id)a3;
- (void)setOnDeviceCompilationHandler:(id)a3;
- (void)setUafAssetDownloadMonitor:(id)a3;
- (void)setUafAssetManager:(id)a3;
- (void)setVoiceTriggerAssetDownloadMonitor:(id)a3;
- (void)start;
- (void)triggerAssetRefresh;
@end

@implementation CSVoiceTriggerAssetHandlerMac

- (CSVoiceTriggerAssetHandlerMac)init
{
  return -[CSVoiceTriggerAssetHandlerMac initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAssetManager:disableOnDeviceCompilation:]( self,  "initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAs setManager:disableOnDeviceCompilation:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (CSVoiceTriggerAssetHandlerMac)initWithDisableOnDeviceCompilation:(BOOL)a3
{
  return -[CSVoiceTriggerAssetHandlerMac initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAssetManager:disableOnDeviceCompilation:]( self,  "initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAs setManager:disableOnDeviceCompilation:",  0LL,  0LL,  0LL,  0LL,  0LL,  a3);
}

- (CSVoiceTriggerAssetHandlerMac)initWithVoiceTriggerAssetDownloadMonitor:(id)a3 languageCodeUpdateMonitor:(id)a4 uafAssetDownloadMonitor:(id)a5 assetManager:(id)a6 uafAssetManager:(id)a7 disableOnDeviceCompilation:(BOOL)a8
{
  id v42 = a3;
  id v41 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerAssetHandlerMac;
  v17 = -[CSVoiceTriggerAssetHandler init](&v43, "init");
  if (v17)
  {
    dispatch_queue_t v18 = dispatch_queue_create("CSVoiceTriggerHandlerMacQueue", 0LL);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cachedEndpointAssets = v17->_cachedEndpointAssets;
    v17->_cachedEndpointAssets = (NSMutableDictionary *)v20;

    p_voiceTriggerAssetDownloadMonitor = (void **)&v17->_voiceTriggerAssetDownloadMonitor;
    objc_storeStrong((id *)&v17->_voiceTriggerAssetDownloadMonitor, a3);
    if (!v17->_voiceTriggerAssetDownloadMonitor)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetDownloadMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerAssetDownloadMonitor,  "sharedInstance"));
      v24 = *p_voiceTriggerAssetDownloadMonitor;
      *p_voiceTriggerAssetDownloadMonitor = (void *)v23;
    }

    p_languageCodeUpdateMonitor = (void **)&v17->_languageCodeUpdateMonitor;
    objc_storeStrong((id *)&v17->_languageCodeUpdateMonitor, a4);
    if (!v17->_languageCodeUpdateMonitor)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[CSLanguageCodeUpdateMonitor sharedInstance](&OBJC_CLASS___CSLanguageCodeUpdateMonitor, "sharedInstance"));
      v27 = *p_languageCodeUpdateMonitor;
      *p_languageCodeUpdateMonitor = (void *)v26;
    }

    p_uafAssetDownloadMonitor = (void **)&v17->_uafAssetDownloadMonitor;
    objc_storeStrong((id *)&v17->_uafAssetDownloadMonitor, a5);
    if (!v17->_uafAssetDownloadMonitor)
    {
      uint64_t v29 = objc_claimAutoreleasedReturnValue(+[CSUAFDownloadMonitor sharedInstance](&OBJC_CLASS___CSUAFDownloadMonitor, "sharedInstance"));
      v30 = *p_uafAssetDownloadMonitor;
      *p_uafAssetDownloadMonitor = (void *)v29;
    }

    p_assetManager = (void **)&v17->_assetManager;
    objc_storeStrong((id *)&v17->_assetManager, a6);
    if (!v17->_assetManager)
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
      v33 = *p_assetManager;
      *p_assetManager = (void *)v32;
    }

    p_uafAssetManager = (void **)&v17->_uafAssetManager;
    objc_storeStrong((id *)&v17->_uafAssetManager, a7);
    if (!v17->_uafAssetManager)
    {
      uint64_t v35 = objc_claimAutoreleasedReturnValue(+[CSUAFAssetManager sharedInstance](&OBJC_CLASS___CSUAFAssetManager, "sharedInstance"));
      v36 = *p_uafAssetManager;
      *p_uafAssetManager = (void *)v35;
    }

    -[CSVoiceTriggerAssetHandlerMac start](v17, "start");
    -[CSVoiceTriggerAssetHandlerMac setCachedAsset:](v17, "setCachedAsset:", 0LL);
    -[CSVoiceTriggerAssetHandlerMac setCachedAssistantAsset:](v17, "setCachedAssistantAsset:", 0LL);
    if (!a8 && !v17->_onDeviceCompilationHandler)
    {
      uint64_t v37 = objc_claimAutoreleasedReturnValue(+[CSOnDeviceCompilationHandler sharedHandler](&OBJC_CLASS___CSOnDeviceCompilationHandler, "sharedHandler"));
      onDeviceCompilationHandler = v17->_onDeviceCompilationHandler;
      v17->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v37;
    }
  }

  return v17;
}

- (void)start
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  [v3 addObserver:self];
}

- (void)_handleVoiceTriggerAssetWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerAssetHandlerMac cachedAsset](self, "cachedAsset"));

  if (v5)
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerAssetHandlerMac cachedAsset](self, "cachedAsset"));
      v4[2](v4, v6, 0LL);
    }
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002C900;
    v7[3] = &unk_10022D908;
    v7[4] = self;
    v8 = v4;
    -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManager:]( self,  "_getVoiceTriggerAssetFromAssetManager:",  v7);
  }
}

- (void)_handleEndpointVoiceTriggerAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    v7[2](v7, 0LL, v9);
    goto LABEL_6;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedEndpointAssets,  "objectForKeyedSubscript:",  v6));

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithEndpointId:fallbackLanguage:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithEndpointId:fallbackLanguage:",  v6,  @"en-US"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002C69C;
    v11[3] = &unk_10022A988;
    v11[4] = self;
    id v12 = v6;
    v13 = v7;
    -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:completion:]( self,  "_getVoiceTriggerAssetFromAssetManagerWithLocale:completion:",  v10,  v11);

    goto LABEL_8;
  }

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedEndpointAssets,  "objectForKeyedSubscript:",  v6));
    ((void (**)(id, void *, void *))v7)[2](v7, v9, 0LL);
LABEL_6:
  }

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002C68C;
    block[3] = &unk_10022E7D0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }

  else
  {
    -[CSVoiceTriggerAssetHandlerMac _handleVoiceTriggerAssetWithCompletion:]( self,  "_handleVoiceTriggerAssetWithCompletion:",  v7);
  }
}

- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:completion:]( self,  "_getVoiceTriggerAssetFromAssetManagerWithLocale:completion:",  v5,  v4);
}

- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 completion:(id)a4
{
}

- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10002C2F4;
  v22[3] = &unk_10022D908;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002C3F0;
  v20[3] = &unk_10022A9B0;
  v20[4] = self;
  id v12 = objc_retainBlock(v22);
  id v21 = v12;
  v13 = objc_retainBlock(v20);
  if (a4)
  {
    ((void (*)(void *, void, void))v12[2])(v12, 0LL, 0LL);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
    if ([v10 isEqualToString:v14] && (uafAssetManager = self->_uafAssetManager) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10002C474;
      v16[3] = &unk_10022A9D8;
      dispatch_queue_t v18 = v12;
      v19 = v13;
      id v17 = v10;
      -[CSUAFAssetManager getInstalledAssetofType:forLocale:completion:]( uafAssetManager,  "getInstalledAssetofType:forLocale:completion:",  0LL,  v14,  v16);
    }

    else
    {
      ((void (*)(void *, id))v13[2])(v13, v10);
    }
  }
}

- (void)_checkNewAssetAvailability
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002BFA8;
  v2[3] = &unk_10022E340;
  v2[4] = self;
  -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManager:]( self,  "_getVoiceTriggerAssetFromAssetManager:",  v2);
}

- (void)_checkNewAssetAvailabilityForEndpoint
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B9D0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)triggerAssetRefresh
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B660;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4
{
  id v5 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerAssetDownloadMonitor:didInstallNewAsset:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s new VoiceTrigger asset downloaded",  (uint8_t *)&v6,  0xCu);
  }

  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailability](self, "_checkNewAssetAvailability");
  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailabilityForEndpoint](self, "_checkNewAssetAvailabilityForEndpoint");
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSVoiceTriggerAssetHandlerMac CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Language Code Changed : %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailability](self, "_checkNewAssetAvailability");
  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailabilityForEndpoint](self, "_checkNewAssetAvailabilityForEndpoint");
}

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    int v7 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      __int16 v9 = "-[CSVoiceTriggerAssetHandlerMac assetDownloadMonitorDelegate:assetType:]";
      __int16 v10 = 2048;
      unint64_t v11 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Ignore UAF asset update for type: %lu",  (uint8_t *)&v8,  0x16u);
    }
  }

  else
  {
    -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailability](self, "_checkNewAssetAvailability");
    -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailabilityForEndpoint]( self,  "_checkNewAssetAvailabilityForEndpoint");
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
    block[2] = sub_10002B2BC;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B138;
  block[3] = &unk_10022E7D0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCachedAsset:(id)a3
{
}

- (CSAsset)cachedAssistantAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCachedAssistantAsset:(id)a3
{
}

- (NSMutableDictionary)cachedEndpointAssets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCachedEndpointAssets:(id)a3
{
}

- (CSVoiceTriggerAssetDownloadMonitor)voiceTriggerAssetDownloadMonitor
{
  return self->_voiceTriggerAssetDownloadMonitor;
}

- (void)setVoiceTriggerAssetDownloadMonitor:(id)a3
{
}

- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor
{
  return self->_languageCodeUpdateMonitor;
}

- (void)setLanguageCodeUpdateMonitor:(id)a3
{
}

- (CSUAFDownloadMonitor)uafAssetDownloadMonitor
{
  return self->_uafAssetDownloadMonitor;
}

- (void)setUafAssetDownloadMonitor:(id)a3
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

@end