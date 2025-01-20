@interface NeighborhoodActivityConduitServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer)init;
- (void)addConversationParticipantsWithAnonyms:(id)a3 completion:(id)a4;
- (void)addConversationParticipantsWithHandles:(id)a3 completion:(id)a4;
- (void)cancelFaceTimeHandoffWithDevice:(id)a3 completion:(id)a4;
- (void)cancelPendingJoinRequest;
- (void)cancelPreparingConversation:(id)a3 completion:(id)a4;
- (void)createConversationWithLinkURL:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)declineContinuityCallWithUUID:(id)a3 completion:(id)a4;
- (void)endContinuitySessionWithDevice:(id)a3 completion:(id)a4;
- (void)fetchNearbyConversations:(id)a3;
- (void)getAddressableContactsWithCompletion:(id)a3;
- (void)getCurrentContinuitySessionWithCompletion:(id)a3;
- (void)getCurrentSplitSessionWithCompletion:(id)a3;
- (void)getImageForContactIdentifier:(id)a3 completion:(id)a4;
- (void)joinContinuityConversationWithRequest:(id)a3 completion:(id)a4;
- (void)joinConversation:(id)a3 onDevice:(id)a4 withContext:(int64_t)a5 completion:(id)a6;
- (void)sendLetMeInRequestForConversationUUID:(id)a3 completion:(id)a4;
- (void)startContinuitySessionWithDevice:(id)a3 completion:(id)a4;
- (void)startConversationWithAnonyms:(id)a3 completion:(id)a4;
- (void)startConversationWithAnonyms:(id)a3 mode:(unint64_t)a4 completion:(id)a5;
- (void)startConversationWithHandles:(id)a3 completion:(id)a4;
- (void)startConversationWithHandles:(id)a3 mode:(unint64_t)a4 completion:(id)a5;
@end

@implementation NeighborhoodActivityConduitServer

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_cancellables);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_cancellables,  v9,  1LL,  0LL);
  uint64_t v5 = *v4;
  uint64_t *v4 = (uint64_t)&_swiftEmptySetSingleton;
  v6 = self;
  swift_bridgeObjectRelease(v5);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_1000CD620 != -1) {
    swift_once(&qword_1000CD620, sub_100011124);
  }
  CFNotificationCenterRemoveObserver(v7, 0LL, (CFNotificationName)qword_1000CE1B0, 0LL);

  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[NeighborhoodActivityConduitServer dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_conduit));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_suggestionController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_continuitySessionClient));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_connections));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_splitSessionApprovalConnection));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v7 = swift_allocObject(&unk_1000C30D8, 24LL, 7LL);
  swift_unknownObjectWeakInit(v7 + 16, self);
  v12[2] = v7;
  v12[3] = a4;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  OS_dispatch_queue.sync<A>(execute:)(&v13, sub_100018DA8, v12, &type metadata for Bool);

  swift_release(v7);
  return v13;
}

- (void)fetchNearbyConversations:(id)a3
{
  uint64_t v5 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000C3088, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1000C30B0, 56LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = self;
  v11[5] = sub_100018C3C;
  v11[6] = v9;
  v12 = self;
  swift_retain(v9);
  uint64_t v13 = sub_10004EC20((uint64_t)v7, (uint64_t)&unk_1000CE530, (uint64_t)v11);

  swift_release(v9);
  swift_release(v13);
}

- (void)getCurrentSplitSessionWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000C3038, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1000C3060, 56LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = sub_100018B78;
  v11[5] = v9;
  v11[6] = self;
  v12 = self;
  swift_retain(v9);
  uint64_t v13 = sub_10004EC20((uint64_t)v7, (uint64_t)&unk_1000CE520, (uint64_t)v11);

  swift_release(v9);
  swift_release(v13);
}

