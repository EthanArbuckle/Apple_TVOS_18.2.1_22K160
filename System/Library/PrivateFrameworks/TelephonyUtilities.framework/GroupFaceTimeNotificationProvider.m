@interface GroupFaceTimeNotificationProvider
- (_TtC13callservicesd33GroupFaceTimeNotificationProvider)init;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 conversation:(id)a4 requestedScreenShareForParticipant:(id)a5;
- (void)conversationManager:(id)a3 handoffEligibilityChangedToConversation:(id)a4 fromPreviousConversation:(id)a5;
- (void)conversationManager:(id)a3 letMeInRequestStateChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)conversationsChangedForConversationManager:(id)a3;
- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3;
- (void)momentsStartedRemoteCapture:(id)a3;
@end

@implementation GroupFaceTimeNotificationProvider

- (_TtC13callservicesd33GroupFaceTimeNotificationProvider)init
{
}

- (void)momentsStartedRemoteCapture:(id)a3
{
}

- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_queue));
  sub_1001D90EC(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_contactsDataProvider);
  sub_1001D90EC(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_conversationManager);
  sub_1001D90EC(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_ftNetworkSupport);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_invitationResolver));
  sub_1001D90EC(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_featureFlags);
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_pendingNotificationsForConversationsByUUID);
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_notificationIdentifiersByConversationUUID);
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_carPlayNotificationIdentifiersByConversationUUID);
  sub_1001D90EC(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_faceTimeNotificationCenter);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_conversationServerBag));
  sub_1001B5D9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_shouldDelayInviteNotification);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_openURL);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_unlockAndOpenSensitiveURL);
  sub_1001B5D9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_localizeConversationName);
  sub_1001B5D9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_localizeHandleName);
  sub_1001B5D9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_localizeHandleNameWithConversation);
  sub_1001C732C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_categories);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_add);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_replace);
  sub_1001D8F9C(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_removeNotification);
  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_updateBadgeValue),  *(void *)&self->queue[OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_updateBadgeValue]);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001D2F48();
}

- (void)conversationManager:(id)a3 letMeInRequestStateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001D395C((uint64_t)v8, v7);
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001D3AD0();
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001D4068((uint64_t)v8);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001D48DC();
}

- (void)conversationManager:(id)a3 conversation:(id)a4 requestedScreenShareForParticipant:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001D4FA4((uint64_t)v11, (uint64_t)v9, v10);
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001D525C();
}

- (void)conversationManager:(id)a3 handoffEligibilityChangedToConversation:(id)a4 fromPreviousConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001D6CB4();
}

@end