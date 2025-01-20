@interface JSNetworkObject
- (_TtC16UtilityExtension15JSNetworkObject)init;
- (id)fetch:(id)a3;
@end

@implementation JSNetworkObject

- (id)fetch:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001DDB8((uint64_t)v4);

  return v6;
}

- (_TtC16UtilityExtension15JSNetworkObject)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_customSessions));

  swift_bridgeObjectRelease(*(void *)&self->accountStore[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_mediaClient]);
}

@end