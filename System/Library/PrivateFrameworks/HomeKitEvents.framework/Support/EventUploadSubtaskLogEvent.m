@interface EventUploadSubtaskLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC11homeeventsd26EventUploadSubtaskLogEvent)init;
- (_TtC11homeeventsd26EventUploadSubtaskLogEvent)initWithStartTime:(double)a3;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation EventUploadSubtaskLogEvent

- (_TtC11homeeventsd26EventUploadSubtaskLogEvent)init
{
  result = (_TtC11homeeventsd26EventUploadSubtaskLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.EventUploadSubtaskLogEvent",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC11homeeventsd26EventUploadSubtaskLogEvent)initWithStartTime:(double)a3
{
  result = (_TtC11homeeventsd26EventUploadSubtaskLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.EventUploadSubtaskLogEvent",  38LL,  "init(startTime:)",  16LL,  0LL);
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
  unint64_t v3 = sub_100025904();

  sub_10001123C();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0LL;
}

@end