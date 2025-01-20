@interface AppGroup
+ (BOOL)isALE:(id)a3;
- (_TtC11ReportCrash8AppGroup)init;
@end

@implementation AppGroup

+ (BOOL)isALE:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v5 = v4;
  char v6 = sub_10001DE0C(v3, v4, (uint64_t)&_swiftEmptySetSingleton);
  swift_bridgeObjectRelease(v5);
  return v6 & 1;
}

- (_TtC11ReportCrash8AppGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppGroup();
  return -[AppGroup init](&v3, "init");
}

@end