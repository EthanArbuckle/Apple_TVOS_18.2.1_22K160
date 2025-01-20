@interface UAActivityBecameCurrentEvent
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (void)setActivityType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation UAActivityBecameCurrentEvent

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.BecameCurrent";
}

- (id)eventPayload
{
  v11[0] = @"activityType";
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[UAActivityBecameCurrentEvent reportedActivityType](self, "reportedActivityType"));
  v4 = (void *)v3;
  if (v3) {
    v5 = (const __CFString *)v3;
  }
  else {
    v5 = @"-";
  }
  v11[1] = @"bundleIdentifier";
  v12[0] = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[UAActivityBecameCurrentEvent bundleIdentifier](self, "bundleIdentifier"));
  v7 = (void *)v6;
  if (v6) {
    v8 = (const __CFString *)v6;
  }
  else {
    v8 = @"-";
  }
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  return v9;
}

- (id)reportedActivityType
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityBecameCurrentEvent activityType](self, "activityType"));
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

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end