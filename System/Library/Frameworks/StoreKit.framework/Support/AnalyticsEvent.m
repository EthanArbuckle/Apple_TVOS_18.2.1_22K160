@interface AnalyticsEvent
+ (NSString)name;
+ (void)sendLazy:(id)a3;
- (BOOL)canCreatePayload;
- (NSDictionary)payload;
- (NSString)eventName;
- (_TtC9storekitd14AnalyticsEvent)init;
- (id)createPayload;
@end

@implementation AnalyticsEvent

+ (void)sendLazy:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1002ED0A8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  swift_getObjCClassMetadata(a1);
  sub_1000CD42C((uint64_t)sub_1000CEF5C, v5);
  swift_release(v5);
}

- (NSDictionary)payload
{
  v2 = self;
  uint64_t v3 = sub_1000CD640();

  sub_1000CEDDC();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

+ (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE000000000000000LL);
  return (NSString *)v2;
}

- (_TtC9storekitd14AnalyticsEvent)init
{
  return result;
}

- (BOOL)canCreatePayload
{
  return 1;
}

- (id)createPayload
{
  NSString v2 = self;
  uint64_t v3 = sub_1000CDEB0();

  if (v3)
  {
    sub_1000CEDDC();
    v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    v4.super.Class isa = 0LL;
  }

  return v4.super.isa;
}

- (NSString)eventName
{
  NSString v2 = self;
  sub_1000CDF74();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end