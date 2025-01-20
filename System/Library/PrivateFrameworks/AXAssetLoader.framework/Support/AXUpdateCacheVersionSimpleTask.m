@interface AXUpdateCacheVersionSimpleTask
+ (id)taskGroupIdentifier;
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXUpdateCacheVersionSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

+ (id)triggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSimpleAssetTaskTrigger withFirstBootType]( &OBJC_CLASS___AXSimpleAssetTaskTrigger,  "withFirstBootType"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)run:(id)a3
{
  v3 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = AXLogAssetDaemon(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AXUpdateCacheVersionSimpleTask: Task did begin",  buf,  2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  id v7 = [v6 readResourceCacheVersionFromPreferences];

  if (v7 != (id)4)
  {
    uint64_t v9 = AXLogAssetDaemon(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "AXUpdateCacheVersionSimpleTask: Mismatch in cache versions. Refreshing resources and updating cache version.",  v16,  2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
    id v12 = [v11 refreshResourcesCacheForManagerType:3];
  }

  uint64_t v13 = AXLogAssetDaemon(v8);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "AXUpdateCacheVersionSimpleTask: Task did complete",  v15,  2u);
  }

  v3[2](v3, 1LL);
}

@end