@interface ManualSyncFinishedEvent
+ (NSString)name;
- (NSString)errorDomain;
- (_TtC9storekitd23ManualSyncFinishedEvent)init;
- (void)configureWithError:(id)a3;
- (void)setErrorDomain:(id)a3;
@end

@implementation ManualSyncFinishedEvent

+ (NSString)name
{
  return (NSString *)sub_1000CE8A8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000CE4C8);
}

- (NSString)errorDomain
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

- (void)setErrorDomain:(id)a3
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
  sub_1000CE5E0(v4, v6, &OBJC_IVAR____TtC9storekitd23ManualSyncFinishedEvent_errorDomain);
}

- (void)configureWithError:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  sub_1000CE5E8((uint64_t)a3);
}

- (_TtC9storekitd23ManualSyncFinishedEvent)init
{
  return result;
}

- (void).cxx_destruct
{
}

@end