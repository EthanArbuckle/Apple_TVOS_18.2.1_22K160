@interface FaceTimeNotificationProvider
- (_TtC13callservicesd28FaceTimeNotificationProvider)init;
- (void)handlePendingMessageDidReceiveCancelNotification:(id)a3;
- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3;
@end

@implementation FaceTimeNotificationProvider

- (_TtC13callservicesd28FaceTimeNotificationProvider)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_categories));
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_add);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_replace);
  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_removeNotification),  *(void *)&self->updateBadgeValue[OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_removeNotification]);
}

- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3
{
}

- (void)handlePendingMessageDidReceiveCancelNotification:(id)a3
{
}

@end