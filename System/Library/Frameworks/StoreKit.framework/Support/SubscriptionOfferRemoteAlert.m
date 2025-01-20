@interface SubscriptionOfferRemoteAlert
- (_TtC9storekitd28SubscriptionOfferRemoteAlert)init;
@end

@implementation SubscriptionOfferRemoteAlert

- (_TtC9storekitd28SubscriptionOfferRemoteAlert)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->client[OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_offer];
  swift_bridgeObjectRelease(*(void *)&self->offer[OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_offer + 8]);
  swift_bridgeObjectRelease(v3);

  sub_1000E94A0(OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_logKey);
  sub_1000E94A0(OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_sceneID);
  sub_10007A3CC((uint64_t)self + OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_logger);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9storekitd28SubscriptionOfferRemoteAlert_alertActor));
}

@end