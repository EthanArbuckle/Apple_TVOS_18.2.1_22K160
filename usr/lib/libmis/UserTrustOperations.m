@interface UserTrustOperations
- (_TtC3mis19UserTrustOperations)init;
- (id)getAuxiliarySignatureWithTeamId:(id)a3 error:(id *)a4;
- (id)getUserTrustedUUIDsAndReturnError:(id *)a3;
- (id)profileEntryExistsWithUuidString:(id)a3 error:(id *)a4;
@end

@implementation UserTrustOperations

- (id)getAuxiliarySignatureWithTeamId:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_18406FF1C();
  uint64_t v7 = v6;
  v8 = self;
  uint64_t v11 = sub_18404D180(v5, v7);
  uint64_t v13 = v12;
  uint64_t v14 = v9;
  unint64_t v15 = v10;
  if (v12)
  {
    sub_18404D13C(v9, v10);
    v16 = (void *)sub_18406FE50();
    sub_18404D0F8(v14, v15);
  }

  else
  {
    v16 = 0LL;
  }

  id v17 = objc_msgSend(objc_allocWithZone((Class)MISUserTrustSignature), sel_initWithSignature_, v16);

  if (v17)
  {
    sub_18404DCA4(v11, v13, v14, v15);
    swift_bridgeObjectRelease();

    return v17;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (id)getUserTrustedUUIDsAndReturnError:(id *)a3
{
  v3 = self;
  sub_18404D690();

  v4 = (void *)sub_18406FF64();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)profileEntryExistsWithUuidString:(id)a3 error:(id *)a4
{
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_184056A68();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC3mis19UserTrustOperations)init
{
  uint64_t v3 = OBJC_IVAR____TtC3mis19UserTrustOperations_utdb;
  type metadata accessor for UserTrustDB();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_18404CC30(1);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for UserTrustOperations();
  return -[UserTrustOperations init](&v6, sel_init);
}

- (void).cxx_destruct
{
}

@end