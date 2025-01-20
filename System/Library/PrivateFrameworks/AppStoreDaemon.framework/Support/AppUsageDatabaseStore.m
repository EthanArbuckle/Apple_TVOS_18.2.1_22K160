@interface AppUsageDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation AppUsageDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AppUsageDatabaseSession, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AppUsageDatabaseTransaction, v5);
  return sub_1002D875C(v2, @"app_usage", &off_10040DF78, v4, v6);
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_1001E89C4((uint64_t)a3, 17001LL, &stru_1003F0E40, 0);
  }
  else {
    return 0;
  }
}

@end