@interface AppUsageMetricsEvent
- (id)description;
@end

@implementation AppUsageMetricsEvent

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppUsageMetricsEvent underlyingDictionary](self, "underlyingDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<AppUsageMetricsEvent: %@>",  v2));

  return v3;
}

- (void).cxx_destruct
{
}

@end