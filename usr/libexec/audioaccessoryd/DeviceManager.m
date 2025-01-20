@interface DeviceManager
+ (_TtC15audioaccessoryd13DeviceManager)singleton;
- (OS_dispatch_queue)clientQueue;
- (_TtC15audioaccessoryd13DeviceManager)init;
- (_TtP15audioaccessoryd14DeviceManaging_)deviceDelegate;
- (_TtP15audioaccessoryd16HMDeviceManaging_)hmDeviceDelegate;
- (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_)aaDeviceDelegate;
- (id)cloudAccountInfo;
- (id)createSoundProfileRecordStagingURL;
- (id)fetchAADeviceRecordSyncWithAddress:(id)a3;
- (id)fetchAAProxCardsInfoSyncWithAddress:(id)a3;
- (id)fetchDeviceSyncWithAddress:(id)a3;
- (id)fetchHMDeviceCloudRecordSyncWithAddress:(id)a3;
- (id)printDebug;
- (void)addAccountMagicKeysWithCloudRecord:(id)a3;
- (void)addDeviceMagicSettingsWithRecord:(id)a3 completion:(id)a4;
- (void)addDeviceSupportInformationWithRecord:(id)a3 completion:(id)a4;
- (void)addDeviceWithRecord:(id)a3 completion:(id)a4;
- (void)addLegacyMagicPairingRecordsWithCloudRecord:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)addSoundProfileRecordWithURL:(id)a3 completion:(id)a4;
- (void)deactivate;
- (void)dealloc;
- (void)deleteAccountMagicKeys;
- (void)deleteLegacyMagicPairingRecordsWithUserInitiated:(BOOL)a3 completion:(id)a4;
- (void)deviceConnectedWithAddress:(id)a3;
- (void)deviceDisconnectedWithAddress:(id)a3;
- (void)fetchAADeviceRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchAAProxCardsInfoWithAddress:(id)a3 completion:(id)a4;
- (void)fetchAccountMagicKeysBlobWithCompletion:(id)a3;
- (void)fetchCached;
- (void)fetchDeviceRecordsWithCompletion:(id)a3;
- (void)fetchDeviceSupportInformationRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchDeviceSupportInformationRecordsWithCompletion:(id)a3;
- (void)fetchDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)fetchHMDeviceCloudRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchLegacyMagicPairingRecordsWithCompletion:(id)a3;
- (void)fetchMagicPairingSettingsRecordsWithCompletion:(id)a3;
- (void)fetchMagicSettingsRecordWithAddress:(id)a3 completion:(id)a4;
- (void)fetchSoundProfileRecordFromCloudWithCompletion:(id)a3;
- (void)fetchSoundProfileRecordWithCompletion:(id)a3;
- (void)removeAADeviceRecordWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeAAProxCardsInfoWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceMagicSettingsWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceSupportInformationWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeDeviceWithRecord:(id)a3 completion:(id)a4;
- (void)removeHMDeviceCloudRecordWithBluetoothAddress:(id)a3 completion:(id)a4;
- (void)removeSoundProfileRecordWithCompletion:(id)a3;
- (void)resetCachedDataWithCompletion:(id)a3;
- (void)resetCloudDataWithCompletion:(id)a3;
- (void)setAaDeviceDelegate:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setHmDeviceDelegate:(id)a3;
- (void)updateAADeviceRecordWithRecord:(id)a3 completion:(id)a4;
- (void)updateAAProxCardsInfoWithProxCardsInfo:(id)a3 completion:(id)a4;
- (void)updateDeviceMagicSettingsWithMagicPairingSettings:(id)a3 completion:(id)a4;
- (void)updateDeviceSupportInformationWithDevice:(id)a3 completion:(id)a4;
- (void)updateDeviceWithRecord:(id)a3 completion:(id)a4;
- (void)updateHMDeviceCloudRecordInfoWithRecordInfo:(id)a3 completion:(id)a4;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation DeviceManager

- (void)fetchAADeviceRecordWithAddress:(id)a3 completion:(id)a4
{
}

- (id)fetchAADeviceRecordSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_10009B668(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)removeAADeviceRecordWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)updateAADeviceRecordWithRecord:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10009E3D0((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

+ (_TtC15audioaccessoryd13DeviceManager)singleton
{
  if (qword_100234B60 != -1) {
    swift_once(&qword_100234B60, sub_1000AE2A4);
  }
  return (_TtC15audioaccessoryd13DeviceManager *)(id)qword_10023DD60;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue));
}

- (void)setClientQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtP15audioaccessoryd14DeviceManaging_)deviceDelegate
{
  return (_TtP15audioaccessoryd14DeviceManaging_ *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_deviceDelegate,  a2);
}

- (void)setDeviceDelegate:(id)a3
{
}

- (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_)aaDeviceDelegate
{
  return (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_ *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_aaDeviceDelegate,  a2);
}

- (void)setAaDeviceDelegate:(id)a3
{
}

- (_TtP15audioaccessoryd16HMDeviceManaging_)hmDeviceDelegate
{
  return (_TtP15audioaccessoryd16HMDeviceManaging_ *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_hmDeviceDelegate,  a2);
}

- (void)setHmDeviceDelegate:(id)a3
{
}

- (_TtC15audioaccessoryd13DeviceManager)init
{
  return (_TtC15audioaccessoryd13DeviceManager *)sub_1000AE868();
}

