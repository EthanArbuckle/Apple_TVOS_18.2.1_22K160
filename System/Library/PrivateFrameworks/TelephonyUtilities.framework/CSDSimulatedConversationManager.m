@interface CSDSimulatedConversationManager
- (CSDSimulatedConversationManager)init;
- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversationWithGroupUUID:(id)a5;
- (void)createIncomingConversationWithHandles:(id)a3;
- (void)removeRemoteParticipant:(id)a3 fromConversationWithGroupUUID:(id)a4;
- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversationWithGroupUUID:(id)a5;
@end

@implementation CSDSimulatedConversationManager

- (CSDSimulatedConversationManager)init
{
  return (CSDSimulatedConversationManager *)sub_1002027C8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CSDSimulatedConversationManager___activeGroupSessionsByGroupUUID;
  uint64_t v4 = sub_1001AFF14(&qword_100449260);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  sub_1001BA48C(*(void *)&self->queue[OBJC_IVAR___CSDSimulatedConversationManager_localCallerID]);
}

- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversationWithGroupUUID:(id)a5
{
}

- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversationWithGroupUUID:(id)a5
{
}

- (void)removeRemoteParticipant:(id)a3 fromConversationWithGroupUUID:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  v12 = self;
  sub_1002055A8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)createIncomingConversationWithHandles:(id)a3
{
  uint64_t v5 = sub_1001B4B94(0LL, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  uint64_t v7 = self;
  sub_100205BDC();

  swift_bridgeObjectRelease(v6);
}

@end