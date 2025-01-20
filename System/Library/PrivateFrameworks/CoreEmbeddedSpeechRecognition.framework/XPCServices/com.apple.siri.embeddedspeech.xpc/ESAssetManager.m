@interface ESAssetManager
+ (id)sharedInstance;
- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4;
- (BOOL)geoLmInitialized;
- (BOOL)isTrialAssetDeliveryEnabled;
- (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateHammerConfigFile:(id)a3;
- (ESAssetManager)init;
- (id)_installedGeoLMRegionMappingForLanguage:(id)a3;
- (id)geoLMRegionIdForLocation:(id)a3;
- (id)installationStatusForLanguagesIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withError:(id *)a6;
- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 regionId:(id)a4 mainAssetConfig:(id)a5;
- (id)installedHammerConfigFileForLanguage:(id)a3;
- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4;
- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5;
- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6;
- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4;
- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5;
- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6;
- (void)_invalidateInstallationStatusCacheForAssetType:(unint64_t)a3;
- (void)cleanupUnusedSubscriptions;
- (void)dealloc;
- (void)handlePostUpgradeSubscriptions;
- (void)purgeUnusedGeoLMAssetsForLanguage:(id)a3;
- (void)registerNotifications;
@end

@implementation ESAssetManager

- (ESAssetManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ESAssetManager;
  v2 = -[ESAssetManager init](&v14, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.siri.embeddedspeech.ESAssetManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    tokenForAssetUpdateNotification = v2->_tokenForAssetUpdateNotification;
    v2->_tokenForAssetUpdateNotification = (NSMutableDictionary *)v5;

    -[ESAssetManager registerNotifications](v2, "registerNotifications");
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    recognizerAssetPathsInUse = v2->_recognizerAssetPathsInUse;
    v2->_recognizerAssetPathsInUse = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    profileAssetPathsInUse = v2->_profileAssetPathsInUse;
    v2->_profileAssetPathsInUse = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    languageInstallationCache = v2->_languageInstallationCache;
    v2->_languageInstallationCache = (NSMutableDictionary *)v11;
  }

  return v2;
}

- (void)registerNotifications
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000106FC;
  v18[3] = &unk_100040B28;
  objc_copyWeak(&v19, &location);
  dispatch_queue_t v3 = objc_retainBlock(v18);
  v28[0] = @"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_ASR_ASSISTANT";
  v28[1] = @"com.apple.siri.uaf.com.apple.siri.understanding";
  v28[2] = @"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED";
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 3LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint32_t v9 = notify_register_dispatch( (const char *)[v8 UTF8String],  &out_token,  (dispatch_queue_t)self->_queue,  v3);
        if (v9)
        {
          v10 = (os_log_s *)AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v22 = "-[ESAssetManager registerNotifications]";
            __int16 v23 = 2112;
            id v24 = v8;
            __int16 v25 = 1024;
            uint32_t v26 = v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to register for %@ update notifications: %u",  buf,  0x1Cu);
          }

          int v11 = -1;
          int out_token = -1;
        }

        else
        {
          int v11 = out_token;
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tokenForAssetUpdateNotification,  "setObject:forKeyedSubscript:",  v12,  v8);
      }

      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v27 count:16];
    }

    while (v5);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ESAssetManager;
  -[ESAssetManager dealloc](&v3, "dealloc");
}

