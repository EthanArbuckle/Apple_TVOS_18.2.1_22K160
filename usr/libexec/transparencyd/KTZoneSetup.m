@interface KTZoneSetup
- (BOOL)initialFetch;
- (_TtC13transparencyd11KTZoneSetup)init;
- (_TtC13transparencyd11KTZoneSetup)initWithCkdatabase:(id)a3 analytics:(id)a4 context:(id)a5 zoneCreate:(id)a6;
- (void)groupStart;
- (void)setInitialFetch:(BOOL)a3;
@end

@implementation KTZoneSetup

- (BOOL)initialFetch
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch, v4, 0LL, 0LL);
  return *v2;
}

- (void)setInitialFetch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (_TtC13transparencyd11KTZoneSetup)initWithCkdatabase:(id)a3 analytics:(id)a4 context:(id)a5 zoneCreate:(id)a6
{
  uint64_t v11 = sub_10007D178(0LL, &qword_1002DF680, &OBJC_CLASS___CKRecordZoneID_ptr);
  v12 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v11);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_ckdatabase) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_analytics) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneCreate) = v12;
  uint64_t v13 = type metadata accessor for KTCKZone();
  v14 = (objc_class *)swift_allocObject(v13, 24LL, 7LL);
  v14[2].isa = (Class)a5;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneHandler) = v14;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for KTZoneSetup();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  return -[KTGroupOperation init](&v19, "init");
}

- (void)groupStart
{
  v2 = self;
  KTZoneSetup.groupStart()();
}

- (_TtC13transparencyd11KTZoneSetup)init
{
  result = (_TtC13transparencyd11KTZoneSetup *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTZoneSetup",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneCreate));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_ckdatabase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_analytics));
}

@end