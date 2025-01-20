@interface CloudUploadVolumeLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC11homeeventsd25CloudUploadVolumeLogEvent)init;
- (_TtC11homeeventsd25CloudUploadVolumeLogEvent)initWithStartTime:(double)a3;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation CloudUploadVolumeLogEvent

- (_TtC11homeeventsd25CloudUploadVolumeLogEvent)init
{
  result = (_TtC11homeeventsd25CloudUploadVolumeLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.CloudUploadVolumeLogEvent",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC11homeeventsd25CloudUploadVolumeLogEvent)initWithStartTime:(double)a3
{
  result = (_TtC11homeeventsd25CloudUploadVolumeLogEvent *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.CloudUploadVolumeLogEvent",  37LL,  "init(startTime:)",  16LL,  0LL);
  __break(1u);
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  unint64_t v3 = sub_100011278();

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