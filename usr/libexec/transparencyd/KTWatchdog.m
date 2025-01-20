@interface KTWatchdog
+ (BOOL)isInDebugger;
- (NSString)description;
- (_TtC13transparencyd10KTWatchdog)init;
- (_TtC13transparencyd10KTWatchdog)initWithControl:(id)a3;
- (id)checkWatchDogs;
- (void)addWithNamed:(id)a3 watcher:(id)a4;
- (void)resume;
- (void)runWatchDog;
- (void)stopWatchDog;
@end

@implementation KTWatchdog

- (_TtC13transparencyd10KTWatchdog)initWithControl:(id)a3
{
  v4 = (_TtC13transparencyd10KTWatchdog *)sub_1000D8A38((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (NSString)description
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  uint64_t v14 = v2();
  uint64_t v4 = sub_100072CC4(&qword_1002E2008);
  uint64_t v5 = sub_1000A9AA4( (unint64_t *)&unk_1002E2010,  &qword_1002E2008,  (uint64_t)&protocol conformance descriptor for [A : B].Keys);
  unint64_t v6 = sub_10007F884();
  uint64_t v7 = Sequence<>.joined(separator:)(44LL, 0xE100000000000000LL, v4, v5, v6);
  v9 = v8;
  swift_bridgeObjectRelease(v14);
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 62LL;
  v11._object = (void *)0xE100000000000000LL;
  String.append(_:)(v11);

  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xEB000000003C676FLL);
  return (NSString *)v12;
}

+ (BOOL)isInDebugger
{
  return _s13transparencyd10KTWatchdogC12isInDebuggerSbyFZ_0() & 1;
}

- (void)resume
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  uint64_t v4 = self;
  uint64_t v3 = v2();
  swift_unknownObjectRelease(v3);
  if (!v3) {
    (*(void (**)(void))((swift_isaMask & (uint64_t)v4->super.isa) + 0xD8))();
  }
}

- (void)addWithNamed:(id)a3 watcher:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_100280BC8, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  Swift::String v11 = self;
  KTWatchdog.add(named:watcher:)(v7, v9, (uint64_t)sub_1000D96A4, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (id)checkWatchDogs
{
  uint64_t v3 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (uint64_t *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd10KTWatchdog_workQueue);
  *unint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  uint64_t v8 = self;
  id v9 = v7;
  LOBYTE(self) = _dispatchPreconditionTest(_:)(v6);
  id result = (id)(*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((self & 1) != 0)
  {
    uint64_t v11 = (*(uint64_t (**)(id))((swift_isaMask & (uint64_t)v8->super.isa) + 0x88))(result);
    NSString v12 = v8;
    sub_1000D92F8((uint64_t)_swiftEmptyArrayStorage, v11, v12);
    uint64_t v14 = v13;
    swift_bridgeObjectRelease(v11);

    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
    return isa;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (void)runWatchDog
{
  v2 = self;
  sub_1000D780C();
}

- (void)stopWatchDog
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  uint64_t v5 = self;
  uint64_t v3 = v2();
  if (v3)
  {
    uint64_t v4 = v3;
    swift_getObjectType(v3);
    OS_dispatch_source.cancel()();

    swift_unknownObjectRelease(v4);
  }

  else
  {
  }

- (_TtC13transparencyd10KTWatchdog)init
{
  id result = (_TtC13transparencyd10KTWatchdog *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTWatchdog",  24LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13transparencyd10KTWatchdog_log;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC13transparencyd10KTWatchdog_pending;
  uint64_t v6 = sub_100072CC4(&qword_1002E2048);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd10KTWatchdog_intervalTimer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd10KTWatchdog_dep));
}

@end