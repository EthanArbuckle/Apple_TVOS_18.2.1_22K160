@interface APSServerTimeTracker
- (APSServerTimeTracker)init;
- (NSString)aps_prettyDescription;
- (unint64_t)serverTimeInNanoSeconds;
- (void)updateServerTimeWithTimeInMilliseconds:(unint64_t)a3;
@end

@implementation APSServerTimeTracker

- (unint64_t)serverTimeInNanoSeconds
{
  v2 = self;
  unint64_t v3 = sub_1000ABE14();

  return v3;
}

- (void)updateServerTimeWithTimeInMilliseconds:(unint64_t)a3
{
  v4 = self;
  sub_1000AC2C0(a3);
}

- (NSString)aps_prettyDescription
{
  v2 = self;
  sub_1000AC55C();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (APSServerTimeTracker)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSServerTimeTracker__mostRecentServerTimeInNanoSeconds) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSServerTimeTracker__alignedMonotonicTimeInNanoSeconds) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServerTimeTracker();
  return -[APSServerTimeTracker init](&v3, "init");
}

@end