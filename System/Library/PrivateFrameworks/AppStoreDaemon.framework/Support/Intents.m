@interface Intents
- (_TtC9appstored7Intents)init;
- (id)intentUsageWithDateInterval:(id)a3 logKey:(id)a4;
@end

@implementation Intents

- (id)intentUsageWithDateInterval:(id)a3 logKey:(id)a4
{
  uint64_t v7 = type metadata accessor for DateInterval(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a3);
  id v11 = a4;
  v12 = self;
  sub_100074F14((unint64_t)v10, v11);
  uint64_t v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (!v14) {
    return 0LL;
  }
  sub_10001517C(0LL, &qword_100459E10, off_1003D9DE8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

- (_TtC9appstored7Intents)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Intents();
  return -[Intents init](&v3, "init");
}

@end