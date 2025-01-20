@interface AKDeviceListRequester
- (AKDeviceListRequester)init;
- (AKDeviceListRequester)initWithStoreManager:(id)a3 cdpFactory:(id)a4 accountManager:(id)a5 client:(id)a6;
- (void)clearDeviceListCacheWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4;
- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4;
@end

@implementation AKDeviceListRequester

- (AKDeviceListRequester)initWithStoreManager:(id)a3 cdpFactory:(id)a4 accountManager:(id)a5 client:(id)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_storeManager) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_cdpFactory) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_accountManager) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_client) = (Class)a6;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for DeviceListRequester();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  return -[AKDeviceListRequester init](&v15, "init");
}

- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject(&unk_1001CC120, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  id v13 = (void *)swift_allocObject(&unk_1001CC148, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E480;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CC170, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E488;
  v14[5] = v13;
  objc_super v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E490, (uint64_t)v14);
  swift_release(v17);
}

- (void)clearDeviceListCacheWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject(&unk_1001CC0A8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  id v13 = (void *)swift_allocObject(&unk_1001CC0D0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E470;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CC0F8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020D190;
  v14[5] = v13;
  objc_super v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020D470, (uint64_t)v14);
  swift_release(v17);
}

- (AKDeviceListRequester)init
{
  result = (AKDeviceListRequester *)_swift_stdlib_reportUnimplementedInitializer( "akd.DeviceListRequester",  23LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end