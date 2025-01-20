@interface SASportsTeam
- (id)siritv_abbreviatedName:(id)a3;
- (id)siritv_firstMetadata;
- (id)siritv_monogram:(id)a3;
@end

@implementation SASportsTeam

- (id)siritv_firstMetadata
{
  v2 = self;
  sub_665E4();
  v4 = v3;

  return v4;
}

- (id)siritv_monogram:(id)a3
{
  uint64_t v5 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
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
  sub_66704();
  v14 = v13;

  sub_1C6D8((uint64_t)v9);
  if (!v14) {
    return 0LL;
  }
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14, v16, v17, v18, v19, v20, v21, v22);
  return v15;
}

- (id)siritv_abbreviatedName:(id)a3
{
  uint64_t v5 = sub_9E24(&qword_E0F80);
  __chkstk_darwin(v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
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
  sub_66814((uint64_t)v9);
  v14 = v13;

  sub_1C6D8((uint64_t)v9);
  if (!v14) {
    return 0LL;
  }
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14, v16, v17, v18, v19, v20, v21, v22);
  return v15;
}

@end