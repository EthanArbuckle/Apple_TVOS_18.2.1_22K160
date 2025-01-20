@interface AXUpdateSiriResourcesSimpleTask
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXUpdateSiriResourcesSimpleTask

+ (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withFirstBootType]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withFirstBootType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.ttsasset.NewAssetNotification",  v2));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.trial.NamespaceUpdate.SIRI_TEXT_TO_SPEECH"));
  v9[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.MobileAsset.VoiceServices.GryphonVoice.ma.new-asset-installed"));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.MobileAsset.VoiceServices.CustomVoice.ma.new-asset-installed"));
  v9[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 5LL));

  return v7;
}

- (void)run:(id)a3
{
  v33 = (void (**)(id, uint64_t))a3;
  uint64_t v3 = AXLogAssetDaemon(v33);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Task did begin", buf, 2u);
  }

  uint64_t v6 = AXLogAssetDaemon(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AXUpdateSiriTask: Will refresh cache for type: TTSAXResourceManagerTypeSiri",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 refreshResourcesCacheForManagerType:2]);

  uint64_t v11 = AXLogAssetDaemon(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v9 count];
    *(_DWORD *)buf = 134217984;
    id v42 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "AXUpdateSiriTask: Resource changes after refresh: %ld",  buf,  0xCu);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v14 = v9;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v18);
        uint64_t v20 = AXLogAssetDaemon(v15);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "AXUpdateSiriTask: Resource changes after refresh: %@",  buf,  0xCu);
        }

        id v15 = [v19 isInstalled];
        if ((_DWORD)v15)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAXResourceMigrationUtilities sharedInstance]( &OBJC_CLASS___TTSAXResourceMigrationUtilities,  "sharedInstance"));
          unsigned int v23 = [v22 resourceNeedsMigration:v19];

          if (v23)
          {
            uint64_t v24 = AXLogAssetDaemon(v15);
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue([v19 voiceId]);
              *(_DWORD *)buf = 138412290;
              id v42 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "AXUpdateSiriTask: Resource needs migration: '%@'. Will invoke AXCompleteResourceMigrationSimpleTask now.",  buf,  0xCu);
            }

            v38 = @"kAXResource";
            v39 = v19;
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
            +[AXSimpleAssetTaskBase invokeWithArguments:]( &OBJC_CLASS___AXCompleteResourceMigrationSimpleTask,  "invokeWithArguments:",  v27);
          }
        }

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v15 = [v14 countByEnumeratingWithState:&v34 objects:v40 count:16];
      id v16 = v15;
    }

    while (v15);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v28 setValue:v29 forKey:@"UpdateSiriVoicesTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  uint64_t v31 = AXLogAssetDaemon(v30);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "AXUpdateSiriTask: Task finishing", buf, 2u);
  }

  v33[2](v33, 1LL);
}

@end