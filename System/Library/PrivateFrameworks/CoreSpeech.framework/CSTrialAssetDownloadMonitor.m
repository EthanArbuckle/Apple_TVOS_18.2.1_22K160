@interface CSTrialAssetDownloadMonitor
+ (CSTrialAssetDownloadMonitor)sharedInstance;
- (BOOL)_handleSiriAttAssetTrailDownloadForNamespace:(id)a3;
- (BOOL)_validateDownloadedAssetForAssetType:(unint64_t)a3;
- (CSTrialAssetDownloadMonitor)init;
- (id)_trailStageDirectoryForAsset:(id)a3;
- (void)_notifyTrialAssetDownloadForAssetType:(unint64_t)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)downloadAndNotifyTrialAssetsUpdateForNamespace:(id)a3 onQueue:(id)a4;
@end

@implementation CSTrialAssetDownloadMonitor

- (CSTrialAssetDownloadMonitor)init
{
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___CSTrialAssetDownloadMonitor;
    self = -[CSTrialAssetDownloadMonitor init](&v5, "init");
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", &off_100238F58, &off_100238F70, 0LL));
  }
  v6 = (void *)v5;
  objc_initWeak(&location, self);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) unsignedIntegerValue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10014C2B8;
        v14[3] = &unk_10022ED18;
        v15 = v4;
        objc_copyWeak(&v17, &location);
        id v16 = v3;
        +[CSUtils getTrialIdsForAssetType:withCompletion:]( &OBJC_CLASS___CSUtils,  "getTrialIdsForAssetType:withCompletion:",  v10,  v14);

        objc_destroyWeak(&v17);
      }

      id v7 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v7);
  }

  trialClientDict = self->_trialClientDict;
  self->_trialClientDict = v4;

  objc_destroyWeak(&location);
}

- (BOOL)_handleSiriAttAssetTrailDownloadForNamespace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_trialClientDict, "objectForKeyedSubscript:", v4));
  [v5 refresh];
  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    __int128 v18 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Got Trial experiment/rollout notification",  (uint8_t *)&v17,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 levelForFactor:@"com.apple.siri.sp.invocation" withNamespaceName:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 directoryValue]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

  if (v9)
  {
    -[CSTrialAssetDownloadMonitor _notifyTrialAssetDownloadForAssetType:]( self,  "_notifyTrialAssetDownloadForAssetType:",  0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 levelForFactor:@"com.apple.siri.sp.mitigation" withNamespaceName:v4]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 directoryValue]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);

    if (v12)
    {
      -[CSTrialAssetDownloadMonitor _notifyTrialAssetDownloadForAssetType:]( self,  "_notifyTrialAssetDownloadForAssetType:",  6LL);
      BOOL v13 = 1;
    }

    else
    {
      v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        __int128 v18 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
        __int16 v19 = 2114;
        __int128 v20 = @"com.apple.siri.sp.mitigation";
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s ERR: null file download path for factor: %{public}@",  (uint8_t *)&v17,  0x16u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
      [v12 submitTrialIssueReport:kCSDiagnosticReporterTrialDownloadFailed];
      BOOL v13 = 0;
    }

    id v7 = v10;
  }

  else
  {
    v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      __int128 v18 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
      __int16 v19 = 2114;
      __int128 v20 = @"com.apple.siri.sp.invocation";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s ERR: null file download path for factor: %{public}@",  (uint8_t *)&v17,  0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    [v12 submitTrialIssueReport:kCSDiagnosticReporterTrialDownloadFailed];
    BOOL v13 = 0;
  }

  return v13;
}

- (void)downloadAndNotifyTrialAssetsUpdateForNamespace:(id)a3 onQueue:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014BDE8;
  v7[3] = &unk_10022EFD0;
  id v8 = a3;
  v9 = self;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)a4, v7);
}

- (void)_notifyTrialAssetDownloadForAssetType:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10014BD98;
  v3[3] = &unk_10022ED40;
  v3[4] = self;
  v3[5] = a3;
  -[CSTrialAssetDownloadMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)_validateDownloadedAssetForAssetType:(unint64_t)a3
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSTrialAssetManager sharedInstance](&OBJC_CLASS___CSTrialAssetManager, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014BA4C;
  v7[3] = &unk_10022EDB8;
  void v7[4] = &v8;
  v7[5] = a3;
  [v4 getInstalledAssetofType:a3 forLocale:v5 completion:v7];

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (id)_trailStageDirectoryForAsset:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 trialBaseAssetDirectory]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v3]);
  if ([v4 fileExistsAtPath:v7])
  {
    id v21 = 0LL;
    unsigned __int8 v8 = [v4 removeItemAtPath:v7 error:&v21];
    id v9 = v21;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        __int128 v18 = v10;
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v23 = "-[CSTrialAssetDownloadMonitor _trailStageDirectoryForAsset:]";
        __int16 v24 = 2112;
        id v25 = v7;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Failed to delete dir at %@ with err: %{public}@",  buf,  0x20u);
      }

      char v11 = 0LL;
      goto LABEL_12;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  v12 = v9;
  id v20 = v9;
  unsigned __int8 v13 = [v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v9 = v20;

  if ((v13 & 1) == 0)
  {
    v14 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v16 = v14;
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      v23 = "-[CSTrialAssetDownloadMonitor _trailStageDirectoryForAsset:]";
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2114;
      v27 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
    }

    id v7 = 0LL;
  }

  id v7 = v7;
  char v11 = v7;
LABEL_12:

  return v11;
}

- (void).cxx_destruct
{
}

+ (CSTrialAssetDownloadMonitor)sharedInstance
{
  if (qword_100280260 != -1) {
    dispatch_once(&qword_100280260, &stru_10022ECC8);
  }
  return (CSTrialAssetDownloadMonitor *)(id)qword_100280258;
}

@end