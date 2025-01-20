@interface CallHistoryNotificationProvider
- (NSString)description;
- (_TtC13callservicesd31CallHistoryNotificationProvider)init;
- (void)callInteractionsDidChangeForManager:(id)a3;
- (void)handleCallHistoryDatabaseChangedWithNotification:(id)a3;
@end

@implementation CallHistoryNotificationProvider

- (_TtC13callservicesd31CallHistoryNotificationProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_callInteractionManager));
  sub_1001B0438((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_callHistoryDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_callProviderManager));
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_pendingCallIdentifiers);
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_supportedMediaTypes);
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_supportedProviders);
  sub_1001C6CE4( (uint64_t)self + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_mostRecentCallDate,  &qword_100447EA0);
  sub_1001B5D9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_supportsDisplayingFaceTimeAudioCalls);
  sub_1001B5D9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_openURL);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_dialRecentCall);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_findConversationLink);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_blockHandles);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_featureFlags));
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_add);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_replace);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_removeNotification);
  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_updateBadgeValue),  *(void *)&self->queue[OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_updateBadgeValue]);
}

- (void)callInteractionsDidChangeForManager:(id)a3
{
  v5 = self;
  sub_1002469C0();
  swift_unknownObjectRelease(a3);
}

- (void)handleCallHistoryDatabaseChangedWithNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100246AC8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (NSString)description
{
  v2 = self;
  sub_100247094();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end