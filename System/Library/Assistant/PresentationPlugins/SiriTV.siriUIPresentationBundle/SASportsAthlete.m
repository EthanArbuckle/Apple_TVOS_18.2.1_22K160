@interface SASportsAthlete
- (id)siritv_firstMetadata;
- (id)siritv_monogramNamesWithLocale:(id)a3;
@end

@implementation SASportsAthlete

- (id)siritv_monogramNamesWithLocale:(id)a3
{
  uint64_t v5 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v5);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
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
  v13 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_50FF4();

  sub_1C6D8((uint64_t)v9);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13, v15, v16, v17, v18, v19, v20, v21, v23[0], v23[1]);
  return isa;
}

- (id)siritv_firstMetadata
{
  v2 = self;
  id v3 = sub_511EC();

  return v3;
}

@end