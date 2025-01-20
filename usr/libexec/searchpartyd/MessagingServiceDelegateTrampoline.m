@interface MessagingServiceDelegateTrampoline
- (_TtC12searchpartyd34MessagingServiceDelegateTrampoline)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation MessagingServiceDelegateTrampoline

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  if (!a5)
  {
    id v23 = a3;
    id v24 = a4;
    id v25 = a6;
    id v26 = a7;
    v27 = self;
    unint64_t v19 = 0xF000000000000000LL;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v20 = 0LL;
    uint64_t v22 = 0LL;
    goto LABEL_6;
  }

  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = self;
  id v17 = v9;
  id v9 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  unint64_t v19 = v18;

  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v22 = v21;

LABEL_6:
  sub_100167C1C((char *)a3, a4, (uint64_t)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_1000182F0((uint64_t)v9, v19);
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  v28 = self;
  uint64_t v14 = sub_100004AEC((uint64_t *)&unk_1009A34D0);
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v17 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v16, 0LL, 1LL, v17);
  }

  else
  {
    uint64_t v18 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v16, 1LL, 1LL, v18);
  }

  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a6,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  if (a7)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
    a7 = v20;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  id v21 = a3;
  id v22 = a4;
  id v23 = a8;
  id v24 = v28;
  id v25 = a8;
  id v26 = v24;
  sub_1001689C0((unint64_t)a3, a4, (uint64_t)v16, a6, v19, (uint64_t)a7, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015794((uint64_t)v16, (uint64_t *)&unk_1009A34D0);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (a5)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    unint64_t v14 = v13;
  }

  else
  {
    uint64_t v12 = 0LL;
    unint64_t v14 = 0LL;
  }

  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  uint64_t v18 = self;
  sub_100169870((uint64_t)a3, a4, v12, v14, v8, (char *)a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    unint64_t v14 = v13;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = 0LL;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    memset(v24, 0, sizeof(v24));
    id v21 = a3;
    id v22 = a4;
    id v23 = self;
    goto LABEL_8;
  }

  uint64_t v12 = 0LL;
  unint64_t v14 = 0LL;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  id v8 = v16;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  id v17 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  uint64_t v20 = swift_unknownObjectRetain(a7);
  _bridgeAnyObjectToAny(_:)(v24, v20);
  swift_unknownObjectRelease(a7);
LABEL_8:
  sub_10016A26C((uint64_t)a3, a4, v12, v14, v15, (uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015794((uint64_t)v24, &qword_10099E200);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a3;
  id v8 = self;
  sub_10016AE10((uint64_t)a3, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  if (a6)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    uint64_t v14 = v13;
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (a7)
  {
    id v18 = a7;
    uint64_t v19 = self;
    a7 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a7);
    unint64_t v21 = v20;
  }

  else
  {
    id v22 = self;
    unint64_t v21 = 0xF000000000000000LL;
  }

  sub_10016C830(v16, v17, v12, v14, (uint64_t)a7, v21);
  sub_1000182F0((uint64_t)a7, v21);

  swift_bridgeObjectRelease();
}

- (_TtC12searchpartyd34MessagingServiceDelegateTrampoline)init
{
  result = (_TtC12searchpartyd34MessagingServiceDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.MessagingServiceDelegateTrampoline",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end