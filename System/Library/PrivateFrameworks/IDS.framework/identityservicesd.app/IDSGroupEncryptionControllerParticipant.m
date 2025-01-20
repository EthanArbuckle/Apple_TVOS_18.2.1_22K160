@interface IDSGroupEncryptionControllerParticipant
- (BOOL)isEqual:(id)a3;
- (IDSPushToken)pushToken;
- (NSString)allocatedURI;
- (NSString)description;
- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)member;
- (_TtC17identityservicesd39IDSGroupEncryptionControllerParticipant)init;
- (int64_t)hash;
- (unint64_t)participantID;
- (void)recoverKeyMaterialForSessionID:(id)a3 mkm:(BOOL)a4 skm:(BOOL)a5;
@end

@implementation IDSGroupEncryptionControllerParticipant

- (unint64_t)participantID
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_participantID);
}

- (IDSPushToken)pushToken
{
  return (IDSPushToken *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_pushToken));
}

- (NSString)allocatedURI
{
  uint64_t v2 = *(void *)&self->q[OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_allocatedURI];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)member
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_delegate);
  if (Strong)
  {
    v5 = (void *)Strong;
    uint64_t v6 = *((void *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(uint64_t (**)(void))(v6 + 24);
    v8 = self;
    v9 = (void *)v7();
  }

  else
  {
    v9 = 0LL;
  }

  return (_TtC17identityservicesd34IDSGroupEncryptionControllerMember *)v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    uint64_t v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v12, v7);
    swift_unknownObjectRelease(a3, v8);
  }

  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }

  char v10 = sub_10047E760((uint64_t)v12);

  sub_10040E008((uint64_t)v12);
  return v10 & 1;
}

- (int64_t)hash
{
  Hasher._combine(_:)(*(Swift::UInt64 *)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_participantID));
  __int128 v8 = v4[2];
  __int128 v9 = v4[3];
  uint64_t v10 = v5;
  __int128 v6 = v4[0];
  __int128 v7 = v4[1];
  return Hasher.finalize()();
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_10047EA10();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)recoverKeyMaterialForSessionID:(id)a3 mkm:(BOOL)a4 skm:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  if (v6)
  {
    v11 = *(void (**)(void, uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x118);
    v12 = self;
    v11(0LL, v8, v10);
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  v13 = self;
  if (v5) {
LABEL_5:
  }
    (*(void (**)(uint64_t, uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x118))( 1LL,  v8,  v10);
LABEL_6:

  swift_bridgeObjectRelease(v10);
}

- (_TtC17identityservicesd39IDSGroupEncryptionControllerParticipant)init
{
  result = (_TtC17identityservicesd39IDSGroupEncryptionControllerParticipant *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionCon trollerParticipant",  57LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_q));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_pushToken));
  swift_bridgeObjectRelease(*(void *)&self->q[OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_allocatedURI]);
  sub_1003F6050( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_preKeyState,  type metadata accessor for IDSGroupEncryptionControllerParticipantPreKeyState);
  sub_1003F6050( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionControllerParticipant_keyRecoveryState,  type metadata accessor for IDSGroupEncryptionControllerParticipantKeyRecoveryState);
}

@end