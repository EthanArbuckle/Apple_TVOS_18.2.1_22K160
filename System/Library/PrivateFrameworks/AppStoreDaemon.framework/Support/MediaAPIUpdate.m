@interface MediaAPIUpdate
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isManagedAccount;
- (BOOL)isOffloaded;
- (BOOL)isPerDevice;
- (NSNumber)evid;
- (NSNumber)itemIdentifier;
- (NSString)bundleID;
- (NSString)buyParams;
- (NSString)description;
- (NSString)parentalControlsName;
- (_TtC9appstored14MediaAPIUpdate)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3;
- (int64_t)itemID;
- (int64_t)parentalControlsRank;
- (int64_t)softwarePlatform;
- (int64_t)updateState;
- (void)setBundleID:(id)a3;
- (void)setEvid:(id)a3;
- (void)setItemID:(int64_t)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation MediaAPIUpdate

- (_TtC9appstored14MediaAPIUpdate)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  return (_TtC9appstored14MediaAPIUpdate *)sub_100070FB8(a3, v7, v8);
}

+ (Class)databaseEntityClass
{
  uint64_t v2 = type metadata accessor for MediaAPIUpdateEntity();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

+ (id)defaultProperties
{
  return Array._bridgeToObjectiveC()().super.isa;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_100071244();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)bundleID
{
  uint64_t v2 = self;
  sub_100070EF0();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)setBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  NSString v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___bundleID);
  uint64_t v6 = *(int64_t *)((char *)&self->super._databaseID
                         + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___bundleID);
  *NSString v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (NSNumber)evid
{
  uint64_t v2 = self;
  uint64_t v3 = sub_100070E2C();

  return (NSNumber *)v3;
}

- (void)setEvid:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___evid);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___evid) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isManagedAccount
{
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = (unint64_t)sub_1001E2698(v2, (uint64_t)v3);

  return (v4 >> 4) & 1;
}

- (BOOL)isOffloaded
{
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = (unint64_t)sub_1001E2698(v2, (uint64_t)v3);

  return (v4 >> 2) & 1;
}

- (BOOL)isPerDevice
{
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = (unint64_t)sub_1001E2698(v2, (uint64_t)v3);

  return (v4 >> 3) & 1;
}

- (int64_t)itemID
{
  uint64_t v2 = self;
  id v3 = sub_1000708AC();

  return (int64_t)v3;
}

- (void)setItemID:(int64_t)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___itemID;
  *(void *)id v3 = a3;
  v3[8] = 0;
}

- (int64_t)updateState
{
  uint64_t v2 = self;
  id v3 = sub_100070DA8();

  return (int64_t)v3;
}

- (void)setUpdateState:(int64_t)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___updateState;
  *(void *)id v3 = a3;
  v3[8] = 0;
}

- (void).cxx_destruct
{
  sub_1000744EC(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___metadataDictionary));
  sub_1000744EC(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___platformSpecificAttributesDictionary));
  swift_bridgeObjectRelease(*(int64_t *)((char *)&self->super._databaseID
                                              + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___bundleID));
  sub_100074520( *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___metadata),  *(int64_t *)((char *)&self->super._databaseID + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___metadata));
}

- (NSString)buyParams
{
  uint64_t v2 = self;
  sub_1000733C4();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (int64_t)softwarePlatform
{
  return 1LL;
}

- (NSString)parentalControlsName
{
  uint64_t v2 = self;
  uint64_t v3 = sub_100071768();
  if (v3)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = sub_1001DF5F4(v3, v4);

    if (v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      uint64_t v7 = v6;

      uint64_t v3 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v7);
    }

    else
    {

      uint64_t v3 = 0LL;
    }
  }

  else
  {
  }

  return (NSString *)v3;
}

- (int64_t)parentalControlsRank
{
  uint64_t v2 = self;
  uint64_t v3 = sub_100071768();
  if (v3)
  {
    NSString v4 = v3;
    id v5 = (_TtC9appstored14MediaAPIUpdate *)String._bridgeToObjectiveC()();
    id v6 = sub_1001DF450(v4, v5, 0LL);

    uint64_t v2 = v5;
  }

  else
  {
    id v6 = 0LL;
  }

  return (int64_t)v6;
}

- (NSNumber)itemIdentifier
{
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  Class isa = (Class)sub_1001E25D0(v2, (uint64_t)v3);

  if (!isa)
  {
    sub_10001517C(0LL, (unint64_t *)&qword_100458228, &OBJC_CLASS___NSNumber_ptr);
    Class isa = NSNumber.init(integerLiteral:)(0LL).super.super.isa;
  }

  return (NSNumber *)isa;
}

- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  NSString v4 = self;
  id v5 = sub_10007385C(v3);

  return v5;
}

@end