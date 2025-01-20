@interface CloudPushService
+ (_TtC15audioaccessoryd16CloudPushService)shared;
- (_TtC15audioaccessoryd16CloudPushService)init;
- (void)addWithDelegate:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)removeWithDelegate:(id)a3;
- (void)start;
@end

@implementation CloudPushService

+ (_TtC15audioaccessoryd16CloudPushService)shared
{
  if (qword_100234C00 != -1) {
    swift_once(&qword_100234C00, sub_100118D98);
  }
  return (_TtC15audioaccessoryd16CloudPushService *)(id)qword_10023DF98;
}

- (_TtC15audioaccessoryd16CloudPushService)init
{
  return (_TtC15audioaccessoryd16CloudPushService *)sub_100118E04();
}

- (void)start
{
  v2 = self;
  sub_1001190DC();
}

- (void)addWithDelegate:(id)a3
{
}

- (void)removeWithDelegate:(id)a3
{
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

  sub_10011B018(v9, v11);
  sub_1000AC4C0(v9, v11);
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
    uint64_t v19 = 0LL;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v20 = 0LL;
    uint64_t v22 = 0LL;
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
  uint64_t v19 = v18;

  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v22 = v21;

LABEL_8:
  sub_10011B1E4((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v19);
  sub_1000AC4C0((uint64_t)v8, v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10011B428(a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd16CloudPushService_pushDelegates));

  swift_bridgeObjectRelease(*(void *)&self->pushDelegates[OBJC_IVAR____TtC15audioaccessoryd16CloudPushService_pushEnvironment]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15audioaccessoryd16CloudPushService_firstUnlockStateWatcher));
}

@end