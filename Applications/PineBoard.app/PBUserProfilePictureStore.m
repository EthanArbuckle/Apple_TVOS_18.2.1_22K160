@interface PBUserProfilePictureStore
- (_TtC9PineBoard25PBUserProfilePictureStore)init;
- (_TtC9PineBoard25PBUserProfilePictureStore)initWithProfileManager:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)prefetchProfilePictureForUserProfile:(id)a3;
- (void)profilePictureFileForAltDSID:(id)a3 completionHandler:(id)a4;
- (void)profilePictureFileForAltDSID:(id)a3 loadOnlyFromCache:(BOOL)a4 completionHandler:(id)a5;
- (void)profilePictureFileForUserProfile:(id)a3 completionHandler:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation PBUserProfilePictureStore

- (_TtC9PineBoard25PBUserProfilePictureStore)initWithProfileManager:(id)a3
{
  return (_TtC9PineBoard25PBUserProfilePictureStore *)sub_1002170A8(a3);
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PineBoard25PBUserProfilePictureStore_stateDumpToken);
  v4 = self;
  if (v3) {
    v4 = (_TtC9PineBoard25PBUserProfilePictureStore *)[v3 invalidate];
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PBUserProfilePictureStore((uint64_t)v4, v5);
  -[PBUserProfilePictureStore dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9PineBoard25PBUserProfilePictureStore_identifierMapper));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9PineBoard25PBUserProfilePictureStore_stateDumpToken));

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9PineBoard25PBUserProfilePictureStore_profileManager);
}

- (void)profilePictureFileForUserProfile:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100214624(&qword_10046EC90);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1003DDCE8, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003DDD10, 64LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_1002265C0;
  v13[7] = v11;
  id v14 = a3;
  v15 = self;
  id v16 = v14;
  swift_retain(v11);
  uint64_t v17 = sub_100217954((uint64_t)v9, (uint64_t)&unk_10046ED30, (uint64_t)v13);
  swift_release(v17);
  swift_release(v11);
}

- (void)profilePictureFileForAltDSID:(id)a3 completionHandler:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_100224214(v7, v9, 0, (char *)v10, (void (**)(void, void, double, double, double, double))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_bridgeObjectRelease(v9);
}

- (void)profilePictureFileForAltDSID:(id)a3 loadOnlyFromCache:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  _Block_copy(v8);
  uint64_t v12 = self;
  sub_100224214(v9, v11, a4, (char *)v12, (void (**)(void, void, double, double, double, double))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease(v11);
}

- (void)prefetchProfilePictureForUserProfile:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100218F60(v5);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (_TtC9PineBoard25PBUserProfilePictureStore)init
{
  result = (_TtC9PineBoard25PBUserProfilePictureStore *)_swift_stdlib_reportUnimplementedInitializer( "PineBoard.PBUserProfilePictureStore",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end