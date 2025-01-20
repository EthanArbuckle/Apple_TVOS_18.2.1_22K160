@interface IDSGlobalLinkP2PKeyNegotiation
- (NSData)blob;
- (NSString)description;
- (_TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation)init;
- (id)receiveBlob:(id)a3;
@end

@implementation IDSGlobalLinkP2PKeyNegotiation

- (NSString)description
{
  v2 = self;
  sub_1004CBA3C();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSData)blob
{
  v2 = self;
  uint64_t v3 = sub_1004CBC80();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10040AD00(v3, v5);
  }

  return (NSData *)isa;
}

- (id)receiveBlob:(id)a3
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;

  sub_1004CBF08(v7, v9);
  v11 = v10;
  sub_100402A84(v7, v9);

  return v11;
}

- (_TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation)init
{
  result = (_TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGlobalLinkP2PKeyNegotiation",  48LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_delegate);
  swift_bridgeObjectRelease(*(void *)&self->delegate[OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_sessionID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_localIdentities));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PKeyNegotiation_remoteIdentities));
}

@end