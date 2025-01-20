@interface CSDConversationLinkManager
- (CSDConversationLinkManager)init;
- (CSDConversationLinkManagerDelegate)delegate;
- (id)activateLinkForPseudonym:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5;
- (id)conversationLinkDescriptorsWithGroupUUIDs:(id)a3 error:(id *)a4;
- (id)decryptLetMeInResponse:(id)a3 pseudonym:(id)a4 requestorKeyAgreement:(id)a5;
- (id)fetchActivatedLinksWithError:(id *)a3;
- (id)fetchDeletedLinksWithError:(id *)a3;
- (id)getInactiveLinkForHandle:(id)a3;
- (void)activateLinkForPseudonym:(id)a3 completionHandler:(id)a4;
- (void)activatedLinksWithCompletionHandler:(id)a3;
- (void)activeAccountsChangedForService:(id)a3;
- (void)addInvitedHandles:(id)a3 pseudonym:(id)a4 completionHandler:(id)a5;
- (void)checkLinkValidityWithPseudonym:(id)a3 completionHandler:(id)a4;
- (void)decryptLetMeInRequest:(id)a3 pseudonym:(id)a4 fromHandle:(id)a5 completionHandler:(id)a6;
- (void)encryptLetMeInRequest:(id)a3 link:(id)a4 completionHandler:(id)a5;
- (void)generateAllInactiveLinksFor:(id)a3;
- (void)generateInactiveLinkFor:(id)a3 afterActivation:(BOOL)a4;
- (void)generateLinkWithGroupUUID:(id)a3 invitedHandles:(id)a4 originatorHandle:(id)a5 linkLifetimeScope:(int64_t)a6 completionHandler:(id)a7;
- (void)generateLinkWithInvitedHandles:(id)a3 originatorHandle:(id)a4 linkLifetimeScope:(int64_t)a5 completionHandler:(id)a6;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkForHandle:(id)a3 completionHandler:(id)a4;
- (void)getLinkDescriptorWithPseudonym:(id)a3 includeInactive:(BOOL)a4 completionHandler:(id)a5;
- (void)linkSyncStateWithIncludeLinks:(BOOL)a3 completion:(id)a4;
- (void)recoverLinksForPseudonyms:(id)a3;
- (void)renewLinkWithPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)renewPseudonymIfNeeded:(NSString *)a3 completionHandler:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)service:(id)a3 pseudonymRemoved:(id)a4;
- (void)service:(id)a3 pseudonymUpdated:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLinkName:(id)a3 forLink:(id)a4 completionHandler:(id)a5;
- (void)storeReceivedLink:(id)a3 fromHandle:(id)a4 isUpdate:(BOOL)a5 completionHandler:(id)a6;
- (void)validateAllLinks;
@end

@implementation CSDConversationLinkManager

- (CSDConversationLinkManager)init
{
  return (CSDConversationLinkManager *)sub_1002132A4();
}

- (CSDConversationLinkManagerDelegate)delegate
{
  return (CSDConversationLinkManagerDelegate *)(id)sub_1002133B4();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  sub_100213410((uint64_t)a3);
}

- (id)fetchActivatedLinksWithError:(id *)a3
{
  return sub_100213744(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_100213428);
}

- (id)fetchDeletedLinksWithError:(id *)a3
{
  return sub_100213744(self, (uint64_t)a2, (uint64_t)a3, sub_1002135F4);
}

- (void)activatedLinksWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1003E26D0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100213C10(sub_10022C8A0, v5);

  swift_release(v5);
}

- (void)generateLinkWithGroupUUID:(id)a3 invitedHandles:(id)a4 originatorHandle:(id)a5 linkLifetimeScope:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v12 = type metadata accessor for UUID(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v16 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    uint64_t v17 = sub_1001B4B94(0LL, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
    sub_10022B8BC((unint64_t *)&qword_100447ED0, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
    a4 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v17, v18);
  }

  uint64_t v19 = swift_allocObject(&unk_1003E26A8, 24LL, 7LL);
  *(void *)(v19 + 16) = v16;
  id v20 = a5;
  v21 = self;
  sub_100214080();
  swift_release(v19);

  swift_bridgeObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)generateLinkWithInvitedHandles:(id)a3 originatorHandle:(id)a4 linkLifetimeScope:(int64_t)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = sub_1001B4B94(0LL, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
  sub_10022B8BC((unint64_t *)&qword_100447ED0, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  _Block_copy(v10);
  id v15 = a4;
  uint64_t v14 = self;
  sub_100214978(v13, v15, a5, (char *)v14, v10);
  _Block_release(v10);
  swift_bridgeObjectRelease(v13);
}

- (void)storeReceivedLink:(id)a3 fromHandle:(id)a4 isUpdate:(BOOL)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject(&unk_1003E2608, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  id v15 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_100214DDC(v15, v14, a5, (uint64_t)sub_10022CACC, v11);
  swift_release(v11);
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1003E25E0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_1002162BC(a3, (uint64_t)sub_10022C744, v7);

  swift_release(v7);
}

- (void)activateLinkForPseudonym:(id)a3 completionHandler:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject(&unk_1003E25B8, 24LL, 7LL);
    *(void *)(v9 + 16) = v6;
    v6 = sub_10022CAC8;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v10 = self;
  sub_100216744();
  sub_1001B5D3C((uint64_t)v6, v9);
  swift_bridgeObjectRelease(v8);
}

