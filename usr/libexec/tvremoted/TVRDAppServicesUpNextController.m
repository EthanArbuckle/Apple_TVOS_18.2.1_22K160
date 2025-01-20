@interface TVRDAppServicesUpNextController
- (TVRDAppServicesUpNextController)init;
- (void)fetchUpNextWithPaginationToken:(id)a3 playerContentId:(id)a4 completion:(id)a5;
@end

@implementation TVRDAppServicesUpNextController

- (void)fetchUpNextWithPaginationToken:(id)a3 playerContentId:(id)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = _Block_copy(a5);
  if (!a3)
  {
    uint64_t v13 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v15 = 0LL;
    goto LABEL_6;
  }

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v14;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v16;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100021308, 24LL, 7LL);
  *(void *)(v17 + 16) = v12;
  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v11, 1LL, 1LL, v18);
  v19 = (void *)swift_allocObject(&unk_100021330, 80LL, 7LL);
  v19[2] = 0LL;
  v19[3] = 0LL;
  v19[4] = v13;
  v19[5] = a3;
  v19[6] = v15;
  v19[7] = a4;
  v19[8] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString?, @unowned NSArray, @unowned NSError?) -> ();
  v19[9] = v17;
  swift_bridgeObjectRetain(a4);
  swift_retain(v17);
  v20 = self;
  swift_bridgeObjectRetain(a3);
  uint64_t v21 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5( (uint64_t)v11,  (uint64_t)&async function pointer to partial apply for closure #1 in AppServicesUpNextController.fetchUpNextWithPaginationToken(_:playerContentId:completion:),  (uint64_t)v19);

  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a4);
  swift_release(v17);
  swift_release(v21);
}

- (TVRDAppServicesUpNextController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppServicesUpNextController();
  return -[TVRDAppServicesUpNextController init](&v3, "init");
}

@end