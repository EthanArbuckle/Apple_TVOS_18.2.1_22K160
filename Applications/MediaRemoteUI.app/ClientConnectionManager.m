@interface ClientConnectionManager
- (_TtC13MediaRemoteUI23ClientConnectionManager)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation ClientConnectionManager

- (_TtC13MediaRemoteUI23ClientConnectionManager)init
{
  return (_TtC13MediaRemoteUI23ClientConnectionManager *)sub_1000056BC();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100007D1C((uint64_t)v9);

  swift_unknownObjectRelease(a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients));
}

@end