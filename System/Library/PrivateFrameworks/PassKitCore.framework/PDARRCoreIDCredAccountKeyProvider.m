@interface PDARRCoreIDCredAccountKeyProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)init;
- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)initWithIso18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRCoreIDCredAccountKeyProvider

- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)initWithIso18013Manager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd33PDARRCoreIDCredAccountKeyProvider_iso18013Manager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return -[PDARRCoreIDCredAccountKeyProvider init](&v8, "init");
}

- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)init
{
  result = (_TtC5passd33PDARRCoreIDCredAccountKeyProvider *)_swift_stdlib_reportUnimplementedInitializer( "passd.PDARRCoreIDCredAccountKeyProvider",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd33PDARRCoreIDCredAccountKeyProvider_iso18013Manager));
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void (*)(void *, void))v12[2];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  v13(v12, 0LL);
  _Block_release(v12);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10043D08C(v10, (uint64_t)v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  id v9 = (void (*)(void *, void, void))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 0LL, 0LL);
  _Block_release(v8);
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  uint64_t v7 = sub_100417EC8(&qword_100706DC0);
  uint64_t v8 = swift_allocObject(v7, 48LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_1004D82D0;
  id v9 = objc_allocWithZone((Class)&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  *(void *)(v8 + 32) = [v9 initWithSignatureType:5];
  id v13 = [objc_allocWithZone((Class)PDAuxiliaryRegistrationRequirementReference) initWithDecryptionType:1];
  *(void *)(v8 + 40) = v13;
  specialized Array._endMutation()(v13);

  sub_100424A90(0LL, (unint64_t *)&qword_100706FC8, &off_100634D48);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

@end