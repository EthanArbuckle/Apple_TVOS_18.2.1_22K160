@interface JSMetrics
- (_TtC14amsengagementd9JSMetrics)init;
- (id)flush;
- (id)loadIdentifier:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6;
- (id)loadIdentifierFields:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6;
- (void)enqueue:(id)a3 :(id)a4 :(id)a5;
- (void)enqueueBatch:(id)a3 :(id)a4;
@end

@implementation JSMetrics

- (void)enqueue:(id)a3 :(id)a4 :(id)a5
{
  v8 = self;
  sub_1000A1308();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)enqueueBatch:(id)a3 :(id)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v7 = self;
  sub_1000A1718(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)flush
{
  v2 = self;
  v3 = (void *)sub_1000A19BC((uint64_t)v2);

  return v3;
}

- (id)loadIdentifier:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6
{
  return sub_1000A55C0();
}

- (id)loadIdentifierFields:(id)a3 :(id)a4 :(id)a5 :(BOOL)a6
{
  return sub_1000A55C0();
}

- (_TtC14amsengagementd9JSMetrics)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd9JSMetrics_config];
  uint64_t v3 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd9JSMetrics_config + 24];
  swift_bridgeObjectRelease(*(void *)&self->config[OBJC_IVAR____TtC14amsengagementd9JSMetrics_config + 40]);

  swift_bridgeObjectRelease(v3);
}

@end