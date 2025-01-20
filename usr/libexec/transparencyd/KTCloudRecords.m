@interface KTCloudRecords
- (BOOL)addDevice:(id)a3 clientData:(id)a4 error:(id *)a5;
- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7;
- (BOOL)clearOptInStateForURI:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)cloudDeviceNeedUpdateWithPushToken:(id)a3 tbsRegistrationData:(id)a4;
- (BOOL)disableKTSyncabledKVSStore;
- (BOOL)enforceCKOptInRecords;
- (BOOL)havePendingRecords;
- (BOOL)removeDevice:(id)a3 clientData:(id)a4 error:(id *)a5;
- (BOOL)setOptInStateWithURIs:(id)a3 application:(id)a4 state:(BOOL)a5 error:(id *)a6;
- (BOOL)updatedRecordWithCkrecord:(id)a3;
- (_TtC13transparencyd14KTCloudRecords)init;
- (_TtC13transparencyd14KTCloudRecords)initWithContext:(id)a3 zone:(id)a4 database:(id)a5 hostInfo:(id)a6 delegate:(id)a7;
- (id)cloudDevices;
- (id)cloudKTDevices;
- (id)cloudKitZones;
- (id)deleteOptInIntentForApplication:(id)a3 error:(id *)a4;
- (id)deletedRecords;
- (id)evaluateKTLogData:(id)a3 application:(id)a4 error:(id *)a5;
- (id)fetchSyncedLoggableDataWithPushToken:(id)a3 tbsRegistrationData:(id)a4;
- (id)getAggregateOptInStateForApplication:(id)a3 error:(id *)a4;
- (id)getAllOptInStatesAndReturnError:(id *)a3;
- (id)getOptInStateWithUri:(id)a3 application:(id)a4 error:(id *)a5;
- (id)pendingRecords;
- (id)storeOptInForApplication:(id)a3 uris:(id)a4 state:(BOOL)a5 error:(id *)a6;
- (id)storeOptInIntentForApplication:(id)a3 state:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6;
- (id)sysdiagnose;
- (id)updateCloudRecordsOperation:(id)a3 context:(id)a4;
- (void)clearDataStore:(BOOL)a3;
- (void)clearLocalCloudState;
- (void)deleteRecordIDWithCkrecordID:(id)a3;
- (void)deleteRecordWithCkrecord:(id)a3;
- (void)recordUpdateCloudStateWithType:(id)a3 records:(id)a4 newState:(id)a5;
- (void)updateSelfCloudDeviceWithPushToken:(id)a3 tbsRegistrationData:(id)a4 applications:(id)a5;
@end

@implementation KTCloudRecords

- (_TtC13transparencyd14KTCloudRecords)initWithContext:(id)a3 zone:(id)a4 database:(id)a5 hostInfo:(id)a6 delegate:(id)a7
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  id v14 = a3;
  id v15 = a5;
  swift_unknownObjectRetain(a6);
  swift_unknownObjectRetain(a7);
  return (_TtC13transparencyd14KTCloudRecords *)KTCloudRecords.init(context:zone:database:hostInfo:delegate:)( v14,  v11,  v13,  v15,  (uint64_t)a6,  (uint64_t)a7);
}

- (BOOL)disableKTSyncabledKVSStore
{
  v6[3] = &type metadata for TransparencyFeatureFlags;
  v6[4] = sub_1000B09BC();
  LOBYTE(v6[0]) = 0;
  v3 = self;
  char v4 = isFeatureEnabled(_:)(v6);
  sub_10007EAFC(v6);

  return v4 & 1;
}

- (id)sysdiagnose
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                           + 280LL);
  v3 = self;
  uint64_t v4 = v2();
  uint64_t v5 = sub_100072CC4(&qword_1002E11D8);
  uint64_t inited = swift_initStackObject(v5, &v10);
  *(_OWORD *)(inited + 16) = xmmword_1002464F0;
  *(void *)(inited + 32) = 0x6E4974706FLL;
  *(void *)(inited + 40) = 0xE500000000000000LL;
  *(void *)(inited + 72) = sub_100072CC4(&qword_1002E11E0);
  *(void *)(inited + 48) = v4;
  unint64_t v7 = sub_1000AFFF4(inited);

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

- (void)updateSelfCloudDeviceWithPushToken:(id)a3 tbsRegistrationData:(id)a4 applications:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19 = self;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v14 = v13;

  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v17 = v16;

  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for String);
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t))(**(void **)((char *)&v19->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                                        + 248LL))( v12,  v14,  v15,  v17,  v18);
  swift_bridgeObjectRelease(v18);
  sub_100072BE0(v15, v17);
  sub_100072BE0(v12, v14);
}

- (BOOL)cloudDeviceNeedUpdateWithPushToken:(id)a3 tbsRegistrationData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  unint64_t v15 = v14;

  uint64_t v16 = *(uint64_t *)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice);
  unint64_t v17 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_hostInfo);
  if (v17)
  {
    id v18 = [v17 osVersion];
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    uint64_t v21 = v20;
  }

  else
  {
    uint64_t v19 = 0LL;
    uint64_t v21 = 0LL;
  }

  char v22 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)v16 + 256LL))( v10,  v12,  v13,  v15,  v19,  v21);
  swift_bridgeObjectRelease(v21);
  sub_100072BE0(v13, v15);
  sub_100072BE0(v10, v12);

  return v22 & 1;
}

