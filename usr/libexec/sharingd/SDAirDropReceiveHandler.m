@interface SDAirDropReceiveHandler
- (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler)init;
@end

@implementation SDAirDropReceiveHandler

- (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler)init
{
  result = (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropReceiveHandler",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_id;
  uint64_t v4 = type metadata accessor for SFAirDrop.TransferIdentifier(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveID;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  sub_1001A4BC8( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_serverConnectionIdentity,  type metadata accessor for SDAirDropServerConnectionIdentity);
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_delegate);
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveServiceDelegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_deviceStatus));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_endpointService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_pseudonymService));
  swift_bridgeObjectRelease(*(const char **)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_idsSessionID]);
  v7 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askContinuation;
  uint64_t v8 = sub_100183098(&qword_100654E48);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_transferContinuation;
  uint64_t v10 = sub_100183098(&qword_1006457D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeContinuation,  &qword_100650B50);
  v11 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_handlerContinuation;
  uint64_t v12 = sub_100183098(&qword_100650C58);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8LL))(v11, v12);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_helloRequest,  &qword_1006475A8);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askRequest,  &qword_1006475B8);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_uploadRequest,  &qword_1006475C8);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeRequest,  &qword_100650B10);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_transferStart,  &qword_1006457E8);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveCompressionAdapter));
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_helloConnection,  &qword_100650B48);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askConnection,  &qword_100650B48);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_uploadConnection,  &qword_100650B48);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeConnection,  &qword_100650B48);
  sub_100187100( (uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_errorConnection,  &qword_100650B48);
}

@end