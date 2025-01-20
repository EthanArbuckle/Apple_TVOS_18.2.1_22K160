@interface ODRDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
- (void)modifyUsingTransaction:(id)a3;
@end

@implementation ODRDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___ODRDatabaseSession, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ODRDatabaseTransaction, v5);
  return sub_1002D875C(v2, @"on_demand_resources", &off_10040DD38, v4, v6);
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_1001E89C4((uint64_t)a3, 14000LL, &stru_1003EAD20, 0);
  }
  else {
    return 0;
  }
}

- (void)modifyUsingTransaction:(id)a3
{
  v6[1] = 3221225472LL;
  v6[2] = sub_1001B563C;
  v6[3] = &unk_1003EAD48;
  id v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ODRDatabaseStore;
  v6[0] = _NSConcreteStackBlock;
  id v4 = v7;
  -[SQLiteDatabaseStore modifyUsingTransaction:](&v5, "modifyUsingTransaction:", v6);
}

@end