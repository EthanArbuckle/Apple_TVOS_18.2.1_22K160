@interface ATVCallManager
- (_TtC8FaceTime14ATVCallManager)init;
- (void)callStatusChanged:(id)a3;
@end

@implementation ATVCallManager

- (void)callStatusChanged:(id)a3
{
  uint64_t v5 = sub_100018A04(&qword_100114970);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 1LL, 1LL, v8);
  type metadata accessor for MainActor(0LL);
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  uint64_t v12 = static MainActor.shared.getter(v11);
  v13 = (void *)swift_allocObject(&unk_1000FAF10, 48LL, 7LL);
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  v13[5] = v11;
  uint64_t v14 = sub_10008033C((uint64_t)v7, (uint64_t)&unk_100115348, (uint64_t)v13);
  swift_release(v14);
}

- (_TtC8FaceTime14ATVCallManager)init
{
  result = (_TtC8FaceTime14ATVCallManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.ATVCallManager",  23LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8FaceTime14ATVCallManager_videoPresentationStateCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime14ATVCallManager_presentationManager));

  sub_10001C608( (uint64_t)self + OBJC_IVAR____TtC8FaceTime14ATVCallManager_lastJoinCallContext,  (uint64_t *)&unk_100113110);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime14ATVCallManager_activeCallSubject));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime14ATVCallManager_signpostManager));
}

@end