- (id)installationStatusForLanguagesIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withError:(id *)a6
{
  BOOL v8 = a3;
  v10 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v11 = @"NO";
    if (v8) {
      int v11 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ESAssetManager installationStatusForLanguagesIgnoringCache:assetType:withDetailedStatus:withError:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Installation status for languages (ignoring cache: %@)",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v19 = sub_100010464;
  v20 = sub_100010474;
  id v21 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001047C;
  v15[3] = &unk_100040B90;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = a4;
  BOOL v16 = v8;
  BOOL v17 = a5;
  dispatch_sync(queue, v15);
  id v13 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (void)_invalidateInstallationStatusCacheForAssetType:(unint64_t)a3
{
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[ESAssetManager _invalidateInstallationStatusCacheForAssetType:]";
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Invalidating installation status cache for %lu",  (uint8_t *)&v11,  0x16u);
  }

  if (!-[ESAssetManager isTrialAssetDeliveryEnabled](self, "isTrialAssetDeliveryEnabled")
    || (id v6 = objc_alloc_init(&OBJC_CLASS___SFEntitledAssetManager),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installationStatusForLanguagesWithAssetType:a3]),
        v6,
        !v7))
  {
    BOOL v8 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      v12 = "-[ESAssetManager _invalidateInstallationStatusCacheForAssetType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Language installation status query failed.",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v7 = 0LL;
  }

  languageInstallationCache = self->_languageInstallationCache;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( languageInstallationCache,  "setObject:forKeyedSubscript:",  v7,  v10);
}

- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ESAssetManager installedModelInfoForAssetConfig:error:]( self,  "installedModelInfoForAssetConfig:error:",  a3,  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"quasarModelPath"]);

  return v5;
}

- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:]( self,  "installedModelInfoForAssetConfig:error:triggerDownload:",  a3,  a4,  a5));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"quasarModelPath"]);

  return v6;
}

- (id)installedQuasarModelPathForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]( self,  "installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:",  a3,  a4,  a5,  a6));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"quasarModelPath"]);

  return v7;
}

- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4
{
  return -[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:]( self,  "installedModelInfoForAssetConfig:error:triggerDownload:",  a3,  a4,  1LL);
}

- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5
{
  return -[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]( self,  "installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:",  a3,  a4,  a5,  0LL);
}

- (id)installedModelInfoForAssetConfig:(id)a3 error:(id *)a4 triggerDownload:(BOOL)a5 ignoreSpellingModel:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 language]);
  if (v7)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    if (([v11 dictationIsEnabled] & 1) == 0
      && ([v11 assistantIsEnabled] & 1) == 0)
    {
      id v21 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
        v22 = "%s Siri and Dictation are both disabled, no need to access asset";
        __int16 v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = 12;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v23, v24, v22, buf, v25);
      }

- (BOOL)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000103A0;
  block[3] = &unk_100041118;
  __int16 v13 = self;
  unint64_t v14 = a4;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(queue, block);

  return 1;
}

- (void)handlePostUpgradeSubscriptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 dictationIsEnabled];

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 installationStatusForLanguagesWithAssetType:3]);

    [v5 enumerateKeysAndObjectsUsingBlock:&stru_100040BD0];
  }

- (void)cleanupUnusedSubscriptions
{
  v2 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ESAssetManager cleanupUnusedSubscriptions]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Cleaning up unused subscriptions.",  (uint8_t *)&v8,  0xCu);
  }

  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if ([v4 dictationIsEnabled])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeDictationLanguages]);
    [v3 addObjectsFromArray:v5];
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
  id v7 =  +[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:]( &OBJC_CLASS___SFEntitledAssetManager,  "unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:",  3LL,  v3,  v6);
}

- (BOOL)isTrialAssetDeliveryEnabled
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.internal.ck");
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"disableTrialAssetDelivery"));
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "-[ESAssetManager isTrialAssetDeliveryEnabled]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Trial asset delivery is explicitly disabled!",  (uint8_t *)&v9,  0xCu);
    }

    unsigned __int8 v6 = 0;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"enableTrialAssetDelivery"));
    else {
      unsigned __int8 v6 = +[AFFeatureFlags isSiriXEnabled](&OBJC_CLASS___AFFeatureFlags, "isSiriXEnabled");
    }
  }

  return v6;
}

- (id)installedHammerConfigFileForLanguage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v3,  1LL);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 installedAssetWithConfig:v4 regionId:0 shouldSubscribe:0 subscriberId:0 expiration:0]);

  if (v6 && [v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  1LL));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);
  }

  else
  {
    int v8 = 0LL;
  }

  return v8;
}

