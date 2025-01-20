@interface JSMarketingObject
- (_TtC34AppleMediaServicesUIDynamicService17JSMarketingObject)init;
- (id)fetchItem:(id)a3;
@end

@implementation JSMarketingObject

- (id)fetchItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100018F4C((uint64_t)v4);

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService17JSMarketingObject)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_account));
  v3 = (char *)self + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_bag;
  uint64_t v4 = sub_10001ACA8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_clientInfo));
  swift_bridgeObjectRelease(*(void *)&self->account[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient]);
}

@end