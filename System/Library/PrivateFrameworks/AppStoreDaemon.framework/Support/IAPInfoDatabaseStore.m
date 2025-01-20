@interface IAPInfoDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation IAPInfoDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___IAPInfoDatabaseSession, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IAPInfoDatabaseTransaction, v5);
  return sub_1002D875C(v2, @"iap_info", &off_10040DD68, v4, v6);
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_1001E89C4((uint64_t)a3, 13003LL, &stru_1003EB8F0, 0);
  }
  else {
    return 0;
  }
}

@end