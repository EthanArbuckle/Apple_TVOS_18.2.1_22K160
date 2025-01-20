@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC10prototyped11AppDelegate)init;
- (void)killSpringBoard;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v7 = type metadata accessor for MainActor(0LL);
  uint64_t v8 = static MainActor.shared.getter(v7);
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  uint64_t v11 = v10;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 16LL, v9, v11);
  }
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0LL);
    uint64_t v13 = v12;
    uint64_t v14 = sub_10000C344( &qword_10001BE38,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012F64);
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  v13,  (char *)&type metadata for Any + 8,  v14);
  }

  id v15 = a3;
  v16 = self;
  char v17 = sub_10000B53C((uint64_t)a4);
  swift_release(v8);

  swift_bridgeObjectRelease(a4);
  return v17 & 1;
}

- (_TtC10prototyped11AppDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter(v4);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 12LL, v6, v8);
  }
  uint64_t v9 = OBJC_IVAR____TtC10prototyped11AppDelegate_listener;
  id v10 = objc_allocWithZone((Class)type metadata accessor for Listener());
  uint64_t v11 = self;
  *(Class *)((char *)&self->super.isa + v9) = (Class)[v10 init];

  v14.receiver = v11;
  v14.super_class = ObjectType;
  uint64_t v12 = -[AppDelegate init](&v14, "init");
  swift_release(v5);
  return v12;
}

- (void).cxx_destruct
{
}

- (void)killSpringBoard
{
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v4, 1LL, 1LL, v5);
  type metadata accessor for MainActor(0LL);
  uint64_t v6 = self;
  uint64_t v7 = static MainActor.shared.getter(v6);
  uint64_t v8 = (void *)swift_allocObject(&unk_100014C28, 40LL, 7LL);
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  uint64_t v9 = sub_100009AAC((uint64_t)v4, (uint64_t)&unk_10001BE30, (uint64_t)v8);

  swift_release(v9);
}

@end