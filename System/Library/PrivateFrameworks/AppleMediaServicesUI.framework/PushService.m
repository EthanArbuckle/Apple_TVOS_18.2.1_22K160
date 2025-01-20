@interface PushService
- (_TtC14amsengagementd11PushService)init;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation PushService

- (_TtC14amsengagementd11PushService)init
{
  return (_TtC14amsengagementd11PushService *)sub_100105944();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14amsengagementd11PushService_publishers));
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10010667C((uint64_t)v7, a4);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v11 = v10;
  }

  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0LL;
    unint64_t v11 = 0xF000000000000000LL;
  }

  sub_1001068DC();
  sub_10001BD70(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100106C00();
}

@end