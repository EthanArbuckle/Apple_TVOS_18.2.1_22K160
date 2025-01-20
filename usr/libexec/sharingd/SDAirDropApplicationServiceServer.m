@interface SDAirDropApplicationServiceServer
- (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer)init;
@end

@implementation SDAirDropApplicationServiceServer

- (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer)init
{
  result = (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropApplicationServiceServer",  50LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_listener));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_connections));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_deviceStatus));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_sessionLogger));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_queue));
}

@end