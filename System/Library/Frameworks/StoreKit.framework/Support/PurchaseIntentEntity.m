@interface PurchaseIntentEntity
+ (id)databaseTable;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)init;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation PurchaseIntentEntity

+ (id)databaseTable
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8);
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity *)sub_1000B195C(v5, a4);
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity *)sub_1000B1A50(a3, a4);
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)init
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity *)sub_1000B1AE0((uint64_t (*)(void))type metadata accessor for PurchaseIntentEntity);
}

@end