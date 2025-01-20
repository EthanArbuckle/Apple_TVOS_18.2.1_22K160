@interface BaseManualSyncEvent
+ (NSString)baseName;
- (NSString)app;
- (_TtC9storekitd19BaseManualSyncEvent)init;
- (void)configureWithClient:(id)a3;
- (void)setApp:(id)a3;
@end

@implementation BaseManualSyncEvent

+ (NSString)baseName
{
  return (NSString *)sub_1000CE8A8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000CDF98);
}

- (NSString)app
{
  if (v2)
  {
    uint64_t v3 = v2;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    NSString v4 = 0LL;
  }

  return (NSString *)v4;
}

- (void)setApp:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = self;
  sub_1000CE080(v4, v6);
}

- (void)configureWithClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000CE08C((uint64_t)v4);
}

- (_TtC9storekitd19BaseManualSyncEvent)init
{
  return result;
}

- (void).cxx_destruct
{
}

@end