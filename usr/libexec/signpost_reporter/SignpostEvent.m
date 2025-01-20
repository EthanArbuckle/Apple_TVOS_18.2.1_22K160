@interface SignpostEvent
- (BOOL)canGenerateCoreAnalyticsPayload;
- (id)coreAnalyticsPayload;
- (id)signpostType;
@end

@implementation SignpostEvent

- (id)signpostType
{
  return @"Event";
}

- (BOOL)canGenerateCoreAnalyticsPayload
{
  return 1;
}

- (id)coreAnalyticsPayload
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SignpostEvent;
  id v3 = -[SignpostEvent coreAnalyticsPayload](&v16, "coreAnalyticsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    if (sub_1000057D8(self))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostEvent attributes](self, "attributes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BundleIdOverride"]);

      [v4 setObject:v6 forKeyedSubscript:@"StartProcessName"];
      id v7 = sub_100003E84();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100009ED4(self);
      }
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostEvent processImagePath](self, "processImagePath"));
      id v10 = sub_100005024(v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (v6)
      {
        [v4 setObject:v6 forKeyedSubscript:@"StartProcessName"];
      }

      else
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SignpostEvent processName](self, "processName"));
        v12 = (void *)v11;
        if (v11) {
          v13 = (const __CFString *)v11;
        }
        else {
          v13 = @"Unknown";
        }
        [v4 setObject:v13 forKeyedSubscript:@"StartProcessName"];
      }
    }

    id v14 = v4;
  }

  return v4;
}

@end