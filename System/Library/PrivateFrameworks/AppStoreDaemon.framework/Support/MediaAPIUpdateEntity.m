@interface MediaAPIUpdateEntity
+ (Class)memoryEntityClass;
+ (NSString)BOOLeanPropertyMaskKey;
+ (NSString)bundleIDPropertyKey;
+ (NSString)installDatePropertyKey;
+ (NSString)itemIDPropertyKey;
+ (NSString)metadataPropertyKey;
+ (NSString)updateStatePropertyKey;
+ (id)databaseTable;
- (_TtC9appstored20MediaAPIUpdateEntity)init;
- (_TtC9appstored20MediaAPIUpdateEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9appstored20MediaAPIUpdateEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation MediaAPIUpdateEntity

+ (NSString)BOOLeanPropertyMaskKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)bundleIDPropertyKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)installDatePropertyKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)itemIDPropertyKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)metadataPropertyKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)updateStatePropertyKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (id)databaseTable
{
  return String._bridgeToObjectiveC()();
}

+ (Class)memoryEntityClass
{
  uint64_t v2 = type metadata accessor for MediaAPIUpdate();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC9appstored20MediaAPIUpdateEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  id v7 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MediaAPIUpdateEntity();
  v9 = -[SQLiteEntity initWithPropertyValues:onConnection:](&v11, "initWithPropertyValues:onConnection:", isa, v7);

  return v9;
}

- (_TtC9appstored20MediaAPIUpdateEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MediaAPIUpdateEntity();
  return -[SQLiteEntity initWithPersistentID:onConnection:](&v7, "initWithPersistentID:onConnection:", a3, a4);
}

- (_TtC9appstored20MediaAPIUpdateEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaAPIUpdateEntity();
  return -[MediaAPIUpdateEntity init](&v3, "init");
}

@end