@interface CSAssetManager
+ (id)sharedManager;
- (BOOL)_canFetchRemoteAsset:(unint64_t)a3;
- (CSAssetManager)initWithDownloadOption:(id)a3;
- (NSString)currentLanguageCode;
- (OS_dispatch_queue)queue;
- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4;
- (id)assetForCurrentLanguageOfType:(unint64_t)a3;
- (id)assetOfType:(unint64_t)a3 language:(id)a4;
- (id)installedAssetForCurrentLanguageOfType:(unint64_t)a3;
- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4;
- (void)CSAdBlockerMetaUpdateMonitor:(id)a3 didReceiveNewAdBlockerAssetMetaData:(BOOL)a4;
- (void)CSAssetController:(id)a3 didDownloadNewAssetForType:(unint64_t)a4;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeakerRecognitionAssetMetaData:(BOOL)a4;
- (void)CSSpeechEndpointAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeechEndpointAssetMetaData:(BOOL)a4;
- (void)CSVoiceTriggerAssetMetaUpdateMonitor:(id)a3 didReceiveNewVoiceTriggerAssetMetaData:(BOOL)a4;
- (void)_createPeriodicalDownloadTimer;
- (void)_fetchRemoteMetaData;
- (void)_startPeriodicalDownload;
- (void)_stopPeriodicalDownload;
- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)assetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6;
- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)assetOfType:(unint64_t)a3 providerType:(unint64_t)a4 language:(id)a5 completion:(id)a6;
- (void)installedAssetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4;
- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4;
- (void)setAssetDownloadingOption:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAssetManager

- (CSAssetManager)initWithDownloadOption:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CSAssetManager;
  v6 = -[CSAssetManager init](&v39, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downloadingOption, a3);
    dispatch_queue_t v8 = dispatch_queue_create("Serial CSAssetManager queue", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    observers = v7->_observers;
    v7->_observers = (NSMutableDictionary *)v10;

    currentLanguageCode = v7->_currentLanguageCode;
    v7->_currentLanguageCode = (NSString *)@"en-US";

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  v7->_currentLanguageCode));
    v14 = v7->_currentLanguageCode;
    v7->_currentLanguageCode = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSLanguageCodeUpdateMonitor sharedInstance]( &OBJC_CLASS___CSLanguageCodeUpdateMonitor,  "sharedInstance"));
    [v15 addObserver:v7];

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetMetaUpdateMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerAssetMetaUpdateMonitor,  "sharedInstance"));
    [v16 addObserver:v7];

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechEndpointAssetMetaUpdateMonitor sharedInstance]( &OBJC_CLASS___CSSpeechEndpointAssetMetaUpdateMonitor,  "sharedInstance"));
    [v17 addObserver:v7];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSAdBlockerAssetMetaUpdateMonitor sharedInstance]( &OBJC_CLASS___CSAdBlockerAssetMetaUpdateMonitor,  "sharedInstance"));
    [v18 addObserver:v7];

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeakerRecognitionAssetMetaUpdateMonitor sharedInstance]( &OBJC_CLASS___CSSpeakerRecognitionAssetMetaUpdateMonitor,  "sharedInstance"));
    [v19 addObserver:v7];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v20 addObserver:v7 forAssetType:0];

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v21 addObserver:v7 forAssetType:1];

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v22 addObserver:v7 forAssetType:4];

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v23 addObserver:v7 forAssetType:3];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v24 addObserver:v7 forAssetType:5];

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v25 addObserver:v7 forAssetType:7];

    v26 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v7->_currentLanguageCode;
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSAssetManager initWithDownloadOption:]";
      __int16 v42 = 2114;
      v43 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s init-_currentLanguageCode: %{public}@",  buf,  0x16u);
    }

    -[CSAssetManager _createPeriodicalDownloadTimer](v7, "_createPeriodicalDownloadTimer");
    objc_initWeak(&location, v7);
    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[CSAssetManagerEnablePolicyFactory assetManagerEnabledPolicy]( &OBJC_CLASS___CSAssetManagerEnablePolicyFactory,  "assetManagerEnabledPolicy"));
    enablePolicy = v7->_enablePolicy;
    v7->_enablePolicy = (CSPolicy *)v28;

    v30 = v7->_enablePolicy;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000F1268;
    v36[3] = &unk_10022E430;
    objc_copyWeak(&v37, &location);
    -[CSPolicy setCallback:](v30, "setCallback:", v36);
    if (-[CSPolicy isEnabled](v7->_enablePolicy, "isEnabled"))
    {
      v31 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[CSAssetManager initWithDownloadOption:]";
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s Asset Manager Policy has been enabled, start fetching meta data now",  buf,  0xCu);
      }

      v32 = (dispatch_queue_s *)v7->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F13C4;
      block[3] = &unk_10022F100;
      v35 = v7;
      dispatch_async(v32, block);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)setAssetDownloadingOption:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F0F68;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)assetForCurrentLanguageOfType:(unint64_t)a3
{
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  self->_currentLanguageCode));
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  unsigned int v7 = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  v9 = v8;
  uint64_t v10 = self->_currentLanguageCode;
  if (v7) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 assetOfType:a3 language:v10]);
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 installedAssetOfType:a3 language:v10]);
  }
  v12 = (void *)v11;

  return v12;
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allInstalledAssetsOfType:a3 language:v5]);

  return v7;
}

