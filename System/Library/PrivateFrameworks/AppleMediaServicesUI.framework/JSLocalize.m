@interface JSLocalize
- (_TtC14amsengagementd10JSLocalize)init;
- (id)nativeString:(id)a3;
@end

@implementation JSLocalize

- (id)nativeString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10009A414(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v10 = 0LL;
  }

  return v10;
}

- (_TtC14amsengagementd10JSLocalize)init
{
  return (_TtC14amsengagementd10JSLocalize *)sub_10009A518();
}

@end