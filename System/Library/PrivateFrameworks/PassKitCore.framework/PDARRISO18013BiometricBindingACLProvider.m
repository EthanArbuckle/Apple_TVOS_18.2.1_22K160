@interface PDARRISO18013BiometricBindingACLProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd40PDARRISO18013BiometricBindingACLProvider)init;
- (_TtC5passd40PDARRISO18013BiometricBindingACLProvider)initWithIso18013Manager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013BiometricBindingACLProvider

- (_TtC5passd40PDARRISO18013BiometricBindingACLProvider)initWithIso18013Manager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd40PDARRISO18013BiometricBindingACLProvider_iso18013Manager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return -[PDARRISO18013BiometricBindingACLProvider init](&v8, "init");
}

- (_TtC5passd40PDARRISO18013BiometricBindingACLProvider)init
{
  result = (_TtC5passd40PDARRISO18013BiometricBindingACLProvider *)_swift_stdlib_reportUnimplementedInitializer( "passd.PDARRISO18013BiometricBindingACLProvider",  46LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd40PDARRISO18013BiometricBindingACLProvider_iso18013Manager));
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

@end