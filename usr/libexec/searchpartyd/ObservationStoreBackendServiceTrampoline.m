@interface ObservationStoreBackendServiceTrampoline
- (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline)init;
- (void)anonymousObservationCountWithCompletion:(id)a3;
- (void)decimateLowValueObservationsWithCompletion:(id)a3;
- (void)deleteAllAnonymousObservedAdvertisementsWithCompletion:(id)a3;
- (void)deleteMetadataWithBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)deleteObservedAdvertisementsWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)insertWithAdvertisementData:(id)a3 completion:(id)a4;
- (void)latestAnonymousObservationsWithLimit:(int64_t)a3 completion:(id)a4;
- (void)latestDeviceEventWithIdentifierData:(id)a3 source:(id)a4 attachedDevice:(id)a5 completion:(id)a6;
- (void)latestObservedAdvertisementWithIdentifierData:(id)a3 completion:(id)a4;
- (void)latestStatusWithIdentifierData:(id)a3 completion:(id)a4;
- (void)locationsWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)markObservedAdvertisementsPublishedWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)metadataWithBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)metadataWithBeaconIdentifier:(id)a3 typesData:(id)a4 completion:(id)a5;
- (void)nearbyBeaconsWithSeconds:(double)a3 completion:(id)a4;
- (void)observationsWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)removeOrphanedKeySyncMetaDataWithCompletion:(id)a3;
- (void)reverseChronologicalObservationsWithIdentifierData:(id)a3 limit:(int64_t)a4 isPublished:(BOOL)a5 completion:(id)a6;
- (void)storeDeviceEventWithDeviceEvent:(id)a3 completion:(id)a4;
- (void)storeWithKeySyncMetadataData:(id)a3 completion:(id)a4;
@end

@implementation ObservationStoreBackendServiceTrampoline

