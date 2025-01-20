@interface StoreKitExternalGateway
+ (_TtC9appstored23StoreKitExternalGateway)shared;
- (_TtC9appstored23StoreKitExternalGateway)init;
- (void)handleExternalPurchaseTokenInfoDictionary:(id)a3 bundleID:(id)a4;
@end

@implementation StoreKitExternalGateway

+ (_TtC9appstored23StoreKitExternalGateway)shared
{
  if (qword_100458048 != -1) {
    swift_once(&qword_100458048, sub_10002BC6C);
  }
  return (_TtC9appstored23StoreKitExternalGateway *)(id)qword_1004628D0;
}

- (void)handleExternalPurchaseTokenInfoDictionary:(id)a3 bundleID:(id)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v9 = v8;
  v10 = self;
  sub_10002BCD8(v6, v7, v9);

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v9);
}

- (_TtC9appstored23StoreKitExternalGateway)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[StoreKitExternalGateway init](&v3, "init");
}

@end