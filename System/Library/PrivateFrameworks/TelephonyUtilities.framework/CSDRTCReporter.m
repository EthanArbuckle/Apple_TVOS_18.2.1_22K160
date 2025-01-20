@interface CSDRTCReporter
- (CSDRTCReporter)init;
- (CSDRTCReporter)initWithQueue:(id)a3;
- (CSDRTCReporter)initWithQueue:(id)a3 chManager:(id)a4;
- (void)reportingController:(id)a3 AVCBlobRecoveryStartedForConversation:(id)a4;
- (void)reportingController:(id)a3 AVCBlobRecoveryTimedOutForConversation:(id)a4;
- (void)reportingController:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)reportingController:(id)a3 addedActiveConversation:(id)a4;
- (void)reportingController:(id)a3 avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 callUUID:(id)a4 withUserScore:(int)a5;
- (void)reportingController:(id)a3 createConversationReportingSessionForConversation:(id)a4;
- (void)reportingController:(id)a3 messageRetryFailedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 messageRetryStartedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 messageRetrySucceededForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 oneToOneModeSwitchFailureForConversation:(id)a4 isOneToOneMode:(BOOL)a5;
- (void)reportingController:(id)a3 pickedRoute:(id)a4 forCall:(id)a5;
- (void)reportingController:(id)a3 receivedConnectionSetupReport:(id)a4 eventType:(int64_t)a5 forConversation:(id)a6;
- (void)reportingController:(id)a3 receivedGroupActivitiesReports:(id)a4 forConversation:(id)a5;
- (void)reportingController:(id)a3 receivedHandoffReport:(id)a4 forConversation:(id)a5;
- (void)reportingController:(id)a3 receivedIDSChat:(id)a4;
- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forConversation:(id)a5;
- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forSessionWithUUID:(id)a5;
- (void)reportingController:(id)a3 receivedLetMeInRequestForConversation:(id)a4;
- (void)reportingController:(id)a3 remoteMemberNotInMemberListForConversation:(id)a4;
- (void)reportingController:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)reportingController:(id)a3 removedActiveConversation:(id)a4;
- (void)reportingController:(id)a3 sentLetMeInResponseForConversation:(id)a4 isApproved:(BOOL)a5;
- (void)reportingController:(id)a3 stateChangedForConversation:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
- (void)reportingController:(id)a3 timedOutPickingRoute:(id)a4 forCall:(id)a5;
- (void)reportingController:(id)a3 transitionAttemptForConversation:(id)a4;
- (void)reportingController:(id)a3 voipAppBecameDisabledFromLaunching:(id)a4;
- (void)reportingController:(id)a3 voipAppFailedToPostIncomingCall:(id)a4;
- (void)reportingController:(id)a3 voipDOSCallIgnored:(id)a4;
- (void)reportingController:(id)a3 voipPushDroppedOnTheFloor:(id)a4;
@end

@implementation CSDRTCReporter

- (CSDRTCReporter)initWithQueue:(id)a3
{
  return result;
}

- (CSDRTCReporter)initWithQueue:(id)a3 chManager:(id)a4
{
  return result;
}

- (void)reportingController:(id)a3 createConversationReportingSessionForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 timedOutPickingRoute:(id)a4 forCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001BFCB4();
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1001BC630();
}

- (void)reportingController:(id)a3 pickedRoute:(id)a4 forCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1001BFCB4();
}

- (void)reportingController:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C1BBC();
}

- (void)reportingController:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 addedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C1BBC();
}

- (void)reportingController:(id)a3 AVCBlobRecoveryStartedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 remoteMemberNotInMemberListForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 transitionAttemptForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 AVCBlobRecoveryTimedOutForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 oneToOneModeSwitchFailureForConversation:(id)a4 isOneToOneMode:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1001C4CD8();
}

- (void)reportingController:(id)a3 messageRetryStartedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 messageRetryFailedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 messageRetrySucceededForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forConversation:(id)a5
{
}

- (void)reportingController:(id)a3 receivedIDSChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001C1BBC();
}

- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forSessionWithUUID:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_1001AFF14(&qword_100447B60);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v13);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v15 = a3;
  v16 = self;
  sub_1001C21C0();

  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)reportingController:(id)a3 receivedHandoffReport:(id)a4 forConversation:(id)a5
{
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  sub_1001C3D64();

  swift_bridgeObjectRelease(v8);
}

- (void)reportingController:(id)a3 receivedConnectionSetupReport:(id)a4 eventType:(int64_t)a5 forConversation:(id)a6
{
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v10 = a3;
  id v11 = a6;
  v12 = self;
  sub_1001C35C0();

  swift_bridgeObjectRelease(v9);
}

- (void)reportingController:(id)a3 receivedGroupActivitiesReports:(id)a4 forConversation:(id)a5
{
}

- (void)reportingController:(id)a3 voipAppFailedToPostIncomingCall:(id)a4
{
}

- (void)reportingController:(id)a3 voipAppBecameDisabledFromLaunching:(id)a4
{
}

- (void)reportingController:(id)a3 voipPushDroppedOnTheFloor:(id)a4
{
}

- (void)reportingController:(id)a3 voipDOSCallIgnored:(id)a4
{
}

- (void)reportingController:(id)a3 receivedLetMeInRequestForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1001C4A54();
}

- (void)reportingController:(id)a3 sentLetMeInResponseForConversation:(id)a4 isApproved:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_1001C4CD8();
}

- (void)reportingController:(id)a3 callUUID:(id)a4 withUserScore:(int)a5
{
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_1001BE3F4();

  swift_bridgeObjectRelease(v8);
}

- (CSDRTCReporter)init
{
}

- (void).cxx_destruct
{
}

@end