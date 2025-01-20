@interface AppInstallsDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)activeInstallForBundleID:(id)a3;
+ (id)storeDescriptor;
- (void)modifyUsingTransaction:(id)a3;
- (void)readUsingSession:(id)a3;
@end

@implementation AppInstallsDatabaseStore

+ (id)activeInstallForBundleID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v5 = v4;
  v6 = (void *)sub_10002A518(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

+ (id)storeDescriptor
{
  v2 = objc_alloc(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AppInstallsDatabaseSession, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AppInstallsDatabaseTransaction, v5);
  return sub_1002D875C(v2, @"app_installs", &off_10040DFA8, v4, v6);
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  return sub_100309944((uint64_t)&OBJC_CLASS___AppInstallsDatabaseSchema, a3);
}

- (void)modifyUsingTransaction:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1002EED7C;
  v5[3] = &unk_1003F2450;
  uint64_t v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___AppInstallsDatabaseStore;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[SQLiteDatabaseStore modifyUsingTransaction:](&v4, "modifyUsingTransaction:", v5);
}

- (void)readUsingSession:(id)a3
{
  v6[1] = 3221225472LL;
  v6[2] = sub_1002EF9EC;
  v6[3] = &unk_1003F2478;
  id v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AppInstallsDatabaseStore;
  v6[0] = _NSConcreteStackBlock;
  id v4 = v7;
  -[SQLiteDatabaseStore readUsingSession:](&v5, "readUsingSession:", v6);
}

@end