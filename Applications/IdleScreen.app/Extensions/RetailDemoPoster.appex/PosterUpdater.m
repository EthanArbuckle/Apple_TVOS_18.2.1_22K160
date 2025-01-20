@interface PosterUpdater
- (_TtC16RetailDemoPoster13PosterUpdater)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
@end

@implementation PosterUpdater

- (_TtC16RetailDemoPoster13PosterUpdater)init
{
  return (_TtC16RetailDemoPoster13PosterUpdater *)sub_1000029C4();
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
  unint64_t v9 = sub_100005354();
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v9,  &protocol witness table for String);
  uint64_t v12 = swift_allocObject(&unk_100010800, 24LL);
  *(void *)(v12 + 16) = v11;
  sub_100002C00(v13, (uint64_t)a4, (void (*)(void))sub_1000053F4, v12);
  swift_release(v12);
  swift_bridgeObjectRelease(v13);
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  v5 = a3;
  id v6 = a4;
  uint64_t v12 = _Block_copy(a5);
  id v7 = self;
  v8 = (void *)swift_allocObject(&unk_100010828, 48LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_100003CC8((uint64_t)&unk_1000151A0, (uint64_t)v8);
}

@end