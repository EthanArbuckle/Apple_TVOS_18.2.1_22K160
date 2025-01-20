@interface IDSGroupQUICMaterialExchangeController
- (_TtC17identityservicesd38IDSGroupQUICMaterialExchangeController)init;
- (id)takeAllCurrentMaterials;
- (void)addHandler:(id)a3;
- (void)invalidate;
- (void)removeHandler:(id)a3;
- (void)sendDesiredMaterialsIfNeeded;
@end

@implementation IDSGroupQUICMaterialExchangeController

- (void)sendDesiredMaterialsIfNeeded
{
  v2 = self;
  sub_10041DB60();
}

- (void)addHandler:(id)a3
{
  v6 = self;
  sub_10042108C((uint64_t)a3);
  swift_unknownObjectRelease(a3, v5);
}

- (void)removeHandler:(id)a3
{
  uint64_t v5 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_handlers);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_handlers,  v11,  33LL,  0LL);
  swift_unknownObjectRetain(a3, v6);
  v7 = self;
  uint64_t v8 = sub_100425650(v5, (uint64_t)a3);
  int64_t v9 = *(void *)(*v5 + 16);
  if (v9 < v8)
  {
    __break(1u);
  }

  else
  {
    sub_1004258E4(v8, v9);
    swift_endAccess(v11);
    swift_unknownObjectRelease(a3, v10);
  }

- (void)invalidate
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_currentlySent);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_currentlySent) = (Class)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v2);
}

- (id)takeAllCurrentMaterials
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1004213BC();

  sub_10041D3C4(0LL, &qword_1009B9978, &OBJC_CLASS___IDSQRProtoMaterial_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (_TtC17identityservicesd38IDSGroupQUICMaterialExchangeController)init
{
  result = (_TtC17identityservicesd38IDSGroupQUICMaterialExchangeController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupQUICMaterialEx changeController",  56LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_q));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_delegate);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_cryptoHandler));
  swift_bridgeObjectRelease(*(void *)&self->q[OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_service]);
  swift_bridgeObjectRelease(*(void *)&self->q[OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_sessionID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_handlers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_desired));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_currentlySent));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_currentlyAcked));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_lock));
}

@end