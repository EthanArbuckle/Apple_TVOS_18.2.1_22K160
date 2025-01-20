@interface AXDeleteCompactResourceSimpleTask
- (void)run:(id)a3;
@end

@implementation AXDeleteCompactResourceSimpleTask

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v39) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AXDeleteCompactResTask: Task did begin",  (uint8_t *)&v39,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kAXVoiceId"]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceWithVoiceId:v9]);

  v12 = (void *)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryLanguage]);
  unsigned int v14 = [v13 isEqualToString:v12];

  if (v14)
  {
    uint64_t v16 = AXLogAssetDaemon(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v39 = 138412290;
      v40 = v9;
      v18 = "AXDeleteCompactResTask: Unable to delete compact identifier %@ because it is in use by the system spoken language.";
      v19 = v17;
      uint32_t v20 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v39, v20);
    }
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeySpeechFeatures]);
    unsigned int v23 = [v22 containsObject:v9];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeySwitchControl]);
    unsigned int v26 = [v25 containsObject:v9];

    uint64_t v28 = AXLogAssetDaemon(v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if ((v23 & 1) != 0 || (v26 & 1) != 0)
    {
      if (v30)
      {
        int v39 = 138412802;
        v40 = v9;
        __int16 v41 = 1024;
        unsigned int v42 = v23;
        __int16 v43 = 1024;
        unsigned int v44 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "AXDeleteCompactResTask: Unable to delete compact identifier %@ because it is in use by Spoken Content: %i Switch Control: %i",  (uint8_t *)&v39,  0x18u);
      }
    }

    else
    {
      if (v30)
      {
        int v39 = 138412290;
        v40 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "AXDeleteCompactResTask: Will delete resource: %@",  (uint8_t *)&v39,  0xCu);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
      [v31 deleteResourceWithVoiceId:v9];

      uint64_t v33 = AXLogAssetDaemon(v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "AXDeleteCompactResTask: Will invoke task AXUpdateResourcesSimpleTask to update resources now",  (uint8_t *)&v39,  2u);
      }

      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskManager sharedInstance]( &OBJC_CLASS___AXSimpleAssetTaskManager,  "sharedInstance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskBase taskIdentifier]( &OBJC_CLASS___AXUpdateResourcesSimpleTask,  "taskIdentifier"));
      v45 = @"kAXActionType";
      v46 = &off_100021960;
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
      -[os_log_s invokeTaskById:arguments:](v29, "invokeTaskById:arguments:", v35, v36);
    }

    uint64_t v38 = AXLogAssetDaemon(v37);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v39) = 0;
      v18 = "AXDeleteCompactResTask: Task finishing";
      v19 = v17;
      uint32_t v20 = 2;
      goto LABEL_17;
    }
  }

  v4[2](v4, 1LL);
}

@end