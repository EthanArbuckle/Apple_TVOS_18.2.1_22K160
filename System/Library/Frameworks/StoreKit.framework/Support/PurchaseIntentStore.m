@interface PurchaseIntentStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)init;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)initWithDatabase:(id)a3;
@end

@implementation PurchaseIntentStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return (SQLiteDatabaseStoreDescriptor *)sub_1000B0F84();
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  char v5 = sub_1000B1054(v4);

  return v5 & 1;
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)initWithDatabase:(id)a3
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore *)sub_1000B14DC(a3);
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)init
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore *)sub_1000B1AE0((uint64_t (*)(void))type metadata accessor for PurchaseIntentStore);
}

@end