- (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline)init
{
  result = (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.ObservationStoreBackendServiceTrampoline",  53LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd40ObservationStoreBackendServiceTrampoline_implementation));
}

- (void)insertWithAdvertisementData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978BC8, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  v13 = (void *)swift_allocObject(&unk_100978BF0, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_10009C9E4;
  v13[6] = v12;
  v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("insert(payload:)", 16LL, 2LL, &unk_1009BF580, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)deleteObservedAdvertisementsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978B78, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  v13 = (void *)swift_allocObject(&unk_100978BA0, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662CA4;
  v13[6] = v12;
  v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)( "deleteObservedAdvertisements(advertisementsData:)",  49LL,  2LL,  &unk_1009BF570,  v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)markObservedAdvertisementsPublishedWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978B28, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  v13 = (void *)swift_allocObject(&unk_100978B50, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662CA4;
  v13[6] = v12;
  v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)( "markObservedAdvertisementsPublished(advertisementsData:)",  56LL,  2LL,  &unk_1009BF560,  v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)deleteAllAnonymousObservedAdvertisementsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100978AD8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0LL);
  v6 = (void *)swift_allocObject(&unk_100978B00, 40LL, 7LL);
  v6[2] = self;
  v6[3] = sub_100662CA4;
  v6[4] = v5;
  id v7 = self;
  swift_retain(v5);
  static Transaction.asyncTask(name:block:)( "deleteAllAnonymousObservedAdvertisements(completion:)",  53LL,  2LL,  &unk_1009BF550,  v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)reverseChronologicalObservationsWithIdentifierData:(id)a3 limit:(int64_t)a4 isPublished:(BOOL)a5 completion:(id)a6
{
  unint64_t v10 = _Block_copy(a6);
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v15 = v14;

  uint64_t v16 = swift_allocObject(&unk_100978A88, 24LL, 7LL);
  *(void *)(v16 + 16) = v10;
  type metadata accessor for Transaction(0LL);
  uint64_t v17 = swift_allocObject(&unk_100978AB0, 72LL, 7LL);
  *(void *)(v17 + 16) = v13;
  *(void *)(v17 + 24) = v15;
  *(void *)(v17 + 32) = v12;
  *(void *)(v17 + 40) = a4;
  *(_BYTE *)(v17 + 48) = a5;
  *(void *)(v17 + 56) = sub_100662CA4;
  *(void *)(v17 + 64) = v16;
  v18 = v12;
  sub_10001736C(v13, v15);
  swift_retain();
  static Transaction.asyncTask(name:block:)( "observations(reverseChronologicalObservations(identifierData:limit:)",  68LL,  2LL,  &unk_1009BF538,  v17);
  swift_release();
  swift_release();
  sub_100016F9C(v13, v15);
}

- (void)observationsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978A38, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v13 = (void *)swift_allocObject(&unk_100978A60, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662CA4;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("observations(advertisementsData:)", 33LL, 2LL, &unk_1009BF528, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)nearbyBeaconsWithSeconds:(double)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1009789E8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v8 = swift_allocObject(&unk_100978A10, 48LL, 7LL);
  *(void *)(v8 + 16) = self;
  *(double *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = sub_100662CA4;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = self;
  swift_retain(v7);
  static Transaction.asyncTask(name:block:)("nearbyBeacons(seconds:)", 23LL, 2LL, &unk_1009BF518, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)locationsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978998, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v13 = (void *)swift_allocObject(&unk_1009789C0, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662CA4;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("locations(advertisementsData:)", 30LL, 2LL, &unk_1009BF4F8, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)latestStatusWithIdentifierData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978948, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v13 = (void *)swift_allocObject(&unk_100978970, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662CA4;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("latestStatus", 12LL, 2LL, &unk_1009BF4C8, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)latestObservedAdvertisementWithIdentifierData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_1009788F8, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v13 = (void *)swift_allocObject(&unk_100978920, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100662CA4;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("latestObservedAdvertisement", 27LL, 2LL, &unk_1009BF4B8, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)latestAnonymousObservationsWithLimit:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1009788A8, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v8 = (void *)swift_allocObject(&unk_1009788D0, 48LL, 7LL);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_100662CA4;
  v8[5] = v7;
  uint64_t v9 = self;
  swift_retain(v7);
  static Transaction.asyncTask(name:block:)("latestAnonymousObservations", 27LL, 2LL, &unk_1009BF4A8, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)latestDeviceEventWithIdentifierData:(id)a3 source:(id)a4 attachedDevice:(id)a5 completion:(id)a6
{
  uint64_t v11 = sub_100004AEC(&qword_10099D8A0);
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v38 + 64);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v14 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v36 - v15;
  uint64_t v17 = _Block_copy(a6);
  id v18 = a3;
  v37 = self;
  id v19 = a4;
  id v20 = a5;
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v23 = v22;

  if (v20)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v20);

    uint64_t v24 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56LL))(v16, 0LL, 1LL, v24);
  }

  else
  {
    uint64_t v25 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56LL))(v16, 1LL, 1LL, v25);
  }

  uint64_t v26 = swift_allocObject(&unk_100978858, 24LL, 7LL);
  *(void *)(v26 + 16) = v17;
  v36[1] = type metadata accessor for Transaction(0LL);
  sub_1003131AC((uint64_t)v16, (uint64_t)v14);
  uint64_t v27 = *(unsigned __int8 *)(v38 + 80);
  uint64_t v28 = (v27 + 48) & ~v27;
  unint64_t v29 = (v12 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  v30 = (void *)swift_allocObject(&unk_100978880, v29 + 16, v27 | 7);
  v30[2] = v21;
  v30[3] = v23;
  v30[4] = v19;
  v31 = v19;
  v32 = v37;
  v30[5] = v37;
  sub_1005D7BA0((uint64_t)v14, (uint64_t)v30 + v28);
  v33 = (void *)((char *)v30 + v29);
  void *v33 = sub_100662CA4;
  v33[1] = v26;
  v34 = v32;
  id v35 = v31;
  sub_10001736C(v21, v23);
  swift_retain();
  static Transaction.asyncTask(name:block:)("latestDeviceEvent", 17LL, 2LL, &unk_1009BF498, v30);
  swift_release();
  swift_release();
  sub_100016F9C(v21, v23);

  sub_100015794((uint64_t)v16, &qword_10099D8A0);
}

- (void)storeDeviceEventWithDeviceEvent:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978808, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v13 = (void *)swift_allocObject(&unk_100978830, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_10009C9E4;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("storeDeviceEvent", 16LL, 2LL, &unk_1009BF488, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)anonymousObservationCountWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009787B8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0LL);
  v6 = (void *)swift_allocObject(&unk_1009787E0, 40LL, 7LL);
  v6[2] = self;
  v6[3] = sub_10009C458;
  v6[4] = v5;
  id v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)("anonymousObservationCount", 25LL, 2LL, &unk_1009BF478, v6);

  swift_release();
  swift_release();
}

