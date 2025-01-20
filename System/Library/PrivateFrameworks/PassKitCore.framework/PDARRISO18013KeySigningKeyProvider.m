@interface PDARRISO18013KeySigningKeyProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd34PDARRISO18013KeySigningKeyProvider)init;
- (_TtC5passd34PDARRISO18013KeySigningKeyProvider)initWithIso18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013KeySigningKeyProvider

- (_TtC5passd34PDARRISO18013KeySigningKeyProvider)initWithIso18013Manager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd34PDARRISO18013KeySigningKeyProvider_iso18013Manager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return -[PDARRISO18013KeySigningKeyProvider init](&v8, "init");
}

- (_TtC5passd34PDARRISO18013KeySigningKeyProvider)init
{
  result = (_TtC5passd34PDARRISO18013KeySigningKeyProvider *)_swift_stdlib_reportUnimplementedInitializer( "passd.PDARRISO18013KeySigningKeyProvider",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd34PDARRISO18013KeySigningKeyProvider_iso18013Manager));
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  v9 = (void (*)(void *, void, void, void))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 0LL, 0LL, 0LL);
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
  v9 = (void (*)(void *, uint64_t))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 1LL);
  _Block_release(v8);
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
  uint64_t v7 = sub_100417EC8(&qword_100706DC0);
  uint64_t v8 = swift_allocObject(v7, 40LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_1004D7DD0;
  id v9 = objc_allocWithZone((Class)&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  id v13 = [v9 initWithSignatureType:12];
  *(void *)(v8 + 32) = v13;
  specialized Array._endMutation()(v13);

  sub_10043DE30();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

@end