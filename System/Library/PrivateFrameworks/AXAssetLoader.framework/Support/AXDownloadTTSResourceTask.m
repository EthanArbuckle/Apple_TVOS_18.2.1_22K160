@interface AXDownloadTTSResourceTask
- (void)run:(id)a3;
@end

@implementation AXDownloadTTSResourceTask

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AXDownloadTTSResourceTask: Task did begin",  (uint8_t *)&v25,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kAXVoiceId"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) != 0
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger")),
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 arguments]),
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"kAXVoiceId"]),
        v15,
        v14,
        v16))
  {
    uint64_t v17 = AXLogAssetDaemon(v13);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      v26 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "AXDownloadTTSResourceTask: Task did begin download for identifier %@",  (uint8_t *)&v25,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
    [v19 downloadResourceWithVoiceId:v16];

    uint64_t v21 = AXLogAssetDaemon(v20);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "AXDownloadTTSResourceTask: Task did finish",  (uint8_t *)&v25,  2u);
    }

    v4[2](v4, 1LL);
  }

  else
  {
    uint64_t v23 = AXLogAssetDaemon(v13);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "AXDownloadTTSResourceTask: Task failed, no identifier given",  (uint8_t *)&v25,  2u);
    }

    v4[2](v4, 2LL);
  }
}

@end