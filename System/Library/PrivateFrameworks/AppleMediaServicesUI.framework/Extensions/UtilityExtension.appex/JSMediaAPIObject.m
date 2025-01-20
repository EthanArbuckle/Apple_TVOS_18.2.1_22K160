@interface JSMediaAPIObject
- (_TtC16UtilityExtension16JSMediaAPIObject)init;
- (id)lookup:(id)a3;
@end

@implementation JSMediaAPIObject

- (id)lookup:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001BB04((uint64_t)v4);

  return v6;
}

- (_TtC16UtilityExtension16JSMediaAPIObject)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10001DB50(OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_clientInfo);
  sub_10001DB50(OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_encoder);
  sub_10001DB50(OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_tokenService);
  sub_10001DB58((uint64_t)self + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_mediaClient);
  sub_10001DB50(OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_urlSession);
}

@end