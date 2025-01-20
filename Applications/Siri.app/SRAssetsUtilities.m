@interface SRAssetsUtilities
+ (BOOL)shouldShowAssetDownloadBanner;
+ (void)_runAssetCheckWithTask:(id)a3;
+ (void)_scheduleAssetCheckWithEarliestBeginDate:(id)a3;
+ (void)setupBackgroundAssetCheck;
- (BOOL)_hasInexpensiveNetwork;
- (BOOL)_hasSufficientDiskSpaceForDownload;
- (SRAssetsUtilities)init;
- (unint64_t)_mockSiriAssetState;
- (void)checkAssetsWithCompletion:(id)a3;
@end

@implementation SRAssetsUtilities

- (SRAssetsUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRAssetsUtilities;
  v2 = -[SRAssetsUtilities init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UAFAssetUtilities);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v3;
  }

  return v2;
}

- (void)checkAssetsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v6 = [v5 assistantIsEnabled];

  if ((v6 & 1) != 0)
  {
    -[UAFAssetUtilities refreshUnderstandingOnDeviceAssetsAvailableAsync]( self->_assetUtilities,  "refreshUnderstandingOnDeviceAssetsAvailableAsync");
    unint64_t v7 = -[SRAssetsUtilities _mockSiriAssetState](self, "_mockSiriAssetState");
    if (v7)
    {
      unint64_t v8 = v7;
      v9 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
        __int16 v16 = 2048;
        unint64_t v17 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Using mock value for Siri asset state: %lu",  (uint8_t *)&v14,  0x16u);
      }

      v4[2](v4, v8);
    }

    else
    {
      if (-[UAFAssetUtilities understandingOnDeviceAssetsAvailable]( self->_assetUtilities,  "understandingOnDeviceAssetsAvailable"))
      {
        v10 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Task shows finished asset state",  (uint8_t *)&v14,  0xCu);
        }

        uint64_t v11 = 3LL;
      }

      else if (-[UAFAssetUtilities hasSufficientDiskSpaceForDownload]( self->_assetUtilities,  "hasSufficientDiskSpaceForDownload"))
      {
        -[UAFAssetUtilities downloadSiriAssetsIfNeeded](self->_assetUtilities, "downloadSiriAssetsIfNeeded");
        v12 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Task shows downloading asset state",  (uint8_t *)&v14,  0xCu);
        }

        uint64_t v11 = 2LL;
      }

      else
      {
        v13 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Task shows out of space asset state",  (uint8_t *)&v14,  0xCu);
        }

        uint64_t v11 = 4LL;
      }

      v4[2](v4, v11);
    }
  }

  else
  {
    v4[2](v4, 1LL);
  }
}

- (unint64_t)_mockSiriAssetState
{
  v2 = -[SRUIFPreferences initWithSuiteName:]( objc_alloc(&OBJC_CLASS___SRUIFPreferences),  "initWithSuiteName:",  @"com.apple.SiriViewService");
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRUIFPreferences objectForKey:](v2, "objectForKey:", @"MockSiriAssetState"));

  if (v3) {
    id v3 = -[SRUIFPreferences integerForKey:](v2, "integerForKey:", @"MockSiriAssetState");
  }

  return (unint64_t)v3;
}

+ (void)setupBackgroundAssetCheck
{
  v2 = objc_alloc_init(&OBJC_CLASS___SRPreferences);
  if (!-[SRPreferences hasPresentedSiriAssetsNotification](v2, "hasPresentedSiriAssetsNotification"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](&OBJC_CLASS___BGTaskScheduler, "sharedScheduler"));
    unsigned int v4 = [v3 registerForTaskWithIdentifier:@"com.apple.siri.CheckAssetStatus" usingQueue:0 launchHandler:&stru_1000B9F10];

    if (v4)
    {
      +[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]( &OBJC_CLASS___SRAssetsUtilities,  "_scheduleAssetCheckWithEarliestBeginDate:",  0LL);
    }

    else
    {
      v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_100069D14(v5, v6, v7);
      }
    }
  }
}

+ (void)_scheduleAssetCheckWithEarliestBeginDate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Submitting background task request to check assets.",  buf,  0xCu);
  }

  v5 = -[BGProcessingTaskRequest initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BGProcessingTaskRequest),  "initWithIdentifier:",  @"com.apple.siri.CheckAssetStatus");
  -[BGProcessingTaskRequest setRequiresExternalPower:](v5, "setRequiresExternalPower:", 0LL);
  -[BGProcessingTaskRequest setRequiresNetworkConnectivity:](v5, "setRequiresNetworkConnectivity:", 1LL);
  -[BGProcessingTaskRequest setEarliestBeginDate:](v5, "setEarliestBeginDate:", v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](&OBJC_CLASS___BGTaskScheduler, "sharedScheduler"));
  id v10 = 0LL;
  unsigned __int8 v7 = [v6 submitTaskRequest:v5 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_100069DA0(v9, v8);
    }
  }
}

+ (void)_runAssetCheckWithTask:(id)a3
{
  id v3 = a3;
  if ((AFDeviceSupportsSiriUOD() & 1) != 0 || (AFDeviceSupportsHybridUOD() & 1) != 0)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SRAssetsUtilities);
    objc_initWeak(location, v3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100006924;
    v8[3] = &unk_1000B9F38;
    objc_copyWeak(&v9, location);
    [v3 setExpirationHandler:v8];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100006A30;
    v6[3] = &unk_1000B9F60;
    id v7 = v3;
    -[SRAssetsUtilities checkAssetsWithCompletion:](v4, "checkAssetsWithCompletion:", v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }

  else
  {
    v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "+[SRAssetsUtilities _runAssetCheckWithTask:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s UOD not supported by this device. No background task started.",  (uint8_t *)location,  0xCu);
    }
  }
}

- (BOOL)_hasSufficientDiskSpaceForDownload
{
  return -[UAFAssetUtilities hasSufficientDiskSpaceForDownload]( self->_assetUtilities,  "hasSufficientDiskSpaceForDownload");
}

- (BOOL)_hasInexpensiveNetwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  if ([v3 status] == (id)1) {
    unsigned int v4 = [v3 isExpensive] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)shouldShowAssetDownloadBanner
{
  v2 = objc_alloc_init(&OBJC_CLASS___SRAssetsUtilities);
  if (-[SRAssetsUtilities _hasSufficientDiskSpaceForDownload](v2, "_hasSufficientDiskSpaceForDownload")) {
    unsigned __int8 v3 = -[SRAssetsUtilities _hasInexpensiveNetwork](v2, "_hasInexpensiveNetwork");
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end