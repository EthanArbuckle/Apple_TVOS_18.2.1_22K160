@interface AXRefreshSSEVoicesForBundlePrefixSimpleTask
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXRefreshSSEVoicesForBundlePrefixSimpleTask

+ (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withFirstUnlockType]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withFirstUnlockType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withFirstBootType]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withFirstBootType",  v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.SynthesisProvider.updatedVoices"));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));

  return v5;
}

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arguments]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"notifyArg"]);

  uint64_t v9 = AXLogAssetDaemon(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "AXRefreshSSETask: Task did begin",  (uint8_t *)&v21,  2u);
  }

  uint64_t v12 = AXLogAssetDaemon(v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v14)
    {
      int v21 = 138412290;
      v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "AXRefreshSSETask: Will purge and reload bundle hash %@",  (uint8_t *)&v21,  0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSynthesisProviderVoiceManager sharedInstance]( &OBJC_CLASS___TTSSynthesisProviderVoiceManager,  "sharedInstance"));
    [v15 reloadVoicesForBundleIdentifierHash:v7];
  }

  else
  {
    if (v14)
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "AXRefreshSSETask: Will purge and reload all components for TTSSynthesisProviderVoiceManager",  (uint8_t *)&v21,  2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSynthesisProviderVoiceManager sharedInstance]( &OBJC_CLASS___TTSSynthesisProviderVoiceManager,  "sharedInstance"));
    [v15 purgeAndReloadAllComponents];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v16 setValue:v17 forKey:@"RefreshSSEVoicesForBundlePrefixTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  uint64_t v19 = AXLogAssetDaemon(v18);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "AXRefreshSSETask: Task finishing",  (uint8_t *)&v21,  2u);
  }

  v4[2](v4, 1LL);
}

@end