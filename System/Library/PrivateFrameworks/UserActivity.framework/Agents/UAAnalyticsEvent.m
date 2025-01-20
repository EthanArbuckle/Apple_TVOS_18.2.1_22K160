@interface UAAnalyticsEvent
- (id)description;
- (id)eventName;
- (id)eventPayload;
- (id)firstPartyActivityTypeOrUnknown:(id)a3;
@end

@implementation UAAnalyticsEvent

- (id)eventName
{
  return @"com.apple.UserActivity.baseEvent";
}

- (id)eventPayload
{
  return 0LL;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAAnalyticsEvent eventName](self, "eventName"));
  -[NSMutableString appendString:](v3, "appendString:", v4);

  -[NSMutableString appendString:](v3, "appendString:", @" => ");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAAnalyticsEvent eventPayload](self, "eventPayload"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@", v5);

  return v3;
}

- (id)firstPartyActivityTypeOrUnknown:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@":com.apple."] & 1) != 0
    || ([v3 hasPrefix:@"com.apple."] & 1) != 0
    || [v3 isEqualToString:@"NSUserActivityTypeBrowsingWeb"])
  {
    v4 = (__CFString *)v3;
  }

  else
  {
    v4 = @"unknown";
  }

  os_log_t v5 = sub_100039584(@"Diagnostic");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138478083;
    id v9 = v3;
    __int16 v10 = 2113;
    v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Metric AT for %{private}@ is %{private}@",  (uint8_t *)&v8,  0x16u);
  }

  return v4;
}

@end