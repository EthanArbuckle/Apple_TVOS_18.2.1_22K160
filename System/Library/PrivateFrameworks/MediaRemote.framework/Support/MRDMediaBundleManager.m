@interface MRDMediaBundleManager
+ (MRDMediaBundleManager)shared;
- (BOOL)isSupported;
- (MRDMediaBundleManager)init;
- (NSDictionary)bundles;
- (id)cachedEligibilityOf:(id)a3;
- (void)queryEligibilityOf:(NSString *)a3 completionHandler:(id)a4;
- (void)queryEligibilityOfAll:(NSArray *)a3 completionHandler:(id)a4;
- (void)setBundles:(id)a3;
@end

@implementation MRDMediaBundleManager

+ (MRDMediaBundleManager)shared
{
  if (qword_100400DF0 != -1) {
    swift_once(&qword_100400DF0, sub_100222AD4);
  }
  return (MRDMediaBundleManager *)(id)qword_100405C70;
}

- (BOOL)isSupported
{
  return 1;
}

- (NSDictionary)bundles
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setBundles:(id)a3
{
  unint64_t v5 = sub_100228050();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v5,  &protocol witness table for String);
  v7 = self;
  sub_100222EEC(v6);
}

- (MRDMediaBundleManager)init
{
  return (MRDMediaBundleManager *)sub_1002233C0();
}

- (id)cachedEligibilityOf:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_10022349C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)queryEligibilityOfAll:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003AA0B0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003AA0D8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1003FB520;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003AA100, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1003FB528;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10016F5BC((uint64_t)v9, (uint64_t)&unk_1003FB530, (uint64_t)v14);
  swift_release(v17);
}

- (void)queryEligibilityOf:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100156B68(&qword_1003F86B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003AA038, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003AA060, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1003FB500;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003AA088, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1003FB508;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10016F5BC((uint64_t)v9, (uint64_t)&unk_1003FB510, (uint64_t)v14);
  swift_release(v17);
}

- (void).cxx_destruct
{
}

@end