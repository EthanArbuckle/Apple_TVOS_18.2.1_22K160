@interface SDAirDropNearFieldServer
- (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer)init;
@end

@implementation SDAirDropNearFieldServer

- (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer)init
{
  result = (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropNearFieldServer",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_listener));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_networkListener));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_connections));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_transactionID;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v5(v3, v4);
  sub_100189B20( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_remotePublicKey),  *(void *)&self->listener[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_remotePublicKey]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_localIdentity));
  v5((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_listenerUUID, v4);
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_delegate);
}

@end