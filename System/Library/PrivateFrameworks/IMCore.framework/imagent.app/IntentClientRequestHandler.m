@interface IntentClientRequestHandler
- (_TtC7imagent26IntentClientRequestHandler)init;
- (void)requestContactsForIdentifiers:(id)a3 reply:(id)a4;
@end

@implementation IntentClientRequestHandler

- (void)requestContactsForIdentifiers:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v8 = swift_allocObject(&unk_1000660A8, 24LL, 7LL);
  *(void *)(v8 + 16) = v6;
  v9 = self;
  sub_100030484(v7, (uint64_t)sub_1000306B4, v8);

  swift_bridgeObjectRelease(v7, v10);
  swift_release(v8);
}

- (_TtC7imagent26IntentClientRequestHandler)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent26IntentClientRequestHandler_requiredCapabilities) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent26IntentClientRequestHandler_requiredEntitlements) = (Class)&off_100066068;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentClientRequestHandler();
  return -[IntentClientRequestHandler init](&v3, "init");
}

- (void).cxx_destruct
{
}

@end