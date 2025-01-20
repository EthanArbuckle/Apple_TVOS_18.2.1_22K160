@interface IDSGroupEncryptionControllerGroupSession
- (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController)rootExchangeController;
- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)mkmController;
- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)skmController;
- (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession)init;
- (void)setKeyMaterialIsNeededForParticipant:(id)a3 forMKM:(BOOL)a4 forSKM:(BOOL)a5;
- (void)setRootExchangeController:(id)a3;
@end

@implementation IDSGroupEncryptionControllerGroupSession

- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)mkmController
{
  return (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_mkmController);
}

- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)skmController
{
  return (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_skmController);
}

- (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController)rootExchangeController
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_rootExchangeController);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_rootExchangeController,  v4,  0LL,  0LL);
  return (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController *)*v2;
}

- (void)setRootExchangeController:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1004956A4(a3);
}

- (void)setKeyMaterialIsNeededForParticipant:(id)a3 forMKM:(BOOL)a4 forSKM:(BOOL)a5
{
  id v8 = a3;
  v9 = self;
  sub_10048DE10(v8, a4, a5);
}

- (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession)init
{
  result = (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionCo ntrollerGroupSession",  58LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_q));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_lock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_mkmController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_skmController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_mkmCache));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_skmCache));
  swift_bridgeObjectRelease(*(void *)&self->q[OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_groupID]);
  swift_bridgeObjectRelease(*(void *)&self->q[OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_sessionID]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_rootExchangeController));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_participantProvider);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_idsdSessionProvider),  v5);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_identityController));
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_cryptoHandler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_materialProviders));
  sub_10040A274( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_materialCurrentlySentToAVC,  &qword_1009B8E08);
  sub_10040A274( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession_materialCurrentlySentToFramework,  &qword_1009B8E08);
}

@end