- (void)joinConversation:(id)a3 onDevice:(id)a4 withContext:(int64_t)a5 completion:(id)a6
{
  id v35 = a4;
  int64_t v36 = a5;
  v34 = self;
  uint64_t v8 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v33 = v10;
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  v15 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  v17 = (char *)&v33 - v16;
  v18 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v19 = swift_allocObject(&unk_1000C2FE8, 24LL, 7LL);
  *(void *)(v19 + 16) = v18;
  uint64_t v20 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v10, 1LL, 1LL, v20);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  uint64_t v21 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v22 = (v21 + 56) & ~v21;
  unint64_t v23 = (v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  v25 = (char *)swift_allocObject(&unk_1000C3010, v24 + 8, v21 | 7);
  *((void *)v25 + 2) = 0LL;
  *((void *)v25 + 3) = 0LL;
  *((void *)v25 + 4) = sub_1000193C8;
  *((void *)v25 + 5) = v19;
  v26 = v34;
  *((void *)v25 + 6) = v34;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v25[v22], v15, v11);
  v27 = v35;
  int64_t v28 = v36;
  *(void *)&v25[v23] = v35;
  *(void *)&v25[v24] = v28;
  id v29 = v27;
  v30 = v26;
  id v31 = v29;
  swift_retain(v19);
  uint64_t v32 = sub_10004EC20((uint64_t)v33, (uint64_t)&unk_1000CE510, (uint64_t)v25);

  swift_release(v19);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

- (void)cancelPendingJoinRequest
{
  v2 = self;
  sub_100013FC4();
}

- (void)getCurrentContinuitySessionWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000C2F48, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1000C2F70, 56LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = self;
  v11[5] = sub_1000193CC;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain(v9);
  uint64_t v13 = sub_10004EC20((uint64_t)v7, (uint64_t)&unk_1000CE4E0, (uint64_t)v11);

  swift_release(v9);
  swift_release(v13);
}

- (void)startContinuitySessionWithDevice:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject(&unk_1000C2EF8, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_1000C2F20, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  v16[7] = sub_100018634;
  v16[8] = v14;
  v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE4D0, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)createConversationWithLinkURL:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - v15;
  v17 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v18 = swift_allocObject(&unk_1000C2EA8, 24LL, 7LL);
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v9, 1LL, 1LL, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = (v20 + 40) & ~v20;
  unint64_t v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v23 = (char *)swift_allocObject(&unk_1000C2ED0, v22 + 16, v20 | 7);
  *((void *)v23 + 2) = 0LL;
  *((void *)v23 + 3) = 0LL;
  *((void *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  unint64_t v24 = &v23[v22];
  *(void *)unint64_t v24 = sub_1000193C8;
  *((void *)v24 + 1) = v18;
  v25 = self;
  swift_retain(v18);
  uint64_t v26 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE4C0, (uint64_t)v23);

  swift_release(v18);
  swift_release(v26);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)sendLetMeInRequestForConversationUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v18 = swift_allocObject(&unk_1000C2E58, 24LL, 7LL);
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v9, 1LL, 1LL, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = (v20 + 40) & ~v20;
  unint64_t v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v23 = (char *)swift_allocObject(&unk_1000C2E80, v22 + 16, v20 | 7);
  *((void *)v23 + 2) = 0LL;
  *((void *)v23 + 3) = 0LL;
  *((void *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  unint64_t v24 = (void (**)(uint64_t))&v23[v22];
  *unint64_t v24 = sub_1000193D8;
  v24[1] = (void (*)(uint64_t))v18;
  v25 = self;
  swift_retain(v18);
  uint64_t v26 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE4B0, (uint64_t)v23);

  swift_release(v18);
  swift_release(v26);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)cancelPreparingConversation:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v18 = swift_allocObject(&unk_1000C2E08, 24LL, 7LL);
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v9, 1LL, 1LL, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = (v20 + 40) & ~v20;
  unint64_t v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v23 = (char *)swift_allocObject(&unk_1000C2E30, v22 + 16, v20 | 7);
  *((void *)v23 + 2) = 0LL;
  *((void *)v23 + 3) = 0LL;
  *((void *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  unint64_t v24 = (void (**)(uint64_t))&v23[v22];
  *unint64_t v24 = sub_1000193D8;
  v24[1] = (void (*)(uint64_t))v18;
  v25 = self;
  swift_retain(v18);
  uint64_t v26 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE4A0, (uint64_t)v23);

  swift_release(v18);
  swift_release(v26);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)endContinuitySessionWithDevice:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject(&unk_1000C2DB8, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_1000C2DE0, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  v16[7] = sub_1000193C4;
  v16[8] = v14;
  v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE490, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)cancelFaceTimeHandoffWithDevice:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject(&unk_1000C2D68, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_1000C2D90, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  v16[7] = sub_1000193D8;
  v16[8] = v14;
  v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE480, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)joinContinuityConversationWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1000C2D18, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1000C2D40, 64LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_1000193D8;
  v13[7] = v11;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = v14;
  swift_retain(v11);
  uint64_t v17 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE470, (uint64_t)v13);

  swift_release(v11);
  swift_release(v17);
}

