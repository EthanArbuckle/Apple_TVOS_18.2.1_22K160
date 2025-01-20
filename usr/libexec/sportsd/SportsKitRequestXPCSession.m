@interface SportsKitRequestXPCSession
- (void)dealloc;
- (void)flushMetrics;
- (void)refreshCurrentEventStateFor:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)signalWithDemand:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)subscribeTo:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5;
- (void)subscribeToEventWithEventId:(id)a3 subscriptionType:(id)a4 context:(id)a5 completion:(id)a6;
- (void)unsubscribeFrom:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5;
- (void)unsubscribeFromAllEventsWithCompletion:(id)a3;
- (void)unsubscribeFromEventWithEventId:(id)a3 completion:(id)a4;
- (void)unsubscribeFromEventsWithEventIds:(id)a3 completion:(id)a4;
@end

@implementation SportsKitRequestXPCSession

- (void)dealloc
{
  v2 = self;
  sub_10004C894();
}

- (void).cxx_destruct
{
  sub_100028C94((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC7sportsd26SportsKitRequestXPCSession_subscriptionOperation));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7sportsd26SportsKitRequestXPCSession_cancellables));
  swift_bridgeObjectRelease(*(void *)&self->super.connection[OBJC_IVAR____TtC7sportsd26SportsKitRequestXPCSession_bundleId]);
}

- (void)subscribeToEventWithEventId:(id)a3 subscriptionType:(id)a4 context:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v16 = v15;
  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  _Block_copy(v10);
  v18 = self;
  sub_10004C9E4(v11, v13, v14, v16, v17, (uint64_t)v18, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
}

- (void)unsubscribeFromEventWithEventId:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10004DA64(v7, v9, (uint64_t)v10, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)unsubscribeFromEventsWithEventIds:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  unint64_t v8 = self;
  sub_10004E1D8(v7, (char *)v8, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v7);
}

- (void)unsubscribeFromAllEventsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1000812E8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10004EA64((uint64_t)sub_100050244, v5);

  swift_release(v5);
}

- (void)refreshCurrentEventStateFor:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;
  uint64_t v12 = swift_allocObject(&unk_100081298, 24LL, 7LL);
  *(void *)(v12 + 16) = v8;
  unint64_t v13 = self;
  sub_10004EE90(v9, v11, a4, (uint64_t)sub_100050120, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

- (void)flushMetrics
{
  v2 = self;
  sub_10004F2C4();
}

- (void)signalWithDemand:(NSDictionary *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject(&unk_100081270, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  unint64_t v8 = a3;
  uint64_t v9 = self;
  sub_10004F5F4((uint64_t)&unk_100089338, (uint64_t)v7);
}

- (void)subscribeTo:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)unsubscribeFrom:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5
{
}

@end