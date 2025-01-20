@interface Peripheral
- (NSString)description;
- (_TtC12searchpartyd10Peripheral)init;
- (void)dealloc;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3;
@end

@implementation Peripheral

- (void)dealloc
{
  uint64_t v2 = qword_10099BA50;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_10099BA50, sub_1007C94A8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_10000A720(v4, (uint64_t)qword_100A2B840);
  sub_1004A2AC8(0x74696E696564LL, 0xE600000000000000LL);
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for Peripheral(0LL);
  -[Peripheral dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12searchpartyd10Peripheral_lastSeen;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002214C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_connectionPromise),  *(void *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_connectionPromise]);
  sub_10002214C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_disconnectionPromise),  *(void *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_disconnectionPromise]);
  sub_10002214C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_servicesPromise),  *(void *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_servicesPromise]);
  sub_10002214C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_sendDataPromise),  *(void *)&self->underlyingObject[OBJC_IVAR____TtC12searchpartyd10Peripheral_sendDataPromise]);
  sub_100015794((uint64_t)self + OBJC_IVAR____TtC12searchpartyd10Peripheral_findMyIdentifier, &qword_10099D8A0);
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_1004A2440();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC12searchpartyd10Peripheral)init
{
  result = (_TtC12searchpartyd10Peripheral *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.Peripheral",  23LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1004A3F94(v6, (uint64_t)a4);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1004A74FC(v9);
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1004A7E8C(v4);
}

@end