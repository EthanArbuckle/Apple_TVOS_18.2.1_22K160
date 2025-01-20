@interface TVMGroupSessionManager
+ (TVMGroupSessionManager)sharedManager;
- (TVMGroupSessionManager)init;
- (void)groupSessionMonitor:(id)a3 statusDidChange:(id)a4;
- (void)updateSessionInfoWithPlayerPath:(id)a3;
@end

@implementation TVMGroupSessionManager

+ (TVMGroupSessionManager)sharedManager
{
  if (qword_1002B71C0 != -1) {
    swift_once(&qword_1002B71C0, sub_100143D6C);
  }
  return (TVMGroupSessionManager *)(id)qword_1002C5E58;
}

- (TVMGroupSessionManager)init
{
  return (TVMGroupSessionManager *)sub_100144298();
}

- (void)updateSessionInfoWithPlayerPath:(id)a3
{
  uint64_t v5 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  type metadata accessor for MainActor(0LL);
  id v10 = a3;
  v11 = self;
  id v12 = v10;
  v13 = v11;
  uint64_t v14 = static MainActor.shared.getter(v13);
  v15 = (void *)swift_allocObject(&unk_100274418, 48LL, 7LL);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v13;
  uint64_t v16 = sub_100125950((uint64_t)v8, (uint64_t)&unk_1002BB5F0, (uint64_t)v15);
  swift_release(v16);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMGroupSessionManager__groupSessionInfoObserver));
  v3 = (char *)self + OBJC_IVAR___TVMGroupSessionManager___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

- (void)groupSessionMonitor:(id)a3 statusDidChange:(id)a4
{
  uint64_t v7 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v7, v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  type metadata accessor for MainActor(0LL);
  id v12 = a4;
  v13 = self;
  id v14 = v12;
  id v15 = a3;
  uint64_t v16 = static MainActor.shared.getter(v15);
  uint64_t v17 = (void *)swift_allocObject(&unk_1002743F0, 48LL, 7LL);
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  v17[5] = v14;
  uint64_t v18 = sub_100125950((uint64_t)v10, (uint64_t)&unk_1002BB5D8, (uint64_t)v17);

  swift_release(v18);
}

@end