- (void)assetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4
{
  currentLanguageCode = self->_currentLanguageCode;
  id v7 = a4;
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  currentLanguageCode));
  v9 = self->_currentLanguageCode;
  self->_currentLanguageCode = v8;

  unsigned int v10 = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  v12 = self->_currentLanguageCode;
  id v13 = v11;
  if (v10) {
    [v11 assetOfType:a3 language:v12 completion:v7];
  }
  else {
    [v11 installedAssetOfType:a3 language:v12 completion:v7];
  }
}

- (id)installedAssetForCurrentLanguageOfType:(unint64_t)a3
{
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  self->_currentLanguageCode));
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 installedAssetOfType:a3 language:self->_currentLanguageCode]);

  return v8;
}

- (void)installedAssetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4
{
  currentLanguageCode = self->_currentLanguageCode;
  id v7 = a4;
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  currentLanguageCode));
  v9 = self->_currentLanguageCode;
  self->_currentLanguageCode = v8;

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[CSAssetControllerFactory defaultController](&OBJC_CLASS___CSAssetControllerFactory, "defaultController"));
  [v10 installedAssetOfType:a3 language:self->_currentLanguageCode completion:v7];
}

- (id)assetOfType:(unint64_t)a3 language:(id)a4
{
  id v6 = a4;
  unsigned int v7 = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  v9 = v8;
  if (v7) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 assetOfType:a3 language:v6]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 installedAssetOfType:a3 language:v6]);
  }
  uint64_t v11 = (void *)v10;

  return v11;
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  LODWORD(self) = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  id v11 = v10;
  if ((_DWORD)self) {
    [v10 assetOfType:a3 language:v9 completion:v8];
  }
  else {
    [v10 installedAssetOfType:a3 language:v9 completion:v8];
  }
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6
{
  id v12 = a4;
  id v10 = a6;
  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v11 assetOfType:a3 language:v12 compatibilityVersion:a5 completion:v10];
  }

  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedAssetOfType:a3 language:v5]);

  return v7;
}

- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[CSAssetControllerFactory defaultController](&OBJC_CLASS___CSAssetControllerFactory, "defaultController"));
  [v9 installedAssetOfType:a3 language:v8 completion:v7];
}

- (void)assetOfType:(unint64_t)a3 providerType:(unint64_t)a4 language:(id)a5 completion:(id)a6
{
  if (a4 == 1)
  {
    id v8 = a6;
    id v9 = a5;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[CSTrialAssetManager sharedInstance](&OBJC_CLASS___CSTrialAssetManager, "sharedInstance"));
    [v11 getInstalledAssetofType:a3 forLocale:v9 completion:v8];
  }

  else
  {
    id v9 = a6;
    id v11 = a5;
    -[CSAssetManager assetOfType:language:completion:](self, "assetOfType:language:completion:", a3);
  }
}

- (void)_fetchRemoteMetaData
{
  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 0LL))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v3 fetchRemoteMetaOfType:0];
  }

  else
  {
    id v4 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSAssetManager _fetchRemoteMetaData]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Cannot fetch VoiceTrigger asset meta data",  (uint8_t *)&v11,  0xCu);
    }
  }

  if (+[CSUtils supportHybridEndpointer](&OBJC_CLASS___CSUtils, "supportHybridEndpointer")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 1LL))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v5 fetchRemoteMetaOfType:1];
  }

  if (+[CSUtils supportLanguageDetector](&OBJC_CLASS___CSUtils, "supportLanguageDetector")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 2LL))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v6 fetchRemoteMetaOfType:2];
  }

  if (+[CSUtils supportAdBlocker](&OBJC_CLASS___CSUtils, "supportAdBlocker")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 4LL))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v7 fetchRemoteMetaOfType:4];
  }

  if (+[CSUtils supportsSpeakerRecognitionAssets]( &OBJC_CLASS___CSUtils,  "supportsSpeakerRecognitionAssets")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 3LL))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v8 fetchRemoteMetaOfType:3];
  }

  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 5LL))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v9 fetchRemoteMetaOfType:5];
  }

  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 7LL))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSAssetControllerFactory defaultController]( &OBJC_CLASS___CSAssetControllerFactory,  "defaultController"));
    [v10 fetchRemoteMetaOfType:7];
  }

