@interface PARBagConfigFactory
- (_TtC7parsecdP33_A71F4EB6BEA682B89431D07BAC0060AE19PARBagConfigFactory)init;
- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5;
- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5;
@end

@implementation PARBagConfigFactory

- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  v15 = self;
  id v16 = a5;
  id v17 = sub_1000C4868((uint64_t)v12, v13, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v15 = v14;

  if (v11)
  {
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v18 = v17;
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v18 = 0LL;
  }

  id v19 = sub_1000C4A14(v13, v15, v16, v18, v12);
  swift_bridgeObjectRelease();
  sub_100010A30(v13, v15);

  return v19;
}

- (_TtC7parsecdP33_A71F4EB6BEA682B89431D07BAC0060AE19PARBagConfigFactory)init
{
  return (_TtC7parsecdP33_A71F4EB6BEA682B89431D07BAC0060AE19PARBagConfigFactory *)sub_1000C4B68();
}

@end