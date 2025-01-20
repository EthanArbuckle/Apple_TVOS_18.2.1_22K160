@interface CSDBlockUtilities
- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4;
- (CSDBlockUtilities)init;
- (int64_t)blockCallReasonForHandles:(id)a3 providerIdentifier:(id)a4 callDataSource:(id)a5;
- (void)reportFailureForReason:(int64_t)a3 provider:(id)a4 callUUID:(id)a5 actionToFail:(id)a6;
@end

@implementation CSDBlockUtilities

- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4
{
  uint64_t v7 = sub_1001B4B94(0LL, (unint64_t *)&unk_100447E20, &OBJC_CLASS___TUConversationMember_ptr);
  uint64_t v8 = sub_1001BBBCC( (unint64_t *)&qword_10044A420,  (unint64_t *)&unk_100447E20,  &OBJC_CLASS___TUConversationMember_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  v12 = self;
  LOBYTE(a4) = sub_1001BB5F8(v9);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v11);
  return a4 & 1;
}

- (int64_t)blockCallReasonForHandles:(id)a3 providerIdentifier:(id)a4 callDataSource:(id)a5
{
  uint64_t v9 = sub_1001B4B94(0LL, &qword_10044A440, &OBJC_CLASS___CXHandle_ptr);
  uint64_t v10 = sub_1001BBBCC((unint64_t *)&unk_100447A80, &qword_10044A440, &OBJC_CLASS___CXHandle_ptr);
  uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v9, v10);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  id v15 = a5;
  v16 = self;
  int64_t v17 = sub_1001BB724(v11, v12, v14, v15);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  return v17;
}

- (void)reportFailureForReason:(int64_t)a3 provider:(id)a4 callUUID:(id)a5 actionToFail:(id)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v15 = a4;
  id v16 = a6;
  int64_t v17 = self;
  sub_1001BB85C(a3, v15, (uint64_t)v14, a6);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (CSDBlockUtilities)init
{
  return (CSDBlockUtilities *)sub_1001BBAC4();
}

- (void).cxx_destruct
{
}

@end