@interface TransactionEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
- (_TtC25ASOctaneSupportXPCService17TransactionEntity)init;
- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation TransactionEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

+ (Class)memoryEntityClass
{
  uint64_t v2 = sub_1000C0AB8();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  sub_10011DD7C(v5, a4);
  return result;
}

- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return result;
}

- (_TtC25ASOctaneSupportXPCService17TransactionEntity)init
{
  return (_TtC25ASOctaneSupportXPCService17TransactionEntity *)sub_10011DEDC();
}

@end