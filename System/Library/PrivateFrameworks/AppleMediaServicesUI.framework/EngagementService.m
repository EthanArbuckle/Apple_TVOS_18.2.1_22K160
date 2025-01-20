@interface EngagementService
+ (_TtC14amsengagementd17EngagementService)shared;
- (_TtC14amsengagementd17EngagementService)init;
- (void)contentInfoForApp:(NSString *)a3 cacheKey:(NSString *)a4 version:(NSString *)a5 reply:(id)a6;
- (void)enqueueWithRequest:(id)a3 completion:(id)a4;
- (void)fetchMetricsIdentifiers;
- (void)manualSyncMetricsIdentifiers;
- (void)notifyBlockedMessages:(id)a3;
- (void)syncMetricsIdentifiers;
- (void)syncWithRequest:(id)a3 completion:(id)a4;
- (void)treatmentStoreServiceWithReply:(id)a3;
@end

@implementation EngagementService

+ (_TtC14amsengagementd17EngagementService)shared
{
  return (_TtC14amsengagementd17EngagementService *)sub_100055FF0();
}

- (_TtC14amsengagementd17EngagementService)init
{
}

- (void).cxx_destruct
{
  sub_100067958(OBJC_IVAR____TtC14amsengagementd17EngagementService_appDefaultsProvider);
  sub_10006705C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14amsengagementd17EngagementService_currentEnginePerformer),  *(void *)&self->priorityQueue[OBJC_IVAR____TtC14amsengagementd17EngagementService_currentEnginePerformer],  *(void *)&self->serviceQueue[OBJC_IVAR____TtC14amsengagementd17EngagementService_currentEnginePerformer]);
  swift_bridgeObjectRelease();
  sub_100067958(OBJC_IVAR____TtC14amsengagementd17EngagementService_enginePerformerProvider);
  sub_100067958(OBJC_IVAR____TtC14amsengagementd17EngagementService_featureFlagProvider);
  sub_100067720(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14amsengagementd17EngagementService_forceSyncCoordinator));
}

- (void)contentInfoForApp:(NSString *)a3 cacheKey:(NSString *)a4 version:(NSString *)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject(&unk_1001AB158, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_10013EABC((uint64_t)&unk_1001CA7B8, (uint64_t)v11);
}

- (void)enqueueWithRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1001AB108, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1000620B4( (uint64_t)v8,  (uint64_t)sub_100067094,  v7,  sub_10005E0A8,  (uint64_t)&unk_1001AB130,  (uint64_t)sub_1000670AC,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_100052990);

  swift_release(v7);
}

- (void)notifyBlockedMessages:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = self;
  sub_10006038C(v4);

  swift_bridgeObjectRelease();
}

- (void)syncWithRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1001AAB40, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1000620B4( (uint64_t)v8,  (uint64_t)sub_1000668AC,  v7,  sub_1000551CC,  (uint64_t)&unk_1001AAB68,  (uint64_t)sub_1000668C4,  (void (*)(void, uint64_t, uint64_t, uint64_t))sub_100053980);

  swift_release(v7);
}

- (void)syncMetricsIdentifiers
{
  v2 = self;
  sub_10006221C();
}

- (void)fetchMetricsIdentifiers
{
  v2 = self;
  sub_1000622C0(0, (void (*)(void))sub_1000E6B64);
}

- (void)manualSyncMetricsIdentifiers
{
  v2 = self;
  sub_1000622C0(1, (void (*)(void))sub_1000E5F6C);
}

- (void)treatmentStoreServiceWithReply:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1001AAB18, 32LL, 7LL);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_10013EABC((uint64_t)&unk_1001CA788, v5);
}

@end