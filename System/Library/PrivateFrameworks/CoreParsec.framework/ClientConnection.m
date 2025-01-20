@interface ClientConnection
- (_TtC7parsecd16ClientConnection)init;
- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4;
- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5;
- (void)allEngagedResults:(id)a3 maxCount:(int64_t)a4 withConfiguration:(id)a5 completion:(id)a6;
- (void)bag:(id)a3 reply:(id)a4;
- (void)bagChangeNotificationWithNotification:(id)a3;
- (void)clearEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5;
- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4;
- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4;
- (void)dealloc;
- (void)fileDeleteNotificationWithNotification:(id)a3;
- (void)fileDownloadNotificationWithNotification:(id)a3;
- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4;
- (void)fileHandleForWritingFeedbackType:(int64_t)a3 reply:(id)a4;
- (void)forceFetchBag:(id)a3 reply:(id)a4;
- (void)getBagDataWithReply:(id)a3;
- (void)getImageMap:(id)a3;
- (void)getIsDeviceSetupCompleteWithReply:(id)a3;
- (void)getQueryContextDataForClient:(unint64_t)a3 reply:(id)a4;
- (void)handleInvocation;
- (void)listSessions:(id)a3;
- (void)reportFeedback:(id)a3 payloadData:(id)a4 queryId:(unint64_t)a5;
- (void)reportPegasusFeedbackWithPayloadData:(id)a3 forUseragent:(id)a4;
- (void)request:(id)a3 request:(id)a4 reply:(id)a5;
- (void)stopSessions:(id)a3;
- (void)subscribeToChannel:(PARSubscriptionChannel *)a3 reply:(id)a4;
- (void)subscriptionStatusForChannel:(PARSubscriptionChannel *)a3 reply:(id)a4;
- (void)teeFeedback:(id)a3;
- (void)topEncodedEngagedResultsForInput:(NSString *)a3 maxCount:(int64_t)a4 withConfiguration:(PARSessionConfiguration *)a5 completion:(id)a6;
- (void)unsubscribeFromChannel:(PARSubscriptionChannel *)a3 reply:(id)a4;
- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4;
@end

@implementation ClientConnection

- (void)dealloc
{
  v2 = self;
  sub_100060D84();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7parsecd16ClientConnection_connectionID;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  sub_10006B708(OBJC_IVAR____TtC7parsecd16ClientConnection_clientStateManager);
  sub_10006B708(OBJC_IVAR____TtC7parsecd16ClientConnection_remoteObject);

  sub_10006B708(OBJC_IVAR____TtC7parsecd16ClientConnection_timer);
  sub_10006B710(OBJC_IVAR____TtC7parsecd16ClientConnection_transactionOpen);
  sub_10006B710(OBJC_IVAR____TtC7parsecd16ClientConnection_transaction);
  sub_10006B710(OBJC_IVAR____TtC7parsecd16ClientConnection_cancellableLock);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)handleInvocation
{
  v2 = self;
  sub_100061668();
}

- (void)bagChangeNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000616A0(v4);
}

- (void)fileDownloadNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10006194C(v4);
}

- (void)fileDeleteNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100061B6C(v4);
}

- (void)bag:(id)a3 reply:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject(&unk_1001B4878, 24LL, 7LL);
    *(void *)(v7 + 16) = v6;
    v6 = sub_10006B200;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v8 = a3;
  v9 = self;
  sub_100061D90();
  sub_10000A65C((uint64_t)v6, v7);
}

- (void)forceFetchBag:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100062390(a3, (uint64_t)v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
}

- (void)request:(id)a3 request:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100062778(a3, v10, (uint64_t)v11, (void (**)(void, void, void, void))v8);
  _Block_release(v8);
}

- (void)reportPegasusFeedbackWithPayloadData:(id)a3 forUseragent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  sub_100062FEC();
  swift_bridgeObjectRelease();
  sub_100010A30(v9, v11);
}

- (void)reportFeedback:(id)a3 payloadData:(id)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13 = self;
  unint64_t v10 = (uint8_t *)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v12 = v11;

  sub_100063470(a3, v10);
  sub_100010A30((uint64_t)v10, v12);
}

