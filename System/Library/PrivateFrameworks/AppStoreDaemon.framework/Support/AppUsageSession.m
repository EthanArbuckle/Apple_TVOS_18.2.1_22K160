@interface AppUsageSession
+ (Class)databaseEntityClass;
- (AppUsageSession)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppUsageSession

- (AppUsageSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppUsageSession;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)description
{
  id v3 = sub_1001D2DA0(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001D2DC4(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_1001D2DE8(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_1001E83D8(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ bundleID: %@ sessionReporterKey: %@ lastRefresh: %@ expired: %d }",  v4,  v6,  v10,  sub_1001D2E54(self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppUsageSession;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppUsageSessionEntity, a2);
}

@end