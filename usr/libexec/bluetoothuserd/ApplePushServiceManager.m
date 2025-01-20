@interface ApplePushServiceManager
+ (_TtC14bluetoothuserd23ApplePushServiceManager)shared;
- (_TtC14bluetoothuserd23ApplePushServiceManager)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
@end

@implementation ApplePushServiceManager

+ (_TtC14bluetoothuserd23ApplePushServiceManager)shared
{
  if (qword_10007D0A0 != -1) {
    swift_once(&qword_10007D0A0, sub_100006674);
  }
  return (_TtC14bluetoothuserd23ApplePushServiceManager *)(id)qword_100080728;
}

- (_TtC14bluetoothuserd23ApplePushServiceManager)init
{
  return (_TtC14bluetoothuserd23ApplePushServiceManager *)sub_1000068B0();
}

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
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000LL;
  }

  sub_100007E88((uint64_t)v4, v10);
  sub_100008B2C((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  if (a4)
  {
    id v10 = a3;
    id v11 = a5;
    id v12 = a6;
    v13 = self;
    id v14 = v8;
    id v8 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
    unint64_t v16 = v15;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0LL;
    unint64_t v19 = 0LL;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v20 = 0LL;
    unint64_t v22 = 0LL;
    goto LABEL_8;
  }

  id v23 = a3;
  id v24 = a5;
  id v25 = a6;
  v26 = self;
  unint64_t v16 = 0xF000000000000000LL;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v19 = v18;

  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  unint64_t v22 = v21;

LABEL_8:
  sub_100008194((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v19);
  sub_100008B2C((uint64_t)v8, v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000859C(a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_pushServiceQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_subscriptions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_subscriptionQueue));
  swift_bridgeObjectRelease(*(void *)&self->pushServiceQueue[OBJC_IVAR____TtC14bluetoothuserd23ApplePushServiceManager_pushEnvironment]);
}

@end