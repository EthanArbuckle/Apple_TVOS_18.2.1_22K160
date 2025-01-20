@interface ServerDataCacheService
- (_TtC14amsengagementd22ServerDataCacheService)init;
- (void)dataForAccountDSID:(id)a3 cacheTypeID:(id)a4 networkPolicy:(int64_t)a5 completion:(id)a6;
- (void)granularNotificationSettingsForAccountDSID:(id)a3 bundleID:(id)a4 networkPolicy:(int64_t)a5 completion:(id)a6;
- (void)reminderEventsForAccountDSID:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6 completion:(id)a7;
- (void)setUpCacheForAccount:(id)a3 completion:(id)a4;
- (void)setUpCacheForAccountDSID:(id)a3 completion:(id)a4;
- (void)tearDownCacheForAccountDSID:(id)a3 completion:(id)a4;
- (void)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4 completion:(id)a5;
- (void)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4 completion:(id)a5;
@end

@implementation ServerDataCacheService

- (_TtC14amsengagementd22ServerDataCacheService)init
{
  return (_TtC14amsengagementd22ServerDataCacheService *)sub_100117A18();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14amsengagementd22ServerDataCacheService____lazy_storage___updateCoalescer));
}

- (void)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  *(void *)(swift_allocObject(&unk_1001B19D8, 24LL, 7LL) + 16) = v8;
  id v9 = a3;
  v10 = self;
  sub_1001190C0();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &protocol witness table for String);
  *(void *)(swift_allocObject(&unk_1001B1988, 24LL, 7LL) + 16) = v8;
  id v9 = a3;
  v10 = self;
  sub_1001190C0();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)dataForAccountDSID:(id)a3 cacheTypeID:(id)a4 networkPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void)granularNotificationSettingsForAccountDSID:(id)a3 bundleID:(id)a4 networkPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void)reminderEventsForAccountDSID:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject(&unk_1001B1370, 24LL, 7LL);
  *(void *)(v19 + 16) = v12;
  id v20 = a3;
  v21 = self;
  sub_10011D6BC(v20, v13, v15, v16, v18, a6, (uint64_t)sub_100122334, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setUpCacheForAccount:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = (void **)a3;
  v8 = self;
  sub_10012050C(v7, v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
}

- (void)setUpCacheForAccountDSID:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  *(void *)(swift_allocObject(&unk_1001B12D0, 24LL, 7LL) + 16) = v6;
  id v7 = a3;
  v8 = self;
  sub_10012085C();

  swift_release();
}

- (void)tearDownCacheForAccountDSID:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  *(void *)(swift_allocObject(&unk_1001B1258, 24LL, 7LL) + 16) = v6;
  id v7 = a3;
  v8 = self;
  sub_1001211F8();

  swift_release();
}

@end