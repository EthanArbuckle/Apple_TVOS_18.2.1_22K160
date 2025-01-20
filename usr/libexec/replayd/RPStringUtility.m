@interface RPStringUtility
+ (BOOL)isInvalidBundleId:(id)a3;
+ (id)numberFromString:(id)a3;
+ (unint64_t)rotatingDeviceUniqueID;
@end

@implementation RPStringUtility

+ (id)numberFromString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v4, "numberFromString:", v3));

  return v5;
}

+ (unint64_t)rotatingDeviceUniqueID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kSCDeviceUniqueID"]);
    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

      [v3 setObject:v4 forKey:@"kSCDeviceUniqueID"];
      [v3 synchronize];
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 components:8196 fromDate:v7]);

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%lu%lu",  v4,  [v8 yearForWeekOfYear],  objc_msgSend(v8, "weekOfYear")));
    id v10 = [v9 hash];
  }

  else
  {
    id v10 = 0LL;
  }

  return (unint64_t)v10;
}

+ (BOOL)isInvalidBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && [v3 caseInsensitiveCompare:@"(null)"]
    && [v3 caseInsensitiveCompare:@"Unknown"])
  {
    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

@end