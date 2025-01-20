@interface IntentHandler
- (_TtC23AnnounceIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
- (void)transactionDidCompleteForIntentIdentifier:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100006068(v4, v10);

  uint64_t v6 = v11;
  v7 = sub_100007824(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  sub_100007848(v10);
  return v8;
}

- (_TtC23AnnounceIntentExtension13IntentHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers;
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_100005DB8((uint64_t)&_swiftEmptyArrayStorage);
  v5 = (char *)v4 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for IntentHandler(0LL);
  return -[IntentHandler init](&v8, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers));
  sub_10000779C((uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger);
}

- (void)transactionDidCompleteForIntentIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v6 = v5;
  v7 = self;
  sub_1000071B4(v4, v6);

  swift_bridgeObjectRelease(v6);
}

@end