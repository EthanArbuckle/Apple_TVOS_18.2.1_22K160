@interface WiFiUsageLQMConfiguration
+ (id)getConfigForKey:(id)a3;
+ (void)getConfigForPlatform;
+ (void)initialize;
+ (void)setConfig:(id)a3;
@end

@implementation WiFiUsageLQMConfiguration

+ (void)initialize
{
  v2 = (void *)_dataPathTelemetryConfig;
  _dataPathTelemetryConfig = 0LL;
}

+ (void)setConfig:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToDictionary:_dataPathTelemetryConfig] & 1) == 0)
  {
    objc_storeStrong((id *)&_dataPathTelemetryConfig, a3);
    [a1 getConfigForPlatform];
    NSLog( @"%s: Updated dataPathTelemetryConfig from Mobile Assets",  "+[WiFiUsageLQMConfiguration setConfig:]");
    +[WiFiUsageLQMRollingWindow updateConfig](&OBJC_CLASS___WiFiUsageLQMRollingWindow, "updateConfig");
    v5 = +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance");
    [v5 updateLQMWindowCriteria];

    +[WiFiUsageLQMTransformations updateConfig](&OBJC_CLASS___WiFiUsageLQMTransformations, "updateConfig");
    +[WiFiUsageLQMWindowAnalysis updateConfig](&OBJC_CLASS___WiFiUsageLQMWindowAnalysis, "updateConfig");
  }
}

+ (id)getConfigForKey:(id)a3
{
  id v3 = a3;
  [(id)_dataPathTelemetryConfig objectForKey:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    NSLog( @"%s: dataPathTelemetryConfig does not contain %@",  "+[WiFiUsageLQMConfiguration getConfigForKey:]",  v3);
  }

  return v4;
}

+ (void)getConfigForPlatform
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  p_cache = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
  [(id)_dataPathTelemetryConfig objectForKey:@"platformDependent"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    id v34 = (id)_dataPathTelemetryConfig;
    goto LABEL_38;
  }

  [(id)_dataPathTelemetryConfig objectForKeyedSubscript:@"platformDependent"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v35 = (void *)NSString;
    [(id)_dataPathTelemetryConfig objectForKeyedSubscript:@"platformDependent"];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 stringWithFormat:@"%s: Cannot parse DataPathTelemetry.platformDependent: %@", "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v36];
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      id v38 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v37, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v50 = [v38 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    id v34 = 0LL;
    goto LABEL_38;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  [(id)_dataPathTelemetryConfig objectForKeyedSubscript:@"platformDependent"];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v6)
  {
    v22 = 0LL;
    id v34 = 0LL;
    goto LABEL_36;
  }

  uint64_t v7 = v6;
  v40 = 0LL;
  v8 = @"validOnPlatforms";
  uint64_t v9 = *(void *)v45;
  do
  {
    uint64_t v10 = 0LL;
    uint64_t v42 = v7;
    do
    {
      if (*(void *)v45 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      uint64_t v12 = [v11 objectForKeyedSubscript:v8];
      if (!v12) {
        goto LABEL_17;
      }
      v13 = (void *)v12;
      uint64_t v14 = v9;
      v15 = p_cache;
      v16 = v8;
      [v11 objectForKeyedSubscript:v8];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v11 objectForKeyedSubscript:@"DataPathTelemetry"],
            (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        v8 = v16;
        uint64_t v9 = v14;
        uint64_t v7 = v42;
LABEL_17:
        v24 = (void *)NSString;
        [p_cache[328] objectForKeyedSubscript:@"platformDependent"];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 stringWithFormat:@"%s: Cannot parse DataPathTelemetry.platformDependent: %@", "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v25];
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          id v27 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v26, "UTF8String"));
          uint64_t v28 = [v27 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v50 = v28;
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }

        goto LABEL_20;
      }

      v19 = (void *)v18;
      [v11 objectForKeyedSubscript:@"DataPathTelemetry"];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v41 = objc_opt_isKindOfClass();

      p_cache = v15;
      v8 = v16;
      uint64_t v9 = v14;
      uint64_t v7 = v42;
      if ((v41 & 1) == 0) {
        goto LABEL_17;
      }
      switch(MGGetSInt32Answer())
      {
        case 1u:
        case 2u:
        case 3u:
          [v11 objectForKeyedSubscript:v16];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = @"phone";
          int v23 = [v21 containsObject:@"phone"];

          if (!v23) {
            break;
          }
          goto LABEL_26;
        case 4u:
          [v11 objectForKeyedSubscript:v16];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v22 = @"tv";
          goto LABEL_25;
        case 6u:
          [v11 objectForKeyedSubscript:v16];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v22 = @"watch";
          goto LABEL_25;
        case 9u:
          [v11 objectForKeyedSubscript:v16];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v22 = @"mac";
LABEL_25:
          char v31 = [v29 containsObject:v22];

          if ((v31 & 1) == 0) {
            break;
          }
LABEL_26:
          uint64_t v32 = [v11 objectForKeyedSubscript:@"DataPathTelemetry"];
          if (v32)
          {
            id v34 = (id)v32;
            goto LABEL_36;
          }

          v40 = v22;
          break;
        default:
          break;
      }

@end