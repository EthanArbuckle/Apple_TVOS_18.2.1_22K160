@interface AAProxCardsRecord
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15audioaccessoryd17AAProxCardsRecord)init;
@end

@implementation AAProxCardsRecord

- (NSString)description
{
  v2 = self;
  AAProxCardsRecord.description.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = -[AAProxCardsRecord description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC15audioaccessoryd17AAProxCardsRecord)init
{
  result = (_TtC15audioaccessoryd17AAProxCardsRecord *)_swift_stdlib_reportUnimplementedInitializer( "audioaccessoryd.AAProxCardsRecord",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_bluetoothAddress]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_proxCardVersions));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_lastModifiedDate;
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

@end