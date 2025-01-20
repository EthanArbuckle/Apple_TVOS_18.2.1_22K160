@interface BeaconKeyBackendServiceTrampoline
- (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline)init;
- (void)beaconInfoWithBeaconIdentifierData:(id)a3 completion:(id)a4;
- (void)beaconInfoWithCompletion:(id)a3;
- (void)setWithUserIdentifier:(id)a3 beaconsData:(id)a4 completion:(id)a5;
@end

@implementation BeaconKeyBackendServiceTrampoline

- (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline)init
{
  result = (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.BeaconKeyBackendServiceTrampoline",  46LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd33BeaconKeyBackendServiceTrampoline_implementation));
}

- (void)setWithUserIdentifier:(id)a3 beaconsData:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  v15 = (char *)&v29 - v14;
  v16 = _Block_copy(a5);
  v30 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  id v17 = a4;
  v18 = self;
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v21 = v20;

  uint64_t v22 = swift_allocObject(&unk_100976418, 24LL, 7LL);
  *(void *)(v22 + 16) = v16;
  uint64_t v29 = type metadata accessor for Transaction(0LL);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  uint64_t v23 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v24 = (v23 + 40) & ~v23;
  unint64_t v25 = (v11 + v24 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  v26 = (char *)swift_allocObject(&unk_100976440, v25 + 16, v23 | 7);
  *((void *)v26 + 2) = v19;
  *((void *)v26 + 3) = v21;
  *((void *)v26 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v26[v24], v13, v9);
  v27 = (void (**)(uint64_t))&v26[v25];
  *v27 = sub_10009C044;
  v27[1] = (void (*)(uint64_t))v22;
  v28 = v18;
  sub_10001736C(v19, v21);
  swift_retain();
  static Transaction.asyncTask(name:block:)("set(beaconsData:completion:)", 28LL, 2LL, &unk_1009BD7D8, v26);
  swift_release();
  swift_release();
  sub_100016F9C(v19, v21);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v30, v9);
}

- (void)beaconInfoWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009763C8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0LL);
  v6 = (void *)swift_allocObject(&unk_1009763F0, 40LL, 7LL);
  v6[2] = self;
  v6[3] = sub_100662CA4;
  v6[4] = v5;
  v7 = self;
  swift_retain(v5);
  static Transaction.asyncTask(name:block:)("beaconInfo()", 12LL, 2LL, &unk_1009BD7C8, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)beaconInfoWithBeaconIdentifierData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100976378, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  v13 = (void *)swift_allocObject(&unk_1009763A0, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662924;
  v13[6] = v12;
  uint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("beaconInfo(beaconIdentifier:)", 29LL, 2LL, &unk_1009BD7B0, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

@end