- (void)teeFeedback:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_1001B47D8, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v7 = sub_10006B204;
  }

  else
  {
    id v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  id v8 = self;
  sub_100064698();
  sub_10000A65C((uint64_t)v7, v6);
}

- (void)stopSessions:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_1001B47B0, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v7 = sub_10006B204;
  }

  else
  {
    id v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  id v8 = self;
  sub_1000649CC();
  sub_10000A65C((uint64_t)v7, v6);
}

- (void)listSessions:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_1001B4788, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v7 = sub_10006A50C;
  }

  else
  {
    id v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  id v8 = self;
  sub_100064CB4((uint64_t)v7);
  sub_10000A65C((uint64_t)v7, v6);
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (*)(void))_Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = swift_allocObject(&unk_1001B4760, 24LL, 7LL);
    *(void *)(v10 + 16) = v6;
    uint64_t v6 = (void (*)(void))sub_10006A504;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  unint64_t v11 = self;
  sub_100064DFC(v7, v9, v6);
  sub_10000A65C((uint64_t)v6, v10);

  swift_bridgeObjectRelease();
}

- (void)fileHandleForWritingFeedbackType:(int64_t)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject(&unk_1001B4738, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    v5 = sub_10006A4EC;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = self;
  sub_100065114();
  sub_10000A65C((uint64_t)v5, v6);
}

- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v13 = (char *)&v16 - v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_10006531C();

  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
}

- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  sub_100065494(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4
{
  if (a3) {
    uint64_t v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a4;
  uint64_t v8 = self;
  sub_1000655CC(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  uint64_t v8 = (uint64_t (*)())_Block_copy(a5);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  }
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1001B4710, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_10006B204;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = a4;
  unint64_t v11 = self;
  sub_1000657CC(a3, v10, (uint64_t)v8);
  sub_10000A65C((uint64_t)v8, v9);

  swift_bridgeObjectRelease();
}

- (void)topEncodedEngagedResultsForInput:(NSString *)a3 maxCount:(int64_t)a4 withConfiguration:(PARSessionConfiguration *)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  unint64_t v11 = (void *)swift_allocObject(&unk_1001B46E8, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  uint64_t v12 = a3;
  v13 = a5;
  v14 = self;
  sub_100066178((uint64_t)&unk_1001D44C0, (uint64_t)v11);
}

- (void)allEngagedResults:(id)a3 maxCount:(int64_t)a4 withConfiguration:(id)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  if (v10)
  {
    uint64_t v14 = swift_allocObject(&unk_1001B46C0, 24LL, 7LL);
    *(void *)(v14 + 16) = v10;
    id v10 = sub_10006A434;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  id v15 = a5;
  uint64_t v16 = self;
  sub_100066254(v11, v13, a4, v15, (uint64_t)v10);
  sub_10000A65C((uint64_t)v10, v14);

  swift_bridgeObjectRelease();
}

- (void)clearEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  }
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1001B4698, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_10006A3E4;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = a4;
  uint64_t v11 = self;
  sub_100066564(a3, v10, (uint64_t)v8);
  sub_10000A65C((uint64_t)v8, v9);

  swift_bridgeObjectRelease();
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10006686C();
}

- (void)getImageMap:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_1001B4670, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v7 = sub_10006A3DC;
  }

  else
  {
    id v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  uint64_t v8 = self;
  sub_100066938();
  sub_10000A65C((uint64_t)v7, v6);
}

- (_TtC7parsecd16ClientConnection)init
{
}

- (void)getQueryContextDataForClient:(unint64_t)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = self;
  sub_100066C2C(a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
}

- (void)getBagDataWithReply:(id)a3
{
}

- (void)getIsDeviceSetupCompleteWithReply:(id)a3
{
}

- (void)subscribeToChannel:(PARSubscriptionChannel *)a3 reply:(id)a4
{
}

- (void)unsubscribeFromChannel:(PARSubscriptionChannel *)a3 reply:(id)a4
{
}

- (void)subscriptionStatusForChannel:(PARSubscriptionChannel *)a3 reply:(id)a4
{
}

@end