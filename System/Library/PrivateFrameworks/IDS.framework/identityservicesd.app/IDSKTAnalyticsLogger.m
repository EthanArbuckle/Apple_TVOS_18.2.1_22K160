@interface IDSKTAnalyticsLogger
+ (id)logger;
- (void)logMetric:(id)a3;
@end

@implementation IDSKTAnalyticsLogger

+ (id)logger
{
  return objc_alloc_init((Class)a1);
}

- (void)logMetric:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryRepresentation]);

  [v6 logSoftFailureForEventNamed:v4 withAttributes:v5];
}

@end