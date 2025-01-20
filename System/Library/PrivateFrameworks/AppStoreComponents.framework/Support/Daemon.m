@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC19appstorecomponentsd6Daemon)init;
@end

@implementation Daemon

- (_TtC19appstorecomponentsd6Daemon)init
{
  return (_TtC19appstorecomponentsd6Daemon *)sub_100088B40();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_100089584(v7);

  return v9;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd6Daemon_shutdownTimer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd6Daemon_keepAlive));
}

@end