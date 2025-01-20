@interface Transaction
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (_TtC25ASOctaneSupportXPCService11Transaction)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (id)copyWithZone:(void *)a3;
@end

@implementation Transaction

+ (Class)databaseEntityClass
{
  uint64_t v2 = sub_1000B8300();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

+ (id)defaultProperties
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1000B9A68((uint64_t)a3, v9);

  uint64_t v5 = v10;
  v6 = sub_100019F58(v9, v10);
  v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  sub_100019F7C(v9);
  return v7;
}

- (_TtC25ASOctaneSupportXPCService11Transaction)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  return result;
}

- (void).cxx_destruct
{
  sub_1000BB994(*(int64_t *)((char *)&self->super._databaseID
                                  + OBJC_IVAR____TtC25ASOctaneSupportXPCService11Transaction____lazy_storage___productID));
}

@end