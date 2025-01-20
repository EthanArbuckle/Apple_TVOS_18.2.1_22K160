@interface IDSGroupRootMaterialExchangeController
- (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController)init;
@end

@implementation IDSGroupRootMaterialExchangeController

- (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController)init
{
  result = (_TtC17identityservicesd38IDSGroupRootMaterialExchangeController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupRootMaterialEx changeController",  56LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->groupID[OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_groupID]);
  swift_bridgeObjectRelease(*(void *)&self->groupID[OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_sessionID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_exchangeControllers));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_materialProvider);
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_delegate);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd38IDSGroupRootMaterialExchangeController_lock));
}

@end