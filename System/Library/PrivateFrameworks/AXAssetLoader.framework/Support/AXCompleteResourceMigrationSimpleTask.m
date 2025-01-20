@interface AXCompleteResourceMigrationSimpleTask
+ (id)taskGroupIdentifier;
- (BOOL)_resourceInUseByOtherTechnologies:(id)a3;
- (void)_cleanupVoiceSubscriptions;
- (void)_completeMigrationForLegacyResource:(id)a3 withDownloadedResource:(id)a4;
- (void)_purgeLegacyResource:(id)a3;
- (void)run:(id)a3;
@end

@implementation AXCompleteResourceMigrationSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Task did begin",  buf,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"kAXResource"]);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAXResourceMigrationUtilities sharedInstance]( &OBJC_CLASS___TTSAXResourceMigrationUtilities,  "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 voiceId]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 legacyIdentifierForUpdatedIdentifierDuringMigration:v11]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resourceWithVoiceId:v12]);

  -[AXCompleteResourceMigrationSimpleTask _completeMigrationForLegacyResource:withDownloadedResource:]( self,  "_completeMigrationForLegacyResource:withDownloadedResource:",  v14,  v9);
  -[AXCompleteResourceMigrationSimpleTask _purgeLegacyResource:](self, "_purgeLegacyResource:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAXResourceMigrationUtilities sharedInstance]( &OBJC_CLASS___TTSAXResourceMigrationUtilities,  "sharedInstance"));
  unsigned int v16 = [v15 isMigrationComplete];

  if (v16)
  {
    uint64_t v18 = AXLogAssetDaemon(-[AXCompleteResourceMigrationSimpleTask _cleanupVoiceSubscriptions](self, "_cleanupVoiceSubscriptions"));
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Completed migration",  v23,  2u);
    }
  }

  uint64_t v20 = AXLogAssetDaemon(v17);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Task finished",  v22,  2u);
  }

  v4[2](v4, 1LL);
}

- (void)_purgeLegacyResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Will purge legacy voice: %@",  (uint8_t *)&v16,  0xCu);
  }

  if ([v4 type] == (id)6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceId]);
    [v7 deleteResourceWithVoiceId:v8];
LABEL_12:

    goto LABEL_13;
  }

  if ([v4 type] == (id)7)
  {
    BOOL v9 = -[AXCompleteResourceMigrationSimpleTask _resourceInUseByOtherTechnologies:]( self,  "_resourceInUseByOtherTechnologies:",  v4);
    if (v9)
    {
      uint64_t v10 = AXLogAssetDaemon(v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceId]);
        int v16 = 138412290;
        id v17 = v8;
        v11 = "AXCompleteResMigrationTask: Did not purge legacy vocalizer asset: %@ because it was being used by another technology";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, 0xCu);
        goto LABEL_12;
      }
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceId]);
      [v12 deleteResourceWithVoiceId:v13];

      uint64_t v15 = AXLogAssetDaemon(v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceId]);
        int v16 = 138412290;
        id v17 = v8;
        v11 = "AXCompleteResMigrationTask: Purged legacy vocalizer asset with identifier: %@";
        goto LABEL_11;
      }
    }

- (void)_completeMigrationForLegacyResource:(id)a3 withDownloadedResource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = AXLogAssetDaemon(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Will complete migration of legacy resource: '%@' to downloaded resource: '%@'",  (uint8_t *)&v18,  0x16u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAXResourceMigrationUtilities sharedInstance]( &OBJC_CLASS___TTSAXResourceMigrationUtilities,  "sharedInstance"));
  [v9 resourceCompletedMigration:v5];

  uint64_t v11 = AXLogAssetDaemon(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceId]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceId]);
    int v18 = 138412546;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Swapping downloaded maui id [%@] for legacy id [%@]",  (uint8_t *)&v18,  0x16u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceId]);
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceId]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryLanguage]);
  AXSwapSpeechSettingsIdentifiers(v15, v16, v17);
}

- (BOOL)_resourceInUseByOtherTechnologies:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AXClientsForSiriResource();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = AXLogAssetDaemon(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 count]));
    int v12 = 138412802;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Resource %@ is in use by %@ clients: %@",  (uint8_t *)&v12,  0x20u);
  }

  if ((unint64_t)[v5 count] <= 1)
  {
    if ([v5 count] == (id)1)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      unsigned int v9 = [v10 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"] ^ 1;
    }

    else
    {
      LOBYTE(v9) = 0;
    }
  }

  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_cleanupVoiceSubscriptions
{
  uint64_t v2 = AXLogAssetDaemon(self);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AXCompleteResMigrationTask: Will invoke AXCleanupSiriVoiceSubscriptionsSimpleTask to clean up voice subscriptions now",  buf,  2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskBase taskIdentifier]( &OBJC_CLASS___AXCleanupSiriVoiceSubscriptionsSimpleTask,  "taskIdentifier"));
  [v4 invokeTaskById:v5 arguments:&__NSDictionary0__struct];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 selectedSpeechVoiceIdentifiers]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v21;
    uint64_t v13 = kTTSSystemVoiceIdentifierPrefix;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v19 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v16 = objc_msgSend(v15, "hasPrefix:", v13, v19, (void)v20);
        if ((_DWORD)v16)
        {
          uint64_t v17 = AXLogAssetDaemon(v16);
          int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v25 = v15;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "AXCompleteResMigrationTask: Failed to clean up nashville identifier: %@",  buf,  0xCu);
          }
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v11);
  }
}

@end