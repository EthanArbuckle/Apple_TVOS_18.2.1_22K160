@interface ExternalGatewayTokenFamilyStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)init;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)initWithDatabase:(id)a3;
@end

@implementation ExternalGatewayTokenFamilyStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return (SQLiteDatabaseStoreDescriptor *)sub_1000C0568();
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  char v5 = sub_1000C0638(v4);

  return v5 & 1;
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)initWithDatabase:(id)a3
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore *)sub_1000C0A6C(a3);
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)init
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore *)sub_1000C0CF4();
}

@end