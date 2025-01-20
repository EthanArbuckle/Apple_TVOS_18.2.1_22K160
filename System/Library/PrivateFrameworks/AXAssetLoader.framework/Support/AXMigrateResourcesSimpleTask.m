@interface AXMigrateResourcesSimpleTask
+ (id)taskGroupIdentifier;
+ (id)triggers;
- (AXAssetController)assetController;
- (AXDispatchTimer)timer;
- (id)completion;
- (int64_t)attemptCount;
- (void)_callCompletion:(unint64_t)a3;
- (void)_migrateNashvilleToMaui;
- (void)_retryAndBackOff;
- (void)run:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setAttemptCount:(int64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation AXMigrateResourcesSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

+ (id)triggers
{
  return &__NSArray0__struct;
}

- (void)run:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AXMigrateResTask: Task did begin", buf, 2u);
  }

  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_alloc(&OBJC_CLASS___AXDispatchTimer);
  dispatch_queue_t v10 = dispatch_queue_create("retryQueue", v8);
  v11 = -[AXDispatchTimer initWithTargetSerialQueue:](v9, "initWithTargetSerialQueue:", v10);
  -[AXMigrateResourcesSimpleTask setTimer:](self, "setTimer:", v11);

  -[AXMigrateResourcesSimpleTask setCompletion:](self, "setCompletion:", v4);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[AXTTSResourceAssetPolicy policy](&OBJC_CLASS___AXTTSResourceAssetPolicy, "policy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssetController assetControllerWithPolicy:qosClass:shouldRefreshForAssetInstallNotifications:]( &OBJC_CLASS___AXAssetController,  "assetControllerWithPolicy:qosClass:shouldRefreshForAssetInstallNotifications:",  v12,  25LL,  0LL));
  -[AXMigrateResourcesSimpleTask setAssetController:](self, "setAssetController:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAXResourceMigrationUtilities sharedInstance]( &OBJC_CLASS___TTSAXResourceMigrationUtilities,  "sharedInstance"));
  LOBYTE(v12) = [v14 isMigrationComplete];

  uint64_t v16 = AXLogAssetDaemon(v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if ((v12 & 1) != 0)
  {
    if (v18)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "AXMigrateResTask: Task finished", v30, 2u);
    }

    -[AXMigrateResourcesSimpleTask _callCompletion:](self, "_callCompletion:", 1LL);
  }

  else
  {
    if (v18)
    {
      *(_WORD *)v34 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Migration not complete",  v34,  2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXMigrateResourcesSimpleTask assetController](self, "assetController"));
    unsigned __int8 v20 = [v19 isAssetCatalogInstalled];

    uint64_t v22 = AXLogAssetDaemon(v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if ((v20 & 1) != 0)
    {
      if (v24)
      {
        *(_WORD *)v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Installed catalog was found. Will refresh cache for type: TTSAXResourceManagerTypeAccessibility",  v32,  2u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      id v26 = [v25 refreshResourcesCacheForManagerType:1];

      uint64_t v28 = AXLogAssetDaemon(v27);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Will begin migration of Nashville to Maui",  v31,  2u);
      }

      -[AXMigrateResourcesSimpleTask _migrateNashvilleToMaui](self, "_migrateNashvilleToMaui");
    }

    else
    {
      if (v24)
      {
        *(_WORD *)v33 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: No installed catalog yet. Calling _retryAndBackOff",  v33,  2u);
      }

      -[AXMigrateResourcesSimpleTask _retryAndBackOff](self, "_retryAndBackOff");
    }
  }
}

- (void)_callCompletion:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXMigrateResourcesSimpleTask completion](self, "completion"));

  if (v5)
  {
    v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[AXMigrateResourcesSimpleTask completion](self, "completion"));
    v6[2](v6, a3);
  }

  -[AXMigrateResourcesSimpleTask setCompletion:](self, "setCompletion:", 0LL);
}

