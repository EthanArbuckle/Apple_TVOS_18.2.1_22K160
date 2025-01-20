@interface DarwinNotificationManager
+ (_TtC15audioaccessoryd25DarwinNotificationManager)shared;
- (_TtC15audioaccessoryd25DarwinNotificationManager)init;
- (void)setUp;
@end

@implementation DarwinNotificationManager

+ (_TtC15audioaccessoryd25DarwinNotificationManager)shared
{
  if (qword_100234B68 != -1) {
    swift_once(&qword_100234B68, sub_1000CA624);
  }
  return (_TtC15audioaccessoryd25DarwinNotificationManager *)(id)static DarwinNotificationManager.shared;
}

- (_TtC15audioaccessoryd25DarwinNotificationManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd25DarwinNotificationManager_helpers) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DarwinNotificationManager();
  return -[DarwinNotificationManager init](&v3, "init");
}

- (void)setUp
{
  objc_super v3 = self;
  v4 = (dispatch_queue_s *)static OS_dispatch_queue.main.getter();
  uint64_t v5 = swift_allocObject(&unk_10020C8A0, 24LL, 7LL);
  *(void *)(v5 + 16) = v3;
  v9[4] = sub_1000CAF74;
  uint64_t v10 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  v9[2] = sub_1000CAC20;
  v9[3] = &unk_10020C8B8;
  v6 = _Block_copy(v9);
  uint64_t v7 = v10;
  v8 = v3;
  swift_release(v7);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd25DarwinNotificationManager_helpers));
}

@end