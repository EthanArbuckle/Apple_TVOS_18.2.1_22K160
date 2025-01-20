@interface TVSMJetAnalyticsReporter
- (_TtC19TVSystemMenuService24TVSMJetAnalyticsReporter)init;
- (void)_didUpdateBaseInfo;
- (void)reportClickEvent:(id)a3 locations:(id)a4;
- (void)reportImpressionsBegin:(id)a3;
- (void)reportImpressionsEnd:(id)a3;
- (void)reportPageEvent:(id)a3;
@end

@implementation TVSMJetAnalyticsReporter

- (_TtC19TVSystemMenuService24TVSMJetAnalyticsReporter)init
{
  return (_TtC19TVSystemMenuService24TVSMJetAnalyticsReporter *)TVSMJetAnalyticsReporter.init()();
}

- (void)_didUpdateBaseInfo
{
  uint64_t v3 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  type metadata accessor for TVSMJetAnalyticsReporter(0LL);
  uint64_t v7 = *(void *)&self->TVSMAnalyticsReporter_opaque[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_eventRecorder];
  v8 = self;
  id v9 = -[TVSMJetAnalyticsReporter baseInfo](v8, "baseInfo");
  sub_10002B8F8(v7, v9, (uint64_t)v6);

  v10 = &v8->TVSMAnalyticsReporter_opaque[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline];
  swift_beginAccess( &v8->TVSMAnalyticsReporter_opaque[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline],  v12,  33LL,  0LL);
  (*(void (**)(unsigned __int8 *, _BYTE *, uint64_t))(v4 + 40))(v10, v6, v3);
  swift_endAccess(v12);
}

- (void)reportClickEvent:(id)a3 locations:(id)a4
{
  uint64_t v7 = sub_100030978(0LL, &qword_100056BC8, &OBJC_CLASS___TVSMLocationAnalytics_ptr);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  id v9 = a3;
  v10 = self;
  TVSMJetAnalyticsReporter.reportClickEvent(_:locations:)(v9, v8);

  swift_bridgeObjectRelease(v8, v11);
}

- (void)reportPageEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  TVSMJetAnalyticsReporter.reportPageEvent(_:)(v4);
}

- (void)reportImpressionsBegin:(id)a3
{
}

- (void)reportImpressionsEnd:(id)a3
{
}

- (void).cxx_destruct
{
  id v4 = &self->TVSMAnalyticsReporter_opaque[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline];
  uint64_t v5 = type metadata accessor for MetricsPipeline(0LL);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  swift_bridgeObjectRelease( *(void *)&self->topic[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor],  v6);
}

@end