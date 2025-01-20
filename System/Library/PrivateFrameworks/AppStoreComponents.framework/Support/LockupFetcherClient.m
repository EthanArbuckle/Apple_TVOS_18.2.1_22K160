@interface LockupFetcherClient
- (_TtC19appstorecomponentsd19LockupFetcherClient)init;
- (void)buildLockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 withReplyHandler:(id)a5;
- (void)getLockupCollectionWithRequest:(id)a3 withReplyHandler:(id)a4;
- (void)getLockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 withReplyHandler:(id)a6;
- (void)getLockupWithRequest:(id)a3 withReplyHandler:(id)a4;
- (void)getLockupsWithRequest:(id)a3 withReplyHandler:(id)a4;
@end

@implementation LockupFetcherClient

- (void)getLockupWithRequest:(id)a3 withReplyHandler:(id)a4
{
}

- (void)getLockupsWithRequest:(id)a3 withReplyHandler:(id)a4
{
}

- (void)getLockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 withReplyHandler:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject(&unk_100124A38, 24LL, 7LL);
  *(void *)(v13 + 16) = v9;
  id v14 = a4;
  v15 = self;
  sub_1000BE7B8(v10, v12, v14, (uint64_t)sub_1000BF0D4, v13);

  swift_bridgeObjectRelease(v12);
  swift_release(v13);
}

- (void)buildLockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 withReplyHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v10 = swift_allocObject(&unk_100124920, 24LL, 7LL);
  *(void *)(v10 + 16) = v8;
  id v11 = a4;
  uint64_t v12 = self;
  sub_1000BB930(v9, v11, (void (*)(void, void *))sub_1000BE648, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)getLockupCollectionWithRequest:(id)a3 withReplyHandler:(id)a4
{
}

- (_TtC19appstorecomponentsd19LockupFetcherClient)init
{
  result = (_TtC19appstorecomponentsd19LockupFetcherClient *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.LockupFetcherClient",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appStateController));
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appDistribution));
}

@end