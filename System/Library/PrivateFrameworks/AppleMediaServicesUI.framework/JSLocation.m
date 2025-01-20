@interface JSLocation
- (_TtC14amsengagementd10JSLocation)init;
- (id)getAuthorizationStatus:(id)a3;
@end

@implementation JSLocation

- (id)getAuthorizationStatus:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_10009A5B8(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC14amsengagementd10JSLocation)init
{
  return (_TtC14amsengagementd10JSLocation *)sub_10009B22C();
}

@end