@interface Server
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15audioanalyticsd6Server)init;
@end

@implementation Server

- (_TtC15audioanalyticsd6Server)init
{
  result = (_TtC15audioanalyticsd6Server *)_swift_stdlib_reportUnimplementedInitializer( "audioanalyticsd.Server",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioanalyticsd6Server_activeReporterIDs));

  v3 = (char *)self + OBJC_IVAR____TtC15audioanalyticsd6Server_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_config));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10001D478(v7);

  return v9 & 1;
}

@end