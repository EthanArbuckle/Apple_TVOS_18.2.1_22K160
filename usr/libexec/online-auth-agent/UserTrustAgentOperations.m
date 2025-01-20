@interface UserTrustAgentOperations
- (BOOL)createUserTrustedProfileEntryWithUuid:(id)a3 teamId:(id)a4 signature:(id)a5 error:(id *)a6;
- (BOOL)deleteTrustedProfileWithUuid:(id)a3 error:(id *)a4;
- (_TtC17online_auth_agent24UserTrustAgentOperations)init;
@end

@implementation UserTrustAgentOperations

- (BOOL)createUserTrustedProfileEntryWithUuid:(id)a3 teamId:(id)a4 signature:(id)a5 error:(id *)a6
{
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (!a4)
  {
    uint64_t v14 = 0LL;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = self;
    uint64_t v19 = 0LL;
    unint64_t v21 = 0xF000000000000000LL;
    goto LABEL_6;
  }

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v15;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  id v16 = a5;
  uint64_t v24 = v11;
  id v17 = v16;
  v18 = self;
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v21 = v20;

  uint64_t v11 = v24;
LABEL_6:
  UserTrustAgentOperations.createUserTrustedProfileEntry(uuid:teamId:signature:)( (uint64_t)v13,  v14,  (uint64_t)a4,  v19,  v21);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  sub_100010BA4(v19, v21);
  swift_bridgeObjectRelease(a4);
  return 1;
}

- (BOOL)deleteTrustedProfileWithUuid:(id)a3 error:(id *)a4
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = self;
  sub_100023F9C((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return 1;
}

- (_TtC17online_auth_agent24UserTrustAgentOperations)init
{
  uint64_t v3 = OBJC_IVAR____TtC17online_auth_agent24UserTrustAgentOperations_utdb;
  type metadata accessor for UserTrustDB();
  v4 = self;
  char v5 = sub_100014904();
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1000247A8(v5 & 1);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return -[UserTrustAgentOperations init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end