- (void)_migrateNashvilleToMaui
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectedSpeechVoiceIdentifiersWithLanguageSource]);

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = AXLogAssetDaemon(v68);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v92 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Beginning nashville to maui migration with selected voices: %@",  buf,  0xCu);
  }

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v6 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
  id v63 = [obj countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v63)
  {
    uint64_t v61 = *(void *)v83;
    uint64_t v65 = AXSpeechSourceKeyVoiceOver;
    dispatch_queue_attr_t v7 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
    v62 = v3;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v83 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v8;
        v69 = *(void **)(*((void *)&v82 + 1) + 8 * v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:"));
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        id v67 = (id)objc_claimAutoreleasedReturnValue([v9 allKeys]);
        id v73 = [v67 countByEnumeratingWithState:&v78 objects:v97 count:16];
        if (v73)
        {
          uint64_t v72 = *(void *)v79;
          v66 = v9;
          do
          {
            dispatch_queue_t v10 = 0LL;
            do
            {
              if (*(void *)v79 != v72) {
                objc_enumerationMutation(v67);
              }
              uint64_t v11 = *(void *)(*((void *)&v78 + 1) + 8LL * (void)v10);
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
              v13 = (void *)objc_claimAutoreleasedReturnValue([v6[76] sharedInstance]);
              v14 = (void *)objc_claimAutoreleasedReturnValue([v13 updatedIdentifierForLegacyIdentifier:v12 withLanguageCode:v11]);

              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7[75] sharedInstance]);
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 resourceWithVoiceId:v12]);

              if (!v16)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue([v7[75] sharedInstance]);
                unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 resourceWithVoiceId:v14]);

                v70 = v20;
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 primaryLanguage]);
                unsigned int v22 = [v21 isEqualToString:@"ar-001"];

                if (v22) {
                  BOOL v24 = @"ar-SA";
                }
                else {
                  BOOL v24 = 0LL;
                }
                uint64_t v25 = AXLogAssetDaemon(v23);
                id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v92 = v12;
                  __int16 v93 = 2112;
                  v94 = v14;
                  __int16 v95 = 2112;
                  uint64_t v96 = v11;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Swapping on disk nashville VO id [%@] for maui id [%@] with language [%@]",  buf,  0x20u);
                }

                v71 = v14;
                AXSwapSpeechSettingsIdentifiers(v12, v14, v11);
                uint64_t v16 = 0LL;
                if ([v69 integerValue] == (id)1
                  || [v69 isEqualToString:v65])
                {
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 voiceOverLanguageRotorItems]);

                  __int128 v76 = 0u;
                  __int128 v77 = 0u;
                  __int128 v74 = 0u;
                  __int128 v75 = 0u;
                  id v29 = v28;
                  id v30 = [v29 countByEnumeratingWithState:&v74 objects:v90 count:16];
                  if (v30)
                  {
                    id v31 = v30;
                    uint64_t v32 = *(void *)v75;
                    while (2)
                    {
                      for (i = 0LL; i != v31; i = (char *)i + 1)
                      {
                        if (*(void *)v75 != v32) {
                          objc_enumerationMutation(v29);
                        }
                        v34 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
                        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"Enabled"]);
                        unsigned int v36 = [v35 BOOLValue];

                        v37 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"RotorItem"]);
                        v38 = v37;
                        if (v36 && [v37 isEqualToString:v11])
                        {
                          v45 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskManager sharedInstance]( &OBJC_CLASS___AXSimpleAssetTaskManager,  "sharedInstance"));
                          v46 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskBase taskIdentifier]( &OBJC_CLASS___AXDownloadTTSResourceTask,  "taskIdentifier"));
                          v88 = @"kAXVoiceId";
                          v89 = v71;
                          v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
                          [v45 invokeTaskById:v46 arguments:v47];

                          v17 = v71;
                          v39 = v29;
                          v6 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
                          uint64_t v16 = 0LL;
                          goto LABEL_48;
                        }
                      }

                      id v31 = [v29 countByEnumeratingWithState:&v74 objects:v90 count:16];
                      if (v31) {
                        continue;
                      }
                      break;
                    }

                    v39 = v29;
                    v6 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
                    v17 = v71;
                    uint64_t v16 = 0LL;
                  }

                  else
                  {
                    v39 = v29;
                    v17 = v14;
                  }
                }

                else
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskManager sharedInstance]( &OBJC_CLASS___AXSimpleAssetTaskManager,  "sharedInstance"));
                  id v29 = (id)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskBase taskIdentifier]( &OBJC_CLASS___AXDownloadTTSResourceTask,  "taskIdentifier"));
                  v17 = v14;
                  v86 = @"kAXVoiceId";
                  v87 = v14;
                  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
                  [v39 invokeTaskById:v29 arguments:v38];
LABEL_48:
                }

                dispatch_queue_attr_t v7 = &_s12TextToSpeech11TTSSettingsC0C13TracingClientVMa_ptr;
                v9 = v66;
                v44 = v70;
                goto LABEL_50;
              }

              if ([v16 type] == (id)3)
              {
                v17 = v14;
                unsigned int v18 = [v14 isEqualToString:v12] ^ 1;
              }

              else
              {
                unsigned int v18 = 0;
                v17 = v14;
              }

              id v40 = [v16 type];
              if (v40 == (id)6 || (id v40 = [v16 type], v40 == (id)7))
              {
LABEL_39:
                uint64_t v41 = AXLogAssetDaemon(v40);
                v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v92 = v17;
                  __int16 v93 = 2112;
                  v94 = v12;
                  _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Downloading maui id [%@] for legacy id [%@]",  buf,  0x16u);
                }

                v43 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
                [v68 setObject:v17 forKeyedSubscript:v43];

                v44 = (void *)objc_claimAutoreleasedReturnValue([v7[75] sharedInstance]);
                [v44 downloadResourceWithVoiceId:v17 userInitiated:0];
LABEL_50:

                goto LABEL_51;
              }

              id v40 = [v16 type];
              if (v40 == (id)2)
              {
                id v40 = [v16 isInstalled];
              }

              else if (v18)
              {
                goto LABEL_39;
              }

- (void)_retryAndBackOff
{
  id inited = objc_initWeak(&location, self);
  uint64_t v4 = AXLogAssetDaemon(inited);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AXMigrateResTask: Will force-refresh catalog for AXTTSResourceAssetPolicy. timeout=60s",  buf,  2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXMigrateResourcesSimpleTask assetController](self, "assetController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006B2C;
  v7[3] = &unk_100020798;
  objc_copyWeak(&v8, &location);
  [v6 refreshAssetsByForceUpdatingCatalog:1 updatingCatalogIfNeeded:0 catalogRefreshOverrideTimeout:&off_100021948 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (int64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(int64_t)a3
{
  self->_attemptCount = a3;
}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end