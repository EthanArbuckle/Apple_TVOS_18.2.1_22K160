@interface JSNetworkObject
- (_TtC34AppleMediaServicesUIDynamicService15JSNetworkObject)init;
- (id)fetch:(id)a3;
@end

@implementation JSNetworkObject

- (id)fetch:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001D1F8((uint64_t)v4);

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService15JSNetworkObject)init
{
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_accountStore));
  v3 = (char *)self + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_customSessions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_defaultSession));
  swift_bridgeObjectRelease(*(void *)&self->accountStore[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_mediaClient]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_urlSessionHandler));
}

@end