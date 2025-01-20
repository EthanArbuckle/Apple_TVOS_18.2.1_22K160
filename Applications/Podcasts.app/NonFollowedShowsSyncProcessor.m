@interface NonFollowedShowsSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)requiresNextGetTransaction;
- (_TtC8Podcasts29NonFollowedShowsSyncProcessor)init;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation NonFollowedShowsSyncProcessor

- (_TtC8Podcasts29NonFollowedShowsSyncProcessor)init
{
  return (_TtC8Podcasts29NonFollowedShowsSyncProcessor *)NonFollowedShowsSyncProcessor.init()();
}

- (void).cxx_destruct
{
  sub_100136648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_cloudSyncBugReporter));
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_signpostID;
  uint64_t v4 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_signpostState));
}

- (int64_t)operationTypeForSET
{
  return 15LL;
}

- (BOOL)hasLocalChanges
{
  uint64_t v3 = (uint64_t)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage,  &v9,  0LL,  0LL);
  sub_1001376A4(v3, (uint64_t)v10);
  uint64_t v4 = v11;
  uint64_t v5 = v12;
  sub_1001361FC(v10, v11);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 112);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  sub_100136648(v10);

  return v3 & 1;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_100147F18(v6, v8);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease(v8);
  if (v12)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
  }

  else
  {
    NSString v13 = 0LL;
  }

  return v13;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v10 = v9;
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = sub_100148400(v8, v10, a5);
  unint64_t v15 = v14;

  swift_bridgeObjectRelease(v10);
  if (v15 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100133558(v13, v15);
  }

  return isa;
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v18 = v17;
  }

  else
  {
    unint64_t v18 = 0xF000000000000000LL;
  }

  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v21 = v20;

  if (!a6)
  {
    uint64_t v22 = 0LL;
    uint64_t v24 = 0LL;
    if (v11) {
      goto LABEL_6;
    }
LABEL_8:
    v26 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_9;
  }

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v24 = v23;

  if (!v11) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v25 = swift_allocObject(&unk_100247030, 24LL, 7LL);
  *(void *)(v25 + 16) = v11;
  v26 = sub_1001496E8;
LABEL_9:
  sub_100148DFC((uint64_t)a4, v18, v19, v21, v22, v24, (uint64_t (*)(void))v26, v25);
  sub_1001341FC((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_100133558((uint64_t)a4, v18);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v18 = v17;
  }

  else
  {
    unint64_t v18 = 0xF000000000000000LL;
  }

  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v21 = v20;

  if (!a6)
  {
    uint64_t v22 = 0LL;
    uint64_t v24 = 0LL;
    if (v11) {
      goto LABEL_6;
    }
LABEL_8:
    v26 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_9;
  }

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v24 = v23;

  if (!v11) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v25 = swift_allocObject(&unk_100247008, 24LL, 7LL);
  *(void *)(v25 + 16) = v11;
  v26 = sub_1001496E8;
LABEL_9:
  sub_100149008(v19, v21, v22, v24, (uint64_t (*)(void))v26, v25);
  sub_1001341FC((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_100133558((uint64_t)a4, v18);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v18 = v17;
  }

  else
  {
    unint64_t v18 = 0xF000000000000000LL;
  }

  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v21 = v20;

  if (!a6)
  {
    uint64_t v22 = 0LL;
    uint64_t v24 = 0LL;
    if (v11) {
      goto LABEL_6;
    }
LABEL_8:
    v26 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_9;
  }

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v24 = v23;

  if (!v11) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v25 = swift_allocObject(&unk_100246FE0, 24LL, 7LL);
  *(void *)(v25 + 16) = v11;
  v26 = sub_100149510;
LABEL_9:
  sub_1001491F8((uint64_t)a4, v18, v19, v21, v22, v24, (uint64_t (*)(void))v26, v25);
  sub_1001341FC((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_100133558((uint64_t)a4, v18);
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

  unint64_t v9 = (char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage,  v15,  33LL,  0LL);
  uint64_t v10 = *((void *)v9 + 3);
  uint64_t v11 = *((void *)v9 + 4);
  sub_10013767C((uint64_t)v9, v10);
  id v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 96);
  swift_bridgeObjectRetain(v8);
  id v13 = a3;
  id v14 = self;
  v12(v6, v8, v10, v11);
  swift_endAccess(v15);

  swift_bridgeObjectRelease(v8);
}

@end