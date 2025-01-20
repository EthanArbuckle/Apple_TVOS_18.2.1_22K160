@interface CSDBlocklistUtilities
- (BOOL)blockListContainsHandles:(id)a3 providerIdentifier:(id)a4;
- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4;
- (CSDBlocklistUtilities)init;
@end

@implementation CSDBlocklistUtilities

- (BOOL)blockListContainsMembers:(id)a3 providerIdentifier:(id)a4
{
  uint64_t v7 = sub_1001B4B94(0LL, (unint64_t *)&unk_100447E20, &OBJC_CLASS___TUConversationMember_ptr);
  uint64_t v8 = sub_1001BBBCC( (unint64_t *)&qword_10044A420,  (unint64_t *)&unk_100447E20,  &OBJC_CLASS___TUConversationMember_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  v12 = self;
  LOBYTE(a4) = sub_10026F8B4(v9);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v11);
  return a4 & 1;
}

- (BOOL)blockListContainsHandles:(id)a3 providerIdentifier:(id)a4
{
  uint64_t v7 = sub_1001B4B94(0LL, &qword_10044A440, &OBJC_CLASS___CXHandle_ptr);
  uint64_t v8 = sub_1001BBBCC((unint64_t *)&unk_100447A80, &qword_10044A440, &OBJC_CLASS___CXHandle_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  v12 = self;
  sub_10026F910(v9);
  LOBYTE(a4) = v13;

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v11);
  return a4 & 1;
}

- (CSDBlocklistUtilities)init
{
  return (CSDBlocklistUtilities *)sub_10023A834();
}

@end