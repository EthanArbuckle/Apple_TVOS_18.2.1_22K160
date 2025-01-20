@interface SportsKitRequestXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7sportsd25SportsKitRequestXPCServer)init;
@end

@implementation SportsKitRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000C760((uint64_t)v8, v7);

  return 1;
}

- (_TtC7sportsd25SportsKitRequestXPCServer)init
{
}

- (void).cxx_destruct
{
}

@end