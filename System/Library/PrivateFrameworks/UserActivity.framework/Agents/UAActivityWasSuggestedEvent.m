@interface UAActivityWasSuggestedEvent
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (UAActivityWasSuggestedEvent)initWithAnalyticsInfo:(id)a3;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (void)sendEvent;
- (void)setActivityType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation UAActivityWasSuggestedEvent

- (UAActivityWasSuggestedEvent)initWithAnalyticsInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UAActivityWasSuggestedEvent;
  v5 = -[UAActivityWasSuggestedEvent init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 activityType]);
    -[UAActivityWasSuggestedEvent setActivityType:](v5, "setActivityType:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[UAActivityWasSuggestedEvent setBundleIdentifier:](v5, "setBundleIdentifier:", v7);
  }

  return v5;
}

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.WasSuggested";
}

- (id)eventPayload
{
  v11[0] = @"activityType";
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[UAActivityWasSuggestedEvent reportedActivityType](self, "reportedActivityType"));
  id v4 = (void *)v3;
  if (v3) {
    v5 = (const __CFString *)v3;
  }
  else {
    v5 = @"-";
  }
  v11[1] = @"bundleIdentifier";
  v12[0] = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[UAActivityWasSuggestedEvent bundleIdentifier](self, "bundleIdentifier"));
  v7 = (void *)v6;
  v8 = @"?";
  if (v6) {
    v8 = (const __CFString *)v6;
  }
  v12[1] = v8;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  return v9;
}

- (void)sendEvent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasSuggestedEvent bundleIdentifier](self, "bundleIdentifier"));

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___UAActivityWasSuggestedEvent;
    -[UAAnalyticsEvent sendEvent](&v4, "sendEvent");
  }

- (id)reportedActivityType
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasSuggestedEvent activityType](self, "activityType"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAAnalyticsEvent firstPartyActivityTypeOrUnknown:](self, "firstPartyActivityTypeOrUnknown:", v3));

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