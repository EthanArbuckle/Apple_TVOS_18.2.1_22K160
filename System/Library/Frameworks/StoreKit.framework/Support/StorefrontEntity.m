@interface StorefrontEntity
+ (id)databaseTable;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)init;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation StorefrontEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8);
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity *)sub_1001290A4(v5, a4);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity *)sub_100129198(a3, a4);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)init
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity *)sub_100129228( 0LL,  type metadata accessor for StorefrontEntity);
}

@end