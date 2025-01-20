@interface SDAirDropBLEController
+ (_TtC16DaemoniOSLibrary22SDAirDropBLEController)shared;
- (_TtC16DaemoniOSLibrary22SDAirDropBLEController)init;
- (void)startScanningWithIdentifier:(id)a3 deviceUpdatesHandler:(id)a4;
- (void)stopScanningWithIdentifier:(id)a3;
@end

@implementation SDAirDropBLEController

+ (_TtC16DaemoniOSLibrary22SDAirDropBLEController)shared
{
  if (qword_100644308 != -1) {
    swift_once(&qword_100644308, sub_1003EA8BC);
  }
  return (_TtC16DaemoniOSLibrary22SDAirDropBLEController *)(id)qword_1006698D0;
}

- (_TtC16DaemoniOSLibrary22SDAirDropBLEController)init
{
  return (_TtC16DaemoniOSLibrary22SDAirDropBLEController *)sub_1003EA928();
}

- (void)startScanningWithIdentifier:(id)a3 deviceUpdatesHandler:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_1005DFA20, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  v13 = self;
  sub_1003EBE60( (uint64_t)v10,  (uint64_t)sub_1003EE1E4,  v12,  (uint64_t)&unk_1005DFA48,  (uint64_t)sub_1003EE200,  (uint64_t)&unk_1005DFA60);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stopScanningWithIdentifier:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = self;
  sub_1003E9E98((uint64_t)v8, (uint64_t)&unk_1005DF9D0, (uint64_t)sub_1003ECE04, (uint64_t)&unk_1005DF9E8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_airDropAdvertiser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_nearbyInfoV2Advertiser));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_aggressiveScannerTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_deviceUpdatesHandlers));
}

@end