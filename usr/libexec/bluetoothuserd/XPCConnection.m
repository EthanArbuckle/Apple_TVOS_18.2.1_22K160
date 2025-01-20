@interface XPCConnection
- (_TtC14bluetoothuserd13XPCConnection)init;
- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3;
- (void)deleteControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4;
- (void)diagnosticShow:(NSDictionary *)a3 completion:(id)a4;
- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3;
- (void)getControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4;
- (void)getCurrentUserGivenNameWithCompletion:(id)a3;
- (void)getDistributedLoggingStatusWithCompletion:(id)a3;
- (void)readPrefKeys:(NSArray *)a3 source:(unsigned int)a4 completion:(id)a5;
- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6;
- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4;
- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4;
- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4;
- (void)storeControllerInfo:(CBControllerInfo *)a3 completion:(id)a4;
- (void)writePrefKey:(NSString *)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6;
@end

@implementation XPCConnection

- (_TtC14bluetoothuserd13XPCConnection)init
{
  result = (_TtC14bluetoothuserd13XPCConnection *)_swift_stdlib_reportUnimplementedInitializer( "bluetoothuserd.XPCConnection",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)diagnosticShow:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100074258, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100074280, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10007BFD0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1000742A8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10007BFD8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10004DED0((uint64_t)v9, (uint64_t)&unk_10007BFE0, (uint64_t)v14);
  swift_release(v17);
}

- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000741E0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_100074208, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10007BFB0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100074230, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10007BFB8;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10004DED0((uint64_t)v7, (uint64_t)&unk_10007BFC0, (uint64_t)v12);
  swift_release(v14);
}

- (void)deleteControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100074168, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100074190, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10007BF90;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1000741B8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10007BF98;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10004DED0((uint64_t)v9, (uint64_t)&unk_10007BFA0, (uint64_t)v14);
  swift_release(v17);
}

- (void)storeControllerInfo:(CBControllerInfo *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1000740F0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100074118, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10007BF70;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100074140, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10007BF78;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10004DED0((uint64_t)v9, (uint64_t)&unk_10007BF80, (uint64_t)v14);
  swift_release(v17);
}

- (void)getControllerInfoForDevice:(CBDevice *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100074078, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1000740A0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10007BF50;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1000740C8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10007BF58;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10004DED0((uint64_t)v9, (uint64_t)&unk_10007BF60, (uint64_t)v14);
  swift_release(v17);
}

- (void)getDistributedLoggingStatusWithCompletion:(id)a3
{
  uint64_t v5 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_100074000, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_100074028, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10007BF30;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100074050, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10007BF38;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10004DED0((uint64_t)v7, (uint64_t)&unk_10007BF40, (uint64_t)v12);
  swift_release(v14);
}

- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_100073F88, 40LL, 7LL);
  *(_DWORD *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100073FB0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10007BF10;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100073FD8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10007BF18;
  v14[5] = v13;
  uint64_t v15 = self;
  uint64_t v16 = sub_10004DED0((uint64_t)v9, (uint64_t)&unk_10007BF20, (uint64_t)v14);
  swift_release(v16);
}

- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3
{
  uint64_t v5 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_100073F10, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_100073F38, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10007BEF0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100073F60, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10007BEF8;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10004DED0((uint64_t)v7, (uint64_t)&unk_10007BF00, (uint64_t)v12);
  swift_release(v14);
}

- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_100073E98, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100073EC0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10007BED0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100073EE8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10007BED8;
  v14[5] = v13;
  uint64_t v15 = self;
  uint64_t v16 = sub_10004DED0((uint64_t)v9, (uint64_t)&unk_10007BEE0, (uint64_t)v14);
  swift_release(v16);
}

- (void)getCurrentUserGivenNameWithCompletion:(id)a3
{
  v4 = (void (**)(void *, NSString, void))_Block_copy(a3);
  uint64_t v6 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  v4[2](v4, v5, 0LL);

  _Block_release(v4);
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  v13 = *(uint64_t (**)(void))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_listener))
                            + 0x70LL);
  uint64_t v14 = self;
  uint64_t v15 = v13();
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = (*(uint64_t (**)(void))(*(void *)v15 + 520LL))();
    if (v17)
    {
      uint64_t v18 = v17;
      (*(void (**)(uint64_t, uint64_t, BOOL, BOOL, uint64_t))(*(void *)v17 + 216LL))(v10, v12, v8, v7, v6);

      swift_bridgeObjectRelease(v12);
      swift_release(v16);
      uint64_t v19 = v18;
    }

    else
    {

      swift_bridgeObjectRelease(v12);
      uint64_t v19 = v16;
    }

    swift_release(v19);
  }

  else
  {

    swift_bridgeObjectRelease(v12);
  }

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v6 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC14bluetoothuserd13XPCConnection_listener) & swift_isaMask)
                           + 0x70LL);
  uint64_t v12 = self;
  uint64_t v7 = v6();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v7 + 520LL))();
    if (v9)
    {
      uint64_t v10 = v9;
      (*(void (**)(BOOL, uint64_t))(*(void *)v9 + 224LL))(v5, v4);

      swift_release(v8);
      uint64_t v11 = v10;
    }

    else
    {

      uint64_t v11 = v8;
    }

    swift_release(v11);
  }

  else
  {
  }

- (void)readPrefKeys:(NSArray *)a3 source:(unsigned int)a4 completion:(id)a5
{
  uint64_t v9 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject(&unk_100073E20, 48LL, 7LL);
  *(void *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_100073E48, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10007BEB0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject(&unk_100073E70, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10007BEB8;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = self;
  uint64_t v19 = sub_10004DED0((uint64_t)v11, (uint64_t)&unk_10007BEC0, (uint64_t)v16);
  swift_release(v19);
}

- (void)writePrefKey:(NSString *)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6
{
  uint64_t v11 = sub_100003288(&qword_10007BE60);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject(&unk_100073D80, 56LL, 7LL);
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(_DWORD *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
  uint64_t v17 = (void *)swift_allocObject(&unk_100073DA8, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_10007BE70;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject(&unk_100073DD0, 48LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_10007BE80;
  v18[5] = v17;
  uint64_t v19 = a3;
  swift_unknownObjectRetain(a4);
  uint64_t v20 = self;
  uint64_t v21 = sub_10004DED0((uint64_t)v13, (uint64_t)&unk_10007BE90, (uint64_t)v18);
  swift_release(v21);
}

@end