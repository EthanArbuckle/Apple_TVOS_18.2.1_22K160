@interface ApsListener
- (_TtC7sportsd11ApsListener)init;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation ApsListener

- (_TtC7sportsd11ApsListener)init
{
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd11ApsListener_connection));
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v10 = v9;

  sub_10000FEFC(v11, v8, v10);
  sub_10000ABB4(v8, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100010154((uint64_t)v8, v7);
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    uint64_t v7 = sub_10001906C(0LL, (unint64_t *)&unk_100087BE0, &OBJC_CLASS___APSChannelSubscriptionFailure_ptr);
    id v4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }

  id v8 = a3;
  unint64_t v9 = self;
  sub_100014374((uint64_t)v9, (unint64_t)v4);

  swift_bridgeObjectRelease(v4);
}

@end