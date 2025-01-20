@interface AXUpdateResourcesSimpleTask
+ (id)taskGroupIdentifier;
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXUpdateResourcesSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

+ (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.MobileAsset.TTSAXResourceModelAssets.ma.new-asset-installed"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)run:(id)a3
{
  v54 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = AXLogAssetDaemon(v54);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXUpdateResTask: Task did begin", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 arguments]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kAXActionType"]);

  if (!v8)
  {
    uint64_t v18 = 1LL;
LABEL_10:
    uint64_t v17 = 1LL;
    goto LABEL_11;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 arguments]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"kAXActionType"]);
  signed int v13 = [v12 intValue];

  if (v13 != 2)
  {
    uint64_t v18 = v13;
    goto LABEL_10;
  }

  uint64_t v14 = AXLogAssetDaemon(v9);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "AXUpdateResTask: Will purge / reload all components",  buf,  2u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSynthesisProviderVoiceManager sharedInstance]( &OBJC_CLASS___TTSSynthesisProviderVoiceManager,  "sharedInstance"));
  [v16 purgeAndReloadAllComponents];

  uint64_t v17 = 3LL;
  uint64_t v18 = 2LL;
LABEL_11:
  uint64_t v19 = AXLogAssetDaemon(v9);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v65 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "AXUpdateResTask: Will refresh cache for type: %ld",  buf,  0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 refreshResourcesCacheForManagerType:v17]);

  uint64_t v24 = AXLogAssetDaemon(v23);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v65 = (uint64_t)v26;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "AXUpdateResTask: Resource changes after refresh: %ld",  buf,  0xCu);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v27 = v22;
  id v28 = [v27 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v32, "isInstalled", v54) & 1) == 0)
        {
          id v33 = [v32 type];
          if (v33 == (id)3)
          {
            if (!v18) {
              goto LABEL_26;
            }
          }

          else
          {
            id v33 = [v32 type];
            if (!v18 && v33 == (id)10)
            {
LABEL_26:
              uint64_t v34 = AXLogAssetDaemon(v33);
              v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue([v32 voiceId]);
                *(_DWORD *)buf = 138412290;
                uint64_t v65 = (uint64_t)v36;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "AXUpdateResTask: Siri resource being deleted. Will invoke AXInformSiriVoiceSubscriptionsSimpleTask to begin update-subscription task now. %@",  buf,  0xCu);
              }

              v37 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskManager sharedInstance]( &OBJC_CLASS___AXSimpleAssetTaskManager,  "sharedInstance"));
              v38 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskBase taskIdentifier]( &OBJC_CLASS___AXInformSiriVoiceSubscriptionsSimpleTask,  "taskIdentifier"));
              v61[0] = @"kAXVoiceId";
              v39 = (void *)objc_claimAutoreleasedReturnValue([v32 voiceId]);
              v61[1] = @"kAXVoiceSubscriptionAddition";
              v62[0] = v39;
              v62[1] = &__kCFBooleanFalse;
              v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  2LL));
              [v37 invokeTaskById:v38 arguments:v40];

              [v32 isInstalled];
              continue;
            }
          }
        }

        unsigned __int8 v41 = [v32 isInstalled];
        if (v18 == 1 && (v41 & 1) != 0)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAXResourceMigrationUtilities sharedInstance]( &OBJC_CLASS___TTSAXResourceMigrationUtilities,  "sharedInstance"));
          unsigned int v43 = [v42 resourceNeedsMigration:v32];

          if (v43)
          {
            uint64_t v45 = AXLogAssetDaemon(v44);
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue([v32 voiceId]);
              *(_DWORD *)buf = 138412290;
              uint64_t v65 = (uint64_t)v47;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "AXUpdateResTask: Resource needs migration: '%@'. Will invoke AXCompleteResourceMigrationSimpleTask now.",  buf,  0xCu);
            }

            v59 = @"kAXResource";
            v60 = v32;
            v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
            +[AXSimpleAssetTaskBase invokeWithArguments:]( &OBJC_CLASS___AXCompleteResourceMigrationSimpleTask,  "invokeWithArguments:",  v48);
          }
        }
      }

      id v29 = [v27 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }

    while (v29);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v49 setValue:v50 forKey:@"UpdateResourcesTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  uint64_t v52 = AXLogAssetDaemon(v51);
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "AXUpdateResTask: Task finishing", buf, 2u);
  }

  v54[2](v54, 1LL);
}

@end