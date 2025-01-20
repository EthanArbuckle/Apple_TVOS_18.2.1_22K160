@interface UAActivityWasDiscoveredEvent
- (NSString)activityType;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (void)setActivityType:(id)a3;
@end

@implementation UAActivityWasDiscoveredEvent

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.WasDiscovered";
}

- (id)eventPayload
{
  v7 = @"activityType";
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[UAActivityWasDiscoveredEvent reportedActivityType](self, "reportedActivityType"));
  v3 = (void *)v2;
  v4 = @"-";
  if (v2) {
    v4 = (const __CFString *)v2;
  }
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  return v5;
}

- (id)reportedActivityType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasDiscoveredEvent activityType](self, "activityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAAnalyticsEvent firstPartyActivityTypeOrUnknown:](self, "firstPartyActivityTypeOrUnknown:", v3));

  return v4;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setActivityType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end