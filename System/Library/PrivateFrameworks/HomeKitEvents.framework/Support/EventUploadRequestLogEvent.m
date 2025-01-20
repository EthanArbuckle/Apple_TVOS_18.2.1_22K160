@interface EventUploadRequestLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC11homeeventsd26EventUploadRequestLogEvent)init;
- (_TtC11homeeventsd26EventUploadRequestLogEvent)initWithStartTime:(double)a3;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation EventUploadRequestLogEvent

- (_TtC11homeeventsd26EventUploadRequestLogEvent)init
{
  result = (_TtC11homeeventsd26EventUploadRequestLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.EventUploadRequestLogEvent",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC11homeeventsd26EventUploadRequestLogEvent)initWithStartTime:(double)a3
{
  result = (_TtC11homeeventsd26EventUploadRequestLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.EventUploadRequestLogEvent",  38LL,  "init(startTime:)",  16LL,  0LL);
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
  unint64_t v3 = sub_1000419F0();

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