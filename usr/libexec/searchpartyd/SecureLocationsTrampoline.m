@interface SecureLocationsTrampoline
- (_TtC12searchpartyd25SecureLocationsTrampoline)init;
- (void)fetchConfigFromServerWithCompletion:(id)a3;
- (void)isLocationPublishingDeviceWithCompletion:(id)a3;
- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4;
- (void)performKeyRollWithCompletion:(id)a3;
- (void)publishLocation:(id)a3 completion:(id)a4;
- (void)receivedLocationCommand:(id)a3 completion:(id)a4;
- (void)receivedLocationPayload:(id)a3 completion:(id)a4;
- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4;
- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5;
- (void)shouldStartLocationMonitorWithCompletion:(id)a3;
- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4;
- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5;
- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5;
- (void)updateLocationCacheWith:(id)a3 completion:(id)a4;
@end

@implementation SecureLocationsTrampoline

- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)publishLocation:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = *(void *)(*sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16])
                 + 96LL);
  _Block_copy(v6);
  id v8 = a3;
  v9 = self;
  swift_retain();
  sub_100335344(v8, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);
}

- (void)receivedLocationPayload:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  v11 = *(char **)(*sub_100012ED8( (Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16])
                 + 96LL);
  _Block_copy(v6);
  swift_retain();
  sub_100336E94(v8, v10, v11, (uint64_t)v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);
  sub_100016F9C(v8, v10);
}

- (void)receivedLocationCommand:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject(&unk_10095C780, 24LL, 7LL);
  *(void *)(v11 + 16) = v6;
  sub_100012ED8( (Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  swift_retain();
  sub_10032254C(v8, v10, (uint64_t)sub_10009C9E4, v11);
  swift_release();
  swift_release();
  sub_100016F9C(v8, v10);
}

- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  *(void *)(swift_allocObject(&unk_10095C758, 24LL, 7LL) + 16) = v6;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  type metadata accessor for Transaction(0LL);
  id v7 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)( "com.apple.icloud.searchpartyd.secureLocationsLatestLocationFromCache",  68LL,  2LL,  sub_10047254C);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)updateLocationCacheWith:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = sub_100022898(0LL, (unint64_t *)&qword_1009A0090, &OBJC_CLASS___SPSecureLocation_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = *sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  _Block_copy(v6);
  unint64_t v10 = self;
  sub_100472104(v8, v9, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  uint64_t v13 = swift_allocObject(&unk_10095C6E0, 24LL, 7LL);
  *(void *)(v13 + 16) = v8;
  v14 = self;
  sub_10046E364(v9, v11, v12, (uint64_t)sub_10009C9E4, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_10095C6B8, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  uint64_t v11 = sub_100004AEC(&qword_1009AF520);
  uint64_t v12 = swift_allocObject(v11, 48LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_1007E67D0;
  *(void *)(v12 + 32) = v7;
  *(void *)(v12 + 40) = v9;
  uint64_t v13 = self;
  swift_retain();
  swift_bridgeObjectRetain(v9);
  sub_10058AC6C(v12, (uint64_t)_swiftEmptyDictionarySingleton, 0, (uint64_t)sub_10009C9E4, v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)performKeyRollWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject(&unk_10095C690, 24LL, 7LL) + 16) = v4;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  type metadata accessor for Transaction(0LL);
  v5 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)( "com.apple.icloud.searchpartyd.secureLocations.performKeyroll",  60LL,  2LL,  sub_10047249C);

  swift_release();
  swift_release();
}

- (void)shouldStartLocationMonitorWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *, uint64_t, void))v4[2];
  v6 = self;
  v5(v4, 1LL, 0LL);
  _Block_release(v4);
}

- (void)isLocationPublishingDeviceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = qword_10099B5E8;
  uint64_t v7 = self;
  if (v5 != -1) {
    swift_once(&qword_10099B5E8, sub_1005C66A4);
  }
  swift_retain();
  char v6 = sub_1005C7C90();
  swift_release();
  (*((void (**)(void *, void, void))v4 + 2))(v4, v6 & 1, 0LL);
  _Block_release(v4);
}

- (void)fetchConfigFromServerWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10095C668, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  sub_100012ED8( (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation),  *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  char v6 = self;
  swift_retain();
  sub_100313AC4((uint64_t)sub_10009C044, v5);

  swift_release();
  swift_release();
}

- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_1004723B4(a3, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC12searchpartyd25SecureLocationsTrampoline)init
{
  result = (_TtC12searchpartyd25SecureLocationsTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.SecureLocationsTrampoline",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation));
}

@end