- (void)declineContinuityCallWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  id v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  id v16 = (char *)&v27 - v15;
  uint64_t v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v18 = swift_allocObject(&unk_1000C2CC8, 24LL, 7LL);
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v9, 1LL, 1LL, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = (v20 + 40) & ~v20;
  unint64_t v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v23 = (char *)swift_allocObject(&unk_1000C2CF0, v22 + 16, v20 | 7);
  *((void *)v23 + 2) = 0LL;
  *((void *)v23 + 3) = 0LL;
  *((void *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  unint64_t v24 = (void (**)(uint64_t))&v23[v22];
  *unint64_t v24 = sub_10001813C;
  v24[1] = (void (*)(uint64_t))v18;
  v25 = self;
  swift_retain(v18);
  uint64_t v26 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE460, (uint64_t)v23);

  swift_release(v18);
  swift_release(v26);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)startConversationWithHandles:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = sub_1000052E0(0LL, (unint64_t *)&unk_1000CE390, &OBJC_CLASS___TUHandle_ptr);
  uint64_t v12 = sub_100017D34( (unint64_t *)&unk_1000CE3A0,  (unint64_t *)&unk_1000CE390,  &OBJC_CLASS___TUHandle_ptr);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  uint64_t v14 = swift_allocObject(&unk_1000C2C78, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  id v16 = (void *)swift_allocObject(&unk_1000C2CA0, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = sub_1000193C8;
  v16[5] = v14;
  v16[6] = self;
  v16[7] = v13;
  v16[8] = 2LL;
  uint64_t v17 = self;
  swift_retain(v14);
  swift_bridgeObjectRetain(v13);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE450, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)startConversationWithAnonyms:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = sub_1000052E0(0LL, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr);
  uint64_t v12 = sub_100017D34(&qword_1000CE3C8, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  uint64_t v14 = swift_allocObject(&unk_1000C2C28, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  id v16 = (void *)swift_allocObject(&unk_1000C2C50, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = sub_1000193C8;
  v16[5] = v14;
  v16[6] = self;
  v16[7] = v13;
  v16[8] = 2LL;
  uint64_t v17 = self;
  swift_retain(v14);
  swift_bridgeObjectRetain(v13);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE448, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)startConversationWithHandles:(id)a3 mode:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = sub_1000052E0(0LL, (unint64_t *)&unk_1000CE390, &OBJC_CLASS___TUHandle_ptr);
  uint64_t v14 = sub_100017D34( (unint64_t *)&unk_1000CE3A0,  (unint64_t *)&unk_1000CE390,  &OBJC_CLASS___TUHandle_ptr);
  uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v13, v14);
  uint64_t v16 = swift_allocObject(&unk_1000C2BD8, 24LL, 7LL);
  *(void *)(v16 + 16) = v12;
  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v11, 1LL, 1LL, v17);
  uint64_t v18 = (void *)swift_allocObject(&unk_1000C2C00, 72LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = sub_1000193C8;
  v18[5] = v16;
  v18[6] = self;
  v18[7] = v15;
  v18[8] = a4;
  uint64_t v19 = self;
  swift_retain(v16);
  swift_bridgeObjectRetain(v15);
  uint64_t v20 = sub_10004EC20((uint64_t)v11, (uint64_t)&unk_1000CE438, (uint64_t)v18);

  swift_bridgeObjectRelease(v15);
  swift_release(v16);
  swift_release(v20);
}

- (void)startConversationWithAnonyms:(id)a3 mode:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = sub_1000052E0(0LL, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr);
  uint64_t v14 = sub_100017D34(&qword_1000CE3C8, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr);
  uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v13, v14);
  uint64_t v16 = swift_allocObject(&unk_1000C2B88, 24LL, 7LL);
  *(void *)(v16 + 16) = v12;
  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v11, 1LL, 1LL, v17);
  uint64_t v18 = (void *)swift_allocObject(&unk_1000C2BB0, 72LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = sub_100017FB4;
  v18[5] = v16;
  v18[6] = self;
  v18[7] = v15;
  v18[8] = a4;
  uint64_t v19 = self;
  swift_retain(v16);
  swift_bridgeObjectRetain(v15);
  uint64_t v20 = sub_10004EC20((uint64_t)v11, (uint64_t)&unk_1000CE418, (uint64_t)v18);

  swift_bridgeObjectRelease(v15);
  swift_release(v16);
  swift_release(v20);
}

