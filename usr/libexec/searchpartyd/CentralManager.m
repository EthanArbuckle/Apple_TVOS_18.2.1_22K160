@interface CentralManager
- (_TtC12searchpartyd14CentralManager)init;
- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4;
- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5;
- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6;
- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
@end

@implementation CentralManager

- (void)dealloc
{
  v2 = self;
  sub_1007CA18C();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_lock));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_stateChangedSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_peripheralDiscoveredSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_objectDiscoveredSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_connectionEventSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_companionLinkStates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_receiveSubjects));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd14CentralManager_findMyPeripheralsSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_serviceIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_connectionEventServiceIdentifiers));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14CentralManager_garbageCollectTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_discovered));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd14CentralManager_connectedPeripheralCache));
}

- (_TtC12searchpartyd14CentralManager)init
{
  result = (_TtC12searchpartyd14CentralManager *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.CentralManager",  27LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007D2004(v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_1007D6688(v12, v10, v13);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1007D71B4(v7);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  sub_1007D899C((char *)a4, v9);
}

- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4
{
  uint64_t v7 = sub_100022898(0LL, (unint64_t *)&unk_1009C0F50, &OBJC_CLASS___CBPeripheral_ptr);
  v10[2] = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v10[3] = self;
  id v8 = a3;
  id v9 = self;
  Lock.callAsFunction<A>(_:)(sub_1007DA20C, v10, (char *)&type metadata for () + 8);

  swift_bridgeObjectRelease();
}

- (void)centralManager:(id)a3 canSendDataToPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1007D9064(v7);
}

- (void)centralManager:(id)a3 didSendBytes:(id)a4 toPeripheral:(id)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  id v13 = self;
  sub_1007D9594(v11, v12);
}

- (void)centralManager:(id)a3 didReceiveData:(id)a4 fromPeripheral:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v14 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v13 = v12;

  sub_1007D9C94(v11, v13, v10);
  sub_100016F9C(v11, v13);
}

@end