- (void)decimateLowValueObservationsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100978768, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0LL);
  v6 = (void *)swift_allocObject(&unk_100978790, 40LL, 7LL);
  v6[2] = self;
  v6[3] = sub_100662CA4;
  v6[4] = v5;
  id v7 = self;
  swift_retain(v5);
  static Transaction.asyncTask(name:block:)("latestAnonymousObservations", 27LL, 2LL, &unk_1009BF468, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)storeWithKeySyncMetadataData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject(&unk_100978718, 24LL, 7LL);
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0LL);
  uint64_t v13 = (void *)swift_allocObject(&unk_100978740, 56LL, 7LL);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_10009C9E4;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_10001736C(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("store(keySyncMetadata)", 22LL, 2LL, &unk_1009BF458, v13);
  swift_release();
  swift_release();
  sub_100016F9C(v9, v11);
}

- (void)metadataWithBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - v12;
  unint64_t v14 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = swift_allocObject(&unk_1009786C8, 24LL, 7LL);
  *(void *)(v15 + 16) = v14;
  type metadata accessor for Transaction(0LL);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v16 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = (v16 + 24) & ~v16;
  unint64_t v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v19 = swift_allocObject(&unk_1009786F0, v18 + 16, v16 | 7);
  *(void *)(v19 + 16) = self;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v11, v7);
  id v20 = (void *)(v19 + v18);
  *id v20 = sub_100662CA4;
  v20[1] = v15;
  uint64_t v21 = self;
  swift_retain(v15);
  static Transaction.asyncTask(name:block:)("metadata(beaconIdentifier)", 26LL, 2LL, &unk_1009BF448, v19);

  swift_release(v15);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)metadataWithBeaconIdentifier:(id)a3 typesData:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v16 = _Block_copy(a5);
  v30 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  id v17 = a4;
  unint64_t v18 = self;
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v21 = v20;

  uint64_t v22 = swift_allocObject(&unk_100978678, 24LL, 7LL);
  *(void *)(v22 + 16) = v16;
  uint64_t v29 = type metadata accessor for Transaction(0LL);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  uint64_t v23 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v24 = (v23 + 40) & ~v23;
  unint64_t v25 = (v11 + v24 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v26 = (char *)swift_allocObject(&unk_1009786A0, v25 + 16, v23 | 7);
  *((void *)v26 + 2) = v19;
  *((void *)v26 + 3) = v21;
  *((void *)v26 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v26[v24], v13, v9);
  uint64_t v27 = (void (**)(uint64_t, unint64_t, uint64_t))&v26[v25];
  *uint64_t v27 = sub_100662924;
  v27[1] = (void (*)(uint64_t, unint64_t, uint64_t))v22;
  uint64_t v28 = v18;
  sub_10001736C(v19, v21);
  swift_retain();
  static Transaction.asyncTask(name:block:)("metadata(beaconIdentifier, types)", 33LL, 2LL, &unk_1009BF428, v26);
  swift_release();
  swift_release();
  sub_100016F9C(v19, v21);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v30, v9);
}

- (void)deleteMetadataWithBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - v12;
  uint64_t v14 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = swift_allocObject(&unk_100978628, 24LL, 7LL);
  *(void *)(v15 + 16) = v14;
  type metadata accessor for Transaction(0LL);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v16 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = (v16 + 24) & ~v16;
  unint64_t v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v19 = swift_allocObject(&unk_100978650, v18 + 16, v16 | 7);
  *(void *)(v19 + 16) = self;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v11, v7);
  unint64_t v20 = (void *)(v19 + v18);
  *unint64_t v20 = sub_10009C9E4;
  v20[1] = v15;
  unint64_t v21 = self;
  swift_retain(v15);
  static Transaction.asyncTask(name:block:)("deleteMetadata(beaconIdentifier)", 32LL, 2LL, &unk_1009BF418, v19);

  swift_release(v15);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)removeOrphanedKeySyncMetaDataWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1009785D8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0LL);
  v6 = (void *)swift_allocObject(&unk_100978600, 40LL, 7LL);
  v6[2] = self;
  v6[3] = sub_10009C044;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)("removeOrphanedKeySyncMetaData()", 31LL, 2LL, &unk_1009BF408, v6);

  swift_release();
  swift_release();
}

@end