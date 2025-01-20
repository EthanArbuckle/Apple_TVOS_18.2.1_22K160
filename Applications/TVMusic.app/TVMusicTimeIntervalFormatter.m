@interface TVMusicTimeIntervalFormatter
- (TVMusicTimeIntervalFormatter)init;
- (TVMusicTimeIntervalFormatter)initWithMinutesFormat:(id)a3 hoursFormat:(id)a4 daysFormat:(id)a5 weeksFormat:(id)a6;
- (id)stringForTimeInterval:(double)a3;
@end

@implementation TVMusicTimeIntervalFormatter

- (TVMusicTimeIntervalFormatter)initWithMinutesFormat:(id)a3 hoursFormat:(id)a4 daysFormat:(id)a5 weeksFormat:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v18 = v17;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___TVMusicTimeIntervalFormatter_minutesFormat);
  uint64_t *v20 = v10;
  v20[1] = v12;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR___TVMusicTimeIntervalFormatter_hoursFormat);
  uint64_t *v21 = v13;
  v21[1] = v15;
  v22 = (uint64_t *)((char *)self + OBJC_IVAR___TVMusicTimeIntervalFormatter_daysFormat);
  uint64_t *v22 = v16;
  v22[1] = v18;
  v23 = (uint64_t *)((char *)self + OBJC_IVAR___TVMusicTimeIntervalFormatter_weeksFormat);
  uint64_t *v23 = v19;
  v23[1] = v24;
  v26.receiver = self;
  v26.super_class = (Class)type metadata accessor for TimeIntervalFormatter();
  return -[TVMusicTimeIntervalFormatter init](&v26, "init");
}

- (id)stringForTimeInterval:(double)a3
{
  v4 = self;
  sub_10016EDFC(a3);
  uint64_t v6 = v5;

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (TVMusicTimeIntervalFormatter)init
{
  result = (TVMusicTimeIntervalFormatter *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.TimeIntervalFormatter",  29LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end