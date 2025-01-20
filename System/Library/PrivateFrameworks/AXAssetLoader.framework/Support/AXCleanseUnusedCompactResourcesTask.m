@interface AXCleanseUnusedCompactResourcesTask
- (AXCleanseUnusedCompactResourcesTask)initWithPolicy:(id)a3 context:(id)a4;
- (void)_cleanUnusedCompactResources;
@end

@implementation AXCleanseUnusedCompactResourcesTask

- (AXCleanseUnusedCompactResourcesTask)initWithPolicy:(id)a3 context:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXCleanseUnusedCompactResourcesTask;
  return -[AXManagedAssetTask initWithName:policy:context:block:]( &v5,  "initWithName:policy:context:block:",  @"Cleanse Compact Resources",  a3,  a4,  &stru_100020728);
}

- (void)_cleanUnusedCompactResources
{
  uint64_t v2 = AXLogAssetDaemon(self);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AXCleanseUnusedCompactResourcesTask: Cleaning up unused compact resources",  buf,  2u);
  }

  v4 = (void *)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceOverLanguageRotorItems]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeyVoiceOver]);

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
  v37 = v9;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v40;
    uint64_t v36 = AXSpeechSourceKeySpeechFeatures;
    uint64_t v35 = AXSpeechSourceKeySwitchControl;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 resourceWithVoiceId:v14]);

        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 primaryLanguage]);
        unsigned __int8 v18 = [v6 containsObject:v14];

        if ((v18 & 1) == 0 && [v16 type] == (id)4 && objc_msgSend(v16, "footprint") == (id)3)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 selectedSpeechVoiceIdentifiersForSourceKey:v36]);
          unsigned __int8 v38 = [v20 containsObject:v14];

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          v22 = v6;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v21 selectedSpeechVoiceIdentifiersForSourceKey:v35]);
          unsigned __int8 v24 = [v23 containsObject:v14];

          v6 = v22;
          id v9 = v37;

          if ((v38 & 1) == 0 && (v24 & 1) == 0)
          {
            uint64_t v26 = AXLogAssetDaemon(v25);
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v46 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "AXCleanseUnusedCompactResourcesTask: Deleting resource with id: %@",  buf,  0xCu);
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
            [v17 deleteResourceWithVoiceId:v14];
LABEL_9:
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v11);
  }

  uint64_t v29 = AXLogAssetDaemon(v28);
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "AXCleanseUnusedCompactResourcesTask: Will invoke AXUpdateResourcesSimpleTask now",  buf,  2u);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskBase taskIdentifier](&OBJC_CLASS___AXUpdateResourcesSimpleTask, "taskIdentifier"));
  v43 = @"kAXActionType";
  v44 = &off_100021918;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
  [v31 invokeTaskById:v32 arguments:v33];

  -[AXManagedAssetTask _completeWithResult:](self, "_completeWithResult:", 0LL);
}

@end