- (void)getAddressableContactsWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000C2B38, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1000C2B60, 56LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = self;
  v11[5] = sub_100017F40;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain(v9);
  uint64_t v13 = sub_10004EC20((uint64_t)v7, (uint64_t)&unk_1000CE3F8, (uint64_t)v11);

  swift_release(v9);
  swift_release(v13);
}

- (void)getImageForContactIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject(&unk_1000C2AE8, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_1000C2B10, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = sub_100017E80;
  v16[5] = v14;
  v16[6] = self;
  v16[7] = v11;
  v16[8] = v13;
  uint64_t v17 = self;
  swift_retain(v14);
  swift_bridgeObjectRetain(v13);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE3E8, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)addConversationParticipantsWithAnonyms:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = sub_1000052E0(0LL, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr);
  uint64_t v12 = sub_100017D34(&qword_1000CE3C8, &qword_1000CE3C0, &OBJC_CLASS___TUContinuityHandleAnonym_ptr);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  uint64_t v14 = swift_allocObject(&unk_1000C2A98, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_1000C2AC0, 64LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = self;
  v16[5] = v13;
  v16[6] = sub_1000193C4;
  v16[7] = v14;
  uint64_t v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE3D8, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)addConversationParticipantsWithHandles:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = sub_1000052E0(0LL, (unint64_t *)&unk_1000CE390, &OBJC_CLASS___TUHandle_ptr);
  uint64_t v12 = sub_100017D34( (unint64_t *)&unk_1000CE3A0,  (unint64_t *)&unk_1000CE390,  &OBJC_CLASS___TUHandle_ptr);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  uint64_t v14 = swift_allocObject(&unk_1000C2A48, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_1000C2A70, 64LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = self;
  v16[5] = v13;
  v16[6] = sub_100017D74;
  v16[7] = v14;
  uint64_t v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  uint64_t v18 = sub_10004EC20((uint64_t)v9, (uint64_t)&unk_1000CE3B8, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (_TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer)init
{
  result = (_TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer *)_swift_stdlib_reportUnimplementedInitializer("com_apple_NeighborhoodActivityConduitService.NeighborhoodActivityConduitServer", 78LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

@end