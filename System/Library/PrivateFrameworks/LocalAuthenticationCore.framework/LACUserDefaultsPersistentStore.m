@interface LACUserDefaultsPersistentStore
- (_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore)init;
- (_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore)initWithSuiteName:(id)a3;
- (void)dataForKey:(NSString *)a3 completion:(id)a4;
- (void)removeObjectForKey:(NSString *)a3 completion:(id)a4;
- (void)setData:(NSData *)a3 forKey:(NSString *)a4 completion:(id)a5;
@end

@implementation LACUserDefaultsPersistentStore

- (_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore)initWithSuiteName:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  return (_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore *)LACUserDefaultsPersistentStore.init(suiteName:)( v3,  v4);
}

- (void)dataForKey:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1895F8858](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in LACUserDefaultsPersistentStore.data(forKey:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &_sIeghH_IeAgH_TRTA_35Tu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5( (uint64_t)v9,  (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_40Tu,  (uint64_t)v14);
  swift_release();
}

- (void)setData:(NSData *)a3 forKey:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1895F8858](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in LACUserDefaultsPersistentStore.setData(_:forKey:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &_sIeghH_IeAgH_TRTA_21Tu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5( (uint64_t)v11,  (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_26Tu,  (uint64_t)v16);
  swift_release();
}

- (void)removeObjectForKey:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in LACUserDefaultsPersistentStore.removeObject(forKey:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &_sIeghH_IeAgH_TRTATu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5( (uint64_t)v9,  (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu,  (uint64_t)v14);
  swift_release();
}

- (_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore)init
{
  result = (_TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end