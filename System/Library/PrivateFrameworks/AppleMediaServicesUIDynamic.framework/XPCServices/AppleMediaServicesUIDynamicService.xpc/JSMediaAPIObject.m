@interface JSMediaAPIObject
- (_TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject)init;
- (id)lookup:(id)a3;
@end

@implementation JSMediaAPIObject

- (id)lookup:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001AF44((uint64_t)v4);

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject)init
{
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore));
  v3 = (char *)self + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10001CF90(OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_clientInfo);
  sub_10001CF90(OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
  sub_10001CF90(OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_tokenService);
  sub_10001CF98((uint64_t)self + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient);
  sub_10001CF90(OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSession);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSessionHandler));
}

@end