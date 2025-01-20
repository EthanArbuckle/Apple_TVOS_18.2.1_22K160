@interface WiFiP2PtvOSUIAgent
- (_TtC12wifip2pdCore18WiFiP2PtvOSUIAgent)init;
- (void)addNotificationRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation WiFiP2PtvOSUIAgent

- (void)addNotificationRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1003FBAB0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100333468(v8, (uint64_t)sub_100246A60, v7);

  swift_release(v7);
}

- (_TtC12wifip2pdCore18WiFiP2PtvOSUIAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WiFiP2PtvOSUIAgent();
  return -[WiFiP2PtvOSUIAgent init](&v3, "init");
}

@end