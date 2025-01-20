@interface CDMXPCService
- (_TtC14assistant_cdmd13CDMXPCService)init;
- (_TtC14assistant_cdmd13CDMXPCService)initWithClientToUse:(id)a3;
- (id)sandboxToken;
- (void)areAssetsAvailableWithLocale:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)processCDMNluRequestWithCdmNluRequest:(id)a3 completionHandler:(id)a4;
- (void)processRequestWithServiceGraphCommand:(id)a3 completionHandler:(id)a4;
- (void)setupWithConfig:(id)a3 completionHandler:(id)a4;
- (void)waitForDataDispatcherCompletionWithCompletionHandler:(id)a3;
- (void)wake;
- (void)warmupWithCompletionHandler:(id)a3;
@end

@implementation CDMXPCService

- (_TtC14assistant_cdmd13CDMXPCService)init
{
  return result;
}

- (_TtC14assistant_cdmd13CDMXPCService)initWithClientToUse:(id)a3
{
  return result;
}

- (void)wake
{
  v2 = self;
  sub_1000064EC((uint64_t)v2);
}

- (id)sandboxToken
{
  if (v2)
  {
    uint64_t v3 = v2;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    NSString v4 = 0LL;
  }

  return v4;
}

- (void)setupWithConfig:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1000066C4(v7, (uint64_t)v8, v6);
  sub_100007AB0();
}

- (void)warmupWithCompletionHandler:(id)a3
{
  NSString v4 = sub_100007B18((int)self, (int)a2, a3);
  uint64_t v5 = sub_100005CFC((uint64_t)&unk_10000C978, 24LL);
  *(void *)(v5 + 16) = v4;
  id v6 = v3;
  sub_100006E40((uint64_t)sub_100007A54, v5);

  swift_release(v5);
}

- (void)processCDMNluRequestWithCdmNluRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)areAssetsAvailableWithLocale:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = type metadata accessor for Locale(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_100007130((uint64_t)v10, (uint64_t)v12, (void (**)(void, void))v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100007AEC();
}

- (void)processRequestWithServiceGraphCommand:(id)a3 completionHandler:(id)a4
{
}

- (void)waitForDataDispatcherCompletionWithCompletionHandler:(id)a3
{
  NSString v4 = sub_100007B18((int)self, (int)a2, a3);
  _Block_copy(v4);
  id v5 = v3;
  sub_1000075B0((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
  sub_100007A94(v5);
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction));
}

@end