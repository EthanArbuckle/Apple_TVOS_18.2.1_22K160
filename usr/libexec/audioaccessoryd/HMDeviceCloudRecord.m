@interface HMDeviceCloudRecord
- (NSString)bluetoothAddress;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15audioaccessoryd19HMDeviceCloudRecord)init;
- (char)mediaAssistEnabled;
- (char)pmeMediaEnabled;
- (char)pmeVoiceEnabled;
- (char)swipeGainEnabled;
- (id)hmDeviceCloudRecordInfo;
- (unsigned)haRegionStatus;
- (unsigned)hpRegionStatus;
- (void)setHaRegionStatus:(unsigned __int8)a3;
- (void)setHpRegionStatus:(unsigned __int8)a3;
- (void)setMediaAssistEnabled:(char)a3;
- (void)setPmeMediaEnabled:(char)a3;
- (void)setPmeVoiceEnabled:(char)a3;
- (void)setSwipeGainEnabled:(char)a3;
@end

@implementation HMDeviceCloudRecord

- (NSString)bluetoothAddress
{
  uint64_t v2 = *(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (unsigned)haRegionStatus
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_haRegionStatus);
}

- (void)setHaRegionStatus:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_haRegionStatus) = a3;
}

- (unsigned)hpRegionStatus
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_hpRegionStatus);
}

- (void)setHpRegionStatus:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_hpRegionStatus) = a3;
}

- (char)mediaAssistEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_mediaAssistEnabled);
}

- (void)setMediaAssistEnabled:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_mediaAssistEnabled) = a3;
}

- (char)pmeMediaEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeMediaEnabled);
}

- (void)setPmeMediaEnabled:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeMediaEnabled) = a3;
}

- (char)pmeVoiceEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeVoiceEnabled);
}

- (void)setPmeVoiceEnabled:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeVoiceEnabled) = a3;
}

- (char)swipeGainEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_swipeGainEnabled);
}

- (void)setSwipeGainEnabled:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_swipeGainEnabled) = a3;
}

- (NSString)description
{
  uint64_t v2 = self;
  HMDeviceCloudRecord.description.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  uint64_t v3 = -[HMDeviceCloudRecord description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC15audioaccessoryd19HMDeviceCloudRecord)init
{
  result = (_TtC15audioaccessoryd19HMDeviceCloudRecord *)_swift_stdlib_reportUnimplementedInitializer( "audioaccessoryd.HMDeviceCloudRecord",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_bluetoothAddress]);
  sub_100099358( (uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_latestDiagnosticTimestampLeft,  (uint64_t *)&unk_100234E10);
  sub_100099358( (uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_latestDiagnosticTimestampRight,  (uint64_t *)&unk_100234E10);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_lastModifiedDate;
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

- (id)hmDeviceCloudRecordInfo
{
  uint64_t v2 = self;
  id v3 = sub_10011F7D8();

  return v3;
}

@end