- (id)fetchSyncedLoggableDataWithPushToken:(id)a3 tbsRegistrationData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  unint64_t v15 = v14;

  uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(void **)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                                                + 264LL))( v10,  v12,  v13,  v15);
  sub_100072BE0(v13, v15);
  sub_100072BE0(v10, v12);

  return v16;
}

- (id)cloudKTDevices
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                           + 272LL);
  v3 = self;
  uint64_t v4 = v2();

  sub_10007D178(0LL, &qword_1002E1260, &OBJC_CLASS___KTLoggableData_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (id)cloudDevices
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                           + 280LL);
  v3 = self;
  uint64_t v4 = v2();

  sub_10007D178(0LL, &qword_1002E1320, &OBJC_CLASS___TransparencyCloudDevice_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (BOOL)addDevice:(id)a3 clientData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  unint64_t v16 = v15;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(void **)((char *)&v10->super.isa
                                                                                             + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                               + 288LL))( v11,  v13,  v14,  v16);

  sub_100072BE0(v14, v16);
  sub_100072BE0(v11, v13);
  return 1;
}

- (BOOL)removeDevice:(id)a3 clientData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  unint64_t v16 = v15;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(void **)((char *)&v10->super.isa
                                                                                             + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                               + 296LL))( v11,  v13,  v14,  v16);

  sub_100072BE0(v14, v16);
  sub_100072BE0(v11, v13);
  return 1;
}

- (BOOL)setOptInStateWithURIs:(id)a3 application:(id)a4 state:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v10,  &protocol witness table for String);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, BOOL))(**(void **)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                 + 352LL);
  unint64_t v16 = self;
  v15(v11, v12, v14, v6);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);

  return 1;
}

- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7
{
  v24[1] = a7;
  BOOL v25 = a6;
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v17 = v16;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, BOOL))(**(void **)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                                  + 360LL);
  char v22 = self;
  v21(v15, v17, v14, v18, v20, v25);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);

  return 1;
}

- (id)getOptInStateWithUri:(id)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                     + 248LL);
  uint64_t v15 = self;
  uint64_t v16 = v14(v8, v10, v11, v13);
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    unint64_t v18 = sub_1000B167C();
    uint64_t v19 = swift_allocError(&type metadata for KTCloudRecordsError, v18, 0LL, 0LL);
    swift_willThrow(v19);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v13);

    if (a5)
    {
      uint64_t v20 = (void *)_convertErrorToNSError(_:)(v19);
      swift_errorRelease(v19);
      id v21 = v20;
      uint64_t v17 = 0LL;
      *a5 = v20;
    }

    else
    {
      swift_errorRelease(v19);
      uint64_t v17 = 0LL;
    }
  }

  return v17;
}

- (id)getAggregateOptInStateForApplication:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                  + 264LL);
  uint64_t v10 = self;
  uint64_t v11 = v9(v6, v8);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    uint64_t v13 = type metadata accessor for KTError(0LL);
    uint64_t v14 = sub_100073FE0( (unint64_t *)&qword_1002E0F10,  type metadata accessor for KTError,  (uint64_t)&unk_100249B0C);
    uint64_t v15 = swift_allocError(v13, v14, 0LL, 0LL);
    uint64_t v17 = swift_storeEnumTagMultiPayload(v16, v13, 10LL);
    swift_willThrow(v17);
    swift_bridgeObjectRelease(v8);

    if (a4)
    {
      unint64_t v18 = (void *)_convertErrorToNSError(_:)(v15);
      swift_errorRelease(v15);
      id v19 = v18;
      uint64_t v12 = 0LL;
      *a4 = v18;
    }

    else
    {
      swift_errorRelease(v15);
      uint64_t v12 = 0LL;
    }
  }

  return v12;
}

- (id)getAllOptInStatesAndReturnError:(id *)a3
{
  v3 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                           + 272LL);
  uint64_t v4 = self;
  uint64_t v5 = v3();

  sub_10007D178(0LL, (unint64_t *)&qword_1002E1220, &OBJC_CLASS___KTOptInState_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (BOOL)clearOptInStateForURI:(id)a3 application:(id)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                  + 288LL);
  uint64_t v14 = self;
  v13(v7, v9, v10, v12);
  swift_bridgeObjectRelease(v12);

  swift_bridgeObjectRelease(v9);
  return 1;
}

- (id)storeOptInIntentForApplication:(id)a3 state:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, BOOL))(**(void **)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                   + 328LL);
  uint64_t v13 = self;
  uint64_t v14 = (void *)v12(v9, v11, v7, v6);
  swift_bridgeObjectRelease(v11);

  return v14;
}

- (id)deleteOptInIntentForApplication:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  uint64_t v9 = self;
  uint64_t v10 = (void *)v8(v5, v7, v9);
  swift_bridgeObjectRelease(v7);

  return v10;
}

