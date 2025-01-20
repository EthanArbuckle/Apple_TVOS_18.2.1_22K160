@interface BluetoothUserXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14bluetoothuserd22BluetoothUserXPCServer)init;
@end

@implementation BluetoothUserXPCServer

- (_TtC14bluetoothuserd22BluetoothUserXPCServer)init
{
  result = (_TtC14bluetoothuserd22BluetoothUserXPCServer *)_swift_stdlib_reportUnimplementedInitializer( "bluetoothuserd.BluetoothUserXPCServer",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14bluetoothuserd22BluetoothUserXPCServer____lazy_storage___connections));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd22BluetoothUserXPCServer____lazy_storage___xpcListener));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10004CF14((uint64_t)v6, v7);

  return v9 & 1;
}

@end