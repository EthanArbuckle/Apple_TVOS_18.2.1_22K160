@interface APSFilterChange
- (APSFilterChange)init;
- (APSFilterChange)initWithChange:(int64_t)a3 triggeringTopic:(id)a4;
- (NSString)triggeringTopic;
- (int64_t)topicGroupChange;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
- (void)setTopicGroupChange:(int64_t)a3;
- (void)setTriggeringTopic:(id)a3;
@end

@implementation APSFilterChange

- (NSString)triggeringTopic
{
  v2 = (char *)self + OBJC_IVAR___APSFilterChange_triggeringTopic;
  swift_beginAccess((char *)self + OBJC_IVAR___APSFilterChange_triggeringTopic, v6, 0LL, 0LL);
  uint64_t v3 = *((void *)v2 + 1);
  if (!v3) {
    return (NSString *)0LL;
  }
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setTriggeringTopic:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APSFilterChange_triggeringTopic);
  swift_beginAccess(v7, v9, 1LL, 0LL);
  uint64_t v8 = v7[1];
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (int64_t)topicGroupChange
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___APSFilterChange_topicGroupChange);
  swift_beginAccess((char *)self + OBJC_IVAR___APSFilterChange_topicGroupChange, v4, 0LL, 0LL);
  return *v2;
}

- (void)setTopicGroupChange:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___APSFilterChange_topicGroupChange);
  swift_beginAccess((char *)self + OBJC_IVAR___APSFilterChange_topicGroupChange, v5, 1LL, 0LL);
  *uint64_t v4 = a3;
}

- (unint64_t)reason
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___APSFilterChange_reason);
  swift_beginAccess((char *)self + OBJC_IVAR___APSFilterChange_reason, v4, 0LL, 0LL);
  return *v2;
}

- (void)setReason:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___APSFilterChange_reason);
  swift_beginAccess((char *)self + OBJC_IVAR___APSFilterChange_reason, v5, 1LL, 0LL);
  *uint64_t v4 = a3;
}

- (APSFilterChange)initWithChange:(int64_t)a3 triggeringTopic:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  return (APSFilterChange *)sub_1000B1748(a3, v5, v6);
}

- (APSFilterChange)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterChange_triggeringTopic);
  void *v2 = 0LL;
  v2[1] = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterChange_topicGroupChange) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterChange_reason) = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FilterChange();
  return -[APSFilterChange init](&v4, "init");
}

- (void).cxx_destruct
{
}

@end