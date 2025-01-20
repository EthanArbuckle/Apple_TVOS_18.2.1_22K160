@interface XPCSession
- (NSString)description;
- (_TtC12wifip2pdCore10XPCSession)init;
- (int64_t)hash;
- (void)createDatapathWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)createPublishWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)createSubscribeWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)createXPCResponderWithType:(unint64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)dump:(id)a3 to:(id)a4 maximumDepth:(int64_t)a5 completionHandler:(id)a6;
- (void)performRealtimeConnectivityCheckWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)queryAWDLLowLatencyStatisticsWithCompletionHandler:(id)a3;
- (void)queryAWDLState:(id)a3;
- (void)queryAWDLStatisticsWithCompletionHandler:(id)a3;
- (void)queryActiveServiceUniqueIdentifiersWithCompletionHandler:(id)a3;
- (void)queryActiveServicesAndActivePortsWithCompletionHandler:(id)a3;
- (void)queryAverageRSSIForAWDLPeer:(id)a3 completionHandler:(id)a4;
- (void)queryCurrentDeviceCapabilities:(id)a3;
- (void)queryPeersWithCompletionHandler:(id)a3;
- (void)startMonitoringAWDLStateWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)updateAWDLLTERestrictedChannels:(id)a3 completionHandler:(id)a4;
@end

@implementation XPCSession

- (void)dealloc
{
  v2 = self;
  sub_100262E2C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_voucher));

  swift_bridgeObjectRelease(*(void *)&self->requestHandler[OBJC_IVAR____TtC12wifip2pdCore10XPCSession_processName]);
  v5 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_uuid;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

- (int64_t)hash
{
  return (int64_t)[*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_connection) hash];
}

- (NSString)description
{
  v2 = self;
  sub_1002634D4();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC12wifip2pdCore10XPCSession)init
{
  result = (_TtC12wifip2pdCore10XPCSession *)_swift_stdlib_reportUnimplementedInitializer( "wifip2pdCore.XPCSession",  23LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)createSubscribeWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)createPublishWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)createDatapathWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)queryCurrentDeviceCapabilities:(id)a3
{
}

- (void)createXPCResponderWithType:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1003F4528, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_100263AA8(a3, (uint64_t)sub_100247460, v7);

  swift_release(v7);
}

- (void)startMonitoringAWDLStateWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1003F4500, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  v12[0] = a3;
  v12[1] = sub_100247460;
  v12[3] = 0LL;
  v12[4] = 0LL;
  v12[2] = v7;
  char v13 = 5;
  v9 = *(void (**)(void *, _TtC12wifip2pdCore10XPCSession *))((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_requestHandler);
  uint64_t v8 = *(void *)&self->requestHandler[OBJC_IVAR____TtC12wifip2pdCore10XPCSession_requestHandler];
  id v10 = a3;
  v11 = self;
  swift_retain(v8);
  v9(v12, v11);

  swift_release(v7);
  swift_release(v8);
}

- (void)queryAWDLState:(id)a3
{
}

- (void)queryAverageRSSIForAWDLPeer:(id)a3 completionHandler:(id)a4
{
}

- (void)queryPeersWithCompletionHandler:(id)a3
{
}

- (void)queryAWDLStatisticsWithCompletionHandler:(id)a3
{
}

- (void)queryAWDLLowLatencyStatisticsWithCompletionHandler:(id)a3
{
}

- (void)updateAWDLLTERestrictedChannels:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = sub_100058CD0(0LL, (unint64_t *)&unk_100410450, &OBJC_CLASS___WiFiChannel_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = swift_allocObject(&unk_1003F4320, 24LL, 7LL);
  *(void *)(v9 + 16) = v6;
  id v10 = self;
  sub_100263FF4(v8, (uint64_t)sub_100247460, v9);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (void)performRealtimeConnectivityCheckWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)queryActiveServiceUniqueIdentifiersWithCompletionHandler:(id)a3
{
}

- (void)queryActiveServicesAndActivePortsWithCompletionHandler:(id)a3
{
}

- (void)dump:(id)a3 to:(id)a4 maximumDepth:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v12 = swift_allocObject(&unk_1003F41E0, 24LL, 7LL);
  *(void *)(v12 + 16) = v10;
  id v13 = a4;
  v14 = self;
  sub_100264748(v11, (uint64_t)v13, a5, (uint64_t)sub_100246E80, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

@end