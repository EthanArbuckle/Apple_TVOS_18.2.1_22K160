@interface DatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC25ASOctaneSupportXPCService13DatabaseStore)init;
- (_TtC25ASOctaneSupportXPCService13DatabaseStore)initWithDatabase:(id)a3;
@end

@implementation DatabaseStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return (SQLiteDatabaseStoreDescriptor *)v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  char v5 = sub_1001B3150(v4);

  return v5 & 1;
}

- (_TtC25ASOctaneSupportXPCService13DatabaseStore)initWithDatabase:(id)a3
{
  return (_TtC25ASOctaneSupportXPCService13DatabaseStore *)sub_1001B72FC(a3);
}

- (_TtC25ASOctaneSupportXPCService13DatabaseStore)init
{
  return (_TtC25ASOctaneSupportXPCService13DatabaseStore *)sub_1001B736C();
}

@end