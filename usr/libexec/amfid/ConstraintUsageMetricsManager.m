@interface ConstraintUsageMetricsManager
- (_TtC5amfid29ConstraintUsageMetricsManager)init;
- (void)clean;
- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6;
- (void)report;
@end

@implementation ConstraintUsageMetricsManager

- (_TtC5amfid29ConstraintUsageMetricsManager)init
{
  return (_TtC5amfid29ConstraintUsageMetricsManager *)ConstraintUsageMetricsManager.init()();
}

- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v15 = v14;
  v16 = self;
  v17._countAndFlagsBits = v10;
  v17._object = v12;
  v18._countAndFlagsBits = v13;
  v18._object = v15;
  ConstraintUsageMetricsManager.record(signingIdentifier:teamIdentifier:validationCategory:constraintType:)( v17,  v18,  a5,  a6);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
}

- (void)report
{
  v2 = self;
  ConstraintUsageMetricsManager.report()();
}

- (void)clean
{
  v2 = self;
  ConstraintUsageMetricsManager.clean()();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context);
  swift_release(*(void *)&self->context[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context]);
  swift_release(v3);
  v4 = (char *)self + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

@end