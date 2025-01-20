@interface SDAirDropBonjourDiscoverConnection
- (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection)init;
@end

@implementation SDAirDropBonjourDiscoverConnection

- (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection)init
{
  result = (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropBonjourDiscoverConnection",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_endpoint;
  uint64_t v4 = type metadata accessor for NWEndpoint(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_discoverConnection));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_identityShareConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_browserQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_rpClient));
}

@end