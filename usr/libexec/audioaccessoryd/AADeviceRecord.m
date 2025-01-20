@interface AADeviceRecord
- (NSDate)audiogramCreationTimestamp;
- (NSString)bluetoothAddress;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15audioaccessoryd14AADeviceRecord)init;
- (_TtC15audioaccessoryd14AADeviceRecord)initWithDevice:(id)a3 error:(id *)a4;
- (char)allowNoiseManagementOff;
- (char)headGestureMode;
- (unsigned)acceptReplyPlayPauseConfig;
- (unsigned)declineDismissSkipConfig;
- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3;
- (void)setAllowNoiseManagementOff:(char)a3;
- (void)setAudiogramCreationTimestamp:(id)a3;
- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3;
- (void)setHeadGestureMode:(char)a3;
@end

@implementation AADeviceRecord

- (NSString)bluetoothAddress
{
  uint64_t v2 = *(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_acceptReplyPlayPauseConfig);
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_acceptReplyPlayPauseConfig) = a3;
}

- (char)allowNoiseManagementOff
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_allowNoiseManagementOff);
}

- (void)setAllowNoiseManagementOff:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_allowNoiseManagementOff) = a3;
}

- (NSDate)audiogramCreationTimestamp
{
  uint64_t v3 = sub_100098CD8((uint64_t *)&unk_100234E10);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp;
  swift_beginAccess(v6, v12, 0LL, 0LL);
  sub_1000E6164((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1LL, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setAudiogramCreationTimestamp:(id)a3
{
  uint64_t v5 = sub_100098CD8((uint64_t *)&unk_100234E10);
  __chkstk_darwin(v5);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for Date(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 0LL, 1LL, v8);
  }

  else
  {
    uint64_t v9 = type metadata accessor for Date(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v7, 1LL, 1LL, v9);
  }

  v10 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp,  v13,  33LL,  0LL);
  v11 = self;
  sub_1000E622C((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);
}

- (unsigned)declineDismissSkipConfig
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_declineDismissSkipConfig);
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_declineDismissSkipConfig) = a3;
}

- (char)headGestureMode
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_headGestureMode);
}

- (void)setHeadGestureMode:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_headGestureMode) = a3;
}

- (NSString)description
{
  uint64_t v2 = self;
  AADeviceRecord.description.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  uint64_t v3 = -[AADeviceRecord description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC15audioaccessoryd14AADeviceRecord)initWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v9 = a3;
  UUID.init()(v9);
  id v10 = objc_allocWithZone((Class)type metadata accessor for AADeviceRecord(0LL));
  v11 = sub_1001156D4((uint64_t)v8, 0LL, 0xC000000000000000LL, v9);
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30),  *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34));
  return (_TtC15audioaccessoryd14AADeviceRecord *)v11;
}

- (_TtC15audioaccessoryd14AADeviceRecord)init
{
  result = (_TtC15audioaccessoryd14AADeviceRecord *)_swift_stdlib_reportUnimplementedInitializer( "audioaccessoryd.AADeviceRecord",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress]);
  sub_100099358( (uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp,  (uint64_t *)&unk_100234E10);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_lastModifiedDate;
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

@end