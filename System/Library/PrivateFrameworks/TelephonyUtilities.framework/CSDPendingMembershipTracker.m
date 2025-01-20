@interface CSDPendingMembershipTracker
- (CSDPendingMembershipTracker)init;
- (CSDPendingMembershipTrackerDelegate)delegate;
- (CSDPendingMembershipTrackerMessenger)messenger;
- (id)pendingMembersByGroup;
- (id)retrievePendingMembersFor:(id)a3;
- (void)clearPendingMembershipFor:(id)a3;
- (void)handleDelegatedPendingMember:(id)a3 forConversation:(id)a4 withGroupUUID:(id)a5 from:(id)a6 transactionUUID:(id)a7;
- (void)handleNewPendingMember:(id)a3 responseKey:(id)a4 forConversation:(id)a5 withLink:(id)a6 dateInitiatedLMI:(id)a7;
- (void)handleRemoteApprovalOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6;
- (void)handleRemoteRejectionOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setMessenger:(id)a3;
- (void)stopTrackingPendingMember:(id)a3 forConversation:(id)a4 triggeredLocally:(BOOL)a5;
@end

@implementation CSDPendingMembershipTracker

- (CSDPendingMembershipTrackerMessenger)messenger
{
  return (CSDPendingMembershipTrackerMessenger *)(id)sub_1001F204C();
}

- (void)setMessenger:(id)a3
{
  v5 = self;
  sub_1001F20A4((uint64_t)a3);
}

- (CSDPendingMembershipTrackerDelegate)delegate
{
  return (CSDPendingMembershipTrackerDelegate *)(id)sub_1001F20D0();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  sub_1001F2128((uint64_t)a3);
}

- (CSDPendingMembershipTracker)init
{
  return result;
}

- (void)stopTrackingPendingMember:(id)a3 forConversation:(id)a4 triggeredLocally:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1001F21F4();
}

- (void)clearPendingMembershipFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001F2444();
}

- (id)retrievePendingMembersFor:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001F2534();
  uint64_t v11 = v10;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1001B4B94(0LL, (unint64_t *)&unk_100447E20, &OBJC_CLASS___TUConversationMember_ptr);
  sub_1001F7D5C( (unint64_t *)&qword_10044A420,  (unint64_t *)&unk_100447E20,  &OBJC_CLASS___TUConversationMember_ptr,  (uint64_t)&protocol conformance descriptor for NSObject);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  return isa;
}

- (id)pendingMembersByGroup
{
  v2 = self;
  uint64_t v3 = sub_1001F2750();

  type metadata accessor for UUID(0LL);
  sub_1001AFF14(&qword_100448C00);
  sub_1001F7E14();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (void)handleNewPendingMember:(id)a3 responseKey:(id)a4 forConversation:(id)a5 withLink:(id)a6 dateInitiatedLMI:(id)a7
{
  uint64_t v25 = type metadata accessor for Date(0LL);
  uint64_t v13 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = self;
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v23 = v22;

  static Date._unconditionallyBridgeFromObjectiveC(_:)(v19);
  sub_1001F2820();
  sub_1001BB39C(v21, v23);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v25);
}

- (void)handleDelegatedPendingMember:(id)a3 forConversation:(id)a4 withGroupUUID:(id)a5 from:(id)a6 transactionUUID:(id)a7
{
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  id v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  id v19 = (char *)&v25 - v18;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a7);
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  unint64_t v23 = self;
  sub_1001F3A30();

  id v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v17, v13);
  v24(v19, v13);
}

- (void)handleRemoteApprovalOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6
{
}

- (void)handleRemoteRejectionOfMember:(id)a3 forConversation:(id)a4 from:(id)a5 transactionUUID:(id)a6
{
}

- (void).cxx_destruct
{
}

@end