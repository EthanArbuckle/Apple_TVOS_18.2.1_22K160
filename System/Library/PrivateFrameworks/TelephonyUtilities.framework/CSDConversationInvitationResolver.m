@interface CSDConversationInvitationResolver
- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4;
- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4 invitationMessagePreferences:(id)a5;
- (BOOL)shouldShowInvitationUserNotificationForConversation:(id)a3 handle:(id)a4;
- (BOOL)shouldStartRingingTimeoutForConversation:(id)a3 handle:(id)a4;
- (CSDConversationInvitationResolver)init;
@end

@implementation CSDConversationInvitationResolver

- (CSDConversationInvitationResolver)init
{
  return (CSDConversationInvitationResolver *)sub_100268C0C();
}

- (BOOL)shouldShowInvitationUserNotificationForConversation:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100269138(v6, (uint64_t)a4, 2LL);
  LOBYTE(a4) = v9;

  return a4 & 1;
}

- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100269138(v6, (uint64_t)a4, 4LL);
  LOBYTE(a4) = v9;

  return a4 & 1;
}

- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4 invitationMessagePreferences:(id)a5
{
  unint64_t v9 = sub_100269544();
  unint64_t v10 = sub_100269580();
  uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v9, v10);
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  LOBYTE(a4) = sub_10026926C(v12, (char)a4, v11);

  swift_bridgeObjectRelease(v11);
  return a4 & 1;
}

- (BOOL)shouldStartRingingTimeoutForConversation:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1002693F0(v6, a4);
  LOBYTE(a4) = v9;

  return a4 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDConversationInvitationResolver_deviceInvitationPreferences));
}

@end