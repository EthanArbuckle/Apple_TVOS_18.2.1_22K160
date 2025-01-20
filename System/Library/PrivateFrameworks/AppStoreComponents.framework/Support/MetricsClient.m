@interface MetricsClient
- (_TtC19appstorecomponentsd13MetricsClient)init;
- (void)logErrorMessage:(id)a3;
- (void)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5 withReplyHandler:(id)a6;
- (void)processViewRenderWithPredicate:(id)a3 withReplyHandler:(id)a4;
- (void)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5 withReplyHandler:(id)a6;
- (void)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6 withReplyHandler:(id)a7;
@end

@implementation MetricsClient

- (void)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5 withReplyHandler:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  uint64_t v11 = swift_allocObject(&unk_100125118, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_1000C2718(v12, (uint64_t)a4, a5, (uint64_t)sub_100044794, v11);

  swift_release(v11);
  swift_bridgeObjectRelease(a4);
}

- (void)processViewRenderWithPredicate:(id)a3 withReplyHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1000C5420(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5 withReplyHandler:(id)a6
{
  v10 = _Block_copy(a6);
  unint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  unint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject(&unk_100124F88, 24LL, 7LL);
  *(void *)(v17 + 16) = v10;
  id v18 = a5;
  v19 = self;
  sub_1000C3440(v11, v13, v14, v16, v18, (uint64_t)sub_100044794, v17);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v16);
  swift_release(v17);
}

- (void)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6 withReplyHandler:(id)a7
{
  uint64_t v12 = _Block_copy(a7);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = v17;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v21 = v20;
  uint64_t v22 = swift_allocObject(&unk_100124F10, 24LL, 7LL);
  *(void *)(v22 + 16) = v12;
  id v23 = a6;
  v24 = self;
  sub_1000C3894(v13, v15, v16, v18, v19, v21, v23, (uint64_t)sub_100044014, v22);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);
  swift_release(v22);
}

- (void)logErrorMessage:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v5 = self;
  sub_1000C3D44(v4);

  swift_bridgeObjectRelease(v4);
}

- (_TtC19appstorecomponentsd13MetricsClient)init
{
  result = (_TtC19appstorecomponentsd13MetricsClient *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.MetricsClient",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsPipeline;
  uint64_t v6 = type metadata accessor for MetricsPipeline(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  sub_100029F4C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsService));
  sub_100029F4C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsLogger));
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_signpostExtractor));
}

@end