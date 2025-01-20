@interface InteractiveLegacyProfilesAdapter
- (_TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter)init;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation InteractiveLegacyProfilesAdapter

- (_TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter)init
{
  return (_TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter *)InteractiveLegacyProfilesAdapter.init()();
}

- (id)configurationClasses
{
  uint64_t v2 = sub_100003770(&qword_1000109C0);
  uint64_t v3 = swift_allocObject(v2, 40LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_100009D20;
  *(void *)(v3 + 32) = sub_100008BEC( 0LL,  &qword_1000109C8,  &OBJC_CLASS___RMModelLegacyInteractiveProfileDeclaration_ptr);
  sub_100003770(&qword_100010B80);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_10000C778, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_10000C7A0, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100010B68;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_10000C7C8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100010B70;
  v13[5] = v12;
  v14 = self;
  uint64_t v15 = sub_100005328((uint64_t)v8, (uint64_t)&unk_100010B78, (uint64_t)v13);
  swift_release(v15);
}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject(&unk_10000C700, 48LL, 7LL);
  *(_BYTE *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_10000C728, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100010B48;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject(&unk_10000C750, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100010B50;
  v15[5] = v14;
  uint64_t v16 = self;
  uint64_t v17 = sub_100005328((uint64_t)v10, (uint64_t)&unk_100010B58, (uint64_t)v15);
  swift_release(v17);
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_10000C688, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  uint64_t v12 = (void *)swift_allocObject(&unk_10000C6B0, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100010B18;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject(&unk_10000C6D8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100010B20;
  v13[5] = v12;
  v14 = self;
  uint64_t v15 = sub_100005328((uint64_t)v8, (uint64_t)&unk_100010B28, (uint64_t)v13);
  swift_release(v15);
}

- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject(&unk_10000C610, 56LL, 7LL);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v12, 1LL, 1LL, v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_10000C638, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_100010AF0;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject(&unk_10000C660, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_100010AF8;
  v17[5] = v16;
  uint64_t v18 = a3;
  v19 = a4;
  v20 = self;
  uint64_t v21 = sub_100005328((uint64_t)v12, (uint64_t)&unk_100010B00, (uint64_t)v17);
  swift_release(v21);
}

- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = (void *)swift_allocObject(&unk_10000C570, 48LL, 7LL);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  v14 = (void *)swift_allocObject(&unk_10000C598, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100010AB0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject(&unk_10000C5C0, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100010AC0;
  v15[5] = v14;
  uint64_t v16 = a3;
  uint64_t v17 = self;
  uint64_t v18 = sub_100005328((uint64_t)v10, (uint64_t)&unk_100010AD0, (uint64_t)v15);
  swift_release(v18);
}

- (id)declarationKeyForConfiguration:(id)a3
{
  uint64_t v3 = *(void **)((char *)self
                + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController);
  if (v3)
  {
    id v4 = self;
    id v5 = a3;
    id v6 = v4;
    id v7 = v3;
    id v8 = [v5 store];
    id v9 = [v5 declaration];
    id v10 = [v7 declarationKeyForStore:v8 declaration:v9];

    return v10;
  }

  else
  {
    __break(1u);
  }

  return self;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey));
}

@end