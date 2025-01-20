@interface JSSubscriptionStatus
- (_TtC14amsengagementd20JSSubscriptionStatus)init;
- (id)lookup:(id)a3;
@end

@implementation JSSubscriptionStatus

- (id)lookup:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v5 = self;
  v6 = (void *)sub_1000AEE58(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC14amsengagementd20JSSubscriptionStatus)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd20JSSubscriptionStatus_config];
  uint64_t v3 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd20JSSubscriptionStatus_config + 24];
  swift_bridgeObjectRelease(*(void *)&self->config[OBJC_IVAR____TtC14amsengagementd20JSSubscriptionStatus_config + 40]);

  swift_bridgeObjectRelease(v3);
}

@end