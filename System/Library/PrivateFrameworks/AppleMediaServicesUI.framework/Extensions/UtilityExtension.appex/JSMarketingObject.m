@interface JSMarketingObject
- (_TtC16UtilityExtension17JSMarketingObject)init;
- (id)fetchItem:(id)a3;
@end

@implementation JSMarketingObject

- (id)fetchItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100019B0C((uint64_t)v4);

  return v6;
}

- (_TtC16UtilityExtension17JSMarketingObject)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_bag;
  uint64_t v4 = sub_10001B868();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_bridgeObjectRelease(*(void *)&self->account[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_mediaClient]);
}

@end