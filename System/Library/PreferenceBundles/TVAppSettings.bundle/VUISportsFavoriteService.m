@interface VUISportsFavoriteService
+ (void)userConsentWithCompletionHandler:(id)a3;
- (_TtC13TVAppSettings24VUISportsFavoriteService)init;
@end

@implementation VUISportsFavoriteService

+ (void)userConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_10BF0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_10C18, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in static VUISportsFavoriteService.userConsent();
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_10C40, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  uint64_t v13 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5( (uint64_t)v7,  (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu,  (uint64_t)v12);
  swift_release(v13);
}

- (_TtC13TVAppSettings24VUISportsFavoriteService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VUISportsFavoriteService();
  return -[VUISportsFavoriteService init](&v3, "init");
}

@end