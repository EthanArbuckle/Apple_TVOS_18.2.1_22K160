@interface SDTempPairingClient
- (_TtC16DaemoniOSLibrary19SDTempPairingClient)init;
- (void)handleDiscoverableModeChanged;
- (void)handleRapportIdentitiesChanged;
- (void)proximityDeviceDidTrigger:(id)a3;
@end

@implementation SDTempPairingClient

- (void)handleRapportIdentitiesChanged
{
  v2 = self;
  sub_100295C10();
}

- (void)handleDiscoverableModeChanged
{
  v2 = self;
  sub_100295DE8();
}

- (_TtC16DaemoniOSLibrary19SDTempPairingClient)init
{
  result = (_TtC16DaemoniOSLibrary19SDTempPairingClient *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDTempPairingClient",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100224FF8( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_objectChanged),  *(void *)&self->queue[OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_objectChanged]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_browser));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_statusItemController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_bluetoothController));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_scanningIdentifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  *(void *)&double v5 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_availableEndpoints)).n128_u64[0];
  *(void *)&double v6 = swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_activeConnections),  v5).n128_u64[0];
  swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_nearbyDevicesByIdentifier),  v6);
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100296A64();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end