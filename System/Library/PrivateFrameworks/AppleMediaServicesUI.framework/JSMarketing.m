@interface JSMarketing
- (_TtC14amsengagementd11JSMarketing)init;
- (void)cacheItem:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSMarketing

- (void)cacheItem:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v13 = a4;
  v12 = self;
  sub_10009BBBC(v8, v10, v13, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14amsengagementd11JSMarketing)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14amsengagementd11JSMarketing_bag;
  uint64_t v4 = sub_10009DEF8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_bridgeObjectRelease();
}

@end