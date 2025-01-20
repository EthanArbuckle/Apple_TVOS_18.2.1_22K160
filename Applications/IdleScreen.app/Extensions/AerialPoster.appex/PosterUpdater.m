@interface PosterUpdater
- (_TtC12AerialPoster13PosterUpdater)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
@end

@implementation PosterUpdater

- (_TtC12AerialPoster13PosterUpdater)init
{
  return (_TtC12AerialPoster13PosterUpdater *)sub_10000283C();
}

- (void).cxx_destruct
{
}

- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v11 = _Block_copy(a5);
  v8 = self;
  unint64_t v9 = sub_100002CD8();
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v9,  &protocol witness table for String);
  uint64_t v12 = swift_allocObject(&unk_1000146F0, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  sub_100002A7C(v13, (uint64_t)a4, (void (*)(void))sub_100002FBC, v12);
  swift_release(v12);
  swift_bridgeObjectRelease(v13);
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  v5 = a3;
  id v6 = a4;
  uint64_t v12 = _Block_copy(a5);
  id v7 = self;
  v8 = (void *)swift_allocObject(&unk_100014718, 48LL, 7LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_100003424((uint64_t)&unk_100019AF8, (uint64_t)v8);
}

@end