- (id)storeOptInForApplication:(id)a3 uris:(id)a4 state:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  v12,  &protocol witness table for String);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, BOOL, _TtC13transparencyd14KTCloudRecords *))(**(void **)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn) + 344LL);
  uint64_t v15 = self;
  uint64_t v16 = (void *)v14(v9, v11, v13, v6, v15);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v13);

  return v16;
}

- (void)clearDataStore:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *(void (**)(BOOL))(**(void **)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                     + 456LL);
  uint64_t v5 = self;
  v4(v3);
  (*(void (**)(BOOL))(**(void **)((char *)&v5->super.isa
                                               + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                 + 392LL))(v3);
}

- (void)clearLocalCloudState
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  BOOL v3 = self;
  v2(0LL);
  type metadata accessor for KTCKZone();
  uint64_t v4 = sub_100078588((uint64_t)objc_retain(*(id *)((char *)&v3->super.isa
                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_context)));
  id v5 =  [*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_zoneID) zoneName];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v8 = v7;

  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 128LL))(v6, v8);
  swift_release(v4);
  swift_bridgeObjectRelease(v8);
}

- (BOOL)havePendingRecords
{
  v2 = self;
  Swift::Bool v3 = KTCloudRecords.havePendingRecords()();

  return v3;
}

- (id)pendingRecords
{
  return sub_1000B3424( (char *)self,  (uint64_t)a2,  (uint64_t (*)(void *, uint64_t, __n128))sub_1000B23E0,  &qword_1002E16D0,  &OBJC_CLASS___CKRecord_ptr);
}

- (id)deletedRecords
{
  return sub_1000B3424( (char *)self,  (uint64_t)a2,  (uint64_t (*)(void *, uint64_t, __n128))sub_1000B25DC,  (unint64_t *)&unk_1002E0450,  &OBJC_CLASS___CKRecordID_ptr);
}

- (id)cloudKitZones
{
  uint64_t v3 = sub_100072CC4(&qword_1002E0AE0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1002487A0;
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_zoneID);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()(v4);
  sub_10007D178(0LL, &qword_1002DF680, &OBJC_CLASS___CKRecordZoneID_ptr);
  id v6 = v5;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)updatedRecordWithCkrecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = KTCloudRecords.updatedRecord(withCkrecord:)((CKRecord)v4);

  return self & 1;
}

- (void)deleteRecordWithCkrecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  KTCloudRecords.deleteRecord(withCkrecord:)((CKRecord)v4);
}

- (void)deleteRecordIDWithCkrecordID:(id)a3
{
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_types);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_types, v10, 0LL, 0LL);
  uint64_t v6 = *v5;
  id v7 = a3;
  uint64_t v8 = self;
  swift_bridgeObjectRetain(v6);
  sub_1000B7DC0(v9, (void (*)(uint64_t, uint64_t, _BYTE *, __n128))sub_1000B60D8);

  swift_bridgeObjectRelease(v6);
}

- (void)recordUpdateCloudStateWithType:(id)a3 records:(id)a4 newState:(id)a5
{
  void (*v16)(__int128 *__return_ptr, uint64_t, uint64_t);
  _TtC13transparencyd14KTCloudRecords *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = sub_10007D178(0LL, (unint64_t *)&unk_1002E0450, &OBJC_CLASS___CKRecordID_ptr);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v15 = v14;
  uint64_t v17 = self;
  v16(&v20, v8, v10);
  if (v21)
  {
    sub_100085C90(&v20, (uint64_t)v22);
    unint64_t v18 = v23;
    id v19 = v24;
    sub_100084C04(v22, v23);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 64))(v12, v13, v15, v18, v19);
    sub_10007EAFC(v22);
  }

  else
  {
    sub_100077CFC((uint64_t)&v20, &qword_1002E1208);
  }

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
}

- (id)updateCloudRecordsOperation:(id)a3 context:(id)a4
{
  return  KTUpdateCloudStorageOperation.__allocating_init(deps:source:context:)( (uint64_t)a3,  (uint64_t)self,  (uint64_t)a4);
}

- (id)evaluateKTLogData:(id)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v8 = sub_100072CC4(&qword_1002E1228);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v8,  &protocol witness table for String);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  uint64_t v13 = self;
  uint64_t v14 = KTCloudRecords.evaluateKTLogData(_:application:)(v9, v10, v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return v14;
}

- (BOOL)enforceCKOptInRecords
{
  v6[3] = &type metadata for TransparencyFeatureFlags;
  v6[4] = sub_1000B09BC();
  LOBYTE(v6[0]) = 1;
  uint64_t v3 = self;
  char v4 = isFeatureEnabled(_:)(v6);
  sub_10007EAFC(v6);

  return (v4 & 1) == 0;
}

- (_TtC13transparencyd14KTCloudRecords)init
{
  result = (_TtC13transparencyd14KTCloudRecords *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTCloudRecords",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_hostInfo));
  sub_100090218((uint64_t)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_delegate);
}

@end