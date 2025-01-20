@interface AKDeviceListStoreManager
+ (AKDeviceListStoreManager)sharedManager;
- (AKDeviceListStoreManager)init;
- (void)clearDatabaseWithCompletionHandler:(id)a3;
- (void)clearStaleDevicesWithAccountManager:(AKAccountManager *)a3 completionHandler:(id)a4;
- (void)deleteDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4;
- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 cdpFactory:(AKCDPFactory *)a4 serviceController:(AKServiceControllerImpl *)a5 accountManager:(AKAccountManager *)a6 completionHandler:(id)a7;
- (void)updateCacheWithContext:(AKDeviceListRequestContext *)a3 deviceListResponse:(AKDeviceListResponse *)a4 completionHandler:(id)a5;
- (void)verifyCacheSyncStatusFromResponse:(AKDeviceListResponse *)a3 context:(AKDeviceListRequestContext *)a4 accountManager:(AKAccountManager *)a5 reporter:(AAFAnalyticsReporter *)a6 completionHandler:(id)a7;
@end

@implementation AKDeviceListStoreManager

+ (AKDeviceListStoreManager)sharedManager
{
  if (qword_10020CFA8 != -1) {
    swift_once(&qword_10020CFA8, sub_1000F5364);
  }
  return (AKDeviceListStoreManager *)(id)qword_100211020;
}

- (void)clearDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CCB90, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1001CCBB8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020EDD0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1001CCBE0, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020EDD8;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020EDE0, (uint64_t)v12);
  swift_release(v14);
}

- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 cdpFactory:(AKCDPFactory *)a4 serviceController:(AKServiceControllerImpl *)a5 accountManager:(AKAccountManager *)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject(&unk_1001CCB18, 64LL, 7LL);
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v15, 1LL, 1LL, v18);
  v19 = (void *)swift_allocObject(&unk_1001CCB40, 48LL, 7LL);
  v19[2] = 0LL;
  v19[3] = 0LL;
  v19[4] = &unk_10020EDB0;
  v19[5] = v17;
  v20 = (void *)swift_allocObject(&unk_1001CCB68, 48LL, 7LL);
  v20[2] = 0LL;
  v20[3] = 0LL;
  v20[4] = &unk_10020EDB8;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  uint64_t v26 = sub_100100A60((uint64_t)v15, (uint64_t)&unk_10020EDC0, (uint64_t)v20);
  swift_release(v26);
}

- (void)deleteDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1001CCAA0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1001CCAC8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020ED90;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCAF0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020ED98;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020EDA0, (uint64_t)v14);
  swift_release(v17);
}

- (void)clearStaleDevicesWithAccountManager:(AKAccountManager *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1001CCA28, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1001CCA50, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020ED70;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCA78, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020ED78;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020ED80, (uint64_t)v14);
  swift_release(v17);
}

- (void)verifyCacheSyncStatusFromResponse:(AKDeviceListResponse *)a3 context:(AKDeviceListRequestContext *)a4 accountManager:(AKAccountManager *)a5 reporter:(AAFAnalyticsReporter *)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject(&unk_1001CC9B0, 64LL, 7LL);
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v15, 1LL, 1LL, v18);
  v19 = (void *)swift_allocObject(&unk_1001CC9D8, 48LL, 7LL);
  v19[2] = 0LL;
  v19[3] = 0LL;
  v19[4] = &unk_10020ED58;
  v19[5] = v17;
  v20 = (void *)swift_allocObject(&unk_1001CCA00, 48LL, 7LL);
  v20[2] = 0LL;
  v20[3] = 0LL;
  v20[4] = &unk_10020ED60;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  uint64_t v26 = sub_100100A60((uint64_t)v15, (uint64_t)&unk_10020EF80, (uint64_t)v20);
  swift_release(v26);
}

- (void)updateCacheWithContext:(AKDeviceListRequestContext *)a3 deviceListResponse:(AKDeviceListResponse *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject(&unk_1001CC938, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_1001CC960, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10020ED48;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1001CC988, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10020D190;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  uint64_t v20 = sub_100100A60((uint64_t)v11, (uint64_t)&unk_10020D470, (uint64_t)v16);
  swift_release(v20);
}

- (AKDeviceListStoreManager)init
{
  result = (AKDeviceListStoreManager *)_swift_stdlib_reportUnimplementedInitializer( "akd.DeviceListStoreManager",  26LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end