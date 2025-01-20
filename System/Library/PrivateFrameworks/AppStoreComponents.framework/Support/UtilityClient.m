@interface UtilityClient
- (_TtC19appstorecomponentsd13UtilityClient)init;
- (void)openURL:(id)a3 withReplyHandler:(id)a4;
- (void)restoreAppStoreWithReplyHandler:(id)a3;
@end

@implementation UtilityClient

- (void)openURL:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_100126818, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  v13 = self;
  sub_1000DE6E8((uint64_t)v10, (uint64_t)sub_100044014, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)restoreAppStoreWithReplyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *, void))v4[2];
  v6 = self;
  v5(v4, 0LL);
  _Block_release(v4);
}

- (_TtC19appstorecomponentsd13UtilityClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[UtilityClient init](&v3, "init");
}

@end