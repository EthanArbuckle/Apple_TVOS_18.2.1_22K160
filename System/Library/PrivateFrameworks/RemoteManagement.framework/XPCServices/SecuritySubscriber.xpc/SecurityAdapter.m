@interface SecurityAdapter
- (_TtC18SecuritySubscriber15SecurityAdapter)init;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation SecurityAdapter

- (id)configurationClasses
{
  uint64_t v2 = sub_100001640(&qword_100014BC0);
  uint64_t v3 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_10000D1C0;
  *(void *)(v3 + 32) = sub_1000085C8(0LL, &qword_100014BC8, &OBJC_CLASS___RMModelSecurityCertificateDeclaration_ptr);
  *(void *)(v3 + 40) = sub_1000085C8(0LL, &qword_100014BD0, &OBJC_CLASS___RMModelSecurityIdentityDeclaration_ptr);
  sub_100001640(&qword_100014D40);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_1000108C0, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_1000108E8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100014D18;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_100010910, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100014D20;
  v13[5] = v12;
  v14 = self;
  uint64_t v15 = sub_100009490((uint64_t)v8, (uint64_t)&unk_100014D28, (uint64_t)v13);
  swift_release(v15);
}

- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject(&unk_100010848, 56LL, 7LL);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v12, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_100010870, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_100014CF0;
  v16[5] = v14;
  v17 = (void *)swift_allocObject(&unk_100010898, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_100014CF8;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  uint64_t v21 = sub_100009490((uint64_t)v12, (uint64_t)&unk_100014D00, (uint64_t)v17);
  swift_release(v21);
}

- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject(&unk_1000107D0, 48LL, 7LL);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_1000107F8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100014CD0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject(&unk_100010820, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100014CD8;
  v15[5] = v14;
  uint64_t v16 = a3;
  v17 = self;
  uint64_t v18 = sub_100009490((uint64_t)v10, (uint64_t)&unk_100014CE0, (uint64_t)v15);
  swift_release(v18);
}

- (id)declarationKeyForConfiguration:(id)a3
{
  v5 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
  id v6 = a3;
  uint64_t v7 = self;
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v5 newDeclarationKeyWithSubscriberIdentifier:v8 reference:v6];

  return v9;
}

- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject(&unk_100010758, 48LL, 7LL);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_100010780, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100014CB0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject(&unk_1000107A8, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100014CB8;
  v15[5] = v14;
  uint64_t v16 = a3;
  v17 = self;
  uint64_t v18 = sub_100009490((uint64_t)v10, (uint64_t)&unk_100014CC0, (uint64_t)v15);
  swift_release(v18);
}

- (_TtC18SecuritySubscriber15SecurityAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecurityAdapter();
  return -[SecurityAdapter init](&v3, "init");
}

@end