@interface AKBAATimeProvider
+ (id)sharedInstance;
- (BOOL)_useEpochTimestamp;
- (BOOL)_useIDSDate;
- (double)_serverTimeAdjustment;
- (double)_systemEpochTime;
- (double)_timeIntervalWithAdjustment;
- (id)adjustedDeviceTime;
- (int64_t)clientServerTimeDiffInMS;
- (void)addServerAdjustment:(id)a3;
@end

@implementation AKBAATimeProvider

+ (id)sharedInstance
{
  if (qword_10020F5F8 != -1) {
    dispatch_once(&qword_10020F5F8, &stru_1001CA658);
  }
  return (id)qword_10020F600;
}

- (double)_systemEpochTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSince1970];
  double v4 = v3;

  return v4;
}

- (id)adjustedDeviceTime
{
  double v4 = v3;
  if (-[AKBAATimeProvider _useEpochTimestamp](self, "_useEpochTimestamp"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", floor(v4 * 1000.0)));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringValue]);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v4));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ak_serverFriendlyString"));
  }

  v7 = (void *)v6;

  return v7;
}

- (double)_timeIntervalWithAdjustment
{
  if (-[AKBAATimeProvider _useIDSDate](self, "_useIDSDate"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
    [v3 currentServerTimeInterval];
    double v5 = v4;

    return v5;
  }

  else
  {
    -[AKBAATimeProvider _serverTimeAdjustment](self, "_serverTimeAdjustment");
    double v8 = v7;
    -[AKBAATimeProvider _systemEpochTime](self, "_systemEpochTime");
    return v8 + v9;
  }

- (int64_t)clientServerTimeDiffInMS
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
  [v3 currentServerTimeInterval];
  double v5 = v4;

  -[AKBAATimeProvider _systemEpochTime](self, "_systemEpochTime");
  return (uint64_t)(v6 - v5);
}

- (BOOL)_useIDSDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 baaConfiguration]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"use-ids-time"]);
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (double)_serverTimeAdjustment
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 configurationValueForKey:@"_AKServerTimeAdjustmentKey"]);
  double v4 = (double)(uint64_t)[v3 integerValue];

  return v4;
}

- (void)addServerAdjustment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    if (![v4 caseInsensitiveCompare:@"clear"])
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
      [v8 setConfigurationValue:0 forKey:@"_AKServerTimeAdjustmentKey"];
LABEL_10:

      id v4 = v13;
      goto LABEL_11;
    }

    if (-[AKBAATimeProvider _useEpochTimestamp](self, "_useEpochTimestamp"))
    {
      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ak_numberObject"));
      [v5 doubleValue];
      uint64_t v7 = (uint64_t)v6;
    }

    else
    {
      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate ak_dateFromString:](&OBJC_CLASS___NSDate, "ak_dateFromString:", v13));
      id v4 = v13;
      if (!v5) {
        goto LABEL_11;
      }
      [v5 timeIntervalSince1970];
      uint64_t v7 = 1000 * (uint64_t)v9;
    }

    id v4 = v13;
    if (v7 >= 1704067200000LL)
    {
      -[AKBAATimeProvider _systemEpochTime](self, "_systemEpochTime");
      unint64_t v11 = llround((double)(v7 / 0x3E8uLL) - v10);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
      [v8 setConfigurationValue:v12 forKey:@"_AKServerTimeAdjustmentKey"];

      goto LABEL_10;
    }
  }

- (BOOL)_useEpochTimestamp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 baaConfiguration]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"use-epoch-time"]);
  if ([v4 BOOLValue])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationValueForKey:@"_AKUseEpochTimestamp"]);
    unsigned __int8 v5 = [v7 BOOLValue];
  }

  return v5;
}

@end