@interface KTCloudRecordsCache
- (BOOL)disableKTSyncabledKVSStore;
- (_TtC13transparencyd19KTCloudRecordsCache)init;
- (_TtC13transparencyd19KTCloudRecordsCache)initWithRecords:(id)a3;
- (id)fetchSyncedLoggableDataByDeviceIdHash:(id)a3;
- (id)fetchSyncedLoggableDataByPushToken:(id)a3 registrationData:(id)a4;
- (void)setWithUriVRFHash:(id)a3;
@end

@implementation KTCloudRecordsCache

- (_TtC13transparencyd19KTCloudRecordsCache)initWithRecords:(id)a3
{
  v4 = (_TtC13transparencyd19KTCloudRecordsCache *)sub_1000B7F88((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (void)setWithUriVRFHash:(id)a3
{
  id v5 = a3;
  v11 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  v9 = *(void (**)(uint64_t, unint64_t))((swift_isaMask & (uint64_t)v11->super.isa) + 0x90);
  sub_100072B9C(v6, v8);
  v9(v6, v8);
  unint64_t v10 = sub_1000B0144((uint64_t)_swiftEmptyArrayStorage);
  (*(void (**)(unint64_t))((swift_isaMask & (uint64_t)v11->super.isa) + 0xA8))(v10);
  sub_100072BE0(v6, v8);
}

- (BOOL)disableKTSyncabledKVSStore
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records) disableKTSyncabledKVSStore];
}

- (id)fetchSyncedLoggableDataByPushToken:(id)a3 registrationData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  unint64_t v15 = v14;

  v16 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  Class v18 = Data._bridgeToObjectiveC()().super.isa;
  id v19 = [v16 fetchSyncedLoggableDataWithPushToken:isa tbsRegistrationData:v18];

  sub_100072BE0(v13, v15);
  sub_100072BE0(v10, v12);

  return v19;
}

- (id)fetchSyncedLoggableDataByDeviceIdHash:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;

  KTCloudRecordsCache.fetchSyncedLoggableData(byDeviceIdHash:)(v7, v9);
  uint64_t v11 = v10;
  sub_100072BE0(v7, v9);

  if (v11)
  {
    sub_10007D178(0LL, &qword_1002E1260, &OBJC_CLASS___KTLoggableData_ptr);
    v12.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v11);
  }

  else
  {
    v12.super.Class isa = 0LL;
  }

  return v12.super.isa;
}

- (_TtC13transparencyd19KTCloudRecordsCache)init
{
  result = (_TtC13transparencyd19KTCloudRecordsCache *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTCloudRecordsCache",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records));
  sub_10007EB9C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_uriVRFHash),  *(void *)&self->records[OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_uriVRFHash]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_deviceIDHash));
}

@end