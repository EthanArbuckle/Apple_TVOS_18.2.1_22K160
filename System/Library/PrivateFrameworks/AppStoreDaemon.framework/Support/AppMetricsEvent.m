@interface AppMetricsEvent
+ (Class)databaseEntityClass;
- (AppMetricsEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)engagementData;
@end

@implementation AppMetricsEvent

- (AppMetricsEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppMetricsEvent;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)engagementData
{
  if (a1) {
    a1 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForProperty:@"payload"]);
  }
  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AppMetricsEvent;
  id v5 = -[SQLiteMemoryEntity copyWithZone:](&v13, "copyWithZone:");
  v6 = v5;
  if (self)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", @"bundle_id"));
    sub_1001B6140(v6, v7);

    unsigned __int8 v8 = sub_1001E2698(self, (uint64_t)@"event_type");
  }

  else
  {
    sub_1001B6140(v5, 0LL);
    unsigned __int8 v8 = 0;
  }

  sub_1001B61EC(v6, v8);
  id v9 = -[AppMetricsEvent engagementData]_0(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 copyWithZone:a3];
  sub_1001B62A4(v6, v11);

  return v6;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppMetricsEventEntity, a2);
}

- (void).cxx_destruct
{
}

@end