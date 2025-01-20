@interface SASportsEntity
- (id)siritv_abbreviatedName:(id)a3;
- (id)siritv_firstMetadata;
- (id)siritv_monogram:(id)a3;
- (id)siritv_monogramNamesWithLocale:(id)a3;
@end

@implementation SASportsEntity

- (id)siritv_firstMetadata
{
  return 0LL;
}

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
  v13 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_52904((uint64_t)v9);

  sub_22EC4((uint64_t)v9, &qword_E0F80);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13, v15, v16, v17, v18, v19, v20, v21, v23[0], v23[1]);
  return isa;
}

- (id)siritv_monogram:(id)a3
{
  return sub_5309C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_52D10);
}

- (id)siritv_abbreviatedName:(id)a3
{
  return sub_5309C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_52FA8);
}

@end