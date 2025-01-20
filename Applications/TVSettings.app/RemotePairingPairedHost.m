@interface RemotePairingPairedHost
- (NSString)name;
- (NSUUID)identifier;
- (_TtC10TVSettings23RemotePairingPairedHost)init;
@end

@implementation RemotePairingPairedHost

- (NSUUID)identifier
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSString)name
{
  uint64_t v2 = *(void *)&self->name[OBJC_IVAR____TtC10TVSettings23RemotePairingPairedHost_name];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC10TVSettings23RemotePairingPairedHost)init
{
  result = (_TtC10TVSettings23RemotePairingPairedHost *)_swift_stdlib_reportUnimplementedInitializer( "TVSettings.RemotePairingPairedHost",  34LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC10TVSettings23RemotePairingPairedHost_identifier;
  uint64_t v4 = type metadata accessor for UUID(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->name[OBJC_IVAR____TtC10TVSettings23RemotePairingPairedHost_name]);
}

@end