- (void)dealloc
{
  v2 = self;
  uint64_t v3 = static os_log_type_t.default.getter(v2);
  if (qword_100234C20 != -1) {
    swift_once(&qword_100234C20, sub_10018A978);
  }
  os_log(_:dso:log:_:_:)( v3,  &_mh_execute_header,  qword_10023DFC0,  "DeviceManager deinit",  20LL,  2LL,  _swiftEmptyArrayStorage);
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for DeviceManager();
  -[DeviceManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_firstUnlockStateWatcher));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_secondaryDeviceStoreMap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_connectedDevices));
  swift_bridgeObjectRelease(*(void *)&self->pushService[OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_primaryDSID]);
  swift_bridgeObjectRelease(*(void *)&self->pushService[OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_currentUserDSID]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager____lazy_storage___deviceStore));
  sub_1000C9F88((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_deviceDelegate);
  sub_1000C9F88((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_aaDeviceDelegate);
  sub_1000C9F88((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_hmDeviceDelegate);
}

- (void)deactivate
{
  v2 = self;
  sub_1000AF9AC();
}

- (void)fetchCached
{
  v2 = self;
  sub_1000B0374();
}

- (void)fetchDeviceRecordsWithCompletion:(id)a3
{
}

- (void)fetchDeviceWithAddress:(id)a3 completion:(id)a4
{
}

- (id)fetchDeviceSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  id v7 = self;
  v8 = (void *)sub_1000B25A4(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)addAccountMagicKeysWithCloudRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000B2CA4(v4);
}

- (void)deleteAccountMagicKeys
{
  v2 = self;
  sub_1000B2FA0();
}

- (void)fetchAccountMagicKeysBlobWithCompletion:(id)a3
{
}

- (void)addDeviceWithRecord:(id)a3 completion:(id)a4
{
}

- (void)updateDeviceWithRecord:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceWithRecord:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)fetchDeviceSupportInformationRecordsWithCompletion:(id)a3
{
}

- (void)fetchDeviceSupportInformationRecordWithAddress:(id)a3 completion:(id)a4
{
}

- (void)addDeviceSupportInformationWithRecord:(id)a3 completion:(id)a4
{
}

- (void)updateDeviceSupportInformationWithDevice:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceSupportInformationWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)addLegacyMagicPairingRecordsWithCloudRecord:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_10020C408, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  v11 = self;
  sub_1000BB38C(v10, a4, (uint64_t)sub_1000CA2B8, v9);

  swift_release(v9);
}

- (void)deleteLegacyMagicPairingRecordsWithUserInitiated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10020C3E0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_1000BB73C(a3, (uint64_t)sub_1000CA2B8, v7);

  swift_release(v7);
}

- (void)fetchLegacyMagicPairingRecordsWithCompletion:(id)a3
{
}

- (void)fetchMagicPairingSettingsRecordsWithCompletion:(id)a3
{
}

- (void)fetchMagicSettingsRecordWithAddress:(id)a3 completion:(id)a4
{
}

- (void)addDeviceMagicSettingsWithRecord:(id)a3 completion:(id)a4
{
}

- (void)updateDeviceMagicSettingsWithMagicPairingSettings:(id)a3 completion:(id)a4
{
}

- (void)removeDeviceMagicSettingsWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (id)createSoundProfileRecordStagingURL
{
  uint64_t v3 = type metadata accessor for URL(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = self;
  sub_1000BFD9C((uint64_t)v6);

  URL._bridgeToObjectiveC()(v8);
  id v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v10;
}

- (void)addSoundProfileRecordWithURL:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = swift_allocObject(&unk_10020C2C8, 24LL, 7LL);
  *(void *)(v12 + 16) = v11;
  v13 = self;
  sub_1000C008C((uint64_t)v10, (uint64_t)sub_1000CA2B8, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
}

- (void)fetchSoundProfileRecordFromCloudWithCompletion:(id)a3
{
}

- (void)removeSoundProfileRecordWithCompletion:(id)a3
{
}

- (void)deviceConnectedWithAddress:(id)a3
{
}

- (void)deviceDisconnectedWithAddress:(id)a3
{
}

- (void)resetCachedDataWithCompletion:(id)a3
{
}

- (void)resetCloudDataWithCompletion:(id)a3
{
}

- (id)cloudAccountInfo
{
  v2 = self;
  uint64_t v3 = sub_1000C45A8();

  return v3;
}

- (id)printDebug
{
  v2 = self;
  sub_1000C47AC();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_1000C73D0(v4);
}

- (void)fetchAAProxCardsInfoWithAddress:(id)a3 completion:(id)a4
{
}

- (id)fetchAAProxCardsInfoSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_10011C684(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)removeAAProxCardsInfoWithBluetoothAddress:(id)a3 completion:(id)a4
{
}

- (void)updateAAProxCardsInfoWithProxCardsInfo:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_10009E3D0((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)fetchHMDeviceCloudRecordWithAddress:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_10020F7E8, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  v11 = self;
  sub_10011EE70( v7,  v9,  (uint64_t)sub_10009E9A4,  v10,  (uint64_t)&unk_10020F810,  (uint64_t)sub_1001202AC,  (uint64_t)&unk_10020F828);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (id)fetchHMDeviceCloudRecordSyncWithAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_10011EB8C(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)removeHMDeviceCloudRecordWithBluetoothAddress:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_10020F6F8, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  v11 = self;
  sub_10011EE70( v7,  v9,  (uint64_t)sub_1000CA2B8,  v10,  (uint64_t)&unk_10020F720,  (uint64_t)sub_100120114,  (uint64_t)&unk_10020F738);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)updateHMDeviceCloudRecordInfoWithRecordInfo:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_10020F658, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10011F2E4(v8, (uint64_t)sub_10009E828, v7);

  swift_release(v7);
}

@end