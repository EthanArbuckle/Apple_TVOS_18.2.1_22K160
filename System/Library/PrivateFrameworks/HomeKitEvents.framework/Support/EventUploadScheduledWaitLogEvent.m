@interface EventUploadScheduledWaitLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC11homeeventsd32EventUploadScheduledWaitLogEvent)init;
- (_TtC11homeeventsd32EventUploadScheduledWaitLogEvent)initWithStartTime:(double)a3;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation EventUploadScheduledWaitLogEvent

- (_TtC11homeeventsd32EventUploadScheduledWaitLogEvent)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  self->HMMLogEvent_opaque[OBJC_IVAR____TtC11homeeventsd32EventUploadScheduledWaitLogEvent_outcome] = 4;
  uint64_t v4 = OBJC_IVAR____TtC11homeeventsd32EventUploadScheduledWaitLogEvent_metricsManager;
  type metadata accessor for MetricsManager(0LL);
  v5 = self;
  *(void *)&self->HMMLogEvent_opaque[v4] = static MetricsManager.sharedInstance.getter();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[EventUploadScheduledWaitLogEvent init](&v7, "init");
}

- (_TtC11homeeventsd32EventUploadScheduledWaitLogEvent)initWithStartTime:(double)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  self->HMMLogEvent_opaque[OBJC_IVAR____TtC11homeeventsd32EventUploadScheduledWaitLogEvent_outcome] = 4;
  uint64_t v6 = OBJC_IVAR____TtC11homeeventsd32EventUploadScheduledWaitLogEvent_metricsManager;
  type metadata accessor for MetricsManager(0LL);
  objc_super v7 = self;
  *(void *)&self->HMMLogEvent_opaque[v6] = static MetricsManager.sharedInstance.getter();

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return -[EventUploadScheduledWaitLogEvent initWithStartTime:](&v9, "initWithStartTime:", a3);
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
  sub_100059884();
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