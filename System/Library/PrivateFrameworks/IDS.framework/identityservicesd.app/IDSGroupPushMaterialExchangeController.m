@interface IDSGroupPushMaterialExchangeController
- (_TtC17identityservicesd38IDSGroupPushMaterialExchangeController)init;
@end

@implementation IDSGroupPushMaterialExchangeController

- (_TtC17identityservicesd38IDSGroupPushMaterialExchangeController)init
{
  result = (_TtC17identityservicesd38IDSGroupPushMaterialExchangeController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupPushMaterialEx changeController",  56LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_participantsById));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_membersByURI));
  sub_10040A274( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_desiredPublicIdentity,  &qword_1009B99F0);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_lock));
  swift_bridgeObjectRelease(*(void *)&self->delegate[OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_groupID]);
  swift_bridgeObjectRelease(*(void *)&self->delegate[OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_sessionID]);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_pushHandler),  v5);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_cryptoHandler));
  sub_10041C0A0( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupPushMaterialExchangeController_cachedKeyPropagationProvider);
}

@end