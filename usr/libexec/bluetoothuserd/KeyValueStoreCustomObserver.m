@interface KeyValueStoreCustomObserver
- (_TtC14bluetoothuserd27KeyValueStoreCustomObserver)init;
- (void)dealloc;
- (void)handleUbiquitousKeyValueStoreChangeLocallyWithNotification:(id)a3;
- (void)handleUbiquitousKeyValueStoreChangeWithNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation KeyValueStoreCustomObserver

- (void)dealloc
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for KeyValueStoreCustomObserver();
  -[KeyValueStoreCustomObserver dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_dispatchQueue));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_cloudDefaults));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_monitoredUserDefaultKeys));
  swift_release(*(void *)&self->dispatchQueue[OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_notify]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_cloudKVSChangedNotification));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v11 = 0LL;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain(a4);
      id v12 = a5;
      v13 = self;
      _bridgeAnyObjectToAny(_:)(v23, a4);
      swift_unknownObjectRelease(a4);
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v17 = 0LL;
      if (v11) {
        goto LABEL_5;
      }
LABEL_9:

      goto LABEL_10;
    }
  }

  memset(v23, 0, sizeof(v23));
  id v21 = a5;
  v22 = self;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey();
  uint64_t v15 = v14;
  uint64_t v16 = sub_10000662C( &qword_10007A7D0,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_1000609F8);
  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

  if (!v11) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v18 = sub_100003288((uint64_t *)&unk_10007B530);
  uint64_t v19 = swift_allocObject(v18, 48LL, 7LL);
  *(_OWORD *)(v19 + 16) = xmmword_100060880;
  *(void *)(v19 + 32) = v9;
  *(void *)(v19 + 40) = v11;
  v20 = *(void (**)(uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x108);
  swift_bridgeObjectRetain(v11);
  v20(2LL, v19);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v17);
  uint64_t v17 = v19;
LABEL_10:
  swift_bridgeObjectRelease(v17);
  sub_100006340((uint64_t)v23);
}

- (void)handleUbiquitousKeyValueStoreChangeWithNotification:(id)a3
{
}

- (void)handleUbiquitousKeyValueStoreChangeLocallyWithNotification:(id)a3
{
}

- (_TtC14bluetoothuserd27KeyValueStoreCustomObserver)init
{
  result = (_TtC14bluetoothuserd27KeyValueStoreCustomObserver *)_swift_stdlib_reportUnimplementedInitializer( "bluetoothuserd.KeyValueStoreCustomObserver",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end