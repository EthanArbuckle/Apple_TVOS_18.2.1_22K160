@interface LiteMessageServiceSession
- (LiteMessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)deleteAllDataWithCompletionHandler:(id)a3;
- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3;
- (void)handleDaemonFinishedLaunchingWithNotification:(id)a3;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientErrorAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 incomingServiceUpdateMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 incomingSummaryMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 receivedIncomingDeliveryReceiptForIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)republishOffGridStatusIfNecessary;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5;
- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4;
- (void)sessionDidBecomeActive;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation LiteMessageServiceSession

- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientErrorAcknowledgementBlock:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_49580, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  specialized LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)( v13,  v14,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (),  v11);

  swift_release(v11);
}

- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_49508, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject(&unk_49530, 32LL, 7LL);
  *(void *)(v12 + 16) = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  *(void *)(v12 + 24) = v11;
  v19[4] = closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientAcknowledgementBlock:)partial apply;
  uint64_t v20 = v12;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256LL;
  v19[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v19[3] = &block_descriptor_23;
  id v13 = _Block_copy(v19);
  uint64_t v14 = v20;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v18 = self;
  swift_retain(v11);
  swift_release(v14);
  -[LiteMessageServiceSession messenger:incomingMessage:context:clientErrorAcknowledgementBlock:]( v18,  "messenger:incomingMessage:context:clientErrorAcknowledgementBlock:",  v15,  v16,  v17,  v13);
  _Block_release(v13);

  swift_release(v11);
}

- (void)messenger:(id)a3 incomingSummaryMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v11);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v13, 1LL, 1LL, v15);
  type metadata accessor for MainActor(0LL);
  swift_unknownObjectRetain_n(a4, 2LL);
  id v16 = self;
  id v17 = a3;
  id v18 = a5;
  uint64_t v19 = static MainActor.shared.getter(v18);
  uint64_t v20 = (void *)swift_allocObject(&unk_494E0, 48LL, 7LL);
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = a4;
  v20[5] = v16;
  uint64_t v21 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5Tm( (uint64_t)v13,  (uint64_t)&closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)partial apply,  (uint64_t)v20,  (uint64_t)&unk_49620,  (uint64_t)&type metadata for () + 8,  (uint64_t)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATu_0);
  swift_release(v21);
  _Block_release(v14);

  swift_unknownObjectRelease(a4);
}

- (void)messenger:(id)a3 receivedIncomingDeliveryReceiptForIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v12 = v11;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = self;
  specialized LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)( v10,  v12,  v14);

  swift_bridgeObjectRelease(v12);
}

- (void)messenger:(id)a3 incomingServiceUpdateMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_494B8, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  swift_unknownObjectRetain(a4, v13);
  id v14 = a5;
  id v15 = self;
  specialized LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)( a4,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (),  v11);

  swift_unknownObjectRelease(a4);
  swift_release(v11);
}

- (LiteMessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (LiteMessageServiceSession *)LiteMessageServiceSession.init(account:service:replicatingFor:)(v7, v8, a5);
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = v9;
  id v11 = a3;
  id v12 = self;
  LiteMessageServiceSession.sendMessage(_:toChat:style:)(v11, v8, v10, v5);

  swift_bridgeObjectRelease(v10);
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v14 = v13;
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  if (!a6)
  {
    uint64_t v16 = 0LL;
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v17;
  if (a7) {
LABEL_3:
  }
    a7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a7,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
LABEL_4:
  id v18 = self;
  LiteMessageServiceSession.joinChat(_:handleInfo:style:groupID:joinProperties:)( v12,  v14,  v15,  a5,  v16,  a6,  (uint64_t)a7);

  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(a7);
  swift_bridgeObjectRelease(a6);
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  int v76 = a5;
  uint64_t v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  uint64_t v16 = (LiteMessageServiceSession *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a4,  (char *)&type metadata for Any + 8);
  if (a6)
  {
    uint64_t v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v17;
    if (a7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = 0LL;
    uint64_t v20 = 0LL;
    if (a8) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v74 = 0LL;
  if (!a7) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  uint64_t v20 = v19;
  if (a8)
  {
LABEL_4:
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
    a8 = v22;
    goto LABEL_8;
  }

- (void)sessionDidBecomeActive
{
  v2 = self;
  LiteMessageServiceSession.sessionDidBecomeActive()();
}

- (void)republishOffGridStatusIfNecessary
{
  v2 = self;
  LiteMessageServiceSession.republishOffGridStatusIfNecessary()();
}

- (void)networkMonitorDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LiteMessageServiceSession;
  id v4 = a3;
  int v5 = self;
  -[LiteMessageServiceSession networkMonitorDidUpdate:](&v6, "networkMonitorDidUpdate:", v4);
}

- (void)deleteAllDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v5);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_497A8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  id v11 = (void *)swift_allocObject(&unk_497D0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LiteMessageServiceSession.deleteAllData();
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_497F8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  uint64_t v13 = self;
  uint64_t v14 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5( (uint64_t)v7,  (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu,  (uint64_t)v12);
  swift_release(v14);
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->state[OBJC_IVAR___LiteMessageServiceSession_state];
  id v3 = *(id *)&self->IMDAppleServiceSession_opaque[OBJC_IVAR___LiteMessageServiceSession_state];

  swift_release(v2);
}

- (void)handleDaemonFinishedLaunchingWithNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = self;
  LiteMessageServiceSession.donateHandlesForKeyExchange()();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3
{
  id v4 = (LiteMessageServiceSession *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v5 = self;
  LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7);
  unsigned __int8 v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v9, 1LL, 1LL, v10);
  type metadata accessor for MainActor(0LL);
  id v11 = a3;
  swift_unknownObjectRetain_n(a4, 2LL);
  id v12 = self;
  id v13 = v11;
  uint64_t v14 = static MainActor.shared.getter(v13);
  uint64_t v15 = (void *)swift_allocObject(&unk_49EF8, 56LL, 7LL);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v13;
  v15[6] = a4;
  uint64_t v16 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5( (uint64_t)v9,  (uint64_t)&closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)partial apply,  (uint64_t)v15);

  swift_unknownObjectRelease(a4);
  swift_release(v16);
}

- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = v10;
  id v12 = self;
  specialized LiteMessageServiceSession.sentDowngradeRequest(toHandleID:fromID:)(v6, v8, v9, (unint64_t)v11);

  swift_bridgeObjectRelease(v8, v13, v14, v15, v16, v17, v18, v19);
  swift_bridgeObjectRelease(v11, v20, v21, v22, v23, v24, v25, v26);
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  uint64_t v2 = self;
  LiteMessageServiceSession.performFirstUnlockTasks()();
}

@end