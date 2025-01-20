@interface SASportsMatchup
- (id)siritv_additionalLineTotals:(id)a3;
- (id)siritv_inProgressStatusDescription:(id)a3;
@end

@implementation SASportsMatchup

- (id)siritv_additionalLineTotals:(id)a3
{
  uint64_t v4 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
    uint64_t v9 = type metadata accessor for Locale(0LL);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = type metadata accessor for Locale(0LL);
    uint64_t v10 = 1LL;
  }

  sub_9E64((uint64_t)v8, v10, 1LL, v9);
  sub_A068((uint64_t)v8, &qword_E0F80);
  type metadata accessor for LineScore();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  return isa;
}

- (id)siritv_inProgressStatusDescription:(id)a3
{
  uint64_t v5 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3, v6, v7);
    uint64_t v10 = type metadata accessor for Locale(0LL);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v10 = type metadata accessor for Locale(0LL);
    uint64_t v11 = 1LL;
  }

  sub_9E64((uint64_t)v9, v11, 1LL, v10);
  v12 = self;
  sub_4213C((uint64_t)v12);
  uint64_t v14 = v13;

  sub_A068((uint64_t)v9, &qword_E0F80);
  if (!v14) {
    return 0LL;
  }
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  return v15;
}

@end