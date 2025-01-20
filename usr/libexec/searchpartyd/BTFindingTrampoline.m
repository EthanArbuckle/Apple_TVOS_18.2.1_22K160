@interface BTFindingTrampoline
- (_TtC12searchpartyd19BTFindingTrampoline)init;
- (uint64_t)startFastAdvertisingForBeacon:(uint64_t)a3 completion:(const void *)a4;
- (void)start:(id)a3 completion:(id)a4;
- (void)stop:(id)a3 completion:(id)a4;
- (void)updateConfig:(id)a3 completion:(id)a4;
@end

@implementation BTFindingTrampoline

- (void)start:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_10096FEB8, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v13 = self;
  sub_10066CDA4((uint64_t)v10, (uint64_t)sub_10009C9E4, v12);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (uint64_t)startFastAdvertisingForBeacon:(uint64_t)a3 completion:(const void *)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = (void (**)(void *, void *))_Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = sub_100672440();
  uint64_t v13 = swift_allocError(&type metadata for BTFindingService.Error, v12, 0LL, 0LL);
  *uint64_t v14 = 0x8000000000000005LL;
  id v15 = a1;
  v16 = (void *)_convertErrorToNSError(_:)(v13);
  v11[2](v11, v16);

  swift_errorRelease(v13);
  _Block_release(v11);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stop:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_10096FE68, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  uint64_t v13 = self;
  sub_10066D494((uint64_t)v10, (uint64_t)sub_10009C9E4, v12);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateConfig:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  _Block_copy(v6);
  id v9 = a3;
  uint64_t v8 = self;
  sub_100672854(v9, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC12searchpartyd19BTFindingTrampoline)init
{
  result = (_TtC12searchpartyd19BTFindingTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.BTFindingTrampoline",  32LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation));
}

@end