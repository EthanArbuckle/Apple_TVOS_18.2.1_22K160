@interface PDARRUnifiedAccessDecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd36PDARRUnifiedAccessDecryptionProvider)init;
- (_TtC5passd36PDARRUnifiedAccessDecryptionProvider)initWithSubcredentialManager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRUnifiedAccessDecryptionProvider

- (_TtC5passd36PDARRUnifiedAccessDecryptionProvider)initWithSubcredentialManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd36PDARRUnifiedAccessDecryptionProvider_subcredentialManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return -[PDARRUnifiedAccessDecryptionProvider init](&v8, "init");
}

- (_TtC5passd36PDARRUnifiedAccessDecryptionProvider)init
{
  result = (_TtC5passd36PDARRUnifiedAccessDecryptionProvider *)_swift_stdlib_reportUnimplementedInitializer( "passd.PDARRUnifiedAccessDecryptionProvider",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd36PDARRUnifiedAccessDecryptionProvider_subcredentialManager));
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1004258D8(v10, (void (**)(void, void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
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
  id v9 = (void (*)(void *, uint64_t))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 1LL);
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
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  if ([v7 isPerformingInitialRegistration])
  {
    uint64_t v9 = sub_100417EC8(&qword_100706DC0);
    uint64_t v10 = swift_allocObject(v9, 40LL, 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_1004D7DD0;
    id v11 = [objc_allocWithZone((Class)PDAuxiliaryRegistrationRequirementReference) initWithSignatureType:1];
    *(void *)(v10 + 32) = v11;
    specialized Array._endMutation()(v11);

    sub_100424A90(0LL, (unint64_t *)&qword_100706FC8, &off_100634D48);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v10);
    return isa;
  }

  else
  {

    return 0LL;
  }

@end