@interface CloudNotificationChannelConnection
- (_TtC7parsecd34CloudNotificationChannelConnection)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation CloudNotificationChannelConnection

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    id v4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    unint64_t v10 = v9;
  }

  else
  {
    id v12 = a3;
    v11 = self;
    unint64_t v10 = 0xF000000000000000LL;
  }

  sub_10003BC14((uint64_t)v11, (uint64_t)v4, v10);
  sub_100010A1C((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10003BDFC((uint64_t)v8, a4);
}

- (_TtC7parsecd34CloudNotificationChannelConnection)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7parsecd34CloudNotificationChannelConnection_apsConnection));
}

@end