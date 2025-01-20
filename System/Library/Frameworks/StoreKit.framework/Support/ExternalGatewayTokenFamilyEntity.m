@interface ExternalGatewayTokenFamilyEntity
+ (id)databaseTable;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)init;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation ExternalGatewayTokenFamilyEntity

+ (id)databaseTable
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8);
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity *)sub_1000C0B60( v5,  a4);
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity *)sub_1000C0C64( a3,  a4);
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)init
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity *)sub_1000C0CF4();
}

@end