@interface LocalizationJetPack
+ (id)loadWithUrl:(id)a3 client:(id)a4;
- (_TtC9storekitd19LocalizationJetPack)init;
- (id)stringForKey:(id)a3;
@end

@implementation LocalizationJetPack

+ (id)loadWithUrl:(id)a3 client:(id)a4
{
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_getObjCClassMetadata(a1);
  id v11 = a4;
  id v12 = sub_1000D50F0((uint64_t)v10, v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

- (id)stringForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1000D5038(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    NSString v10 = 0LL;
  }

  return v10;
}

- (_TtC9storekitd19LocalizationJetPack)init
{
}

- (void).cxx_destruct
{
}

@end