@interface StorefrontStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)init;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)initWithDatabase:(id)a3;
@end

@implementation StorefrontStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return (SQLiteDatabaseStoreDescriptor *)sub_100128A0C();
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  char v5 = sub_100128ADC(v4);

  return v5 & 1;
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)initWithDatabase:(id)a3
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore *)sub_100128EF0(a3);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)init
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore *)sub_100129228( 0LL,  type metadata accessor for StorefrontStore);
}

@end