@interface _DASRateLimiterUtilities
+ (BOOL)consideredInLPMWithState:(id)a3;
+ (BOOL)isAggregateClient:(id)a3;
+ (id)assetsRateLimitConfiguration;
+ (id)ckRateLimitConfiguration;
+ (id)defaultRateLimiterConfiguration;
+ (id)getCurrentBootSessionUUID;
+ (id)pecRateLimitConfiguration;
+ (id)rateLimitIdentifierForActivity:(id)a3;
+ (void)adjustStartAfterDate:(id)a3 forActivity:(id)a4;
@end

@implementation _DASRateLimiterUtilities

+ (id)defaultRateLimiterConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  25LL,  300.0));
  [v2 addObject:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  60LL,  3600.0));

  [v2 addObject:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:]( &OBJC_CLASS____DASActivityRateLimitConfiguration,  "rateLimitConfigurationWithName:andLimits:",  _DASDefaultConfigurationName,  v2));

  return v5;
}

+ (id)ckRateLimitConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  60LL,  60.0));
  [v2 addObject:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  120LL,  300.0));

  [v2 addObject:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  360LL,  3600.0));

  [v2 addObject:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  480LL,  14400.0));

  [v2 addObject:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  1080LL,  86400.0));

  [v2 addObject:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:]( &OBJC_CLASS____DASActivityRateLimitConfiguration,  "rateLimitConfigurationWithName:andLimits:",  _DASCKRateLimitConfigurationName,  v2));

  return v8;
}

+ (id)pecRateLimitConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  100LL,  86400.0));
  [v2 addObject:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:]( &OBJC_CLASS____DASActivityRateLimitConfiguration,  "rateLimitConfigurationWithName:andLimits:",  _DASPECRateLimitConfigurationName,  v2));

  return v4;
}

+ (id)assetsRateLimitConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimit rateLimitWithMaximum:perWindow:]( &OBJC_CLASS____DASActivityRateLimit,  "rateLimitWithMaximum:perWindow:",  1LL,  1800.0));
  [v2 addObject:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:]( &OBJC_CLASS____DASActivityRateLimitConfiguration,  "rateLimitConfigurationWithName:andLimits:",  _DASAssetsRateLimitConfigurationName,  v2));

  return v4;
}

+ (BOOL)consideredInLPMWithState:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);
  unsigned __int8 v6 = [v5 BOOLValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForLowPowerModeStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForLowPowerModeStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v7]);

  LOBYTE(v3) = [v8 BOOLValue];
  return v3 & ~v6;
}

+ (BOOL)isAggregateClient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 groupName]);
  if (v4)
  {
    v5 = (void *)v4;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
    unsigned __int8 v7 = [v6 isEqualToString:@"NSURLSessionBackgroundPoolName"];

    if ((v7 & 1) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 groupName]);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
    unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.ckdiscretionaryd"];

    if ((v11 & 1) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v3 groupName]);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
    unsigned __int8 v15 = [v14 containsString:@"com.apple.mlhost"];

    if ((v15 & 1) != 0) {
      goto LABEL_8;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 widgetID]);

  if (v16)
  {
LABEL_8:
    LOBYTE(v17) = 1;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 rateLimitConfigurationName]);
    uint64_t v17 = [v19 isEqualToString:_DASCKRateLimitConfigurationName];
  }

  return v17;
}

+ (id)rateLimitIdentifierForActivity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rateLimitConfigurationName]);
  if (v5) {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v5));
  }
  else {
    unsigned __int8 v6 = 0LL;
  }
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetID]);

  if (v7) {
    goto LABEL_5;
  }
  if (!v5)
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned int v16 = [v15 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];

    if (v16)
    {
      id v8 = _DASAssetsRateLimitConfigurationName;
      goto LABEL_6;
    }

    if (![a1 isAggregateClient:v4]
      || (uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]),
          id v18 = [v17 count],
          v17,
          !v18))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceName]);

      if (v20)
      {
        id v8 = (id)objc_claimAutoreleasedReturnValue([v4 serviceName]);
        goto LABEL_6;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue([v4 involvedProcesses]);
      id v22 = [v21 count];

      if (v22)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 involvedProcesses]);
        goto LABEL_21;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
      id v24 = [v23 count];

      if (!v24)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleId]);

        if (!v9) {
          goto LABEL_7;
        }
        id v8 = (id)objc_claimAutoreleasedReturnValue([v4 bundleId]);
        goto LABEL_6;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
LABEL_21:
    v13 = v19;
    id v14 = (id)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
    goto LABEL_22;
  }

  if ([v5 isEqualToString:_DASCKRateLimitConfigurationName])
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

      [v6 appendFormat:@"-%@", v13];
      id v14 = v6;
LABEL_22:
      v9 = v14;

      goto LABEL_7;
    }
  }

+ (void)adjustStartAfterDate:(id)a3 forActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 startAfter]);
  if (v7
    && (id v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue([v6 startAfter]),
        [v9 timeIntervalSinceDate:v5],
        double v11 = v10,
        v9,
        v8,
        v11 >= 0.0))
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"processRateLimiter"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 startAfter]);
      int v15 = 138412802;
      unsigned int v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Activity %@ already has same or later start date %@ than proposed start date %@",  (uint8_t *)&v15,  0x20u);
    }
  }

  else
  {
    [v6 setStartAfter:v5];
  }
}

+ (id)getCurrentBootSessionUUID
{
  size_t __size = 0LL;
  sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL);
  v2 = malloc(__size);
  sysctlbyname("kern.bootsessionuuid", v2, &__size, 0LL, 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2));
  free(v2);
  return v3;
}

@end