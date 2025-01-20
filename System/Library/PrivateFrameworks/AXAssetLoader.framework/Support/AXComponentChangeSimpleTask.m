@interface AXComponentChangeSimpleTask
+ (id)triggers;
- (void)didCompleteWithStatus:(unint64_t)a3;
- (void)run:(id)a3;
@end

@implementation AXComponentChangeSimpleTask

+ (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.LaunchServices.ApplicationsChanged"));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withNotificationName:]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withNotificationName:",  @"com.apple.coreaudio.components.changed"));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

- (void)run:(id)a3
{
  v3 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = AXLogAssetDaemon(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCompChangeTask: Task did begin", buf, 2u);
  }

  uint64_t v7 = AXLogAssetDaemon(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "AXCompChangeTask: Will reconcile cached components for TTSSynthesisProviderVoiceManager",  v16,  2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSynthesisProviderVoiceManager sharedInstance]( &OBJC_CLASS___TTSSynthesisProviderVoiceManager,  "sharedInstance"));
  [v9 reconcileCachedComponents];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v10 setValue:v11 forKey:@"ComponentChangeTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  uint64_t v13 = AXLogAssetDaemon(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "AXCompChangeTask: Task finishing", v15, 2u);
  }

  v3[2](v3, 1LL);
}

- (void)didCompleteWithStatus:(unint64_t)a3
{
  uint64_t v3 = AXLogAssetDaemon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "AXCompChangeTask: Will invoke AXUpdateResourcesSimpleTask now",  v7,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskBase taskIdentifier](&OBJC_CLASS___AXUpdateResourcesSimpleTask, "taskIdentifier"));
  [v5 invokeTaskById:v6 arguments:&__NSDictionary0__struct];
}

@end