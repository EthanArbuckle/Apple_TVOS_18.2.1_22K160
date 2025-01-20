@interface AKSharedAccountsStorageController
- (AKSharedAccountsStorageController)init;
- (AKSharedAccountsStorageController)initWithKeychainStorageController:(id)a3 keychainGroupManager:(id)a4;
- (BOOL)addSharedAccountWithCredential:(id)a3 error:(id *)a4;
- (BOOL)cleanupAllItemsFrom:(id)a3 error:(id *)a4;
- (BOOL)removeAllAccountsBelongingToParticipantWithParticipantID:(id)a3 from:(id)a4 error:(id *)a5;
- (BOOL)removeSharedAccount:(id)a3 error:(id *)a4;
- (id)shareTokenForAccount:(id)a3 inGroup:(id)a4 error:(id *)a5;
- (void)fetchAccountsSharedWithCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchAllAccountsSharedByCurrentUserWithCompletionHandler:(id)a3;
- (void)fetchAllSharedAccountsWithShareTokenWithCompletionHandler:(id)a3;
- (void)fetchSharedAccountsWithGroupID:(NSString *)a3 completionHandler:(id)a4;
- (void)isMemberOfGroupWithGroupID:(NSString *)a3 completion:(id)a4;
- (void)removeAllAccountsBelongingToCurrentUserFrom:(NSString *)a3 completionHandler:(id)a4;
- (void)removeSharedAccountBelongingToCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation AKSharedAccountsStorageController

- (AKSharedAccountsStorageController)initWithKeychainStorageController:(id)a3 keychainGroupManager:(id)a4
{
  return (AKSharedAccountsStorageController *)sub_1000DADE0((uint64_t)a3, (uint64_t)a4, (char *)self);
}

- (BOOL)addSharedAccountWithCredential:(id)a3 error:(id *)a4
{
  return sub_1000D8E2C(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1000D4DB8);
}

- (void)fetchSharedAccountsWithGroupID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1001CC010, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CC038, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E3A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CC060, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E3A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E3B0, (uint64_t)v14);
  swift_release(v17);
}

- (void)fetchAllSharedAccountsWithShareTokenWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CBF98, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1001CBFC0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020E380;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1001CBFE8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020E388;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020E390, (uint64_t)v12);
  swift_release(v14);
}

- (void)fetchAccountsSharedWithCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1001CBF20, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CBF48, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E360;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CBF70, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E368;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E370, (uint64_t)v14);
  swift_release(v17);
}

- (id)shareTokenForAccount:(id)a3 inGroup:(id)a4 error:(id *)a5
{
  uint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  sub_1000D8050(v9);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease(v8);

  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return v13;
}

- (void)isMemberOfGroupWithGroupID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CBEA8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  NSString v13 = (void *)swift_allocObject(&unk_1001CBED0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E340;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CBEF8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E348;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E350, (uint64_t)v14);
  swift_release(v17);
}

- (BOOL)removeSharedAccount:(id)a3 error:(id *)a4
{
  return sub_1000D8E2C(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1000D8BF4);
}

- (void)fetchAllAccountsSharedByCurrentUserWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CBE30, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CBE58, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020E320;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1001CBE80, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020E328;
  v12[5] = v11;
  NSString v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020E330, (uint64_t)v12);
  swift_release(v14);
}

- (void)removeSharedAccountBelongingToCurrentUserWithClientID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CBDB8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  NSString v13 = (void *)swift_allocObject(&unk_1001CBDE0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E300;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CBE08, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E308;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E310, (uint64_t)v14);
  swift_release(v17);
}

- (void)removeAllAccountsBelongingToCurrentUserFrom:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CBD40, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  NSString v13 = (void *)swift_allocObject(&unk_1001CBD68, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E2F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CBD90, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020D190;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020D470, (uint64_t)v14);
  swift_release(v17);
}

- (BOOL)removeAllAccountsBelongingToParticipantWithParticipantID:(id)a3 from:(id)a4 error:(id *)a5
{
  uint64_t v8 = v7;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = v9;
  uint64_t v11 = self;
  sub_1000DA388();
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v10);

  return 1;
}

- (BOOL)cleanupAllItemsFrom:(id)a3 error:(id *)a4
{
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1000DA588();
  swift_bridgeObjectRelease(v6);

  return 1;
}

- (AKSharedAccountsStorageController)init
{
  result = (AKSharedAccountsStorageController *)_swift_stdlib_reportUnimplementedInitializer( "akd.SharedAccountsStorageController",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKSharedAccountsStorageController_keychainStorageController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKSharedAccountsStorageController_keychainGroupManager));
  swift_bridgeObjectRelease(*(void *)&self->keychainStorageController[OBJC_IVAR___AKSharedAccountsStorageController__cachedCurrentUserParticipantIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___AKSharedAccountsStorageController_participantIDToHandleMap));
  sub_1000BC7D4((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___AKSharedAccountsStorageController_sharedGroupsMembershipController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AKSharedAccountsStorageController__cachedSharedGroupsMembershipInfo));
}

@end