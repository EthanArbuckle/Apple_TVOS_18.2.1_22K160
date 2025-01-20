@interface JSPrivacy
- (_TtC14amsengagementd9JSPrivacy)init;
- (id)acknowledgementNeededForPrivacyIdentifier:(id)a3 :(id)a4;
@end

@implementation JSPrivacy

- (id)acknowledgementNeededForPrivacyIdentifier:(id)a3 :(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  v9 = self;
  v10 = (void *)sub_1000A74DC(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC14amsengagementd9JSPrivacy)init
{
  return (_TtC14amsengagementd9JSPrivacy *)sub_1000A7C8C();
}

@end