- (BOOL)validateHammerConfigFile:(id)a3
{
  id v3 = a3;
  id v4 = [[_EARSpeechModelInfo alloc] initWithConfig:v3];
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[ESAssetManager validateHammerConfigFile:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Hammer model info=%@", (uint8_t *)&v7, 0x16u);
  }

  return 1;
}

- (id)_installedGeoLMRegionMappingForLanguage:(id)a3
{
  id v3 = a3;
  id v4 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v3,  4LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 installedAssetWithConfig:v4 regionId:0 shouldSubscribe:1 subscriberId:v7 expiration:0]);

  if (v8 && [v8 length])
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  4LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v9]);
    int v11 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      __int128 v15 = "-[ESAssetManager _installedGeoLMRegionMappingForLanguage:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s GeoLM: region mapping json file=%@",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    id v12 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int128 v15 = "-[ESAssetManager _installedGeoLMRegionMappingForLanguage:]";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s GeoLM: region mapping json file is nil Or there is no regionMapping for given language=%@",  (uint8_t *)&v14,  0x16u);
    }

    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)geoLmInitialized
{
  return 0;
}

- (id)geoLMRegionIdForLocation:(id)a3
{
  id v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    unsigned __int8 v6 = "-[ESAssetManager geoLMRegionIdForLocation:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s GeoLM: Not Supported",  (uint8_t *)&v5,  0xCu);
  }

  return 0LL;
}

- (id)installedGeoLMRegionSpecificAssetForLanguage:(id)a3 regionId:(id)a4 mainAssetConfig:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v7,  5LL);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  int v14 = (void *)objc_claimAutoreleasedReturnValue( [v11 installedAssetWithConfig:v10 regionId:v8 shouldSubscribe:1 subscriberId:v13 expiration:0]);

  if (!v14 || ![v14 length])
  {
    id v21 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315650;
      uint32_t v25 = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s GeoLM: region specific asset is not found for given language=%@ regionId=%@",  (uint8_t *)&v24,  0x20u);
    }

    goto LABEL_12;
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager jsonFilenameForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "jsonFilenameForAssetType:",  5LL));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:v15]);
  id v17 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315650;
    uint32_t v25 = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v16;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s GeoLM: region specific [%@] geo-config json file=%@",  (uint8_t *)&v24,  0x20u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CESRGeoLMRegionIDCache sharedInstance](&OBJC_CLASS___CESRGeoLMRegionIDCache, "sharedInstance"));
  [v18 updateGeoLMAssetsInfoDictWithRegionId:v8 language:v7];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  unsigned int v20 = [v19 _geoLMCompatibleWithMainAsset:v9 geoAssetConfig:v16];

  if (!v20)
  {
    v22 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      int v24 = 136315394;
      uint32_t v25 = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "%s GeoLM: geoLM region specific [%@] asset exists on device, but not compatible.",  (uint8_t *)&v24,  0x16u);
    }

LABEL_12:
    __int16 v16 = 0LL;
    goto LABEL_13;
  }

LABEL_13:
  return v16;
}

- (BOOL)_geoLMCompatibleWithMainAsset:(id)a3 geoAssetConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    id v9 = [[_EARSpeechModelInfo alloc] initWithConfig:v5];
    id v10 = [[_EARSpeechModelInfo alloc] initWithConfig:v7];
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 version]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 version]);
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) != 0)
    {

      BOOL v8 = 1;
    }

    else
    {
      int v14 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 version]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 version]);
        int v18 = 136316162;
        id v19 = "-[ESAssetManager _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
        __int16 v20 = 2112;
        id v21 = v16;
        __int16 v22 = 2112;
        __int16 v23 = v17;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s GeoLM: model-info.version doesn't match. mainASRModelInfo.version=%@ geoLMModelInfo.version=%@ mainAssetCon fig=%@ geoAssetConfig=%@",  (uint8_t *)&v18,  0x34u);
      }

      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)purgeUnusedGeoLMAssetsForLanguage:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010244;
  block[3] = &unk_100040BF8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100049548 != -1) {
    dispatch_once(&qword_100049548, &stru_100040B00);
  }
  return (id)qword_100049540;
}

@end