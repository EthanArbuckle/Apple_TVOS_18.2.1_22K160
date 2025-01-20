@interface SignpostInterval
- (BOOL)canGenerateCoreAnalyticsPayload;
- (id)coreAnalyticsPayload;
- (id)signpostType;
@end

@implementation SignpostInterval

- (id)signpostType
{
  return @"Interval";
}

- (BOOL)canGenerateCoreAnalyticsPayload
{
  return 1;
}

- (id)coreAnalyticsPayload
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SignpostInterval;
  id v3 = -[SignpostInterval coreAnalyticsPayload](&v25, "coreAnalyticsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    if (sub_1000057D8(self))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval attributes](self, "attributes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BundleIdOverride"]);

      [v4 setObject:v6 forKeyedSubscript:@"StartProcessName"];
      [v4 setObject:v6 forKeyedSubscript:@"EndProcessName"];
      id v7 = sub_100003E84();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100009F84(self);
      }
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval beginEvent](self, "beginEvent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 processImagePath]);
      id v11 = sub_100005024(v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v11);

      if (v6)
      {
        [v4 setObject:v6 forKeyedSubscript:@"StartProcessName"];
      }

      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval beginEvent](self, "beginEvent"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processName]);
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval beginEvent](self, "beginEvent"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 processName]);
          [v4 setObject:v15 forKeyedSubscript:@"StartProcessName"];
        }

        else
        {
          [v4 setObject:@"Unknown" forKeyedSubscript:@"StartProcessName"];
        }
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval endEvent](self, "endEvent"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 processImagePath]);
      id v18 = sub_100005024(v17);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

      if (v8)
      {
        [v4 setObject:v8 forKeyedSubscript:@"EndProcessName"];
      }

      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval endEvent](self, "endEvent"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 processName]);
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval endEvent](self, "endEvent"));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 processName]);
          [v4 setObject:v22 forKeyedSubscript:@"EndProcessName"];
        }

        else
        {
          [v4 setObject:@"Unknown" forKeyedSubscript:@"EndProcessName"];
        }
      }
    }

    id v23 = v4;
  }

  return v4;
}

@end