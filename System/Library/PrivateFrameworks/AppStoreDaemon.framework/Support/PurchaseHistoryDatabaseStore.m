@interface PurchaseHistoryDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation PurchaseHistoryDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PurchaseHistoryDatabaseSession, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PurchaseHistoryDatabaseTransaction, v5);
  return sub_1002D875C(v2, @"purchase_history", &off_10040DF18, v4, v6);
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_1001E89C4((uint64_t)a3, 17000LL, &stru_1003F0940, 0);
  }
  else {
    return 0;
  }
}

@end