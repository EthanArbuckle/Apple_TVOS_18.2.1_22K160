@interface ProcessLaunchLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC11homeeventsd21ProcessLaunchLogEvent)init;
- (_TtC11homeeventsd21ProcessLaunchLogEvent)initWithStartTime:(double)a3;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation ProcessLaunchLogEvent

- (_TtC11homeeventsd21ProcessLaunchLogEvent)init
{
  result = (_TtC11homeeventsd21ProcessLaunchLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.ProcessLaunchLogEvent",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC11homeeventsd21ProcessLaunchLogEvent)initWithStartTime:(double)a3
{
  result = (_TtC11homeeventsd21ProcessLaunchLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.ProcessLaunchLogEvent",  33LL,  "init(startTime:)",  16LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  sub_100014C58();
  uint64_t v4 = v3;

  sub_10001123C();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSDictionary *)isa;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0LL;
}

@end