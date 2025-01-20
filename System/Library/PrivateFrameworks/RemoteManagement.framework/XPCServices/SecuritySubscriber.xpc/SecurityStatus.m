@interface SecurityStatus
+ (id)supportedStatusKeys;
- (_TtC18SecuritySubscriber14SecurityStatus)init;
- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5;
@end

@implementation SecurityStatus

+ (id)supportedStatusKeys
{
  uint64_t v2 = sub_100001640(&qword_100014D60);
  uint64_t inited = swift_initStackObject(v2, &v8);
  *(_OWORD *)(inited + 16) = xmmword_10000D120;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(RMModelStatusItemSecurityCertificateList);
  *(void *)(inited + 40) = v4;
  Swift::Int v5 = sub_10000AE34(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5
{
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject(&unk_100010AD0, 48LL, 7LL);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_100010AF8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100014FC8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject(&unk_100010B20, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100014CB8;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  uint64_t v19 = sub_100009490((uint64_t)v10, (uint64_t)&unk_100014CC0, (uint64_t)v15);
  swift_release(v19);
}

- (_TtC18SecuritySubscriber14SecurityStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecurityStatus();
  return -[SecurityStatus init](&v3, "init");
}

@end