@interface AccessoryDiscoveryTrampoline
- (_TtC12searchpartyd28AccessoryDiscoveryTrampoline)init;
- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)initiatePairingWith:(id)a3 completion:(id)a4;
- (void)invalidatePairingWith:(id)a3 completion:(id)a4;
- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4;
- (void)startAccessoryDiscoveryWithCompletion:(id)a3;
- (void)stopAccessoryDiscoveryWithCompletion:(id)a3;
@end

@implementation AccessoryDiscoveryTrampoline

- (void)startAccessoryDiscoveryWithCompletion:(id)a3
{
}

- (void)stopAccessoryDiscoveryWithCompletion:(id)a3
{
}

- (void)initiatePairingWith:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10094E5E8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1005E2C88(v8, (uint64_t)sub_10009C044, v7);

  swift_release();
}

- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id, void))_Block_copy(a4);
  id v7 = a3;
  v10 = self;
  uint64_t v8 = static os_log_type_t.debug.getter(v10);
  if (qword_10099B798 != -1) {
    swift_once(&qword_10099B798, sub_100651870);
  }
  os_log(_:dso:log:_:_:)( v8,  &_mh_execute_header,  qword_100A2B0A8,  "AccessoryDiscoveryService.pairingStatus",  39LL,  2LL,  _swiftEmptyArrayStorage);
  id v9 = [objc_allocWithZone(SPAccessoryDiscoveryPairingStatusResult) initWithPairingStatus:0 lostModeInfo:0];
  v6[2](v6, v9, 0LL);

  _Block_release(v6);
}

- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation);
  _Block_copy(v8);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1005E5EC0(v10, v11, v9, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)invalidatePairingWith:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation);
  _Block_copy(v6);
  id v8 = a3;
  uint64_t v9 = self;
  sub_1005E6064(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC12searchpartyd28AccessoryDiscoveryTrampoline)init
{
  result = (_TtC12searchpartyd28AccessoryDiscoveryTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.AccessoryDiscoveryTrampoline",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation));
}

@end