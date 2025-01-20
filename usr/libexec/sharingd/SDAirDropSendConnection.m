@interface SDAirDropSendConnection
- (_TtC16DaemoniOSLibrary23SDAirDropSendConnection)init;
@end

@implementation SDAirDropSendConnection

- (_TtC16DaemoniOSLibrary23SDAirDropSendConnection)init
{
  result = (_TtC16DaemoniOSLibrary23SDAirDropSendConnection *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropSendConnection",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_deviceStatus));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_pseudonymService));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sendRequest;
  uint64_t v4 = type metadata accessor for SFAirDropSend.Request(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_primaryConnection));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloRequest,  &qword_1006475A8);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloContinuation,  &qword_1006475B0);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloConnection));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askRequest,  &qword_1006475B8);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askConnection));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askContinuation,  &qword_1006475C0);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadRequest,  &qword_1006475C8);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadContext));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadConnection));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadContinuation,  &qword_1006475D0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sandboxTokenURLPairs));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sendCompressionAdapter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_exchangeConnection));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_exchangeContinuation,  &qword_1006475D8);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_errorConnection));
  sub_1001A4BC8( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_telemetry,  type metadata accessor for SDAirDropSendConnectionTelemetry);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_lastActiveInterfaceType;
  uint64_t v6 = type metadata accessor for SFNWInterfaceType(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

@end