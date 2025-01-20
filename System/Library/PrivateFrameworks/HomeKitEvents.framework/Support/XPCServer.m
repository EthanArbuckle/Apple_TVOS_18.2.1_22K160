@interface XPCServer
- (_TtC11homeeventsd9XPCServer)init;
@end

@implementation XPCServer

- (_TtC11homeeventsd9XPCServer)init
{
  result = (_TtC11homeeventsd9XPCServer *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.XPCServer",  21LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s11homeeventsd29BackgroundSystemTaskSchedulerVwxx_0((Class *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC11homeeventsd9XPCServer_features));
  swift_bridgeObjectRelease(*(void *)&self->mainDriver[OBJC_IVAR____TtC11homeeventsd9XPCServer_serviceName]);
  swift_release(*(void *)&self->mainDriver[OBJC_IVAR____TtC11homeeventsd9XPCServer_proxyConnectionFactory]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11homeeventsd9XPCServer_listener));
}

@end