- (id)activateLinkForPseudonym:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5
{
  uint64_t v9 = sub_1001AFF14((uint64_t *)&unk_10044A400);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v14 = type metadata accessor for UUID(0LL);
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v14 = type metadata accessor for UUID(0LL);
    uint64_t v15 = 1LL;
  }

  sub_1001A9670((uint64_t)v11, v15, 1LL, v14);
  if (a5)
  {
    uint64_t v16 = sub_1001B4B94(0LL, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
    sub_10022B8BC((unint64_t *)&qword_100447ED0, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
    a5 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, v17);
  }

  uint64_t v18 = self;
  sub_100216D98();
  id v20 = v19;
  swift_bridgeObjectRelease(v13);

  swift_bridgeObjectRelease(a5);
  sub_1002011C8((uint64_t)v11, (uint64_t *)&unk_10044A400);
  return v20;
}

- (void)generateAllInactiveLinksFor:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100217900(v5);
}

- (void)generateInactiveLinkFor:(id)a3 afterActivation:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v6 = self;
  sub_100217EB8(v7, v4);
}

- (void)getInactiveLinkForHandle:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1003E2590, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1002187C8(v8, sub_10022CACC, v7);

  swift_release(v7);
}

- (id)getInactiveLinkForHandle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100218BE8();

  return v6;
}

- (void)getLinkDescriptorWithPseudonym:(id)a3 includeInactive:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_1003E2568, 24LL, 7LL);
  *(void *)(v10 + 16) = v7;
  uint64_t v11 = self;
  sub_100218F08();

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (id)conversationLinkDescriptorsWithGroupUUIDs:(id)a3 error:(id *)a4
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  uint64_t v8 = self;
  uint64_t v9 = sub_100219170(v7);
  swift_bridgeObjectRelease(v7);

  sub_1001B4B94(0LL, &qword_1004475B0, &OBJC_CLASS___TUConversationLinkDescriptor_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (void)validateAllLinks
{
  v2 = self;
  sub_1002194A0();
}

- (void)renewLinkWithPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (v13)
  {
    uint64_t v16 = swift_allocObject(&unk_1003E24F0, 24LL, 7LL);
    *(void *)(v16 + 16) = v13;
    uint64_t v13 = sub_10022C73C;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  uint64_t v17 = self;
  sub_10021B9C8();
  sub_1001B5D3C((uint64_t)v13, v16);
  swift_bridgeObjectRelease(v15);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)checkLinkValidityWithPseudonym:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = swift_allocObject(&unk_1003E24C8, 24LL, 7LL);
    *(void *)(v9 + 16) = v6;
    uint64_t v6 = sub_10022C734;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = self;
  sub_10021BE18();
  sub_1001B5D3C((uint64_t)v6, v9);
  swift_bridgeObjectRelease(v8);
}

- (void)setLinkName:(id)a3 forLink:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject(&unk_1003E24A0, 24LL, 7LL);
    *(void *)(v11 + 16) = v8;
    uint64_t v8 = sub_10022C71C;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  id v13 = a4;
  uint64_t v12 = self;
  sub_10021D1DC();
  sub_1001B5D3C((uint64_t)v8, v11);
  swift_bridgeObjectRelease(v10);
}

- (void)encryptLetMeInRequest:(id)a3 link:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_10021DC6C(v9, v10, (uint64_t)v11, v8);
  _Block_release(v8);
}

- (void)decryptLetMeInRequest:(id)a3 pseudonym:(id)a4 fromHandle:(id)a5 completionHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v14 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  sub_10021EF08(v14, v11, v12, v13, (void (**)(void, void, void, void))v10);
  _Block_release(v10);
}

- (id)decryptLetMeInResponse:(id)a3 pseudonym:(id)a4 requestorKeyAgreement:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_10021FC6C(v8, v12, (os_log_type_t)v10);
  id v14 = v13;

  return v14;
}

- (void)addInvitedHandles:(id)a3 pseudonym:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = sub_1001B4B94(0LL, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
  sub_10022B8BC((unint64_t *)&qword_100447ED0, &qword_10044A410, &OBJC_CLASS___TUHandle_ptr);
  uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v9, v10);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  _Block_copy(v8);
  uint64_t v15 = self;
  sub_10021FF50(v11, v12, v14, (uint64_t)v15, (void (**)(void, void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  id v4 = self;
  sub_1002205C0(a3);
}

- (void)recoverLinksForPseudonyms:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  id v5 = self;
  sub_100220640();

  swift_bridgeObjectRelease(v4);
}

- (void)linkSyncStateWithIncludeLinks:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_1002206B8(a3, (uint64_t)v7, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (void)renewPseudonymIfNeeded:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject(&unk_1003E2428, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1002974AC((uint64_t)&unk_1004499E8, (uint64_t)v7);
}

- (void).cxx_destruct
{
}

- (void)service:(id)a3 pseudonymRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100228194();
}

- (void)service:(id)a3 pseudonymUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100228A58((uint64_t)v8, v7);
}

- (void)activeAccountsChangedForService:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100229484();
}

@end