- (BOOL)_canFetchRemoteAsset:(unint64_t)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 0uLL:
      BOOL result = -[CSAssetDownloadingOption allowVoiceTriggerAssetDownloading]( self->_downloadingOption,  "allowVoiceTriggerAssetDownloading");
      break;
    case 1uLL:
      BOOL result = -[CSAssetDownloadingOption allowEndpointAssetDownloading]( self->_downloadingOption,  "allowEndpointAssetDownloading");
      break;
    case 2uLL:
      BOOL result = -[CSAssetDownloadingOption allowLanguageDetectorAssetDownloading]( self->_downloadingOption,  "allowLanguageDetectorAssetDownloading");
      break;
    case 3uLL:
      BOOL result = -[CSAssetDownloadingOption allowSpeakerRecognitionAssetDownloading]( self->_downloadingOption,  "allowSpeakerRecognitionAssetDownloading");
      break;
    case 4uLL:
      BOOL result = -[CSAssetDownloadingOption allowAdBlockerAssetDownloading]( self->_downloadingOption,  "allowAdBlockerAssetDownloading");
      break;
    case 5uLL:
      BOOL result = -[CSAssetDownloadingOption allowVoiceTriggerAccessoryAssetDownloading]( self->_downloadingOption,  "allowVoiceTriggerAccessoryAssetDownloading");
      break;
    case 7uLL:
      BOOL result = -[CSAssetDownloadingOption allowGibraltarVoiceTriggerAssetDownloading]( self->_downloadingOption,  "allowGibraltarVoiceTriggerAssetDownloading");
      break;
    default:
      id v5 = (os_log_s *)CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        id v7 = "-[CSAssetManager _canFetchRemoteAsset:]";
        __int16 v8 = 1026;
        int v9 = v3;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Undefined assetType : %{public}u",  (uint8_t *)&v6,  0x12u);
      }

      BOOL result = 0;
      break;
  }

  return result;
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v6 = a4;
  p_currentLanguageCode = &self->_currentLanguageCode;
  objc_storeStrong((id *)p_currentLanguageCode, a4);
  __int16 v8 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *p_currentLanguageCode;
    int v10 = 136315394;
    int v11 = "-[CSAssetManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s _currentLanguageCode changed: %{public}@",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0E6C;
  block[3] = &unk_10022E7F8;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0DAC;
  block[3] = &unk_10022E7F8;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerAssetMetaUpdateMonitor:(id)a3 didReceiveNewVoiceTriggerAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F0D14;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (void)CSAdBlockerMetaUpdateMonitor:(id)a3 didReceiveNewAdBlockerAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F0D04;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(v6, block);
  }

- (void)CSSpeakerRecognitionAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeakerRecognitionAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F0CF4;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(v6, block);
  }

- (void)CSSpeechEndpointAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeechEndpointAssetMetaData:(BOOL)a4
{
  if (a4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F0CE4;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(v6, block);
  }

- (void)CSAssetController:(id)a3 didDownloadNewAssetForType:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F0B64;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_createPeriodicalDownloadTimer
{
  int v3 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v11 = "-[CSAssetManager _createPeriodicalDownloadTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  self->_downloadTimerCount = 0LL;
  id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  downloadTimer = self->_downloadTimer;
  self->_downloadTimer = v4;

  dispatch_time_t v6 = dispatch_time(0LL, 0LL);
  dispatch_source_set_timer((dispatch_source_t)self->_downloadTimer, v6, 0x4E9491800000uLL, 0LL);
  objc_initWeak((id *)buf, self);
  id v7 = self->_downloadTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000F0AA8;
  handler[3] = &unk_10022E920;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_startPeriodicalDownload
{
  int v3 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    dispatch_time_t v6 = "-[CSAssetManager _startPeriodicalDownload]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }

  if (self->_downloadTimerCount < 1)
  {
    dispatch_resume((dispatch_object_t)self->_downloadTimer);
    ++self->_downloadTimerCount;
  }

  else
  {
    id v4 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      dispatch_time_t v6 = "-[CSAssetManager _startPeriodicalDownload]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Periodical downloading is already scheduled, ignore request.",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_stopPeriodicalDownload
{
  int v3 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    dispatch_time_t v6 = "-[CSAssetManager _stopPeriodicalDownload]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }

  if (self->_downloadTimerCount <= 0)
  {
    id v4 = (os_log_s *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      dispatch_time_t v6 = "-[CSAssetManager _stopPeriodicalDownload]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s No periodical downloading is scheduled, ignore request.",  (uint8_t *)&v5,  0xCu);
    }
  }

  else
  {
    dispatch_suspend((dispatch_object_t)self->_downloadTimer);
    --self->_downloadTimerCount;
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_100280018 != -1) {
    dispatch_once(&qword_100280018, &stru_10022D290);
  }
  return (id)qword_100280010;
}

@end