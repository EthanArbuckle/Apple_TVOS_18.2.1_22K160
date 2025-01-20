@interface TopShelfContentProvider
- (_TtC23ArcadeTopShelfExtension23TopShelfContentProvider)init;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
- (void)performCustomActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6 completionHandler:(id)a7;
@end

@implementation TopShelfContentProvider

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1000153F8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = qword_100019270;
  v7 = self;
  if (v6 != -1) {
    swift_once(&qword_100019270, sub_100002614);
  }
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  sub_1000053D8(v8, (uint64_t)qword_10001A0A0);
  uint64_t v9 = sub_100006174(&qword_100019430);
  uint64_t v10 = type metadata accessor for LogMessage(0LL);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
        + *(void *)(*(void *)(v10 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_100012CF0;
  LogMessage.init(stringLiteral:)(0xD000000000000019LL, 0x8000000100011C20LL);
  Logger.info(_:)(v11, v8, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = swift_allocObject(&unk_100015420, 32LL, 7LL);
  *(void *)(v12 + 16) = sub_100006A74;
  *(void *)(v12 + 24) = v5;
  uint64_t v13 = swift_allocObject(&unk_100015448, 32LL, 7LL);
  *(void *)(v13 + 16) = sub_100006A74;
  *(void *)(v13 + 24) = v5;
  swift_retain_n(v5, 2LL);
  sub_10000E92C((uint64_t)sub_100006AA8, v12, (uint64_t)sub_100006AB0, v13);

  swift_release(v5, v14);
  swift_release(v12, v15);
  swift_release(v13, v16);
}

- (void)performCustomActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6 completionHandler:(id)a7
{
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v17 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v20 = v19;
  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a6,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  uint64_t v21 = swift_allocObject(&unk_100015308, 24LL, 7LL);
  *(void *)(v21 + 16) = v17;
  v22 = self;
  sub_100005E10((uint64_t)v16, (uint64_t)a4, v18, v20, (void (*)(void))sub_100006D34, v21);

  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(a6);
  swift_release(v21, v23);
  swift_bridgeObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (_TtC23ArcadeTopShelfExtension23TopShelfContentProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = type metadata accessor for Bag.Profile(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = OBJC_IVAR____TtC23ArcadeTopShelfExtension23TopShelfContentProvider_bootstrap;
  uint64_t v9 = qword_100019280;
  uint64_t v10 = self;
  if (v9 != -1) {
    swift_once(&qword_100019280, sub_100008308);
  }
  uint64_t v11 = sub_1000053D8(v4, (uint64_t)qword_10001A0D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  uint64_t v12 = type metadata accessor for TopShelfBootstrap(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  *(void *)&v10->TVTopShelfContentProvider_opaque[v8] = sub_10000ECDC((uint64_t)v7);

  v14.receiver = v10;
  v14.super_class = ObjectType;
  return -[TopShelfContentProvider init](&v14, "init");
}

- (void).cxx_destruct
{
}

@end