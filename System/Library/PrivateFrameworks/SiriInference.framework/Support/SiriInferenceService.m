@interface SiriInferenceService
- (_TtC14siriinferenced20SiriInferenceService)init;
- (void)appSelectedForSearchTermWithRankEventId:(id)a3 selectedAppBundleId:(id)a4 numberOfAppsShown:(int64_t)a5;
- (void)backfillSiriRemembersWithDatabasePath:(id)a3 completionHandler:(id)a4;
- (void)logCoreAnalyticsMetricWithMetricsData:(id)a3;
- (void)overrideDBForIntegrationTestsWithUrl:(id)a3;
- (void)rankAppsForSearchTermWithSearchTerm:(id)a3 maxResults:(int64_t)a4 excludeAppBundleIds:(id)a5 completionHandler:(id)a6;
- (void)saveToSiriRemembersWithInteraction:(id)a3 databasePath:(id)a4 completionHandler:(id)a5;
- (void)searchSiriRemembersV0WithQuery:(id)a3 type:(id)a4 completionHandler:(id)a5;
- (void)waitForBackgroundJobsToFinishWithCompletionHandler:(id)a3;
@end

@implementation SiriInferenceService

- (void)searchSiriRemembersV0WithQuery:(id)a3 type:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject(&unk_100019250, 24LL, 7LL);
  *(void *)(v15 + 16) = v8;
  v16 = self;
  sub_10000EECC(v9, v11, v12, v14, (uint64_t)sub_100010E6C, v15);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  swift_release(v15);
}

- (void)logCoreAnalyticsMetricWithMetricsData:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000F4F8((uint64_t)v4);
}

- (void)saveToSiriRemembersWithInteraction:(id)a3 databasePath:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  _Block_copy(v8);
  uint64_t v11 = (char *)a3;
  uint64_t v12 = self;
  sub_10000F784(v11, v9, (uint64_t)a4, (uint64_t)v12, (void (**)(void, uint64_t))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(a4);
}

- (void)backfillSiriRemembersWithDatabasePath:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v8;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  _Block_copy(v6);
  uint64_t v9 = self;
  sub_10000FEE0(v7, (uint64_t)a3, (uint64_t)v9, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(a3);
}

- (void)overrideDBForIntegrationTestsWithUrl:(id)a3
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = self;
  sub_100010258((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)waitForBackgroundJobsToFinishWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100010404((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
}

- (void)rankAppsForSearchTermWithSearchTerm:(id)a3 maxResults:(int64_t)a4 excludeAppBundleIds:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  &protocol witness table for String);
  uint64_t v15 = swift_allocObject(&unk_100019228, 24LL, 7LL);
  *(void *)(v15 + 16) = v10;
  v16 = self;
  sub_1000104A4(v11, v13, a4, v14, (uint64_t)sub_100010E64, v15);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_release(v15);
}

- (void)appSelectedForSearchTermWithRankEventId:(id)a3 selectedAppBundleId:(id)a4 numberOfAppsShown:(int64_t)a5
{
  uint64_t v9 = sub_100003F80((uint64_t *)&unk_10001DE60);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v12 = type metadata accessor for UUID(0LL);
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v12 = type metadata accessor for UUID(0LL);
    uint64_t v13 = 1LL;
  }

  sub_10000667C((uint64_t)v11, v13, 1LL, v12);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v16 = v15;
  v17 = self;
  sub_1000108A0((uint64_t)v11, v14, v16, a5);

  swift_bridgeObjectRelease(v16);
  sub_100010E04((uint64_t)v11, (uint64_t *)&unk_10001DE60);
}

- (_TtC14siriinferenced20SiriInferenceService)init
{
  return (_TtC14siriinferenced20SiriInferenceService *)sub_100010A04();
}

@end